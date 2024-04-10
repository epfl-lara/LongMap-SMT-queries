; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68860 () Bool)

(assert start!68860)

(declare-fun res!547418 () Bool)

(declare-fun e!444934 () Bool)

(assert (=> start!68860 (=> (not res!547418) (not e!444934))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68860 (= res!547418 (validMask!0 mask!3266))))

(assert (=> start!68860 e!444934))

(assert (=> start!68860 true))

(declare-datatypes ((array!43650 0))(
  ( (array!43651 (arr!20905 (Array (_ BitVec 32) (_ BitVec 64))) (size!21326 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43650)

(declare-fun array_inv!16701 (array!43650) Bool)

(assert (=> start!68860 (array_inv!16701 a!3170)))

(declare-fun b!802898 () Bool)

(declare-fun e!444935 () Bool)

(declare-fun e!444932 () Bool)

(assert (=> b!802898 (= e!444935 e!444932)))

(declare-fun res!547423 () Bool)

(assert (=> b!802898 (=> (not res!547423) (not e!444932))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359183 () (_ BitVec 64))

(declare-fun lt!359189 () array!43650)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8496 0))(
  ( (MissingZero!8496 (index!36352 (_ BitVec 32))) (Found!8496 (index!36353 (_ BitVec 32))) (Intermediate!8496 (undefined!9308 Bool) (index!36354 (_ BitVec 32)) (x!67198 (_ BitVec 32))) (Undefined!8496) (MissingVacant!8496 (index!36355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43650 (_ BitVec 32)) SeekEntryResult!8496)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43650 (_ BitVec 32)) SeekEntryResult!8496)

(assert (=> b!802898 (= res!547423 (= (seekEntryOrOpen!0 lt!359183 lt!359189 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359183 lt!359189 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802898 (= lt!359183 (select (store (arr!20905 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802898 (= lt!359189 (array!43651 (store (arr!20905 a!3170) i!1163 k0!2044) (size!21326 a!3170)))))

(declare-fun b!802899 () Bool)

(declare-fun e!444931 () Bool)

(assert (=> b!802899 (= e!444931 (not true))))

(declare-fun lt!359187 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802899 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359187 vacantAfter!23 lt!359183 lt!359189 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359187 vacantBefore!23 (select (arr!20905 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27532 0))(
  ( (Unit!27533) )
))
(declare-fun lt!359184 () Unit!27532)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43650 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27532)

(assert (=> b!802899 (= lt!359184 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359187 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802899 (= lt!359187 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802900 () Bool)

(declare-fun res!547420 () Bool)

(assert (=> b!802900 (=> (not res!547420) (not e!444935))))

(declare-datatypes ((List!14868 0))(
  ( (Nil!14865) (Cons!14864 (h!15993 (_ BitVec 64)) (t!21183 List!14868)) )
))
(declare-fun arrayNoDuplicates!0 (array!43650 (_ BitVec 32) List!14868) Bool)

(assert (=> b!802900 (= res!547420 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14865))))

(declare-fun b!802901 () Bool)

(declare-fun res!547422 () Bool)

(assert (=> b!802901 (=> (not res!547422) (not e!444934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802901 (= res!547422 (validKeyInArray!0 k0!2044))))

(declare-fun b!802902 () Bool)

(declare-fun res!547424 () Bool)

(assert (=> b!802902 (=> (not res!547424) (not e!444934))))

(assert (=> b!802902 (= res!547424 (and (= (size!21326 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21326 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21326 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802903 () Bool)

(declare-fun res!547427 () Bool)

(assert (=> b!802903 (=> (not res!547427) (not e!444934))))

(declare-fun arrayContainsKey!0 (array!43650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802903 (= res!547427 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802904 () Bool)

(declare-fun res!547419 () Bool)

(assert (=> b!802904 (=> (not res!547419) (not e!444935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43650 (_ BitVec 32)) Bool)

(assert (=> b!802904 (= res!547419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802905 () Bool)

(assert (=> b!802905 (= e!444932 e!444931)))

(declare-fun res!547426 () Bool)

(assert (=> b!802905 (=> (not res!547426) (not e!444931))))

(declare-fun lt!359188 () SeekEntryResult!8496)

(declare-fun lt!359186 () SeekEntryResult!8496)

(assert (=> b!802905 (= res!547426 (and (= lt!359186 lt!359188) (= lt!359188 (Found!8496 j!153)) (not (= (select (arr!20905 a!3170) index!1236) (select (arr!20905 a!3170) j!153)))))))

(assert (=> b!802905 (= lt!359188 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20905 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802905 (= lt!359186 (seekEntryOrOpen!0 (select (arr!20905 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802906 () Bool)

(declare-fun res!547417 () Bool)

(assert (=> b!802906 (=> (not res!547417) (not e!444935))))

(assert (=> b!802906 (= res!547417 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21326 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20905 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21326 a!3170)) (= (select (arr!20905 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802907 () Bool)

(declare-fun res!547421 () Bool)

(assert (=> b!802907 (=> (not res!547421) (not e!444934))))

(assert (=> b!802907 (= res!547421 (validKeyInArray!0 (select (arr!20905 a!3170) j!153)))))

(declare-fun b!802908 () Bool)

(assert (=> b!802908 (= e!444934 e!444935)))

(declare-fun res!547425 () Bool)

(assert (=> b!802908 (=> (not res!547425) (not e!444935))))

(declare-fun lt!359185 () SeekEntryResult!8496)

(assert (=> b!802908 (= res!547425 (or (= lt!359185 (MissingZero!8496 i!1163)) (= lt!359185 (MissingVacant!8496 i!1163))))))

(assert (=> b!802908 (= lt!359185 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68860 res!547418) b!802902))

(assert (= (and b!802902 res!547424) b!802907))

(assert (= (and b!802907 res!547421) b!802901))

(assert (= (and b!802901 res!547422) b!802903))

(assert (= (and b!802903 res!547427) b!802908))

(assert (= (and b!802908 res!547425) b!802904))

(assert (= (and b!802904 res!547419) b!802900))

(assert (= (and b!802900 res!547420) b!802906))

(assert (= (and b!802906 res!547417) b!802898))

(assert (= (and b!802898 res!547423) b!802905))

(assert (= (and b!802905 res!547426) b!802899))

(declare-fun m!744481 () Bool)

(assert (=> b!802908 m!744481))

(declare-fun m!744483 () Bool)

(assert (=> b!802906 m!744483))

(declare-fun m!744485 () Bool)

(assert (=> b!802906 m!744485))

(declare-fun m!744487 () Bool)

(assert (=> b!802904 m!744487))

(declare-fun m!744489 () Bool)

(assert (=> b!802905 m!744489))

(declare-fun m!744491 () Bool)

(assert (=> b!802905 m!744491))

(assert (=> b!802905 m!744491))

(declare-fun m!744493 () Bool)

(assert (=> b!802905 m!744493))

(assert (=> b!802905 m!744491))

(declare-fun m!744495 () Bool)

(assert (=> b!802905 m!744495))

(declare-fun m!744497 () Bool)

(assert (=> b!802900 m!744497))

(declare-fun m!744499 () Bool)

(assert (=> b!802901 m!744499))

(declare-fun m!744501 () Bool)

(assert (=> b!802903 m!744501))

(declare-fun m!744503 () Bool)

(assert (=> start!68860 m!744503))

(declare-fun m!744505 () Bool)

(assert (=> start!68860 m!744505))

(assert (=> b!802899 m!744491))

(declare-fun m!744507 () Bool)

(assert (=> b!802899 m!744507))

(declare-fun m!744509 () Bool)

(assert (=> b!802899 m!744509))

(assert (=> b!802899 m!744491))

(declare-fun m!744511 () Bool)

(assert (=> b!802899 m!744511))

(declare-fun m!744513 () Bool)

(assert (=> b!802899 m!744513))

(declare-fun m!744515 () Bool)

(assert (=> b!802898 m!744515))

(declare-fun m!744517 () Bool)

(assert (=> b!802898 m!744517))

(declare-fun m!744519 () Bool)

(assert (=> b!802898 m!744519))

(declare-fun m!744521 () Bool)

(assert (=> b!802898 m!744521))

(assert (=> b!802907 m!744491))

(assert (=> b!802907 m!744491))

(declare-fun m!744523 () Bool)

(assert (=> b!802907 m!744523))

(check-sat (not start!68860) (not b!802903) (not b!802904) (not b!802907) (not b!802908) (not b!802899) (not b!802905) (not b!802901) (not b!802900) (not b!802898))
(check-sat)
