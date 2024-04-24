; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64134 () Bool)

(assert start!64134)

(declare-fun b!719947 () Bool)

(declare-fun e!403985 () Bool)

(declare-fun e!403986 () Bool)

(assert (=> b!719947 (= e!403985 e!403986)))

(declare-fun res!482196 () Bool)

(assert (=> b!719947 (=> (not res!482196) (not e!403986))))

(declare-datatypes ((SeekEntryResult!7060 0))(
  ( (MissingZero!7060 (index!30608 (_ BitVec 32))) (Found!7060 (index!30609 (_ BitVec 32))) (Intermediate!7060 (undefined!7872 Bool) (index!30610 (_ BitVec 32)) (x!61766 (_ BitVec 32))) (Undefined!7060) (MissingVacant!7060 (index!30611 (_ BitVec 32))) )
))
(declare-fun lt!319758 () SeekEntryResult!7060)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719947 (= res!482196 (or (= lt!319758 (MissingZero!7060 i!1173)) (= lt!319758 (MissingVacant!7060 i!1173))))))

(declare-datatypes ((array!40762 0))(
  ( (array!40763 (arr!19504 (Array (_ BitVec 32) (_ BitVec 64))) (size!19924 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40762)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40762 (_ BitVec 32)) SeekEntryResult!7060)

(assert (=> b!719947 (= lt!319758 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719948 () Bool)

(declare-fun res!482195 () Bool)

(assert (=> b!719948 (=> (not res!482195) (not e!403986))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719948 (= res!482195 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19924 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19924 a!3186))))))

(declare-fun b!719949 () Bool)

(declare-fun res!482197 () Bool)

(assert (=> b!719949 (=> (not res!482197) (not e!403985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719949 (= res!482197 (validKeyInArray!0 k0!2102))))

(declare-fun b!719950 () Bool)

(assert (=> b!719950 (= e!403986 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19504 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719951 () Bool)

(declare-fun res!482191 () Bool)

(assert (=> b!719951 (=> (not res!482191) (not e!403985))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719951 (= res!482191 (and (= (size!19924 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19924 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19924 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719952 () Bool)

(declare-fun res!482198 () Bool)

(assert (=> b!719952 (=> (not res!482198) (not e!403986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40762 (_ BitVec 32)) Bool)

(assert (=> b!719952 (= res!482198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719954 () Bool)

(declare-fun res!482199 () Bool)

(assert (=> b!719954 (=> (not res!482199) (not e!403986))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40762 (_ BitVec 32)) SeekEntryResult!7060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719954 (= res!482199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19504 a!3186) j!159) mask!3328) (select (arr!19504 a!3186) j!159) a!3186 mask!3328) (Intermediate!7060 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719953 () Bool)

(declare-fun res!482194 () Bool)

(assert (=> b!719953 (=> (not res!482194) (not e!403986))))

(declare-datatypes ((List!13413 0))(
  ( (Nil!13410) (Cons!13409 (h!14460 (_ BitVec 64)) (t!19720 List!13413)) )
))
(declare-fun arrayNoDuplicates!0 (array!40762 (_ BitVec 32) List!13413) Bool)

(assert (=> b!719953 (= res!482194 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13410))))

(declare-fun res!482193 () Bool)

(assert (=> start!64134 (=> (not res!482193) (not e!403985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64134 (= res!482193 (validMask!0 mask!3328))))

(assert (=> start!64134 e!403985))

(assert (=> start!64134 true))

(declare-fun array_inv!15363 (array!40762) Bool)

(assert (=> start!64134 (array_inv!15363 a!3186)))

(declare-fun b!719955 () Bool)

(declare-fun res!482192 () Bool)

(assert (=> b!719955 (=> (not res!482192) (not e!403985))))

(declare-fun arrayContainsKey!0 (array!40762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719955 (= res!482192 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719956 () Bool)

(declare-fun res!482200 () Bool)

(assert (=> b!719956 (=> (not res!482200) (not e!403985))))

(assert (=> b!719956 (= res!482200 (validKeyInArray!0 (select (arr!19504 a!3186) j!159)))))

(assert (= (and start!64134 res!482193) b!719951))

(assert (= (and b!719951 res!482191) b!719956))

(assert (= (and b!719956 res!482200) b!719949))

(assert (= (and b!719949 res!482197) b!719955))

(assert (= (and b!719955 res!482192) b!719947))

(assert (= (and b!719947 res!482196) b!719952))

(assert (= (and b!719952 res!482198) b!719953))

(assert (= (and b!719953 res!482194) b!719948))

(assert (= (and b!719948 res!482195) b!719954))

(assert (= (and b!719954 res!482199) b!719950))

(declare-fun m!675837 () Bool)

(assert (=> b!719954 m!675837))

(assert (=> b!719954 m!675837))

(declare-fun m!675839 () Bool)

(assert (=> b!719954 m!675839))

(assert (=> b!719954 m!675839))

(assert (=> b!719954 m!675837))

(declare-fun m!675841 () Bool)

(assert (=> b!719954 m!675841))

(declare-fun m!675843 () Bool)

(assert (=> b!719952 m!675843))

(declare-fun m!675845 () Bool)

(assert (=> b!719955 m!675845))

(declare-fun m!675847 () Bool)

(assert (=> b!719947 m!675847))

(assert (=> b!719956 m!675837))

(assert (=> b!719956 m!675837))

(declare-fun m!675849 () Bool)

(assert (=> b!719956 m!675849))

(declare-fun m!675851 () Bool)

(assert (=> b!719953 m!675851))

(declare-fun m!675853 () Bool)

(assert (=> b!719950 m!675853))

(declare-fun m!675855 () Bool)

(assert (=> b!719949 m!675855))

(declare-fun m!675857 () Bool)

(assert (=> start!64134 m!675857))

(declare-fun m!675859 () Bool)

(assert (=> start!64134 m!675859))

(check-sat (not b!719947) (not b!719952) (not start!64134) (not b!719953) (not b!719949) (not b!719956) (not b!719954) (not b!719955))
(check-sat)
