; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60322 () Bool)

(assert start!60322)

(declare-fun b!675978 () Bool)

(declare-fun e!385658 () Bool)

(declare-fun e!385652 () Bool)

(assert (=> b!675978 (= e!385658 e!385652)))

(declare-fun res!442297 () Bool)

(assert (=> b!675978 (=> (not res!442297) (not e!385652))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675978 (= res!442297 (bvsle from!3004 i!1382))))

(declare-fun b!675979 () Bool)

(declare-fun res!442307 () Bool)

(declare-fun e!385654 () Bool)

(assert (=> b!675979 (=> (not res!442307) (not e!385654))))

(declare-fun e!385655 () Bool)

(assert (=> b!675979 (= res!442307 e!385655)))

(declare-fun res!442293 () Bool)

(assert (=> b!675979 (=> res!442293 e!385655)))

(declare-fun e!385659 () Bool)

(assert (=> b!675979 (= res!442293 e!385659)))

(declare-fun res!442294 () Bool)

(assert (=> b!675979 (=> (not res!442294) (not e!385659))))

(assert (=> b!675979 (= res!442294 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675980 () Bool)

(declare-fun res!442311 () Bool)

(assert (=> b!675980 (=> (not res!442311) (not e!385654))))

(assert (=> b!675980 (= res!442311 e!385658)))

(declare-fun res!442310 () Bool)

(assert (=> b!675980 (=> res!442310 e!385658)))

(declare-fun e!385656 () Bool)

(assert (=> b!675980 (= res!442310 e!385656)))

(declare-fun res!442302 () Bool)

(assert (=> b!675980 (=> (not res!442302) (not e!385656))))

(assert (=> b!675980 (= res!442302 (bvsgt from!3004 i!1382))))

(declare-fun b!675981 () Bool)

(declare-fun res!442305 () Bool)

(assert (=> b!675981 (=> (not res!442305) (not e!385654))))

(assert (=> b!675981 (= res!442305 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675982 () Bool)

(declare-fun res!442301 () Bool)

(assert (=> b!675982 (=> (not res!442301) (not e!385654))))

(declare-datatypes ((array!39307 0))(
  ( (array!39308 (arr!18843 (Array (_ BitVec 32) (_ BitVec 64))) (size!19207 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39307)

(declare-datatypes ((List!12791 0))(
  ( (Nil!12788) (Cons!12787 (h!13835 (_ BitVec 64)) (t!19011 List!12791)) )
))
(declare-fun acc!681 () List!12791)

(declare-fun arrayNoDuplicates!0 (array!39307 (_ BitVec 32) List!12791) Bool)

(assert (=> b!675982 (= res!442301 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675983 () Bool)

(declare-fun res!442308 () Bool)

(assert (=> b!675983 (=> (not res!442308) (not e!385654))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675983 (= res!442308 (validKeyInArray!0 k!2843))))

(declare-fun res!442309 () Bool)

(assert (=> start!60322 (=> (not res!442309) (not e!385654))))

(assert (=> start!60322 (= res!442309 (and (bvslt (size!19207 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19207 a!3626))))))

(assert (=> start!60322 e!385654))

(assert (=> start!60322 true))

(declare-fun array_inv!14702 (array!39307) Bool)

(assert (=> start!60322 (array_inv!14702 a!3626)))

(declare-fun b!675984 () Bool)

(declare-fun res!442304 () Bool)

(assert (=> b!675984 (=> (not res!442304) (not e!385654))))

(assert (=> b!675984 (= res!442304 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19207 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675985 () Bool)

(declare-fun contains!3443 (List!12791 (_ BitVec 64)) Bool)

(assert (=> b!675985 (= e!385656 (contains!3443 acc!681 k!2843))))

(declare-fun b!675986 () Bool)

(declare-fun res!442296 () Bool)

(assert (=> b!675986 (=> (not res!442296) (not e!385654))))

(declare-fun noDuplicate!717 (List!12791) Bool)

(assert (=> b!675986 (= res!442296 (noDuplicate!717 acc!681))))

(declare-fun b!675987 () Bool)

(declare-fun res!442300 () Bool)

(assert (=> b!675987 (=> (not res!442300) (not e!385654))))

(assert (=> b!675987 (= res!442300 (not (contains!3443 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675988 () Bool)

(assert (=> b!675988 (= e!385654 false)))

(declare-fun lt!312844 () Bool)

(assert (=> b!675988 (= lt!312844 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675989 () Bool)

(declare-fun res!442312 () Bool)

(assert (=> b!675989 (=> (not res!442312) (not e!385654))))

(assert (=> b!675989 (= res!442312 (not (contains!3443 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675990 () Bool)

(declare-fun res!442295 () Bool)

(assert (=> b!675990 (=> (not res!442295) (not e!385654))))

(assert (=> b!675990 (= res!442295 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12788))))

(declare-fun b!675991 () Bool)

(assert (=> b!675991 (= e!385652 (not (contains!3443 acc!681 k!2843)))))

(declare-fun b!675992 () Bool)

(declare-fun res!442303 () Bool)

(assert (=> b!675992 (=> (not res!442303) (not e!385654))))

(assert (=> b!675992 (= res!442303 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19207 a!3626))))))

(declare-fun b!675993 () Bool)

(declare-fun res!442299 () Bool)

(assert (=> b!675993 (=> (not res!442299) (not e!385654))))

(declare-fun arrayContainsKey!0 (array!39307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675993 (= res!442299 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675994 () Bool)

(declare-fun e!385657 () Bool)

(assert (=> b!675994 (= e!385657 (not (contains!3443 acc!681 k!2843)))))

(declare-fun b!675995 () Bool)

(assert (=> b!675995 (= e!385659 (contains!3443 acc!681 k!2843))))

(declare-fun b!675996 () Bool)

(assert (=> b!675996 (= e!385655 e!385657)))

(declare-fun res!442298 () Bool)

(assert (=> b!675996 (=> (not res!442298) (not e!385657))))

(assert (=> b!675996 (= res!442298 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675997 () Bool)

(declare-fun res!442306 () Bool)

(assert (=> b!675997 (=> (not res!442306) (not e!385654))))

(assert (=> b!675997 (= res!442306 (not (validKeyInArray!0 (select (arr!18843 a!3626) from!3004))))))

(assert (= (and start!60322 res!442309) b!675986))

(assert (= (and b!675986 res!442296) b!675987))

(assert (= (and b!675987 res!442300) b!675989))

(assert (= (and b!675989 res!442312) b!675980))

(assert (= (and b!675980 res!442302) b!675985))

(assert (= (and b!675980 (not res!442310)) b!675978))

(assert (= (and b!675978 res!442297) b!675991))

(assert (= (and b!675980 res!442311) b!675990))

(assert (= (and b!675990 res!442295) b!675982))

(assert (= (and b!675982 res!442301) b!675992))

(assert (= (and b!675992 res!442303) b!675983))

(assert (= (and b!675983 res!442308) b!675993))

(assert (= (and b!675993 res!442299) b!675984))

(assert (= (and b!675984 res!442304) b!675997))

(assert (= (and b!675997 res!442306) b!675981))

(assert (= (and b!675981 res!442305) b!675979))

(assert (= (and b!675979 res!442294) b!675995))

(assert (= (and b!675979 (not res!442293)) b!675996))

(assert (= (and b!675996 res!442298) b!675994))

(assert (= (and b!675979 res!442307) b!675988))

(declare-fun m!643717 () Bool)

(assert (=> b!675995 m!643717))

(declare-fun m!643719 () Bool)

(assert (=> b!675982 m!643719))

(declare-fun m!643721 () Bool)

(assert (=> b!675986 m!643721))

(declare-fun m!643723 () Bool)

(assert (=> b!675997 m!643723))

(assert (=> b!675997 m!643723))

(declare-fun m!643725 () Bool)

(assert (=> b!675997 m!643725))

(declare-fun m!643727 () Bool)

(assert (=> b!675987 m!643727))

(declare-fun m!643729 () Bool)

(assert (=> start!60322 m!643729))

(assert (=> b!675994 m!643717))

(declare-fun m!643731 () Bool)

(assert (=> b!675990 m!643731))

(assert (=> b!675985 m!643717))

(declare-fun m!643733 () Bool)

(assert (=> b!675989 m!643733))

(declare-fun m!643735 () Bool)

(assert (=> b!675983 m!643735))

(assert (=> b!675991 m!643717))

(declare-fun m!643737 () Bool)

(assert (=> b!675993 m!643737))

(declare-fun m!643739 () Bool)

(assert (=> b!675988 m!643739))

(push 1)

(assert (not b!675985))

(assert (not b!675986))

(assert (not b!675995))

(assert (not b!675983))

(assert (not b!675997))

(assert (not b!675988))

(assert (not start!60322))

(assert (not b!675993))

(assert (not b!675989))

(assert (not b!675990))

(assert (not b!675994))

(assert (not b!675991))

(assert (not b!675987))

(assert (not b!675982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

