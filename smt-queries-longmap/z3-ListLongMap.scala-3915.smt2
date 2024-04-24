; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53550 () Bool)

(assert start!53550)

(declare-fun b!582500 () Bool)

(declare-fun res!370217 () Bool)

(declare-fun e!334070 () Bool)

(assert (=> b!582500 (=> (not res!370217) (not e!334070))))

(declare-datatypes ((array!36396 0))(
  ( (array!36397 (arr!17470 (Array (_ BitVec 32) (_ BitVec 64))) (size!17834 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36396)

(declare-datatypes ((List!11418 0))(
  ( (Nil!11415) (Cons!11414 (h!12462 (_ BitVec 64)) (t!17638 List!11418)) )
))
(declare-fun arrayNoDuplicates!0 (array!36396 (_ BitVec 32) List!11418) Bool)

(assert (=> b!582500 (= res!370217 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11415))))

(declare-fun b!582501 () Bool)

(declare-fun res!370216 () Bool)

(assert (=> b!582501 (=> (not res!370216) (not e!334070))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582501 (= res!370216 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17470 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17470 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582502 () Bool)

(declare-fun res!370214 () Bool)

(declare-fun e!334069 () Bool)

(assert (=> b!582502 (=> (not res!370214) (not e!334069))))

(declare-fun arrayContainsKey!0 (array!36396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582502 (= res!370214 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582503 () Bool)

(declare-fun res!370211 () Bool)

(assert (=> b!582503 (=> (not res!370211) (not e!334069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582503 (= res!370211 (validKeyInArray!0 k0!1786))))

(declare-fun b!582504 () Bool)

(assert (=> b!582504 (= e!334069 e!334070)))

(declare-fun res!370218 () Bool)

(assert (=> b!582504 (=> (not res!370218) (not e!334070))))

(declare-datatypes ((SeekEntryResult!5866 0))(
  ( (MissingZero!5866 (index!25691 (_ BitVec 32))) (Found!5866 (index!25692 (_ BitVec 32))) (Intermediate!5866 (undefined!6678 Bool) (index!25693 (_ BitVec 32)) (x!54698 (_ BitVec 32))) (Undefined!5866) (MissingVacant!5866 (index!25694 (_ BitVec 32))) )
))
(declare-fun lt!265195 () SeekEntryResult!5866)

(assert (=> b!582504 (= res!370218 (or (= lt!265195 (MissingZero!5866 i!1108)) (= lt!265195 (MissingVacant!5866 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36396 (_ BitVec 32)) SeekEntryResult!5866)

(assert (=> b!582504 (= lt!265195 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!370219 () Bool)

(assert (=> start!53550 (=> (not res!370219) (not e!334069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53550 (= res!370219 (validMask!0 mask!3053))))

(assert (=> start!53550 e!334069))

(assert (=> start!53550 true))

(declare-fun array_inv!13329 (array!36396) Bool)

(assert (=> start!53550 (array_inv!13329 a!2986)))

(declare-fun b!582505 () Bool)

(declare-fun res!370213 () Bool)

(assert (=> b!582505 (=> (not res!370213) (not e!334070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36396 (_ BitVec 32)) Bool)

(assert (=> b!582505 (= res!370213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582506 () Bool)

(declare-fun res!370215 () Bool)

(assert (=> b!582506 (=> (not res!370215) (not e!334069))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582506 (= res!370215 (validKeyInArray!0 (select (arr!17470 a!2986) j!136)))))

(declare-fun b!582507 () Bool)

(assert (=> b!582507 (= e!334070 false)))

(declare-fun lt!265194 () SeekEntryResult!5866)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36396 (_ BitVec 32)) SeekEntryResult!5866)

(assert (=> b!582507 (= lt!265194 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17470 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582508 () Bool)

(declare-fun res!370212 () Bool)

(assert (=> b!582508 (=> (not res!370212) (not e!334069))))

(assert (=> b!582508 (= res!370212 (and (= (size!17834 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17834 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17834 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53550 res!370219) b!582508))

(assert (= (and b!582508 res!370212) b!582506))

(assert (= (and b!582506 res!370215) b!582503))

(assert (= (and b!582503 res!370211) b!582502))

(assert (= (and b!582502 res!370214) b!582504))

(assert (= (and b!582504 res!370218) b!582505))

(assert (= (and b!582505 res!370213) b!582500))

(assert (= (and b!582500 res!370217) b!582501))

(assert (= (and b!582501 res!370216) b!582507))

(declare-fun m!561161 () Bool)

(assert (=> b!582506 m!561161))

(assert (=> b!582506 m!561161))

(declare-fun m!561163 () Bool)

(assert (=> b!582506 m!561163))

(declare-fun m!561165 () Bool)

(assert (=> b!582504 m!561165))

(declare-fun m!561167 () Bool)

(assert (=> b!582500 m!561167))

(declare-fun m!561169 () Bool)

(assert (=> b!582501 m!561169))

(declare-fun m!561171 () Bool)

(assert (=> b!582501 m!561171))

(declare-fun m!561173 () Bool)

(assert (=> b!582501 m!561173))

(declare-fun m!561175 () Bool)

(assert (=> start!53550 m!561175))

(declare-fun m!561177 () Bool)

(assert (=> start!53550 m!561177))

(assert (=> b!582507 m!561161))

(assert (=> b!582507 m!561161))

(declare-fun m!561179 () Bool)

(assert (=> b!582507 m!561179))

(declare-fun m!561181 () Bool)

(assert (=> b!582503 m!561181))

(declare-fun m!561183 () Bool)

(assert (=> b!582502 m!561183))

(declare-fun m!561185 () Bool)

(assert (=> b!582505 m!561185))

(check-sat (not b!582507) (not b!582506) (not b!582504) (not b!582505) (not b!582503) (not b!582502) (not b!582500) (not start!53550))
(check-sat)
