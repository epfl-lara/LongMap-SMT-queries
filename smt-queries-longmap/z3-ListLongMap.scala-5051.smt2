; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68984 () Bool)

(assert start!68984)

(declare-fun b!803033 () Bool)

(declare-fun res!547011 () Bool)

(declare-fun e!445150 () Bool)

(assert (=> b!803033 (=> (not res!547011) (not e!445150))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43606 0))(
  ( (array!43607 (arr!20878 (Array (_ BitVec 32) (_ BitVec 64))) (size!21298 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43606)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803033 (= res!547011 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21298 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20878 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21298 a!3170)) (= (select (arr!20878 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!547014 () Bool)

(declare-fun e!445148 () Bool)

(assert (=> start!68984 (=> (not res!547014) (not e!445148))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68984 (= res!547014 (validMask!0 mask!3266))))

(assert (=> start!68984 e!445148))

(assert (=> start!68984 true))

(declare-fun array_inv!16737 (array!43606) Bool)

(assert (=> start!68984 (array_inv!16737 a!3170)))

(declare-fun b!803034 () Bool)

(assert (=> b!803034 (= e!445148 e!445150)))

(declare-fun res!547012 () Bool)

(assert (=> b!803034 (=> (not res!547012) (not e!445150))))

(declare-datatypes ((SeekEntryResult!8425 0))(
  ( (MissingZero!8425 (index!36068 (_ BitVec 32))) (Found!8425 (index!36069 (_ BitVec 32))) (Intermediate!8425 (undefined!9237 Bool) (index!36070 (_ BitVec 32)) (x!67085 (_ BitVec 32))) (Undefined!8425) (MissingVacant!8425 (index!36071 (_ BitVec 32))) )
))
(declare-fun lt!359030 () SeekEntryResult!8425)

(assert (=> b!803034 (= res!547012 (or (= lt!359030 (MissingZero!8425 i!1163)) (= lt!359030 (MissingVacant!8425 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43606 (_ BitVec 32)) SeekEntryResult!8425)

(assert (=> b!803034 (= lt!359030 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803035 () Bool)

(declare-fun res!547007 () Bool)

(assert (=> b!803035 (=> (not res!547007) (not e!445148))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803035 (= res!547007 (validKeyInArray!0 (select (arr!20878 a!3170) j!153)))))

(declare-fun b!803036 () Bool)

(declare-fun res!547013 () Bool)

(assert (=> b!803036 (=> (not res!547013) (not e!445148))))

(declare-fun arrayContainsKey!0 (array!43606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803036 (= res!547013 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803037 () Bool)

(declare-fun res!547006 () Bool)

(assert (=> b!803037 (=> (not res!547006) (not e!445150))))

(declare-datatypes ((List!14748 0))(
  ( (Nil!14745) (Cons!14744 (h!15879 (_ BitVec 64)) (t!21055 List!14748)) )
))
(declare-fun arrayNoDuplicates!0 (array!43606 (_ BitVec 32) List!14748) Bool)

(assert (=> b!803037 (= res!547006 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14745))))

(declare-fun b!803038 () Bool)

(declare-fun e!445149 () Bool)

(assert (=> b!803038 (= e!445149 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359026 () (_ BitVec 64))

(declare-fun lt!359028 () array!43606)

(declare-fun lt!359025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43606 (_ BitVec 32)) SeekEntryResult!8425)

(assert (=> b!803038 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359025 vacantAfter!23 lt!359026 lt!359028 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359025 vacantBefore!23 (select (arr!20878 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27475 0))(
  ( (Unit!27476) )
))
(declare-fun lt!359029 () Unit!27475)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43606 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27475)

(assert (=> b!803038 (= lt!359029 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359025 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803038 (= lt!359025 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803039 () Bool)

(declare-fun e!445147 () Bool)

(assert (=> b!803039 (= e!445150 e!445147)))

(declare-fun res!547008 () Bool)

(assert (=> b!803039 (=> (not res!547008) (not e!445147))))

(assert (=> b!803039 (= res!547008 (= (seekEntryOrOpen!0 lt!359026 lt!359028 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359026 lt!359028 mask!3266)))))

(assert (=> b!803039 (= lt!359026 (select (store (arr!20878 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803039 (= lt!359028 (array!43607 (store (arr!20878 a!3170) i!1163 k0!2044) (size!21298 a!3170)))))

(declare-fun b!803040 () Bool)

(declare-fun res!547005 () Bool)

(assert (=> b!803040 (=> (not res!547005) (not e!445148))))

(assert (=> b!803040 (= res!547005 (and (= (size!21298 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21298 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21298 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803041 () Bool)

(assert (=> b!803041 (= e!445147 e!445149)))

(declare-fun res!547009 () Bool)

(assert (=> b!803041 (=> (not res!547009) (not e!445149))))

(declare-fun lt!359027 () SeekEntryResult!8425)

(declare-fun lt!359024 () SeekEntryResult!8425)

(assert (=> b!803041 (= res!547009 (and (= lt!359027 lt!359024) (= lt!359024 (Found!8425 j!153)) (not (= (select (arr!20878 a!3170) index!1236) (select (arr!20878 a!3170) j!153)))))))

(assert (=> b!803041 (= lt!359024 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20878 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803041 (= lt!359027 (seekEntryOrOpen!0 (select (arr!20878 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803042 () Bool)

(declare-fun res!547004 () Bool)

(assert (=> b!803042 (=> (not res!547004) (not e!445150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43606 (_ BitVec 32)) Bool)

(assert (=> b!803042 (= res!547004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803043 () Bool)

(declare-fun res!547010 () Bool)

(assert (=> b!803043 (=> (not res!547010) (not e!445148))))

(assert (=> b!803043 (= res!547010 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68984 res!547014) b!803040))

(assert (= (and b!803040 res!547005) b!803035))

(assert (= (and b!803035 res!547007) b!803043))

(assert (= (and b!803043 res!547010) b!803036))

(assert (= (and b!803036 res!547013) b!803034))

(assert (= (and b!803034 res!547012) b!803042))

(assert (= (and b!803042 res!547004) b!803037))

(assert (= (and b!803037 res!547006) b!803033))

(assert (= (and b!803033 res!547011) b!803039))

(assert (= (and b!803039 res!547008) b!803041))

(assert (= (and b!803041 res!547009) b!803038))

(declare-fun m!744751 () Bool)

(assert (=> b!803043 m!744751))

(declare-fun m!744753 () Bool)

(assert (=> b!803034 m!744753))

(declare-fun m!744755 () Bool)

(assert (=> b!803039 m!744755))

(declare-fun m!744757 () Bool)

(assert (=> b!803039 m!744757))

(declare-fun m!744759 () Bool)

(assert (=> b!803039 m!744759))

(declare-fun m!744761 () Bool)

(assert (=> b!803039 m!744761))

(declare-fun m!744763 () Bool)

(assert (=> start!68984 m!744763))

(declare-fun m!744765 () Bool)

(assert (=> start!68984 m!744765))

(declare-fun m!744767 () Bool)

(assert (=> b!803041 m!744767))

(declare-fun m!744769 () Bool)

(assert (=> b!803041 m!744769))

(assert (=> b!803041 m!744769))

(declare-fun m!744771 () Bool)

(assert (=> b!803041 m!744771))

(assert (=> b!803041 m!744769))

(declare-fun m!744773 () Bool)

(assert (=> b!803041 m!744773))

(declare-fun m!744775 () Bool)

(assert (=> b!803037 m!744775))

(assert (=> b!803035 m!744769))

(assert (=> b!803035 m!744769))

(declare-fun m!744777 () Bool)

(assert (=> b!803035 m!744777))

(declare-fun m!744779 () Bool)

(assert (=> b!803033 m!744779))

(declare-fun m!744781 () Bool)

(assert (=> b!803033 m!744781))

(declare-fun m!744783 () Bool)

(assert (=> b!803042 m!744783))

(declare-fun m!744785 () Bool)

(assert (=> b!803036 m!744785))

(assert (=> b!803038 m!744769))

(declare-fun m!744787 () Bool)

(assert (=> b!803038 m!744787))

(assert (=> b!803038 m!744769))

(declare-fun m!744789 () Bool)

(assert (=> b!803038 m!744789))

(declare-fun m!744791 () Bool)

(assert (=> b!803038 m!744791))

(declare-fun m!744793 () Bool)

(assert (=> b!803038 m!744793))

(check-sat (not b!803038) (not b!803043) (not b!803042) (not b!803039) (not b!803035) (not b!803037) (not b!803036) (not b!803041) (not b!803034) (not start!68984))
(check-sat)
