; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62218 () Bool)

(assert start!62218)

(declare-fun b!697113 () Bool)

(declare-fun e!396320 () Bool)

(declare-datatypes ((List!13188 0))(
  ( (Nil!13185) (Cons!13184 (h!14229 (_ BitVec 64)) (t!19470 List!13188)) )
))
(declare-fun acc!681 () List!13188)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3765 (List!13188 (_ BitVec 64)) Bool)

(assert (=> b!697113 (= e!396320 (not (contains!3765 acc!681 k0!2843)))))

(declare-fun b!697114 () Bool)

(declare-fun res!461051 () Bool)

(declare-fun e!396322 () Bool)

(assert (=> b!697114 (=> (not res!461051) (not e!396322))))

(declare-fun noDuplicate!1012 (List!13188) Bool)

(assert (=> b!697114 (= res!461051 (noDuplicate!1012 acc!681))))

(declare-fun b!697115 () Bool)

(declare-fun e!396326 () Bool)

(assert (=> b!697115 (= e!396326 (contains!3765 acc!681 k0!2843))))

(declare-fun b!697116 () Bool)

(declare-fun res!461039 () Bool)

(assert (=> b!697116 (=> (not res!461039) (not e!396322))))

(assert (=> b!697116 (= res!461039 (not (contains!3765 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697117 () Bool)

(declare-datatypes ((array!39975 0))(
  ( (array!39976 (arr!19147 (Array (_ BitVec 32) (_ BitVec 64))) (size!19532 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39975)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!697117 (= e!396322 (bvsge (bvsub (size!19532 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19532 a!3626) from!3004)))))

(declare-fun b!697118 () Bool)

(declare-fun res!461046 () Bool)

(assert (=> b!697118 (=> (not res!461046) (not e!396322))))

(declare-fun e!396321 () Bool)

(assert (=> b!697118 (= res!461046 e!396321)))

(declare-fun res!461042 () Bool)

(assert (=> b!697118 (=> res!461042 e!396321)))

(assert (=> b!697118 (= res!461042 e!396326)))

(declare-fun res!461048 () Bool)

(assert (=> b!697118 (=> (not res!461048) (not e!396326))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697118 (= res!461048 (bvsgt from!3004 i!1382))))

(declare-fun b!697119 () Bool)

(declare-fun res!461043 () Bool)

(assert (=> b!697119 (=> (not res!461043) (not e!396322))))

(declare-fun arrayContainsKey!0 (array!39975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697119 (= res!461043 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697120 () Bool)

(assert (=> b!697120 (= e!396321 e!396320)))

(declare-fun res!461038 () Bool)

(assert (=> b!697120 (=> (not res!461038) (not e!396320))))

(assert (=> b!697120 (= res!461038 (bvsle from!3004 i!1382))))

(declare-fun b!697122 () Bool)

(declare-fun res!461050 () Bool)

(assert (=> b!697122 (=> (not res!461050) (not e!396322))))

(declare-fun arrayNoDuplicates!0 (array!39975 (_ BitVec 32) List!13188) Bool)

(assert (=> b!697122 (= res!461050 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13185))))

(declare-fun b!697123 () Bool)

(declare-fun res!461035 () Bool)

(assert (=> b!697123 (=> (not res!461035) (not e!396322))))

(assert (=> b!697123 (= res!461035 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697124 () Bool)

(declare-fun res!461033 () Bool)

(assert (=> b!697124 (=> (not res!461033) (not e!396322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697124 (= res!461033 (validKeyInArray!0 k0!2843))))

(declare-fun b!697125 () Bool)

(declare-fun res!461041 () Bool)

(assert (=> b!697125 (=> (not res!461041) (not e!396322))))

(assert (=> b!697125 (= res!461041 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19532 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697126 () Bool)

(declare-fun res!461040 () Bool)

(assert (=> b!697126 (=> (not res!461040) (not e!396322))))

(assert (=> b!697126 (= res!461040 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19532 a!3626))))))

(declare-fun b!697127 () Bool)

(declare-fun e!396324 () Bool)

(declare-fun e!396325 () Bool)

(assert (=> b!697127 (= e!396324 e!396325)))

(declare-fun res!461049 () Bool)

(assert (=> b!697127 (=> (not res!461049) (not e!396325))))

(assert (=> b!697127 (= res!461049 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697128 () Bool)

(declare-fun res!461047 () Bool)

(assert (=> b!697128 (=> (not res!461047) (not e!396322))))

(assert (=> b!697128 (= res!461047 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697129 () Bool)

(assert (=> b!697129 (= e!396325 (not (contains!3765 acc!681 k0!2843)))))

(declare-fun b!697130 () Bool)

(declare-fun e!396323 () Bool)

(assert (=> b!697130 (= e!396323 (contains!3765 acc!681 k0!2843))))

(declare-fun b!697131 () Bool)

(declare-fun res!461031 () Bool)

(assert (=> b!697131 (=> (not res!461031) (not e!396322))))

(assert (=> b!697131 (= res!461031 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697132 () Bool)

(declare-fun res!461037 () Bool)

(assert (=> b!697132 (=> (not res!461037) (not e!396322))))

(assert (=> b!697132 (= res!461037 e!396324)))

(declare-fun res!461044 () Bool)

(assert (=> b!697132 (=> res!461044 e!396324)))

(assert (=> b!697132 (= res!461044 e!396323)))

(declare-fun res!461045 () Bool)

(assert (=> b!697132 (=> (not res!461045) (not e!396323))))

(assert (=> b!697132 (= res!461045 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697133 () Bool)

(declare-fun res!461032 () Bool)

(assert (=> b!697133 (=> (not res!461032) (not e!396322))))

(assert (=> b!697133 (= res!461032 (not (contains!3765 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697121 () Bool)

(declare-fun res!461034 () Bool)

(assert (=> b!697121 (=> (not res!461034) (not e!396322))))

(assert (=> b!697121 (= res!461034 (not (validKeyInArray!0 (select (arr!19147 a!3626) from!3004))))))

(declare-fun res!461036 () Bool)

(assert (=> start!62218 (=> (not res!461036) (not e!396322))))

(assert (=> start!62218 (= res!461036 (and (bvslt (size!19532 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19532 a!3626))))))

(assert (=> start!62218 e!396322))

(assert (=> start!62218 true))

(declare-fun array_inv!14943 (array!39975) Bool)

(assert (=> start!62218 (array_inv!14943 a!3626)))

(assert (= (and start!62218 res!461036) b!697114))

(assert (= (and b!697114 res!461051) b!697133))

(assert (= (and b!697133 res!461032) b!697116))

(assert (= (and b!697116 res!461039) b!697118))

(assert (= (and b!697118 res!461048) b!697115))

(assert (= (and b!697118 (not res!461042)) b!697120))

(assert (= (and b!697120 res!461038) b!697113))

(assert (= (and b!697118 res!461046) b!697122))

(assert (= (and b!697122 res!461050) b!697128))

(assert (= (and b!697128 res!461047) b!697126))

(assert (= (and b!697126 res!461040) b!697124))

(assert (= (and b!697124 res!461033) b!697119))

(assert (= (and b!697119 res!461043) b!697125))

(assert (= (and b!697125 res!461041) b!697121))

(assert (= (and b!697121 res!461034) b!697123))

(assert (= (and b!697123 res!461035) b!697132))

(assert (= (and b!697132 res!461045) b!697130))

(assert (= (and b!697132 (not res!461044)) b!697127))

(assert (= (and b!697127 res!461049) b!697129))

(assert (= (and b!697132 res!461037) b!697131))

(assert (= (and b!697131 res!461031) b!697117))

(declare-fun m!657707 () Bool)

(assert (=> b!697119 m!657707))

(declare-fun m!657709 () Bool)

(assert (=> b!697130 m!657709))

(declare-fun m!657711 () Bool)

(assert (=> b!697124 m!657711))

(declare-fun m!657713 () Bool)

(assert (=> b!697122 m!657713))

(declare-fun m!657715 () Bool)

(assert (=> b!697121 m!657715))

(assert (=> b!697121 m!657715))

(declare-fun m!657717 () Bool)

(assert (=> b!697121 m!657717))

(declare-fun m!657719 () Bool)

(assert (=> b!697133 m!657719))

(declare-fun m!657721 () Bool)

(assert (=> b!697128 m!657721))

(assert (=> b!697113 m!657709))

(declare-fun m!657723 () Bool)

(assert (=> b!697131 m!657723))

(declare-fun m!657725 () Bool)

(assert (=> start!62218 m!657725))

(declare-fun m!657727 () Bool)

(assert (=> b!697114 m!657727))

(assert (=> b!697115 m!657709))

(assert (=> b!697129 m!657709))

(declare-fun m!657729 () Bool)

(assert (=> b!697116 m!657729))

(check-sat (not b!697128) (not b!697119) (not b!697131) (not b!697121) (not start!62218) (not b!697129) (not b!697122) (not b!697113) (not b!697115) (not b!697133) (not b!697116) (not b!697124) (not b!697130) (not b!697114))
(check-sat)
