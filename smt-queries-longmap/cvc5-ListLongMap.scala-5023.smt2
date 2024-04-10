; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68648 () Bool)

(assert start!68648)

(declare-fun b!798963 () Bool)

(declare-fun res!543493 () Bool)

(declare-fun e!443114 () Bool)

(assert (=> b!798963 (=> (not res!543493) (not e!443114))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43438 0))(
  ( (array!43439 (arr!20799 (Array (_ BitVec 32) (_ BitVec 64))) (size!21220 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43438)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798963 (= res!543493 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21220 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20799 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21220 a!3170)) (= (select (arr!20799 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798964 () Bool)

(declare-fun res!543491 () Bool)

(declare-fun e!443112 () Bool)

(assert (=> b!798964 (=> (not res!543491) (not e!443112))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798964 (= res!543491 (and (= (size!21220 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21220 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21220 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798965 () Bool)

(declare-fun e!443111 () Bool)

(assert (=> b!798965 (= e!443111 false)))

(declare-fun lt!356698 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8390 0))(
  ( (MissingZero!8390 (index!35928 (_ BitVec 32))) (Found!8390 (index!35929 (_ BitVec 32))) (Intermediate!8390 (undefined!9202 Bool) (index!35930 (_ BitVec 32)) (x!66812 (_ BitVec 32))) (Undefined!8390) (MissingVacant!8390 (index!35931 (_ BitVec 32))) )
))
(declare-fun lt!356699 () SeekEntryResult!8390)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43438 (_ BitVec 32)) SeekEntryResult!8390)

(assert (=> b!798965 (= lt!356699 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356698 vacantBefore!23 (select (arr!20799 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798966 () Bool)

(assert (=> b!798966 (= e!443112 e!443114)))

(declare-fun res!543486 () Bool)

(assert (=> b!798966 (=> (not res!543486) (not e!443114))))

(declare-fun lt!356705 () SeekEntryResult!8390)

(assert (=> b!798966 (= res!543486 (or (= lt!356705 (MissingZero!8390 i!1163)) (= lt!356705 (MissingVacant!8390 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43438 (_ BitVec 32)) SeekEntryResult!8390)

(assert (=> b!798966 (= lt!356705 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798967 () Bool)

(declare-fun res!543489 () Bool)

(assert (=> b!798967 (=> (not res!543489) (not e!443114))))

(declare-datatypes ((List!14762 0))(
  ( (Nil!14759) (Cons!14758 (h!15887 (_ BitVec 64)) (t!21077 List!14762)) )
))
(declare-fun arrayNoDuplicates!0 (array!43438 (_ BitVec 32) List!14762) Bool)

(assert (=> b!798967 (= res!543489 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14759))))

(declare-fun b!798968 () Bool)

(declare-fun res!543492 () Bool)

(assert (=> b!798968 (=> (not res!543492) (not e!443112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798968 (= res!543492 (validKeyInArray!0 k!2044))))

(declare-fun b!798969 () Bool)

(declare-fun e!443110 () Bool)

(declare-fun e!443109 () Bool)

(assert (=> b!798969 (= e!443110 e!443109)))

(declare-fun res!543484 () Bool)

(assert (=> b!798969 (=> (not res!543484) (not e!443109))))

(declare-fun lt!356702 () SeekEntryResult!8390)

(declare-fun lt!356701 () SeekEntryResult!8390)

(assert (=> b!798969 (= res!543484 (and (= lt!356702 lt!356701) (= lt!356701 (Found!8390 j!153)) (not (= (select (arr!20799 a!3170) index!1236) (select (arr!20799 a!3170) j!153)))))))

(assert (=> b!798969 (= lt!356701 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20799 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798969 (= lt!356702 (seekEntryOrOpen!0 (select (arr!20799 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543494 () Bool)

(assert (=> start!68648 (=> (not res!543494) (not e!443112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68648 (= res!543494 (validMask!0 mask!3266))))

(assert (=> start!68648 e!443112))

(assert (=> start!68648 true))

(declare-fun array_inv!16595 (array!43438) Bool)

(assert (=> start!68648 (array_inv!16595 a!3170)))

(declare-fun b!798970 () Bool)

(declare-fun res!543488 () Bool)

(assert (=> b!798970 (=> (not res!543488) (not e!443111))))

(declare-fun lt!356703 () SeekEntryResult!8390)

(declare-fun lt!356704 () array!43438)

(declare-fun lt!356700 () (_ BitVec 64))

(assert (=> b!798970 (= res!543488 (= lt!356703 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356698 vacantAfter!23 lt!356700 lt!356704 mask!3266)))))

(declare-fun b!798971 () Bool)

(declare-fun res!543483 () Bool)

(assert (=> b!798971 (=> (not res!543483) (not e!443112))))

(declare-fun arrayContainsKey!0 (array!43438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798971 (= res!543483 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798972 () Bool)

(declare-fun res!543490 () Bool)

(assert (=> b!798972 (=> (not res!543490) (not e!443112))))

(assert (=> b!798972 (= res!543490 (validKeyInArray!0 (select (arr!20799 a!3170) j!153)))))

(declare-fun b!798973 () Bool)

(declare-fun res!543485 () Bool)

(assert (=> b!798973 (=> (not res!543485) (not e!443114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43438 (_ BitVec 32)) Bool)

(assert (=> b!798973 (= res!543485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798974 () Bool)

(assert (=> b!798974 (= e!443109 e!443111)))

(declare-fun res!543487 () Bool)

(assert (=> b!798974 (=> (not res!543487) (not e!443111))))

(assert (=> b!798974 (= res!543487 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356698 #b00000000000000000000000000000000) (bvslt lt!356698 (size!21220 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798974 (= lt!356698 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798975 () Bool)

(assert (=> b!798975 (= e!443114 e!443110)))

(declare-fun res!543482 () Bool)

(assert (=> b!798975 (=> (not res!543482) (not e!443110))))

(assert (=> b!798975 (= res!543482 (= lt!356703 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356700 lt!356704 mask!3266)))))

(assert (=> b!798975 (= lt!356703 (seekEntryOrOpen!0 lt!356700 lt!356704 mask!3266))))

(assert (=> b!798975 (= lt!356700 (select (store (arr!20799 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798975 (= lt!356704 (array!43439 (store (arr!20799 a!3170) i!1163 k!2044) (size!21220 a!3170)))))

(assert (= (and start!68648 res!543494) b!798964))

(assert (= (and b!798964 res!543491) b!798972))

(assert (= (and b!798972 res!543490) b!798968))

(assert (= (and b!798968 res!543492) b!798971))

(assert (= (and b!798971 res!543483) b!798966))

(assert (= (and b!798966 res!543486) b!798973))

(assert (= (and b!798973 res!543485) b!798967))

(assert (= (and b!798967 res!543489) b!798963))

(assert (= (and b!798963 res!543493) b!798975))

(assert (= (and b!798975 res!543482) b!798969))

(assert (= (and b!798969 res!543484) b!798974))

(assert (= (and b!798974 res!543487) b!798970))

(assert (= (and b!798970 res!543488) b!798965))

(declare-fun m!739937 () Bool)

(assert (=> b!798970 m!739937))

(declare-fun m!739939 () Bool)

(assert (=> b!798974 m!739939))

(declare-fun m!739941 () Bool)

(assert (=> b!798965 m!739941))

(assert (=> b!798965 m!739941))

(declare-fun m!739943 () Bool)

(assert (=> b!798965 m!739943))

(declare-fun m!739945 () Bool)

(assert (=> b!798966 m!739945))

(declare-fun m!739947 () Bool)

(assert (=> b!798971 m!739947))

(declare-fun m!739949 () Bool)

(assert (=> b!798973 m!739949))

(declare-fun m!739951 () Bool)

(assert (=> b!798969 m!739951))

(assert (=> b!798969 m!739941))

(assert (=> b!798969 m!739941))

(declare-fun m!739953 () Bool)

(assert (=> b!798969 m!739953))

(assert (=> b!798969 m!739941))

(declare-fun m!739955 () Bool)

(assert (=> b!798969 m!739955))

(assert (=> b!798972 m!739941))

(assert (=> b!798972 m!739941))

(declare-fun m!739957 () Bool)

(assert (=> b!798972 m!739957))

(declare-fun m!739959 () Bool)

(assert (=> b!798967 m!739959))

(declare-fun m!739961 () Bool)

(assert (=> b!798963 m!739961))

(declare-fun m!739963 () Bool)

(assert (=> b!798963 m!739963))

(declare-fun m!739965 () Bool)

(assert (=> start!68648 m!739965))

(declare-fun m!739967 () Bool)

(assert (=> start!68648 m!739967))

(declare-fun m!739969 () Bool)

(assert (=> b!798975 m!739969))

(declare-fun m!739971 () Bool)

(assert (=> b!798975 m!739971))

(declare-fun m!739973 () Bool)

(assert (=> b!798975 m!739973))

(declare-fun m!739975 () Bool)

(assert (=> b!798975 m!739975))

(declare-fun m!739977 () Bool)

(assert (=> b!798968 m!739977))

(push 1)

