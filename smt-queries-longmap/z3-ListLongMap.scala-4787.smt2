; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65910 () Bool)

(assert start!65910)

(declare-fun b!757137 () Bool)

(declare-fun e!422253 () Bool)

(declare-fun e!422249 () Bool)

(assert (=> b!757137 (= e!422253 e!422249)))

(declare-fun res!511721 () Bool)

(assert (=> b!757137 (=> (not res!511721) (not e!422249))))

(declare-datatypes ((array!41953 0))(
  ( (array!41954 (arr!20086 (Array (_ BitVec 32) (_ BitVec 64))) (size!20506 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41953)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7642 0))(
  ( (MissingZero!7642 (index!32936 (_ BitVec 32))) (Found!7642 (index!32937 (_ BitVec 32))) (Intermediate!7642 (undefined!8454 Bool) (index!32938 (_ BitVec 32)) (x!63996 (_ BitVec 32))) (Undefined!7642) (MissingVacant!7642 (index!32939 (_ BitVec 32))) )
))
(declare-fun lt!337079 () SeekEntryResult!7642)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41953 (_ BitVec 32)) SeekEntryResult!7642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757137 (= res!511721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20086 a!3186) j!159) mask!3328) (select (arr!20086 a!3186) j!159) a!3186 mask!3328) lt!337079))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757137 (= lt!337079 (Intermediate!7642 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757138 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!422250 () Bool)

(assert (=> b!757138 (= e!422250 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20086 a!3186) j!159) a!3186 mask!3328) lt!337079))))

(declare-fun b!757139 () Bool)

(declare-fun e!422251 () Bool)

(assert (=> b!757139 (= e!422249 e!422251)))

(declare-fun res!511718 () Bool)

(assert (=> b!757139 (=> (not res!511718) (not e!422251))))

(declare-fun lt!337083 () SeekEntryResult!7642)

(declare-fun lt!337086 () SeekEntryResult!7642)

(assert (=> b!757139 (= res!511718 (= lt!337083 lt!337086))))

(declare-fun lt!337077 () array!41953)

(declare-fun lt!337080 () (_ BitVec 64))

(assert (=> b!757139 (= lt!337086 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337080 lt!337077 mask!3328))))

(assert (=> b!757139 (= lt!337083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337080 mask!3328) lt!337080 lt!337077 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757139 (= lt!337080 (select (store (arr!20086 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757139 (= lt!337077 (array!41954 (store (arr!20086 a!3186) i!1173 k0!2102) (size!20506 a!3186)))))

(declare-fun b!757140 () Bool)

(declare-datatypes ((Unit!26125 0))(
  ( (Unit!26126) )
))
(declare-fun e!422257 () Unit!26125)

(declare-fun Unit!26127 () Unit!26125)

(assert (=> b!757140 (= e!422257 Unit!26127)))

(declare-fun b!757141 () Bool)

(declare-fun e!422256 () Bool)

(declare-fun e!422252 () Bool)

(assert (=> b!757141 (= e!422256 e!422252)))

(declare-fun res!511717 () Bool)

(assert (=> b!757141 (=> res!511717 e!422252)))

(declare-fun lt!337075 () SeekEntryResult!7642)

(declare-fun lt!337084 () SeekEntryResult!7642)

(assert (=> b!757141 (= res!511717 (not (= lt!337075 lt!337084)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41953 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!757141 (= lt!337075 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20086 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757142 () Bool)

(declare-fun res!511710 () Bool)

(assert (=> b!757142 (=> (not res!511710) (not e!422253))))

(assert (=> b!757142 (= res!511710 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20506 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20506 a!3186))))))

(declare-fun b!757143 () Bool)

(declare-fun res!511724 () Bool)

(assert (=> b!757143 (=> (not res!511724) (not e!422253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41953 (_ BitVec 32)) Bool)

(assert (=> b!757143 (= res!511724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757145 () Bool)

(declare-fun res!511725 () Bool)

(declare-fun e!422259 () Bool)

(assert (=> b!757145 (=> (not res!511725) (not e!422259))))

(declare-fun arrayContainsKey!0 (array!41953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757145 (= res!511725 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757146 () Bool)

(declare-fun e!422255 () Bool)

(assert (=> b!757146 (= e!422255 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20086 a!3186) j!159) a!3186 mask!3328) lt!337084))))

(declare-fun b!757147 () Bool)

(declare-fun res!511711 () Bool)

(assert (=> b!757147 (=> (not res!511711) (not e!422259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757147 (= res!511711 (validKeyInArray!0 (select (arr!20086 a!3186) j!159)))))

(declare-fun b!757148 () Bool)

(declare-fun res!511720 () Bool)

(declare-fun e!422258 () Bool)

(assert (=> b!757148 (=> (not res!511720) (not e!422258))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41953 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!757148 (= res!511720 (= (seekEntryOrOpen!0 lt!337080 lt!337077 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337080 lt!337077 mask!3328)))))

(declare-fun b!757149 () Bool)

(assert (=> b!757149 (= e!422250 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20086 a!3186) j!159) a!3186 mask!3328) (Found!7642 j!159)))))

(declare-fun b!757150 () Bool)

(declare-fun res!511722 () Bool)

(assert (=> b!757150 (=> (not res!511722) (not e!422249))))

(assert (=> b!757150 (= res!511722 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20086 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757151 () Bool)

(declare-fun res!511719 () Bool)

(assert (=> b!757151 (=> (not res!511719) (not e!422249))))

(assert (=> b!757151 (= res!511719 e!422250)))

(declare-fun c!83098 () Bool)

(assert (=> b!757151 (= c!83098 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757152 () Bool)

(declare-fun res!511726 () Bool)

(assert (=> b!757152 (=> (not res!511726) (not e!422259))))

(assert (=> b!757152 (= res!511726 (validKeyInArray!0 k0!2102))))

(declare-fun b!757153 () Bool)

(declare-fun res!511712 () Bool)

(assert (=> b!757153 (=> (not res!511712) (not e!422253))))

(declare-datatypes ((List!13995 0))(
  ( (Nil!13992) (Cons!13991 (h!15069 (_ BitVec 64)) (t!20302 List!13995)) )
))
(declare-fun arrayNoDuplicates!0 (array!41953 (_ BitVec 32) List!13995) Bool)

(assert (=> b!757153 (= res!511712 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13992))))

(declare-fun b!757154 () Bool)

(declare-fun e!422248 () Bool)

(assert (=> b!757154 (= e!422252 e!422248)))

(declare-fun res!511708 () Bool)

(assert (=> b!757154 (=> res!511708 e!422248)))

(declare-fun lt!337081 () (_ BitVec 64))

(assert (=> b!757154 (= res!511708 (= lt!337081 lt!337080))))

(assert (=> b!757154 (= lt!337081 (select (store (arr!20086 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757155 () Bool)

(declare-fun res!511723 () Bool)

(assert (=> b!757155 (=> (not res!511723) (not e!422259))))

(assert (=> b!757155 (= res!511723 (and (= (size!20506 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20506 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20506 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757156 () Bool)

(assert (=> b!757156 (= e!422251 (not e!422256))))

(declare-fun res!511713 () Bool)

(assert (=> b!757156 (=> res!511713 e!422256)))

(get-info :version)

(assert (=> b!757156 (= res!511713 (or (not ((_ is Intermediate!7642) lt!337086)) (bvslt x!1131 (x!63996 lt!337086)) (not (= x!1131 (x!63996 lt!337086))) (not (= index!1321 (index!32938 lt!337086)))))))

(assert (=> b!757156 e!422255))

(declare-fun res!511709 () Bool)

(assert (=> b!757156 (=> (not res!511709) (not e!422255))))

(declare-fun lt!337082 () SeekEntryResult!7642)

(assert (=> b!757156 (= res!511709 (= lt!337082 lt!337084))))

(assert (=> b!757156 (= lt!337084 (Found!7642 j!159))))

(assert (=> b!757156 (= lt!337082 (seekEntryOrOpen!0 (select (arr!20086 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757156 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337078 () Unit!26125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26125)

(assert (=> b!757156 (= lt!337078 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757157 () Bool)

(assert (=> b!757157 (= e!422258 (= lt!337082 lt!337075))))

(declare-fun res!511714 () Bool)

(assert (=> start!65910 (=> (not res!511714) (not e!422259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65910 (= res!511714 (validMask!0 mask!3328))))

(assert (=> start!65910 e!422259))

(assert (=> start!65910 true))

(declare-fun array_inv!15945 (array!41953) Bool)

(assert (=> start!65910 (array_inv!15945 a!3186)))

(declare-fun b!757144 () Bool)

(assert (=> b!757144 (= e!422248 true)))

(assert (=> b!757144 e!422258))

(declare-fun res!511715 () Bool)

(assert (=> b!757144 (=> (not res!511715) (not e!422258))))

(assert (=> b!757144 (= res!511715 (= lt!337081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337076 () Unit!26125)

(assert (=> b!757144 (= lt!337076 e!422257)))

(declare-fun c!83099 () Bool)

(assert (=> b!757144 (= c!83099 (= lt!337081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757158 () Bool)

(assert (=> b!757158 (= e!422259 e!422253)))

(declare-fun res!511716 () Bool)

(assert (=> b!757158 (=> (not res!511716) (not e!422253))))

(declare-fun lt!337085 () SeekEntryResult!7642)

(assert (=> b!757158 (= res!511716 (or (= lt!337085 (MissingZero!7642 i!1173)) (= lt!337085 (MissingVacant!7642 i!1173))))))

(assert (=> b!757158 (= lt!337085 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757159 () Bool)

(declare-fun Unit!26128 () Unit!26125)

(assert (=> b!757159 (= e!422257 Unit!26128)))

(assert (=> b!757159 false))

(assert (= (and start!65910 res!511714) b!757155))

(assert (= (and b!757155 res!511723) b!757147))

(assert (= (and b!757147 res!511711) b!757152))

(assert (= (and b!757152 res!511726) b!757145))

(assert (= (and b!757145 res!511725) b!757158))

(assert (= (and b!757158 res!511716) b!757143))

(assert (= (and b!757143 res!511724) b!757153))

(assert (= (and b!757153 res!511712) b!757142))

(assert (= (and b!757142 res!511710) b!757137))

(assert (= (and b!757137 res!511721) b!757150))

(assert (= (and b!757150 res!511722) b!757151))

(assert (= (and b!757151 c!83098) b!757138))

(assert (= (and b!757151 (not c!83098)) b!757149))

(assert (= (and b!757151 res!511719) b!757139))

(assert (= (and b!757139 res!511718) b!757156))

(assert (= (and b!757156 res!511709) b!757146))

(assert (= (and b!757156 (not res!511713)) b!757141))

(assert (= (and b!757141 (not res!511717)) b!757154))

(assert (= (and b!757154 (not res!511708)) b!757144))

(assert (= (and b!757144 c!83099) b!757159))

(assert (= (and b!757144 (not c!83099)) b!757140))

(assert (= (and b!757144 res!511715) b!757148))

(assert (= (and b!757148 res!511720) b!757157))

(declare-fun m!705519 () Bool)

(assert (=> b!757139 m!705519))

(declare-fun m!705521 () Bool)

(assert (=> b!757139 m!705521))

(assert (=> b!757139 m!705521))

(declare-fun m!705523 () Bool)

(assert (=> b!757139 m!705523))

(declare-fun m!705525 () Bool)

(assert (=> b!757139 m!705525))

(declare-fun m!705527 () Bool)

(assert (=> b!757139 m!705527))

(declare-fun m!705529 () Bool)

(assert (=> b!757138 m!705529))

(assert (=> b!757138 m!705529))

(declare-fun m!705531 () Bool)

(assert (=> b!757138 m!705531))

(assert (=> b!757146 m!705529))

(assert (=> b!757146 m!705529))

(declare-fun m!705533 () Bool)

(assert (=> b!757146 m!705533))

(declare-fun m!705535 () Bool)

(assert (=> start!65910 m!705535))

(declare-fun m!705537 () Bool)

(assert (=> start!65910 m!705537))

(assert (=> b!757141 m!705529))

(assert (=> b!757141 m!705529))

(declare-fun m!705539 () Bool)

(assert (=> b!757141 m!705539))

(assert (=> b!757154 m!705525))

(declare-fun m!705541 () Bool)

(assert (=> b!757154 m!705541))

(assert (=> b!757137 m!705529))

(assert (=> b!757137 m!705529))

(declare-fun m!705543 () Bool)

(assert (=> b!757137 m!705543))

(assert (=> b!757137 m!705543))

(assert (=> b!757137 m!705529))

(declare-fun m!705545 () Bool)

(assert (=> b!757137 m!705545))

(assert (=> b!757149 m!705529))

(assert (=> b!757149 m!705529))

(assert (=> b!757149 m!705539))

(assert (=> b!757156 m!705529))

(assert (=> b!757156 m!705529))

(declare-fun m!705547 () Bool)

(assert (=> b!757156 m!705547))

(declare-fun m!705549 () Bool)

(assert (=> b!757156 m!705549))

(declare-fun m!705551 () Bool)

(assert (=> b!757156 m!705551))

(assert (=> b!757147 m!705529))

(assert (=> b!757147 m!705529))

(declare-fun m!705553 () Bool)

(assert (=> b!757147 m!705553))

(declare-fun m!705555 () Bool)

(assert (=> b!757153 m!705555))

(declare-fun m!705557 () Bool)

(assert (=> b!757145 m!705557))

(declare-fun m!705559 () Bool)

(assert (=> b!757158 m!705559))

(declare-fun m!705561 () Bool)

(assert (=> b!757143 m!705561))

(declare-fun m!705563 () Bool)

(assert (=> b!757150 m!705563))

(declare-fun m!705565 () Bool)

(assert (=> b!757152 m!705565))

(declare-fun m!705567 () Bool)

(assert (=> b!757148 m!705567))

(declare-fun m!705569 () Bool)

(assert (=> b!757148 m!705569))

(check-sat (not b!757149) (not b!757156) (not b!757143) (not b!757139) (not b!757152) (not b!757138) (not b!757145) (not b!757158) (not b!757141) (not b!757146) (not b!757137) (not b!757147) (not b!757153) (not start!65910) (not b!757148))
(check-sat)
