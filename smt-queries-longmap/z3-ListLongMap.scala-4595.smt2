; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64064 () Bool)

(assert start!64064)

(declare-fun b!719540 () Bool)

(declare-fun res!482076 () Bool)

(declare-fun e!403660 () Bool)

(assert (=> b!719540 (=> (not res!482076) (not e!403660))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40776 0))(
  ( (array!40777 (arr!19514 (Array (_ BitVec 32) (_ BitVec 64))) (size!19935 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40776)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7111 0))(
  ( (MissingZero!7111 (index!30812 (_ BitVec 32))) (Found!7111 (index!30813 (_ BitVec 32))) (Intermediate!7111 (undefined!7923 Bool) (index!30814 (_ BitVec 32)) (x!61825 (_ BitVec 32))) (Undefined!7111) (MissingVacant!7111 (index!30815 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40776 (_ BitVec 32)) SeekEntryResult!7111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719540 (= res!482076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19514 a!3186) j!159) mask!3328) (select (arr!19514 a!3186) j!159) a!3186 mask!3328) (Intermediate!7111 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719541 () Bool)

(declare-fun e!403658 () Bool)

(assert (=> b!719541 (= e!403658 e!403660)))

(declare-fun res!482075 () Bool)

(assert (=> b!719541 (=> (not res!482075) (not e!403660))))

(declare-fun lt!319415 () SeekEntryResult!7111)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719541 (= res!482075 (or (= lt!319415 (MissingZero!7111 i!1173)) (= lt!319415 (MissingVacant!7111 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40776 (_ BitVec 32)) SeekEntryResult!7111)

(assert (=> b!719541 (= lt!319415 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719542 () Bool)

(declare-fun res!482078 () Bool)

(assert (=> b!719542 (=> (not res!482078) (not e!403658))))

(declare-fun arrayContainsKey!0 (array!40776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719542 (= res!482078 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719543 () Bool)

(declare-fun res!482079 () Bool)

(assert (=> b!719543 (=> (not res!482079) (not e!403658))))

(assert (=> b!719543 (= res!482079 (and (= (size!19935 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19935 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19935 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!482081 () Bool)

(assert (=> start!64064 (=> (not res!482081) (not e!403658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64064 (= res!482081 (validMask!0 mask!3328))))

(assert (=> start!64064 e!403658))

(assert (=> start!64064 true))

(declare-fun array_inv!15397 (array!40776) Bool)

(assert (=> start!64064 (array_inv!15397 a!3186)))

(declare-fun b!719544 () Bool)

(declare-fun res!482077 () Bool)

(assert (=> b!719544 (=> (not res!482077) (not e!403660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40776 (_ BitVec 32)) Bool)

(assert (=> b!719544 (= res!482077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719545 () Bool)

(declare-fun res!482074 () Bool)

(assert (=> b!719545 (=> (not res!482074) (not e!403660))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719545 (= res!482074 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19935 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19935 a!3186))))))

(declare-fun b!719546 () Bool)

(declare-fun res!482082 () Bool)

(assert (=> b!719546 (=> (not res!482082) (not e!403660))))

(declare-datatypes ((List!13555 0))(
  ( (Nil!13552) (Cons!13551 (h!14599 (_ BitVec 64)) (t!19861 List!13555)) )
))
(declare-fun arrayNoDuplicates!0 (array!40776 (_ BitVec 32) List!13555) Bool)

(assert (=> b!719546 (= res!482082 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13552))))

(declare-fun b!719547 () Bool)

(declare-fun res!482073 () Bool)

(assert (=> b!719547 (=> (not res!482073) (not e!403658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719547 (= res!482073 (validKeyInArray!0 (select (arr!19514 a!3186) j!159)))))

(declare-fun b!719548 () Bool)

(assert (=> b!719548 (= e!403660 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19514 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719549 () Bool)

(declare-fun res!482080 () Bool)

(assert (=> b!719549 (=> (not res!482080) (not e!403658))))

(assert (=> b!719549 (= res!482080 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64064 res!482081) b!719543))

(assert (= (and b!719543 res!482079) b!719547))

(assert (= (and b!719547 res!482073) b!719549))

(assert (= (and b!719549 res!482080) b!719542))

(assert (= (and b!719542 res!482078) b!719541))

(assert (= (and b!719541 res!482075) b!719544))

(assert (= (and b!719544 res!482077) b!719546))

(assert (= (and b!719546 res!482082) b!719545))

(assert (= (and b!719545 res!482074) b!719540))

(assert (= (and b!719540 res!482076) b!719548))

(declare-fun m!674369 () Bool)

(assert (=> b!719540 m!674369))

(assert (=> b!719540 m!674369))

(declare-fun m!674371 () Bool)

(assert (=> b!719540 m!674371))

(assert (=> b!719540 m!674371))

(assert (=> b!719540 m!674369))

(declare-fun m!674373 () Bool)

(assert (=> b!719540 m!674373))

(declare-fun m!674375 () Bool)

(assert (=> b!719546 m!674375))

(declare-fun m!674377 () Bool)

(assert (=> start!64064 m!674377))

(declare-fun m!674379 () Bool)

(assert (=> start!64064 m!674379))

(declare-fun m!674381 () Bool)

(assert (=> b!719542 m!674381))

(assert (=> b!719547 m!674369))

(assert (=> b!719547 m!674369))

(declare-fun m!674383 () Bool)

(assert (=> b!719547 m!674383))

(declare-fun m!674385 () Bool)

(assert (=> b!719548 m!674385))

(declare-fun m!674387 () Bool)

(assert (=> b!719544 m!674387))

(declare-fun m!674389 () Bool)

(assert (=> b!719541 m!674389))

(declare-fun m!674391 () Bool)

(assert (=> b!719549 m!674391))

(check-sat (not b!719546) (not start!64064) (not b!719549) (not b!719540) (not b!719547) (not b!719544) (not b!719542) (not b!719541))
(check-sat)
