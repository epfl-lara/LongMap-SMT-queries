; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53214 () Bool)

(assert start!53214)

(declare-fun b!578438 () Bool)

(declare-fun res!366254 () Bool)

(declare-fun e!332653 () Bool)

(assert (=> b!578438 (=> (not res!366254) (not e!332653))))

(declare-datatypes ((array!36115 0))(
  ( (array!36116 (arr!17332 (Array (_ BitVec 32) (_ BitVec 64))) (size!17696 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36115)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36115 (_ BitVec 32)) Bool)

(assert (=> b!578438 (= res!366254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578439 () Bool)

(declare-fun e!332654 () Bool)

(assert (=> b!578439 (= e!332654 e!332653)))

(declare-fun res!366258 () Bool)

(assert (=> b!578439 (=> (not res!366258) (not e!332653))))

(declare-datatypes ((SeekEntryResult!5772 0))(
  ( (MissingZero!5772 (index!25315 (_ BitVec 32))) (Found!5772 (index!25316 (_ BitVec 32))) (Intermediate!5772 (undefined!6584 Bool) (index!25317 (_ BitVec 32)) (x!54217 (_ BitVec 32))) (Undefined!5772) (MissingVacant!5772 (index!25318 (_ BitVec 32))) )
))
(declare-fun lt!264262 () SeekEntryResult!5772)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578439 (= res!366258 (or (= lt!264262 (MissingZero!5772 i!1108)) (= lt!264262 (MissingVacant!5772 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36115 (_ BitVec 32)) SeekEntryResult!5772)

(assert (=> b!578439 (= lt!264262 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578440 () Bool)

(declare-fun res!366257 () Bool)

(assert (=> b!578440 (=> (not res!366257) (not e!332654))))

(declare-fun arrayContainsKey!0 (array!36115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578440 (= res!366257 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578441 () Bool)

(declare-fun res!366256 () Bool)

(assert (=> b!578441 (=> (not res!366256) (not e!332654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578441 (= res!366256 (validKeyInArray!0 k0!1786))))

(declare-fun res!366260 () Bool)

(assert (=> start!53214 (=> (not res!366260) (not e!332654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53214 (= res!366260 (validMask!0 mask!3053))))

(assert (=> start!53214 e!332654))

(assert (=> start!53214 true))

(declare-fun array_inv!13128 (array!36115) Bool)

(assert (=> start!53214 (array_inv!13128 a!2986)))

(declare-fun b!578442 () Bool)

(declare-fun res!366259 () Bool)

(assert (=> b!578442 (=> (not res!366259) (not e!332654))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578442 (= res!366259 (and (= (size!17696 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17696 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17696 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578443 () Bool)

(assert (=> b!578443 (= e!332653 false)))

(declare-fun lt!264261 () Bool)

(declare-datatypes ((List!11373 0))(
  ( (Nil!11370) (Cons!11369 (h!12414 (_ BitVec 64)) (t!17601 List!11373)) )
))
(declare-fun arrayNoDuplicates!0 (array!36115 (_ BitVec 32) List!11373) Bool)

(assert (=> b!578443 (= lt!264261 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11370))))

(declare-fun b!578444 () Bool)

(declare-fun res!366255 () Bool)

(assert (=> b!578444 (=> (not res!366255) (not e!332654))))

(assert (=> b!578444 (= res!366255 (validKeyInArray!0 (select (arr!17332 a!2986) j!136)))))

(assert (= (and start!53214 res!366260) b!578442))

(assert (= (and b!578442 res!366259) b!578444))

(assert (= (and b!578444 res!366255) b!578441))

(assert (= (and b!578441 res!366256) b!578440))

(assert (= (and b!578440 res!366257) b!578439))

(assert (= (and b!578439 res!366258) b!578438))

(assert (= (and b!578438 res!366254) b!578443))

(declare-fun m!557125 () Bool)

(assert (=> start!53214 m!557125))

(declare-fun m!557127 () Bool)

(assert (=> start!53214 m!557127))

(declare-fun m!557129 () Bool)

(assert (=> b!578441 m!557129))

(declare-fun m!557131 () Bool)

(assert (=> b!578443 m!557131))

(declare-fun m!557133 () Bool)

(assert (=> b!578438 m!557133))

(declare-fun m!557135 () Bool)

(assert (=> b!578444 m!557135))

(assert (=> b!578444 m!557135))

(declare-fun m!557137 () Bool)

(assert (=> b!578444 m!557137))

(declare-fun m!557139 () Bool)

(assert (=> b!578440 m!557139))

(declare-fun m!557141 () Bool)

(assert (=> b!578439 m!557141))

(check-sat (not b!578438) (not b!578444) (not b!578439) (not b!578443) (not start!53214) (not b!578441) (not b!578440))
(check-sat)
