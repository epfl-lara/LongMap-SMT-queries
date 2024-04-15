; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68886 () Bool)

(assert start!68886)

(declare-fun b!803461 () Bool)

(declare-fun res!548124 () Bool)

(declare-fun e!445176 () Bool)

(assert (=> b!803461 (=> (not res!548124) (not e!445176))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43693 0))(
  ( (array!43694 (arr!20927 (Array (_ BitVec 32) (_ BitVec 64))) (size!21348 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43693)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803461 (= res!548124 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21348 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20927 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21348 a!3170)) (= (select (arr!20927 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!548127 () Bool)

(declare-fun e!445179 () Bool)

(assert (=> start!68886 (=> (not res!548127) (not e!445179))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68886 (= res!548127 (validMask!0 mask!3266))))

(assert (=> start!68886 e!445179))

(assert (=> start!68886 true))

(declare-fun array_inv!16810 (array!43693) Bool)

(assert (=> start!68886 (array_inv!16810 a!3170)))

(declare-fun b!803462 () Bool)

(declare-fun res!548129 () Bool)

(assert (=> b!803462 (=> (not res!548129) (not e!445179))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803462 (= res!548129 (validKeyInArray!0 k0!2044))))

(declare-fun b!803463 () Bool)

(declare-fun res!548122 () Bool)

(assert (=> b!803463 (=> (not res!548122) (not e!445176))))

(declare-datatypes ((List!14929 0))(
  ( (Nil!14926) (Cons!14925 (h!16054 (_ BitVec 64)) (t!21235 List!14929)) )
))
(declare-fun arrayNoDuplicates!0 (array!43693 (_ BitVec 32) List!14929) Bool)

(assert (=> b!803463 (= res!548122 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14926))))

(declare-fun b!803464 () Bool)

(assert (=> b!803464 (= e!445179 e!445176)))

(declare-fun res!548130 () Bool)

(assert (=> b!803464 (=> (not res!548130) (not e!445176))))

(declare-datatypes ((SeekEntryResult!8515 0))(
  ( (MissingZero!8515 (index!36428 (_ BitVec 32))) (Found!8515 (index!36429 (_ BitVec 32))) (Intermediate!8515 (undefined!9327 Bool) (index!36430 (_ BitVec 32)) (x!67276 (_ BitVec 32))) (Undefined!8515) (MissingVacant!8515 (index!36431 (_ BitVec 32))) )
))
(declare-fun lt!359566 () SeekEntryResult!8515)

(assert (=> b!803464 (= res!548130 (or (= lt!359566 (MissingZero!8515 i!1163)) (= lt!359566 (MissingVacant!8515 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43693 (_ BitVec 32)) SeekEntryResult!8515)

(assert (=> b!803464 (= lt!359566 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803465 () Bool)

(declare-fun e!445178 () Bool)

(assert (=> b!803465 (= e!445178 (not true))))

(declare-fun lt!359562 () (_ BitVec 64))

(declare-fun lt!359565 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359564 () array!43693)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43693 (_ BitVec 32)) SeekEntryResult!8515)

(assert (=> b!803465 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359565 vacantAfter!23 lt!359562 lt!359564 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359565 vacantBefore!23 (select (arr!20927 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27544 0))(
  ( (Unit!27545) )
))
(declare-fun lt!359563 () Unit!27544)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27544)

(assert (=> b!803465 (= lt!359563 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359565 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803465 (= lt!359565 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803466 () Bool)

(declare-fun res!548121 () Bool)

(assert (=> b!803466 (=> (not res!548121) (not e!445176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43693 (_ BitVec 32)) Bool)

(assert (=> b!803466 (= res!548121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803467 () Bool)

(declare-fun e!445177 () Bool)

(assert (=> b!803467 (= e!445176 e!445177)))

(declare-fun res!548128 () Bool)

(assert (=> b!803467 (=> (not res!548128) (not e!445177))))

(assert (=> b!803467 (= res!548128 (= (seekEntryOrOpen!0 lt!359562 lt!359564 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359562 lt!359564 mask!3266)))))

(assert (=> b!803467 (= lt!359562 (select (store (arr!20927 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803467 (= lt!359564 (array!43694 (store (arr!20927 a!3170) i!1163 k0!2044) (size!21348 a!3170)))))

(declare-fun b!803468 () Bool)

(declare-fun res!548123 () Bool)

(assert (=> b!803468 (=> (not res!548123) (not e!445179))))

(declare-fun arrayContainsKey!0 (array!43693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803468 (= res!548123 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803469 () Bool)

(declare-fun res!548125 () Bool)

(assert (=> b!803469 (=> (not res!548125) (not e!445179))))

(assert (=> b!803469 (= res!548125 (validKeyInArray!0 (select (arr!20927 a!3170) j!153)))))

(declare-fun b!803470 () Bool)

(declare-fun res!548120 () Bool)

(assert (=> b!803470 (=> (not res!548120) (not e!445179))))

(assert (=> b!803470 (= res!548120 (and (= (size!21348 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21348 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21348 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803471 () Bool)

(assert (=> b!803471 (= e!445177 e!445178)))

(declare-fun res!548126 () Bool)

(assert (=> b!803471 (=> (not res!548126) (not e!445178))))

(declare-fun lt!359567 () SeekEntryResult!8515)

(declare-fun lt!359561 () SeekEntryResult!8515)

(assert (=> b!803471 (= res!548126 (and (= lt!359561 lt!359567) (= lt!359567 (Found!8515 j!153)) (not (= (select (arr!20927 a!3170) index!1236) (select (arr!20927 a!3170) j!153)))))))

(assert (=> b!803471 (= lt!359567 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20927 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803471 (= lt!359561 (seekEntryOrOpen!0 (select (arr!20927 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68886 res!548127) b!803470))

(assert (= (and b!803470 res!548120) b!803469))

(assert (= (and b!803469 res!548125) b!803462))

(assert (= (and b!803462 res!548129) b!803468))

(assert (= (and b!803468 res!548123) b!803464))

(assert (= (and b!803464 res!548130) b!803466))

(assert (= (and b!803466 res!548121) b!803463))

(assert (= (and b!803463 res!548122) b!803461))

(assert (= (and b!803461 res!548124) b!803467))

(assert (= (and b!803467 res!548128) b!803471))

(assert (= (and b!803471 res!548126) b!803465))

(declare-fun m!744769 () Bool)

(assert (=> start!68886 m!744769))

(declare-fun m!744771 () Bool)

(assert (=> start!68886 m!744771))

(declare-fun m!744773 () Bool)

(assert (=> b!803463 m!744773))

(declare-fun m!744775 () Bool)

(assert (=> b!803468 m!744775))

(declare-fun m!744777 () Bool)

(assert (=> b!803462 m!744777))

(declare-fun m!744779 () Bool)

(assert (=> b!803467 m!744779))

(declare-fun m!744781 () Bool)

(assert (=> b!803467 m!744781))

(declare-fun m!744783 () Bool)

(assert (=> b!803467 m!744783))

(declare-fun m!744785 () Bool)

(assert (=> b!803467 m!744785))

(declare-fun m!744787 () Bool)

(assert (=> b!803471 m!744787))

(declare-fun m!744789 () Bool)

(assert (=> b!803471 m!744789))

(assert (=> b!803471 m!744789))

(declare-fun m!744791 () Bool)

(assert (=> b!803471 m!744791))

(assert (=> b!803471 m!744789))

(declare-fun m!744793 () Bool)

(assert (=> b!803471 m!744793))

(declare-fun m!744795 () Bool)

(assert (=> b!803466 m!744795))

(assert (=> b!803469 m!744789))

(assert (=> b!803469 m!744789))

(declare-fun m!744797 () Bool)

(assert (=> b!803469 m!744797))

(declare-fun m!744799 () Bool)

(assert (=> b!803461 m!744799))

(declare-fun m!744801 () Bool)

(assert (=> b!803461 m!744801))

(declare-fun m!744803 () Bool)

(assert (=> b!803464 m!744803))

(assert (=> b!803465 m!744789))

(declare-fun m!744805 () Bool)

(assert (=> b!803465 m!744805))

(declare-fun m!744807 () Bool)

(assert (=> b!803465 m!744807))

(assert (=> b!803465 m!744789))

(declare-fun m!744809 () Bool)

(assert (=> b!803465 m!744809))

(declare-fun m!744811 () Bool)

(assert (=> b!803465 m!744811))

(check-sat (not b!803467) (not b!803465) (not start!68886) (not b!803464) (not b!803462) (not b!803471) (not b!803463) (not b!803469) (not b!803466) (not b!803468))
(check-sat)
