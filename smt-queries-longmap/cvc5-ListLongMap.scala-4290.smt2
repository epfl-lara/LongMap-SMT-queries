; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59768 () Bool)

(assert start!59768)

(declare-fun b!660211 () Bool)

(declare-fun e!379383 () Bool)

(assert (=> b!660211 (= e!379383 false)))

(declare-fun lt!308758 () Bool)

(declare-datatypes ((array!38815 0))(
  ( (array!38816 (arr!18600 (Array (_ BitVec 32) (_ BitVec 64))) (size!18964 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38815)

(declare-datatypes ((List!12641 0))(
  ( (Nil!12638) (Cons!12637 (h!13682 (_ BitVec 64)) (t!18869 List!12641)) )
))
(declare-fun arrayNoDuplicates!0 (array!38815 (_ BitVec 32) List!12641) Bool)

(assert (=> b!660211 (= lt!308758 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12638))))

(declare-fun b!660212 () Bool)

(declare-fun res!428276 () Bool)

(assert (=> b!660212 (=> (not res!428276) (not e!379383))))

(declare-fun acc!681 () List!12641)

(declare-fun contains!3218 (List!12641 (_ BitVec 64)) Bool)

(assert (=> b!660212 (= res!428276 (not (contains!3218 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660213 () Bool)

(declare-fun e!379382 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660213 (= e!379382 (not (contains!3218 acc!681 k!2843)))))

(declare-fun b!660214 () Bool)

(declare-fun e!379385 () Bool)

(assert (=> b!660214 (= e!379385 e!379382)))

(declare-fun res!428278 () Bool)

(assert (=> b!660214 (=> (not res!428278) (not e!379382))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660214 (= res!428278 (bvsle from!3004 i!1382))))

(declare-fun b!660215 () Bool)

(declare-fun res!428280 () Bool)

(assert (=> b!660215 (=> (not res!428280) (not e!379383))))

(assert (=> b!660215 (= res!428280 e!379385)))

(declare-fun res!428281 () Bool)

(assert (=> b!660215 (=> res!428281 e!379385)))

(declare-fun e!379384 () Bool)

(assert (=> b!660215 (= res!428281 e!379384)))

(declare-fun res!428282 () Bool)

(assert (=> b!660215 (=> (not res!428282) (not e!379384))))

(assert (=> b!660215 (= res!428282 (bvsgt from!3004 i!1382))))

(declare-fun b!660216 () Bool)

(assert (=> b!660216 (= e!379384 (contains!3218 acc!681 k!2843))))

(declare-fun res!428277 () Bool)

(assert (=> start!59768 (=> (not res!428277) (not e!379383))))

(assert (=> start!59768 (= res!428277 (and (bvslt (size!18964 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18964 a!3626))))))

(assert (=> start!59768 e!379383))

(assert (=> start!59768 true))

(declare-fun array_inv!14396 (array!38815) Bool)

(assert (=> start!59768 (array_inv!14396 a!3626)))

(declare-fun b!660217 () Bool)

(declare-fun res!428275 () Bool)

(assert (=> b!660217 (=> (not res!428275) (not e!379383))))

(assert (=> b!660217 (= res!428275 (not (contains!3218 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660218 () Bool)

(declare-fun res!428279 () Bool)

(assert (=> b!660218 (=> (not res!428279) (not e!379383))))

(declare-fun noDuplicate!465 (List!12641) Bool)

(assert (=> b!660218 (= res!428279 (noDuplicate!465 acc!681))))

(assert (= (and start!59768 res!428277) b!660218))

(assert (= (and b!660218 res!428279) b!660217))

(assert (= (and b!660217 res!428275) b!660212))

(assert (= (and b!660212 res!428276) b!660215))

(assert (= (and b!660215 res!428282) b!660216))

(assert (= (and b!660215 (not res!428281)) b!660214))

(assert (= (and b!660214 res!428278) b!660213))

(assert (= (and b!660215 res!428280) b!660211))

(declare-fun m!633005 () Bool)

(assert (=> b!660216 m!633005))

(declare-fun m!633007 () Bool)

(assert (=> b!660217 m!633007))

(declare-fun m!633009 () Bool)

(assert (=> b!660218 m!633009))

(declare-fun m!633011 () Bool)

(assert (=> b!660211 m!633011))

(declare-fun m!633013 () Bool)

(assert (=> b!660212 m!633013))

(assert (=> b!660213 m!633005))

(declare-fun m!633015 () Bool)

(assert (=> start!59768 m!633015))

(push 1)

(assert (not b!660217))

(assert (not b!660212))

(assert (not b!660211))

(assert (not start!59768))

(assert (not b!660213))

(assert (not b!660216))

(assert (not b!660218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

