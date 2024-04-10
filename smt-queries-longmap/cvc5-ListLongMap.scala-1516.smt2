; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28626 () Bool)

(assert start!28626)

(declare-fun b!292659 () Bool)

(declare-fun res!153718 () Bool)

(declare-fun e!185134 () Bool)

(assert (=> b!292659 (=> (not res!153718) (not e!185134))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14805 0))(
  ( (array!14806 (arr!7025 (Array (_ BitVec 32) (_ BitVec 64))) (size!7377 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14805)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292659 (= res!153718 (and (= (size!7377 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7377 a!3312))))))

(declare-fun res!153719 () Bool)

(assert (=> start!28626 (=> (not res!153719) (not e!185134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28626 (= res!153719 (validMask!0 mask!3809))))

(assert (=> start!28626 e!185134))

(assert (=> start!28626 true))

(declare-fun array_inv!4988 (array!14805) Bool)

(assert (=> start!28626 (array_inv!4988 a!3312)))

(declare-fun b!292660 () Bool)

(declare-fun res!153715 () Bool)

(declare-fun e!185133 () Bool)

(assert (=> b!292660 (=> (not res!153715) (not e!185133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14805 (_ BitVec 32)) Bool)

(assert (=> b!292660 (= res!153715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292661 () Bool)

(assert (=> b!292661 (= e!185133 false)))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2174 0))(
  ( (MissingZero!2174 (index!10866 (_ BitVec 32))) (Found!2174 (index!10867 (_ BitVec 32))) (Intermediate!2174 (undefined!2986 Bool) (index!10868 (_ BitVec 32)) (x!29053 (_ BitVec 32))) (Undefined!2174) (MissingVacant!2174 (index!10869 (_ BitVec 32))) )
))
(declare-fun lt!144990 () SeekEntryResult!2174)

(declare-fun lt!144991 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14805 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!292661 (= lt!144990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144991 k!2524 (array!14806 (store (arr!7025 a!3312) i!1256 k!2524) (size!7377 a!3312)) mask!3809))))

(declare-fun lt!144988 () SeekEntryResult!2174)

(assert (=> b!292661 (= lt!144988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144991 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292661 (= lt!144991 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292662 () Bool)

(declare-fun res!153720 () Bool)

(assert (=> b!292662 (=> (not res!153720) (not e!185134))))

(declare-fun arrayContainsKey!0 (array!14805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292662 (= res!153720 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292663 () Bool)

(declare-fun res!153716 () Bool)

(assert (=> b!292663 (=> (not res!153716) (not e!185134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292663 (= res!153716 (validKeyInArray!0 k!2524))))

(declare-fun b!292664 () Bool)

(assert (=> b!292664 (= e!185134 e!185133)))

(declare-fun res!153717 () Bool)

(assert (=> b!292664 (=> (not res!153717) (not e!185133))))

(declare-fun lt!144989 () SeekEntryResult!2174)

(assert (=> b!292664 (= res!153717 (or (= lt!144989 (MissingZero!2174 i!1256)) (= lt!144989 (MissingVacant!2174 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14805 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!292664 (= lt!144989 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28626 res!153719) b!292659))

(assert (= (and b!292659 res!153718) b!292663))

(assert (= (and b!292663 res!153716) b!292662))

(assert (= (and b!292662 res!153720) b!292664))

(assert (= (and b!292664 res!153717) b!292660))

(assert (= (and b!292660 res!153715) b!292661))

(declare-fun m!306417 () Bool)

(assert (=> b!292664 m!306417))

(declare-fun m!306419 () Bool)

(assert (=> b!292662 m!306419))

(declare-fun m!306421 () Bool)

(assert (=> b!292663 m!306421))

(declare-fun m!306423 () Bool)

(assert (=> b!292661 m!306423))

(declare-fun m!306425 () Bool)

(assert (=> b!292661 m!306425))

(declare-fun m!306427 () Bool)

(assert (=> b!292661 m!306427))

(declare-fun m!306429 () Bool)

(assert (=> b!292661 m!306429))

(declare-fun m!306431 () Bool)

(assert (=> b!292660 m!306431))

(declare-fun m!306433 () Bool)

(assert (=> start!28626 m!306433))

(declare-fun m!306435 () Bool)

(assert (=> start!28626 m!306435))

(push 1)

