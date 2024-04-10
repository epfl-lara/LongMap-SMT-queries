; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68290 () Bool)

(assert start!68290)

(declare-fun b!793326 () Bool)

(declare-fun res!537850 () Bool)

(declare-fun e!440719 () Bool)

(assert (=> b!793326 (=> (not res!537850) (not e!440719))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43080 0))(
  ( (array!43081 (arr!20620 (Array (_ BitVec 32) (_ BitVec 64))) (size!21041 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43080)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793326 (= res!537850 (and (= (size!21041 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21041 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21041 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793327 () Bool)

(declare-fun res!537844 () Bool)

(declare-fun e!440718 () Bool)

(assert (=> b!793327 (=> (not res!537844) (not e!440718))))

(declare-datatypes ((List!14583 0))(
  ( (Nil!14580) (Cons!14579 (h!15708 (_ BitVec 64)) (t!20898 List!14583)) )
))
(declare-fun arrayNoDuplicates!0 (array!43080 (_ BitVec 32) List!14583) Bool)

(assert (=> b!793327 (= res!537844 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14580))))

(declare-fun b!793328 () Bool)

(declare-fun res!537846 () Bool)

(assert (=> b!793328 (=> (not res!537846) (not e!440719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793328 (= res!537846 (validKeyInArray!0 (select (arr!20620 a!3170) j!153)))))

(declare-fun b!793329 () Bool)

(assert (=> b!793329 (= e!440719 e!440718)))

(declare-fun res!537849 () Bool)

(assert (=> b!793329 (=> (not res!537849) (not e!440718))))

(declare-datatypes ((SeekEntryResult!8211 0))(
  ( (MissingZero!8211 (index!35212 (_ BitVec 32))) (Found!8211 (index!35213 (_ BitVec 32))) (Intermediate!8211 (undefined!9023 Bool) (index!35214 (_ BitVec 32)) (x!66153 (_ BitVec 32))) (Undefined!8211) (MissingVacant!8211 (index!35215 (_ BitVec 32))) )
))
(declare-fun lt!353690 () SeekEntryResult!8211)

(assert (=> b!793329 (= res!537849 (or (= lt!353690 (MissingZero!8211 i!1163)) (= lt!353690 (MissingVacant!8211 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43080 (_ BitVec 32)) SeekEntryResult!8211)

(assert (=> b!793329 (= lt!353690 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793330 () Bool)

(declare-fun res!537851 () Bool)

(assert (=> b!793330 (=> (not res!537851) (not e!440719))))

(assert (=> b!793330 (= res!537851 (validKeyInArray!0 k0!2044))))

(declare-fun res!537847 () Bool)

(assert (=> start!68290 (=> (not res!537847) (not e!440719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68290 (= res!537847 (validMask!0 mask!3266))))

(assert (=> start!68290 e!440719))

(assert (=> start!68290 true))

(declare-fun array_inv!16416 (array!43080) Bool)

(assert (=> start!68290 (array_inv!16416 a!3170)))

(declare-fun b!793325 () Bool)

(declare-fun res!537845 () Bool)

(assert (=> b!793325 (=> (not res!537845) (not e!440718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43080 (_ BitVec 32)) Bool)

(assert (=> b!793325 (= res!537845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793331 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793331 (= e!440718 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21041 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20620 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21041 a!3170)) (= (select (arr!20620 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793332 () Bool)

(declare-fun res!537848 () Bool)

(assert (=> b!793332 (=> (not res!537848) (not e!440719))))

(declare-fun arrayContainsKey!0 (array!43080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793332 (= res!537848 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68290 res!537847) b!793326))

(assert (= (and b!793326 res!537850) b!793328))

(assert (= (and b!793328 res!537846) b!793330))

(assert (= (and b!793330 res!537851) b!793332))

(assert (= (and b!793332 res!537848) b!793329))

(assert (= (and b!793329 res!537849) b!793325))

(assert (= (and b!793325 res!537845) b!793327))

(assert (= (and b!793327 res!537844) b!793331))

(declare-fun m!733791 () Bool)

(assert (=> b!793328 m!733791))

(assert (=> b!793328 m!733791))

(declare-fun m!733793 () Bool)

(assert (=> b!793328 m!733793))

(declare-fun m!733795 () Bool)

(assert (=> b!793327 m!733795))

(declare-fun m!733797 () Bool)

(assert (=> b!793325 m!733797))

(declare-fun m!733799 () Bool)

(assert (=> b!793329 m!733799))

(declare-fun m!733801 () Bool)

(assert (=> b!793332 m!733801))

(declare-fun m!733803 () Bool)

(assert (=> b!793331 m!733803))

(declare-fun m!733805 () Bool)

(assert (=> b!793331 m!733805))

(declare-fun m!733807 () Bool)

(assert (=> b!793330 m!733807))

(declare-fun m!733809 () Bool)

(assert (=> start!68290 m!733809))

(declare-fun m!733811 () Bool)

(assert (=> start!68290 m!733811))

(check-sat (not b!793327) (not b!793329) (not b!793325) (not b!793330) (not b!793328) (not b!793332) (not start!68290))
(check-sat)
