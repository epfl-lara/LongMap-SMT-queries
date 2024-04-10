; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103892 () Bool)

(assert start!103892)

(declare-fun b!1243456 () Bool)

(declare-fun res!829236 () Bool)

(declare-fun e!704938 () Bool)

(assert (=> b!1243456 (=> (not res!829236) (not e!704938))))

(declare-datatypes ((array!79984 0))(
  ( (array!79985 (arr!38585 (Array (_ BitVec 32) (_ BitVec 64))) (size!39121 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79984)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27388 0))(
  ( (Nil!27385) (Cons!27384 (h!28593 (_ BitVec 64)) (t!40857 List!27388)) )
))
(declare-fun arrayNoDuplicates!0 (array!79984 (_ BitVec 32) List!27388) Bool)

(assert (=> b!1243456 (= res!829236 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27385))))

(declare-fun b!1243457 () Bool)

(declare-fun e!704940 () Bool)

(assert (=> b!1243457 (= e!704940 false)))

(declare-fun lt!562394 () Bool)

(declare-fun lt!562392 () List!27388)

(assert (=> b!1243457 (= lt!562394 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562392))))

(declare-datatypes ((Unit!41279 0))(
  ( (Unit!41280) )
))
(declare-fun lt!562393 () Unit!41279)

(declare-fun noDuplicateSubseq!89 (List!27388 List!27388) Unit!41279)

(assert (=> b!1243457 (= lt!562393 (noDuplicateSubseq!89 Nil!27385 lt!562392))))

(declare-fun b!1243458 () Bool)

(assert (=> b!1243458 (= e!704938 e!704940)))

(declare-fun res!829240 () Bool)

(assert (=> b!1243458 (=> (not res!829240) (not e!704940))))

(assert (=> b!1243458 (= res!829240 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243458 (= lt!562392 (Cons!27384 (select (arr!38585 a!3892) from!3270) Nil!27385))))

(declare-fun b!1243459 () Bool)

(declare-fun res!829241 () Bool)

(assert (=> b!1243459 (=> (not res!829241) (not e!704938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243459 (= res!829241 (validKeyInArray!0 (select (arr!38585 a!3892) from!3270)))))

(declare-fun res!829233 () Bool)

(assert (=> start!103892 (=> (not res!829233) (not e!704938))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103892 (= res!829233 (and (bvslt (size!39121 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39121 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39121 a!3892))))))

(assert (=> start!103892 e!704938))

(declare-fun array_inv!29433 (array!79984) Bool)

(assert (=> start!103892 (array_inv!29433 a!3892)))

(assert (=> start!103892 true))

(declare-fun b!1243460 () Bool)

(declare-fun res!829237 () Bool)

(assert (=> b!1243460 (=> (not res!829237) (not e!704940))))

(declare-fun contains!7409 (List!27388 (_ BitVec 64)) Bool)

(assert (=> b!1243460 (= res!829237 (not (contains!7409 lt!562392 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243461 () Bool)

(declare-fun res!829242 () Bool)

(assert (=> b!1243461 (=> (not res!829242) (not e!704938))))

(assert (=> b!1243461 (= res!829242 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39121 a!3892)) (not (= newFrom!287 (size!39121 a!3892)))))))

(declare-fun b!1243462 () Bool)

(declare-fun res!829235 () Bool)

(assert (=> b!1243462 (=> (not res!829235) (not e!704940))))

(assert (=> b!1243462 (= res!829235 (not (contains!7409 Nil!27385 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243463 () Bool)

(declare-fun res!829243 () Bool)

(assert (=> b!1243463 (=> (not res!829243) (not e!704940))))

(assert (=> b!1243463 (= res!829243 (not (contains!7409 Nil!27385 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243464 () Bool)

(declare-fun res!829234 () Bool)

(assert (=> b!1243464 (=> (not res!829234) (not e!704940))))

(declare-fun noDuplicate!1987 (List!27388) Bool)

(assert (=> b!1243464 (= res!829234 (noDuplicate!1987 lt!562392))))

(declare-fun b!1243465 () Bool)

(declare-fun res!829239 () Bool)

(assert (=> b!1243465 (=> (not res!829239) (not e!704940))))

(assert (=> b!1243465 (= res!829239 (not (contains!7409 lt!562392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243466 () Bool)

(declare-fun res!829238 () Bool)

(assert (=> b!1243466 (=> (not res!829238) (not e!704940))))

(declare-fun subseq!635 (List!27388 List!27388) Bool)

(assert (=> b!1243466 (= res!829238 (subseq!635 Nil!27385 lt!562392))))

(assert (= (and start!103892 res!829233) b!1243456))

(assert (= (and b!1243456 res!829236) b!1243461))

(assert (= (and b!1243461 res!829242) b!1243459))

(assert (= (and b!1243459 res!829241) b!1243458))

(assert (= (and b!1243458 res!829240) b!1243464))

(assert (= (and b!1243464 res!829234) b!1243465))

(assert (= (and b!1243465 res!829239) b!1243460))

(assert (= (and b!1243460 res!829237) b!1243463))

(assert (= (and b!1243463 res!829243) b!1243462))

(assert (= (and b!1243462 res!829235) b!1243466))

(assert (= (and b!1243466 res!829238) b!1243457))

(declare-fun m!1146011 () Bool)

(assert (=> b!1243456 m!1146011))

(declare-fun m!1146013 () Bool)

(assert (=> b!1243466 m!1146013))

(declare-fun m!1146015 () Bool)

(assert (=> b!1243462 m!1146015))

(declare-fun m!1146017 () Bool)

(assert (=> b!1243465 m!1146017))

(declare-fun m!1146019 () Bool)

(assert (=> b!1243458 m!1146019))

(declare-fun m!1146021 () Bool)

(assert (=> start!103892 m!1146021))

(declare-fun m!1146023 () Bool)

(assert (=> b!1243463 m!1146023))

(declare-fun m!1146025 () Bool)

(assert (=> b!1243457 m!1146025))

(declare-fun m!1146027 () Bool)

(assert (=> b!1243457 m!1146027))

(declare-fun m!1146029 () Bool)

(assert (=> b!1243460 m!1146029))

(declare-fun m!1146031 () Bool)

(assert (=> b!1243464 m!1146031))

(assert (=> b!1243459 m!1146019))

(assert (=> b!1243459 m!1146019))

(declare-fun m!1146033 () Bool)

(assert (=> b!1243459 m!1146033))

(push 1)

(assert (not b!1243463))

(assert (not b!1243460))

(assert (not b!1243466))

(assert (not b!1243457))

