; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53220 () Bool)

(assert start!53220)

(declare-fun b!578501 () Bool)

(declare-fun res!366318 () Bool)

(declare-fun e!332681 () Bool)

(assert (=> b!578501 (=> (not res!366318) (not e!332681))))

(declare-datatypes ((array!36121 0))(
  ( (array!36122 (arr!17335 (Array (_ BitVec 32) (_ BitVec 64))) (size!17699 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36121)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36121 (_ BitVec 32)) Bool)

(assert (=> b!578501 (= res!366318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578502 () Bool)

(declare-fun res!366323 () Bool)

(declare-fun e!332682 () Bool)

(assert (=> b!578502 (=> (not res!366323) (not e!332682))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578502 (= res!366323 (validKeyInArray!0 (select (arr!17335 a!2986) j!136)))))

(declare-fun res!366319 () Bool)

(assert (=> start!53220 (=> (not res!366319) (not e!332682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53220 (= res!366319 (validMask!0 mask!3053))))

(assert (=> start!53220 e!332682))

(assert (=> start!53220 true))

(declare-fun array_inv!13131 (array!36121) Bool)

(assert (=> start!53220 (array_inv!13131 a!2986)))

(declare-fun b!578503 () Bool)

(declare-fun res!366322 () Bool)

(assert (=> b!578503 (=> (not res!366322) (not e!332682))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!578503 (= res!366322 (validKeyInArray!0 k0!1786))))

(declare-fun b!578504 () Bool)

(declare-fun res!366320 () Bool)

(assert (=> b!578504 (=> (not res!366320) (not e!332682))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578504 (= res!366320 (and (= (size!17699 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17699 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17699 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578505 () Bool)

(assert (=> b!578505 (= e!332682 e!332681)))

(declare-fun res!366321 () Bool)

(assert (=> b!578505 (=> (not res!366321) (not e!332681))))

(declare-datatypes ((SeekEntryResult!5775 0))(
  ( (MissingZero!5775 (index!25327 (_ BitVec 32))) (Found!5775 (index!25328 (_ BitVec 32))) (Intermediate!5775 (undefined!6587 Bool) (index!25329 (_ BitVec 32)) (x!54228 (_ BitVec 32))) (Undefined!5775) (MissingVacant!5775 (index!25330 (_ BitVec 32))) )
))
(declare-fun lt!264279 () SeekEntryResult!5775)

(assert (=> b!578505 (= res!366321 (or (= lt!264279 (MissingZero!5775 i!1108)) (= lt!264279 (MissingVacant!5775 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36121 (_ BitVec 32)) SeekEntryResult!5775)

(assert (=> b!578505 (= lt!264279 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578506 () Bool)

(declare-fun res!366317 () Bool)

(assert (=> b!578506 (=> (not res!366317) (not e!332682))))

(declare-fun arrayContainsKey!0 (array!36121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578506 (= res!366317 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578507 () Bool)

(assert (=> b!578507 (= e!332681 false)))

(declare-fun lt!264280 () Bool)

(declare-datatypes ((List!11376 0))(
  ( (Nil!11373) (Cons!11372 (h!12417 (_ BitVec 64)) (t!17604 List!11376)) )
))
(declare-fun arrayNoDuplicates!0 (array!36121 (_ BitVec 32) List!11376) Bool)

(assert (=> b!578507 (= lt!264280 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11373))))

(assert (= (and start!53220 res!366319) b!578504))

(assert (= (and b!578504 res!366320) b!578502))

(assert (= (and b!578502 res!366323) b!578503))

(assert (= (and b!578503 res!366322) b!578506))

(assert (= (and b!578506 res!366317) b!578505))

(assert (= (and b!578505 res!366321) b!578501))

(assert (= (and b!578501 res!366318) b!578507))

(declare-fun m!557179 () Bool)

(assert (=> start!53220 m!557179))

(declare-fun m!557181 () Bool)

(assert (=> start!53220 m!557181))

(declare-fun m!557183 () Bool)

(assert (=> b!578506 m!557183))

(declare-fun m!557185 () Bool)

(assert (=> b!578505 m!557185))

(declare-fun m!557187 () Bool)

(assert (=> b!578507 m!557187))

(declare-fun m!557189 () Bool)

(assert (=> b!578503 m!557189))

(declare-fun m!557191 () Bool)

(assert (=> b!578501 m!557191))

(declare-fun m!557193 () Bool)

(assert (=> b!578502 m!557193))

(assert (=> b!578502 m!557193))

(declare-fun m!557195 () Bool)

(assert (=> b!578502 m!557195))

(check-sat (not b!578505) (not b!578507) (not b!578503) (not b!578501) (not b!578502) (not start!53220) (not b!578506))
(check-sat)
