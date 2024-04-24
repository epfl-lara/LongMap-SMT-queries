; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69176 () Bool)

(assert start!69176)

(declare-fun b!805947 () Bool)

(declare-fun res!549920 () Bool)

(declare-fun e!446469 () Bool)

(assert (=> b!805947 (=> (not res!549920) (not e!446469))))

(declare-datatypes ((array!43798 0))(
  ( (array!43799 (arr!20974 (Array (_ BitVec 32) (_ BitVec 64))) (size!21394 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43798)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805947 (= res!549920 (validKeyInArray!0 (select (arr!20974 a!3170) j!153)))))

(declare-fun b!805948 () Bool)

(declare-fun res!549921 () Bool)

(assert (=> b!805948 (=> (not res!549921) (not e!446469))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805948 (= res!549921 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805949 () Bool)

(declare-fun e!446467 () Bool)

(assert (=> b!805949 (= e!446469 e!446467)))

(declare-fun res!549924 () Bool)

(assert (=> b!805949 (=> (not res!549924) (not e!446467))))

(declare-datatypes ((SeekEntryResult!8521 0))(
  ( (MissingZero!8521 (index!36452 (_ BitVec 32))) (Found!8521 (index!36453 (_ BitVec 32))) (Intermediate!8521 (undefined!9333 Bool) (index!36454 (_ BitVec 32)) (x!67437 (_ BitVec 32))) (Undefined!8521) (MissingVacant!8521 (index!36455 (_ BitVec 32))) )
))
(declare-fun lt!360797 () SeekEntryResult!8521)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805949 (= res!549924 (or (= lt!360797 (MissingZero!8521 i!1163)) (= lt!360797 (MissingVacant!8521 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43798 (_ BitVec 32)) SeekEntryResult!8521)

(assert (=> b!805949 (= lt!360797 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805950 () Bool)

(declare-fun res!549927 () Bool)

(assert (=> b!805950 (=> (not res!549927) (not e!446467))))

(declare-datatypes ((List!14844 0))(
  ( (Nil!14841) (Cons!14840 (h!15975 (_ BitVec 64)) (t!21151 List!14844)) )
))
(declare-fun arrayNoDuplicates!0 (array!43798 (_ BitVec 32) List!14844) Bool)

(assert (=> b!805950 (= res!549927 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14841))))

(declare-fun b!805951 () Bool)

(declare-fun e!446470 () Bool)

(assert (=> b!805951 (= e!446467 e!446470)))

(declare-fun res!549925 () Bool)

(assert (=> b!805951 (=> (not res!549925) (not e!446470))))

(declare-fun lt!360794 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360793 () array!43798)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43798 (_ BitVec 32)) SeekEntryResult!8521)

(assert (=> b!805951 (= res!549925 (= (seekEntryOrOpen!0 lt!360794 lt!360793 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360794 lt!360793 mask!3266)))))

(assert (=> b!805951 (= lt!360794 (select (store (arr!20974 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805951 (= lt!360793 (array!43799 (store (arr!20974 a!3170) i!1163 k0!2044) (size!21394 a!3170)))))

(declare-fun b!805952 () Bool)

(declare-fun res!549918 () Bool)

(assert (=> b!805952 (=> (not res!549918) (not e!446467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43798 (_ BitVec 32)) Bool)

(assert (=> b!805952 (= res!549918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805953 () Bool)

(assert (=> b!805953 (= e!446470 false)))

(declare-fun lt!360795 () SeekEntryResult!8521)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805953 (= lt!360795 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20974 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360796 () SeekEntryResult!8521)

(assert (=> b!805953 (= lt!360796 (seekEntryOrOpen!0 (select (arr!20974 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!549926 () Bool)

(assert (=> start!69176 (=> (not res!549926) (not e!446469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69176 (= res!549926 (validMask!0 mask!3266))))

(assert (=> start!69176 e!446469))

(assert (=> start!69176 true))

(declare-fun array_inv!16833 (array!43798) Bool)

(assert (=> start!69176 (array_inv!16833 a!3170)))

(declare-fun b!805954 () Bool)

(declare-fun res!549923 () Bool)

(assert (=> b!805954 (=> (not res!549923) (not e!446469))))

(assert (=> b!805954 (= res!549923 (validKeyInArray!0 k0!2044))))

(declare-fun b!805955 () Bool)

(declare-fun res!549922 () Bool)

(assert (=> b!805955 (=> (not res!549922) (not e!446469))))

(assert (=> b!805955 (= res!549922 (and (= (size!21394 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21394 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21394 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805956 () Bool)

(declare-fun res!549919 () Bool)

(assert (=> b!805956 (=> (not res!549919) (not e!446467))))

(assert (=> b!805956 (= res!549919 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21394 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20974 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21394 a!3170)) (= (select (arr!20974 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69176 res!549926) b!805955))

(assert (= (and b!805955 res!549922) b!805947))

(assert (= (and b!805947 res!549920) b!805954))

(assert (= (and b!805954 res!549923) b!805948))

(assert (= (and b!805948 res!549921) b!805949))

(assert (= (and b!805949 res!549924) b!805952))

(assert (= (and b!805952 res!549918) b!805950))

(assert (= (and b!805950 res!549927) b!805956))

(assert (= (and b!805956 res!549919) b!805951))

(assert (= (and b!805951 res!549925) b!805953))

(declare-fun m!748213 () Bool)

(assert (=> b!805948 m!748213))

(declare-fun m!748215 () Bool)

(assert (=> b!805949 m!748215))

(declare-fun m!748217 () Bool)

(assert (=> start!69176 m!748217))

(declare-fun m!748219 () Bool)

(assert (=> start!69176 m!748219))

(declare-fun m!748221 () Bool)

(assert (=> b!805951 m!748221))

(declare-fun m!748223 () Bool)

(assert (=> b!805951 m!748223))

(declare-fun m!748225 () Bool)

(assert (=> b!805951 m!748225))

(declare-fun m!748227 () Bool)

(assert (=> b!805951 m!748227))

(declare-fun m!748229 () Bool)

(assert (=> b!805947 m!748229))

(assert (=> b!805947 m!748229))

(declare-fun m!748231 () Bool)

(assert (=> b!805947 m!748231))

(declare-fun m!748233 () Bool)

(assert (=> b!805952 m!748233))

(assert (=> b!805953 m!748229))

(assert (=> b!805953 m!748229))

(declare-fun m!748235 () Bool)

(assert (=> b!805953 m!748235))

(assert (=> b!805953 m!748229))

(declare-fun m!748237 () Bool)

(assert (=> b!805953 m!748237))

(declare-fun m!748239 () Bool)

(assert (=> b!805950 m!748239))

(declare-fun m!748241 () Bool)

(assert (=> b!805954 m!748241))

(declare-fun m!748243 () Bool)

(assert (=> b!805956 m!748243))

(declare-fun m!748245 () Bool)

(assert (=> b!805956 m!748245))

(check-sat (not b!805947) (not b!805949) (not b!805948) (not b!805951) (not b!805952) (not b!805953) (not b!805954) (not start!69176) (not b!805950))
(check-sat)
