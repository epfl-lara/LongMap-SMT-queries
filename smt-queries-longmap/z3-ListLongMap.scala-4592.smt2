; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64068 () Bool)

(assert start!64068)

(declare-fun b!719563 () Bool)

(declare-fun res!481963 () Bool)

(declare-fun e!403740 () Bool)

(assert (=> b!719563 (=> (not res!481963) (not e!403740))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40763 0))(
  ( (array!40764 (arr!19507 (Array (_ BitVec 32) (_ BitVec 64))) (size!19928 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40763)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719563 (= res!481963 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19928 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19928 a!3186))))))

(declare-fun res!481960 () Bool)

(declare-fun e!403742 () Bool)

(assert (=> start!64068 (=> (not res!481960) (not e!403742))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64068 (= res!481960 (validMask!0 mask!3328))))

(assert (=> start!64068 e!403742))

(assert (=> start!64068 true))

(declare-fun array_inv!15303 (array!40763) Bool)

(assert (=> start!64068 (array_inv!15303 a!3186)))

(declare-fun b!719564 () Bool)

(declare-fun res!481957 () Bool)

(assert (=> b!719564 (=> (not res!481957) (not e!403742))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719564 (= res!481957 (validKeyInArray!0 k0!2102))))

(declare-fun b!719565 () Bool)

(assert (=> b!719565 (= e!403740 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7107 0))(
  ( (MissingZero!7107 (index!30796 (_ BitVec 32))) (Found!7107 (index!30797 (_ BitVec 32))) (Intermediate!7107 (undefined!7919 Bool) (index!30798 (_ BitVec 32)) (x!61802 (_ BitVec 32))) (Undefined!7107) (MissingVacant!7107 (index!30799 (_ BitVec 32))) )
))
(declare-fun lt!319619 () SeekEntryResult!7107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40763 (_ BitVec 32)) SeekEntryResult!7107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719565 (= lt!319619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19507 a!3186) j!159) mask!3328) (select (arr!19507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719566 () Bool)

(declare-fun res!481961 () Bool)

(assert (=> b!719566 (=> (not res!481961) (not e!403740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40763 (_ BitVec 32)) Bool)

(assert (=> b!719566 (= res!481961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719567 () Bool)

(declare-fun res!481956 () Bool)

(assert (=> b!719567 (=> (not res!481956) (not e!403742))))

(declare-fun arrayContainsKey!0 (array!40763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719567 (= res!481956 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719568 () Bool)

(declare-fun res!481959 () Bool)

(assert (=> b!719568 (=> (not res!481959) (not e!403742))))

(assert (=> b!719568 (= res!481959 (validKeyInArray!0 (select (arr!19507 a!3186) j!159)))))

(declare-fun b!719569 () Bool)

(assert (=> b!719569 (= e!403742 e!403740)))

(declare-fun res!481964 () Bool)

(assert (=> b!719569 (=> (not res!481964) (not e!403740))))

(declare-fun lt!319618 () SeekEntryResult!7107)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719569 (= res!481964 (or (= lt!319618 (MissingZero!7107 i!1173)) (= lt!319618 (MissingVacant!7107 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40763 (_ BitVec 32)) SeekEntryResult!7107)

(assert (=> b!719569 (= lt!319618 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719570 () Bool)

(declare-fun res!481962 () Bool)

(assert (=> b!719570 (=> (not res!481962) (not e!403740))))

(declare-datatypes ((List!13509 0))(
  ( (Nil!13506) (Cons!13505 (h!14553 (_ BitVec 64)) (t!19824 List!13509)) )
))
(declare-fun arrayNoDuplicates!0 (array!40763 (_ BitVec 32) List!13509) Bool)

(assert (=> b!719570 (= res!481962 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13506))))

(declare-fun b!719571 () Bool)

(declare-fun res!481958 () Bool)

(assert (=> b!719571 (=> (not res!481958) (not e!403742))))

(assert (=> b!719571 (= res!481958 (and (= (size!19928 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19928 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19928 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64068 res!481960) b!719571))

(assert (= (and b!719571 res!481958) b!719568))

(assert (= (and b!719568 res!481959) b!719564))

(assert (= (and b!719564 res!481957) b!719567))

(assert (= (and b!719567 res!481956) b!719569))

(assert (= (and b!719569 res!481964) b!719566))

(assert (= (and b!719566 res!481961) b!719570))

(assert (= (and b!719570 res!481962) b!719563))

(assert (= (and b!719563 res!481963) b!719565))

(declare-fun m!674945 () Bool)

(assert (=> b!719570 m!674945))

(declare-fun m!674947 () Bool)

(assert (=> b!719564 m!674947))

(declare-fun m!674949 () Bool)

(assert (=> b!719568 m!674949))

(assert (=> b!719568 m!674949))

(declare-fun m!674951 () Bool)

(assert (=> b!719568 m!674951))

(assert (=> b!719565 m!674949))

(assert (=> b!719565 m!674949))

(declare-fun m!674953 () Bool)

(assert (=> b!719565 m!674953))

(assert (=> b!719565 m!674953))

(assert (=> b!719565 m!674949))

(declare-fun m!674955 () Bool)

(assert (=> b!719565 m!674955))

(declare-fun m!674957 () Bool)

(assert (=> b!719569 m!674957))

(declare-fun m!674959 () Bool)

(assert (=> b!719567 m!674959))

(declare-fun m!674961 () Bool)

(assert (=> b!719566 m!674961))

(declare-fun m!674963 () Bool)

(assert (=> start!64068 m!674963))

(declare-fun m!674965 () Bool)

(assert (=> start!64068 m!674965))

(check-sat (not b!719567) (not b!719566) (not b!719564) (not b!719570) (not start!64068) (not b!719569) (not b!719568) (not b!719565))
(check-sat)
