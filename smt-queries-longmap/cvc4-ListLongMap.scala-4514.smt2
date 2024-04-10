; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62556 () Bool)

(assert start!62556)

(declare-fun b!705214 () Bool)

(declare-fun res!469026 () Bool)

(declare-fun e!397806 () Bool)

(assert (=> b!705214 (=> (not res!469026) (not e!397806))))

(declare-datatypes ((array!40235 0))(
  ( (array!40236 (arr!19274 (Array (_ BitVec 32) (_ BitVec 64))) (size!19659 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40235)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705214 (= res!469026 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705215 () Bool)

(declare-fun res!469041 () Bool)

(assert (=> b!705215 (=> (not res!469041) (not e!397806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705215 (= res!469041 (validKeyInArray!0 k!2824))))

(declare-fun b!705216 () Bool)

(declare-fun res!469031 () Bool)

(assert (=> b!705216 (=> (not res!469031) (not e!397806))))

(assert (=> b!705216 (= res!469031 (not (validKeyInArray!0 (select (arr!19274 a!3591) from!2969))))))

(declare-fun b!705217 () Bool)

(declare-fun res!469024 () Bool)

(assert (=> b!705217 (=> (not res!469024) (not e!397806))))

(declare-datatypes ((List!13315 0))(
  ( (Nil!13312) (Cons!13311 (h!14356 (_ BitVec 64)) (t!19597 List!13315)) )
))
(declare-fun newAcc!49 () List!13315)

(declare-fun acc!652 () List!13315)

(declare-fun -!302 (List!13315 (_ BitVec 64)) List!13315)

(assert (=> b!705217 (= res!469024 (= (-!302 newAcc!49 k!2824) acc!652))))

(declare-fun b!705218 () Bool)

(declare-fun res!469033 () Bool)

(assert (=> b!705218 (=> (not res!469033) (not e!397806))))

(declare-fun contains!3892 (List!13315 (_ BitVec 64)) Bool)

(assert (=> b!705218 (= res!469033 (not (contains!3892 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705219 () Bool)

(declare-fun res!469038 () Bool)

(assert (=> b!705219 (=> (not res!469038) (not e!397806))))

(assert (=> b!705219 (= res!469038 (contains!3892 newAcc!49 k!2824))))

(declare-fun b!705220 () Bool)

(declare-fun res!469030 () Bool)

(assert (=> b!705220 (=> (not res!469030) (not e!397806))))

(assert (=> b!705220 (= res!469030 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705221 () Bool)

(declare-fun res!469032 () Bool)

(assert (=> b!705221 (=> (not res!469032) (not e!397806))))

(declare-fun noDuplicate!1139 (List!13315) Bool)

(assert (=> b!705221 (= res!469032 (noDuplicate!1139 newAcc!49))))

(declare-fun b!705222 () Bool)

(declare-fun res!469037 () Bool)

(assert (=> b!705222 (=> (not res!469037) (not e!397806))))

(assert (=> b!705222 (= res!469037 (noDuplicate!1139 acc!652))))

(declare-fun b!705223 () Bool)

(assert (=> b!705223 (= e!397806 false)))

(declare-fun lt!317886 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40235 (_ BitVec 32) List!13315) Bool)

(assert (=> b!705223 (= lt!317886 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705224 () Bool)

(declare-fun res!469036 () Bool)

(assert (=> b!705224 (=> (not res!469036) (not e!397806))))

(assert (=> b!705224 (= res!469036 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705225 () Bool)

(declare-fun res!469034 () Bool)

(assert (=> b!705225 (=> (not res!469034) (not e!397806))))

(assert (=> b!705225 (= res!469034 (not (contains!3892 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705226 () Bool)

(declare-fun res!469035 () Bool)

(assert (=> b!705226 (=> (not res!469035) (not e!397806))))

(assert (=> b!705226 (= res!469035 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705227 () Bool)

(declare-fun res!469027 () Bool)

(assert (=> b!705227 (=> (not res!469027) (not e!397806))))

(assert (=> b!705227 (= res!469027 (not (contains!3892 acc!652 k!2824)))))

(declare-fun b!705228 () Bool)

(declare-fun res!469028 () Bool)

(assert (=> b!705228 (=> (not res!469028) (not e!397806))))

(declare-fun subseq!337 (List!13315 List!13315) Bool)

(assert (=> b!705228 (= res!469028 (subseq!337 acc!652 newAcc!49))))

(declare-fun b!705229 () Bool)

(declare-fun res!469029 () Bool)

(assert (=> b!705229 (=> (not res!469029) (not e!397806))))

(assert (=> b!705229 (= res!469029 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19659 a!3591)))))

(declare-fun b!705230 () Bool)

(declare-fun res!469039 () Bool)

(assert (=> b!705230 (=> (not res!469039) (not e!397806))))

(assert (=> b!705230 (= res!469039 (not (contains!3892 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!469040 () Bool)

(assert (=> start!62556 (=> (not res!469040) (not e!397806))))

(assert (=> start!62556 (= res!469040 (and (bvslt (size!19659 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19659 a!3591))))))

(assert (=> start!62556 e!397806))

(assert (=> start!62556 true))

(declare-fun array_inv!15070 (array!40235) Bool)

(assert (=> start!62556 (array_inv!15070 a!3591)))

(declare-fun b!705231 () Bool)

(declare-fun res!469025 () Bool)

(assert (=> b!705231 (=> (not res!469025) (not e!397806))))

(assert (=> b!705231 (= res!469025 (not (contains!3892 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62556 res!469040) b!705222))

(assert (= (and b!705222 res!469037) b!705221))

(assert (= (and b!705221 res!469032) b!705230))

(assert (= (and b!705230 res!469039) b!705225))

(assert (= (and b!705225 res!469034) b!705220))

(assert (= (and b!705220 res!469030) b!705227))

(assert (= (and b!705227 res!469027) b!705215))

(assert (= (and b!705215 res!469041) b!705224))

(assert (= (and b!705224 res!469036) b!705228))

(assert (= (and b!705228 res!469028) b!705219))

(assert (= (and b!705219 res!469038) b!705217))

(assert (= (and b!705217 res!469024) b!705231))

(assert (= (and b!705231 res!469025) b!705218))

(assert (= (and b!705218 res!469033) b!705229))

(assert (= (and b!705229 res!469029) b!705216))

(assert (= (and b!705216 res!469031) b!705226))

(assert (= (and b!705226 res!469035) b!705214))

(assert (= (and b!705214 res!469026) b!705223))

(declare-fun m!663451 () Bool)

(assert (=> b!705221 m!663451))

(declare-fun m!663453 () Bool)

(assert (=> b!705230 m!663453))

(declare-fun m!663455 () Bool)

(assert (=> b!705216 m!663455))

(assert (=> b!705216 m!663455))

(declare-fun m!663457 () Bool)

(assert (=> b!705216 m!663457))

(declare-fun m!663459 () Bool)

(assert (=> b!705220 m!663459))

(declare-fun m!663461 () Bool)

(assert (=> b!705217 m!663461))

(declare-fun m!663463 () Bool)

(assert (=> b!705223 m!663463))

(declare-fun m!663465 () Bool)

(assert (=> b!705231 m!663465))

(declare-fun m!663467 () Bool)

(assert (=> b!705215 m!663467))

(declare-fun m!663469 () Bool)

(assert (=> b!705228 m!663469))

(declare-fun m!663471 () Bool)

(assert (=> b!705224 m!663471))

(declare-fun m!663473 () Bool)

(assert (=> start!62556 m!663473))

(declare-fun m!663475 () Bool)

(assert (=> b!705219 m!663475))

(declare-fun m!663477 () Bool)

(assert (=> b!705218 m!663477))

(declare-fun m!663479 () Bool)

(assert (=> b!705222 m!663479))

(declare-fun m!663481 () Bool)

(assert (=> b!705214 m!663481))

(declare-fun m!663483 () Bool)

(assert (=> b!705225 m!663483))

(declare-fun m!663485 () Bool)

(assert (=> b!705227 m!663485))

(push 1)

(assert (not b!705230))

(assert (not b!705228))

(assert (not b!705224))

(assert (not b!705215))

(assert (not start!62556))

(assert (not b!705219))

(assert (not b!705220))

(assert (not b!705221))

(assert (not b!705225))

(assert (not b!705231))

(assert (not b!705227))

(assert (not b!705214))

(assert (not b!705216))

(assert (not b!705223))

(assert (not b!705218))

(assert (not b!705222))

(assert (not b!705217))

(check-sat)

