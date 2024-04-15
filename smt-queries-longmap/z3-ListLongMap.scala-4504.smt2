; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62480 () Bool)

(assert start!62480)

(declare-fun b!703198 () Bool)

(declare-fun res!467173 () Bool)

(declare-fun e!397433 () Bool)

(assert (=> b!703198 (=> (not res!467173) (not e!397433))))

(declare-datatypes ((List!13321 0))(
  ( (Nil!13318) (Cons!13317 (h!14362 (_ BitVec 64)) (t!19594 List!13321)) )
))
(declare-fun acc!652 () List!13321)

(declare-fun contains!3843 (List!13321 (_ BitVec 64)) Bool)

(assert (=> b!703198 (= res!467173 (not (contains!3843 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703199 () Bool)

(declare-fun res!467181 () Bool)

(assert (=> b!703199 (=> (not res!467181) (not e!397433))))

(declare-datatypes ((array!40170 0))(
  ( (array!40171 (arr!19241 (Array (_ BitVec 32) (_ BitVec 64))) (size!19623 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40170)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703199 (= res!467181 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703200 () Bool)

(declare-fun res!467185 () Bool)

(assert (=> b!703200 (=> (not res!467185) (not e!397433))))

(declare-fun newAcc!49 () List!13321)

(declare-fun -!270 (List!13321 (_ BitVec 64)) List!13321)

(assert (=> b!703200 (= res!467185 (= (-!270 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703201 () Bool)

(declare-fun res!467175 () Bool)

(assert (=> b!703201 (=> (not res!467175) (not e!397433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703201 (= res!467175 (validKeyInArray!0 k0!2824))))

(declare-fun b!703202 () Bool)

(declare-fun res!467183 () Bool)

(assert (=> b!703202 (=> (not res!467183) (not e!397433))))

(assert (=> b!703202 (= res!467183 (not (contains!3843 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703204 () Bool)

(declare-fun res!467184 () Bool)

(assert (=> b!703204 (=> (not res!467184) (not e!397433))))

(declare-fun arrayNoDuplicates!0 (array!40170 (_ BitVec 32) List!13321) Bool)

(assert (=> b!703204 (= res!467184 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703205 () Bool)

(declare-fun res!467180 () Bool)

(assert (=> b!703205 (=> (not res!467180) (not e!397433))))

(assert (=> b!703205 (= res!467180 (not (validKeyInArray!0 (select (arr!19241 a!3591) from!2969))))))

(declare-fun b!703206 () Bool)

(declare-fun res!467177 () Bool)

(assert (=> b!703206 (=> (not res!467177) (not e!397433))))

(assert (=> b!703206 (= res!467177 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703207 () Bool)

(declare-fun res!467178 () Bool)

(assert (=> b!703207 (=> (not res!467178) (not e!397433))))

(assert (=> b!703207 (= res!467178 (not (contains!3843 acc!652 k0!2824)))))

(declare-fun b!703208 () Bool)

(declare-fun res!467171 () Bool)

(assert (=> b!703208 (=> (not res!467171) (not e!397433))))

(declare-fun noDuplicate!1112 (List!13321) Bool)

(assert (=> b!703208 (= res!467171 (noDuplicate!1112 newAcc!49))))

(declare-fun b!703209 () Bool)

(declare-fun res!467176 () Bool)

(assert (=> b!703209 (=> (not res!467176) (not e!397433))))

(declare-fun subseq!305 (List!13321 List!13321) Bool)

(assert (=> b!703209 (= res!467176 (subseq!305 acc!652 newAcc!49))))

(declare-fun res!467172 () Bool)

(assert (=> start!62480 (=> (not res!467172) (not e!397433))))

(assert (=> start!62480 (= res!467172 (and (bvslt (size!19623 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19623 a!3591))))))

(assert (=> start!62480 e!397433))

(assert (=> start!62480 true))

(declare-fun array_inv!15124 (array!40170) Bool)

(assert (=> start!62480 (array_inv!15124 a!3591)))

(declare-fun b!703203 () Bool)

(declare-fun res!467169 () Bool)

(assert (=> b!703203 (=> (not res!467169) (not e!397433))))

(assert (=> b!703203 (= res!467169 (noDuplicate!1112 acc!652))))

(declare-fun b!703210 () Bool)

(declare-fun res!467170 () Bool)

(assert (=> b!703210 (=> (not res!467170) (not e!397433))))

(assert (=> b!703210 (= res!467170 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703211 () Bool)

(declare-fun res!467182 () Bool)

(assert (=> b!703211 (=> (not res!467182) (not e!397433))))

(assert (=> b!703211 (= res!467182 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19623 a!3591)))))

(declare-fun b!703212 () Bool)

(declare-fun res!467168 () Bool)

(assert (=> b!703212 (=> (not res!467168) (not e!397433))))

(assert (=> b!703212 (= res!467168 (not (contains!3843 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703213 () Bool)

(assert (=> b!703213 (= e!397433 false)))

(declare-fun lt!317538 () Bool)

(assert (=> b!703213 (= lt!317538 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703214 () Bool)

(declare-fun res!467174 () Bool)

(assert (=> b!703214 (=> (not res!467174) (not e!397433))))

(assert (=> b!703214 (= res!467174 (not (contains!3843 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703215 () Bool)

(declare-fun res!467179 () Bool)

(assert (=> b!703215 (=> (not res!467179) (not e!397433))))

(assert (=> b!703215 (= res!467179 (contains!3843 newAcc!49 k0!2824))))

(assert (= (and start!62480 res!467172) b!703203))

(assert (= (and b!703203 res!467169) b!703208))

(assert (= (and b!703208 res!467171) b!703198))

(assert (= (and b!703198 res!467173) b!703212))

(assert (= (and b!703212 res!467168) b!703210))

(assert (= (and b!703210 res!467170) b!703207))

(assert (= (and b!703207 res!467178) b!703201))

(assert (= (and b!703201 res!467175) b!703204))

(assert (= (and b!703204 res!467184) b!703209))

(assert (= (and b!703209 res!467176) b!703215))

(assert (= (and b!703215 res!467179) b!703200))

(assert (= (and b!703200 res!467185) b!703214))

(assert (= (and b!703214 res!467174) b!703202))

(assert (= (and b!703202 res!467183) b!703211))

(assert (= (and b!703211 res!467182) b!703205))

(assert (= (and b!703205 res!467180) b!703206))

(assert (= (and b!703206 res!467177) b!703199))

(assert (= (and b!703199 res!467181) b!703213))

(declare-fun m!661539 () Bool)

(assert (=> b!703200 m!661539))

(declare-fun m!661541 () Bool)

(assert (=> b!703202 m!661541))

(declare-fun m!661543 () Bool)

(assert (=> b!703205 m!661543))

(assert (=> b!703205 m!661543))

(declare-fun m!661545 () Bool)

(assert (=> b!703205 m!661545))

(declare-fun m!661547 () Bool)

(assert (=> b!703199 m!661547))

(declare-fun m!661549 () Bool)

(assert (=> b!703207 m!661549))

(declare-fun m!661551 () Bool)

(assert (=> b!703204 m!661551))

(declare-fun m!661553 () Bool)

(assert (=> b!703209 m!661553))

(declare-fun m!661555 () Bool)

(assert (=> b!703212 m!661555))

(declare-fun m!661557 () Bool)

(assert (=> b!703210 m!661557))

(declare-fun m!661559 () Bool)

(assert (=> b!703213 m!661559))

(declare-fun m!661561 () Bool)

(assert (=> b!703215 m!661561))

(declare-fun m!661563 () Bool)

(assert (=> start!62480 m!661563))

(declare-fun m!661565 () Bool)

(assert (=> b!703214 m!661565))

(declare-fun m!661567 () Bool)

(assert (=> b!703198 m!661567))

(declare-fun m!661569 () Bool)

(assert (=> b!703203 m!661569))

(declare-fun m!661571 () Bool)

(assert (=> b!703201 m!661571))

(declare-fun m!661573 () Bool)

(assert (=> b!703208 m!661573))

(check-sat (not b!703208) (not start!62480) (not b!703199) (not b!703209) (not b!703203) (not b!703215) (not b!703198) (not b!703201) (not b!703214) (not b!703204) (not b!703205) (not b!703213) (not b!703202) (not b!703210) (not b!703212) (not b!703207) (not b!703200))
(check-sat)
