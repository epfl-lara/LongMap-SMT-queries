; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68542 () Bool)

(assert start!68542)

(declare-fun b!797161 () Bool)

(declare-fun res!541684 () Bool)

(declare-fun e!442277 () Bool)

(assert (=> b!797161 (=> (not res!541684) (not e!442277))))

(declare-datatypes ((array!43332 0))(
  ( (array!43333 (arr!20746 (Array (_ BitVec 32) (_ BitVec 64))) (size!21167 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43332)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43332 (_ BitVec 32)) Bool)

(assert (=> b!797161 (= res!541684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797162 () Bool)

(declare-fun e!442275 () Bool)

(assert (=> b!797162 (= e!442277 e!442275)))

(declare-fun res!541687 () Bool)

(assert (=> b!797162 (=> (not res!541687) (not e!442275))))

(declare-datatypes ((SeekEntryResult!8337 0))(
  ( (MissingZero!8337 (index!35716 (_ BitVec 32))) (Found!8337 (index!35717 (_ BitVec 32))) (Intermediate!8337 (undefined!9149 Bool) (index!35718 (_ BitVec 32)) (x!66615 (_ BitVec 32))) (Undefined!8337) (MissingVacant!8337 (index!35719 (_ BitVec 32))) )
))
(declare-fun lt!355588 () SeekEntryResult!8337)

(declare-fun lt!355592 () SeekEntryResult!8337)

(assert (=> b!797162 (= res!541687 (= lt!355588 lt!355592))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355591 () array!43332)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355594 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43332 (_ BitVec 32)) SeekEntryResult!8337)

(assert (=> b!797162 (= lt!355592 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355594 lt!355591 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43332 (_ BitVec 32)) SeekEntryResult!8337)

(assert (=> b!797162 (= lt!355588 (seekEntryOrOpen!0 lt!355594 lt!355591 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797162 (= lt!355594 (select (store (arr!20746 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797162 (= lt!355591 (array!43333 (store (arr!20746 a!3170) i!1163 k0!2044) (size!21167 a!3170)))))

(declare-fun res!541691 () Bool)

(declare-fun e!442272 () Bool)

(assert (=> start!68542 (=> (not res!541691) (not e!442272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68542 (= res!541691 (validMask!0 mask!3266))))

(assert (=> start!68542 e!442272))

(assert (=> start!68542 true))

(declare-fun array_inv!16542 (array!43332) Bool)

(assert (=> start!68542 (array_inv!16542 a!3170)))

(declare-fun b!797163 () Bool)

(declare-fun res!541682 () Bool)

(assert (=> b!797163 (=> (not res!541682) (not e!442277))))

(declare-datatypes ((List!14709 0))(
  ( (Nil!14706) (Cons!14705 (h!15834 (_ BitVec 64)) (t!21024 List!14709)) )
))
(declare-fun arrayNoDuplicates!0 (array!43332 (_ BitVec 32) List!14709) Bool)

(assert (=> b!797163 (= res!541682 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14706))))

(declare-fun b!797164 () Bool)

(declare-fun e!442273 () Bool)

(assert (=> b!797164 (= e!442275 e!442273)))

(declare-fun res!541685 () Bool)

(assert (=> b!797164 (=> (not res!541685) (not e!442273))))

(declare-fun lt!355589 () SeekEntryResult!8337)

(declare-fun lt!355595 () SeekEntryResult!8337)

(assert (=> b!797164 (= res!541685 (= lt!355589 lt!355595))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797164 (= lt!355595 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20746 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797164 (= lt!355589 (seekEntryOrOpen!0 (select (arr!20746 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797165 () Bool)

(declare-fun e!442276 () Bool)

(assert (=> b!797165 (= e!442273 e!442276)))

(declare-fun res!541683 () Bool)

(assert (=> b!797165 (=> (not res!541683) (not e!442276))))

(declare-fun lt!355590 () SeekEntryResult!8337)

(assert (=> b!797165 (= res!541683 (and (= lt!355595 lt!355590) (= (select (arr!20746 a!3170) index!1236) (select (arr!20746 a!3170) j!153))))))

(assert (=> b!797165 (= lt!355590 (Found!8337 j!153))))

(declare-fun b!797166 () Bool)

(assert (=> b!797166 (= e!442276 (not (or (not (= lt!355592 lt!355590)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797166 (= lt!355592 (Found!8337 index!1236))))

(declare-fun b!797167 () Bool)

(declare-fun res!541680 () Bool)

(assert (=> b!797167 (=> (not res!541680) (not e!442272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797167 (= res!541680 (validKeyInArray!0 (select (arr!20746 a!3170) j!153)))))

(declare-fun b!797168 () Bool)

(declare-fun res!541688 () Bool)

(assert (=> b!797168 (=> (not res!541688) (not e!442272))))

(assert (=> b!797168 (= res!541688 (validKeyInArray!0 k0!2044))))

(declare-fun b!797169 () Bool)

(declare-fun res!541690 () Bool)

(assert (=> b!797169 (=> (not res!541690) (not e!442272))))

(assert (=> b!797169 (= res!541690 (and (= (size!21167 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21167 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21167 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797170 () Bool)

(declare-fun res!541689 () Bool)

(assert (=> b!797170 (=> (not res!541689) (not e!442277))))

(assert (=> b!797170 (= res!541689 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21167 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20746 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21167 a!3170)) (= (select (arr!20746 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797171 () Bool)

(assert (=> b!797171 (= e!442272 e!442277)))

(declare-fun res!541686 () Bool)

(assert (=> b!797171 (=> (not res!541686) (not e!442277))))

(declare-fun lt!355593 () SeekEntryResult!8337)

(assert (=> b!797171 (= res!541686 (or (= lt!355593 (MissingZero!8337 i!1163)) (= lt!355593 (MissingVacant!8337 i!1163))))))

(assert (=> b!797171 (= lt!355593 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797172 () Bool)

(declare-fun res!541681 () Bool)

(assert (=> b!797172 (=> (not res!541681) (not e!442272))))

(declare-fun arrayContainsKey!0 (array!43332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797172 (= res!541681 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68542 res!541691) b!797169))

(assert (= (and b!797169 res!541690) b!797167))

(assert (= (and b!797167 res!541680) b!797168))

(assert (= (and b!797168 res!541688) b!797172))

(assert (= (and b!797172 res!541681) b!797171))

(assert (= (and b!797171 res!541686) b!797161))

(assert (= (and b!797161 res!541684) b!797163))

(assert (= (and b!797163 res!541682) b!797170))

(assert (= (and b!797170 res!541689) b!797162))

(assert (= (and b!797162 res!541687) b!797164))

(assert (= (and b!797164 res!541685) b!797165))

(assert (= (and b!797165 res!541683) b!797166))

(declare-fun m!738005 () Bool)

(assert (=> b!797163 m!738005))

(declare-fun m!738007 () Bool)

(assert (=> b!797164 m!738007))

(assert (=> b!797164 m!738007))

(declare-fun m!738009 () Bool)

(assert (=> b!797164 m!738009))

(assert (=> b!797164 m!738007))

(declare-fun m!738011 () Bool)

(assert (=> b!797164 m!738011))

(declare-fun m!738013 () Bool)

(assert (=> b!797162 m!738013))

(declare-fun m!738015 () Bool)

(assert (=> b!797162 m!738015))

(declare-fun m!738017 () Bool)

(assert (=> b!797162 m!738017))

(declare-fun m!738019 () Bool)

(assert (=> b!797162 m!738019))

(assert (=> b!797167 m!738007))

(assert (=> b!797167 m!738007))

(declare-fun m!738021 () Bool)

(assert (=> b!797167 m!738021))

(declare-fun m!738023 () Bool)

(assert (=> b!797168 m!738023))

(declare-fun m!738025 () Bool)

(assert (=> b!797172 m!738025))

(declare-fun m!738027 () Bool)

(assert (=> b!797171 m!738027))

(declare-fun m!738029 () Bool)

(assert (=> start!68542 m!738029))

(declare-fun m!738031 () Bool)

(assert (=> start!68542 m!738031))

(declare-fun m!738033 () Bool)

(assert (=> b!797170 m!738033))

(declare-fun m!738035 () Bool)

(assert (=> b!797170 m!738035))

(declare-fun m!738037 () Bool)

(assert (=> b!797161 m!738037))

(declare-fun m!738039 () Bool)

(assert (=> b!797165 m!738039))

(assert (=> b!797165 m!738007))

(check-sat (not b!797167) (not b!797168) (not b!797163) (not b!797161) (not b!797171) (not b!797162) (not start!68542) (not b!797164) (not b!797172))
(check-sat)
