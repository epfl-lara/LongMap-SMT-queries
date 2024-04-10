; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59830 () Bool)

(assert start!59830)

(declare-fun b!661174 () Bool)

(declare-fun res!429243 () Bool)

(declare-fun e!379847 () Bool)

(assert (=> b!661174 (=> (not res!429243) (not e!379847))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38877 0))(
  ( (array!38878 (arr!18631 (Array (_ BitVec 32) (_ BitVec 64))) (size!18995 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38877)

(assert (=> b!661174 (= res!429243 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18995 a!3626))))))

(declare-fun b!661175 () Bool)

(declare-fun res!429251 () Bool)

(assert (=> b!661175 (=> (not res!429251) (not e!379847))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661175 (= res!429251 (validKeyInArray!0 k0!2843))))

(declare-fun b!661176 () Bool)

(declare-fun res!429241 () Bool)

(assert (=> b!661176 (=> (not res!429241) (not e!379847))))

(declare-fun arrayContainsKey!0 (array!38877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661176 (= res!429241 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661177 () Bool)

(declare-fun e!379850 () Bool)

(declare-datatypes ((List!12672 0))(
  ( (Nil!12669) (Cons!12668 (h!13713 (_ BitVec 64)) (t!18900 List!12672)) )
))
(declare-fun acc!681 () List!12672)

(declare-fun contains!3249 (List!12672 (_ BitVec 64)) Bool)

(assert (=> b!661177 (= e!379850 (contains!3249 acc!681 k0!2843))))

(declare-fun b!661178 () Bool)

(declare-fun res!429250 () Bool)

(assert (=> b!661178 (=> (not res!429250) (not e!379847))))

(assert (=> b!661178 (= res!429250 (not (contains!3249 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429238 () Bool)

(assert (=> start!59830 (=> (not res!429238) (not e!379847))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59830 (= res!429238 (and (bvslt (size!18995 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18995 a!3626))))))

(assert (=> start!59830 e!379847))

(assert (=> start!59830 true))

(declare-fun array_inv!14427 (array!38877) Bool)

(assert (=> start!59830 (array_inv!14427 a!3626)))

(declare-fun b!661179 () Bool)

(declare-fun res!429245 () Bool)

(assert (=> b!661179 (=> (not res!429245) (not e!379847))))

(declare-fun arrayNoDuplicates!0 (array!38877 (_ BitVec 32) List!12672) Bool)

(assert (=> b!661179 (= res!429245 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12669))))

(declare-fun b!661180 () Bool)

(declare-fun res!429240 () Bool)

(assert (=> b!661180 (=> (not res!429240) (not e!379847))))

(declare-fun noDuplicate!496 (List!12672) Bool)

(assert (=> b!661180 (= res!429240 (noDuplicate!496 acc!681))))

(declare-fun b!661181 () Bool)

(declare-fun res!429242 () Bool)

(assert (=> b!661181 (=> (not res!429242) (not e!379847))))

(assert (=> b!661181 (= res!429242 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18995 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661182 () Bool)

(declare-fun e!379849 () Bool)

(assert (=> b!661182 (= e!379849 (not (contains!3249 acc!681 k0!2843)))))

(declare-fun b!661183 () Bool)

(declare-fun res!429249 () Bool)

(assert (=> b!661183 (=> (not res!429249) (not e!379847))))

(declare-fun e!379848 () Bool)

(assert (=> b!661183 (= res!429249 e!379848)))

(declare-fun res!429247 () Bool)

(assert (=> b!661183 (=> res!429247 e!379848)))

(assert (=> b!661183 (= res!429247 e!379850)))

(declare-fun res!429246 () Bool)

(assert (=> b!661183 (=> (not res!429246) (not e!379850))))

(assert (=> b!661183 (= res!429246 (bvsgt from!3004 i!1382))))

(declare-fun b!661184 () Bool)

(assert (=> b!661184 (= e!379847 (not true))))

(assert (=> b!661184 (arrayContainsKey!0 (array!38878 (store (arr!18631 a!3626) i!1382 k0!2843) (size!18995 a!3626)) k0!2843 from!3004)))

(declare-fun b!661185 () Bool)

(declare-fun res!429244 () Bool)

(assert (=> b!661185 (=> (not res!429244) (not e!379847))))

(assert (=> b!661185 (= res!429244 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661186 () Bool)

(assert (=> b!661186 (= e!379848 e!379849)))

(declare-fun res!429248 () Bool)

(assert (=> b!661186 (=> (not res!429248) (not e!379849))))

(assert (=> b!661186 (= res!429248 (bvsle from!3004 i!1382))))

(declare-fun b!661187 () Bool)

(declare-fun res!429239 () Bool)

(assert (=> b!661187 (=> (not res!429239) (not e!379847))))

(assert (=> b!661187 (= res!429239 (not (contains!3249 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59830 res!429238) b!661180))

(assert (= (and b!661180 res!429240) b!661178))

(assert (= (and b!661178 res!429250) b!661187))

(assert (= (and b!661187 res!429239) b!661183))

(assert (= (and b!661183 res!429246) b!661177))

(assert (= (and b!661183 (not res!429247)) b!661186))

(assert (= (and b!661186 res!429248) b!661182))

(assert (= (and b!661183 res!429249) b!661179))

(assert (= (and b!661179 res!429245) b!661185))

(assert (= (and b!661185 res!429244) b!661174))

(assert (= (and b!661174 res!429243) b!661175))

(assert (= (and b!661175 res!429251) b!661176))

(assert (= (and b!661176 res!429241) b!661181))

(assert (= (and b!661181 res!429242) b!661184))

(declare-fun m!633489 () Bool)

(assert (=> b!661175 m!633489))

(declare-fun m!633491 () Bool)

(assert (=> b!661179 m!633491))

(declare-fun m!633493 () Bool)

(assert (=> b!661185 m!633493))

(declare-fun m!633495 () Bool)

(assert (=> b!661184 m!633495))

(declare-fun m!633497 () Bool)

(assert (=> b!661184 m!633497))

(declare-fun m!633499 () Bool)

(assert (=> b!661182 m!633499))

(declare-fun m!633501 () Bool)

(assert (=> b!661187 m!633501))

(declare-fun m!633503 () Bool)

(assert (=> b!661176 m!633503))

(assert (=> b!661177 m!633499))

(declare-fun m!633505 () Bool)

(assert (=> b!661180 m!633505))

(declare-fun m!633507 () Bool)

(assert (=> start!59830 m!633507))

(declare-fun m!633509 () Bool)

(assert (=> b!661178 m!633509))

(check-sat (not b!661176) (not b!661179) (not b!661187) (not b!661180) (not start!59830) (not b!661177) (not b!661175) (not b!661185) (not b!661182) (not b!661184) (not b!661178))
