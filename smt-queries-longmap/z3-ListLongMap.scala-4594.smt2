; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64080 () Bool)

(assert start!64080)

(declare-fun b!719734 () Bool)

(declare-fun res!482133 () Bool)

(declare-fun e!403794 () Bool)

(assert (=> b!719734 (=> (not res!482133) (not e!403794))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40775 0))(
  ( (array!40776 (arr!19513 (Array (_ BitVec 32) (_ BitVec 64))) (size!19934 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40775)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719734 (= res!482133 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19934 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19934 a!3186))))))

(declare-fun b!719735 () Bool)

(declare-fun res!482134 () Bool)

(assert (=> b!719735 (=> (not res!482134) (not e!403794))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40775 (_ BitVec 32)) Bool)

(assert (=> b!719735 (= res!482134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719736 () Bool)

(declare-fun res!482129 () Bool)

(declare-fun e!403795 () Bool)

(assert (=> b!719736 (=> (not res!482129) (not e!403795))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719736 (= res!482129 (validKeyInArray!0 (select (arr!19513 a!3186) j!159)))))

(declare-fun b!719737 () Bool)

(assert (=> b!719737 (= e!403794 false)))

(declare-datatypes ((SeekEntryResult!7113 0))(
  ( (MissingZero!7113 (index!30820 (_ BitVec 32))) (Found!7113 (index!30821 (_ BitVec 32))) (Intermediate!7113 (undefined!7925 Bool) (index!30822 (_ BitVec 32)) (x!61824 (_ BitVec 32))) (Undefined!7113) (MissingVacant!7113 (index!30823 (_ BitVec 32))) )
))
(declare-fun lt!319645 () SeekEntryResult!7113)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40775 (_ BitVec 32)) SeekEntryResult!7113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719737 (= lt!319645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19513 a!3186) j!159) mask!3328) (select (arr!19513 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719738 () Bool)

(declare-fun res!482130 () Bool)

(assert (=> b!719738 (=> (not res!482130) (not e!403794))))

(declare-datatypes ((List!13515 0))(
  ( (Nil!13512) (Cons!13511 (h!14559 (_ BitVec 64)) (t!19830 List!13515)) )
))
(declare-fun arrayNoDuplicates!0 (array!40775 (_ BitVec 32) List!13515) Bool)

(assert (=> b!719738 (= res!482130 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13512))))

(declare-fun b!719740 () Bool)

(declare-fun res!482131 () Bool)

(assert (=> b!719740 (=> (not res!482131) (not e!403795))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719740 (= res!482131 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719741 () Bool)

(declare-fun res!482135 () Bool)

(assert (=> b!719741 (=> (not res!482135) (not e!403795))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719741 (= res!482135 (and (= (size!19934 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19934 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19934 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719742 () Bool)

(declare-fun res!482132 () Bool)

(assert (=> b!719742 (=> (not res!482132) (not e!403795))))

(assert (=> b!719742 (= res!482132 (validKeyInArray!0 k0!2102))))

(declare-fun b!719739 () Bool)

(assert (=> b!719739 (= e!403795 e!403794)))

(declare-fun res!482127 () Bool)

(assert (=> b!719739 (=> (not res!482127) (not e!403794))))

(declare-fun lt!319646 () SeekEntryResult!7113)

(assert (=> b!719739 (= res!482127 (or (= lt!319646 (MissingZero!7113 i!1173)) (= lt!319646 (MissingVacant!7113 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40775 (_ BitVec 32)) SeekEntryResult!7113)

(assert (=> b!719739 (= lt!319646 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!482128 () Bool)

(assert (=> start!64080 (=> (not res!482128) (not e!403795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64080 (= res!482128 (validMask!0 mask!3328))))

(assert (=> start!64080 e!403795))

(assert (=> start!64080 true))

(declare-fun array_inv!15309 (array!40775) Bool)

(assert (=> start!64080 (array_inv!15309 a!3186)))

(assert (= (and start!64080 res!482128) b!719741))

(assert (= (and b!719741 res!482135) b!719736))

(assert (= (and b!719736 res!482129) b!719742))

(assert (= (and b!719742 res!482132) b!719740))

(assert (= (and b!719740 res!482131) b!719739))

(assert (= (and b!719739 res!482127) b!719735))

(assert (= (and b!719735 res!482134) b!719738))

(assert (= (and b!719738 res!482130) b!719734))

(assert (= (and b!719734 res!482133) b!719737))

(declare-fun m!675083 () Bool)

(assert (=> b!719740 m!675083))

(declare-fun m!675085 () Bool)

(assert (=> b!719736 m!675085))

(assert (=> b!719736 m!675085))

(declare-fun m!675087 () Bool)

(assert (=> b!719736 m!675087))

(declare-fun m!675089 () Bool)

(assert (=> b!719742 m!675089))

(declare-fun m!675091 () Bool)

(assert (=> b!719739 m!675091))

(assert (=> b!719737 m!675085))

(assert (=> b!719737 m!675085))

(declare-fun m!675093 () Bool)

(assert (=> b!719737 m!675093))

(assert (=> b!719737 m!675093))

(assert (=> b!719737 m!675085))

(declare-fun m!675095 () Bool)

(assert (=> b!719737 m!675095))

(declare-fun m!675097 () Bool)

(assert (=> start!64080 m!675097))

(declare-fun m!675099 () Bool)

(assert (=> start!64080 m!675099))

(declare-fun m!675101 () Bool)

(assert (=> b!719738 m!675101))

(declare-fun m!675103 () Bool)

(assert (=> b!719735 m!675103))

(check-sat (not start!64080) (not b!719735) (not b!719742) (not b!719737) (not b!719740) (not b!719739) (not b!719736) (not b!719738))
(check-sat)
