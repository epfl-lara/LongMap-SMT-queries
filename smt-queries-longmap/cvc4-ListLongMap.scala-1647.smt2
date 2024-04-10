; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30666 () Bool)

(assert start!30666)

(declare-fun b!307832 () Bool)

(declare-fun res!164592 () Bool)

(declare-fun e!192631 () Bool)

(assert (=> b!307832 (=> (not res!164592) (not e!192631))))

(declare-datatypes ((array!15670 0))(
  ( (array!15671 (arr!7420 (Array (_ BitVec 32) (_ BitVec 64))) (size!7772 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15670)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2560 0))(
  ( (MissingZero!2560 (index!12416 (_ BitVec 32))) (Found!2560 (index!12417 (_ BitVec 32))) (Intermediate!2560 (undefined!3372 Bool) (index!12418 (_ BitVec 32)) (x!30651 (_ BitVec 32))) (Undefined!2560) (MissingVacant!2560 (index!12419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15670 (_ BitVec 32)) SeekEntryResult!2560)

(assert (=> b!307832 (= res!164592 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2560 i!1240)))))

(declare-fun res!164590 () Bool)

(assert (=> start!30666 (=> (not res!164590) (not e!192631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30666 (= res!164590 (validMask!0 mask!3709))))

(assert (=> start!30666 e!192631))

(declare-fun array_inv!5383 (array!15670) Bool)

(assert (=> start!30666 (array_inv!5383 a!3293)))

(assert (=> start!30666 true))

(declare-fun b!307833 () Bool)

(declare-fun res!164595 () Bool)

(declare-fun e!192630 () Bool)

(assert (=> b!307833 (=> (not res!164595) (not e!192630))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307833 (= res!164595 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7420 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307834 () Bool)

(declare-fun res!164591 () Bool)

(assert (=> b!307834 (=> (not res!164591) (not e!192631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307834 (= res!164591 (validKeyInArray!0 k!2441))))

(declare-fun b!307835 () Bool)

(declare-fun res!164587 () Bool)

(assert (=> b!307835 (=> (not res!164587) (not e!192630))))

(declare-fun lt!151184 () SeekEntryResult!2560)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15670 (_ BitVec 32)) SeekEntryResult!2560)

(assert (=> b!307835 (= res!164587 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151184))))

(declare-fun b!307836 () Bool)

(declare-fun res!164589 () Bool)

(assert (=> b!307836 (=> (not res!164589) (not e!192631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15670 (_ BitVec 32)) Bool)

(assert (=> b!307836 (= res!164589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307837 () Bool)

(declare-fun res!164593 () Bool)

(assert (=> b!307837 (=> (not res!164593) (not e!192631))))

(assert (=> b!307837 (= res!164593 (and (= (size!7772 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7772 a!3293))))))

(declare-fun b!307838 () Bool)

(assert (=> b!307838 (= e!192631 e!192630)))

(declare-fun res!164588 () Bool)

(assert (=> b!307838 (=> (not res!164588) (not e!192630))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307838 (= res!164588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151184))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307838 (= lt!151184 (Intermediate!2560 false resIndex!52 resX!52))))

(declare-fun b!307839 () Bool)

(declare-fun res!164586 () Bool)

(assert (=> b!307839 (=> (not res!164586) (not e!192630))))

(assert (=> b!307839 (= res!164586 (and (= (select (arr!7420 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7772 a!3293))))))

(declare-fun b!307840 () Bool)

(assert (=> b!307840 (= e!192630 false)))

(declare-fun lt!151185 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307840 (= lt!151185 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307841 () Bool)

(declare-fun res!164594 () Bool)

(assert (=> b!307841 (=> (not res!164594) (not e!192631))))

(declare-fun arrayContainsKey!0 (array!15670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307841 (= res!164594 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30666 res!164590) b!307837))

(assert (= (and b!307837 res!164593) b!307834))

(assert (= (and b!307834 res!164591) b!307841))

(assert (= (and b!307841 res!164594) b!307832))

(assert (= (and b!307832 res!164592) b!307836))

(assert (= (and b!307836 res!164589) b!307838))

(assert (= (and b!307838 res!164588) b!307839))

(assert (= (and b!307839 res!164586) b!307835))

(assert (= (and b!307835 res!164587) b!307833))

(assert (= (and b!307833 res!164595) b!307840))

(declare-fun m!318065 () Bool)

(assert (=> start!30666 m!318065))

(declare-fun m!318067 () Bool)

(assert (=> start!30666 m!318067))

(declare-fun m!318069 () Bool)

(assert (=> b!307841 m!318069))

(declare-fun m!318071 () Bool)

(assert (=> b!307833 m!318071))

(declare-fun m!318073 () Bool)

(assert (=> b!307835 m!318073))

(declare-fun m!318075 () Bool)

(assert (=> b!307834 m!318075))

(declare-fun m!318077 () Bool)

(assert (=> b!307836 m!318077))

(declare-fun m!318079 () Bool)

(assert (=> b!307840 m!318079))

(declare-fun m!318081 () Bool)

(assert (=> b!307832 m!318081))

(declare-fun m!318083 () Bool)

(assert (=> b!307839 m!318083))

(declare-fun m!318085 () Bool)

(assert (=> b!307838 m!318085))

(assert (=> b!307838 m!318085))

(declare-fun m!318087 () Bool)

(assert (=> b!307838 m!318087))

(push 1)

(assert (not b!307840))

(assert (not b!307832))

(assert (not b!307835))

(assert (not b!307838))

(assert (not b!307841))

