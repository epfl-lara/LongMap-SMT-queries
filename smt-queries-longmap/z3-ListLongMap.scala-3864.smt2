; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53178 () Bool)

(assert start!53178)

(declare-fun b!577957 () Bool)

(declare-fun res!365918 () Bool)

(declare-fun e!332389 () Bool)

(assert (=> b!577957 (=> (not res!365918) (not e!332389))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577957 (= res!365918 (validKeyInArray!0 k0!1786))))

(declare-fun b!577958 () Bool)

(declare-fun res!365920 () Bool)

(declare-fun e!332391 () Bool)

(assert (=> b!577958 (=> (not res!365920) (not e!332391))))

(declare-datatypes ((array!36093 0))(
  ( (array!36094 (arr!17321 (Array (_ BitVec 32) (_ BitVec 64))) (size!17686 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36093)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36093 (_ BitVec 32)) Bool)

(assert (=> b!577958 (= res!365920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!365917 () Bool)

(assert (=> start!53178 (=> (not res!365917) (not e!332389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53178 (= res!365917 (validMask!0 mask!3053))))

(assert (=> start!53178 e!332389))

(assert (=> start!53178 true))

(declare-fun array_inv!13204 (array!36093) Bool)

(assert (=> start!53178 (array_inv!13204 a!2986)))

(declare-fun b!577959 () Bool)

(declare-fun res!365916 () Bool)

(assert (=> b!577959 (=> (not res!365916) (not e!332389))))

(declare-fun arrayContainsKey!0 (array!36093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577959 (= res!365916 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577960 () Bool)

(assert (=> b!577960 (= e!332391 false)))

(declare-fun lt!263967 () Bool)

(declare-datatypes ((List!11401 0))(
  ( (Nil!11398) (Cons!11397 (h!12442 (_ BitVec 64)) (t!17620 List!11401)) )
))
(declare-fun arrayNoDuplicates!0 (array!36093 (_ BitVec 32) List!11401) Bool)

(assert (=> b!577960 (= lt!263967 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11398))))

(declare-fun b!577961 () Bool)

(declare-fun res!365919 () Bool)

(assert (=> b!577961 (=> (not res!365919) (not e!332389))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577961 (= res!365919 (and (= (size!17686 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17686 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17686 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577962 () Bool)

(declare-fun res!365921 () Bool)

(assert (=> b!577962 (=> (not res!365921) (not e!332389))))

(assert (=> b!577962 (= res!365921 (validKeyInArray!0 (select (arr!17321 a!2986) j!136)))))

(declare-fun b!577963 () Bool)

(assert (=> b!577963 (= e!332389 e!332391)))

(declare-fun res!365915 () Bool)

(assert (=> b!577963 (=> (not res!365915) (not e!332391))))

(declare-datatypes ((SeekEntryResult!5758 0))(
  ( (MissingZero!5758 (index!25259 (_ BitVec 32))) (Found!5758 (index!25260 (_ BitVec 32))) (Intermediate!5758 (undefined!6570 Bool) (index!25261 (_ BitVec 32)) (x!54174 (_ BitVec 32))) (Undefined!5758) (MissingVacant!5758 (index!25262 (_ BitVec 32))) )
))
(declare-fun lt!263968 () SeekEntryResult!5758)

(assert (=> b!577963 (= res!365915 (or (= lt!263968 (MissingZero!5758 i!1108)) (= lt!263968 (MissingVacant!5758 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36093 (_ BitVec 32)) SeekEntryResult!5758)

(assert (=> b!577963 (= lt!263968 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53178 res!365917) b!577961))

(assert (= (and b!577961 res!365919) b!577962))

(assert (= (and b!577962 res!365921) b!577957))

(assert (= (and b!577957 res!365918) b!577959))

(assert (= (and b!577959 res!365916) b!577963))

(assert (= (and b!577963 res!365915) b!577958))

(assert (= (and b!577958 res!365920) b!577960))

(declare-fun m!556159 () Bool)

(assert (=> b!577960 m!556159))

(declare-fun m!556161 () Bool)

(assert (=> b!577963 m!556161))

(declare-fun m!556163 () Bool)

(assert (=> b!577957 m!556163))

(declare-fun m!556165 () Bool)

(assert (=> start!53178 m!556165))

(declare-fun m!556167 () Bool)

(assert (=> start!53178 m!556167))

(declare-fun m!556169 () Bool)

(assert (=> b!577958 m!556169))

(declare-fun m!556171 () Bool)

(assert (=> b!577962 m!556171))

(assert (=> b!577962 m!556171))

(declare-fun m!556173 () Bool)

(assert (=> b!577962 m!556173))

(declare-fun m!556175 () Bool)

(assert (=> b!577959 m!556175))

(check-sat (not b!577959) (not b!577963) (not b!577962) (not b!577958) (not b!577960) (not b!577957) (not start!53178))
(check-sat)
