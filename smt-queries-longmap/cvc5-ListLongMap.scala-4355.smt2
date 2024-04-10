; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60158 () Bool)

(assert start!60158)

(declare-fun b!671794 () Bool)

(declare-fun res!438477 () Bool)

(declare-fun e!383870 () Bool)

(assert (=> b!671794 (=> (not res!438477) (not e!383870))))

(declare-datatypes ((List!12836 0))(
  ( (Nil!12833) (Cons!12832 (h!13877 (_ BitVec 64)) (t!19064 List!12836)) )
))
(declare-fun acc!681 () List!12836)

(declare-fun contains!3413 (List!12836 (_ BitVec 64)) Bool)

(assert (=> b!671794 (= res!438477 (not (contains!3413 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671795 () Bool)

(declare-fun res!438486 () Bool)

(declare-fun e!383868 () Bool)

(assert (=> b!671795 (=> (not res!438486) (not e!383868))))

(declare-fun lt!312214 () List!12836)

(declare-fun noDuplicate!660 (List!12836) Bool)

(assert (=> b!671795 (= res!438486 (noDuplicate!660 lt!312214))))

(declare-fun b!671796 () Bool)

(declare-fun res!438479 () Bool)

(assert (=> b!671796 (=> (not res!438479) (not e!383868))))

(declare-fun e!383877 () Bool)

(assert (=> b!671796 (= res!438479 e!383877)))

(declare-fun res!438474 () Bool)

(assert (=> b!671796 (=> res!438474 e!383877)))

(declare-fun e!383867 () Bool)

(assert (=> b!671796 (= res!438474 e!383867)))

(declare-fun res!438475 () Bool)

(assert (=> b!671796 (=> (not res!438475) (not e!383867))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671796 (= res!438475 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671797 () Bool)

(declare-fun e!383875 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!671797 (= e!383875 (not (contains!3413 acc!681 k!2843)))))

(declare-fun b!671798 () Bool)

(declare-fun res!438488 () Bool)

(assert (=> b!671798 (=> (not res!438488) (not e!383870))))

(declare-datatypes ((array!39205 0))(
  ( (array!39206 (arr!18795 (Array (_ BitVec 32) (_ BitVec 64))) (size!19159 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39205)

(declare-fun arrayNoDuplicates!0 (array!39205 (_ BitVec 32) List!12836) Bool)

(assert (=> b!671798 (= res!438488 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671799 () Bool)

(declare-fun res!438473 () Bool)

(assert (=> b!671799 (=> (not res!438473) (not e!383870))))

(assert (=> b!671799 (= res!438473 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19159 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671800 () Bool)

(declare-fun e!383876 () Bool)

(assert (=> b!671800 (= e!383870 e!383876)))

(declare-fun res!438478 () Bool)

(assert (=> b!671800 (=> (not res!438478) (not e!383876))))

(assert (=> b!671800 (= res!438478 (not (= (select (arr!18795 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23592 0))(
  ( (Unit!23593) )
))
(declare-fun lt!312213 () Unit!23592)

(declare-fun e!383874 () Unit!23592)

(assert (=> b!671800 (= lt!312213 e!383874)))

(declare-fun c!77030 () Bool)

(assert (=> b!671800 (= c!77030 (= (select (arr!18795 a!3626) from!3004) k!2843))))

(declare-fun b!671801 () Bool)

(declare-fun res!438469 () Bool)

(assert (=> b!671801 (=> (not res!438469) (not e!383870))))

(declare-fun arrayContainsKey!0 (array!39205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671801 (= res!438469 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671802 () Bool)

(declare-fun res!438476 () Bool)

(assert (=> b!671802 (=> (not res!438476) (not e!383870))))

(assert (=> b!671802 (= res!438476 (not (contains!3413 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671803 () Bool)

(declare-fun e!383873 () Bool)

(assert (=> b!671803 (= e!383877 e!383873)))

(declare-fun res!438489 () Bool)

(assert (=> b!671803 (=> (not res!438489) (not e!383873))))

(assert (=> b!671803 (= res!438489 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671804 () Bool)

(declare-fun res!438483 () Bool)

(assert (=> b!671804 (=> (not res!438483) (not e!383868))))

(assert (=> b!671804 (= res!438483 (not (contains!3413 lt!312214 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671805 () Bool)

(declare-fun res!438490 () Bool)

(assert (=> b!671805 (=> (not res!438490) (not e!383870))))

(assert (=> b!671805 (= res!438490 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12833))))

(declare-fun b!671806 () Bool)

(declare-fun Unit!23594 () Unit!23592)

(assert (=> b!671806 (= e!383874 Unit!23594)))

(declare-fun b!671807 () Bool)

(declare-fun Unit!23595 () Unit!23592)

(assert (=> b!671807 (= e!383874 Unit!23595)))

(assert (=> b!671807 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312211 () Unit!23592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39205 (_ BitVec 64) (_ BitVec 32)) Unit!23592)

(assert (=> b!671807 (= lt!312211 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!671807 false))

(declare-fun res!438485 () Bool)

(assert (=> start!60158 (=> (not res!438485) (not e!383870))))

(assert (=> start!60158 (= res!438485 (and (bvslt (size!19159 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19159 a!3626))))))

(assert (=> start!60158 e!383870))

(assert (=> start!60158 true))

(declare-fun array_inv!14591 (array!39205) Bool)

(assert (=> start!60158 (array_inv!14591 a!3626)))

(declare-fun b!671808 () Bool)

(declare-fun res!438472 () Bool)

(assert (=> b!671808 (=> (not res!438472) (not e!383870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671808 (= res!438472 (validKeyInArray!0 (select (arr!18795 a!3626) from!3004)))))

(declare-fun b!671809 () Bool)

(assert (=> b!671809 (= e!383873 (not (contains!3413 lt!312214 k!2843)))))

(declare-fun b!671810 () Bool)

(declare-fun e!383869 () Bool)

(assert (=> b!671810 (= e!383869 (contains!3413 acc!681 k!2843))))

(declare-fun b!671811 () Bool)

(assert (=> b!671811 (= e!383868 false)))

(declare-fun lt!312212 () Bool)

(assert (=> b!671811 (= lt!312212 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312214))))

(declare-fun b!671812 () Bool)

(assert (=> b!671812 (= e!383876 e!383868)))

(declare-fun res!438487 () Bool)

(assert (=> b!671812 (=> (not res!438487) (not e!383868))))

(assert (=> b!671812 (= res!438487 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!263 (List!12836 (_ BitVec 64)) List!12836)

(assert (=> b!671812 (= lt!312214 ($colon$colon!263 acc!681 (select (arr!18795 a!3626) from!3004)))))

(declare-fun b!671813 () Bool)

(declare-fun res!438481 () Bool)

(assert (=> b!671813 (=> (not res!438481) (not e!383870))))

(assert (=> b!671813 (= res!438481 (validKeyInArray!0 k!2843))))

(declare-fun b!671814 () Bool)

(declare-fun res!438471 () Bool)

(assert (=> b!671814 (=> (not res!438471) (not e!383868))))

(assert (=> b!671814 (= res!438471 (not (contains!3413 lt!312214 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671815 () Bool)

(declare-fun e!383872 () Bool)

(assert (=> b!671815 (= e!383872 e!383875)))

(declare-fun res!438470 () Bool)

(assert (=> b!671815 (=> (not res!438470) (not e!383875))))

(assert (=> b!671815 (= res!438470 (bvsle from!3004 i!1382))))

(declare-fun b!671816 () Bool)

(assert (=> b!671816 (= e!383867 (contains!3413 lt!312214 k!2843))))

(declare-fun b!671817 () Bool)

(declare-fun res!438484 () Bool)

(assert (=> b!671817 (=> (not res!438484) (not e!383870))))

(assert (=> b!671817 (= res!438484 e!383872)))

(declare-fun res!438491 () Bool)

(assert (=> b!671817 (=> res!438491 e!383872)))

(assert (=> b!671817 (= res!438491 e!383869)))

(declare-fun res!438482 () Bool)

(assert (=> b!671817 (=> (not res!438482) (not e!383869))))

(assert (=> b!671817 (= res!438482 (bvsgt from!3004 i!1382))))

(declare-fun b!671818 () Bool)

(declare-fun res!438468 () Bool)

(assert (=> b!671818 (=> (not res!438468) (not e!383870))))

(assert (=> b!671818 (= res!438468 (noDuplicate!660 acc!681))))

(declare-fun b!671819 () Bool)

(declare-fun res!438480 () Bool)

(assert (=> b!671819 (=> (not res!438480) (not e!383870))))

(assert (=> b!671819 (= res!438480 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19159 a!3626))))))

(assert (= (and start!60158 res!438485) b!671818))

(assert (= (and b!671818 res!438468) b!671802))

(assert (= (and b!671802 res!438476) b!671794))

(assert (= (and b!671794 res!438477) b!671817))

(assert (= (and b!671817 res!438482) b!671810))

(assert (= (and b!671817 (not res!438491)) b!671815))

(assert (= (and b!671815 res!438470) b!671797))

(assert (= (and b!671817 res!438484) b!671805))

(assert (= (and b!671805 res!438490) b!671798))

(assert (= (and b!671798 res!438488) b!671819))

(assert (= (and b!671819 res!438480) b!671813))

(assert (= (and b!671813 res!438481) b!671801))

(assert (= (and b!671801 res!438469) b!671799))

(assert (= (and b!671799 res!438473) b!671808))

(assert (= (and b!671808 res!438472) b!671800))

(assert (= (and b!671800 c!77030) b!671807))

(assert (= (and b!671800 (not c!77030)) b!671806))

(assert (= (and b!671800 res!438478) b!671812))

(assert (= (and b!671812 res!438487) b!671795))

(assert (= (and b!671795 res!438486) b!671804))

(assert (= (and b!671804 res!438483) b!671814))

(assert (= (and b!671814 res!438471) b!671796))

(assert (= (and b!671796 res!438475) b!671816))

(assert (= (and b!671796 (not res!438474)) b!671803))

(assert (= (and b!671803 res!438489) b!671809))

(assert (= (and b!671796 res!438479) b!671811))

(declare-fun m!641087 () Bool)

(assert (=> b!671794 m!641087))

(declare-fun m!641089 () Bool)

(assert (=> b!671813 m!641089))

(declare-fun m!641091 () Bool)

(assert (=> start!60158 m!641091))

(declare-fun m!641093 () Bool)

(assert (=> b!671811 m!641093))

(declare-fun m!641095 () Bool)

(assert (=> b!671805 m!641095))

(declare-fun m!641097 () Bool)

(assert (=> b!671818 m!641097))

(declare-fun m!641099 () Bool)

(assert (=> b!671812 m!641099))

(assert (=> b!671812 m!641099))

(declare-fun m!641101 () Bool)

(assert (=> b!671812 m!641101))

(declare-fun m!641103 () Bool)

(assert (=> b!671795 m!641103))

(assert (=> b!671800 m!641099))

(declare-fun m!641105 () Bool)

(assert (=> b!671814 m!641105))

(declare-fun m!641107 () Bool)

(assert (=> b!671807 m!641107))

(declare-fun m!641109 () Bool)

(assert (=> b!671807 m!641109))

(declare-fun m!641111 () Bool)

(assert (=> b!671804 m!641111))

(declare-fun m!641113 () Bool)

(assert (=> b!671809 m!641113))

(declare-fun m!641115 () Bool)

(assert (=> b!671802 m!641115))

(declare-fun m!641117 () Bool)

(assert (=> b!671810 m!641117))

(assert (=> b!671816 m!641113))

(assert (=> b!671808 m!641099))

(assert (=> b!671808 m!641099))

(declare-fun m!641119 () Bool)

(assert (=> b!671808 m!641119))

(declare-fun m!641121 () Bool)

(assert (=> b!671798 m!641121))

(declare-fun m!641123 () Bool)

(assert (=> b!671801 m!641123))

(assert (=> b!671797 m!641117))

(push 1)

