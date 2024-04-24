; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64116 () Bool)

(assert start!64116)

(declare-fun b!719693 () Bool)

(declare-fun res!481941 () Bool)

(declare-fun e!403904 () Bool)

(assert (=> b!719693 (=> (not res!481941) (not e!403904))))

(declare-datatypes ((array!40744 0))(
  ( (array!40745 (arr!19495 (Array (_ BitVec 32) (_ BitVec 64))) (size!19915 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40744)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719693 (= res!481941 (and (= (size!19915 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19915 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19915 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!481940 () Bool)

(assert (=> start!64116 (=> (not res!481940) (not e!403904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64116 (= res!481940 (validMask!0 mask!3328))))

(assert (=> start!64116 e!403904))

(assert (=> start!64116 true))

(declare-fun array_inv!15354 (array!40744) Bool)

(assert (=> start!64116 (array_inv!15354 a!3186)))

(declare-fun b!719694 () Bool)

(declare-fun res!481939 () Bool)

(assert (=> b!719694 (=> (not res!481939) (not e!403904))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719694 (= res!481939 (validKeyInArray!0 k0!2102))))

(declare-fun b!719695 () Bool)

(declare-fun res!481938 () Bool)

(assert (=> b!719695 (=> (not res!481938) (not e!403904))))

(declare-fun arrayContainsKey!0 (array!40744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719695 (= res!481938 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719696 () Bool)

(declare-fun res!481943 () Bool)

(assert (=> b!719696 (=> (not res!481943) (not e!403904))))

(assert (=> b!719696 (= res!481943 (validKeyInArray!0 (select (arr!19495 a!3186) j!159)))))

(declare-fun b!719697 () Bool)

(declare-fun res!481942 () Bool)

(declare-fun e!403903 () Bool)

(assert (=> b!719697 (=> (not res!481942) (not e!403903))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719697 (= res!481942 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19915 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19915 a!3186))))))

(declare-fun b!719698 () Bool)

(declare-fun res!481937 () Bool)

(assert (=> b!719698 (=> (not res!481937) (not e!403903))))

(declare-datatypes ((List!13404 0))(
  ( (Nil!13401) (Cons!13400 (h!14451 (_ BitVec 64)) (t!19711 List!13404)) )
))
(declare-fun arrayNoDuplicates!0 (array!40744 (_ BitVec 32) List!13404) Bool)

(assert (=> b!719698 (= res!481937 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13401))))

(declare-fun b!719699 () Bool)

(assert (=> b!719699 (= e!403903 false)))

(declare-datatypes ((SeekEntryResult!7051 0))(
  ( (MissingZero!7051 (index!30572 (_ BitVec 32))) (Found!7051 (index!30573 (_ BitVec 32))) (Intermediate!7051 (undefined!7863 Bool) (index!30574 (_ BitVec 32)) (x!61733 (_ BitVec 32))) (Undefined!7051) (MissingVacant!7051 (index!30575 (_ BitVec 32))) )
))
(declare-fun lt!319715 () SeekEntryResult!7051)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40744 (_ BitVec 32)) SeekEntryResult!7051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719699 (= lt!319715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19495 a!3186) j!159) mask!3328) (select (arr!19495 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719700 () Bool)

(assert (=> b!719700 (= e!403904 e!403903)))

(declare-fun res!481945 () Bool)

(assert (=> b!719700 (=> (not res!481945) (not e!403903))))

(declare-fun lt!319716 () SeekEntryResult!7051)

(assert (=> b!719700 (= res!481945 (or (= lt!319716 (MissingZero!7051 i!1173)) (= lt!319716 (MissingVacant!7051 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40744 (_ BitVec 32)) SeekEntryResult!7051)

(assert (=> b!719700 (= lt!319716 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719701 () Bool)

(declare-fun res!481944 () Bool)

(assert (=> b!719701 (=> (not res!481944) (not e!403903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40744 (_ BitVec 32)) Bool)

(assert (=> b!719701 (= res!481944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64116 res!481940) b!719693))

(assert (= (and b!719693 res!481941) b!719696))

(assert (= (and b!719696 res!481943) b!719694))

(assert (= (and b!719694 res!481939) b!719695))

(assert (= (and b!719695 res!481938) b!719700))

(assert (= (and b!719700 res!481945) b!719701))

(assert (= (and b!719701 res!481944) b!719698))

(assert (= (and b!719698 res!481937) b!719697))

(assert (= (and b!719697 res!481942) b!719699))

(declare-fun m!675633 () Bool)

(assert (=> b!719695 m!675633))

(declare-fun m!675635 () Bool)

(assert (=> b!719694 m!675635))

(declare-fun m!675637 () Bool)

(assert (=> b!719699 m!675637))

(assert (=> b!719699 m!675637))

(declare-fun m!675639 () Bool)

(assert (=> b!719699 m!675639))

(assert (=> b!719699 m!675639))

(assert (=> b!719699 m!675637))

(declare-fun m!675641 () Bool)

(assert (=> b!719699 m!675641))

(declare-fun m!675643 () Bool)

(assert (=> start!64116 m!675643))

(declare-fun m!675645 () Bool)

(assert (=> start!64116 m!675645))

(assert (=> b!719696 m!675637))

(assert (=> b!719696 m!675637))

(declare-fun m!675647 () Bool)

(assert (=> b!719696 m!675647))

(declare-fun m!675649 () Bool)

(assert (=> b!719700 m!675649))

(declare-fun m!675651 () Bool)

(assert (=> b!719698 m!675651))

(declare-fun m!675653 () Bool)

(assert (=> b!719701 m!675653))

(check-sat (not b!719695) (not b!719699) (not b!719696) (not b!719698) (not b!719694) (not b!719701) (not start!64116) (not b!719700))
(check-sat)
