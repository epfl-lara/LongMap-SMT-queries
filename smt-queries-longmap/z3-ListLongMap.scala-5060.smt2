; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68872 () Bool)

(assert start!68872)

(declare-fun b!803110 () Bool)

(declare-fun res!547639 () Bool)

(declare-fun e!445037 () Bool)

(assert (=> b!803110 (=> (not res!547639) (not e!445037))))

(declare-datatypes ((array!43662 0))(
  ( (array!43663 (arr!20911 (Array (_ BitVec 32) (_ BitVec 64))) (size!21332 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43662)

(declare-datatypes ((List!14874 0))(
  ( (Nil!14871) (Cons!14870 (h!15999 (_ BitVec 64)) (t!21189 List!14874)) )
))
(declare-fun arrayNoDuplicates!0 (array!43662 (_ BitVec 32) List!14874) Bool)

(assert (=> b!803110 (= res!547639 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14871))))

(declare-fun b!803111 () Bool)

(declare-fun res!547636 () Bool)

(assert (=> b!803111 (=> (not res!547636) (not e!445037))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803111 (= res!547636 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21332 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20911 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21332 a!3170)) (= (select (arr!20911 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-datatypes ((SeekEntryResult!8502 0))(
  ( (MissingZero!8502 (index!36376 (_ BitVec 32))) (Found!8502 (index!36377 (_ BitVec 32))) (Intermediate!8502 (undefined!9314 Bool) (index!36378 (_ BitVec 32)) (x!67220 (_ BitVec 32))) (Undefined!8502) (MissingVacant!8502 (index!36379 (_ BitVec 32))) )
))
(declare-fun lt!359357 () SeekEntryResult!8502)

(declare-fun b!803112 () Bool)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lt!359351 () SeekEntryResult!8502)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun e!445039 () Bool)

(assert (=> b!803112 (= e!445039 (not (or (not (= lt!359351 lt!359357)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20911 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359356 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359352 () (_ BitVec 32))

(declare-fun lt!359355 () array!43662)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43662 (_ BitVec 32)) SeekEntryResult!8502)

(assert (=> b!803112 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359352 vacantAfter!23 lt!359356 lt!359355 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359352 vacantBefore!23 (select (arr!20911 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27544 0))(
  ( (Unit!27545) )
))
(declare-fun lt!359353 () Unit!27544)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43662 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27544)

(assert (=> b!803112 (= lt!359353 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359352 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803112 (= lt!359352 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803113 () Bool)

(declare-fun res!547633 () Bool)

(declare-fun e!445036 () Bool)

(assert (=> b!803113 (=> (not res!547633) (not e!445036))))

(declare-fun arrayContainsKey!0 (array!43662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803113 (= res!547633 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803114 () Bool)

(declare-fun res!547631 () Bool)

(assert (=> b!803114 (=> (not res!547631) (not e!445037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43662 (_ BitVec 32)) Bool)

(assert (=> b!803114 (= res!547631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803115 () Bool)

(declare-fun res!547632 () Bool)

(assert (=> b!803115 (=> (not res!547632) (not e!445036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803115 (= res!547632 (validKeyInArray!0 k0!2044))))

(declare-fun b!803116 () Bool)

(declare-fun e!445035 () Bool)

(assert (=> b!803116 (= e!445035 e!445039)))

(declare-fun res!547634 () Bool)

(assert (=> b!803116 (=> (not res!547634) (not e!445039))))

(declare-fun lt!359359 () SeekEntryResult!8502)

(assert (=> b!803116 (= res!547634 (and (= lt!359359 lt!359357) (not (= (select (arr!20911 a!3170) index!1236) (select (arr!20911 a!3170) j!153)))))))

(assert (=> b!803116 (= lt!359357 (Found!8502 j!153))))

(declare-fun res!547629 () Bool)

(assert (=> start!68872 (=> (not res!547629) (not e!445036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68872 (= res!547629 (validMask!0 mask!3266))))

(assert (=> start!68872 e!445036))

(assert (=> start!68872 true))

(declare-fun array_inv!16707 (array!43662) Bool)

(assert (=> start!68872 (array_inv!16707 a!3170)))

(declare-fun b!803117 () Bool)

(declare-fun e!445038 () Bool)

(assert (=> b!803117 (= e!445038 e!445035)))

(declare-fun res!547637 () Bool)

(assert (=> b!803117 (=> (not res!547637) (not e!445035))))

(declare-fun lt!359354 () SeekEntryResult!8502)

(assert (=> b!803117 (= res!547637 (= lt!359354 lt!359359))))

(assert (=> b!803117 (= lt!359359 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20911 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43662 (_ BitVec 32)) SeekEntryResult!8502)

(assert (=> b!803117 (= lt!359354 (seekEntryOrOpen!0 (select (arr!20911 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803118 () Bool)

(assert (=> b!803118 (= e!445036 e!445037)))

(declare-fun res!547635 () Bool)

(assert (=> b!803118 (=> (not res!547635) (not e!445037))))

(declare-fun lt!359358 () SeekEntryResult!8502)

(assert (=> b!803118 (= res!547635 (or (= lt!359358 (MissingZero!8502 i!1163)) (= lt!359358 (MissingVacant!8502 i!1163))))))

(assert (=> b!803118 (= lt!359358 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803119 () Bool)

(declare-fun res!547638 () Bool)

(assert (=> b!803119 (=> (not res!547638) (not e!445036))))

(assert (=> b!803119 (= res!547638 (validKeyInArray!0 (select (arr!20911 a!3170) j!153)))))

(declare-fun b!803120 () Bool)

(declare-fun res!547640 () Bool)

(assert (=> b!803120 (=> (not res!547640) (not e!445036))))

(assert (=> b!803120 (= res!547640 (and (= (size!21332 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21332 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21332 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803121 () Bool)

(assert (=> b!803121 (= e!445037 e!445038)))

(declare-fun res!547630 () Bool)

(assert (=> b!803121 (=> (not res!547630) (not e!445038))))

(declare-fun lt!359360 () SeekEntryResult!8502)

(assert (=> b!803121 (= res!547630 (= lt!359360 lt!359351))))

(assert (=> b!803121 (= lt!359351 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359356 lt!359355 mask!3266))))

(assert (=> b!803121 (= lt!359360 (seekEntryOrOpen!0 lt!359356 lt!359355 mask!3266))))

(assert (=> b!803121 (= lt!359356 (select (store (arr!20911 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803121 (= lt!359355 (array!43663 (store (arr!20911 a!3170) i!1163 k0!2044) (size!21332 a!3170)))))

(assert (= (and start!68872 res!547629) b!803120))

(assert (= (and b!803120 res!547640) b!803119))

(assert (= (and b!803119 res!547638) b!803115))

(assert (= (and b!803115 res!547632) b!803113))

(assert (= (and b!803113 res!547633) b!803118))

(assert (= (and b!803118 res!547635) b!803114))

(assert (= (and b!803114 res!547631) b!803110))

(assert (= (and b!803110 res!547639) b!803111))

(assert (= (and b!803111 res!547636) b!803121))

(assert (= (and b!803121 res!547630) b!803117))

(assert (= (and b!803117 res!547637) b!803116))

(assert (= (and b!803116 res!547634) b!803112))

(declare-fun m!744747 () Bool)

(assert (=> b!803121 m!744747))

(declare-fun m!744749 () Bool)

(assert (=> b!803121 m!744749))

(declare-fun m!744751 () Bool)

(assert (=> b!803121 m!744751))

(declare-fun m!744753 () Bool)

(assert (=> b!803121 m!744753))

(declare-fun m!744755 () Bool)

(assert (=> b!803116 m!744755))

(declare-fun m!744757 () Bool)

(assert (=> b!803116 m!744757))

(assert (=> b!803119 m!744757))

(assert (=> b!803119 m!744757))

(declare-fun m!744759 () Bool)

(assert (=> b!803119 m!744759))

(declare-fun m!744761 () Bool)

(assert (=> start!68872 m!744761))

(declare-fun m!744763 () Bool)

(assert (=> start!68872 m!744763))

(assert (=> b!803117 m!744757))

(assert (=> b!803117 m!744757))

(declare-fun m!744765 () Bool)

(assert (=> b!803117 m!744765))

(assert (=> b!803117 m!744757))

(declare-fun m!744767 () Bool)

(assert (=> b!803117 m!744767))

(assert (=> b!803112 m!744757))

(declare-fun m!744769 () Bool)

(assert (=> b!803112 m!744769))

(declare-fun m!744771 () Bool)

(assert (=> b!803112 m!744771))

(assert (=> b!803112 m!744751))

(declare-fun m!744773 () Bool)

(assert (=> b!803112 m!744773))

(declare-fun m!744775 () Bool)

(assert (=> b!803112 m!744775))

(assert (=> b!803112 m!744757))

(declare-fun m!744777 () Bool)

(assert (=> b!803112 m!744777))

(declare-fun m!744779 () Bool)

(assert (=> b!803118 m!744779))

(declare-fun m!744781 () Bool)

(assert (=> b!803111 m!744781))

(declare-fun m!744783 () Bool)

(assert (=> b!803111 m!744783))

(declare-fun m!744785 () Bool)

(assert (=> b!803114 m!744785))

(declare-fun m!744787 () Bool)

(assert (=> b!803115 m!744787))

(declare-fun m!744789 () Bool)

(assert (=> b!803110 m!744789))

(declare-fun m!744791 () Bool)

(assert (=> b!803113 m!744791))

(check-sat (not b!803110) (not b!803113) (not b!803112) (not b!803114) (not start!68872) (not b!803119) (not b!803121) (not b!803117) (not b!803115) (not b!803118))
(check-sat)
