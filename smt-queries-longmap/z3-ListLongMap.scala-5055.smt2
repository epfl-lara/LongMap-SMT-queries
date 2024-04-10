; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68842 () Bool)

(assert start!68842)

(declare-fun b!802588 () Bool)

(declare-fun res!547111 () Bool)

(declare-fun e!444788 () Bool)

(assert (=> b!802588 (=> (not res!547111) (not e!444788))))

(declare-datatypes ((array!43632 0))(
  ( (array!43633 (arr!20896 (Array (_ BitVec 32) (_ BitVec 64))) (size!21317 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43632)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43632 (_ BitVec 32)) Bool)

(assert (=> b!802588 (= res!547111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802589 () Bool)

(declare-fun res!547112 () Bool)

(declare-fun e!444787 () Bool)

(assert (=> b!802589 (=> (not res!547112) (not e!444787))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802589 (= res!547112 (validKeyInArray!0 k0!2044))))

(declare-fun res!547107 () Bool)

(assert (=> start!68842 (=> (not res!547107) (not e!444787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68842 (= res!547107 (validMask!0 mask!3266))))

(assert (=> start!68842 e!444787))

(assert (=> start!68842 true))

(declare-fun array_inv!16692 (array!43632) Bool)

(assert (=> start!68842 (array_inv!16692 a!3170)))

(declare-fun b!802590 () Bool)

(declare-fun e!444783 () Bool)

(declare-fun e!444786 () Bool)

(assert (=> b!802590 (= e!444783 e!444786)))

(declare-fun res!547108 () Bool)

(assert (=> b!802590 (=> (not res!547108) (not e!444786))))

(declare-datatypes ((SeekEntryResult!8487 0))(
  ( (MissingZero!8487 (index!36316 (_ BitVec 32))) (Found!8487 (index!36317 (_ BitVec 32))) (Intermediate!8487 (undefined!9299 Bool) (index!36318 (_ BitVec 32)) (x!67165 (_ BitVec 32))) (Undefined!8487) (MissingVacant!8487 (index!36319 (_ BitVec 32))) )
))
(declare-fun lt!358959 () SeekEntryResult!8487)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358957 () SeekEntryResult!8487)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802590 (= res!547108 (and (= lt!358959 lt!358957) (not (= (select (arr!20896 a!3170) index!1236) (select (arr!20896 a!3170) j!153)))))))

(assert (=> b!802590 (= lt!358957 (Found!8487 j!153))))

(declare-fun b!802591 () Bool)

(assert (=> b!802591 (= e!444787 e!444788)))

(declare-fun res!547117 () Bool)

(assert (=> b!802591 (=> (not res!547117) (not e!444788))))

(declare-fun lt!358960 () SeekEntryResult!8487)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802591 (= res!547117 (or (= lt!358960 (MissingZero!8487 i!1163)) (= lt!358960 (MissingVacant!8487 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43632 (_ BitVec 32)) SeekEntryResult!8487)

(assert (=> b!802591 (= lt!358960 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802592 () Bool)

(declare-fun res!547118 () Bool)

(assert (=> b!802592 (=> (not res!547118) (not e!444788))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802592 (= res!547118 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21317 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20896 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21317 a!3170)) (= (select (arr!20896 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802593 () Bool)

(declare-fun res!547115 () Bool)

(assert (=> b!802593 (=> (not res!547115) (not e!444787))))

(assert (=> b!802593 (= res!547115 (validKeyInArray!0 (select (arr!20896 a!3170) j!153)))))

(declare-fun b!802594 () Bool)

(declare-fun res!547116 () Bool)

(assert (=> b!802594 (=> (not res!547116) (not e!444787))))

(assert (=> b!802594 (= res!547116 (and (= (size!21317 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21317 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21317 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802595 () Bool)

(declare-fun e!444784 () Bool)

(assert (=> b!802595 (= e!444788 e!444784)))

(declare-fun res!547113 () Bool)

(assert (=> b!802595 (=> (not res!547113) (not e!444784))))

(declare-fun lt!358964 () SeekEntryResult!8487)

(declare-fun lt!358962 () SeekEntryResult!8487)

(assert (=> b!802595 (= res!547113 (= lt!358964 lt!358962))))

(declare-fun lt!358963 () array!43632)

(declare-fun lt!358956 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43632 (_ BitVec 32)) SeekEntryResult!8487)

(assert (=> b!802595 (= lt!358962 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358956 lt!358963 mask!3266))))

(assert (=> b!802595 (= lt!358964 (seekEntryOrOpen!0 lt!358956 lt!358963 mask!3266))))

(assert (=> b!802595 (= lt!358956 (select (store (arr!20896 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802595 (= lt!358963 (array!43633 (store (arr!20896 a!3170) i!1163 k0!2044) (size!21317 a!3170)))))

(declare-fun b!802596 () Bool)

(declare-fun res!547109 () Bool)

(assert (=> b!802596 (=> (not res!547109) (not e!444787))))

(declare-fun arrayContainsKey!0 (array!43632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802596 (= res!547109 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802597 () Bool)

(declare-fun res!547114 () Bool)

(assert (=> b!802597 (=> (not res!547114) (not e!444788))))

(declare-datatypes ((List!14859 0))(
  ( (Nil!14856) (Cons!14855 (h!15984 (_ BitVec 64)) (t!21174 List!14859)) )
))
(declare-fun arrayNoDuplicates!0 (array!43632 (_ BitVec 32) List!14859) Bool)

(assert (=> b!802597 (= res!547114 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14856))))

(declare-fun b!802598 () Bool)

(assert (=> b!802598 (= e!444784 e!444783)))

(declare-fun res!547110 () Bool)

(assert (=> b!802598 (=> (not res!547110) (not e!444783))))

(declare-fun lt!358955 () SeekEntryResult!8487)

(assert (=> b!802598 (= res!547110 (= lt!358955 lt!358959))))

(assert (=> b!802598 (= lt!358959 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20896 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802598 (= lt!358955 (seekEntryOrOpen!0 (select (arr!20896 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802599 () Bool)

(assert (=> b!802599 (= e!444786 (not (or (not (= lt!358962 lt!358957)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!358958 () (_ BitVec 32))

(assert (=> b!802599 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358958 vacantAfter!23 lt!358956 lt!358963 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358958 vacantBefore!23 (select (arr!20896 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27514 0))(
  ( (Unit!27515) )
))
(declare-fun lt!358961 () Unit!27514)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43632 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27514)

(assert (=> b!802599 (= lt!358961 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358958 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802599 (= lt!358958 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68842 res!547107) b!802594))

(assert (= (and b!802594 res!547116) b!802593))

(assert (= (and b!802593 res!547115) b!802589))

(assert (= (and b!802589 res!547112) b!802596))

(assert (= (and b!802596 res!547109) b!802591))

(assert (= (and b!802591 res!547117) b!802588))

(assert (= (and b!802588 res!547111) b!802597))

(assert (= (and b!802597 res!547114) b!802592))

(assert (= (and b!802592 res!547118) b!802595))

(assert (= (and b!802595 res!547113) b!802598))

(assert (= (and b!802598 res!547110) b!802590))

(assert (= (and b!802590 res!547108) b!802599))

(declare-fun m!744085 () Bool)

(assert (=> b!802589 m!744085))

(declare-fun m!744087 () Bool)

(assert (=> b!802596 m!744087))

(declare-fun m!744089 () Bool)

(assert (=> b!802592 m!744089))

(declare-fun m!744091 () Bool)

(assert (=> b!802592 m!744091))

(declare-fun m!744093 () Bool)

(assert (=> b!802599 m!744093))

(declare-fun m!744095 () Bool)

(assert (=> b!802599 m!744095))

(declare-fun m!744097 () Bool)

(assert (=> b!802599 m!744097))

(declare-fun m!744099 () Bool)

(assert (=> b!802599 m!744099))

(assert (=> b!802599 m!744093))

(declare-fun m!744101 () Bool)

(assert (=> b!802599 m!744101))

(declare-fun m!744103 () Bool)

(assert (=> b!802595 m!744103))

(declare-fun m!744105 () Bool)

(assert (=> b!802595 m!744105))

(declare-fun m!744107 () Bool)

(assert (=> b!802595 m!744107))

(declare-fun m!744109 () Bool)

(assert (=> b!802595 m!744109))

(declare-fun m!744111 () Bool)

(assert (=> start!68842 m!744111))

(declare-fun m!744113 () Bool)

(assert (=> start!68842 m!744113))

(declare-fun m!744115 () Bool)

(assert (=> b!802590 m!744115))

(assert (=> b!802590 m!744093))

(assert (=> b!802593 m!744093))

(assert (=> b!802593 m!744093))

(declare-fun m!744117 () Bool)

(assert (=> b!802593 m!744117))

(assert (=> b!802598 m!744093))

(assert (=> b!802598 m!744093))

(declare-fun m!744119 () Bool)

(assert (=> b!802598 m!744119))

(assert (=> b!802598 m!744093))

(declare-fun m!744121 () Bool)

(assert (=> b!802598 m!744121))

(declare-fun m!744123 () Bool)

(assert (=> b!802591 m!744123))

(declare-fun m!744125 () Bool)

(assert (=> b!802588 m!744125))

(declare-fun m!744127 () Bool)

(assert (=> b!802597 m!744127))

(check-sat (not b!802596) (not b!802589) (not start!68842) (not b!802591) (not b!802599) (not b!802595) (not b!802597) (not b!802598) (not b!802588) (not b!802593))
(check-sat)
