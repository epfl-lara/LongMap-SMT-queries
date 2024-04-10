; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28402 () Bool)

(assert start!28402)

(declare-fun b!290785 () Bool)

(declare-fun e!184005 () Bool)

(assert (=> b!290785 (= e!184005 (not true))))

(declare-datatypes ((SeekEntryResult!2110 0))(
  ( (MissingZero!2110 (index!10610 (_ BitVec 32))) (Found!2110 (index!10611 (_ BitVec 32))) (Intermediate!2110 (undefined!2922 Bool) (index!10612 (_ BitVec 32)) (x!28801 (_ BitVec 32))) (Undefined!2110) (MissingVacant!2110 (index!10613 (_ BitVec 32))) )
))
(declare-fun lt!143703 () SeekEntryResult!2110)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290785 (= (index!10612 lt!143703) i!1256)))

(declare-fun b!290786 () Bool)

(declare-fun e!184003 () Bool)

(declare-fun e!184006 () Bool)

(assert (=> b!290786 (= e!184003 e!184006)))

(declare-fun res!152127 () Bool)

(assert (=> b!290786 (=> (not res!152127) (not e!184006))))

(declare-fun lt!143705 () SeekEntryResult!2110)

(declare-fun lt!143707 () Bool)

(assert (=> b!290786 (= res!152127 (and (not lt!143707) (= lt!143705 (MissingVacant!2110 i!1256))))))

(declare-fun lt!143706 () (_ BitVec 32))

(declare-fun lt!143704 () SeekEntryResult!2110)

(declare-datatypes ((array!14671 0))(
  ( (array!14672 (arr!6961 (Array (_ BitVec 32) (_ BitVec 64))) (size!7313 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14671)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14671 (_ BitVec 32)) SeekEntryResult!2110)

(assert (=> b!290786 (= lt!143704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143706 k!2524 (array!14672 (store (arr!6961 a!3312) i!1256 k!2524) (size!7313 a!3312)) mask!3809))))

(assert (=> b!290786 (= lt!143703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143706 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290786 (= lt!143706 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290787 () Bool)

(declare-fun res!152128 () Bool)

(assert (=> b!290787 (=> (not res!152128) (not e!184003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14671 (_ BitVec 32)) Bool)

(assert (=> b!290787 (= res!152128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152123 () Bool)

(declare-fun e!184004 () Bool)

(assert (=> start!28402 (=> (not res!152123) (not e!184004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28402 (= res!152123 (validMask!0 mask!3809))))

(assert (=> start!28402 e!184004))

(assert (=> start!28402 true))

(declare-fun array_inv!4924 (array!14671) Bool)

(assert (=> start!28402 (array_inv!4924 a!3312)))

(declare-fun b!290788 () Bool)

(declare-fun res!152125 () Bool)

(assert (=> b!290788 (=> (not res!152125) (not e!184004))))

(declare-fun arrayContainsKey!0 (array!14671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290788 (= res!152125 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290789 () Bool)

(assert (=> b!290789 (= e!184004 e!184003)))

(declare-fun res!152130 () Bool)

(assert (=> b!290789 (=> (not res!152130) (not e!184003))))

(assert (=> b!290789 (= res!152130 (or lt!143707 (= lt!143705 (MissingVacant!2110 i!1256))))))

(assert (=> b!290789 (= lt!143707 (= lt!143705 (MissingZero!2110 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14671 (_ BitVec 32)) SeekEntryResult!2110)

(assert (=> b!290789 (= lt!143705 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290790 () Bool)

(assert (=> b!290790 (= e!184006 e!184005)))

(declare-fun res!152126 () Bool)

(assert (=> b!290790 (=> (not res!152126) (not e!184005))))

(declare-fun lt!143702 () Bool)

(assert (=> b!290790 (= res!152126 (and (or lt!143702 (not (undefined!2922 lt!143703))) (not lt!143702) (= (select (arr!6961 a!3312) (index!10612 lt!143703)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290790 (= lt!143702 (not (is-Intermediate!2110 lt!143703)))))

(declare-fun b!290791 () Bool)

(declare-fun res!152124 () Bool)

(assert (=> b!290791 (=> (not res!152124) (not e!184004))))

(assert (=> b!290791 (= res!152124 (and (= (size!7313 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7313 a!3312))))))

(declare-fun b!290792 () Bool)

(declare-fun res!152129 () Bool)

(assert (=> b!290792 (=> (not res!152129) (not e!184004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290792 (= res!152129 (validKeyInArray!0 k!2524))))

(assert (= (and start!28402 res!152123) b!290791))

(assert (= (and b!290791 res!152124) b!290792))

(assert (= (and b!290792 res!152129) b!290788))

(assert (= (and b!290788 res!152125) b!290789))

(assert (= (and b!290789 res!152130) b!290787))

(assert (= (and b!290787 res!152128) b!290786))

(assert (= (and b!290786 res!152127) b!290790))

(assert (= (and b!290790 res!152126) b!290785))

(declare-fun m!304775 () Bool)

(assert (=> b!290786 m!304775))

(declare-fun m!304777 () Bool)

(assert (=> b!290786 m!304777))

(declare-fun m!304779 () Bool)

(assert (=> b!290786 m!304779))

(declare-fun m!304781 () Bool)

(assert (=> b!290786 m!304781))

(declare-fun m!304783 () Bool)

(assert (=> b!290792 m!304783))

(declare-fun m!304785 () Bool)

(assert (=> b!290790 m!304785))

(declare-fun m!304787 () Bool)

(assert (=> b!290789 m!304787))

(declare-fun m!304789 () Bool)

(assert (=> b!290788 m!304789))

(declare-fun m!304791 () Bool)

(assert (=> start!28402 m!304791))

(declare-fun m!304793 () Bool)

(assert (=> start!28402 m!304793))

(declare-fun m!304795 () Bool)

(assert (=> b!290787 m!304795))

(push 1)

