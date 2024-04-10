; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102172 () Bool)

(assert start!102172)

(declare-fun b!1229980 () Bool)

(declare-fun res!818468 () Bool)

(declare-fun e!697970 () Bool)

(assert (=> b!1229980 (=> (not res!818468) (not e!697970))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229980 (= res!818468 (validKeyInArray!0 k!2913))))

(declare-fun b!1229982 () Bool)

(declare-fun res!818476 () Bool)

(assert (=> b!1229982 (=> (not res!818476) (not e!697970))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79347 0))(
  ( (array!79348 (arr!38293 (Array (_ BitVec 32) (_ BitVec 64))) (size!38829 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79347)

(assert (=> b!1229982 (= res!818476 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38829 a!3806)) (bvslt from!3184 (size!38829 a!3806))))))

(declare-fun b!1229983 () Bool)

(declare-fun res!818469 () Bool)

(declare-fun e!697968 () Bool)

(assert (=> b!1229983 (=> res!818469 e!697968)))

(declare-datatypes ((List!27066 0))(
  ( (Nil!27063) (Cons!27062 (h!28271 (_ BitVec 64)) (t!40529 List!27066)) )
))
(declare-fun lt!559297 () List!27066)

(declare-fun contains!7128 (List!27066 (_ BitVec 64)) Bool)

(assert (=> b!1229983 (= res!818469 (contains!7128 lt!559297 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229984 () Bool)

(declare-fun res!818471 () Bool)

(assert (=> b!1229984 (=> (not res!818471) (not e!697970))))

(declare-fun arrayContainsKey!0 (array!79347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229984 (= res!818471 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229985 () Bool)

(declare-fun res!818475 () Bool)

(assert (=> b!1229985 (=> (not res!818475) (not e!697970))))

(declare-fun acc!823 () List!27066)

(assert (=> b!1229985 (= res!818475 (not (contains!7128 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229986 () Bool)

(declare-fun res!818474 () Bool)

(assert (=> b!1229986 (=> (not res!818474) (not e!697970))))

(assert (=> b!1229986 (= res!818474 (not (contains!7128 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229987 () Bool)

(declare-fun e!697971 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79347 (_ BitVec 32) List!27066) Bool)

(assert (=> b!1229987 (= e!697971 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27062 (select (arr!38293 a!3806) from!3184) Nil!27063)))))

(declare-fun b!1229988 () Bool)

(declare-fun res!818470 () Bool)

(assert (=> b!1229988 (=> (not res!818470) (not e!697970))))

(assert (=> b!1229988 (= res!818470 (validKeyInArray!0 (select (arr!38293 a!3806) from!3184)))))

(declare-fun b!1229989 () Bool)

(assert (=> b!1229989 (= e!697968 true)))

(declare-fun lt!559298 () Bool)

(assert (=> b!1229989 (= lt!559298 (contains!7128 lt!559297 (select (arr!38293 a!3806) from!3184)))))

(declare-fun b!1229981 () Bool)

(declare-fun res!818466 () Bool)

(assert (=> b!1229981 (=> (not res!818466) (not e!697970))))

(assert (=> b!1229981 (= res!818466 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!818478 () Bool)

(assert (=> start!102172 (=> (not res!818478) (not e!697970))))

(assert (=> start!102172 (= res!818478 (bvslt (size!38829 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102172 e!697970))

(declare-fun array_inv!29141 (array!79347) Bool)

(assert (=> start!102172 (array_inv!29141 a!3806)))

(assert (=> start!102172 true))

(declare-fun b!1229990 () Bool)

(assert (=> b!1229990 (= e!697970 (not e!697968))))

(declare-fun res!818472 () Bool)

(assert (=> b!1229990 (=> res!818472 e!697968)))

(assert (=> b!1229990 (= res!818472 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229990 (= lt!559297 (Cons!27062 (select (arr!38293 a!3806) from!3184) Nil!27063))))

(assert (=> b!1229990 e!697971))

(declare-fun res!818477 () Bool)

(assert (=> b!1229990 (=> (not res!818477) (not e!697971))))

(assert (=> b!1229990 (= res!818477 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27063))))

(declare-datatypes ((Unit!40752 0))(
  ( (Unit!40753) )
))
(declare-fun lt!559296 () Unit!40752)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79347 List!27066 List!27066 (_ BitVec 32)) Unit!40752)

(assert (=> b!1229990 (= lt!559296 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27063 from!3184))))

(assert (=> b!1229990 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27062 (select (arr!38293 a!3806) from!3184) acc!823))))

(declare-fun b!1229991 () Bool)

(declare-fun res!818473 () Bool)

(assert (=> b!1229991 (=> res!818473 e!697968)))

(assert (=> b!1229991 (= res!818473 (contains!7128 lt!559297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229992 () Bool)

(declare-fun res!818479 () Bool)

(assert (=> b!1229992 (=> (not res!818479) (not e!697970))))

(declare-fun noDuplicate!1725 (List!27066) Bool)

(assert (=> b!1229992 (= res!818479 (noDuplicate!1725 acc!823))))

(declare-fun b!1229993 () Bool)

(declare-fun res!818467 () Bool)

(assert (=> b!1229993 (=> res!818467 e!697968)))

(assert (=> b!1229993 (= res!818467 (not (noDuplicate!1725 lt!559297)))))

(assert (= (and start!102172 res!818478) b!1229980))

(assert (= (and b!1229980 res!818468) b!1229982))

(assert (= (and b!1229982 res!818476) b!1229992))

(assert (= (and b!1229992 res!818479) b!1229985))

(assert (= (and b!1229985 res!818475) b!1229986))

(assert (= (and b!1229986 res!818474) b!1229984))

(assert (= (and b!1229984 res!818471) b!1229981))

(assert (= (and b!1229981 res!818466) b!1229988))

(assert (= (and b!1229988 res!818470) b!1229990))

(assert (= (and b!1229990 res!818477) b!1229987))

(assert (= (and b!1229990 (not res!818472)) b!1229993))

(assert (= (and b!1229993 (not res!818467)) b!1229991))

(assert (= (and b!1229991 (not res!818473)) b!1229983))

(assert (= (and b!1229983 (not res!818469)) b!1229989))

(declare-fun m!1134435 () Bool)

(assert (=> b!1229986 m!1134435))

(declare-fun m!1134437 () Bool)

(assert (=> b!1229990 m!1134437))

(declare-fun m!1134439 () Bool)

(assert (=> b!1229990 m!1134439))

(declare-fun m!1134441 () Bool)

(assert (=> b!1229990 m!1134441))

(declare-fun m!1134443 () Bool)

(assert (=> b!1229990 m!1134443))

(assert (=> b!1229988 m!1134437))

(assert (=> b!1229988 m!1134437))

(declare-fun m!1134445 () Bool)

(assert (=> b!1229988 m!1134445))

(assert (=> b!1229987 m!1134437))

(declare-fun m!1134447 () Bool)

(assert (=> b!1229987 m!1134447))

(declare-fun m!1134449 () Bool)

(assert (=> start!102172 m!1134449))

(declare-fun m!1134451 () Bool)

(assert (=> b!1229993 m!1134451))

(declare-fun m!1134453 () Bool)

(assert (=> b!1229991 m!1134453))

(declare-fun m!1134455 () Bool)

(assert (=> b!1229985 m!1134455))

(declare-fun m!1134457 () Bool)

(assert (=> b!1229992 m!1134457))

(declare-fun m!1134459 () Bool)

(assert (=> b!1229980 m!1134459))

(declare-fun m!1134461 () Bool)

(assert (=> b!1229983 m!1134461))

(assert (=> b!1229989 m!1134437))

(assert (=> b!1229989 m!1134437))

(declare-fun m!1134463 () Bool)

(assert (=> b!1229989 m!1134463))

(declare-fun m!1134465 () Bool)

(assert (=> b!1229984 m!1134465))

(declare-fun m!1134467 () Bool)

(assert (=> b!1229981 m!1134467))

(push 1)

(assert (not b!1229992))

(assert (not b!1229990))

(assert (not b!1229983))

(assert (not b!1229985))

(assert (not b!1229986))

(assert (not b!1229987))

(assert (not b!1229988))

(assert (not b!1229980))

(assert (not b!1229989))

(assert (not b!1229984))

(assert (not start!102172))

(assert (not b!1229993))

(assert (not b!1229991))

(assert (not b!1229981))

(check-sat)

