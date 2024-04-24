; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62614 () Bool)

(assert start!62614)

(declare-fun b!705461 () Bool)

(declare-fun res!469184 () Bool)

(declare-fun e!397928 () Bool)

(assert (=> b!705461 (=> (not res!469184) (not e!397928))))

(declare-datatypes ((array!40233 0))(
  ( (array!40234 (arr!19270 (Array (_ BitVec 32) (_ BitVec 64))) (size!19653 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40233)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705461 (= res!469184 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705462 () Bool)

(declare-fun res!469185 () Bool)

(assert (=> b!705462 (=> (not res!469185) (not e!397928))))

(assert (=> b!705462 (= res!469185 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705463 () Bool)

(declare-fun res!469177 () Bool)

(assert (=> b!705463 (=> (not res!469177) (not e!397928))))

(declare-datatypes ((List!13218 0))(
  ( (Nil!13215) (Cons!13214 (h!14262 (_ BitVec 64)) (t!19492 List!13218)) )
))
(declare-fun acc!652 () List!13218)

(declare-fun contains!3870 (List!13218 (_ BitVec 64)) Bool)

(assert (=> b!705463 (= res!469177 (not (contains!3870 acc!652 k0!2824)))))

(declare-fun b!705464 () Bool)

(declare-fun res!469174 () Bool)

(assert (=> b!705464 (=> (not res!469174) (not e!397928))))

(declare-fun newAcc!49 () List!13218)

(assert (=> b!705464 (= res!469174 (not (contains!3870 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705466 () Bool)

(declare-fun res!469176 () Bool)

(assert (=> b!705466 (=> (not res!469176) (not e!397928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705466 (= res!469176 (validKeyInArray!0 k0!2824))))

(declare-fun b!705467 () Bool)

(declare-fun res!469178 () Bool)

(assert (=> b!705467 (=> (not res!469178) (not e!397928))))

(assert (=> b!705467 (= res!469178 (not (contains!3870 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705468 () Bool)

(declare-fun res!469182 () Bool)

(assert (=> b!705468 (=> (not res!469182) (not e!397928))))

(declare-fun -!302 (List!13218 (_ BitVec 64)) List!13218)

(assert (=> b!705468 (= res!469182 (= (-!302 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705469 () Bool)

(declare-fun res!469181 () Bool)

(assert (=> b!705469 (=> (not res!469181) (not e!397928))))

(assert (=> b!705469 (= res!469181 (contains!3870 newAcc!49 k0!2824))))

(declare-fun b!705470 () Bool)

(declare-fun res!469173 () Bool)

(assert (=> b!705470 (=> (not res!469173) (not e!397928))))

(assert (=> b!705470 (= res!469173 (not (contains!3870 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705471 () Bool)

(assert (=> b!705471 (= e!397928 false)))

(declare-fun lt!317988 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40233 (_ BitVec 32) List!13218) Bool)

(assert (=> b!705471 (= lt!317988 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705465 () Bool)

(declare-fun res!469172 () Bool)

(assert (=> b!705465 (=> (not res!469172) (not e!397928))))

(assert (=> b!705465 (= res!469172 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!469180 () Bool)

(assert (=> start!62614 (=> (not res!469180) (not e!397928))))

(assert (=> start!62614 (= res!469180 (and (bvslt (size!19653 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19653 a!3591))))))

(assert (=> start!62614 e!397928))

(assert (=> start!62614 true))

(declare-fun array_inv!15129 (array!40233) Bool)

(assert (=> start!62614 (array_inv!15129 a!3591)))

(declare-fun b!705472 () Bool)

(declare-fun res!469179 () Bool)

(assert (=> b!705472 (=> (not res!469179) (not e!397928))))

(assert (=> b!705472 (= res!469179 (not (validKeyInArray!0 (select (arr!19270 a!3591) from!2969))))))

(declare-fun b!705473 () Bool)

(declare-fun res!469186 () Bool)

(assert (=> b!705473 (=> (not res!469186) (not e!397928))))

(assert (=> b!705473 (= res!469186 (not (contains!3870 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705474 () Bool)

(declare-fun res!469183 () Bool)

(assert (=> b!705474 (=> (not res!469183) (not e!397928))))

(assert (=> b!705474 (= res!469183 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19653 a!3591)))))

(declare-fun b!705475 () Bool)

(declare-fun res!469188 () Bool)

(assert (=> b!705475 (=> (not res!469188) (not e!397928))))

(assert (=> b!705475 (= res!469188 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705476 () Bool)

(declare-fun res!469187 () Bool)

(assert (=> b!705476 (=> (not res!469187) (not e!397928))))

(declare-fun noDuplicate!1144 (List!13218) Bool)

(assert (=> b!705476 (= res!469187 (noDuplicate!1144 acc!652))))

(declare-fun b!705477 () Bool)

(declare-fun res!469175 () Bool)

(assert (=> b!705477 (=> (not res!469175) (not e!397928))))

(declare-fun subseq!338 (List!13218 List!13218) Bool)

(assert (=> b!705477 (= res!469175 (subseq!338 acc!652 newAcc!49))))

(declare-fun b!705478 () Bool)

(declare-fun res!469189 () Bool)

(assert (=> b!705478 (=> (not res!469189) (not e!397928))))

(assert (=> b!705478 (= res!469189 (noDuplicate!1144 newAcc!49))))

(assert (= (and start!62614 res!469180) b!705476))

(assert (= (and b!705476 res!469187) b!705478))

(assert (= (and b!705478 res!469189) b!705470))

(assert (= (and b!705470 res!469173) b!705473))

(assert (= (and b!705473 res!469186) b!705462))

(assert (= (and b!705462 res!469185) b!705463))

(assert (= (and b!705463 res!469177) b!705466))

(assert (= (and b!705466 res!469176) b!705465))

(assert (= (and b!705465 res!469172) b!705477))

(assert (= (and b!705477 res!469175) b!705469))

(assert (= (and b!705469 res!469181) b!705468))

(assert (= (and b!705468 res!469182) b!705467))

(assert (= (and b!705467 res!469178) b!705464))

(assert (= (and b!705464 res!469174) b!705474))

(assert (= (and b!705474 res!469183) b!705472))

(assert (= (and b!705472 res!469179) b!705475))

(assert (= (and b!705475 res!469188) b!705461))

(assert (= (and b!705461 res!469184) b!705471))

(declare-fun m!664143 () Bool)

(assert (=> b!705469 m!664143))

(declare-fun m!664145 () Bool)

(assert (=> b!705470 m!664145))

(declare-fun m!664147 () Bool)

(assert (=> b!705473 m!664147))

(declare-fun m!664149 () Bool)

(assert (=> b!705461 m!664149))

(declare-fun m!664151 () Bool)

(assert (=> b!705477 m!664151))

(declare-fun m!664153 () Bool)

(assert (=> b!705466 m!664153))

(declare-fun m!664155 () Bool)

(assert (=> b!705465 m!664155))

(declare-fun m!664157 () Bool)

(assert (=> start!62614 m!664157))

(declare-fun m!664159 () Bool)

(assert (=> b!705468 m!664159))

(declare-fun m!664161 () Bool)

(assert (=> b!705462 m!664161))

(declare-fun m!664163 () Bool)

(assert (=> b!705478 m!664163))

(declare-fun m!664165 () Bool)

(assert (=> b!705471 m!664165))

(declare-fun m!664167 () Bool)

(assert (=> b!705463 m!664167))

(declare-fun m!664169 () Bool)

(assert (=> b!705476 m!664169))

(declare-fun m!664171 () Bool)

(assert (=> b!705467 m!664171))

(declare-fun m!664173 () Bool)

(assert (=> b!705464 m!664173))

(declare-fun m!664175 () Bool)

(assert (=> b!705472 m!664175))

(assert (=> b!705472 m!664175))

(declare-fun m!664177 () Bool)

(assert (=> b!705472 m!664177))

(check-sat (not b!705472) (not b!705464) (not start!62614) (not b!705473) (not b!705476) (not b!705462) (not b!705466) (not b!705470) (not b!705467) (not b!705477) (not b!705461) (not b!705469) (not b!705471) (not b!705463) (not b!705468) (not b!705478) (not b!705465))
(check-sat)
