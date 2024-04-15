; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103880 () Bool)

(assert start!103880)

(declare-fun b!1243275 () Bool)

(declare-fun res!829104 () Bool)

(declare-fun e!704868 () Bool)

(assert (=> b!1243275 (=> (not res!829104) (not e!704868))))

(declare-datatypes ((List!27447 0))(
  ( (Nil!27444) (Cons!27443 (h!28652 (_ BitVec 64)) (t!40907 List!27447)) )
))
(declare-fun lt!562188 () List!27447)

(declare-fun contains!7377 (List!27447 (_ BitVec 64)) Bool)

(assert (=> b!1243275 (= res!829104 (not (contains!7377 lt!562188 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243276 () Bool)

(declare-fun res!829099 () Bool)

(assert (=> b!1243276 (=> (not res!829099) (not e!704868))))

(assert (=> b!1243276 (= res!829099 (not (contains!7377 lt!562188 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829103 () Bool)

(declare-fun e!704866 () Bool)

(assert (=> start!103880 (=> (not res!829103) (not e!704866))))

(declare-datatypes ((array!79898 0))(
  ( (array!79899 (arr!38543 (Array (_ BitVec 32) (_ BitVec 64))) (size!39081 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79898)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103880 (= res!829103 (and (bvslt (size!39081 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39081 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39081 a!3892))))))

(assert (=> start!103880 e!704866))

(declare-fun array_inv!29526 (array!79898) Bool)

(assert (=> start!103880 (array_inv!29526 a!3892)))

(assert (=> start!103880 true))

(declare-fun b!1243277 () Bool)

(declare-fun res!829096 () Bool)

(assert (=> b!1243277 (=> (not res!829096) (not e!704866))))

(declare-fun arrayNoDuplicates!0 (array!79898 (_ BitVec 32) List!27447) Bool)

(assert (=> b!1243277 (= res!829096 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27444))))

(declare-fun b!1243278 () Bool)

(declare-fun res!829100 () Bool)

(assert (=> b!1243278 (=> (not res!829100) (not e!704868))))

(declare-fun subseq!632 (List!27447 List!27447) Bool)

(assert (=> b!1243278 (= res!829100 (subseq!632 Nil!27444 lt!562188))))

(declare-fun b!1243279 () Bool)

(declare-fun res!829095 () Bool)

(assert (=> b!1243279 (=> (not res!829095) (not e!704868))))

(declare-fun noDuplicate!2002 (List!27447) Bool)

(assert (=> b!1243279 (= res!829095 (noDuplicate!2002 lt!562188))))

(declare-fun b!1243280 () Bool)

(declare-fun res!829097 () Bool)

(assert (=> b!1243280 (=> (not res!829097) (not e!704866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243280 (= res!829097 (validKeyInArray!0 (select (arr!38543 a!3892) from!3270)))))

(declare-fun b!1243281 () Bool)

(assert (=> b!1243281 (= e!704866 e!704868)))

(declare-fun res!829094 () Bool)

(assert (=> b!1243281 (=> (not res!829094) (not e!704868))))

(assert (=> b!1243281 (= res!829094 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243281 (= lt!562188 (Cons!27443 (select (arr!38543 a!3892) from!3270) Nil!27444))))

(declare-fun b!1243282 () Bool)

(assert (=> b!1243282 (= e!704868 false)))

(declare-fun lt!562186 () Bool)

(assert (=> b!1243282 (= lt!562186 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562188))))

(declare-datatypes ((Unit!41118 0))(
  ( (Unit!41119) )
))
(declare-fun lt!562187 () Unit!41118)

(declare-fun noDuplicateSubseq!86 (List!27447 List!27447) Unit!41118)

(assert (=> b!1243282 (= lt!562187 (noDuplicateSubseq!86 Nil!27444 lt!562188))))

(declare-fun b!1243283 () Bool)

(declare-fun res!829102 () Bool)

(assert (=> b!1243283 (=> (not res!829102) (not e!704866))))

(assert (=> b!1243283 (= res!829102 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39081 a!3892)) (not (= newFrom!287 (size!39081 a!3892)))))))

(declare-fun b!1243284 () Bool)

(declare-fun res!829098 () Bool)

(assert (=> b!1243284 (=> (not res!829098) (not e!704868))))

(assert (=> b!1243284 (= res!829098 (not (contains!7377 Nil!27444 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243285 () Bool)

(declare-fun res!829101 () Bool)

(assert (=> b!1243285 (=> (not res!829101) (not e!704868))))

(assert (=> b!1243285 (= res!829101 (not (contains!7377 Nil!27444 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103880 res!829103) b!1243277))

(assert (= (and b!1243277 res!829096) b!1243283))

(assert (= (and b!1243283 res!829102) b!1243280))

(assert (= (and b!1243280 res!829097) b!1243281))

(assert (= (and b!1243281 res!829094) b!1243279))

(assert (= (and b!1243279 res!829095) b!1243276))

(assert (= (and b!1243276 res!829099) b!1243275))

(assert (= (and b!1243275 res!829104) b!1243285))

(assert (= (and b!1243285 res!829101) b!1243284))

(assert (= (and b!1243284 res!829098) b!1243278))

(assert (= (and b!1243278 res!829100) b!1243282))

(declare-fun m!1145409 () Bool)

(assert (=> b!1243276 m!1145409))

(declare-fun m!1145411 () Bool)

(assert (=> b!1243279 m!1145411))

(declare-fun m!1145413 () Bool)

(assert (=> b!1243281 m!1145413))

(declare-fun m!1145415 () Bool)

(assert (=> b!1243275 m!1145415))

(declare-fun m!1145417 () Bool)

(assert (=> b!1243277 m!1145417))

(assert (=> b!1243280 m!1145413))

(assert (=> b!1243280 m!1145413))

(declare-fun m!1145419 () Bool)

(assert (=> b!1243280 m!1145419))

(declare-fun m!1145421 () Bool)

(assert (=> b!1243282 m!1145421))

(declare-fun m!1145423 () Bool)

(assert (=> b!1243282 m!1145423))

(declare-fun m!1145425 () Bool)

(assert (=> start!103880 m!1145425))

(declare-fun m!1145427 () Bool)

(assert (=> b!1243278 m!1145427))

(declare-fun m!1145429 () Bool)

(assert (=> b!1243284 m!1145429))

(declare-fun m!1145431 () Bool)

(assert (=> b!1243285 m!1145431))

(check-sat (not b!1243275) (not b!1243282) (not b!1243279) (not b!1243285) (not b!1243284) (not b!1243276) (not b!1243280) (not start!103880) (not b!1243278) (not b!1243277))
(check-sat)
