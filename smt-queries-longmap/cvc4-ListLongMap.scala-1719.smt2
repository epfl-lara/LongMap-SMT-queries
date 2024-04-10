; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31716 () Bool)

(assert start!31716)

(declare-fun b!316914 () Bool)

(declare-fun res!171696 () Bool)

(declare-fun e!197085 () Bool)

(assert (=> b!316914 (=> (not res!171696) (not e!197085))))

(declare-datatypes ((array!16138 0))(
  ( (array!16139 (arr!7636 (Array (_ BitVec 32) (_ BitVec 64))) (size!7988 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16138)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316914 (= res!171696 (and (= (select (arr!7636 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7988 a!3293))))))

(declare-fun b!316915 () Bool)

(declare-fun res!171688 () Bool)

(declare-fun e!197086 () Bool)

(assert (=> b!316915 (=> (not res!171688) (not e!197086))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316915 (= res!171688 (validKeyInArray!0 k!2441))))

(declare-fun b!316916 () Bool)

(declare-fun e!197084 () Bool)

(assert (=> b!316916 (= e!197085 e!197084)))

(declare-fun res!171689 () Bool)

(assert (=> b!316916 (=> (not res!171689) (not e!197084))))

(declare-datatypes ((SeekEntryResult!2776 0))(
  ( (MissingZero!2776 (index!13280 (_ BitVec 32))) (Found!2776 (index!13281 (_ BitVec 32))) (Intermediate!2776 (undefined!3588 Bool) (index!13282 (_ BitVec 32)) (x!31536 (_ BitVec 32))) (Undefined!2776) (MissingVacant!2776 (index!13283 (_ BitVec 32))) )
))
(declare-fun lt!154748 () SeekEntryResult!2776)

(declare-fun lt!154749 () SeekEntryResult!2776)

(assert (=> b!316916 (= res!171689 (and (= lt!154748 lt!154749) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7636 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16138 (_ BitVec 32)) SeekEntryResult!2776)

(assert (=> b!316916 (= lt!154748 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316917 () Bool)

(declare-fun res!171695 () Bool)

(assert (=> b!316917 (=> (not res!171695) (not e!197086))))

(assert (=> b!316917 (= res!171695 (and (= (size!7988 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7988 a!3293))))))

(declare-fun b!316918 () Bool)

(declare-fun res!171691 () Bool)

(assert (=> b!316918 (=> (not res!171691) (not e!197086))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16138 (_ BitVec 32)) SeekEntryResult!2776)

(assert (=> b!316918 (= res!171691 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2776 i!1240)))))

(declare-fun b!316919 () Bool)

(assert (=> b!316919 (= e!197086 e!197085)))

(declare-fun res!171692 () Bool)

(assert (=> b!316919 (=> (not res!171692) (not e!197085))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316919 (= res!171692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154749))))

(assert (=> b!316919 (= lt!154749 (Intermediate!2776 false resIndex!52 resX!52))))

(declare-fun b!316920 () Bool)

(declare-fun res!171693 () Bool)

(assert (=> b!316920 (=> (not res!171693) (not e!197086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16138 (_ BitVec 32)) Bool)

(assert (=> b!316920 (= res!171693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316921 () Bool)

(declare-fun res!171694 () Bool)

(assert (=> b!316921 (=> (not res!171694) (not e!197086))))

(declare-fun arrayContainsKey!0 (array!16138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316921 (= res!171694 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!171690 () Bool)

(assert (=> start!31716 (=> (not res!171690) (not e!197086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31716 (= res!171690 (validMask!0 mask!3709))))

(assert (=> start!31716 e!197086))

(declare-fun array_inv!5599 (array!16138) Bool)

(assert (=> start!31716 (array_inv!5599 a!3293)))

(assert (=> start!31716 true))

(declare-fun b!316922 () Bool)

(assert (=> b!316922 (= e!197084 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316922 (= lt!154748 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!31716 res!171690) b!316917))

(assert (= (and b!316917 res!171695) b!316915))

(assert (= (and b!316915 res!171688) b!316921))

(assert (= (and b!316921 res!171694) b!316918))

(assert (= (and b!316918 res!171691) b!316920))

(assert (= (and b!316920 res!171693) b!316919))

(assert (= (and b!316919 res!171692) b!316914))

(assert (= (and b!316914 res!171696) b!316916))

(assert (= (and b!316916 res!171689) b!316922))

(declare-fun m!325659 () Bool)

(assert (=> b!316919 m!325659))

(assert (=> b!316919 m!325659))

(declare-fun m!325661 () Bool)

(assert (=> b!316919 m!325661))

(declare-fun m!325663 () Bool)

(assert (=> b!316920 m!325663))

(declare-fun m!325665 () Bool)

(assert (=> b!316914 m!325665))

(declare-fun m!325667 () Bool)

(assert (=> b!316921 m!325667))

(declare-fun m!325669 () Bool)

(assert (=> b!316922 m!325669))

(assert (=> b!316922 m!325669))

(declare-fun m!325671 () Bool)

(assert (=> b!316922 m!325671))

(declare-fun m!325673 () Bool)

(assert (=> start!31716 m!325673))

(declare-fun m!325675 () Bool)

(assert (=> start!31716 m!325675))

(declare-fun m!325677 () Bool)

(assert (=> b!316915 m!325677))

(declare-fun m!325679 () Bool)

(assert (=> b!316916 m!325679))

(declare-fun m!325681 () Bool)

(assert (=> b!316916 m!325681))

(declare-fun m!325683 () Bool)

(assert (=> b!316918 m!325683))

(push 1)

(assert (not b!316916))

(assert (not b!316920))

(assert (not b!316921))

(assert (not b!316918))

(assert (not b!316922))

(assert (not b!316915))

