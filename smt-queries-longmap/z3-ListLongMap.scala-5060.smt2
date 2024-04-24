; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69038 () Bool)

(assert start!69038)

(declare-fun res!547944 () Bool)

(declare-fun e!445594 () Bool)

(assert (=> start!69038 (=> (not res!547944) (not e!445594))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69038 (= res!547944 (validMask!0 mask!3266))))

(assert (=> start!69038 e!445594))

(assert (=> start!69038 true))

(declare-datatypes ((array!43660 0))(
  ( (array!43661 (arr!20905 (Array (_ BitVec 32) (_ BitVec 64))) (size!21325 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43660)

(declare-fun array_inv!16764 (array!43660) Bool)

(assert (=> start!69038 (array_inv!16764 a!3170)))

(declare-fun b!803962 () Bool)

(declare-fun res!547938 () Bool)

(declare-fun e!445591 () Bool)

(assert (=> b!803962 (=> (not res!547938) (not e!445591))))

(declare-datatypes ((List!14775 0))(
  ( (Nil!14772) (Cons!14771 (h!15906 (_ BitVec 64)) (t!21082 List!14775)) )
))
(declare-fun arrayNoDuplicates!0 (array!43660 (_ BitVec 32) List!14775) Bool)

(assert (=> b!803962 (= res!547938 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14772))))

(declare-fun b!803963 () Bool)

(assert (=> b!803963 (= e!445594 e!445591)))

(declare-fun res!547933 () Bool)

(assert (=> b!803963 (=> (not res!547933) (not e!445591))))

(declare-datatypes ((SeekEntryResult!8452 0))(
  ( (MissingZero!8452 (index!36176 (_ BitVec 32))) (Found!8452 (index!36177 (_ BitVec 32))) (Intermediate!8452 (undefined!9264 Bool) (index!36178 (_ BitVec 32)) (x!67184 (_ BitVec 32))) (Undefined!8452) (MissingVacant!8452 (index!36179 (_ BitVec 32))) )
))
(declare-fun lt!359684 () SeekEntryResult!8452)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803963 (= res!547933 (or (= lt!359684 (MissingZero!8452 i!1163)) (= lt!359684 (MissingVacant!8452 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43660 (_ BitVec 32)) SeekEntryResult!8452)

(assert (=> b!803963 (= lt!359684 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803964 () Bool)

(declare-fun res!547941 () Bool)

(assert (=> b!803964 (=> (not res!547941) (not e!445594))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803964 (= res!547941 (and (= (size!21325 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21325 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21325 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803965 () Bool)

(declare-fun e!445593 () Bool)

(declare-fun e!445589 () Bool)

(assert (=> b!803965 (= e!445593 e!445589)))

(declare-fun res!547935 () Bool)

(assert (=> b!803965 (=> (not res!547935) (not e!445589))))

(declare-fun lt!359683 () SeekEntryResult!8452)

(declare-fun lt!359679 () SeekEntryResult!8452)

(assert (=> b!803965 (= res!547935 (= lt!359683 lt!359679))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43660 (_ BitVec 32)) SeekEntryResult!8452)

(assert (=> b!803965 (= lt!359679 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20905 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803965 (= lt!359683 (seekEntryOrOpen!0 (select (arr!20905 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803966 () Bool)

(assert (=> b!803966 (= e!445591 e!445593)))

(declare-fun res!547940 () Bool)

(assert (=> b!803966 (=> (not res!547940) (not e!445593))))

(declare-fun lt!359680 () SeekEntryResult!8452)

(declare-fun lt!359686 () SeekEntryResult!8452)

(assert (=> b!803966 (= res!547940 (= lt!359680 lt!359686))))

(declare-fun lt!359682 () array!43660)

(declare-fun lt!359681 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!803966 (= lt!359686 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359681 lt!359682 mask!3266))))

(assert (=> b!803966 (= lt!359680 (seekEntryOrOpen!0 lt!359681 lt!359682 mask!3266))))

(assert (=> b!803966 (= lt!359681 (select (store (arr!20905 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803966 (= lt!359682 (array!43661 (store (arr!20905 a!3170) i!1163 k0!2044) (size!21325 a!3170)))))

(declare-fun e!445590 () Bool)

(declare-fun lt!359678 () SeekEntryResult!8452)

(declare-fun b!803967 () Bool)

(assert (=> b!803967 (= e!445590 (not (or (not (= lt!359686 lt!359678)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20905 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359687 () (_ BitVec 32))

(assert (=> b!803967 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359687 vacantAfter!23 lt!359681 lt!359682 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359687 vacantBefore!23 (select (arr!20905 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27529 0))(
  ( (Unit!27530) )
))
(declare-fun lt!359685 () Unit!27529)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43660 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27529)

(assert (=> b!803967 (= lt!359685 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359687 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803967 (= lt!359687 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803968 () Bool)

(declare-fun res!547936 () Bool)

(assert (=> b!803968 (=> (not res!547936) (not e!445594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803968 (= res!547936 (validKeyInArray!0 (select (arr!20905 a!3170) j!153)))))

(declare-fun b!803969 () Bool)

(declare-fun res!547937 () Bool)

(assert (=> b!803969 (=> (not res!547937) (not e!445594))))

(assert (=> b!803969 (= res!547937 (validKeyInArray!0 k0!2044))))

(declare-fun b!803970 () Bool)

(declare-fun res!547939 () Bool)

(assert (=> b!803970 (=> (not res!547939) (not e!445594))))

(declare-fun arrayContainsKey!0 (array!43660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803970 (= res!547939 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803971 () Bool)

(declare-fun res!547943 () Bool)

(assert (=> b!803971 (=> (not res!547943) (not e!445591))))

(assert (=> b!803971 (= res!547943 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21325 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20905 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21325 a!3170)) (= (select (arr!20905 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803972 () Bool)

(declare-fun res!547942 () Bool)

(assert (=> b!803972 (=> (not res!547942) (not e!445591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43660 (_ BitVec 32)) Bool)

(assert (=> b!803972 (= res!547942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803973 () Bool)

(assert (=> b!803973 (= e!445589 e!445590)))

(declare-fun res!547934 () Bool)

(assert (=> b!803973 (=> (not res!547934) (not e!445590))))

(assert (=> b!803973 (= res!547934 (and (= lt!359679 lt!359678) (not (= (select (arr!20905 a!3170) index!1236) (select (arr!20905 a!3170) j!153)))))))

(assert (=> b!803973 (= lt!359678 (Found!8452 j!153))))

(assert (= (and start!69038 res!547944) b!803964))

(assert (= (and b!803964 res!547941) b!803968))

(assert (= (and b!803968 res!547936) b!803969))

(assert (= (and b!803969 res!547937) b!803970))

(assert (= (and b!803970 res!547939) b!803963))

(assert (= (and b!803963 res!547933) b!803972))

(assert (= (and b!803972 res!547942) b!803962))

(assert (= (and b!803962 res!547938) b!803971))

(assert (= (and b!803971 res!547943) b!803966))

(assert (= (and b!803966 res!547940) b!803965))

(assert (= (and b!803965 res!547935) b!803973))

(assert (= (and b!803973 res!547934) b!803967))

(declare-fun m!745957 () Bool)

(assert (=> b!803973 m!745957))

(declare-fun m!745959 () Bool)

(assert (=> b!803973 m!745959))

(declare-fun m!745961 () Bool)

(assert (=> b!803963 m!745961))

(declare-fun m!745963 () Bool)

(assert (=> b!803970 m!745963))

(declare-fun m!745965 () Bool)

(assert (=> b!803962 m!745965))

(declare-fun m!745967 () Bool)

(assert (=> b!803966 m!745967))

(declare-fun m!745969 () Bool)

(assert (=> b!803966 m!745969))

(declare-fun m!745971 () Bool)

(assert (=> b!803966 m!745971))

(declare-fun m!745973 () Bool)

(assert (=> b!803966 m!745973))

(assert (=> b!803968 m!745959))

(assert (=> b!803968 m!745959))

(declare-fun m!745975 () Bool)

(assert (=> b!803968 m!745975))

(assert (=> b!803965 m!745959))

(assert (=> b!803965 m!745959))

(declare-fun m!745977 () Bool)

(assert (=> b!803965 m!745977))

(assert (=> b!803965 m!745959))

(declare-fun m!745979 () Bool)

(assert (=> b!803965 m!745979))

(declare-fun m!745981 () Bool)

(assert (=> b!803969 m!745981))

(declare-fun m!745983 () Bool)

(assert (=> b!803972 m!745983))

(declare-fun m!745985 () Bool)

(assert (=> start!69038 m!745985))

(declare-fun m!745987 () Bool)

(assert (=> start!69038 m!745987))

(declare-fun m!745989 () Bool)

(assert (=> b!803971 m!745989))

(declare-fun m!745991 () Bool)

(assert (=> b!803971 m!745991))

(declare-fun m!745993 () Bool)

(assert (=> b!803967 m!745993))

(assert (=> b!803967 m!745959))

(assert (=> b!803967 m!745959))

(declare-fun m!745995 () Bool)

(assert (=> b!803967 m!745995))

(declare-fun m!745997 () Bool)

(assert (=> b!803967 m!745997))

(declare-fun m!745999 () Bool)

(assert (=> b!803967 m!745999))

(declare-fun m!746001 () Bool)

(assert (=> b!803967 m!746001))

(assert (=> b!803967 m!745971))

(check-sat (not b!803967) (not b!803969) (not b!803966) (not b!803963) (not b!803968) (not b!803962) (not start!69038) (not b!803972) (not b!803965) (not b!803970))
(check-sat)
