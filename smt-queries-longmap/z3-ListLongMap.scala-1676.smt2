; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30930 () Bool)

(assert start!30930)

(declare-fun b!310644 () Bool)

(declare-fun e!193917 () Bool)

(assert (=> b!310644 (= e!193917 (not true))))

(declare-fun e!193915 () Bool)

(assert (=> b!310644 e!193915))

(declare-fun res!167157 () Bool)

(assert (=> b!310644 (=> (not res!167157) (not e!193915))))

(declare-datatypes ((array!15845 0))(
  ( (array!15846 (arr!7504 (Array (_ BitVec 32) (_ BitVec 64))) (size!7856 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15845)

(declare-fun lt!152076 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2609 0))(
  ( (MissingZero!2609 (index!12612 (_ BitVec 32))) (Found!2609 (index!12613 (_ BitVec 32))) (Intermediate!2609 (undefined!3421 Bool) (index!12614 (_ BitVec 32)) (x!30947 (_ BitVec 32))) (Undefined!2609) (MissingVacant!2609 (index!12615 (_ BitVec 32))) )
))
(declare-fun lt!152078 () SeekEntryResult!2609)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15845 (_ BitVec 32)) SeekEntryResult!2609)

(assert (=> b!310644 (= res!167157 (= lt!152078 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152076 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310644 (= lt!152076 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310645 () Bool)

(declare-fun e!193916 () Bool)

(assert (=> b!310645 (= e!193916 e!193917)))

(declare-fun res!167152 () Bool)

(assert (=> b!310645 (=> (not res!167152) (not e!193917))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!152079 () SeekEntryResult!2609)

(assert (=> b!310645 (= res!167152 (and (= lt!152078 lt!152079) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7504 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310645 (= lt!152078 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310646 () Bool)

(declare-fun res!167153 () Bool)

(declare-fun e!193913 () Bool)

(assert (=> b!310646 (=> (not res!167153) (not e!193913))))

(declare-fun arrayContainsKey!0 (array!15845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310646 (= res!167153 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310647 () Bool)

(declare-fun lt!152077 () array!15845)

(assert (=> b!310647 (= e!193915 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152077 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152076 k0!2441 lt!152077 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310647 (= lt!152077 (array!15846 (store (arr!7504 a!3293) i!1240 k0!2441) (size!7856 a!3293)))))

(declare-fun b!310648 () Bool)

(declare-fun res!167150 () Bool)

(assert (=> b!310648 (=> (not res!167150) (not e!193916))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310648 (= res!167150 (and (= (select (arr!7504 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7856 a!3293))))))

(declare-fun b!310649 () Bool)

(declare-fun res!167149 () Bool)

(assert (=> b!310649 (=> (not res!167149) (not e!193913))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15845 (_ BitVec 32)) SeekEntryResult!2609)

(assert (=> b!310649 (= res!167149 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2609 i!1240)))))

(declare-fun res!167155 () Bool)

(assert (=> start!30930 (=> (not res!167155) (not e!193913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30930 (= res!167155 (validMask!0 mask!3709))))

(assert (=> start!30930 e!193913))

(declare-fun array_inv!5454 (array!15845) Bool)

(assert (=> start!30930 (array_inv!5454 a!3293)))

(assert (=> start!30930 true))

(declare-fun b!310650 () Bool)

(declare-fun res!167151 () Bool)

(assert (=> b!310650 (=> (not res!167151) (not e!193913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15845 (_ BitVec 32)) Bool)

(assert (=> b!310650 (= res!167151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310651 () Bool)

(declare-fun res!167148 () Bool)

(assert (=> b!310651 (=> (not res!167148) (not e!193913))))

(assert (=> b!310651 (= res!167148 (and (= (size!7856 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7856 a!3293))))))

(declare-fun b!310652 () Bool)

(declare-fun res!167156 () Bool)

(assert (=> b!310652 (=> (not res!167156) (not e!193913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310652 (= res!167156 (validKeyInArray!0 k0!2441))))

(declare-fun b!310653 () Bool)

(assert (=> b!310653 (= e!193913 e!193916)))

(declare-fun res!167154 () Bool)

(assert (=> b!310653 (=> (not res!167154) (not e!193916))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310653 (= res!167154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152079))))

(assert (=> b!310653 (= lt!152079 (Intermediate!2609 false resIndex!52 resX!52))))

(assert (= (and start!30930 res!167155) b!310651))

(assert (= (and b!310651 res!167148) b!310652))

(assert (= (and b!310652 res!167156) b!310646))

(assert (= (and b!310646 res!167153) b!310649))

(assert (= (and b!310649 res!167149) b!310650))

(assert (= (and b!310650 res!167151) b!310653))

(assert (= (and b!310653 res!167154) b!310648))

(assert (= (and b!310648 res!167150) b!310645))

(assert (= (and b!310645 res!167152) b!310644))

(assert (= (and b!310644 res!167157) b!310647))

(declare-fun m!320755 () Bool)

(assert (=> b!310648 m!320755))

(declare-fun m!320757 () Bool)

(assert (=> b!310653 m!320757))

(assert (=> b!310653 m!320757))

(declare-fun m!320759 () Bool)

(assert (=> b!310653 m!320759))

(declare-fun m!320761 () Bool)

(assert (=> b!310649 m!320761))

(declare-fun m!320763 () Bool)

(assert (=> b!310647 m!320763))

(declare-fun m!320765 () Bool)

(assert (=> b!310647 m!320765))

(declare-fun m!320767 () Bool)

(assert (=> b!310647 m!320767))

(declare-fun m!320769 () Bool)

(assert (=> b!310644 m!320769))

(declare-fun m!320771 () Bool)

(assert (=> b!310644 m!320771))

(declare-fun m!320773 () Bool)

(assert (=> b!310646 m!320773))

(declare-fun m!320775 () Bool)

(assert (=> start!30930 m!320775))

(declare-fun m!320777 () Bool)

(assert (=> start!30930 m!320777))

(declare-fun m!320779 () Bool)

(assert (=> b!310645 m!320779))

(declare-fun m!320781 () Bool)

(assert (=> b!310645 m!320781))

(declare-fun m!320783 () Bool)

(assert (=> b!310650 m!320783))

(declare-fun m!320785 () Bool)

(assert (=> b!310652 m!320785))

(check-sat (not b!310644) (not b!310645) (not b!310646) (not b!310649) (not b!310652) (not b!310647) (not b!310650) (not b!310653) (not start!30930))
(check-sat)
