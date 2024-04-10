; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65260 () Bool)

(assert start!65260)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41433 0))(
  ( (array!41434 (arr!19830 (Array (_ BitVec 32) (_ BitVec 64))) (size!20251 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41433)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!740142 () Bool)

(declare-fun e!413832 () Bool)

(declare-datatypes ((SeekEntryResult!7430 0))(
  ( (MissingZero!7430 (index!32088 (_ BitVec 32))) (Found!7430 (index!32089 (_ BitVec 32))) (Intermediate!7430 (undefined!8242 Bool) (index!32090 (_ BitVec 32)) (x!63076 (_ BitVec 32))) (Undefined!7430) (MissingVacant!7430 (index!32091 (_ BitVec 32))) )
))
(declare-fun lt!328759 () SeekEntryResult!7430)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41433 (_ BitVec 32)) SeekEntryResult!7430)

(assert (=> b!740142 (= e!413832 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328759))))

(declare-fun b!740143 () Bool)

(declare-fun res!497722 () Bool)

(declare-fun e!413825 () Bool)

(assert (=> b!740143 (=> res!497722 e!413825)))

(declare-fun e!413828 () Bool)

(assert (=> b!740143 (= res!497722 e!413828)))

(declare-fun c!81600 () Bool)

(declare-fun lt!328760 () Bool)

(assert (=> b!740143 (= c!81600 lt!328760)))

(declare-fun b!740144 () Bool)

(declare-fun res!497719 () Bool)

(assert (=> b!740144 (=> res!497719 e!413825)))

(declare-fun lt!328763 () (_ BitVec 64))

(declare-fun lt!328768 () array!41433)

(declare-fun lt!328769 () (_ BitVec 32))

(declare-fun lt!328765 () SeekEntryResult!7430)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41433 (_ BitVec 32)) SeekEntryResult!7430)

(assert (=> b!740144 (= res!497719 (not (= lt!328765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328769 lt!328763 lt!328768 mask!3328))))))

(declare-fun b!740145 () Bool)

(declare-fun res!497706 () Bool)

(declare-fun e!413826 () Bool)

(assert (=> b!740145 (=> (not res!497706) (not e!413826))))

(declare-fun e!413824 () Bool)

(assert (=> b!740145 (= res!497706 e!413824)))

(declare-fun c!81601 () Bool)

(assert (=> b!740145 (= c!81601 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740146 () Bool)

(declare-fun res!497718 () Bool)

(assert (=> b!740146 (=> (not res!497718) (not e!413826))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740146 (= res!497718 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19830 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740147 () Bool)

(declare-fun res!497711 () Bool)

(declare-fun e!413833 () Bool)

(assert (=> b!740147 (=> (not res!497711) (not e!413833))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740147 (= res!497711 (validKeyInArray!0 k!2102))))

(declare-fun b!740148 () Bool)

(declare-fun e!413834 () Bool)

(assert (=> b!740148 (= e!413826 e!413834)))

(declare-fun res!497709 () Bool)

(assert (=> b!740148 (=> (not res!497709) (not e!413834))))

(declare-fun lt!328767 () SeekEntryResult!7430)

(assert (=> b!740148 (= res!497709 (= lt!328765 lt!328767))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!740148 (= lt!328767 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328763 lt!328768 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740148 (= lt!328765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328763 mask!3328) lt!328763 lt!328768 mask!3328))))

(assert (=> b!740148 (= lt!328763 (select (store (arr!19830 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740148 (= lt!328768 (array!41434 (store (arr!19830 a!3186) i!1173 k!2102) (size!20251 a!3186)))))

(declare-fun b!740150 () Bool)

(declare-fun res!497705 () Bool)

(assert (=> b!740150 (=> (not res!497705) (not e!413833))))

(assert (=> b!740150 (= res!497705 (and (= (size!20251 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20251 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20251 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740151 () Bool)

(declare-datatypes ((Unit!25316 0))(
  ( (Unit!25317) )
))
(declare-fun e!413831 () Unit!25316)

(declare-fun Unit!25318 () Unit!25316)

(assert (=> b!740151 (= e!413831 Unit!25318)))

(declare-fun lt!328766 () SeekEntryResult!7430)

(assert (=> b!740151 (= lt!328766 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19830 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328764 () SeekEntryResult!7430)

(assert (=> b!740151 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328769 resIntermediateIndex!5 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328764)))

(declare-fun b!740152 () Bool)

(declare-fun e!413829 () Bool)

(assert (=> b!740152 (= e!413829 e!413825)))

(declare-fun res!497714 () Bool)

(assert (=> b!740152 (=> res!497714 e!413825)))

(assert (=> b!740152 (= res!497714 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328769 #b00000000000000000000000000000000) (bvsge lt!328769 (size!20251 a!3186))))))

(declare-fun lt!328757 () Unit!25316)

(assert (=> b!740152 (= lt!328757 e!413831)))

(declare-fun c!81599 () Bool)

(assert (=> b!740152 (= c!81599 lt!328760)))

(assert (=> b!740152 (= lt!328760 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740152 (= lt!328769 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740153 () Bool)

(declare-fun e!413823 () Bool)

(assert (=> b!740153 (= e!413823 e!413826)))

(declare-fun res!497713 () Bool)

(assert (=> b!740153 (=> (not res!497713) (not e!413826))))

(declare-fun lt!328762 () SeekEntryResult!7430)

(assert (=> b!740153 (= res!497713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19830 a!3186) j!159) mask!3328) (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328762))))

(assert (=> b!740153 (= lt!328762 (Intermediate!7430 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740154 () Bool)

(declare-fun res!497721 () Bool)

(assert (=> b!740154 (=> (not res!497721) (not e!413833))))

(declare-fun arrayContainsKey!0 (array!41433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740154 (= res!497721 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740155 () Bool)

(declare-fun res!497712 () Bool)

(assert (=> b!740155 (=> (not res!497712) (not e!413833))))

(assert (=> b!740155 (= res!497712 (validKeyInArray!0 (select (arr!19830 a!3186) j!159)))))

(declare-fun b!740156 () Bool)

(assert (=> b!740156 (= e!413824 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) (Found!7430 j!159)))))

(declare-fun b!740157 () Bool)

(declare-fun res!497720 () Bool)

(assert (=> b!740157 (=> (not res!497720) (not e!413823))))

(assert (=> b!740157 (= res!497720 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20251 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20251 a!3186))))))

(declare-fun b!740158 () Bool)

(assert (=> b!740158 (= e!413825 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41433 (_ BitVec 32)) SeekEntryResult!7430)

(assert (=> b!740158 (= (seekEntryOrOpen!0 lt!328763 lt!328768 mask!3328) lt!328764)))

(declare-fun lt!328756 () Unit!25316)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25316)

(assert (=> b!740158 (= lt!328756 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!328769 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740159 () Bool)

(assert (=> b!740159 (= e!413833 e!413823)))

(declare-fun res!497717 () Bool)

(assert (=> b!740159 (=> (not res!497717) (not e!413823))))

(declare-fun lt!328761 () SeekEntryResult!7430)

(assert (=> b!740159 (= res!497717 (or (= lt!328761 (MissingZero!7430 i!1173)) (= lt!328761 (MissingVacant!7430 i!1173))))))

(assert (=> b!740159 (= lt!328761 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740160 () Bool)

(assert (=> b!740160 (= e!413824 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328762))))

(declare-fun b!740161 () Bool)

(declare-fun Unit!25319 () Unit!25316)

(assert (=> b!740161 (= e!413831 Unit!25319)))

(assert (=> b!740161 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328769 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328762)))

(declare-fun b!740162 () Bool)

(declare-fun res!497707 () Bool)

(assert (=> b!740162 (=> (not res!497707) (not e!413823))))

(declare-datatypes ((List!13832 0))(
  ( (Nil!13829) (Cons!13828 (h!14900 (_ BitVec 64)) (t!20147 List!13832)) )
))
(declare-fun arrayNoDuplicates!0 (array!41433 (_ BitVec 32) List!13832) Bool)

(assert (=> b!740162 (= res!497707 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13829))))

(declare-fun b!740149 () Bool)

(assert (=> b!740149 (= e!413834 (not e!413829))))

(declare-fun res!497716 () Bool)

(assert (=> b!740149 (=> res!497716 e!413829)))

(assert (=> b!740149 (= res!497716 (or (not (is-Intermediate!7430 lt!328767)) (bvsge x!1131 (x!63076 lt!328767))))))

(assert (=> b!740149 (= lt!328764 (Found!7430 j!159))))

(declare-fun e!413827 () Bool)

(assert (=> b!740149 e!413827))

(declare-fun res!497708 () Bool)

(assert (=> b!740149 (=> (not res!497708) (not e!413827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41433 (_ BitVec 32)) Bool)

(assert (=> b!740149 (= res!497708 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328758 () Unit!25316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25316)

(assert (=> b!740149 (= lt!328758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!497715 () Bool)

(assert (=> start!65260 (=> (not res!497715) (not e!413833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65260 (= res!497715 (validMask!0 mask!3328))))

(assert (=> start!65260 e!413833))

(assert (=> start!65260 true))

(declare-fun array_inv!15626 (array!41433) Bool)

(assert (=> start!65260 (array_inv!15626 a!3186)))

(declare-fun b!740163 () Bool)

(declare-fun res!497710 () Bool)

(assert (=> b!740163 (=> (not res!497710) (not e!413823))))

(assert (=> b!740163 (= res!497710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740164 () Bool)

(assert (=> b!740164 (= e!413828 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328769 resIntermediateIndex!5 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328764)))))

(declare-fun b!740165 () Bool)

(assert (=> b!740165 (= e!413828 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328769 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328762)))))

(declare-fun b!740166 () Bool)

(assert (=> b!740166 (= e!413827 e!413832)))

(declare-fun res!497723 () Bool)

(assert (=> b!740166 (=> (not res!497723) (not e!413832))))

(assert (=> b!740166 (= res!497723 (= (seekEntryOrOpen!0 (select (arr!19830 a!3186) j!159) a!3186 mask!3328) lt!328759))))

(assert (=> b!740166 (= lt!328759 (Found!7430 j!159))))

(assert (= (and start!65260 res!497715) b!740150))

(assert (= (and b!740150 res!497705) b!740155))

(assert (= (and b!740155 res!497712) b!740147))

(assert (= (and b!740147 res!497711) b!740154))

(assert (= (and b!740154 res!497721) b!740159))

(assert (= (and b!740159 res!497717) b!740163))

(assert (= (and b!740163 res!497710) b!740162))

(assert (= (and b!740162 res!497707) b!740157))

(assert (= (and b!740157 res!497720) b!740153))

(assert (= (and b!740153 res!497713) b!740146))

(assert (= (and b!740146 res!497718) b!740145))

(assert (= (and b!740145 c!81601) b!740160))

(assert (= (and b!740145 (not c!81601)) b!740156))

(assert (= (and b!740145 res!497706) b!740148))

(assert (= (and b!740148 res!497709) b!740149))

(assert (= (and b!740149 res!497708) b!740166))

(assert (= (and b!740166 res!497723) b!740142))

(assert (= (and b!740149 (not res!497716)) b!740152))

(assert (= (and b!740152 c!81599) b!740161))

(assert (= (and b!740152 (not c!81599)) b!740151))

(assert (= (and b!740152 (not res!497714)) b!740143))

(assert (= (and b!740143 c!81600) b!740165))

(assert (= (and b!740143 (not c!81600)) b!740164))

(assert (= (and b!740143 (not res!497722)) b!740144))

(assert (= (and b!740144 (not res!497719)) b!740158))

(declare-fun m!691345 () Bool)

(assert (=> b!740151 m!691345))

(assert (=> b!740151 m!691345))

(declare-fun m!691347 () Bool)

(assert (=> b!740151 m!691347))

(assert (=> b!740151 m!691345))

(declare-fun m!691349 () Bool)

(assert (=> b!740151 m!691349))

(assert (=> b!740161 m!691345))

(assert (=> b!740161 m!691345))

(declare-fun m!691351 () Bool)

(assert (=> b!740161 m!691351))

(assert (=> b!740153 m!691345))

(assert (=> b!740153 m!691345))

(declare-fun m!691353 () Bool)

(assert (=> b!740153 m!691353))

(assert (=> b!740153 m!691353))

(assert (=> b!740153 m!691345))

(declare-fun m!691355 () Bool)

(assert (=> b!740153 m!691355))

(assert (=> b!740166 m!691345))

(assert (=> b!740166 m!691345))

(declare-fun m!691357 () Bool)

(assert (=> b!740166 m!691357))

(declare-fun m!691359 () Bool)

(assert (=> start!65260 m!691359))

(declare-fun m!691361 () Bool)

(assert (=> start!65260 m!691361))

(assert (=> b!740155 m!691345))

(assert (=> b!740155 m!691345))

(declare-fun m!691363 () Bool)

(assert (=> b!740155 m!691363))

(declare-fun m!691365 () Bool)

(assert (=> b!740158 m!691365))

(declare-fun m!691367 () Bool)

(assert (=> b!740158 m!691367))

(declare-fun m!691369 () Bool)

(assert (=> b!740152 m!691369))

(assert (=> b!740165 m!691345))

(assert (=> b!740165 m!691345))

(assert (=> b!740165 m!691351))

(assert (=> b!740160 m!691345))

(assert (=> b!740160 m!691345))

(declare-fun m!691371 () Bool)

(assert (=> b!740160 m!691371))

(declare-fun m!691373 () Bool)

(assert (=> b!740159 m!691373))

(declare-fun m!691375 () Bool)

(assert (=> b!740148 m!691375))

(declare-fun m!691377 () Bool)

(assert (=> b!740148 m!691377))

(assert (=> b!740148 m!691375))

(declare-fun m!691379 () Bool)

(assert (=> b!740148 m!691379))

(declare-fun m!691381 () Bool)

(assert (=> b!740148 m!691381))

(declare-fun m!691383 () Bool)

(assert (=> b!740148 m!691383))

(declare-fun m!691385 () Bool)

(assert (=> b!740147 m!691385))

(assert (=> b!740156 m!691345))

(assert (=> b!740156 m!691345))

(assert (=> b!740156 m!691347))

(declare-fun m!691387 () Bool)

(assert (=> b!740144 m!691387))

(declare-fun m!691389 () Bool)

(assert (=> b!740146 m!691389))

(assert (=> b!740164 m!691345))

(assert (=> b!740164 m!691345))

(assert (=> b!740164 m!691349))

(declare-fun m!691391 () Bool)

(assert (=> b!740162 m!691391))

(declare-fun m!691393 () Bool)

(assert (=> b!740149 m!691393))

(declare-fun m!691395 () Bool)

(assert (=> b!740149 m!691395))

(assert (=> b!740142 m!691345))

(assert (=> b!740142 m!691345))

(declare-fun m!691397 () Bool)

(assert (=> b!740142 m!691397))

(declare-fun m!691399 () Bool)

(assert (=> b!740154 m!691399))

(declare-fun m!691401 () Bool)

(assert (=> b!740163 m!691401))

(push 1)

