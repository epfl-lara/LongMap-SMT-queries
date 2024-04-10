; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65416 () Bool)

(assert start!65416)

(declare-fun b!744673 () Bool)

(declare-fun e!415976 () Bool)

(declare-fun e!415969 () Bool)

(assert (=> b!744673 (= e!415976 e!415969)))

(declare-fun res!501644 () Bool)

(assert (=> b!744673 (=> (not res!501644) (not e!415969))))

(declare-datatypes ((array!41589 0))(
  ( (array!41590 (arr!19908 (Array (_ BitVec 32) (_ BitVec 64))) (size!20329 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41589)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7508 0))(
  ( (MissingZero!7508 (index!32400 (_ BitVec 32))) (Found!7508 (index!32401 (_ BitVec 32))) (Intermediate!7508 (undefined!8320 Bool) (index!32402 (_ BitVec 32)) (x!63362 (_ BitVec 32))) (Undefined!7508) (MissingVacant!7508 (index!32403 (_ BitVec 32))) )
))
(declare-fun lt!330822 () SeekEntryResult!7508)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41589 (_ BitVec 32)) SeekEntryResult!7508)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744673 (= res!501644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19908 a!3186) j!159) mask!3328) (select (arr!19908 a!3186) j!159) a!3186 mask!3328) lt!330822))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744673 (= lt!330822 (Intermediate!7508 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744674 () Bool)

(declare-fun res!501635 () Bool)

(declare-fun e!415970 () Bool)

(assert (=> b!744674 (=> (not res!501635) (not e!415970))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744674 (= res!501635 (and (= (size!20329 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20329 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20329 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744675 () Bool)

(declare-fun e!415975 () Bool)

(assert (=> b!744675 (= e!415969 e!415975)))

(declare-fun res!501640 () Bool)

(assert (=> b!744675 (=> (not res!501640) (not e!415975))))

(declare-fun lt!330821 () SeekEntryResult!7508)

(declare-fun lt!330824 () SeekEntryResult!7508)

(assert (=> b!744675 (= res!501640 (= lt!330821 lt!330824))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330819 () array!41589)

(declare-fun lt!330818 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744675 (= lt!330824 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330818 lt!330819 mask!3328))))

(assert (=> b!744675 (= lt!330821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330818 mask!3328) lt!330818 lt!330819 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744675 (= lt!330818 (select (store (arr!19908 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744675 (= lt!330819 (array!41590 (store (arr!19908 a!3186) i!1173 k!2102) (size!20329 a!3186)))))

(declare-fun b!744676 () Bool)

(declare-fun e!415972 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41589 (_ BitVec 32)) SeekEntryResult!7508)

(assert (=> b!744676 (= e!415972 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19908 a!3186) j!159) a!3186 mask!3328) (Found!7508 j!159)))))

(declare-fun b!744677 () Bool)

(declare-fun res!501647 () Bool)

(assert (=> b!744677 (=> (not res!501647) (not e!415976))))

(assert (=> b!744677 (= res!501647 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20329 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20329 a!3186))))))

(declare-fun b!744678 () Bool)

(declare-fun e!415968 () Bool)

(assert (=> b!744678 (= e!415968 true)))

(declare-fun lt!330817 () SeekEntryResult!7508)

(assert (=> b!744678 (= lt!330817 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19908 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!501638 () Bool)

(assert (=> start!65416 (=> (not res!501638) (not e!415970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65416 (= res!501638 (validMask!0 mask!3328))))

(assert (=> start!65416 e!415970))

(assert (=> start!65416 true))

(declare-fun array_inv!15704 (array!41589) Bool)

(assert (=> start!65416 (array_inv!15704 a!3186)))

(declare-fun b!744679 () Bool)

(declare-fun res!501646 () Bool)

(assert (=> b!744679 (=> (not res!501646) (not e!415976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41589 (_ BitVec 32)) Bool)

(assert (=> b!744679 (= res!501646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744680 () Bool)

(declare-fun res!501637 () Bool)

(assert (=> b!744680 (=> (not res!501637) (not e!415970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744680 (= res!501637 (validKeyInArray!0 k!2102))))

(declare-fun b!744681 () Bool)

(assert (=> b!744681 (= e!415975 (not e!415968))))

(declare-fun res!501634 () Bool)

(assert (=> b!744681 (=> res!501634 e!415968)))

(assert (=> b!744681 (= res!501634 (or (not (is-Intermediate!7508 lt!330824)) (bvslt x!1131 (x!63362 lt!330824)) (not (= x!1131 (x!63362 lt!330824))) (not (= index!1321 (index!32402 lt!330824)))))))

(declare-fun e!415973 () Bool)

(assert (=> b!744681 e!415973))

(declare-fun res!501639 () Bool)

(assert (=> b!744681 (=> (not res!501639) (not e!415973))))

(assert (=> b!744681 (= res!501639 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25496 0))(
  ( (Unit!25497) )
))
(declare-fun lt!330820 () Unit!25496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25496)

(assert (=> b!744681 (= lt!330820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744682 () Bool)

(declare-fun e!415974 () Bool)

(assert (=> b!744682 (= e!415973 e!415974)))

(declare-fun res!501643 () Bool)

(assert (=> b!744682 (=> (not res!501643) (not e!415974))))

(declare-fun lt!330816 () SeekEntryResult!7508)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41589 (_ BitVec 32)) SeekEntryResult!7508)

(assert (=> b!744682 (= res!501643 (= (seekEntryOrOpen!0 (select (arr!19908 a!3186) j!159) a!3186 mask!3328) lt!330816))))

(assert (=> b!744682 (= lt!330816 (Found!7508 j!159))))

(declare-fun b!744683 () Bool)

(declare-fun res!501645 () Bool)

(assert (=> b!744683 (=> (not res!501645) (not e!415969))))

(assert (=> b!744683 (= res!501645 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19908 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744684 () Bool)

(declare-fun res!501633 () Bool)

(assert (=> b!744684 (=> (not res!501633) (not e!415970))))

(assert (=> b!744684 (= res!501633 (validKeyInArray!0 (select (arr!19908 a!3186) j!159)))))

(declare-fun b!744685 () Bool)

(assert (=> b!744685 (= e!415974 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19908 a!3186) j!159) a!3186 mask!3328) lt!330816))))

(declare-fun b!744686 () Bool)

(declare-fun res!501632 () Bool)

(assert (=> b!744686 (=> (not res!501632) (not e!415970))))

(declare-fun arrayContainsKey!0 (array!41589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744686 (= res!501632 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744687 () Bool)

(declare-fun res!501642 () Bool)

(assert (=> b!744687 (=> (not res!501642) (not e!415969))))

(assert (=> b!744687 (= res!501642 e!415972)))

(declare-fun c!81901 () Bool)

(assert (=> b!744687 (= c!81901 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744688 () Bool)

(assert (=> b!744688 (= e!415972 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19908 a!3186) j!159) a!3186 mask!3328) lt!330822))))

(declare-fun b!744689 () Bool)

(assert (=> b!744689 (= e!415970 e!415976)))

(declare-fun res!501641 () Bool)

(assert (=> b!744689 (=> (not res!501641) (not e!415976))))

(declare-fun lt!330823 () SeekEntryResult!7508)

(assert (=> b!744689 (= res!501641 (or (= lt!330823 (MissingZero!7508 i!1173)) (= lt!330823 (MissingVacant!7508 i!1173))))))

(assert (=> b!744689 (= lt!330823 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744690 () Bool)

(declare-fun res!501636 () Bool)

(assert (=> b!744690 (=> (not res!501636) (not e!415976))))

(declare-datatypes ((List!13910 0))(
  ( (Nil!13907) (Cons!13906 (h!14978 (_ BitVec 64)) (t!20225 List!13910)) )
))
(declare-fun arrayNoDuplicates!0 (array!41589 (_ BitVec 32) List!13910) Bool)

(assert (=> b!744690 (= res!501636 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13907))))

(assert (= (and start!65416 res!501638) b!744674))

(assert (= (and b!744674 res!501635) b!744684))

(assert (= (and b!744684 res!501633) b!744680))

(assert (= (and b!744680 res!501637) b!744686))

(assert (= (and b!744686 res!501632) b!744689))

(assert (= (and b!744689 res!501641) b!744679))

(assert (= (and b!744679 res!501646) b!744690))

(assert (= (and b!744690 res!501636) b!744677))

(assert (= (and b!744677 res!501647) b!744673))

(assert (= (and b!744673 res!501644) b!744683))

(assert (= (and b!744683 res!501645) b!744687))

(assert (= (and b!744687 c!81901) b!744688))

(assert (= (and b!744687 (not c!81901)) b!744676))

(assert (= (and b!744687 res!501642) b!744675))

(assert (= (and b!744675 res!501640) b!744681))

(assert (= (and b!744681 res!501639) b!744682))

(assert (= (and b!744682 res!501643) b!744685))

(assert (= (and b!744681 (not res!501634)) b!744678))

(declare-fun m!695167 () Bool)

(assert (=> b!744682 m!695167))

(assert (=> b!744682 m!695167))

(declare-fun m!695169 () Bool)

(assert (=> b!744682 m!695169))

(declare-fun m!695171 () Bool)

(assert (=> b!744680 m!695171))

(declare-fun m!695173 () Bool)

(assert (=> b!744686 m!695173))

(assert (=> b!744684 m!695167))

(assert (=> b!744684 m!695167))

(declare-fun m!695175 () Bool)

(assert (=> b!744684 m!695175))

(declare-fun m!695177 () Bool)

(assert (=> b!744681 m!695177))

(declare-fun m!695179 () Bool)

(assert (=> b!744681 m!695179))

(assert (=> b!744688 m!695167))

(assert (=> b!744688 m!695167))

(declare-fun m!695181 () Bool)

(assert (=> b!744688 m!695181))

(assert (=> b!744685 m!695167))

(assert (=> b!744685 m!695167))

(declare-fun m!695183 () Bool)

(assert (=> b!744685 m!695183))

(declare-fun m!695185 () Bool)

(assert (=> b!744683 m!695185))

(assert (=> b!744673 m!695167))

(assert (=> b!744673 m!695167))

(declare-fun m!695187 () Bool)

(assert (=> b!744673 m!695187))

(assert (=> b!744673 m!695187))

(assert (=> b!744673 m!695167))

(declare-fun m!695189 () Bool)

(assert (=> b!744673 m!695189))

(declare-fun m!695191 () Bool)

(assert (=> start!65416 m!695191))

(declare-fun m!695193 () Bool)

(assert (=> start!65416 m!695193))

(assert (=> b!744676 m!695167))

(assert (=> b!744676 m!695167))

(declare-fun m!695195 () Bool)

(assert (=> b!744676 m!695195))

(assert (=> b!744678 m!695167))

(assert (=> b!744678 m!695167))

(assert (=> b!744678 m!695195))

(declare-fun m!695197 () Bool)

(assert (=> b!744690 m!695197))

(declare-fun m!695199 () Bool)

(assert (=> b!744689 m!695199))

(declare-fun m!695201 () Bool)

(assert (=> b!744679 m!695201))

(declare-fun m!695203 () Bool)

(assert (=> b!744675 m!695203))

(declare-fun m!695205 () Bool)

(assert (=> b!744675 m!695205))

(assert (=> b!744675 m!695203))

(declare-fun m!695207 () Bool)

(assert (=> b!744675 m!695207))

(declare-fun m!695209 () Bool)

(assert (=> b!744675 m!695209))

(declare-fun m!695211 () Bool)

(assert (=> b!744675 m!695211))

(push 1)

