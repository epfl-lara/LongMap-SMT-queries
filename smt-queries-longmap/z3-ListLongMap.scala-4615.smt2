; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64304 () Bool)

(assert start!64304)

(declare-fun b!722563 () Bool)

(declare-fun e!404910 () Bool)

(declare-fun e!404909 () Bool)

(assert (=> b!722563 (= e!404910 e!404909)))

(declare-fun res!484367 () Bool)

(assert (=> b!722563 (=> (not res!484367) (not e!404909))))

(declare-datatypes ((SeekEntryResult!7171 0))(
  ( (MissingZero!7171 (index!31052 (_ BitVec 32))) (Found!7171 (index!31053 (_ BitVec 32))) (Intermediate!7171 (undefined!7983 Bool) (index!31054 (_ BitVec 32)) (x!62063 (_ BitVec 32))) (Undefined!7171) (MissingVacant!7171 (index!31055 (_ BitVec 32))) )
))
(declare-fun lt!320200 () SeekEntryResult!7171)

(declare-datatypes ((array!40902 0))(
  ( (array!40903 (arr!19574 (Array (_ BitVec 32) (_ BitVec 64))) (size!19995 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40902)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40902 (_ BitVec 32)) SeekEntryResult!7171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722563 (= res!484367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19574 a!3186) j!159) mask!3328) (select (arr!19574 a!3186) j!159) a!3186 mask!3328) lt!320200))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722563 (= lt!320200 (Intermediate!7171 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722564 () Bool)

(assert (=> b!722564 (= e!404909 false)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!320204 () array!40902)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320199 () SeekEntryResult!7171)

(declare-fun lt!320202 () (_ BitVec 64))

(assert (=> b!722564 (= lt!320199 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320202 lt!320204 mask!3328))))

(declare-fun lt!320201 () SeekEntryResult!7171)

(assert (=> b!722564 (= lt!320201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320202 mask!3328) lt!320202 lt!320204 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!722564 (= lt!320202 (select (store (arr!19574 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722564 (= lt!320204 (array!40903 (store (arr!19574 a!3186) i!1173 k0!2102) (size!19995 a!3186)))))

(declare-fun b!722565 () Bool)

(declare-fun res!484365 () Bool)

(assert (=> b!722565 (=> (not res!484365) (not e!404909))))

(assert (=> b!722565 (= res!484365 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19574 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722566 () Bool)

(declare-fun e!404907 () Bool)

(assert (=> b!722566 (= e!404907 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19574 a!3186) j!159) a!3186 mask!3328) lt!320200))))

(declare-fun b!722567 () Bool)

(declare-fun res!484361 () Bool)

(assert (=> b!722567 (=> (not res!484361) (not e!404910))))

(assert (=> b!722567 (= res!484361 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19995 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19995 a!3186))))))

(declare-fun b!722568 () Bool)

(declare-fun res!484363 () Bool)

(declare-fun e!404908 () Bool)

(assert (=> b!722568 (=> (not res!484363) (not e!404908))))

(assert (=> b!722568 (= res!484363 (and (= (size!19995 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19995 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19995 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722569 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40902 (_ BitVec 32)) SeekEntryResult!7171)

(assert (=> b!722569 (= e!404907 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19574 a!3186) j!159) a!3186 mask!3328) (Found!7171 j!159)))))

(declare-fun b!722570 () Bool)

(declare-fun res!484371 () Bool)

(assert (=> b!722570 (=> (not res!484371) (not e!404910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40902 (_ BitVec 32)) Bool)

(assert (=> b!722570 (= res!484371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722571 () Bool)

(declare-fun res!484362 () Bool)

(assert (=> b!722571 (=> (not res!484362) (not e!404908))))

(declare-fun arrayContainsKey!0 (array!40902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722571 (= res!484362 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722573 () Bool)

(assert (=> b!722573 (= e!404908 e!404910)))

(declare-fun res!484369 () Bool)

(assert (=> b!722573 (=> (not res!484369) (not e!404910))))

(declare-fun lt!320203 () SeekEntryResult!7171)

(assert (=> b!722573 (= res!484369 (or (= lt!320203 (MissingZero!7171 i!1173)) (= lt!320203 (MissingVacant!7171 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40902 (_ BitVec 32)) SeekEntryResult!7171)

(assert (=> b!722573 (= lt!320203 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722574 () Bool)

(declare-fun res!484364 () Bool)

(assert (=> b!722574 (=> (not res!484364) (not e!404910))))

(declare-datatypes ((List!13615 0))(
  ( (Nil!13612) (Cons!13611 (h!14665 (_ BitVec 64)) (t!19921 List!13615)) )
))
(declare-fun arrayNoDuplicates!0 (array!40902 (_ BitVec 32) List!13615) Bool)

(assert (=> b!722574 (= res!484364 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13612))))

(declare-fun b!722575 () Bool)

(declare-fun res!484360 () Bool)

(assert (=> b!722575 (=> (not res!484360) (not e!404909))))

(assert (=> b!722575 (= res!484360 e!404907)))

(declare-fun c!79473 () Bool)

(assert (=> b!722575 (= c!79473 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722576 () Bool)

(declare-fun res!484368 () Bool)

(assert (=> b!722576 (=> (not res!484368) (not e!404908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722576 (= res!484368 (validKeyInArray!0 (select (arr!19574 a!3186) j!159)))))

(declare-fun res!484366 () Bool)

(assert (=> start!64304 (=> (not res!484366) (not e!404908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64304 (= res!484366 (validMask!0 mask!3328))))

(assert (=> start!64304 e!404908))

(assert (=> start!64304 true))

(declare-fun array_inv!15457 (array!40902) Bool)

(assert (=> start!64304 (array_inv!15457 a!3186)))

(declare-fun b!722572 () Bool)

(declare-fun res!484370 () Bool)

(assert (=> b!722572 (=> (not res!484370) (not e!404908))))

(assert (=> b!722572 (= res!484370 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64304 res!484366) b!722568))

(assert (= (and b!722568 res!484363) b!722576))

(assert (= (and b!722576 res!484368) b!722572))

(assert (= (and b!722572 res!484370) b!722571))

(assert (= (and b!722571 res!484362) b!722573))

(assert (= (and b!722573 res!484369) b!722570))

(assert (= (and b!722570 res!484371) b!722574))

(assert (= (and b!722574 res!484364) b!722567))

(assert (= (and b!722567 res!484361) b!722563))

(assert (= (and b!722563 res!484367) b!722565))

(assert (= (and b!722565 res!484365) b!722575))

(assert (= (and b!722575 c!79473) b!722566))

(assert (= (and b!722575 (not c!79473)) b!722569))

(assert (= (and b!722575 res!484360) b!722564))

(declare-fun m!676547 () Bool)

(assert (=> b!722576 m!676547))

(assert (=> b!722576 m!676547))

(declare-fun m!676549 () Bool)

(assert (=> b!722576 m!676549))

(declare-fun m!676551 () Bool)

(assert (=> b!722571 m!676551))

(assert (=> b!722563 m!676547))

(assert (=> b!722563 m!676547))

(declare-fun m!676553 () Bool)

(assert (=> b!722563 m!676553))

(assert (=> b!722563 m!676553))

(assert (=> b!722563 m!676547))

(declare-fun m!676555 () Bool)

(assert (=> b!722563 m!676555))

(declare-fun m!676557 () Bool)

(assert (=> b!722570 m!676557))

(assert (=> b!722569 m!676547))

(assert (=> b!722569 m!676547))

(declare-fun m!676559 () Bool)

(assert (=> b!722569 m!676559))

(assert (=> b!722566 m!676547))

(assert (=> b!722566 m!676547))

(declare-fun m!676561 () Bool)

(assert (=> b!722566 m!676561))

(declare-fun m!676563 () Bool)

(assert (=> b!722572 m!676563))

(declare-fun m!676565 () Bool)

(assert (=> b!722573 m!676565))

(declare-fun m!676567 () Bool)

(assert (=> start!64304 m!676567))

(declare-fun m!676569 () Bool)

(assert (=> start!64304 m!676569))

(declare-fun m!676571 () Bool)

(assert (=> b!722564 m!676571))

(declare-fun m!676573 () Bool)

(assert (=> b!722564 m!676573))

(declare-fun m!676575 () Bool)

(assert (=> b!722564 m!676575))

(declare-fun m!676577 () Bool)

(assert (=> b!722564 m!676577))

(assert (=> b!722564 m!676571))

(declare-fun m!676579 () Bool)

(assert (=> b!722564 m!676579))

(declare-fun m!676581 () Bool)

(assert (=> b!722574 m!676581))

(declare-fun m!676583 () Bool)

(assert (=> b!722565 m!676583))

(check-sat (not b!722571) (not start!64304) (not b!722572) (not b!722570) (not b!722569) (not b!722563) (not b!722573) (not b!722566) (not b!722576) (not b!722574) (not b!722564))
(check-sat)
