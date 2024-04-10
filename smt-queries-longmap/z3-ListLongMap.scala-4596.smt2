; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64092 () Bool)

(assert start!64092)

(declare-fun b!719905 () Bool)

(declare-fun res!482301 () Bool)

(declare-fun e!403850 () Bool)

(assert (=> b!719905 (=> (not res!482301) (not e!403850))))

(declare-datatypes ((array!40787 0))(
  ( (array!40788 (arr!19519 (Array (_ BitVec 32) (_ BitVec 64))) (size!19940 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40787)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719905 (= res!482301 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719907 () Bool)

(declare-fun res!482303 () Bool)

(declare-fun e!403849 () Bool)

(assert (=> b!719907 (=> (not res!482303) (not e!403849))))

(declare-datatypes ((List!13521 0))(
  ( (Nil!13518) (Cons!13517 (h!14565 (_ BitVec 64)) (t!19836 List!13521)) )
))
(declare-fun arrayNoDuplicates!0 (array!40787 (_ BitVec 32) List!13521) Bool)

(assert (=> b!719907 (= res!482303 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13518))))

(declare-fun b!719908 () Bool)

(declare-fun res!482302 () Bool)

(assert (=> b!719908 (=> (not res!482302) (not e!403850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719908 (= res!482302 (validKeyInArray!0 k0!2102))))

(declare-fun b!719909 () Bool)

(assert (=> b!719909 (= e!403849 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7119 0))(
  ( (MissingZero!7119 (index!30844 (_ BitVec 32))) (Found!7119 (index!30845 (_ BitVec 32))) (Intermediate!7119 (undefined!7931 Bool) (index!30846 (_ BitVec 32)) (x!61846 (_ BitVec 32))) (Undefined!7119) (MissingVacant!7119 (index!30847 (_ BitVec 32))) )
))
(declare-fun lt!319673 () SeekEntryResult!7119)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40787 (_ BitVec 32)) SeekEntryResult!7119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719909 (= lt!319673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19519 a!3186) j!159) mask!3328) (select (arr!19519 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719910 () Bool)

(declare-fun res!482298 () Bool)

(assert (=> b!719910 (=> (not res!482298) (not e!403850))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719910 (= res!482298 (and (= (size!19940 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19940 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19940 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719911 () Bool)

(declare-fun res!482306 () Bool)

(assert (=> b!719911 (=> (not res!482306) (not e!403849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40787 (_ BitVec 32)) Bool)

(assert (=> b!719911 (= res!482306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719912 () Bool)

(declare-fun res!482304 () Bool)

(assert (=> b!719912 (=> (not res!482304) (not e!403850))))

(assert (=> b!719912 (= res!482304 (validKeyInArray!0 (select (arr!19519 a!3186) j!159)))))

(declare-fun b!719913 () Bool)

(declare-fun res!482299 () Bool)

(assert (=> b!719913 (=> (not res!482299) (not e!403849))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719913 (= res!482299 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19940 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19940 a!3186))))))

(declare-fun b!719906 () Bool)

(assert (=> b!719906 (= e!403850 e!403849)))

(declare-fun res!482300 () Bool)

(assert (=> b!719906 (=> (not res!482300) (not e!403849))))

(declare-fun lt!319672 () SeekEntryResult!7119)

(assert (=> b!719906 (= res!482300 (or (= lt!319672 (MissingZero!7119 i!1173)) (= lt!319672 (MissingVacant!7119 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40787 (_ BitVec 32)) SeekEntryResult!7119)

(assert (=> b!719906 (= lt!319672 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!482305 () Bool)

(assert (=> start!64092 (=> (not res!482305) (not e!403850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64092 (= res!482305 (validMask!0 mask!3328))))

(assert (=> start!64092 e!403850))

(assert (=> start!64092 true))

(declare-fun array_inv!15315 (array!40787) Bool)

(assert (=> start!64092 (array_inv!15315 a!3186)))

(assert (= (and start!64092 res!482305) b!719910))

(assert (= (and b!719910 res!482298) b!719912))

(assert (= (and b!719912 res!482304) b!719908))

(assert (= (and b!719908 res!482302) b!719905))

(assert (= (and b!719905 res!482301) b!719906))

(assert (= (and b!719906 res!482300) b!719911))

(assert (= (and b!719911 res!482306) b!719907))

(assert (= (and b!719907 res!482303) b!719913))

(assert (= (and b!719913 res!482299) b!719909))

(declare-fun m!675221 () Bool)

(assert (=> start!64092 m!675221))

(declare-fun m!675223 () Bool)

(assert (=> start!64092 m!675223))

(declare-fun m!675225 () Bool)

(assert (=> b!719907 m!675225))

(declare-fun m!675227 () Bool)

(assert (=> b!719911 m!675227))

(declare-fun m!675229 () Bool)

(assert (=> b!719908 m!675229))

(declare-fun m!675231 () Bool)

(assert (=> b!719912 m!675231))

(assert (=> b!719912 m!675231))

(declare-fun m!675233 () Bool)

(assert (=> b!719912 m!675233))

(declare-fun m!675235 () Bool)

(assert (=> b!719906 m!675235))

(assert (=> b!719909 m!675231))

(assert (=> b!719909 m!675231))

(declare-fun m!675237 () Bool)

(assert (=> b!719909 m!675237))

(assert (=> b!719909 m!675237))

(assert (=> b!719909 m!675231))

(declare-fun m!675239 () Bool)

(assert (=> b!719909 m!675239))

(declare-fun m!675241 () Bool)

(assert (=> b!719905 m!675241))

(check-sat (not b!719908) (not b!719912) (not b!719906) (not b!719907) (not b!719905) (not b!719911) (not b!719909) (not start!64092))
(check-sat)
