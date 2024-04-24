; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63430 () Bool)

(assert start!63430)

(declare-fun b!714154 () Bool)

(declare-fun res!477120 () Bool)

(declare-fun e!401493 () Bool)

(assert (=> b!714154 (=> (not res!477120) (not e!401493))))

(declare-datatypes ((List!13320 0))(
  ( (Nil!13317) (Cons!13316 (h!14364 (_ BitVec 64)) (t!19627 List!13320)) )
))
(declare-fun acc!652 () List!13320)

(declare-fun noDuplicate!1246 (List!13320) Bool)

(assert (=> b!714154 (= res!477120 (noDuplicate!1246 acc!652))))

(declare-fun b!714155 () Bool)

(declare-fun res!477119 () Bool)

(assert (=> b!714155 (=> (not res!477119) (not e!401493))))

(declare-fun newAcc!49 () List!13320)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3972 (List!13320 (_ BitVec 64)) Bool)

(assert (=> b!714155 (= res!477119 (contains!3972 newAcc!49 k0!2824))))

(declare-fun b!714156 () Bool)

(declare-fun res!477123 () Bool)

(assert (=> b!714156 (=> (not res!477123) (not e!401493))))

(declare-fun -!404 (List!13320 (_ BitVec 64)) List!13320)

(assert (=> b!714156 (= res!477123 (= (-!404 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714157 () Bool)

(declare-fun res!477118 () Bool)

(assert (=> b!714157 (=> (not res!477118) (not e!401493))))

(declare-fun subseq!440 (List!13320 List!13320) Bool)

(assert (=> b!714157 (= res!477118 (subseq!440 acc!652 newAcc!49))))

(declare-fun b!714159 () Bool)

(declare-fun res!477122 () Bool)

(assert (=> b!714159 (=> (not res!477122) (not e!401493))))

(declare-datatypes ((array!40470 0))(
  ( (array!40471 (arr!19372 (Array (_ BitVec 32) (_ BitVec 64))) (size!19784 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40470)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40470 (_ BitVec 32) List!13320) Bool)

(assert (=> b!714159 (= res!477122 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714160 () Bool)

(declare-fun res!477126 () Bool)

(assert (=> b!714160 (=> (not res!477126) (not e!401493))))

(assert (=> b!714160 (= res!477126 (not (contains!3972 acc!652 k0!2824)))))

(declare-fun b!714161 () Bool)

(assert (=> b!714161 (= e!401493 false)))

(declare-fun lt!318840 () Bool)

(assert (=> b!714161 (= lt!318840 (contains!3972 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714162 () Bool)

(declare-fun res!477117 () Bool)

(assert (=> b!714162 (=> (not res!477117) (not e!401493))))

(declare-fun arrayContainsKey!0 (array!40470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714162 (= res!477117 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714158 () Bool)

(declare-fun res!477115 () Bool)

(assert (=> b!714158 (=> (not res!477115) (not e!401493))))

(assert (=> b!714158 (= res!477115 (not (contains!3972 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477124 () Bool)

(assert (=> start!63430 (=> (not res!477124) (not e!401493))))

(assert (=> start!63430 (= res!477124 (and (bvslt (size!19784 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19784 a!3591))))))

(assert (=> start!63430 e!401493))

(assert (=> start!63430 true))

(declare-fun array_inv!15231 (array!40470) Bool)

(assert (=> start!63430 (array_inv!15231 a!3591)))

(declare-fun b!714163 () Bool)

(declare-fun res!477116 () Bool)

(assert (=> b!714163 (=> (not res!477116) (not e!401493))))

(assert (=> b!714163 (= res!477116 (not (contains!3972 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714164 () Bool)

(declare-fun res!477121 () Bool)

(assert (=> b!714164 (=> (not res!477121) (not e!401493))))

(assert (=> b!714164 (= res!477121 (noDuplicate!1246 newAcc!49))))

(declare-fun b!714165 () Bool)

(declare-fun res!477127 () Bool)

(assert (=> b!714165 (=> (not res!477127) (not e!401493))))

(assert (=> b!714165 (= res!477127 (not (contains!3972 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714166 () Bool)

(declare-fun res!477125 () Bool)

(assert (=> b!714166 (=> (not res!477125) (not e!401493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714166 (= res!477125 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63430 res!477124) b!714154))

(assert (= (and b!714154 res!477120) b!714164))

(assert (= (and b!714164 res!477121) b!714165))

(assert (= (and b!714165 res!477127) b!714163))

(assert (= (and b!714163 res!477116) b!714162))

(assert (= (and b!714162 res!477117) b!714160))

(assert (= (and b!714160 res!477126) b!714166))

(assert (= (and b!714166 res!477125) b!714159))

(assert (= (and b!714159 res!477122) b!714157))

(assert (= (and b!714157 res!477118) b!714155))

(assert (= (and b!714155 res!477119) b!714156))

(assert (= (and b!714156 res!477123) b!714158))

(assert (= (and b!714158 res!477115) b!714161))

(declare-fun m!671325 () Bool)

(assert (=> b!714156 m!671325))

(declare-fun m!671327 () Bool)

(assert (=> b!714164 m!671327))

(declare-fun m!671329 () Bool)

(assert (=> b!714161 m!671329))

(declare-fun m!671331 () Bool)

(assert (=> b!714166 m!671331))

(declare-fun m!671333 () Bool)

(assert (=> b!714157 m!671333))

(declare-fun m!671335 () Bool)

(assert (=> b!714162 m!671335))

(declare-fun m!671337 () Bool)

(assert (=> b!714155 m!671337))

(declare-fun m!671339 () Bool)

(assert (=> b!714163 m!671339))

(declare-fun m!671341 () Bool)

(assert (=> start!63430 m!671341))

(declare-fun m!671343 () Bool)

(assert (=> b!714159 m!671343))

(declare-fun m!671345 () Bool)

(assert (=> b!714160 m!671345))

(declare-fun m!671347 () Bool)

(assert (=> b!714158 m!671347))

(declare-fun m!671349 () Bool)

(assert (=> b!714165 m!671349))

(declare-fun m!671351 () Bool)

(assert (=> b!714154 m!671351))

(check-sat (not b!714162) (not b!714156) (not b!714160) (not b!714161) (not b!714158) (not b!714165) (not b!714155) (not b!714157) (not start!63430) (not b!714164) (not b!714166) (not b!714163) (not b!714154) (not b!714159))
(check-sat)
