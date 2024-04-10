; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53272 () Bool)

(assert start!53272)

(declare-fun b!579186 () Bool)

(declare-fun res!367010 () Bool)

(declare-fun e!332915 () Bool)

(assert (=> b!579186 (=> (not res!367010) (not e!332915))))

(declare-datatypes ((array!36173 0))(
  ( (array!36174 (arr!17361 (Array (_ BitVec 32) (_ BitVec 64))) (size!17725 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36173)

(declare-datatypes ((List!11402 0))(
  ( (Nil!11399) (Cons!11398 (h!12443 (_ BitVec 64)) (t!17630 List!11402)) )
))
(declare-fun arrayNoDuplicates!0 (array!36173 (_ BitVec 32) List!11402) Bool)

(assert (=> b!579186 (= res!367010 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11399))))

(declare-fun b!579187 () Bool)

(assert (=> b!579187 (= e!332915 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5801 0))(
  ( (MissingZero!5801 (index!25431 (_ BitVec 32))) (Found!5801 (index!25432 (_ BitVec 32))) (Intermediate!5801 (undefined!6613 Bool) (index!25433 (_ BitVec 32)) (x!54326 (_ BitVec 32))) (Undefined!5801) (MissingVacant!5801 (index!25434 (_ BitVec 32))) )
))
(declare-fun lt!264427 () SeekEntryResult!5801)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36173 (_ BitVec 32)) SeekEntryResult!5801)

(assert (=> b!579187 (= lt!264427 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17361 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579188 () Bool)

(declare-fun res!367005 () Bool)

(assert (=> b!579188 (=> (not res!367005) (not e!332915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36173 (_ BitVec 32)) Bool)

(assert (=> b!579188 (= res!367005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579189 () Bool)

(declare-fun res!367007 () Bool)

(assert (=> b!579189 (=> (not res!367007) (not e!332915))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579189 (= res!367007 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17361 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17361 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579191 () Bool)

(declare-fun res!367002 () Bool)

(declare-fun e!332914 () Bool)

(assert (=> b!579191 (=> (not res!367002) (not e!332914))))

(assert (=> b!579191 (= res!367002 (and (= (size!17725 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17725 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17725 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579192 () Bool)

(declare-fun res!367003 () Bool)

(assert (=> b!579192 (=> (not res!367003) (not e!332914))))

(declare-fun arrayContainsKey!0 (array!36173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579192 (= res!367003 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!367009 () Bool)

(assert (=> start!53272 (=> (not res!367009) (not e!332914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53272 (= res!367009 (validMask!0 mask!3053))))

(assert (=> start!53272 e!332914))

(assert (=> start!53272 true))

(declare-fun array_inv!13157 (array!36173) Bool)

(assert (=> start!53272 (array_inv!13157 a!2986)))

(declare-fun b!579190 () Bool)

(declare-fun res!367008 () Bool)

(assert (=> b!579190 (=> (not res!367008) (not e!332914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579190 (= res!367008 (validKeyInArray!0 (select (arr!17361 a!2986) j!136)))))

(declare-fun b!579193 () Bool)

(declare-fun res!367004 () Bool)

(assert (=> b!579193 (=> (not res!367004) (not e!332914))))

(assert (=> b!579193 (= res!367004 (validKeyInArray!0 k!1786))))

(declare-fun b!579194 () Bool)

(assert (=> b!579194 (= e!332914 e!332915)))

(declare-fun res!367006 () Bool)

(assert (=> b!579194 (=> (not res!367006) (not e!332915))))

(declare-fun lt!264426 () SeekEntryResult!5801)

(assert (=> b!579194 (= res!367006 (or (= lt!264426 (MissingZero!5801 i!1108)) (= lt!264426 (MissingVacant!5801 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36173 (_ BitVec 32)) SeekEntryResult!5801)

(assert (=> b!579194 (= lt!264426 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53272 res!367009) b!579191))

(assert (= (and b!579191 res!367002) b!579190))

(assert (= (and b!579190 res!367008) b!579193))

(assert (= (and b!579193 res!367004) b!579192))

(assert (= (and b!579192 res!367003) b!579194))

(assert (= (and b!579194 res!367006) b!579188))

(assert (= (and b!579188 res!367005) b!579186))

(assert (= (and b!579186 res!367010) b!579189))

(assert (= (and b!579189 res!367007) b!579187))

(declare-fun m!557815 () Bool)

(assert (=> start!53272 m!557815))

(declare-fun m!557817 () Bool)

(assert (=> start!53272 m!557817))

(declare-fun m!557819 () Bool)

(assert (=> b!579190 m!557819))

(assert (=> b!579190 m!557819))

(declare-fun m!557821 () Bool)

(assert (=> b!579190 m!557821))

(declare-fun m!557823 () Bool)

(assert (=> b!579189 m!557823))

(declare-fun m!557825 () Bool)

(assert (=> b!579189 m!557825))

(declare-fun m!557827 () Bool)

(assert (=> b!579189 m!557827))

(declare-fun m!557829 () Bool)

(assert (=> b!579194 m!557829))

(assert (=> b!579187 m!557819))

(assert (=> b!579187 m!557819))

(declare-fun m!557831 () Bool)

(assert (=> b!579187 m!557831))

(declare-fun m!557833 () Bool)

(assert (=> b!579193 m!557833))

(declare-fun m!557835 () Bool)

(assert (=> b!579188 m!557835))

(declare-fun m!557837 () Bool)

(assert (=> b!579192 m!557837))

(declare-fun m!557839 () Bool)

(assert (=> b!579186 m!557839))

(push 1)

(assert (not b!579190))

(assert (not b!579192))

(assert (not b!579188))

(assert (not b!579187))

(assert (not start!53272))

(assert (not b!579186))

(assert (not b!579193))

(assert (not b!579194))

(check-sat)

