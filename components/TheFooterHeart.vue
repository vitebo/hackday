<template functional>
  <svg
    v-once
    width="300px"
    height="40px"
    aria-label="Feito com amor pela Quero Educação"
    class="z-text z-text--minor z-text--small"
  >
    <g id="all">
      <text fill="white">
        <tspan x="1" y="24">Feito com</tspan>
      </text>
      <text fill="white">
        <tspan x="99.0725" y="24">pela</tspan>
        <tspan x="132" y="24" font-weight="500">Quero Educação</tspan>
      </text>
      <line
        id="underline"
        x1="127"
        y1="30.5"
        x2="227"
        y2="30.5"
        stroke="white"
        stroke-width="1.5"
        stroke-linecap="square"
        opacity="0"
      />
      <g transform="translate(85, 20)">
        <g id="heart-position">
          <path
            id="heart"
            d="M14.2958428,2 C12.3952724,2 10.7408308,3.162878 10.0008145,4.84629823 C9.26079826,3.1645464 7.60635662,2 5.70578622,2 C3.11083934,2 1,4.16225235 1,6.81835245 C1,12.8079249 9.44172735,17.7397289 9.80195553,17.9466111 C9.86389522,17.9816475 9.93072488,18 9.99918453,18 C10.0676442,18 10.1361038,17.9816475 10.1964135,17.9466111 C10.5550117,17.7397289 19,12.8079249 19,6.81835245 C19.001629,4.16225235 16.8907897,2 14.2958428,2 Z"
            stroke="white"
            stroke-width="1.5"
            fill-opacity="0"
            fill="#DA1E28"
            fill-rule="nonzero"
            stroke-linejoin="round"
            transform="translate(-10, -10)"
          />
        </g>
      </g>
      <rect x="0" y="0" width="246" height="36" opacity="0" />
    </g>
    <animate
      xlink:href="#underline"
      attributeName="opacity"
      to="1"
      begin="all.mouseover"
      dur="80ms"
      repeatCount="1"
      fill="freeze"
    />
    <animate
      xlink:href="#underline"
      attributeName="opacity"
      to="0"
      begin="all.mouseout"
      dur="80ms"
      repeatCount="1"
      fill="freeze"
    />
    <animate
      xlink:href="#heart"
      attributeName="stroke"
      to="#DA1E28"
      begin="all.mouseover"
      dur="80ms"
      repeatCount="1"
      fill="freeze"
    />
    <animate
      xlink:href="#heart"
      attributeName="stroke"
      to="#697077"
      begin="all.mouseout"
      dur="80ms"
      repeatCount="1"
      fill="freeze"
    />
    <animate
      id="heart-start"
      xlink:href="#heart"
      attributeName="fill-opacity"
      to="1"
      begin="all.mouseover"
      dur="80ms"
      repeatCount="1"
      fill="freeze"
    />
    <animate
      id="heart-end"
      xlink:href="#heart"
      attributeName="fill-opacity"
      to="0"
      begin="all.mouseout"
      dur="80ms"
      repeatCount="1"
      fill="freeze"
    />
    <animateTransform
      xlink:href="#heart-position"
      attributeName="transform"
      type="scale"
      values="0.6; 1.1; 0.8; 1.1; 1.1; 0.6;"
      begin="all.mouseover"
      dur="1s"
      repeatCount="indefinite"
    />
    <animateTransform
      xlink:href="#heart-position"
      attributeName="transform"
      type="scale"
      values="1"
      begin="all.mouseout"
      dur="1s"
      repeatCount="1"
      fill="freeze"
    />
  </svg>
</template>
