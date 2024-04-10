; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64086 () Bool)

(assert start!64086)

(declare-fun b!719820 () Bool)

(declare-fun res!482216 () Bool)

(declare-fun e!403822 () Bool)

(assert (=> b!719820 (=> (not res!482216) (not e!403822))))

(declare-datatypes ((array!40781 0))(
  ( (array!40782 (arr!19516 (Array (_ BitVec 32) (_ BitVec 64))) (size!19937 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40781)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719820 (= res!482216 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719821 () Bool)

(declare-fun e!403823 () Bool)

(assert (=> b!719821 (= e!403822 e!403823)))

(declare-fun res!482219 () Bool)

(assert (=> b!719821 (=> (not res!482219) (not e!403823))))

(declare-datatypes ((SeekEntryResult!7116 0))(
  ( (MissingZero!7116 (index!30832 (_ BitVec 32))) (Found!7116 (index!30833 (_ BitVec 32))) (Intermediate!7116 (undefined!7928 Bool) (index!30834 (_ BitVec 32)) (x!61835 (_ BitVec 32))) (Undefined!7116) (MissingVacant!7116 (index!30835 (_ BitVec 32))) )
))
(declare-fun lt!319658 () SeekEntryResult!7116)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719821 (= res!482219 (or (= lt!319658 (MissingZero!7116 i!1173)) (= lt!319658 (MissingVacant!7116 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40781 (_ BitVec 32)) SeekEntryResult!7116)

(assert (=> b!719821 (= lt!319658 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719822 () Bool)

(declare-fun res!482220 () Bool)

(assert (=> b!719822 (=> (not res!482220) (not e!403823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40781 (_ BitVec 32)) Bool)

(assert (=> b!719822 (= res!482220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!719823 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719823 (= e!403823 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19516 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719824 () Bool)

(declare-fun res!482214 () Bool)

(assert (=> b!719824 (=> (not res!482214) (not e!403822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719824 (= res!482214 (validKeyInArray!0 k0!2102))))

(declare-fun b!719825 () Bool)

(declare-fun res!482217 () Bool)

(assert (=> b!719825 (=> (not res!482217) (not e!403823))))

(declare-datatypes ((List!13518 0))(
  ( (Nil!13515) (Cons!13514 (h!14562 (_ BitVec 64)) (t!19833 List!13518)) )
))
(declare-fun arrayNoDuplicates!0 (array!40781 (_ BitVec 32) List!13518) Bool)

(assert (=> b!719825 (= res!482217 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13515))))

(declare-fun res!482221 () Bool)

(assert (=> start!64086 (=> (not res!482221) (not e!403822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64086 (= res!482221 (validMask!0 mask!3328))))

(assert (=> start!64086 e!403822))

(assert (=> start!64086 true))

(declare-fun array_inv!15312 (array!40781) Bool)

(assert (=> start!64086 (array_inv!15312 a!3186)))

(declare-fun b!719826 () Bool)

(declare-fun res!482218 () Bool)

(assert (=> b!719826 (=> (not res!482218) (not e!403822))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719826 (= res!482218 (validKeyInArray!0 (select (arr!19516 a!3186) j!159)))))

(declare-fun b!719827 () Bool)

(declare-fun res!482222 () Bool)

(assert (=> b!719827 (=> (not res!482222) (not e!403823))))

(assert (=> b!719827 (= res!482222 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19937 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19937 a!3186))))))

(declare-fun b!719828 () Bool)

(declare-fun res!482213 () Bool)

(assert (=> b!719828 (=> (not res!482213) (not e!403823))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40781 (_ BitVec 32)) SeekEntryResult!7116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719828 (= res!482213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19516 a!3186) j!159) mask!3328) (select (arr!19516 a!3186) j!159) a!3186 mask!3328) (Intermediate!7116 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719829 () Bool)

(declare-fun res!482215 () Bool)

(assert (=> b!719829 (=> (not res!482215) (not e!403822))))

(assert (=> b!719829 (= res!482215 (and (= (size!19937 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19937 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19937 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64086 res!482221) b!719829))

(assert (= (and b!719829 res!482215) b!719826))

(assert (= (and b!719826 res!482218) b!719824))

(assert (= (and b!719824 res!482214) b!719820))

(assert (= (and b!719820 res!482216) b!719821))

(assert (= (and b!719821 res!482219) b!719822))

(assert (= (and b!719822 res!482220) b!719825))

(assert (= (and b!719825 res!482217) b!719827))

(assert (= (and b!719827 res!482222) b!719828))

(assert (= (and b!719828 res!482213) b!719823))

(declare-fun m!675151 () Bool)

(assert (=> b!719825 m!675151))

(declare-fun m!675153 () Bool)

(assert (=> b!719822 m!675153))

(declare-fun m!675155 () Bool)

(assert (=> b!719826 m!675155))

(assert (=> b!719826 m!675155))

(declare-fun m!675157 () Bool)

(assert (=> b!719826 m!675157))

(declare-fun m!675159 () Bool)

(assert (=> b!719823 m!675159))

(declare-fun m!675161 () Bool)

(assert (=> b!719824 m!675161))

(declare-fun m!675163 () Bool)

(assert (=> start!64086 m!675163))

(declare-fun m!675165 () Bool)

(assert (=> start!64086 m!675165))

(assert (=> b!719828 m!675155))

(assert (=> b!719828 m!675155))

(declare-fun m!675167 () Bool)

(assert (=> b!719828 m!675167))

(assert (=> b!719828 m!675167))

(assert (=> b!719828 m!675155))

(declare-fun m!675169 () Bool)

(assert (=> b!719828 m!675169))

(declare-fun m!675171 () Bool)

(assert (=> b!719820 m!675171))

(declare-fun m!675173 () Bool)

(assert (=> b!719821 m!675173))

(check-sat (not b!719824) (not b!719828) (not start!64086) (not b!719822) (not b!719825) (not b!719821) (not b!719826) (not b!719820))
(check-sat)
