; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65432 () Bool)

(assert start!65432)

(declare-fun b!745114 () Bool)

(declare-fun e!416191 () Bool)

(declare-fun e!416192 () Bool)

(assert (=> b!745114 (= e!416191 e!416192)))

(declare-fun res!502028 () Bool)

(assert (=> b!745114 (=> (not res!502028) (not e!416192))))

(declare-datatypes ((SeekEntryResult!7516 0))(
  ( (MissingZero!7516 (index!32432 (_ BitVec 32))) (Found!7516 (index!32433 (_ BitVec 32))) (Intermediate!7516 (undefined!8328 Bool) (index!32434 (_ BitVec 32)) (x!63386 (_ BitVec 32))) (Undefined!7516) (MissingVacant!7516 (index!32435 (_ BitVec 32))) )
))
(declare-fun lt!331026 () SeekEntryResult!7516)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745114 (= res!502028 (or (= lt!331026 (MissingZero!7516 i!1173)) (= lt!331026 (MissingVacant!7516 i!1173))))))

(declare-datatypes ((array!41605 0))(
  ( (array!41606 (arr!19916 (Array (_ BitVec 32) (_ BitVec 64))) (size!20337 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41605)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41605 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!745114 (= lt!331026 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745115 () Bool)

(declare-fun e!416187 () Bool)

(declare-fun e!416188 () Bool)

(assert (=> b!745115 (= e!416187 (not e!416188))))

(declare-fun res!502035 () Bool)

(assert (=> b!745115 (=> res!502035 e!416188)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331027 () SeekEntryResult!7516)

(assert (=> b!745115 (= res!502035 (or (not (is-Intermediate!7516 lt!331027)) (bvslt x!1131 (x!63386 lt!331027)) (not (= x!1131 (x!63386 lt!331027))) (not (= index!1321 (index!32434 lt!331027)))))))

(declare-fun e!416186 () Bool)

(assert (=> b!745115 e!416186))

(declare-fun res!502039 () Bool)

(assert (=> b!745115 (=> (not res!502039) (not e!416186))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41605 (_ BitVec 32)) Bool)

(assert (=> b!745115 (= res!502039 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25512 0))(
  ( (Unit!25513) )
))
(declare-fun lt!331029 () Unit!25512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25512)

(assert (=> b!745115 (= lt!331029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!502037 () Bool)

(assert (=> start!65432 (=> (not res!502037) (not e!416191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65432 (= res!502037 (validMask!0 mask!3328))))

(assert (=> start!65432 e!416191))

(assert (=> start!65432 true))

(declare-fun array_inv!15712 (array!41605) Bool)

(assert (=> start!65432 (array_inv!15712 a!3186)))

(declare-fun b!745116 () Bool)

(assert (=> b!745116 (= e!416188 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!331031 () SeekEntryResult!7516)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41605 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!745116 (= lt!331031 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19916 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745117 () Bool)

(declare-fun res!502030 () Bool)

(assert (=> b!745117 (=> (not res!502030) (not e!416191))))

(declare-fun arrayContainsKey!0 (array!41605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745117 (= res!502030 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745118 () Bool)

(declare-fun res!502025 () Bool)

(declare-fun e!416185 () Bool)

(assert (=> b!745118 (=> (not res!502025) (not e!416185))))

(declare-fun e!416189 () Bool)

(assert (=> b!745118 (= res!502025 e!416189)))

(declare-fun c!81925 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745118 (= c!81925 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745119 () Bool)

(assert (=> b!745119 (= e!416185 e!416187)))

(declare-fun res!502032 () Bool)

(assert (=> b!745119 (=> (not res!502032) (not e!416187))))

(declare-fun lt!331023 () SeekEntryResult!7516)

(assert (=> b!745119 (= res!502032 (= lt!331023 lt!331027))))

(declare-fun lt!331025 () array!41605)

(declare-fun lt!331028 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41605 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!745119 (= lt!331027 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331028 lt!331025 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745119 (= lt!331023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331028 mask!3328) lt!331028 lt!331025 mask!3328))))

(assert (=> b!745119 (= lt!331028 (select (store (arr!19916 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745119 (= lt!331025 (array!41606 (store (arr!19916 a!3186) i!1173 k!2102) (size!20337 a!3186)))))

(declare-fun b!745120 () Bool)

(declare-fun res!502029 () Bool)

(assert (=> b!745120 (=> (not res!502029) (not e!416192))))

(assert (=> b!745120 (= res!502029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745121 () Bool)

(declare-fun lt!331030 () SeekEntryResult!7516)

(declare-fun e!416190 () Bool)

(assert (=> b!745121 (= e!416190 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!331030))))

(declare-fun b!745122 () Bool)

(assert (=> b!745122 (= e!416189 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) (Found!7516 j!159)))))

(declare-fun b!745123 () Bool)

(declare-fun res!502027 () Bool)

(assert (=> b!745123 (=> (not res!502027) (not e!416191))))

(assert (=> b!745123 (= res!502027 (and (= (size!20337 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20337 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20337 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745124 () Bool)

(assert (=> b!745124 (= e!416192 e!416185)))

(declare-fun res!502026 () Bool)

(assert (=> b!745124 (=> (not res!502026) (not e!416185))))

(declare-fun lt!331024 () SeekEntryResult!7516)

(assert (=> b!745124 (= res!502026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19916 a!3186) j!159) mask!3328) (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!331024))))

(assert (=> b!745124 (= lt!331024 (Intermediate!7516 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745125 () Bool)

(declare-fun res!502033 () Bool)

(assert (=> b!745125 (=> (not res!502033) (not e!416192))))

(assert (=> b!745125 (= res!502033 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20337 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20337 a!3186))))))

(declare-fun b!745126 () Bool)

(declare-fun res!502034 () Bool)

(assert (=> b!745126 (=> (not res!502034) (not e!416191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745126 (= res!502034 (validKeyInArray!0 k!2102))))

(declare-fun b!745127 () Bool)

(declare-fun res!502036 () Bool)

(assert (=> b!745127 (=> (not res!502036) (not e!416185))))

(assert (=> b!745127 (= res!502036 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19916 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745128 () Bool)

(assert (=> b!745128 (= e!416186 e!416190)))

(declare-fun res!502031 () Bool)

(assert (=> b!745128 (=> (not res!502031) (not e!416190))))

(assert (=> b!745128 (= res!502031 (= (seekEntryOrOpen!0 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!331030))))

(assert (=> b!745128 (= lt!331030 (Found!7516 j!159))))

(declare-fun b!745129 () Bool)

(declare-fun res!502040 () Bool)

(assert (=> b!745129 (=> (not res!502040) (not e!416192))))

(declare-datatypes ((List!13918 0))(
  ( (Nil!13915) (Cons!13914 (h!14986 (_ BitVec 64)) (t!20233 List!13918)) )
))
(declare-fun arrayNoDuplicates!0 (array!41605 (_ BitVec 32) List!13918) Bool)

(assert (=> b!745129 (= res!502040 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13915))))

(declare-fun b!745130 () Bool)

(declare-fun res!502038 () Bool)

(assert (=> b!745130 (=> (not res!502038) (not e!416191))))

(assert (=> b!745130 (= res!502038 (validKeyInArray!0 (select (arr!19916 a!3186) j!159)))))

(declare-fun b!745131 () Bool)

(assert (=> b!745131 (= e!416189 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19916 a!3186) j!159) a!3186 mask!3328) lt!331024))))

(assert (= (and start!65432 res!502037) b!745123))

(assert (= (and b!745123 res!502027) b!745130))

(assert (= (and b!745130 res!502038) b!745126))

(assert (= (and b!745126 res!502034) b!745117))

(assert (= (and b!745117 res!502030) b!745114))

(assert (= (and b!745114 res!502028) b!745120))

(assert (= (and b!745120 res!502029) b!745129))

(assert (= (and b!745129 res!502040) b!745125))

(assert (= (and b!745125 res!502033) b!745124))

(assert (= (and b!745124 res!502026) b!745127))

(assert (= (and b!745127 res!502036) b!745118))

(assert (= (and b!745118 c!81925) b!745131))

(assert (= (and b!745118 (not c!81925)) b!745122))

(assert (= (and b!745118 res!502025) b!745119))

(assert (= (and b!745119 res!502032) b!745115))

(assert (= (and b!745115 res!502039) b!745128))

(assert (= (and b!745128 res!502031) b!745121))

(assert (= (and b!745115 (not res!502035)) b!745116))

(declare-fun m!695541 () Bool)

(assert (=> b!745128 m!695541))

(assert (=> b!745128 m!695541))

(declare-fun m!695543 () Bool)

(assert (=> b!745128 m!695543))

(declare-fun m!695545 () Bool)

(assert (=> b!745117 m!695545))

(declare-fun m!695547 () Bool)

(assert (=> b!745129 m!695547))

(declare-fun m!695549 () Bool)

(assert (=> b!745127 m!695549))

(assert (=> b!745122 m!695541))

(assert (=> b!745122 m!695541))

(declare-fun m!695551 () Bool)

(assert (=> b!745122 m!695551))

(assert (=> b!745131 m!695541))

(assert (=> b!745131 m!695541))

(declare-fun m!695553 () Bool)

(assert (=> b!745131 m!695553))

(declare-fun m!695555 () Bool)

(assert (=> b!745115 m!695555))

(declare-fun m!695557 () Bool)

(assert (=> b!745115 m!695557))

(assert (=> b!745116 m!695541))

(assert (=> b!745116 m!695541))

(assert (=> b!745116 m!695551))

(assert (=> b!745121 m!695541))

(assert (=> b!745121 m!695541))

(declare-fun m!695559 () Bool)

(assert (=> b!745121 m!695559))

(assert (=> b!745130 m!695541))

(assert (=> b!745130 m!695541))

(declare-fun m!695561 () Bool)

(assert (=> b!745130 m!695561))

(declare-fun m!695563 () Bool)

(assert (=> b!745119 m!695563))

(declare-fun m!695565 () Bool)

(assert (=> b!745119 m!695565))

(declare-fun m!695567 () Bool)

(assert (=> b!745119 m!695567))

(declare-fun m!695569 () Bool)

(assert (=> b!745119 m!695569))

(assert (=> b!745119 m!695563))

(declare-fun m!695571 () Bool)

(assert (=> b!745119 m!695571))

(declare-fun m!695573 () Bool)

(assert (=> b!745120 m!695573))

(declare-fun m!695575 () Bool)

(assert (=> start!65432 m!695575))

(declare-fun m!695577 () Bool)

(assert (=> start!65432 m!695577))

(declare-fun m!695579 () Bool)

(assert (=> b!745114 m!695579))

(assert (=> b!745124 m!695541))

(assert (=> b!745124 m!695541))

(declare-fun m!695581 () Bool)

(assert (=> b!745124 m!695581))

(assert (=> b!745124 m!695581))

(assert (=> b!745124 m!695541))

(declare-fun m!695583 () Bool)

(assert (=> b!745124 m!695583))

(declare-fun m!695585 () Bool)

(assert (=> b!745126 m!695585))

(push 1)

