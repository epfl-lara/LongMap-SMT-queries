; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68748 () Bool)

(assert start!68748)

(declare-fun b!801053 () Bool)

(declare-fun e!444035 () Bool)

(declare-fun e!444040 () Bool)

(assert (=> b!801053 (= e!444035 e!444040)))

(declare-fun res!545716 () Bool)

(assert (=> b!801053 (=> (not res!545716) (not e!444040))))

(declare-datatypes ((SeekEntryResult!8446 0))(
  ( (MissingZero!8446 (index!36152 (_ BitVec 32))) (Found!8446 (index!36153 (_ BitVec 32))) (Intermediate!8446 (undefined!9258 Bool) (index!36154 (_ BitVec 32)) (x!67023 (_ BitVec 32))) (Undefined!8446) (MissingVacant!8446 (index!36155 (_ BitVec 32))) )
))
(declare-fun lt!357900 () SeekEntryResult!8446)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357899 () (_ BitVec 64))

(declare-datatypes ((array!43555 0))(
  ( (array!43556 (arr!20858 (Array (_ BitVec 32) (_ BitVec 64))) (size!21279 (_ BitVec 32))) )
))
(declare-fun lt!357902 () array!43555)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43555 (_ BitVec 32)) SeekEntryResult!8446)

(assert (=> b!801053 (= res!545716 (= lt!357900 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357899 lt!357902 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43555 (_ BitVec 32)) SeekEntryResult!8446)

(assert (=> b!801053 (= lt!357900 (seekEntryOrOpen!0 lt!357899 lt!357902 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun a!3170 () array!43555)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801053 (= lt!357899 (select (store (arr!20858 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801053 (= lt!357902 (array!43556 (store (arr!20858 a!3170) i!1163 k0!2044) (size!21279 a!3170)))))

(declare-fun b!801054 () Bool)

(declare-fun e!444038 () Bool)

(assert (=> b!801054 (= e!444040 e!444038)))

(declare-fun res!545715 () Bool)

(assert (=> b!801054 (=> (not res!545715) (not e!444038))))

(declare-fun lt!357898 () SeekEntryResult!8446)

(declare-fun lt!357905 () SeekEntryResult!8446)

(assert (=> b!801054 (= res!545715 (and (= lt!357898 lt!357905) (= lt!357905 (Found!8446 j!153)) (not (= (select (arr!20858 a!3170) index!1236) (select (arr!20858 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801054 (= lt!357905 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20858 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801054 (= lt!357898 (seekEntryOrOpen!0 (select (arr!20858 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801055 () Bool)

(declare-fun res!545721 () Bool)

(declare-fun e!444039 () Bool)

(assert (=> b!801055 (=> (not res!545721) (not e!444039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801055 (= res!545721 (validKeyInArray!0 (select (arr!20858 a!3170) j!153)))))

(declare-fun b!801057 () Bool)

(assert (=> b!801057 (= e!444039 e!444035)))

(declare-fun res!545720 () Bool)

(assert (=> b!801057 (=> (not res!545720) (not e!444035))))

(declare-fun lt!357903 () SeekEntryResult!8446)

(assert (=> b!801057 (= res!545720 (or (= lt!357903 (MissingZero!8446 i!1163)) (= lt!357903 (MissingVacant!8446 i!1163))))))

(assert (=> b!801057 (= lt!357903 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801058 () Bool)

(declare-fun res!545724 () Bool)

(assert (=> b!801058 (=> (not res!545724) (not e!444035))))

(declare-datatypes ((List!14860 0))(
  ( (Nil!14857) (Cons!14856 (h!15985 (_ BitVec 64)) (t!21166 List!14860)) )
))
(declare-fun arrayNoDuplicates!0 (array!43555 (_ BitVec 32) List!14860) Bool)

(assert (=> b!801058 (= res!545724 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14857))))

(declare-fun b!801059 () Bool)

(declare-fun res!545717 () Bool)

(declare-fun e!444037 () Bool)

(assert (=> b!801059 (=> (not res!545717) (not e!444037))))

(declare-fun lt!357901 () (_ BitVec 32))

(assert (=> b!801059 (= res!545717 (= lt!357900 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357901 vacantAfter!23 lt!357899 lt!357902 mask!3266)))))

(declare-fun b!801060 () Bool)

(declare-fun res!545712 () Bool)

(assert (=> b!801060 (=> (not res!545712) (not e!444039))))

(assert (=> b!801060 (= res!545712 (validKeyInArray!0 k0!2044))))

(declare-fun b!801061 () Bool)

(assert (=> b!801061 (= e!444038 e!444037)))

(declare-fun res!545722 () Bool)

(assert (=> b!801061 (=> (not res!545722) (not e!444037))))

(assert (=> b!801061 (= res!545722 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357901 #b00000000000000000000000000000000) (bvslt lt!357901 (size!21279 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801061 (= lt!357901 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801062 () Bool)

(declare-fun res!545714 () Bool)

(assert (=> b!801062 (=> (not res!545714) (not e!444039))))

(assert (=> b!801062 (= res!545714 (and (= (size!21279 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21279 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21279 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801063 () Bool)

(declare-fun res!545719 () Bool)

(assert (=> b!801063 (=> (not res!545719) (not e!444035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43555 (_ BitVec 32)) Bool)

(assert (=> b!801063 (= res!545719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801064 () Bool)

(assert (=> b!801064 (= e!444037 false)))

(declare-fun lt!357904 () SeekEntryResult!8446)

(assert (=> b!801064 (= lt!357904 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357901 vacantBefore!23 (select (arr!20858 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801065 () Bool)

(declare-fun res!545723 () Bool)

(assert (=> b!801065 (=> (not res!545723) (not e!444035))))

(assert (=> b!801065 (= res!545723 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21279 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20858 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21279 a!3170)) (= (select (arr!20858 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!545718 () Bool)

(assert (=> start!68748 (=> (not res!545718) (not e!444039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68748 (= res!545718 (validMask!0 mask!3266))))

(assert (=> start!68748 e!444039))

(assert (=> start!68748 true))

(declare-fun array_inv!16741 (array!43555) Bool)

(assert (=> start!68748 (array_inv!16741 a!3170)))

(declare-fun b!801056 () Bool)

(declare-fun res!545713 () Bool)

(assert (=> b!801056 (=> (not res!545713) (not e!444039))))

(declare-fun arrayContainsKey!0 (array!43555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801056 (= res!545713 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68748 res!545718) b!801062))

(assert (= (and b!801062 res!545714) b!801055))

(assert (= (and b!801055 res!545721) b!801060))

(assert (= (and b!801060 res!545712) b!801056))

(assert (= (and b!801056 res!545713) b!801057))

(assert (= (and b!801057 res!545720) b!801063))

(assert (= (and b!801063 res!545719) b!801058))

(assert (= (and b!801058 res!545724) b!801065))

(assert (= (and b!801065 res!545723) b!801053))

(assert (= (and b!801053 res!545716) b!801054))

(assert (= (and b!801054 res!545715) b!801061))

(assert (= (and b!801061 res!545722) b!801059))

(assert (= (and b!801059 res!545717) b!801064))

(declare-fun m!741715 () Bool)

(assert (=> b!801059 m!741715))

(declare-fun m!741717 () Bool)

(assert (=> b!801057 m!741717))

(declare-fun m!741719 () Bool)

(assert (=> b!801054 m!741719))

(declare-fun m!741721 () Bool)

(assert (=> b!801054 m!741721))

(assert (=> b!801054 m!741721))

(declare-fun m!741723 () Bool)

(assert (=> b!801054 m!741723))

(assert (=> b!801054 m!741721))

(declare-fun m!741725 () Bool)

(assert (=> b!801054 m!741725))

(assert (=> b!801064 m!741721))

(assert (=> b!801064 m!741721))

(declare-fun m!741727 () Bool)

(assert (=> b!801064 m!741727))

(declare-fun m!741729 () Bool)

(assert (=> b!801063 m!741729))

(declare-fun m!741731 () Bool)

(assert (=> b!801060 m!741731))

(assert (=> b!801055 m!741721))

(assert (=> b!801055 m!741721))

(declare-fun m!741733 () Bool)

(assert (=> b!801055 m!741733))

(declare-fun m!741735 () Bool)

(assert (=> b!801058 m!741735))

(declare-fun m!741737 () Bool)

(assert (=> b!801065 m!741737))

(declare-fun m!741739 () Bool)

(assert (=> b!801065 m!741739))

(declare-fun m!741741 () Bool)

(assert (=> start!68748 m!741741))

(declare-fun m!741743 () Bool)

(assert (=> start!68748 m!741743))

(declare-fun m!741745 () Bool)

(assert (=> b!801053 m!741745))

(declare-fun m!741747 () Bool)

(assert (=> b!801053 m!741747))

(declare-fun m!741749 () Bool)

(assert (=> b!801053 m!741749))

(declare-fun m!741751 () Bool)

(assert (=> b!801053 m!741751))

(declare-fun m!741753 () Bool)

(assert (=> b!801056 m!741753))

(declare-fun m!741755 () Bool)

(assert (=> b!801061 m!741755))

(check-sat (not b!801053) (not b!801057) (not b!801058) (not b!801060) (not b!801059) (not b!801063) (not b!801064) (not start!68748) (not b!801054) (not b!801061) (not b!801056) (not b!801055))
(check-sat)
