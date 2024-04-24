; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53244 () Bool)

(assert start!53244)

(declare-fun b!578428 () Bool)

(declare-fun res!366145 () Bool)

(declare-fun e!332693 () Bool)

(assert (=> b!578428 (=> (not res!366145) (not e!332693))))

(declare-datatypes ((array!36090 0))(
  ( (array!36091 (arr!17317 (Array (_ BitVec 32) (_ BitVec 64))) (size!17681 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36090)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578428 (= res!366145 (validKeyInArray!0 (select (arr!17317 a!2986) j!136)))))

(declare-fun b!578429 () Bool)

(declare-fun res!366143 () Bool)

(assert (=> b!578429 (=> (not res!366143) (not e!332693))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578429 (= res!366143 (and (= (size!17681 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17681 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17681 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578430 () Bool)

(declare-fun res!366139 () Bool)

(assert (=> b!578430 (=> (not res!366139) (not e!332693))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!578430 (= res!366139 (validKeyInArray!0 k0!1786))))

(declare-fun res!366140 () Bool)

(assert (=> start!53244 (=> (not res!366140) (not e!332693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53244 (= res!366140 (validMask!0 mask!3053))))

(assert (=> start!53244 e!332693))

(assert (=> start!53244 true))

(declare-fun array_inv!13176 (array!36090) Bool)

(assert (=> start!53244 (array_inv!13176 a!2986)))

(declare-fun b!578431 () Bool)

(declare-fun res!366142 () Bool)

(assert (=> b!578431 (=> (not res!366142) (not e!332693))))

(declare-fun arrayContainsKey!0 (array!36090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578431 (= res!366142 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578432 () Bool)

(declare-fun e!332694 () Bool)

(assert (=> b!578432 (= e!332694 false)))

(declare-fun lt!264312 () Bool)

(declare-datatypes ((List!11265 0))(
  ( (Nil!11262) (Cons!11261 (h!12309 (_ BitVec 64)) (t!17485 List!11265)) )
))
(declare-fun arrayNoDuplicates!0 (array!36090 (_ BitVec 32) List!11265) Bool)

(assert (=> b!578432 (= lt!264312 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11262))))

(declare-fun b!578433 () Bool)

(declare-fun res!366141 () Bool)

(assert (=> b!578433 (=> (not res!366141) (not e!332694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36090 (_ BitVec 32)) Bool)

(assert (=> b!578433 (= res!366141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578434 () Bool)

(assert (=> b!578434 (= e!332693 e!332694)))

(declare-fun res!366144 () Bool)

(assert (=> b!578434 (=> (not res!366144) (not e!332694))))

(declare-datatypes ((SeekEntryResult!5713 0))(
  ( (MissingZero!5713 (index!25079 (_ BitVec 32))) (Found!5713 (index!25080 (_ BitVec 32))) (Intermediate!5713 (undefined!6525 Bool) (index!25081 (_ BitVec 32)) (x!54137 (_ BitVec 32))) (Undefined!5713) (MissingVacant!5713 (index!25082 (_ BitVec 32))) )
))
(declare-fun lt!264313 () SeekEntryResult!5713)

(assert (=> b!578434 (= res!366144 (or (= lt!264313 (MissingZero!5713 i!1108)) (= lt!264313 (MissingVacant!5713 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36090 (_ BitVec 32)) SeekEntryResult!5713)

(assert (=> b!578434 (= lt!264313 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53244 res!366140) b!578429))

(assert (= (and b!578429 res!366143) b!578428))

(assert (= (and b!578428 res!366145) b!578430))

(assert (= (and b!578430 res!366139) b!578431))

(assert (= (and b!578431 res!366142) b!578434))

(assert (= (and b!578434 res!366144) b!578433))

(assert (= (and b!578433 res!366141) b!578432))

(declare-fun m!557297 () Bool)

(assert (=> b!578430 m!557297))

(declare-fun m!557299 () Bool)

(assert (=> b!578431 m!557299))

(declare-fun m!557301 () Bool)

(assert (=> start!53244 m!557301))

(declare-fun m!557303 () Bool)

(assert (=> start!53244 m!557303))

(declare-fun m!557305 () Bool)

(assert (=> b!578433 m!557305))

(declare-fun m!557307 () Bool)

(assert (=> b!578432 m!557307))

(declare-fun m!557309 () Bool)

(assert (=> b!578434 m!557309))

(declare-fun m!557311 () Bool)

(assert (=> b!578428 m!557311))

(assert (=> b!578428 m!557311))

(declare-fun m!557313 () Bool)

(assert (=> b!578428 m!557313))

(check-sat (not b!578432) (not b!578433) (not b!578434) (not b!578431) (not start!53244) (not b!578428) (not b!578430))
(check-sat)
