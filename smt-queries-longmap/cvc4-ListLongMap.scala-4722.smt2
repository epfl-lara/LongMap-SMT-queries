; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65396 () Bool)

(assert start!65396)

(declare-fun b!744124 () Bool)

(declare-fun res!501152 () Bool)

(declare-fun e!415703 () Bool)

(assert (=> b!744124 (=> (not res!501152) (not e!415703))))

(declare-datatypes ((array!41569 0))(
  ( (array!41570 (arr!19898 (Array (_ BitVec 32) (_ BitVec 64))) (size!20319 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41569)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!744124 (= res!501152 (and (= (size!20319 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20319 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20319 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744125 () Bool)

(declare-fun res!501147 () Bool)

(assert (=> b!744125 (=> (not res!501147) (not e!415703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744125 (= res!501147 (validKeyInArray!0 (select (arr!19898 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!415705 () Bool)

(declare-datatypes ((SeekEntryResult!7498 0))(
  ( (MissingZero!7498 (index!32360 (_ BitVec 32))) (Found!7498 (index!32361 (_ BitVec 32))) (Intermediate!7498 (undefined!8310 Bool) (index!32362 (_ BitVec 32)) (x!63320 (_ BitVec 32))) (Undefined!7498) (MissingVacant!7498 (index!32363 (_ BitVec 32))) )
))
(declare-fun lt!330558 () SeekEntryResult!7498)

(declare-fun b!744126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41569 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!744126 (= e!415705 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330558))))

(declare-fun b!744128 () Bool)

(declare-fun e!415706 () Bool)

(declare-fun e!415702 () Bool)

(assert (=> b!744128 (= e!415706 e!415702)))

(declare-fun res!501158 () Bool)

(assert (=> b!744128 (=> (not res!501158) (not e!415702))))

(declare-fun lt!330561 () SeekEntryResult!7498)

(declare-fun lt!330557 () SeekEntryResult!7498)

(assert (=> b!744128 (= res!501158 (= lt!330561 lt!330557))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330560 () array!41569)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330559 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41569 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!744128 (= lt!330557 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330559 lt!330560 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744128 (= lt!330561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330559 mask!3328) lt!330559 lt!330560 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744128 (= lt!330559 (select (store (arr!19898 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744128 (= lt!330560 (array!41570 (store (arr!19898 a!3186) i!1173 k!2102) (size!20319 a!3186)))))

(declare-fun b!744129 () Bool)

(declare-fun e!415704 () Bool)

(assert (=> b!744129 (= e!415704 true)))

(declare-fun lt!330563 () SeekEntryResult!7498)

(assert (=> b!744129 (= lt!330563 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19898 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744130 () Bool)

(declare-fun e!415701 () Bool)

(assert (=> b!744130 (= e!415701 e!415705)))

(declare-fun res!501151 () Bool)

(assert (=> b!744130 (=> (not res!501151) (not e!415705))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41569 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!744130 (= res!501151 (= (seekEntryOrOpen!0 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330558))))

(assert (=> b!744130 (= lt!330558 (Found!7498 j!159))))

(declare-fun b!744131 () Bool)

(declare-fun res!501156 () Bool)

(assert (=> b!744131 (=> (not res!501156) (not e!415706))))

(assert (=> b!744131 (= res!501156 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19898 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!415699 () Bool)

(declare-fun b!744132 () Bool)

(assert (=> b!744132 (= e!415699 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) (Found!7498 j!159)))))

(declare-fun b!744133 () Bool)

(assert (=> b!744133 (= e!415702 (not e!415704))))

(declare-fun res!501150 () Bool)

(assert (=> b!744133 (=> res!501150 e!415704)))

(assert (=> b!744133 (= res!501150 (or (not (is-Intermediate!7498 lt!330557)) (bvslt x!1131 (x!63320 lt!330557)) (not (= x!1131 (x!63320 lt!330557))) (not (= index!1321 (index!32362 lt!330557)))))))

(assert (=> b!744133 e!415701))

(declare-fun res!501144 () Bool)

(assert (=> b!744133 (=> (not res!501144) (not e!415701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41569 (_ BitVec 32)) Bool)

(assert (=> b!744133 (= res!501144 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25476 0))(
  ( (Unit!25477) )
))
(declare-fun lt!330562 () Unit!25476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25476)

(assert (=> b!744133 (= lt!330562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744134 () Bool)

(declare-fun res!501146 () Bool)

(assert (=> b!744134 (=> (not res!501146) (not e!415706))))

(assert (=> b!744134 (= res!501146 e!415699)))

(declare-fun c!81871 () Bool)

(assert (=> b!744134 (= c!81871 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744135 () Bool)

(declare-fun e!415698 () Bool)

(assert (=> b!744135 (= e!415698 e!415706)))

(declare-fun res!501157 () Bool)

(assert (=> b!744135 (=> (not res!501157) (not e!415706))))

(declare-fun lt!330555 () SeekEntryResult!7498)

(assert (=> b!744135 (= res!501157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19898 a!3186) j!159) mask!3328) (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330555))))

(assert (=> b!744135 (= lt!330555 (Intermediate!7498 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744136 () Bool)

(declare-fun res!501149 () Bool)

(assert (=> b!744136 (=> (not res!501149) (not e!415698))))

(assert (=> b!744136 (= res!501149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744137 () Bool)

(declare-fun res!501153 () Bool)

(assert (=> b!744137 (=> (not res!501153) (not e!415703))))

(declare-fun arrayContainsKey!0 (array!41569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744137 (= res!501153 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744138 () Bool)

(declare-fun res!501154 () Bool)

(assert (=> b!744138 (=> (not res!501154) (not e!415698))))

(assert (=> b!744138 (= res!501154 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20319 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20319 a!3186))))))

(declare-fun b!744139 () Bool)

(assert (=> b!744139 (= e!415699 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330555))))

(declare-fun b!744127 () Bool)

(assert (=> b!744127 (= e!415703 e!415698)))

(declare-fun res!501155 () Bool)

(assert (=> b!744127 (=> (not res!501155) (not e!415698))))

(declare-fun lt!330556 () SeekEntryResult!7498)

(assert (=> b!744127 (= res!501155 (or (= lt!330556 (MissingZero!7498 i!1173)) (= lt!330556 (MissingVacant!7498 i!1173))))))

(assert (=> b!744127 (= lt!330556 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!501143 () Bool)

(assert (=> start!65396 (=> (not res!501143) (not e!415703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65396 (= res!501143 (validMask!0 mask!3328))))

(assert (=> start!65396 e!415703))

(assert (=> start!65396 true))

(declare-fun array_inv!15694 (array!41569) Bool)

(assert (=> start!65396 (array_inv!15694 a!3186)))

(declare-fun b!744140 () Bool)

(declare-fun res!501148 () Bool)

(assert (=> b!744140 (=> (not res!501148) (not e!415703))))

(assert (=> b!744140 (= res!501148 (validKeyInArray!0 k!2102))))

(declare-fun b!744141 () Bool)

(declare-fun res!501145 () Bool)

(assert (=> b!744141 (=> (not res!501145) (not e!415698))))

(declare-datatypes ((List!13900 0))(
  ( (Nil!13897) (Cons!13896 (h!14968 (_ BitVec 64)) (t!20215 List!13900)) )
))
(declare-fun arrayNoDuplicates!0 (array!41569 (_ BitVec 32) List!13900) Bool)

(assert (=> b!744141 (= res!501145 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13897))))

(assert (= (and start!65396 res!501143) b!744124))

(assert (= (and b!744124 res!501152) b!744125))

(assert (= (and b!744125 res!501147) b!744140))

(assert (= (and b!744140 res!501148) b!744137))

(assert (= (and b!744137 res!501153) b!744127))

(assert (= (and b!744127 res!501155) b!744136))

(assert (= (and b!744136 res!501149) b!744141))

(assert (= (and b!744141 res!501145) b!744138))

(assert (= (and b!744138 res!501154) b!744135))

(assert (= (and b!744135 res!501157) b!744131))

(assert (= (and b!744131 res!501156) b!744134))

(assert (= (and b!744134 c!81871) b!744139))

(assert (= (and b!744134 (not c!81871)) b!744132))

(assert (= (and b!744134 res!501146) b!744128))

(assert (= (and b!744128 res!501158) b!744133))

(assert (= (and b!744133 res!501144) b!744130))

(assert (= (and b!744130 res!501151) b!744126))

(assert (= (and b!744133 (not res!501150)) b!744129))

(declare-fun m!694701 () Bool)

(assert (=> b!744129 m!694701))

(assert (=> b!744129 m!694701))

(declare-fun m!694703 () Bool)

(assert (=> b!744129 m!694703))

(declare-fun m!694705 () Bool)

(assert (=> b!744137 m!694705))

(assert (=> b!744132 m!694701))

(assert (=> b!744132 m!694701))

(assert (=> b!744132 m!694703))

(declare-fun m!694707 () Bool)

(assert (=> b!744127 m!694707))

(declare-fun m!694709 () Bool)

(assert (=> b!744133 m!694709))

(declare-fun m!694711 () Bool)

(assert (=> b!744133 m!694711))

(assert (=> b!744130 m!694701))

(assert (=> b!744130 m!694701))

(declare-fun m!694713 () Bool)

(assert (=> b!744130 m!694713))

(assert (=> b!744125 m!694701))

(assert (=> b!744125 m!694701))

(declare-fun m!694715 () Bool)

(assert (=> b!744125 m!694715))

(assert (=> b!744135 m!694701))

(assert (=> b!744135 m!694701))

(declare-fun m!694717 () Bool)

(assert (=> b!744135 m!694717))

(assert (=> b!744135 m!694717))

(assert (=> b!744135 m!694701))

(declare-fun m!694719 () Bool)

(assert (=> b!744135 m!694719))

(declare-fun m!694721 () Bool)

(assert (=> b!744128 m!694721))

(declare-fun m!694723 () Bool)

(assert (=> b!744128 m!694723))

(declare-fun m!694725 () Bool)

(assert (=> b!744128 m!694725))

(declare-fun m!694727 () Bool)

(assert (=> b!744128 m!694727))

(assert (=> b!744128 m!694721))

(declare-fun m!694729 () Bool)

(assert (=> b!744128 m!694729))

(declare-fun m!694731 () Bool)

(assert (=> b!744140 m!694731))

(assert (=> b!744139 m!694701))

(assert (=> b!744139 m!694701))

(declare-fun m!694733 () Bool)

(assert (=> b!744139 m!694733))

(declare-fun m!694735 () Bool)

(assert (=> b!744141 m!694735))

(declare-fun m!694737 () Bool)

(assert (=> b!744136 m!694737))

(declare-fun m!694739 () Bool)

(assert (=> b!744131 m!694739))

(declare-fun m!694741 () Bool)

(assert (=> start!65396 m!694741))

(declare-fun m!694743 () Bool)

(assert (=> start!65396 m!694743))

(assert (=> b!744126 m!694701))

(assert (=> b!744126 m!694701))

(declare-fun m!694745 () Bool)

(assert (=> b!744126 m!694745))

(push 1)

