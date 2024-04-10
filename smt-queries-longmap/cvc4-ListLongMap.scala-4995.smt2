; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68484 () Bool)

(assert start!68484)

(declare-fun b!796181 () Bool)

(declare-fun res!540706 () Bool)

(declare-fun e!441816 () Bool)

(assert (=> b!796181 (=> (not res!540706) (not e!441816))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43274 0))(
  ( (array!43275 (arr!20717 (Array (_ BitVec 32) (_ BitVec 64))) (size!21138 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43274)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796181 (= res!540706 (and (= (size!21138 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21138 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21138 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796182 () Bool)

(declare-fun e!441815 () Bool)

(declare-fun e!441818 () Bool)

(assert (=> b!796182 (= e!441815 e!441818)))

(declare-fun res!540703 () Bool)

(assert (=> b!796182 (=> (not res!540703) (not e!441818))))

(declare-datatypes ((SeekEntryResult!8308 0))(
  ( (MissingZero!8308 (index!35600 (_ BitVec 32))) (Found!8308 (index!35601 (_ BitVec 32))) (Intermediate!8308 (undefined!9120 Bool) (index!35602 (_ BitVec 32)) (x!66506 (_ BitVec 32))) (Undefined!8308) (MissingVacant!8308 (index!35603 (_ BitVec 32))) )
))
(declare-fun lt!354966 () SeekEntryResult!8308)

(declare-fun lt!354968 () SeekEntryResult!8308)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796182 (= res!540703 (and (= lt!354966 lt!354968) (= lt!354968 (Found!8308 j!153)) (= (select (arr!20717 a!3170) index!1236) (select (arr!20717 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43274 (_ BitVec 32)) SeekEntryResult!8308)

(assert (=> b!796182 (= lt!354968 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20717 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43274 (_ BitVec 32)) SeekEntryResult!8308)

(assert (=> b!796182 (= lt!354966 (seekEntryOrOpen!0 (select (arr!20717 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796183 () Bool)

(declare-fun res!540704 () Bool)

(declare-fun e!441817 () Bool)

(assert (=> b!796183 (=> (not res!540704) (not e!441817))))

(declare-datatypes ((List!14680 0))(
  ( (Nil!14677) (Cons!14676 (h!15805 (_ BitVec 64)) (t!20995 List!14680)) )
))
(declare-fun arrayNoDuplicates!0 (array!43274 (_ BitVec 32) List!14680) Bool)

(assert (=> b!796183 (= res!540704 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14677))))

(declare-fun b!796184 () Bool)

(declare-fun res!540702 () Bool)

(assert (=> b!796184 (=> (not res!540702) (not e!441817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43274 (_ BitVec 32)) Bool)

(assert (=> b!796184 (= res!540702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796185 () Bool)

(declare-fun res!540710 () Bool)

(assert (=> b!796185 (=> (not res!540710) (not e!441817))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!796185 (= res!540710 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21138 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20717 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21138 a!3170)) (= (select (arr!20717 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796186 () Bool)

(declare-fun res!540707 () Bool)

(assert (=> b!796186 (=> (not res!540707) (not e!441816))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796186 (= res!540707 (validKeyInArray!0 k!2044))))

(declare-fun b!796187 () Bool)

(declare-fun res!540700 () Bool)

(assert (=> b!796187 (=> (not res!540700) (not e!441816))))

(declare-fun arrayContainsKey!0 (array!43274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796187 (= res!540700 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796188 () Bool)

(assert (=> b!796188 (= e!441817 e!441815)))

(declare-fun res!540701 () Bool)

(assert (=> b!796188 (=> (not res!540701) (not e!441815))))

(declare-fun lt!354970 () SeekEntryResult!8308)

(declare-fun lt!354969 () SeekEntryResult!8308)

(assert (=> b!796188 (= res!540701 (= lt!354970 lt!354969))))

(declare-fun lt!354967 () (_ BitVec 64))

(declare-fun lt!354971 () array!43274)

(assert (=> b!796188 (= lt!354969 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354967 lt!354971 mask!3266))))

(assert (=> b!796188 (= lt!354970 (seekEntryOrOpen!0 lt!354967 lt!354971 mask!3266))))

(assert (=> b!796188 (= lt!354967 (select (store (arr!20717 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796188 (= lt!354971 (array!43275 (store (arr!20717 a!3170) i!1163 k!2044) (size!21138 a!3170)))))

(declare-fun b!796189 () Bool)

(assert (=> b!796189 (= e!441816 e!441817)))

(declare-fun res!540708 () Bool)

(assert (=> b!796189 (=> (not res!540708) (not e!441817))))

(declare-fun lt!354965 () SeekEntryResult!8308)

(assert (=> b!796189 (= res!540708 (or (= lt!354965 (MissingZero!8308 i!1163)) (= lt!354965 (MissingVacant!8308 i!1163))))))

(assert (=> b!796189 (= lt!354965 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796190 () Bool)

(assert (=> b!796190 (= e!441818 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!796190 (= lt!354969 (Found!8308 index!1236))))

(declare-fun b!796191 () Bool)

(declare-fun res!540709 () Bool)

(assert (=> b!796191 (=> (not res!540709) (not e!441816))))

(assert (=> b!796191 (= res!540709 (validKeyInArray!0 (select (arr!20717 a!3170) j!153)))))

(declare-fun res!540705 () Bool)

(assert (=> start!68484 (=> (not res!540705) (not e!441816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68484 (= res!540705 (validMask!0 mask!3266))))

(assert (=> start!68484 e!441816))

(assert (=> start!68484 true))

(declare-fun array_inv!16513 (array!43274) Bool)

(assert (=> start!68484 (array_inv!16513 a!3170)))

(assert (= (and start!68484 res!540705) b!796181))

(assert (= (and b!796181 res!540706) b!796191))

(assert (= (and b!796191 res!540709) b!796186))

(assert (= (and b!796186 res!540707) b!796187))

(assert (= (and b!796187 res!540700) b!796189))

(assert (= (and b!796189 res!540708) b!796184))

(assert (= (and b!796184 res!540702) b!796183))

(assert (= (and b!796183 res!540704) b!796185))

(assert (= (and b!796185 res!540710) b!796188))

(assert (= (and b!796188 res!540701) b!796182))

(assert (= (and b!796182 res!540703) b!796190))

(declare-fun m!736943 () Bool)

(assert (=> b!796189 m!736943))

(declare-fun m!736945 () Bool)

(assert (=> b!796182 m!736945))

(declare-fun m!736947 () Bool)

(assert (=> b!796182 m!736947))

(assert (=> b!796182 m!736947))

(declare-fun m!736949 () Bool)

(assert (=> b!796182 m!736949))

(assert (=> b!796182 m!736947))

(declare-fun m!736951 () Bool)

(assert (=> b!796182 m!736951))

(assert (=> b!796191 m!736947))

(assert (=> b!796191 m!736947))

(declare-fun m!736953 () Bool)

(assert (=> b!796191 m!736953))

(declare-fun m!736955 () Bool)

(assert (=> b!796186 m!736955))

(declare-fun m!736957 () Bool)

(assert (=> b!796188 m!736957))

(declare-fun m!736959 () Bool)

(assert (=> b!796188 m!736959))

(declare-fun m!736961 () Bool)

(assert (=> b!796188 m!736961))

(declare-fun m!736963 () Bool)

(assert (=> b!796188 m!736963))

(declare-fun m!736965 () Bool)

(assert (=> start!68484 m!736965))

(declare-fun m!736967 () Bool)

(assert (=> start!68484 m!736967))

(declare-fun m!736969 () Bool)

(assert (=> b!796183 m!736969))

(declare-fun m!736971 () Bool)

(assert (=> b!796184 m!736971))

(declare-fun m!736973 () Bool)

(assert (=> b!796187 m!736973))

(declare-fun m!736975 () Bool)

(assert (=> b!796185 m!736975))

(declare-fun m!736977 () Bool)

(assert (=> b!796185 m!736977))

(push 1)

(assert (not b!796182))

(assert (not b!796183))

(assert (not b!796187))

(assert (not start!68484))

(assert (not b!796184))

(assert (not b!796191))

(assert (not b!796186))

(assert (not b!796189))

(assert (not b!796188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

