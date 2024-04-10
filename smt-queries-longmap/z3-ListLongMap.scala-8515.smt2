; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103888 () Bool)

(assert start!103888)

(declare-fun b!1243390 () Bool)

(declare-fun res!829175 () Bool)

(declare-fun e!704920 () Bool)

(assert (=> b!1243390 (=> (not res!829175) (not e!704920))))

(declare-datatypes ((List!27386 0))(
  ( (Nil!27383) (Cons!27382 (h!28591 (_ BitVec 64)) (t!40855 List!27386)) )
))
(declare-fun lt!562375 () List!27386)

(declare-fun noDuplicate!1985 (List!27386) Bool)

(assert (=> b!1243390 (= res!829175 (noDuplicate!1985 lt!562375))))

(declare-fun b!1243391 () Bool)

(declare-fun res!829176 () Bool)

(declare-fun e!704921 () Bool)

(assert (=> b!1243391 (=> (not res!829176) (not e!704921))))

(declare-datatypes ((array!79980 0))(
  ( (array!79981 (arr!38583 (Array (_ BitVec 32) (_ BitVec 64))) (size!39119 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79980)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243391 (= res!829176 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39119 a!3892)) (not (= newFrom!287 (size!39119 a!3892)))))))

(declare-fun b!1243392 () Bool)

(declare-fun res!829168 () Bool)

(assert (=> b!1243392 (=> (not res!829168) (not e!704921))))

(declare-fun arrayNoDuplicates!0 (array!79980 (_ BitVec 32) List!27386) Bool)

(assert (=> b!1243392 (= res!829168 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27383))))

(declare-fun b!1243393 () Bool)

(declare-fun res!829177 () Bool)

(assert (=> b!1243393 (=> (not res!829177) (not e!704920))))

(declare-fun contains!7407 (List!27386 (_ BitVec 64)) Bool)

(assert (=> b!1243393 (= res!829177 (not (contains!7407 Nil!27383 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243394 () Bool)

(assert (=> b!1243394 (= e!704921 e!704920)))

(declare-fun res!829172 () Bool)

(assert (=> b!1243394 (=> (not res!829172) (not e!704920))))

(assert (=> b!1243394 (= res!829172 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243394 (= lt!562375 (Cons!27382 (select (arr!38583 a!3892) from!3270) Nil!27383))))

(declare-fun res!829170 () Bool)

(assert (=> start!103888 (=> (not res!829170) (not e!704921))))

(assert (=> start!103888 (= res!829170 (and (bvslt (size!39119 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39119 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39119 a!3892))))))

(assert (=> start!103888 e!704921))

(declare-fun array_inv!29431 (array!79980) Bool)

(assert (=> start!103888 (array_inv!29431 a!3892)))

(assert (=> start!103888 true))

(declare-fun b!1243395 () Bool)

(declare-fun res!829171 () Bool)

(assert (=> b!1243395 (=> (not res!829171) (not e!704920))))

(assert (=> b!1243395 (= res!829171 (not (contains!7407 lt!562375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243396 () Bool)

(declare-fun res!829173 () Bool)

(assert (=> b!1243396 (=> (not res!829173) (not e!704920))))

(assert (=> b!1243396 (= res!829173 (not (contains!7407 Nil!27383 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243397 () Bool)

(declare-fun res!829174 () Bool)

(assert (=> b!1243397 (=> (not res!829174) (not e!704920))))

(assert (=> b!1243397 (= res!829174 (not (contains!7407 lt!562375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243398 () Bool)

(declare-fun res!829167 () Bool)

(assert (=> b!1243398 (=> (not res!829167) (not e!704920))))

(declare-fun subseq!633 (List!27386 List!27386) Bool)

(assert (=> b!1243398 (= res!829167 (subseq!633 Nil!27383 lt!562375))))

(declare-fun b!1243399 () Bool)

(declare-fun res!829169 () Bool)

(assert (=> b!1243399 (=> (not res!829169) (not e!704921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243399 (= res!829169 (validKeyInArray!0 (select (arr!38583 a!3892) from!3270)))))

(declare-fun b!1243400 () Bool)

(assert (=> b!1243400 (= e!704920 false)))

(declare-fun lt!562374 () Bool)

(assert (=> b!1243400 (= lt!562374 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562375))))

(declare-datatypes ((Unit!41275 0))(
  ( (Unit!41276) )
))
(declare-fun lt!562376 () Unit!41275)

(declare-fun noDuplicateSubseq!87 (List!27386 List!27386) Unit!41275)

(assert (=> b!1243400 (= lt!562376 (noDuplicateSubseq!87 Nil!27383 lt!562375))))

(assert (= (and start!103888 res!829170) b!1243392))

(assert (= (and b!1243392 res!829168) b!1243391))

(assert (= (and b!1243391 res!829176) b!1243399))

(assert (= (and b!1243399 res!829169) b!1243394))

(assert (= (and b!1243394 res!829172) b!1243390))

(assert (= (and b!1243390 res!829175) b!1243397))

(assert (= (and b!1243397 res!829174) b!1243395))

(assert (= (and b!1243395 res!829171) b!1243396))

(assert (= (and b!1243396 res!829173) b!1243393))

(assert (= (and b!1243393 res!829177) b!1243398))

(assert (= (and b!1243398 res!829167) b!1243400))

(declare-fun m!1145963 () Bool)

(assert (=> b!1243390 m!1145963))

(declare-fun m!1145965 () Bool)

(assert (=> b!1243397 m!1145965))

(declare-fun m!1145967 () Bool)

(assert (=> b!1243396 m!1145967))

(declare-fun m!1145969 () Bool)

(assert (=> b!1243395 m!1145969))

(declare-fun m!1145971 () Bool)

(assert (=> b!1243400 m!1145971))

(declare-fun m!1145973 () Bool)

(assert (=> b!1243400 m!1145973))

(declare-fun m!1145975 () Bool)

(assert (=> b!1243392 m!1145975))

(declare-fun m!1145977 () Bool)

(assert (=> b!1243394 m!1145977))

(declare-fun m!1145979 () Bool)

(assert (=> b!1243398 m!1145979))

(assert (=> b!1243399 m!1145977))

(assert (=> b!1243399 m!1145977))

(declare-fun m!1145981 () Bool)

(assert (=> b!1243399 m!1145981))

(declare-fun m!1145983 () Bool)

(assert (=> b!1243393 m!1145983))

(declare-fun m!1145985 () Bool)

(assert (=> start!103888 m!1145985))

(check-sat (not b!1243400) (not b!1243397) (not b!1243392) (not b!1243393) (not b!1243390) (not start!103888) (not b!1243398) (not b!1243396) (not b!1243399) (not b!1243395))
(check-sat)
