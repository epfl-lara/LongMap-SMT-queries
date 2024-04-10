; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53202 () Bool)

(assert start!53202)

(declare-fun res!366128 () Bool)

(declare-fun e!332600 () Bool)

(assert (=> start!53202 (=> (not res!366128) (not e!332600))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53202 (= res!366128 (validMask!0 mask!3053))))

(assert (=> start!53202 e!332600))

(assert (=> start!53202 true))

(declare-datatypes ((array!36103 0))(
  ( (array!36104 (arr!17326 (Array (_ BitVec 32) (_ BitVec 64))) (size!17690 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36103)

(declare-fun array_inv!13122 (array!36103) Bool)

(assert (=> start!53202 (array_inv!13122 a!2986)))

(declare-fun b!578312 () Bool)

(declare-fun res!366131 () Bool)

(assert (=> b!578312 (=> (not res!366131) (not e!332600))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578312 (= res!366131 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578313 () Bool)

(declare-fun res!366130 () Bool)

(assert (=> b!578313 (=> (not res!366130) (not e!332600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578313 (= res!366130 (validKeyInArray!0 k0!1786))))

(declare-fun b!578314 () Bool)

(declare-fun res!366132 () Bool)

(declare-fun e!332601 () Bool)

(assert (=> b!578314 (=> (not res!366132) (not e!332601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36103 (_ BitVec 32)) Bool)

(assert (=> b!578314 (= res!366132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578315 () Bool)

(declare-fun res!366129 () Bool)

(assert (=> b!578315 (=> (not res!366129) (not e!332600))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578315 (= res!366129 (validKeyInArray!0 (select (arr!17326 a!2986) j!136)))))

(declare-fun b!578316 () Bool)

(declare-fun res!366133 () Bool)

(assert (=> b!578316 (=> (not res!366133) (not e!332600))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578316 (= res!366133 (and (= (size!17690 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17690 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17690 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578317 () Bool)

(assert (=> b!578317 (= e!332600 e!332601)))

(declare-fun res!366134 () Bool)

(assert (=> b!578317 (=> (not res!366134) (not e!332601))))

(declare-datatypes ((SeekEntryResult!5766 0))(
  ( (MissingZero!5766 (index!25291 (_ BitVec 32))) (Found!5766 (index!25292 (_ BitVec 32))) (Intermediate!5766 (undefined!6578 Bool) (index!25293 (_ BitVec 32)) (x!54195 (_ BitVec 32))) (Undefined!5766) (MissingVacant!5766 (index!25294 (_ BitVec 32))) )
))
(declare-fun lt!264225 () SeekEntryResult!5766)

(assert (=> b!578317 (= res!366134 (or (= lt!264225 (MissingZero!5766 i!1108)) (= lt!264225 (MissingVacant!5766 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36103 (_ BitVec 32)) SeekEntryResult!5766)

(assert (=> b!578317 (= lt!264225 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578318 () Bool)

(assert (=> b!578318 (= e!332601 false)))

(declare-fun lt!264226 () Bool)

(declare-datatypes ((List!11367 0))(
  ( (Nil!11364) (Cons!11363 (h!12408 (_ BitVec 64)) (t!17595 List!11367)) )
))
(declare-fun arrayNoDuplicates!0 (array!36103 (_ BitVec 32) List!11367) Bool)

(assert (=> b!578318 (= lt!264226 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11364))))

(assert (= (and start!53202 res!366128) b!578316))

(assert (= (and b!578316 res!366133) b!578315))

(assert (= (and b!578315 res!366129) b!578313))

(assert (= (and b!578313 res!366130) b!578312))

(assert (= (and b!578312 res!366131) b!578317))

(assert (= (and b!578317 res!366134) b!578314))

(assert (= (and b!578314 res!366132) b!578318))

(declare-fun m!557017 () Bool)

(assert (=> b!578318 m!557017))

(declare-fun m!557019 () Bool)

(assert (=> start!53202 m!557019))

(declare-fun m!557021 () Bool)

(assert (=> start!53202 m!557021))

(declare-fun m!557023 () Bool)

(assert (=> b!578317 m!557023))

(declare-fun m!557025 () Bool)

(assert (=> b!578312 m!557025))

(declare-fun m!557027 () Bool)

(assert (=> b!578313 m!557027))

(declare-fun m!557029 () Bool)

(assert (=> b!578315 m!557029))

(assert (=> b!578315 m!557029))

(declare-fun m!557031 () Bool)

(assert (=> b!578315 m!557031))

(declare-fun m!557033 () Bool)

(assert (=> b!578314 m!557033))

(check-sat (not start!53202) (not b!578312) (not b!578317) (not b!578318) (not b!578314) (not b!578315) (not b!578313))
(check-sat)
