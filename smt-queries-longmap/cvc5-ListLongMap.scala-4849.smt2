; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66792 () Bool)

(assert start!66792)

(declare-fun b!770156 () Bool)

(declare-fun e!428814 () Bool)

(declare-fun e!428815 () Bool)

(assert (=> b!770156 (= e!428814 e!428815)))

(declare-fun res!520929 () Bool)

(assert (=> b!770156 (=> (not res!520929) (not e!428815))))

(declare-datatypes ((SeekEntryResult!7877 0))(
  ( (MissingZero!7877 (index!33876 (_ BitVec 32))) (Found!7877 (index!33877 (_ BitVec 32))) (Intermediate!7877 (undefined!8689 Bool) (index!33878 (_ BitVec 32)) (x!64808 (_ BitVec 32))) (Undefined!7877) (MissingVacant!7877 (index!33879 (_ BitVec 32))) )
))
(declare-fun lt!342742 () SeekEntryResult!7877)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770156 (= res!520929 (or (= lt!342742 (MissingZero!7877 i!1173)) (= lt!342742 (MissingVacant!7877 i!1173))))))

(declare-datatypes ((array!42354 0))(
  ( (array!42355 (arr!20277 (Array (_ BitVec 32) (_ BitVec 64))) (size!20698 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42354)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42354 (_ BitVec 32)) SeekEntryResult!7877)

(assert (=> b!770156 (= lt!342742 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770157 () Bool)

(declare-fun e!428810 () Bool)

(declare-fun e!428813 () Bool)

(assert (=> b!770157 (= e!428810 (not e!428813))))

(declare-fun res!520937 () Bool)

(assert (=> b!770157 (=> res!520937 e!428813)))

(declare-fun lt!342745 () SeekEntryResult!7877)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!770157 (= res!520937 (or (not (is-Intermediate!7877 lt!342745)) (bvsge x!1131 (x!64808 lt!342745))))))

(declare-fun e!428817 () Bool)

(assert (=> b!770157 e!428817))

(declare-fun res!520925 () Bool)

(assert (=> b!770157 (=> (not res!520925) (not e!428817))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42354 (_ BitVec 32)) Bool)

(assert (=> b!770157 (= res!520925 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26522 0))(
  ( (Unit!26523) )
))
(declare-fun lt!342741 () Unit!26522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26522)

(assert (=> b!770157 (= lt!342741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770159 () Bool)

(declare-fun res!520933 () Bool)

(assert (=> b!770159 (=> (not res!520933) (not e!428815))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770159 (= res!520933 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20698 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20698 a!3186))))))

(declare-fun b!770160 () Bool)

(declare-fun res!520936 () Bool)

(assert (=> b!770160 (=> (not res!520936) (not e!428815))))

(assert (=> b!770160 (= res!520936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770161 () Bool)

(declare-fun res!520940 () Bool)

(assert (=> b!770161 (=> (not res!520940) (not e!428814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770161 (= res!520940 (validKeyInArray!0 k!2102))))

(declare-fun b!770162 () Bool)

(declare-fun res!520931 () Bool)

(assert (=> b!770162 (=> (not res!520931) (not e!428814))))

(assert (=> b!770162 (= res!520931 (validKeyInArray!0 (select (arr!20277 a!3186) j!159)))))

(declare-fun b!770163 () Bool)

(declare-fun res!520928 () Bool)

(declare-fun e!428812 () Bool)

(assert (=> b!770163 (=> (not res!520928) (not e!428812))))

(assert (=> b!770163 (= res!520928 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20277 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770164 () Bool)

(assert (=> b!770164 (= e!428815 e!428812)))

(declare-fun res!520939 () Bool)

(assert (=> b!770164 (=> (not res!520939) (not e!428812))))

(declare-fun lt!342740 () SeekEntryResult!7877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42354 (_ BitVec 32)) SeekEntryResult!7877)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770164 (= res!520939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20277 a!3186) j!159) mask!3328) (select (arr!20277 a!3186) j!159) a!3186 mask!3328) lt!342740))))

(assert (=> b!770164 (= lt!342740 (Intermediate!7877 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770165 () Bool)

(declare-fun e!428816 () Bool)

(assert (=> b!770165 (= e!428817 e!428816)))

(declare-fun res!520932 () Bool)

(assert (=> b!770165 (=> (not res!520932) (not e!428816))))

(declare-fun lt!342739 () SeekEntryResult!7877)

(assert (=> b!770165 (= res!520932 (= (seekEntryOrOpen!0 (select (arr!20277 a!3186) j!159) a!3186 mask!3328) lt!342739))))

(assert (=> b!770165 (= lt!342739 (Found!7877 j!159))))

(declare-fun b!770166 () Bool)

(declare-fun e!428819 () Unit!26522)

(declare-fun Unit!26524 () Unit!26522)

(assert (=> b!770166 (= e!428819 Unit!26524)))

(declare-fun lt!342747 () (_ BitVec 32))

(assert (=> b!770166 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342747 (select (arr!20277 a!3186) j!159) a!3186 mask!3328) lt!342740)))

(declare-fun b!770167 () Bool)

(assert (=> b!770167 (= e!428813 true)))

(declare-fun lt!342744 () Unit!26522)

(assert (=> b!770167 (= lt!342744 e!428819)))

(declare-fun c!85011 () Bool)

(assert (=> b!770167 (= c!85011 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770167 (= lt!342747 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!520938 () Bool)

(assert (=> start!66792 (=> (not res!520938) (not e!428814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66792 (= res!520938 (validMask!0 mask!3328))))

(assert (=> start!66792 e!428814))

(assert (=> start!66792 true))

(declare-fun array_inv!16073 (array!42354) Bool)

(assert (=> start!66792 (array_inv!16073 a!3186)))

(declare-fun b!770158 () Bool)

(declare-fun res!520935 () Bool)

(assert (=> b!770158 (=> (not res!520935) (not e!428812))))

(declare-fun e!428818 () Bool)

(assert (=> b!770158 (= res!520935 e!428818)))

(declare-fun c!85012 () Bool)

(assert (=> b!770158 (= c!85012 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770168 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42354 (_ BitVec 32)) SeekEntryResult!7877)

(assert (=> b!770168 (= e!428816 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20277 a!3186) j!159) a!3186 mask!3328) lt!342739))))

(declare-fun b!770169 () Bool)

(assert (=> b!770169 (= e!428812 e!428810)))

(declare-fun res!520930 () Bool)

(assert (=> b!770169 (=> (not res!520930) (not e!428810))))

(declare-fun lt!342749 () SeekEntryResult!7877)

(assert (=> b!770169 (= res!520930 (= lt!342749 lt!342745))))

(declare-fun lt!342748 () (_ BitVec 64))

(declare-fun lt!342743 () array!42354)

(assert (=> b!770169 (= lt!342745 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342748 lt!342743 mask!3328))))

(assert (=> b!770169 (= lt!342749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342748 mask!3328) lt!342748 lt!342743 mask!3328))))

(assert (=> b!770169 (= lt!342748 (select (store (arr!20277 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770169 (= lt!342743 (array!42355 (store (arr!20277 a!3186) i!1173 k!2102) (size!20698 a!3186)))))

(declare-fun b!770170 () Bool)

(declare-fun res!520927 () Bool)

(assert (=> b!770170 (=> (not res!520927) (not e!428814))))

(declare-fun arrayContainsKey!0 (array!42354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770170 (= res!520927 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770171 () Bool)

(assert (=> b!770171 (= e!428818 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20277 a!3186) j!159) a!3186 mask!3328) (Found!7877 j!159)))))

(declare-fun b!770172 () Bool)

(declare-fun res!520926 () Bool)

(assert (=> b!770172 (=> (not res!520926) (not e!428815))))

(declare-datatypes ((List!14279 0))(
  ( (Nil!14276) (Cons!14275 (h!15374 (_ BitVec 64)) (t!20594 List!14279)) )
))
(declare-fun arrayNoDuplicates!0 (array!42354 (_ BitVec 32) List!14279) Bool)

(assert (=> b!770172 (= res!520926 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14276))))

(declare-fun b!770173 () Bool)

(assert (=> b!770173 (= e!428818 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20277 a!3186) j!159) a!3186 mask!3328) lt!342740))))

(declare-fun b!770174 () Bool)

(declare-fun res!520934 () Bool)

(assert (=> b!770174 (=> (not res!520934) (not e!428814))))

(assert (=> b!770174 (= res!520934 (and (= (size!20698 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20698 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20698 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770175 () Bool)

(declare-fun Unit!26525 () Unit!26522)

(assert (=> b!770175 (= e!428819 Unit!26525)))

(declare-fun lt!342746 () SeekEntryResult!7877)

(assert (=> b!770175 (= lt!342746 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20277 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770175 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342747 resIntermediateIndex!5 (select (arr!20277 a!3186) j!159) a!3186 mask!3328) (Found!7877 j!159))))

(assert (= (and start!66792 res!520938) b!770174))

(assert (= (and b!770174 res!520934) b!770162))

(assert (= (and b!770162 res!520931) b!770161))

(assert (= (and b!770161 res!520940) b!770170))

(assert (= (and b!770170 res!520927) b!770156))

(assert (= (and b!770156 res!520929) b!770160))

(assert (= (and b!770160 res!520936) b!770172))

(assert (= (and b!770172 res!520926) b!770159))

(assert (= (and b!770159 res!520933) b!770164))

(assert (= (and b!770164 res!520939) b!770163))

(assert (= (and b!770163 res!520928) b!770158))

(assert (= (and b!770158 c!85012) b!770173))

(assert (= (and b!770158 (not c!85012)) b!770171))

(assert (= (and b!770158 res!520935) b!770169))

(assert (= (and b!770169 res!520930) b!770157))

(assert (= (and b!770157 res!520925) b!770165))

(assert (= (and b!770165 res!520932) b!770168))

(assert (= (and b!770157 (not res!520937)) b!770167))

(assert (= (and b!770167 c!85011) b!770166))

(assert (= (and b!770167 (not c!85011)) b!770175))

(declare-fun m!715475 () Bool)

(assert (=> b!770167 m!715475))

(declare-fun m!715477 () Bool)

(assert (=> b!770170 m!715477))

(declare-fun m!715479 () Bool)

(assert (=> b!770157 m!715479))

(declare-fun m!715481 () Bool)

(assert (=> b!770157 m!715481))

(declare-fun m!715483 () Bool)

(assert (=> b!770162 m!715483))

(assert (=> b!770162 m!715483))

(declare-fun m!715485 () Bool)

(assert (=> b!770162 m!715485))

(assert (=> b!770165 m!715483))

(assert (=> b!770165 m!715483))

(declare-fun m!715487 () Bool)

(assert (=> b!770165 m!715487))

(assert (=> b!770164 m!715483))

(assert (=> b!770164 m!715483))

(declare-fun m!715489 () Bool)

(assert (=> b!770164 m!715489))

(assert (=> b!770164 m!715489))

(assert (=> b!770164 m!715483))

(declare-fun m!715491 () Bool)

(assert (=> b!770164 m!715491))

(assert (=> b!770168 m!715483))

(assert (=> b!770168 m!715483))

(declare-fun m!715493 () Bool)

(assert (=> b!770168 m!715493))

(declare-fun m!715495 () Bool)

(assert (=> b!770172 m!715495))

(declare-fun m!715497 () Bool)

(assert (=> b!770169 m!715497))

(declare-fun m!715499 () Bool)

(assert (=> b!770169 m!715499))

(assert (=> b!770169 m!715497))

(declare-fun m!715501 () Bool)

(assert (=> b!770169 m!715501))

(declare-fun m!715503 () Bool)

(assert (=> b!770169 m!715503))

(declare-fun m!715505 () Bool)

(assert (=> b!770169 m!715505))

(declare-fun m!715507 () Bool)

(assert (=> b!770160 m!715507))

(assert (=> b!770175 m!715483))

(assert (=> b!770175 m!715483))

(declare-fun m!715509 () Bool)

(assert (=> b!770175 m!715509))

(assert (=> b!770175 m!715483))

(declare-fun m!715511 () Bool)

(assert (=> b!770175 m!715511))

(assert (=> b!770173 m!715483))

(assert (=> b!770173 m!715483))

(declare-fun m!715513 () Bool)

(assert (=> b!770173 m!715513))

(declare-fun m!715515 () Bool)

(assert (=> b!770161 m!715515))

(assert (=> b!770166 m!715483))

(assert (=> b!770166 m!715483))

(declare-fun m!715517 () Bool)

(assert (=> b!770166 m!715517))

(declare-fun m!715519 () Bool)

(assert (=> b!770163 m!715519))

(declare-fun m!715521 () Bool)

(assert (=> b!770156 m!715521))

(declare-fun m!715523 () Bool)

(assert (=> start!66792 m!715523))

(declare-fun m!715525 () Bool)

(assert (=> start!66792 m!715525))

(assert (=> b!770171 m!715483))

(assert (=> b!770171 m!715483))

(assert (=> b!770171 m!715509))

(push 1)

