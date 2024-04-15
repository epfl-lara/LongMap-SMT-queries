; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68766 () Bool)

(assert start!68766)

(declare-fun b!801401 () Bool)

(declare-fun res!546059 () Bool)

(declare-fun e!444199 () Bool)

(assert (=> b!801401 (=> (not res!546059) (not e!444199))))

(declare-datatypes ((array!43573 0))(
  ( (array!43574 (arr!20867 (Array (_ BitVec 32) (_ BitVec 64))) (size!21288 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43573)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801401 (= res!546059 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801402 () Bool)

(declare-fun e!444198 () Bool)

(assert (=> b!801402 (= e!444198 (not true))))

(declare-fun lt!358117 () array!43573)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358116 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358118 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8455 0))(
  ( (MissingZero!8455 (index!36188 (_ BitVec 32))) (Found!8455 (index!36189 (_ BitVec 32))) (Intermediate!8455 (undefined!9267 Bool) (index!36190 (_ BitVec 32)) (x!67056 (_ BitVec 32))) (Undefined!8455) (MissingVacant!8455 (index!36191 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43573 (_ BitVec 32)) SeekEntryResult!8455)

(assert (=> b!801402 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358118 vacantAfter!23 lt!358116 lt!358117 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358118 vacantBefore!23 (select (arr!20867 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27424 0))(
  ( (Unit!27425) )
))
(declare-fun lt!358114 () Unit!27424)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43573 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27424)

(assert (=> b!801402 (= lt!358114 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358118 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801402 (= lt!358118 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801403 () Bool)

(declare-fun res!546060 () Bool)

(assert (=> b!801403 (=> (not res!546060) (not e!444199))))

(assert (=> b!801403 (= res!546060 (and (= (size!21288 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21288 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21288 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801404 () Bool)

(declare-fun res!546064 () Bool)

(assert (=> b!801404 (=> (not res!546064) (not e!444199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801404 (= res!546064 (validKeyInArray!0 k0!2044))))

(declare-fun b!801405 () Bool)

(declare-fun res!546063 () Bool)

(assert (=> b!801405 (=> (not res!546063) (not e!444199))))

(assert (=> b!801405 (= res!546063 (validKeyInArray!0 (select (arr!20867 a!3170) j!153)))))

(declare-fun b!801406 () Bool)

(declare-fun res!546067 () Bool)

(declare-fun e!444197 () Bool)

(assert (=> b!801406 (=> (not res!546067) (not e!444197))))

(declare-datatypes ((List!14869 0))(
  ( (Nil!14866) (Cons!14865 (h!15994 (_ BitVec 64)) (t!21175 List!14869)) )
))
(declare-fun arrayNoDuplicates!0 (array!43573 (_ BitVec 32) List!14869) Bool)

(assert (=> b!801406 (= res!546067 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14866))))

(declare-fun res!546065 () Bool)

(assert (=> start!68766 (=> (not res!546065) (not e!444199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68766 (= res!546065 (validMask!0 mask!3266))))

(assert (=> start!68766 e!444199))

(assert (=> start!68766 true))

(declare-fun array_inv!16750 (array!43573) Bool)

(assert (=> start!68766 (array_inv!16750 a!3170)))

(declare-fun b!801400 () Bool)

(declare-fun e!444196 () Bool)

(assert (=> b!801400 (= e!444196 e!444198)))

(declare-fun res!546066 () Bool)

(assert (=> b!801400 (=> (not res!546066) (not e!444198))))

(declare-fun lt!358113 () SeekEntryResult!8455)

(declare-fun lt!358115 () SeekEntryResult!8455)

(assert (=> b!801400 (= res!546066 (and (= lt!358115 lt!358113) (= lt!358113 (Found!8455 j!153)) (not (= (select (arr!20867 a!3170) index!1236) (select (arr!20867 a!3170) j!153)))))))

(assert (=> b!801400 (= lt!358113 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20867 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43573 (_ BitVec 32)) SeekEntryResult!8455)

(assert (=> b!801400 (= lt!358115 (seekEntryOrOpen!0 (select (arr!20867 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801407 () Bool)

(assert (=> b!801407 (= e!444199 e!444197)))

(declare-fun res!546061 () Bool)

(assert (=> b!801407 (=> (not res!546061) (not e!444197))))

(declare-fun lt!358112 () SeekEntryResult!8455)

(assert (=> b!801407 (= res!546061 (or (= lt!358112 (MissingZero!8455 i!1163)) (= lt!358112 (MissingVacant!8455 i!1163))))))

(assert (=> b!801407 (= lt!358112 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801408 () Bool)

(declare-fun res!546062 () Bool)

(assert (=> b!801408 (=> (not res!546062) (not e!444197))))

(assert (=> b!801408 (= res!546062 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21288 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20867 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21288 a!3170)) (= (select (arr!20867 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801409 () Bool)

(declare-fun res!546068 () Bool)

(assert (=> b!801409 (=> (not res!546068) (not e!444197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43573 (_ BitVec 32)) Bool)

(assert (=> b!801409 (= res!546068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801410 () Bool)

(assert (=> b!801410 (= e!444197 e!444196)))

(declare-fun res!546069 () Bool)

(assert (=> b!801410 (=> (not res!546069) (not e!444196))))

(assert (=> b!801410 (= res!546069 (= (seekEntryOrOpen!0 lt!358116 lt!358117 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358116 lt!358117 mask!3266)))))

(assert (=> b!801410 (= lt!358116 (select (store (arr!20867 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801410 (= lt!358117 (array!43574 (store (arr!20867 a!3170) i!1163 k0!2044) (size!21288 a!3170)))))

(assert (= (and start!68766 res!546065) b!801403))

(assert (= (and b!801403 res!546060) b!801405))

(assert (= (and b!801405 res!546063) b!801404))

(assert (= (and b!801404 res!546064) b!801401))

(assert (= (and b!801401 res!546059) b!801407))

(assert (= (and b!801407 res!546061) b!801409))

(assert (= (and b!801409 res!546068) b!801406))

(assert (= (and b!801406 res!546067) b!801408))

(assert (= (and b!801408 res!546062) b!801410))

(assert (= (and b!801410 res!546069) b!801400))

(assert (= (and b!801400 res!546066) b!801402))

(declare-fun m!742093 () Bool)

(assert (=> b!801407 m!742093))

(declare-fun m!742095 () Bool)

(assert (=> b!801400 m!742095))

(declare-fun m!742097 () Bool)

(assert (=> b!801400 m!742097))

(assert (=> b!801400 m!742097))

(declare-fun m!742099 () Bool)

(assert (=> b!801400 m!742099))

(assert (=> b!801400 m!742097))

(declare-fun m!742101 () Bool)

(assert (=> b!801400 m!742101))

(declare-fun m!742103 () Bool)

(assert (=> b!801408 m!742103))

(declare-fun m!742105 () Bool)

(assert (=> b!801408 m!742105))

(declare-fun m!742107 () Bool)

(assert (=> b!801410 m!742107))

(declare-fun m!742109 () Bool)

(assert (=> b!801410 m!742109))

(declare-fun m!742111 () Bool)

(assert (=> b!801410 m!742111))

(declare-fun m!742113 () Bool)

(assert (=> b!801410 m!742113))

(declare-fun m!742115 () Bool)

(assert (=> start!68766 m!742115))

(declare-fun m!742117 () Bool)

(assert (=> start!68766 m!742117))

(declare-fun m!742119 () Bool)

(assert (=> b!801406 m!742119))

(declare-fun m!742121 () Bool)

(assert (=> b!801401 m!742121))

(assert (=> b!801405 m!742097))

(assert (=> b!801405 m!742097))

(declare-fun m!742123 () Bool)

(assert (=> b!801405 m!742123))

(declare-fun m!742125 () Bool)

(assert (=> b!801404 m!742125))

(declare-fun m!742127 () Bool)

(assert (=> b!801409 m!742127))

(assert (=> b!801402 m!742097))

(declare-fun m!742129 () Bool)

(assert (=> b!801402 m!742129))

(declare-fun m!742131 () Bool)

(assert (=> b!801402 m!742131))

(declare-fun m!742133 () Bool)

(assert (=> b!801402 m!742133))

(assert (=> b!801402 m!742097))

(declare-fun m!742135 () Bool)

(assert (=> b!801402 m!742135))

(check-sat (not b!801409) (not b!801401) (not b!801404) (not b!801402) (not b!801405) (not b!801410) (not b!801406) (not start!68766) (not b!801407) (not b!801400))
(check-sat)
