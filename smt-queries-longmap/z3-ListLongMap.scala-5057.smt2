; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68832 () Bool)

(assert start!68832)

(declare-fun b!802509 () Bool)

(declare-fun res!547170 () Bool)

(declare-fun e!444711 () Bool)

(assert (=> b!802509 (=> (not res!547170) (not e!444711))))

(declare-datatypes ((array!43639 0))(
  ( (array!43640 (arr!20900 (Array (_ BitVec 32) (_ BitVec 64))) (size!21321 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43639)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43639 (_ BitVec 32)) Bool)

(assert (=> b!802509 (= res!547170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802510 () Bool)

(declare-fun e!444714 () Bool)

(assert (=> b!802510 (= e!444711 e!444714)))

(declare-fun res!547173 () Bool)

(assert (=> b!802510 (=> (not res!547173) (not e!444714))))

(declare-datatypes ((SeekEntryResult!8488 0))(
  ( (MissingZero!8488 (index!36320 (_ BitVec 32))) (Found!8488 (index!36321 (_ BitVec 32))) (Intermediate!8488 (undefined!9300 Bool) (index!36322 (_ BitVec 32)) (x!67177 (_ BitVec 32))) (Undefined!8488) (MissingVacant!8488 (index!36323 (_ BitVec 32))) )
))
(declare-fun lt!358840 () SeekEntryResult!8488)

(declare-fun lt!358842 () SeekEntryResult!8488)

(assert (=> b!802510 (= res!547173 (= lt!358840 lt!358842))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358839 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!358841 () array!43639)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43639 (_ BitVec 32)) SeekEntryResult!8488)

(assert (=> b!802510 (= lt!358842 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358839 lt!358841 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43639 (_ BitVec 32)) SeekEntryResult!8488)

(assert (=> b!802510 (= lt!358840 (seekEntryOrOpen!0 lt!358839 lt!358841 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802510 (= lt!358839 (select (store (arr!20900 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802510 (= lt!358841 (array!43640 (store (arr!20900 a!3170) i!1163 k0!2044) (size!21321 a!3170)))))

(declare-fun b!802511 () Bool)

(declare-fun res!547175 () Bool)

(assert (=> b!802511 (=> (not res!547175) (not e!444711))))

(declare-datatypes ((List!14902 0))(
  ( (Nil!14899) (Cons!14898 (h!16027 (_ BitVec 64)) (t!21208 List!14902)) )
))
(declare-fun arrayNoDuplicates!0 (array!43639 (_ BitVec 32) List!14902) Bool)

(assert (=> b!802511 (= res!547175 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14899))))

(declare-fun b!802512 () Bool)

(declare-fun res!547174 () Bool)

(declare-fun e!444713 () Bool)

(assert (=> b!802512 (=> (not res!547174) (not e!444713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802512 (= res!547174 (validKeyInArray!0 (select (arr!20900 a!3170) j!153)))))

(declare-fun b!802513 () Bool)

(declare-fun e!444710 () Bool)

(declare-fun e!444715 () Bool)

(assert (=> b!802513 (= e!444710 e!444715)))

(declare-fun res!547177 () Bool)

(assert (=> b!802513 (=> (not res!547177) (not e!444715))))

(declare-fun lt!358843 () SeekEntryResult!8488)

(declare-fun lt!358844 () SeekEntryResult!8488)

(assert (=> b!802513 (= res!547177 (and (= lt!358844 lt!358843) (not (= (select (arr!20900 a!3170) index!1236) (select (arr!20900 a!3170) j!153)))))))

(assert (=> b!802513 (= lt!358843 (Found!8488 j!153))))

(declare-fun res!547171 () Bool)

(assert (=> start!68832 (=> (not res!547171) (not e!444713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68832 (= res!547171 (validMask!0 mask!3266))))

(assert (=> start!68832 e!444713))

(assert (=> start!68832 true))

(declare-fun array_inv!16783 (array!43639) Bool)

(assert (=> start!68832 (array_inv!16783 a!3170)))

(declare-fun b!802514 () Bool)

(declare-fun res!547178 () Bool)

(assert (=> b!802514 (=> (not res!547178) (not e!444713))))

(declare-fun arrayContainsKey!0 (array!43639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802514 (= res!547178 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802515 () Bool)

(assert (=> b!802515 (= e!444713 e!444711)))

(declare-fun res!547169 () Bool)

(assert (=> b!802515 (=> (not res!547169) (not e!444711))))

(declare-fun lt!358846 () SeekEntryResult!8488)

(assert (=> b!802515 (= res!547169 (or (= lt!358846 (MissingZero!8488 i!1163)) (= lt!358846 (MissingVacant!8488 i!1163))))))

(assert (=> b!802515 (= lt!358846 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802516 () Bool)

(declare-fun res!547176 () Bool)

(assert (=> b!802516 (=> (not res!547176) (not e!444713))))

(assert (=> b!802516 (= res!547176 (and (= (size!21321 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21321 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21321 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802517 () Bool)

(assert (=> b!802517 (= e!444714 e!444710)))

(declare-fun res!547172 () Bool)

(assert (=> b!802517 (=> (not res!547172) (not e!444710))))

(declare-fun lt!358847 () SeekEntryResult!8488)

(assert (=> b!802517 (= res!547172 (= lt!358847 lt!358844))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802517 (= lt!358844 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20900 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802517 (= lt!358847 (seekEntryOrOpen!0 (select (arr!20900 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802518 () Bool)

(declare-fun res!547179 () Bool)

(assert (=> b!802518 (=> (not res!547179) (not e!444711))))

(assert (=> b!802518 (= res!547179 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21321 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20900 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21321 a!3170)) (= (select (arr!20900 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802519 () Bool)

(declare-fun res!547168 () Bool)

(assert (=> b!802519 (=> (not res!547168) (not e!444713))))

(assert (=> b!802519 (= res!547168 (validKeyInArray!0 k0!2044))))

(declare-fun b!802520 () Bool)

(assert (=> b!802520 (= e!444715 (not (or (not (= lt!358842 lt!358843)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358838 () (_ BitVec 32))

(assert (=> b!802520 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358838 vacantAfter!23 lt!358839 lt!358841 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358838 vacantBefore!23 (select (arr!20900 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27490 0))(
  ( (Unit!27491) )
))
(declare-fun lt!358845 () Unit!27490)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43639 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27490)

(assert (=> b!802520 (= lt!358845 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358838 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802520 (= lt!358838 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68832 res!547171) b!802516))

(assert (= (and b!802516 res!547176) b!802512))

(assert (= (and b!802512 res!547174) b!802519))

(assert (= (and b!802519 res!547168) b!802514))

(assert (= (and b!802514 res!547178) b!802515))

(assert (= (and b!802515 res!547169) b!802509))

(assert (= (and b!802509 res!547170) b!802511))

(assert (= (and b!802511 res!547175) b!802518))

(assert (= (and b!802518 res!547179) b!802510))

(assert (= (and b!802510 res!547173) b!802517))

(assert (= (and b!802517 res!547172) b!802513))

(assert (= (and b!802513 res!547177) b!802520))

(declare-fun m!743563 () Bool)

(assert (=> b!802514 m!743563))

(declare-fun m!743565 () Bool)

(assert (=> b!802509 m!743565))

(declare-fun m!743567 () Bool)

(assert (=> b!802518 m!743567))

(declare-fun m!743569 () Bool)

(assert (=> b!802518 m!743569))

(declare-fun m!743571 () Bool)

(assert (=> start!68832 m!743571))

(declare-fun m!743573 () Bool)

(assert (=> start!68832 m!743573))

(declare-fun m!743575 () Bool)

(assert (=> b!802511 m!743575))

(declare-fun m!743577 () Bool)

(assert (=> b!802512 m!743577))

(assert (=> b!802512 m!743577))

(declare-fun m!743579 () Bool)

(assert (=> b!802512 m!743579))

(declare-fun m!743581 () Bool)

(assert (=> b!802515 m!743581))

(assert (=> b!802520 m!743577))

(declare-fun m!743583 () Bool)

(assert (=> b!802520 m!743583))

(assert (=> b!802520 m!743577))

(declare-fun m!743585 () Bool)

(assert (=> b!802520 m!743585))

(declare-fun m!743587 () Bool)

(assert (=> b!802520 m!743587))

(declare-fun m!743589 () Bool)

(assert (=> b!802520 m!743589))

(declare-fun m!743591 () Bool)

(assert (=> b!802513 m!743591))

(assert (=> b!802513 m!743577))

(declare-fun m!743593 () Bool)

(assert (=> b!802519 m!743593))

(declare-fun m!743595 () Bool)

(assert (=> b!802510 m!743595))

(declare-fun m!743597 () Bool)

(assert (=> b!802510 m!743597))

(declare-fun m!743599 () Bool)

(assert (=> b!802510 m!743599))

(declare-fun m!743601 () Bool)

(assert (=> b!802510 m!743601))

(assert (=> b!802517 m!743577))

(assert (=> b!802517 m!743577))

(declare-fun m!743603 () Bool)

(assert (=> b!802517 m!743603))

(assert (=> b!802517 m!743577))

(declare-fun m!743605 () Bool)

(assert (=> b!802517 m!743605))

(check-sat (not b!802519) (not b!802520) (not b!802514) (not b!802509) (not b!802511) (not start!68832) (not b!802517) (not b!802515) (not b!802512) (not b!802510))
(check-sat)
