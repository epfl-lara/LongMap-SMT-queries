; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68488 () Bool)

(assert start!68488)

(declare-fun b!796247 () Bool)

(declare-fun e!441848 () Bool)

(declare-fun e!441846 () Bool)

(assert (=> b!796247 (= e!441848 e!441846)))

(declare-fun res!540767 () Bool)

(assert (=> b!796247 (=> (not res!540767) (not e!441846))))

(declare-datatypes ((array!43278 0))(
  ( (array!43279 (arr!20719 (Array (_ BitVec 32) (_ BitVec 64))) (size!21140 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43278)

(declare-datatypes ((SeekEntryResult!8310 0))(
  ( (MissingZero!8310 (index!35608 (_ BitVec 32))) (Found!8310 (index!35609 (_ BitVec 32))) (Intermediate!8310 (undefined!9122 Bool) (index!35610 (_ BitVec 32)) (x!66516 (_ BitVec 32))) (Undefined!8310) (MissingVacant!8310 (index!35611 (_ BitVec 32))) )
))
(declare-fun lt!355007 () SeekEntryResult!8310)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355009 () SeekEntryResult!8310)

(assert (=> b!796247 (= res!540767 (and (= lt!355007 lt!355009) (= lt!355009 (Found!8310 j!153)) (= (select (arr!20719 a!3170) index!1236) (select (arr!20719 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43278 (_ BitVec 32)) SeekEntryResult!8310)

(assert (=> b!796247 (= lt!355009 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20719 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43278 (_ BitVec 32)) SeekEntryResult!8310)

(assert (=> b!796247 (= lt!355007 (seekEntryOrOpen!0 (select (arr!20719 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796248 () Bool)

(declare-fun res!540769 () Bool)

(declare-fun e!441847 () Bool)

(assert (=> b!796248 (=> (not res!540769) (not e!441847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43278 (_ BitVec 32)) Bool)

(assert (=> b!796248 (= res!540769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!540773 () Bool)

(declare-fun e!441845 () Bool)

(assert (=> start!68488 (=> (not res!540773) (not e!441845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68488 (= res!540773 (validMask!0 mask!3266))))

(assert (=> start!68488 e!441845))

(assert (=> start!68488 true))

(declare-fun array_inv!16515 (array!43278) Bool)

(assert (=> start!68488 (array_inv!16515 a!3170)))

(declare-fun b!796249 () Bool)

(declare-fun res!540775 () Bool)

(assert (=> b!796249 (=> (not res!540775) (not e!441845))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796249 (= res!540775 (validKeyInArray!0 k0!2044))))

(declare-fun b!796250 () Bool)

(assert (=> b!796250 (= e!441847 e!441848)))

(declare-fun res!540770 () Bool)

(assert (=> b!796250 (=> (not res!540770) (not e!441848))))

(declare-fun lt!355012 () SeekEntryResult!8310)

(declare-fun lt!355013 () SeekEntryResult!8310)

(assert (=> b!796250 (= res!540770 (= lt!355012 lt!355013))))

(declare-fun lt!355008 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355010 () array!43278)

(assert (=> b!796250 (= lt!355013 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355008 lt!355010 mask!3266))))

(assert (=> b!796250 (= lt!355012 (seekEntryOrOpen!0 lt!355008 lt!355010 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796250 (= lt!355008 (select (store (arr!20719 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796250 (= lt!355010 (array!43279 (store (arr!20719 a!3170) i!1163 k0!2044) (size!21140 a!3170)))))

(declare-fun b!796251 () Bool)

(declare-fun res!540768 () Bool)

(assert (=> b!796251 (=> (not res!540768) (not e!441847))))

(assert (=> b!796251 (= res!540768 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21140 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20719 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21140 a!3170)) (= (select (arr!20719 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796252 () Bool)

(declare-fun res!540774 () Bool)

(assert (=> b!796252 (=> (not res!540774) (not e!441845))))

(declare-fun arrayContainsKey!0 (array!43278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796252 (= res!540774 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796253 () Bool)

(assert (=> b!796253 (= e!441845 e!441847)))

(declare-fun res!540766 () Bool)

(assert (=> b!796253 (=> (not res!540766) (not e!441847))))

(declare-fun lt!355011 () SeekEntryResult!8310)

(assert (=> b!796253 (= res!540766 (or (= lt!355011 (MissingZero!8310 i!1163)) (= lt!355011 (MissingVacant!8310 i!1163))))))

(assert (=> b!796253 (= lt!355011 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796254 () Bool)

(declare-fun res!540776 () Bool)

(assert (=> b!796254 (=> (not res!540776) (not e!441845))))

(assert (=> b!796254 (= res!540776 (validKeyInArray!0 (select (arr!20719 a!3170) j!153)))))

(declare-fun b!796255 () Bool)

(declare-fun res!540771 () Bool)

(assert (=> b!796255 (=> (not res!540771) (not e!441845))))

(assert (=> b!796255 (= res!540771 (and (= (size!21140 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21140 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21140 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796256 () Bool)

(assert (=> b!796256 (= e!441846 (not true))))

(assert (=> b!796256 (= lt!355013 (Found!8310 index!1236))))

(declare-fun b!796257 () Bool)

(declare-fun res!540772 () Bool)

(assert (=> b!796257 (=> (not res!540772) (not e!441847))))

(declare-datatypes ((List!14682 0))(
  ( (Nil!14679) (Cons!14678 (h!15807 (_ BitVec 64)) (t!20997 List!14682)) )
))
(declare-fun arrayNoDuplicates!0 (array!43278 (_ BitVec 32) List!14682) Bool)

(assert (=> b!796257 (= res!540772 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14679))))

(assert (= (and start!68488 res!540773) b!796255))

(assert (= (and b!796255 res!540771) b!796254))

(assert (= (and b!796254 res!540776) b!796249))

(assert (= (and b!796249 res!540775) b!796252))

(assert (= (and b!796252 res!540774) b!796253))

(assert (= (and b!796253 res!540766) b!796248))

(assert (= (and b!796248 res!540769) b!796257))

(assert (= (and b!796257 res!540772) b!796251))

(assert (= (and b!796251 res!540768) b!796250))

(assert (= (and b!796250 res!540770) b!796247))

(assert (= (and b!796247 res!540767) b!796256))

(declare-fun m!737015 () Bool)

(assert (=> b!796254 m!737015))

(assert (=> b!796254 m!737015))

(declare-fun m!737017 () Bool)

(assert (=> b!796254 m!737017))

(declare-fun m!737019 () Bool)

(assert (=> b!796247 m!737019))

(assert (=> b!796247 m!737015))

(assert (=> b!796247 m!737015))

(declare-fun m!737021 () Bool)

(assert (=> b!796247 m!737021))

(assert (=> b!796247 m!737015))

(declare-fun m!737023 () Bool)

(assert (=> b!796247 m!737023))

(declare-fun m!737025 () Bool)

(assert (=> start!68488 m!737025))

(declare-fun m!737027 () Bool)

(assert (=> start!68488 m!737027))

(declare-fun m!737029 () Bool)

(assert (=> b!796251 m!737029))

(declare-fun m!737031 () Bool)

(assert (=> b!796251 m!737031))

(declare-fun m!737033 () Bool)

(assert (=> b!796250 m!737033))

(declare-fun m!737035 () Bool)

(assert (=> b!796250 m!737035))

(declare-fun m!737037 () Bool)

(assert (=> b!796250 m!737037))

(declare-fun m!737039 () Bool)

(assert (=> b!796250 m!737039))

(declare-fun m!737041 () Bool)

(assert (=> b!796257 m!737041))

(declare-fun m!737043 () Bool)

(assert (=> b!796248 m!737043))

(declare-fun m!737045 () Bool)

(assert (=> b!796249 m!737045))

(declare-fun m!737047 () Bool)

(assert (=> b!796253 m!737047))

(declare-fun m!737049 () Bool)

(assert (=> b!796252 m!737049))

(check-sat (not b!796247) (not b!796250) (not b!796257) (not b!796252) (not b!796254) (not b!796249) (not b!796248) (not b!796253) (not start!68488))
(check-sat)
