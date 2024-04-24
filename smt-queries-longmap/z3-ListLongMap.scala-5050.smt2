; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68978 () Bool)

(assert start!68978)

(declare-fun b!802934 () Bool)

(declare-fun e!445104 () Bool)

(declare-fun e!445103 () Bool)

(assert (=> b!802934 (= e!445104 e!445103)))

(declare-fun res!546911 () Bool)

(assert (=> b!802934 (=> (not res!546911) (not e!445103))))

(declare-datatypes ((SeekEntryResult!8422 0))(
  ( (MissingZero!8422 (index!36056 (_ BitVec 32))) (Found!8422 (index!36057 (_ BitVec 32))) (Intermediate!8422 (undefined!9234 Bool) (index!36058 (_ BitVec 32)) (x!67074 (_ BitVec 32))) (Undefined!8422) (MissingVacant!8422 (index!36059 (_ BitVec 32))) )
))
(declare-fun lt!358963 () SeekEntryResult!8422)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802934 (= res!546911 (or (= lt!358963 (MissingZero!8422 i!1163)) (= lt!358963 (MissingVacant!8422 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43600 0))(
  ( (array!43601 (arr!20875 (Array (_ BitVec 32) (_ BitVec 64))) (size!21295 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43600)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43600 (_ BitVec 32)) SeekEntryResult!8422)

(assert (=> b!802934 (= lt!358963 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802935 () Bool)

(declare-fun res!546908 () Bool)

(assert (=> b!802935 (=> (not res!546908) (not e!445103))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802935 (= res!546908 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21295 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20875 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21295 a!3170)) (= (select (arr!20875 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802936 () Bool)

(declare-fun e!445102 () Bool)

(assert (=> b!802936 (= e!445103 e!445102)))

(declare-fun res!546915 () Bool)

(assert (=> b!802936 (=> (not res!546915) (not e!445102))))

(declare-fun lt!358966 () (_ BitVec 64))

(declare-fun lt!358962 () array!43600)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43600 (_ BitVec 32)) SeekEntryResult!8422)

(assert (=> b!802936 (= res!546915 (= (seekEntryOrOpen!0 lt!358966 lt!358962 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358966 lt!358962 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802936 (= lt!358966 (select (store (arr!20875 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802936 (= lt!358962 (array!43601 (store (arr!20875 a!3170) i!1163 k0!2044) (size!21295 a!3170)))))

(declare-fun res!546906 () Bool)

(assert (=> start!68978 (=> (not res!546906) (not e!445104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68978 (= res!546906 (validMask!0 mask!3266))))

(assert (=> start!68978 e!445104))

(assert (=> start!68978 true))

(declare-fun array_inv!16734 (array!43600) Bool)

(assert (=> start!68978 (array_inv!16734 a!3170)))

(declare-fun b!802937 () Bool)

(declare-fun res!546909 () Bool)

(assert (=> b!802937 (=> (not res!546909) (not e!445104))))

(declare-fun arrayContainsKey!0 (array!43600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802937 (= res!546909 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802938 () Bool)

(declare-fun res!546905 () Bool)

(assert (=> b!802938 (=> (not res!546905) (not e!445104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802938 (= res!546905 (validKeyInArray!0 (select (arr!20875 a!3170) j!153)))))

(declare-fun b!802939 () Bool)

(declare-fun e!445101 () Bool)

(assert (=> b!802939 (= e!445101 (not true))))

(declare-fun lt!358967 () (_ BitVec 32))

(assert (=> b!802939 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358967 vacantAfter!23 lt!358966 lt!358962 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358967 vacantBefore!23 (select (arr!20875 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27469 0))(
  ( (Unit!27470) )
))
(declare-fun lt!358964 () Unit!27469)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27469)

(assert (=> b!802939 (= lt!358964 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358967 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802939 (= lt!358967 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802940 () Bool)

(declare-fun res!546912 () Bool)

(assert (=> b!802940 (=> (not res!546912) (not e!445103))))

(declare-datatypes ((List!14745 0))(
  ( (Nil!14742) (Cons!14741 (h!15876 (_ BitVec 64)) (t!21052 List!14745)) )
))
(declare-fun arrayNoDuplicates!0 (array!43600 (_ BitVec 32) List!14745) Bool)

(assert (=> b!802940 (= res!546912 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14742))))

(declare-fun b!802941 () Bool)

(declare-fun res!546910 () Bool)

(assert (=> b!802941 (=> (not res!546910) (not e!445104))))

(assert (=> b!802941 (= res!546910 (and (= (size!21295 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21295 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21295 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802942 () Bool)

(declare-fun res!546907 () Bool)

(assert (=> b!802942 (=> (not res!546907) (not e!445104))))

(assert (=> b!802942 (= res!546907 (validKeyInArray!0 k0!2044))))

(declare-fun b!802943 () Bool)

(declare-fun res!546914 () Bool)

(assert (=> b!802943 (=> (not res!546914) (not e!445103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43600 (_ BitVec 32)) Bool)

(assert (=> b!802943 (= res!546914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802944 () Bool)

(assert (=> b!802944 (= e!445102 e!445101)))

(declare-fun res!546913 () Bool)

(assert (=> b!802944 (=> (not res!546913) (not e!445101))))

(declare-fun lt!358965 () SeekEntryResult!8422)

(declare-fun lt!358961 () SeekEntryResult!8422)

(assert (=> b!802944 (= res!546913 (and (= lt!358961 lt!358965) (= lt!358965 (Found!8422 j!153)) (not (= (select (arr!20875 a!3170) index!1236) (select (arr!20875 a!3170) j!153)))))))

(assert (=> b!802944 (= lt!358965 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20875 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802944 (= lt!358961 (seekEntryOrOpen!0 (select (arr!20875 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68978 res!546906) b!802941))

(assert (= (and b!802941 res!546910) b!802938))

(assert (= (and b!802938 res!546905) b!802942))

(assert (= (and b!802942 res!546907) b!802937))

(assert (= (and b!802937 res!546909) b!802934))

(assert (= (and b!802934 res!546911) b!802943))

(assert (= (and b!802943 res!546914) b!802940))

(assert (= (and b!802940 res!546912) b!802935))

(assert (= (and b!802935 res!546908) b!802936))

(assert (= (and b!802936 res!546915) b!802944))

(assert (= (and b!802944 res!546913) b!802939))

(declare-fun m!744619 () Bool)

(assert (=> b!802944 m!744619))

(declare-fun m!744621 () Bool)

(assert (=> b!802944 m!744621))

(assert (=> b!802944 m!744621))

(declare-fun m!744623 () Bool)

(assert (=> b!802944 m!744623))

(assert (=> b!802944 m!744621))

(declare-fun m!744625 () Bool)

(assert (=> b!802944 m!744625))

(declare-fun m!744627 () Bool)

(assert (=> b!802943 m!744627))

(declare-fun m!744629 () Bool)

(assert (=> b!802940 m!744629))

(declare-fun m!744631 () Bool)

(assert (=> start!68978 m!744631))

(declare-fun m!744633 () Bool)

(assert (=> start!68978 m!744633))

(declare-fun m!744635 () Bool)

(assert (=> b!802936 m!744635))

(declare-fun m!744637 () Bool)

(assert (=> b!802936 m!744637))

(declare-fun m!744639 () Bool)

(assert (=> b!802936 m!744639))

(declare-fun m!744641 () Bool)

(assert (=> b!802936 m!744641))

(assert (=> b!802938 m!744621))

(assert (=> b!802938 m!744621))

(declare-fun m!744643 () Bool)

(assert (=> b!802938 m!744643))

(declare-fun m!744645 () Bool)

(assert (=> b!802934 m!744645))

(declare-fun m!744647 () Bool)

(assert (=> b!802937 m!744647))

(declare-fun m!744649 () Bool)

(assert (=> b!802942 m!744649))

(declare-fun m!744651 () Bool)

(assert (=> b!802935 m!744651))

(declare-fun m!744653 () Bool)

(assert (=> b!802935 m!744653))

(declare-fun m!744655 () Bool)

(assert (=> b!802939 m!744655))

(assert (=> b!802939 m!744621))

(declare-fun m!744657 () Bool)

(assert (=> b!802939 m!744657))

(assert (=> b!802939 m!744621))

(declare-fun m!744659 () Bool)

(assert (=> b!802939 m!744659))

(declare-fun m!744661 () Bool)

(assert (=> b!802939 m!744661))

(check-sat (not b!802944) (not start!68978) (not b!802938) (not b!802939) (not b!802943) (not b!802940) (not b!802936) (not b!802934) (not b!802937) (not b!802942))
(check-sat)
