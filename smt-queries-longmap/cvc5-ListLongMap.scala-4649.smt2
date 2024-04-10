; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64666 () Bool)

(assert start!64666)

(declare-datatypes ((array!41115 0))(
  ( (array!41116 (arr!19677 (Array (_ BitVec 32) (_ BitVec 64))) (size!20098 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41115)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407921 () Bool)

(declare-fun b!728740 () Bool)

(declare-datatypes ((SeekEntryResult!7277 0))(
  ( (MissingZero!7277 (index!31476 (_ BitVec 32))) (Found!7277 (index!31477 (_ BitVec 32))) (Intermediate!7277 (undefined!8089 Bool) (index!31478 (_ BitVec 32)) (x!62467 (_ BitVec 32))) (Undefined!7277) (MissingVacant!7277 (index!31479 (_ BitVec 32))) )
))
(declare-fun lt!322820 () SeekEntryResult!7277)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41115 (_ BitVec 32)) SeekEntryResult!7277)

(assert (=> b!728740 (= e!407921 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19677 a!3186) j!159) a!3186 mask!3328) lt!322820))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!322816 () SeekEntryResult!7277)

(declare-fun b!728741 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!407915 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41115 (_ BitVec 32)) SeekEntryResult!7277)

(assert (=> b!728741 (= e!407915 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19677 a!3186) j!159) a!3186 mask!3328) lt!322816))))

(declare-fun b!728742 () Bool)

(declare-fun res!489222 () Bool)

(declare-fun e!407918 () Bool)

(assert (=> b!728742 (=> (not res!489222) (not e!407918))))

(assert (=> b!728742 (= res!489222 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20098 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20098 a!3186))))))

(declare-fun b!728743 () Bool)

(declare-fun res!489236 () Bool)

(assert (=> b!728743 (=> (not res!489236) (not e!407918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41115 (_ BitVec 32)) Bool)

(assert (=> b!728743 (= res!489236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728744 () Bool)

(declare-fun res!489225 () Bool)

(declare-fun e!407920 () Bool)

(assert (=> b!728744 (=> (not res!489225) (not e!407920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728744 (= res!489225 (validKeyInArray!0 (select (arr!19677 a!3186) j!159)))))

(declare-fun b!728745 () Bool)

(declare-fun res!489221 () Bool)

(assert (=> b!728745 (=> (not res!489221) (not e!407920))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728745 (= res!489221 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728746 () Bool)

(assert (=> b!728746 (= e!407920 e!407918)))

(declare-fun res!489234 () Bool)

(assert (=> b!728746 (=> (not res!489234) (not e!407918))))

(declare-fun lt!322818 () SeekEntryResult!7277)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728746 (= res!489234 (or (= lt!322818 (MissingZero!7277 i!1173)) (= lt!322818 (MissingVacant!7277 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41115 (_ BitVec 32)) SeekEntryResult!7277)

(assert (=> b!728746 (= lt!322818 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728747 () Bool)

(assert (=> b!728747 (= e!407921 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19677 a!3186) j!159) a!3186 mask!3328) (Found!7277 j!159)))))

(declare-fun b!728748 () Bool)

(declare-fun e!407917 () Bool)

(assert (=> b!728748 (= e!407917 true)))

(declare-fun lt!322813 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728748 (= lt!322813 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728749 () Bool)

(declare-fun res!489227 () Bool)

(declare-fun e!407913 () Bool)

(assert (=> b!728749 (=> (not res!489227) (not e!407913))))

(assert (=> b!728749 (= res!489227 e!407921)))

(declare-fun c!80134 () Bool)

(assert (=> b!728749 (= c!80134 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!489231 () Bool)

(assert (=> start!64666 (=> (not res!489231) (not e!407920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64666 (= res!489231 (validMask!0 mask!3328))))

(assert (=> start!64666 e!407920))

(assert (=> start!64666 true))

(declare-fun array_inv!15473 (array!41115) Bool)

(assert (=> start!64666 (array_inv!15473 a!3186)))

(declare-fun b!728750 () Bool)

(declare-fun e!407916 () Bool)

(assert (=> b!728750 (= e!407913 e!407916)))

(declare-fun res!489223 () Bool)

(assert (=> b!728750 (=> (not res!489223) (not e!407916))))

(declare-fun lt!322815 () SeekEntryResult!7277)

(declare-fun lt!322817 () SeekEntryResult!7277)

(assert (=> b!728750 (= res!489223 (= lt!322815 lt!322817))))

(declare-fun lt!322819 () array!41115)

(declare-fun lt!322812 () (_ BitVec 64))

(assert (=> b!728750 (= lt!322817 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322812 lt!322819 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728750 (= lt!322815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322812 mask!3328) lt!322812 lt!322819 mask!3328))))

(assert (=> b!728750 (= lt!322812 (select (store (arr!19677 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728750 (= lt!322819 (array!41116 (store (arr!19677 a!3186) i!1173 k!2102) (size!20098 a!3186)))))

(declare-fun b!728751 () Bool)

(assert (=> b!728751 (= e!407918 e!407913)))

(declare-fun res!489226 () Bool)

(assert (=> b!728751 (=> (not res!489226) (not e!407913))))

(assert (=> b!728751 (= res!489226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19677 a!3186) j!159) mask!3328) (select (arr!19677 a!3186) j!159) a!3186 mask!3328) lt!322820))))

(assert (=> b!728751 (= lt!322820 (Intermediate!7277 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728752 () Bool)

(declare-fun res!489228 () Bool)

(assert (=> b!728752 (=> (not res!489228) (not e!407920))))

(assert (=> b!728752 (= res!489228 (and (= (size!20098 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20098 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20098 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728753 () Bool)

(declare-fun res!489233 () Bool)

(assert (=> b!728753 (=> (not res!489233) (not e!407918))))

(declare-datatypes ((List!13679 0))(
  ( (Nil!13676) (Cons!13675 (h!14735 (_ BitVec 64)) (t!19994 List!13679)) )
))
(declare-fun arrayNoDuplicates!0 (array!41115 (_ BitVec 32) List!13679) Bool)

(assert (=> b!728753 (= res!489233 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13676))))

(declare-fun b!728754 () Bool)

(assert (=> b!728754 (= e!407916 (not e!407917))))

(declare-fun res!489235 () Bool)

(assert (=> b!728754 (=> res!489235 e!407917)))

(assert (=> b!728754 (= res!489235 (or (not (is-Intermediate!7277 lt!322817)) (bvsge x!1131 (x!62467 lt!322817))))))

(declare-fun e!407914 () Bool)

(assert (=> b!728754 e!407914))

(declare-fun res!489232 () Bool)

(assert (=> b!728754 (=> (not res!489232) (not e!407914))))

(assert (=> b!728754 (= res!489232 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24872 0))(
  ( (Unit!24873) )
))
(declare-fun lt!322814 () Unit!24872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24872)

(assert (=> b!728754 (= lt!322814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728755 () Bool)

(declare-fun res!489224 () Bool)

(assert (=> b!728755 (=> (not res!489224) (not e!407913))))

(assert (=> b!728755 (= res!489224 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19677 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728756 () Bool)

(assert (=> b!728756 (= e!407914 e!407915)))

(declare-fun res!489230 () Bool)

(assert (=> b!728756 (=> (not res!489230) (not e!407915))))

(assert (=> b!728756 (= res!489230 (= (seekEntryOrOpen!0 (select (arr!19677 a!3186) j!159) a!3186 mask!3328) lt!322816))))

(assert (=> b!728756 (= lt!322816 (Found!7277 j!159))))

(declare-fun b!728757 () Bool)

(declare-fun res!489229 () Bool)

(assert (=> b!728757 (=> (not res!489229) (not e!407920))))

(assert (=> b!728757 (= res!489229 (validKeyInArray!0 k!2102))))

(assert (= (and start!64666 res!489231) b!728752))

(assert (= (and b!728752 res!489228) b!728744))

(assert (= (and b!728744 res!489225) b!728757))

(assert (= (and b!728757 res!489229) b!728745))

(assert (= (and b!728745 res!489221) b!728746))

(assert (= (and b!728746 res!489234) b!728743))

(assert (= (and b!728743 res!489236) b!728753))

(assert (= (and b!728753 res!489233) b!728742))

(assert (= (and b!728742 res!489222) b!728751))

(assert (= (and b!728751 res!489226) b!728755))

(assert (= (and b!728755 res!489224) b!728749))

(assert (= (and b!728749 c!80134) b!728740))

(assert (= (and b!728749 (not c!80134)) b!728747))

(assert (= (and b!728749 res!489227) b!728750))

(assert (= (and b!728750 res!489223) b!728754))

(assert (= (and b!728754 res!489232) b!728756))

(assert (= (and b!728756 res!489230) b!728741))

(assert (= (and b!728754 (not res!489235)) b!728748))

(declare-fun m!682459 () Bool)

(assert (=> b!728741 m!682459))

(assert (=> b!728741 m!682459))

(declare-fun m!682461 () Bool)

(assert (=> b!728741 m!682461))

(declare-fun m!682463 () Bool)

(assert (=> b!728755 m!682463))

(assert (=> b!728756 m!682459))

(assert (=> b!728756 m!682459))

(declare-fun m!682465 () Bool)

(assert (=> b!728756 m!682465))

(declare-fun m!682467 () Bool)

(assert (=> b!728748 m!682467))

(declare-fun m!682469 () Bool)

(assert (=> b!728757 m!682469))

(assert (=> b!728744 m!682459))

(assert (=> b!728744 m!682459))

(declare-fun m!682471 () Bool)

(assert (=> b!728744 m!682471))

(declare-fun m!682473 () Bool)

(assert (=> b!728753 m!682473))

(assert (=> b!728740 m!682459))

(assert (=> b!728740 m!682459))

(declare-fun m!682475 () Bool)

(assert (=> b!728740 m!682475))

(assert (=> b!728751 m!682459))

(assert (=> b!728751 m!682459))

(declare-fun m!682477 () Bool)

(assert (=> b!728751 m!682477))

(assert (=> b!728751 m!682477))

(assert (=> b!728751 m!682459))

(declare-fun m!682479 () Bool)

(assert (=> b!728751 m!682479))

(assert (=> b!728747 m!682459))

(assert (=> b!728747 m!682459))

(declare-fun m!682481 () Bool)

(assert (=> b!728747 m!682481))

(declare-fun m!682483 () Bool)

(assert (=> b!728746 m!682483))

(declare-fun m!682485 () Bool)

(assert (=> b!728743 m!682485))

(declare-fun m!682487 () Bool)

(assert (=> b!728750 m!682487))

(declare-fun m!682489 () Bool)

(assert (=> b!728750 m!682489))

(declare-fun m!682491 () Bool)

(assert (=> b!728750 m!682491))

(declare-fun m!682493 () Bool)

(assert (=> b!728750 m!682493))

(declare-fun m!682495 () Bool)

(assert (=> b!728750 m!682495))

(assert (=> b!728750 m!682491))

(declare-fun m!682497 () Bool)

(assert (=> b!728745 m!682497))

(declare-fun m!682499 () Bool)

(assert (=> start!64666 m!682499))

(declare-fun m!682501 () Bool)

(assert (=> start!64666 m!682501))

(declare-fun m!682503 () Bool)

(assert (=> b!728754 m!682503))

(declare-fun m!682505 () Bool)

(assert (=> b!728754 m!682505))

(push 1)

