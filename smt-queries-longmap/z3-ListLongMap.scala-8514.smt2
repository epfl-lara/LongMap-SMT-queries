; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103874 () Bool)

(assert start!103874)

(declare-fun b!1243176 () Bool)

(declare-fun res!829004 () Bool)

(declare-fun e!704840 () Bool)

(assert (=> b!1243176 (=> (not res!829004) (not e!704840))))

(declare-datatypes ((List!27444 0))(
  ( (Nil!27441) (Cons!27440 (h!28649 (_ BitVec 64)) (t!40904 List!27444)) )
))
(declare-fun lt!562159 () List!27444)

(declare-fun subseq!629 (List!27444 List!27444) Bool)

(assert (=> b!1243176 (= res!829004 (subseq!629 Nil!27441 lt!562159))))

(declare-fun b!1243177 () Bool)

(declare-fun res!829000 () Bool)

(assert (=> b!1243177 (=> (not res!829000) (not e!704840))))

(declare-fun contains!7374 (List!27444 (_ BitVec 64)) Bool)

(assert (=> b!1243177 (= res!829000 (not (contains!7374 lt!562159 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243178 () Bool)

(declare-fun res!829002 () Bool)

(declare-fun e!704841 () Bool)

(assert (=> b!1243178 (=> (not res!829002) (not e!704841))))

(declare-datatypes ((array!79892 0))(
  ( (array!79893 (arr!38540 (Array (_ BitVec 32) (_ BitVec 64))) (size!39078 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79892)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243178 (= res!829002 (validKeyInArray!0 (select (arr!38540 a!3892) from!3270)))))

(declare-fun b!1243180 () Bool)

(declare-fun res!829003 () Bool)

(assert (=> b!1243180 (=> (not res!829003) (not e!704840))))

(assert (=> b!1243180 (= res!829003 (not (contains!7374 Nil!27441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243181 () Bool)

(declare-fun res!829005 () Bool)

(assert (=> b!1243181 (=> (not res!829005) (not e!704840))))

(assert (=> b!1243181 (= res!829005 (not (contains!7374 lt!562159 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243182 () Bool)

(declare-fun res!828995 () Bool)

(assert (=> b!1243182 (=> (not res!828995) (not e!704841))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243182 (= res!828995 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39078 a!3892)) (not (= newFrom!287 (size!39078 a!3892)))))))

(declare-fun b!1243183 () Bool)

(assert (=> b!1243183 (= e!704840 false)))

(declare-fun lt!562161 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79892 (_ BitVec 32) List!27444) Bool)

(assert (=> b!1243183 (= lt!562161 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562159))))

(declare-datatypes ((Unit!41112 0))(
  ( (Unit!41113) )
))
(declare-fun lt!562160 () Unit!41112)

(declare-fun noDuplicateSubseq!83 (List!27444 List!27444) Unit!41112)

(assert (=> b!1243183 (= lt!562160 (noDuplicateSubseq!83 Nil!27441 lt!562159))))

(declare-fun res!829001 () Bool)

(assert (=> start!103874 (=> (not res!829001) (not e!704841))))

(assert (=> start!103874 (= res!829001 (and (bvslt (size!39078 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39078 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39078 a!3892))))))

(assert (=> start!103874 e!704841))

(declare-fun array_inv!29523 (array!79892) Bool)

(assert (=> start!103874 (array_inv!29523 a!3892)))

(assert (=> start!103874 true))

(declare-fun b!1243179 () Bool)

(declare-fun res!828996 () Bool)

(assert (=> b!1243179 (=> (not res!828996) (not e!704840))))

(declare-fun noDuplicate!1999 (List!27444) Bool)

(assert (=> b!1243179 (= res!828996 (noDuplicate!1999 lt!562159))))

(declare-fun b!1243184 () Bool)

(assert (=> b!1243184 (= e!704841 e!704840)))

(declare-fun res!828997 () Bool)

(assert (=> b!1243184 (=> (not res!828997) (not e!704840))))

(assert (=> b!1243184 (= res!828997 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243184 (= lt!562159 (Cons!27440 (select (arr!38540 a!3892) from!3270) Nil!27441))))

(declare-fun b!1243185 () Bool)

(declare-fun res!828998 () Bool)

(assert (=> b!1243185 (=> (not res!828998) (not e!704840))))

(assert (=> b!1243185 (= res!828998 (not (contains!7374 Nil!27441 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243186 () Bool)

(declare-fun res!828999 () Bool)

(assert (=> b!1243186 (=> (not res!828999) (not e!704841))))

(assert (=> b!1243186 (= res!828999 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27441))))

(assert (= (and start!103874 res!829001) b!1243186))

(assert (= (and b!1243186 res!828999) b!1243182))

(assert (= (and b!1243182 res!828995) b!1243178))

(assert (= (and b!1243178 res!829002) b!1243184))

(assert (= (and b!1243184 res!828997) b!1243179))

(assert (= (and b!1243179 res!828996) b!1243177))

(assert (= (and b!1243177 res!829000) b!1243181))

(assert (= (and b!1243181 res!829005) b!1243180))

(assert (= (and b!1243180 res!829003) b!1243185))

(assert (= (and b!1243185 res!828998) b!1243176))

(assert (= (and b!1243176 res!829004) b!1243183))

(declare-fun m!1145337 () Bool)

(assert (=> b!1243181 m!1145337))

(declare-fun m!1145339 () Bool)

(assert (=> b!1243178 m!1145339))

(assert (=> b!1243178 m!1145339))

(declare-fun m!1145341 () Bool)

(assert (=> b!1243178 m!1145341))

(assert (=> b!1243184 m!1145339))

(declare-fun m!1145343 () Bool)

(assert (=> start!103874 m!1145343))

(declare-fun m!1145345 () Bool)

(assert (=> b!1243177 m!1145345))

(declare-fun m!1145347 () Bool)

(assert (=> b!1243179 m!1145347))

(declare-fun m!1145349 () Bool)

(assert (=> b!1243186 m!1145349))

(declare-fun m!1145351 () Bool)

(assert (=> b!1243176 m!1145351))

(declare-fun m!1145353 () Bool)

(assert (=> b!1243183 m!1145353))

(declare-fun m!1145355 () Bool)

(assert (=> b!1243183 m!1145355))

(declare-fun m!1145357 () Bool)

(assert (=> b!1243180 m!1145357))

(declare-fun m!1145359 () Bool)

(assert (=> b!1243185 m!1145359))

(check-sat (not b!1243176) (not start!103874) (not b!1243178) (not b!1243183) (not b!1243177) (not b!1243186) (not b!1243179) (not b!1243185) (not b!1243181) (not b!1243180))
(check-sat)
