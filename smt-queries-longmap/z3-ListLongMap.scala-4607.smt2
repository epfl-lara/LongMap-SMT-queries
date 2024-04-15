; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64256 () Bool)

(assert start!64256)

(declare-fun b!721564 () Bool)

(declare-fun res!483516 () Bool)

(declare-fun e!404548 () Bool)

(assert (=> b!721564 (=> (not res!483516) (not e!404548))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721564 (= res!483516 (validKeyInArray!0 k0!2102))))

(declare-fun b!721565 () Bool)

(declare-fun res!483509 () Bool)

(declare-fun e!404547 () Bool)

(assert (=> b!721565 (=> (not res!483509) (not e!404547))))

(declare-datatypes ((array!40854 0))(
  ( (array!40855 (arr!19550 (Array (_ BitVec 32) (_ BitVec 64))) (size!19971 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40854)

(declare-datatypes ((List!13591 0))(
  ( (Nil!13588) (Cons!13587 (h!14641 (_ BitVec 64)) (t!19897 List!13591)) )
))
(declare-fun arrayNoDuplicates!0 (array!40854 (_ BitVec 32) List!13591) Bool)

(assert (=> b!721565 (= res!483509 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13588))))

(declare-fun b!721567 () Bool)

(declare-fun res!483507 () Bool)

(assert (=> b!721567 (=> (not res!483507) (not e!404548))))

(declare-fun arrayContainsKey!0 (array!40854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721567 (= res!483507 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721568 () Bool)

(declare-fun e!404549 () Bool)

(assert (=> b!721568 (= e!404547 e!404549)))

(declare-fun res!483510 () Bool)

(assert (=> b!721568 (=> (not res!483510) (not e!404549))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7147 0))(
  ( (MissingZero!7147 (index!30956 (_ BitVec 32))) (Found!7147 (index!30957 (_ BitVec 32))) (Intermediate!7147 (undefined!7959 Bool) (index!30958 (_ BitVec 32)) (x!61975 (_ BitVec 32))) (Undefined!7147) (MissingVacant!7147 (index!30959 (_ BitVec 32))) )
))
(declare-fun lt!319922 () SeekEntryResult!7147)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40854 (_ BitVec 32)) SeekEntryResult!7147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721568 (= res!483510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19550 a!3186) j!159) mask!3328) (select (arr!19550 a!3186) j!159) a!3186 mask!3328) lt!319922))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721568 (= lt!319922 (Intermediate!7147 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721569 () Bool)

(declare-fun res!483512 () Bool)

(assert (=> b!721569 (=> (not res!483512) (not e!404548))))

(assert (=> b!721569 (= res!483512 (validKeyInArray!0 (select (arr!19550 a!3186) j!159)))))

(declare-fun b!721570 () Bool)

(assert (=> b!721570 (= e!404548 e!404547)))

(declare-fun res!483515 () Bool)

(assert (=> b!721570 (=> (not res!483515) (not e!404547))))

(declare-fun lt!319921 () SeekEntryResult!7147)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721570 (= res!483515 (or (= lt!319921 (MissingZero!7147 i!1173)) (= lt!319921 (MissingVacant!7147 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40854 (_ BitVec 32)) SeekEntryResult!7147)

(assert (=> b!721570 (= lt!319921 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721571 () Bool)

(declare-fun res!483508 () Bool)

(assert (=> b!721571 (=> (not res!483508) (not e!404549))))

(declare-fun e!404550 () Bool)

(assert (=> b!721571 (= res!483508 e!404550)))

(declare-fun c!79401 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!721571 (= c!79401 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721572 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40854 (_ BitVec 32)) SeekEntryResult!7147)

(assert (=> b!721572 (= e!404550 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19550 a!3186) j!159) a!3186 mask!3328) (Found!7147 j!159)))))

(declare-fun b!721573 () Bool)

(declare-fun res!483513 () Bool)

(assert (=> b!721573 (=> (not res!483513) (not e!404547))))

(assert (=> b!721573 (= res!483513 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19971 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19971 a!3186))))))

(declare-fun b!721574 () Bool)

(declare-fun res!483511 () Bool)

(assert (=> b!721574 (=> (not res!483511) (not e!404547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40854 (_ BitVec 32)) Bool)

(assert (=> b!721574 (= res!483511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!483514 () Bool)

(assert (=> start!64256 (=> (not res!483514) (not e!404548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64256 (= res!483514 (validMask!0 mask!3328))))

(assert (=> start!64256 e!404548))

(assert (=> start!64256 true))

(declare-fun array_inv!15433 (array!40854) Bool)

(assert (=> start!64256 (array_inv!15433 a!3186)))

(declare-fun b!721566 () Bool)

(declare-fun res!483505 () Bool)

(assert (=> b!721566 (=> (not res!483505) (not e!404548))))

(assert (=> b!721566 (= res!483505 (and (= (size!19971 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19971 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19971 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721575 () Bool)

(assert (=> b!721575 (= e!404550 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19550 a!3186) j!159) a!3186 mask!3328) lt!319922))))

(declare-fun b!721576 () Bool)

(declare-fun res!483506 () Bool)

(assert (=> b!721576 (=> (not res!483506) (not e!404549))))

(assert (=> b!721576 (= res!483506 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19550 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721577 () Bool)

(assert (=> b!721577 (= e!404549 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (= (and start!64256 res!483514) b!721566))

(assert (= (and b!721566 res!483505) b!721569))

(assert (= (and b!721569 res!483512) b!721564))

(assert (= (and b!721564 res!483516) b!721567))

(assert (= (and b!721567 res!483507) b!721570))

(assert (= (and b!721570 res!483515) b!721574))

(assert (= (and b!721574 res!483511) b!721565))

(assert (= (and b!721565 res!483509) b!721573))

(assert (= (and b!721573 res!483513) b!721568))

(assert (= (and b!721568 res!483510) b!721576))

(assert (= (and b!721576 res!483506) b!721571))

(assert (= (and b!721571 c!79401) b!721575))

(assert (= (and b!721571 (not c!79401)) b!721572))

(assert (= (and b!721571 res!483508) b!721577))

(declare-fun m!675767 () Bool)

(assert (=> b!721572 m!675767))

(assert (=> b!721572 m!675767))

(declare-fun m!675769 () Bool)

(assert (=> b!721572 m!675769))

(assert (=> b!721568 m!675767))

(assert (=> b!721568 m!675767))

(declare-fun m!675771 () Bool)

(assert (=> b!721568 m!675771))

(assert (=> b!721568 m!675771))

(assert (=> b!721568 m!675767))

(declare-fun m!675773 () Bool)

(assert (=> b!721568 m!675773))

(declare-fun m!675775 () Bool)

(assert (=> b!721576 m!675775))

(assert (=> b!721575 m!675767))

(assert (=> b!721575 m!675767))

(declare-fun m!675777 () Bool)

(assert (=> b!721575 m!675777))

(declare-fun m!675779 () Bool)

(assert (=> b!721574 m!675779))

(declare-fun m!675781 () Bool)

(assert (=> b!721565 m!675781))

(declare-fun m!675783 () Bool)

(assert (=> b!721567 m!675783))

(declare-fun m!675785 () Bool)

(assert (=> b!721570 m!675785))

(assert (=> b!721569 m!675767))

(assert (=> b!721569 m!675767))

(declare-fun m!675787 () Bool)

(assert (=> b!721569 m!675787))

(declare-fun m!675789 () Bool)

(assert (=> b!721564 m!675789))

(declare-fun m!675791 () Bool)

(assert (=> start!64256 m!675791))

(declare-fun m!675793 () Bool)

(assert (=> start!64256 m!675793))

(check-sat (not start!64256) (not b!721565) (not b!721575) (not b!721567) (not b!721574) (not b!721569) (not b!721570) (not b!721564) (not b!721568) (not b!721572))
(check-sat)
