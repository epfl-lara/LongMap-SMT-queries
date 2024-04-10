; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66228 () Bool)

(assert start!66228)

(declare-fun b!762737 () Bool)

(declare-fun e!425109 () Bool)

(assert (=> b!762737 (= e!425109 false)))

(declare-fun lt!339639 () Bool)

(declare-fun e!425106 () Bool)

(assert (=> b!762737 (= lt!339639 e!425106)))

(declare-fun c!83848 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762737 (= c!83848 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762738 () Bool)

(declare-fun res!515816 () Bool)

(declare-fun e!425107 () Bool)

(assert (=> b!762738 (=> (not res!515816) (not e!425107))))

(declare-datatypes ((array!42133 0))(
  ( (array!42134 (arr!20174 (Array (_ BitVec 32) (_ BitVec 64))) (size!20595 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42133)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42133 (_ BitVec 32)) Bool)

(assert (=> b!762738 (= res!515816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762739 () Bool)

(declare-fun res!515815 () Bool)

(declare-fun e!425108 () Bool)

(assert (=> b!762739 (=> (not res!515815) (not e!425108))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762739 (= res!515815 (validKeyInArray!0 (select (arr!20174 a!3186) j!159)))))

(declare-fun b!762740 () Bool)

(declare-fun res!515822 () Bool)

(assert (=> b!762740 (=> (not res!515822) (not e!425107))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!762740 (= res!515822 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20595 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20595 a!3186))))))

(declare-fun b!762741 () Bool)

(assert (=> b!762741 (= e!425108 e!425107)))

(declare-fun res!515814 () Bool)

(assert (=> b!762741 (=> (not res!515814) (not e!425107))))

(declare-datatypes ((SeekEntryResult!7774 0))(
  ( (MissingZero!7774 (index!33464 (_ BitVec 32))) (Found!7774 (index!33465 (_ BitVec 32))) (Intermediate!7774 (undefined!8586 Bool) (index!33466 (_ BitVec 32)) (x!64370 (_ BitVec 32))) (Undefined!7774) (MissingVacant!7774 (index!33467 (_ BitVec 32))) )
))
(declare-fun lt!339640 () SeekEntryResult!7774)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762741 (= res!515814 (or (= lt!339640 (MissingZero!7774 i!1173)) (= lt!339640 (MissingVacant!7774 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42133 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!762741 (= lt!339640 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762742 () Bool)

(declare-fun lt!339641 () SeekEntryResult!7774)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42133 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!762742 (= e!425106 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20174 a!3186) j!159) a!3186 mask!3328) lt!339641)))))

(declare-fun res!515817 () Bool)

(assert (=> start!66228 (=> (not res!515817) (not e!425108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66228 (= res!515817 (validMask!0 mask!3328))))

(assert (=> start!66228 e!425108))

(assert (=> start!66228 true))

(declare-fun array_inv!15970 (array!42133) Bool)

(assert (=> start!66228 (array_inv!15970 a!3186)))

(declare-fun b!762743 () Bool)

(declare-fun res!515823 () Bool)

(assert (=> b!762743 (=> (not res!515823) (not e!425108))))

(declare-fun arrayContainsKey!0 (array!42133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762743 (= res!515823 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762744 () Bool)

(declare-fun res!515824 () Bool)

(assert (=> b!762744 (=> (not res!515824) (not e!425109))))

(assert (=> b!762744 (= res!515824 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20174 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762745 () Bool)

(declare-fun res!515818 () Bool)

(assert (=> b!762745 (=> (not res!515818) (not e!425108))))

(assert (=> b!762745 (= res!515818 (validKeyInArray!0 k!2102))))

(declare-fun b!762746 () Bool)

(declare-fun res!515819 () Bool)

(assert (=> b!762746 (=> (not res!515819) (not e!425107))))

(declare-datatypes ((List!14176 0))(
  ( (Nil!14173) (Cons!14172 (h!15256 (_ BitVec 64)) (t!20491 List!14176)) )
))
(declare-fun arrayNoDuplicates!0 (array!42133 (_ BitVec 32) List!14176) Bool)

(assert (=> b!762746 (= res!515819 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14173))))

(declare-fun b!762747 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42133 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!762747 (= e!425106 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20174 a!3186) j!159) a!3186 mask!3328) (Found!7774 j!159))))))

(declare-fun b!762748 () Bool)

(declare-fun res!515821 () Bool)

(assert (=> b!762748 (=> (not res!515821) (not e!425108))))

(assert (=> b!762748 (= res!515821 (and (= (size!20595 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20595 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20595 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762749 () Bool)

(assert (=> b!762749 (= e!425107 e!425109)))

(declare-fun res!515820 () Bool)

(assert (=> b!762749 (=> (not res!515820) (not e!425109))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762749 (= res!515820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20174 a!3186) j!159) mask!3328) (select (arr!20174 a!3186) j!159) a!3186 mask!3328) lt!339641))))

(assert (=> b!762749 (= lt!339641 (Intermediate!7774 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66228 res!515817) b!762748))

(assert (= (and b!762748 res!515821) b!762739))

(assert (= (and b!762739 res!515815) b!762745))

(assert (= (and b!762745 res!515818) b!762743))

(assert (= (and b!762743 res!515823) b!762741))

(assert (= (and b!762741 res!515814) b!762738))

(assert (= (and b!762738 res!515816) b!762746))

(assert (= (and b!762746 res!515819) b!762740))

(assert (= (and b!762740 res!515822) b!762749))

(assert (= (and b!762749 res!515820) b!762744))

(assert (= (and b!762744 res!515824) b!762737))

(assert (= (and b!762737 c!83848) b!762742))

(assert (= (and b!762737 (not c!83848)) b!762747))

(declare-fun m!709403 () Bool)

(assert (=> b!762745 m!709403))

(declare-fun m!709405 () Bool)

(assert (=> b!762747 m!709405))

(assert (=> b!762747 m!709405))

(declare-fun m!709407 () Bool)

(assert (=> b!762747 m!709407))

(assert (=> b!762742 m!709405))

(assert (=> b!762742 m!709405))

(declare-fun m!709409 () Bool)

(assert (=> b!762742 m!709409))

(assert (=> b!762739 m!709405))

(assert (=> b!762739 m!709405))

(declare-fun m!709411 () Bool)

(assert (=> b!762739 m!709411))

(declare-fun m!709413 () Bool)

(assert (=> b!762741 m!709413))

(declare-fun m!709415 () Bool)

(assert (=> b!762746 m!709415))

(assert (=> b!762749 m!709405))

(assert (=> b!762749 m!709405))

(declare-fun m!709417 () Bool)

(assert (=> b!762749 m!709417))

(assert (=> b!762749 m!709417))

(assert (=> b!762749 m!709405))

(declare-fun m!709419 () Bool)

(assert (=> b!762749 m!709419))

(declare-fun m!709421 () Bool)

(assert (=> b!762738 m!709421))

(declare-fun m!709423 () Bool)

(assert (=> b!762743 m!709423))

(declare-fun m!709425 () Bool)

(assert (=> b!762744 m!709425))

(declare-fun m!709427 () Bool)

(assert (=> start!66228 m!709427))

(declare-fun m!709429 () Bool)

(assert (=> start!66228 m!709429))

(push 1)

(assert (not b!762747))

