; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53184 () Bool)

(assert start!53184)

(declare-fun b!578020 () Bool)

(declare-fun res!365981 () Bool)

(declare-fun e!332417 () Bool)

(assert (=> b!578020 (=> (not res!365981) (not e!332417))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578020 (= res!365981 (validKeyInArray!0 k0!1786))))

(declare-fun res!365984 () Bool)

(assert (=> start!53184 (=> (not res!365984) (not e!332417))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53184 (= res!365984 (validMask!0 mask!3053))))

(assert (=> start!53184 e!332417))

(assert (=> start!53184 true))

(declare-datatypes ((array!36099 0))(
  ( (array!36100 (arr!17324 (Array (_ BitVec 32) (_ BitVec 64))) (size!17689 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36099)

(declare-fun array_inv!13207 (array!36099) Bool)

(assert (=> start!53184 (array_inv!13207 a!2986)))

(declare-fun b!578021 () Bool)

(declare-fun res!365980 () Bool)

(declare-fun e!332418 () Bool)

(assert (=> b!578021 (=> (not res!365980) (not e!332418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36099 (_ BitVec 32)) Bool)

(assert (=> b!578021 (= res!365980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578022 () Bool)

(assert (=> b!578022 (= e!332418 false)))

(declare-fun lt!263986 () Bool)

(declare-datatypes ((List!11404 0))(
  ( (Nil!11401) (Cons!11400 (h!12445 (_ BitVec 64)) (t!17623 List!11404)) )
))
(declare-fun arrayNoDuplicates!0 (array!36099 (_ BitVec 32) List!11404) Bool)

(assert (=> b!578022 (= lt!263986 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11401))))

(declare-fun b!578023 () Bool)

(declare-fun res!365983 () Bool)

(assert (=> b!578023 (=> (not res!365983) (not e!332417))))

(declare-fun arrayContainsKey!0 (array!36099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578023 (= res!365983 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578024 () Bool)

(declare-fun res!365982 () Bool)

(assert (=> b!578024 (=> (not res!365982) (not e!332417))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578024 (= res!365982 (and (= (size!17689 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17689 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17689 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578025 () Bool)

(assert (=> b!578025 (= e!332417 e!332418)))

(declare-fun res!365979 () Bool)

(assert (=> b!578025 (=> (not res!365979) (not e!332418))))

(declare-datatypes ((SeekEntryResult!5761 0))(
  ( (MissingZero!5761 (index!25271 (_ BitVec 32))) (Found!5761 (index!25272 (_ BitVec 32))) (Intermediate!5761 (undefined!6573 Bool) (index!25273 (_ BitVec 32)) (x!54185 (_ BitVec 32))) (Undefined!5761) (MissingVacant!5761 (index!25274 (_ BitVec 32))) )
))
(declare-fun lt!263985 () SeekEntryResult!5761)

(assert (=> b!578025 (= res!365979 (or (= lt!263985 (MissingZero!5761 i!1108)) (= lt!263985 (MissingVacant!5761 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36099 (_ BitVec 32)) SeekEntryResult!5761)

(assert (=> b!578025 (= lt!263985 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578026 () Bool)

(declare-fun res!365978 () Bool)

(assert (=> b!578026 (=> (not res!365978) (not e!332417))))

(assert (=> b!578026 (= res!365978 (validKeyInArray!0 (select (arr!17324 a!2986) j!136)))))

(assert (= (and start!53184 res!365984) b!578024))

(assert (= (and b!578024 res!365982) b!578026))

(assert (= (and b!578026 res!365978) b!578020))

(assert (= (and b!578020 res!365981) b!578023))

(assert (= (and b!578023 res!365983) b!578025))

(assert (= (and b!578025 res!365979) b!578021))

(assert (= (and b!578021 res!365980) b!578022))

(declare-fun m!556213 () Bool)

(assert (=> b!578021 m!556213))

(declare-fun m!556215 () Bool)

(assert (=> b!578025 m!556215))

(declare-fun m!556217 () Bool)

(assert (=> b!578022 m!556217))

(declare-fun m!556219 () Bool)

(assert (=> b!578026 m!556219))

(assert (=> b!578026 m!556219))

(declare-fun m!556221 () Bool)

(assert (=> b!578026 m!556221))

(declare-fun m!556223 () Bool)

(assert (=> start!53184 m!556223))

(declare-fun m!556225 () Bool)

(assert (=> start!53184 m!556225))

(declare-fun m!556227 () Bool)

(assert (=> b!578020 m!556227))

(declare-fun m!556229 () Bool)

(assert (=> b!578023 m!556229))

(check-sat (not start!53184) (not b!578021) (not b!578023) (not b!578020) (not b!578022) (not b!578025) (not b!578026))
(check-sat)
