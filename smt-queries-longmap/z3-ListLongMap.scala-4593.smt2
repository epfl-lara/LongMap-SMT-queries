; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64052 () Bool)

(assert start!64052)

(declare-fun res!481910 () Bool)

(declare-fun e!403605 () Bool)

(assert (=> start!64052 (=> (not res!481910) (not e!403605))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64052 (= res!481910 (validMask!0 mask!3328))))

(assert (=> start!64052 e!403605))

(assert (=> start!64052 true))

(declare-datatypes ((array!40764 0))(
  ( (array!40765 (arr!19508 (Array (_ BitVec 32) (_ BitVec 64))) (size!19929 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40764)

(declare-fun array_inv!15391 (array!40764) Bool)

(assert (=> start!64052 (array_inv!15391 a!3186)))

(declare-fun b!719369 () Bool)

(declare-fun res!481902 () Bool)

(assert (=> b!719369 (=> (not res!481902) (not e!403605))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719369 (= res!481902 (validKeyInArray!0 (select (arr!19508 a!3186) j!159)))))

(declare-fun b!719370 () Bool)

(declare-fun res!481907 () Bool)

(declare-fun e!403604 () Bool)

(assert (=> b!719370 (=> (not res!481907) (not e!403604))))

(declare-datatypes ((List!13549 0))(
  ( (Nil!13546) (Cons!13545 (h!14593 (_ BitVec 64)) (t!19855 List!13549)) )
))
(declare-fun arrayNoDuplicates!0 (array!40764 (_ BitVec 32) List!13549) Bool)

(assert (=> b!719370 (= res!481907 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13546))))

(declare-fun b!719371 () Bool)

(declare-fun res!481905 () Bool)

(assert (=> b!719371 (=> (not res!481905) (not e!403604))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!719371 (= res!481905 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19929 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19929 a!3186))))))

(declare-fun b!719372 () Bool)

(declare-fun res!481903 () Bool)

(assert (=> b!719372 (=> (not res!481903) (not e!403604))))

(declare-datatypes ((SeekEntryResult!7105 0))(
  ( (MissingZero!7105 (index!30788 (_ BitVec 32))) (Found!7105 (index!30789 (_ BitVec 32))) (Intermediate!7105 (undefined!7917 Bool) (index!30790 (_ BitVec 32)) (x!61803 (_ BitVec 32))) (Undefined!7105) (MissingVacant!7105 (index!30791 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40764 (_ BitVec 32)) SeekEntryResult!7105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719372 (= res!481903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19508 a!3186) j!159) mask!3328) (select (arr!19508 a!3186) j!159) a!3186 mask!3328) (Intermediate!7105 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719373 () Bool)

(declare-fun res!481911 () Bool)

(assert (=> b!719373 (=> (not res!481911) (not e!403604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40764 (_ BitVec 32)) Bool)

(assert (=> b!719373 (= res!481911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719374 () Bool)

(assert (=> b!719374 (= e!403605 e!403604)))

(declare-fun res!481904 () Bool)

(assert (=> b!719374 (=> (not res!481904) (not e!403604))))

(declare-fun lt!319388 () SeekEntryResult!7105)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719374 (= res!481904 (or (= lt!319388 (MissingZero!7105 i!1173)) (= lt!319388 (MissingVacant!7105 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40764 (_ BitVec 32)) SeekEntryResult!7105)

(assert (=> b!719374 (= lt!319388 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719375 () Bool)

(declare-fun res!481906 () Bool)

(assert (=> b!719375 (=> (not res!481906) (not e!403605))))

(declare-fun arrayContainsKey!0 (array!40764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719375 (= res!481906 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719376 () Bool)

(declare-fun res!481908 () Bool)

(assert (=> b!719376 (=> (not res!481908) (not e!403605))))

(assert (=> b!719376 (= res!481908 (validKeyInArray!0 k0!2102))))

(declare-fun b!719377 () Bool)

(declare-fun res!481909 () Bool)

(assert (=> b!719377 (=> (not res!481909) (not e!403605))))

(assert (=> b!719377 (= res!481909 (and (= (size!19929 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19929 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19929 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719378 () Bool)

(assert (=> b!719378 (= e!403604 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19508 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (= (and start!64052 res!481910) b!719377))

(assert (= (and b!719377 res!481909) b!719369))

(assert (= (and b!719369 res!481902) b!719376))

(assert (= (and b!719376 res!481908) b!719375))

(assert (= (and b!719375 res!481906) b!719374))

(assert (= (and b!719374 res!481904) b!719373))

(assert (= (and b!719373 res!481911) b!719370))

(assert (= (and b!719370 res!481907) b!719371))

(assert (= (and b!719371 res!481905) b!719372))

(assert (= (and b!719372 res!481903) b!719378))

(declare-fun m!674231 () Bool)

(assert (=> b!719374 m!674231))

(declare-fun m!674233 () Bool)

(assert (=> b!719372 m!674233))

(assert (=> b!719372 m!674233))

(declare-fun m!674235 () Bool)

(assert (=> b!719372 m!674235))

(assert (=> b!719372 m!674235))

(assert (=> b!719372 m!674233))

(declare-fun m!674237 () Bool)

(assert (=> b!719372 m!674237))

(declare-fun m!674239 () Bool)

(assert (=> b!719376 m!674239))

(declare-fun m!674241 () Bool)

(assert (=> start!64052 m!674241))

(declare-fun m!674243 () Bool)

(assert (=> start!64052 m!674243))

(declare-fun m!674245 () Bool)

(assert (=> b!719375 m!674245))

(declare-fun m!674247 () Bool)

(assert (=> b!719373 m!674247))

(assert (=> b!719369 m!674233))

(assert (=> b!719369 m!674233))

(declare-fun m!674249 () Bool)

(assert (=> b!719369 m!674249))

(declare-fun m!674251 () Bool)

(assert (=> b!719378 m!674251))

(declare-fun m!674253 () Bool)

(assert (=> b!719370 m!674253))

(check-sat (not b!719376) (not b!719375) (not b!719370) (not start!64052) (not b!719374) (not b!719372) (not b!719369) (not b!719373))
(check-sat)
