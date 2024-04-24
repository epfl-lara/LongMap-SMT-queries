; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68930 () Bool)

(assert start!68930)

(declare-fun b!802074 () Bool)

(declare-fun e!444707 () Bool)

(assert (=> b!802074 (= e!444707 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8398 0))(
  ( (MissingZero!8398 (index!35960 (_ BitVec 32))) (Found!8398 (index!35961 (_ BitVec 32))) (Intermediate!8398 (undefined!9210 Bool) (index!35962 (_ BitVec 32)) (x!66986 (_ BitVec 32))) (Undefined!8398) (MissingVacant!8398 (index!35963 (_ BitVec 32))) )
))
(declare-fun lt!358425 () SeekEntryResult!8398)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((array!43552 0))(
  ( (array!43553 (arr!20851 (Array (_ BitVec 32) (_ BitVec 64))) (size!21271 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43552)

(declare-fun lt!358430 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43552 (_ BitVec 32)) SeekEntryResult!8398)

(assert (=> b!802074 (= lt!358425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358430 vacantBefore!23 (select (arr!20851 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802075 () Bool)

(declare-fun e!444712 () Bool)

(declare-fun e!444710 () Bool)

(assert (=> b!802075 (= e!444712 e!444710)))

(declare-fun res!546046 () Bool)

(assert (=> b!802075 (=> (not res!546046) (not e!444710))))

(declare-fun lt!358424 () SeekEntryResult!8398)

(declare-fun lt!358423 () SeekEntryResult!8398)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802075 (= res!546046 (and (= lt!358423 lt!358424) (= lt!358424 (Found!8398 j!153)) (not (= (select (arr!20851 a!3170) index!1236) (select (arr!20851 a!3170) j!153)))))))

(assert (=> b!802075 (= lt!358424 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20851 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43552 (_ BitVec 32)) SeekEntryResult!8398)

(assert (=> b!802075 (= lt!358423 (seekEntryOrOpen!0 (select (arr!20851 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802076 () Bool)

(declare-fun res!546050 () Bool)

(declare-fun e!444711 () Bool)

(assert (=> b!802076 (=> (not res!546050) (not e!444711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802076 (= res!546050 (validKeyInArray!0 (select (arr!20851 a!3170) j!153)))))

(declare-fun b!802077 () Bool)

(declare-fun res!546047 () Bool)

(declare-fun e!444708 () Bool)

(assert (=> b!802077 (=> (not res!546047) (not e!444708))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802077 (= res!546047 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21271 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20851 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21271 a!3170)) (= (select (arr!20851 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802078 () Bool)

(declare-fun res!546053 () Bool)

(assert (=> b!802078 (=> (not res!546053) (not e!444711))))

(assert (=> b!802078 (= res!546053 (and (= (size!21271 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21271 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21271 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802079 () Bool)

(assert (=> b!802079 (= e!444708 e!444712)))

(declare-fun res!546045 () Bool)

(assert (=> b!802079 (=> (not res!546045) (not e!444712))))

(declare-fun lt!358428 () (_ BitVec 64))

(declare-fun lt!358427 () SeekEntryResult!8398)

(declare-fun lt!358426 () array!43552)

(assert (=> b!802079 (= res!546045 (= lt!358427 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358428 lt!358426 mask!3266)))))

(assert (=> b!802079 (= lt!358427 (seekEntryOrOpen!0 lt!358428 lt!358426 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!802079 (= lt!358428 (select (store (arr!20851 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802079 (= lt!358426 (array!43553 (store (arr!20851 a!3170) i!1163 k0!2044) (size!21271 a!3170)))))

(declare-fun b!802080 () Bool)

(assert (=> b!802080 (= e!444711 e!444708)))

(declare-fun res!546057 () Bool)

(assert (=> b!802080 (=> (not res!546057) (not e!444708))))

(declare-fun lt!358429 () SeekEntryResult!8398)

(assert (=> b!802080 (= res!546057 (or (= lt!358429 (MissingZero!8398 i!1163)) (= lt!358429 (MissingVacant!8398 i!1163))))))

(assert (=> b!802080 (= lt!358429 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802081 () Bool)

(declare-fun res!546049 () Bool)

(assert (=> b!802081 (=> (not res!546049) (not e!444708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43552 (_ BitVec 32)) Bool)

(assert (=> b!802081 (= res!546049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802082 () Bool)

(assert (=> b!802082 (= e!444710 e!444707)))

(declare-fun res!546056 () Bool)

(assert (=> b!802082 (=> (not res!546056) (not e!444707))))

(assert (=> b!802082 (= res!546056 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358430 #b00000000000000000000000000000000) (bvslt lt!358430 (size!21271 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802082 (= lt!358430 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802083 () Bool)

(declare-fun res!546051 () Bool)

(assert (=> b!802083 (=> (not res!546051) (not e!444711))))

(assert (=> b!802083 (= res!546051 (validKeyInArray!0 k0!2044))))

(declare-fun b!802084 () Bool)

(declare-fun res!546052 () Bool)

(assert (=> b!802084 (=> (not res!546052) (not e!444711))))

(declare-fun arrayContainsKey!0 (array!43552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802084 (= res!546052 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!546048 () Bool)

(assert (=> start!68930 (=> (not res!546048) (not e!444711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68930 (= res!546048 (validMask!0 mask!3266))))

(assert (=> start!68930 e!444711))

(assert (=> start!68930 true))

(declare-fun array_inv!16710 (array!43552) Bool)

(assert (=> start!68930 (array_inv!16710 a!3170)))

(declare-fun b!802085 () Bool)

(declare-fun res!546054 () Bool)

(assert (=> b!802085 (=> (not res!546054) (not e!444708))))

(declare-datatypes ((List!14721 0))(
  ( (Nil!14718) (Cons!14717 (h!15852 (_ BitVec 64)) (t!21028 List!14721)) )
))
(declare-fun arrayNoDuplicates!0 (array!43552 (_ BitVec 32) List!14721) Bool)

(assert (=> b!802085 (= res!546054 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14718))))

(declare-fun b!802086 () Bool)

(declare-fun res!546055 () Bool)

(assert (=> b!802086 (=> (not res!546055) (not e!444707))))

(assert (=> b!802086 (= res!546055 (= lt!358427 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358430 vacantAfter!23 lt!358428 lt!358426 mask!3266)))))

(assert (= (and start!68930 res!546048) b!802078))

(assert (= (and b!802078 res!546053) b!802076))

(assert (= (and b!802076 res!546050) b!802083))

(assert (= (and b!802083 res!546051) b!802084))

(assert (= (and b!802084 res!546052) b!802080))

(assert (= (and b!802080 res!546057) b!802081))

(assert (= (and b!802081 res!546049) b!802085))

(assert (= (and b!802085 res!546054) b!802077))

(assert (= (and b!802077 res!546047) b!802079))

(assert (= (and b!802079 res!546045) b!802075))

(assert (= (and b!802075 res!546046) b!802082))

(assert (= (and b!802082 res!546056) b!802086))

(assert (= (and b!802086 res!546055) b!802074))

(declare-fun m!743587 () Bool)

(assert (=> b!802076 m!743587))

(assert (=> b!802076 m!743587))

(declare-fun m!743589 () Bool)

(assert (=> b!802076 m!743589))

(declare-fun m!743591 () Bool)

(assert (=> b!802075 m!743591))

(assert (=> b!802075 m!743587))

(assert (=> b!802075 m!743587))

(declare-fun m!743593 () Bool)

(assert (=> b!802075 m!743593))

(assert (=> b!802075 m!743587))

(declare-fun m!743595 () Bool)

(assert (=> b!802075 m!743595))

(declare-fun m!743597 () Bool)

(assert (=> b!802081 m!743597))

(declare-fun m!743599 () Bool)

(assert (=> b!802086 m!743599))

(declare-fun m!743601 () Bool)

(assert (=> b!802079 m!743601))

(declare-fun m!743603 () Bool)

(assert (=> b!802079 m!743603))

(declare-fun m!743605 () Bool)

(assert (=> b!802079 m!743605))

(declare-fun m!743607 () Bool)

(assert (=> b!802079 m!743607))

(declare-fun m!743609 () Bool)

(assert (=> b!802080 m!743609))

(declare-fun m!743611 () Bool)

(assert (=> b!802077 m!743611))

(declare-fun m!743613 () Bool)

(assert (=> b!802077 m!743613))

(declare-fun m!743615 () Bool)

(assert (=> b!802084 m!743615))

(assert (=> b!802074 m!743587))

(assert (=> b!802074 m!743587))

(declare-fun m!743617 () Bool)

(assert (=> b!802074 m!743617))

(declare-fun m!743619 () Bool)

(assert (=> b!802083 m!743619))

(declare-fun m!743621 () Bool)

(assert (=> b!802085 m!743621))

(declare-fun m!743623 () Bool)

(assert (=> b!802082 m!743623))

(declare-fun m!743625 () Bool)

(assert (=> start!68930 m!743625))

(declare-fun m!743627 () Bool)

(assert (=> start!68930 m!743627))

(check-sat (not b!802082) (not b!802079) (not b!802084) (not b!802085) (not b!802074) (not b!802081) (not b!802086) (not b!802083) (not b!802076) (not b!802080) (not start!68930) (not b!802075))
(check-sat)
