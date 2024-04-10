; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28390 () Bool)

(assert start!28390)

(declare-fun b!290641 () Bool)

(declare-fun e!183914 () Bool)

(declare-fun e!183915 () Bool)

(assert (=> b!290641 (= e!183914 e!183915)))

(declare-fun res!151985 () Bool)

(assert (=> b!290641 (=> (not res!151985) (not e!183915))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2104 0))(
  ( (MissingZero!2104 (index!10586 (_ BitVec 32))) (Found!2104 (index!10587 (_ BitVec 32))) (Intermediate!2104 (undefined!2916 Bool) (index!10588 (_ BitVec 32)) (x!28779 (_ BitVec 32))) (Undefined!2104) (MissingVacant!2104 (index!10589 (_ BitVec 32))) )
))
(declare-fun lt!143599 () SeekEntryResult!2104)

(declare-fun lt!143594 () Bool)

(assert (=> b!290641 (= res!151985 (or lt!143594 (= lt!143599 (MissingVacant!2104 i!1256))))))

(assert (=> b!290641 (= lt!143594 (= lt!143599 (MissingZero!2104 i!1256)))))

(declare-datatypes ((array!14659 0))(
  ( (array!14660 (arr!6955 (Array (_ BitVec 32) (_ BitVec 64))) (size!7307 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14659)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14659 (_ BitVec 32)) SeekEntryResult!2104)

(assert (=> b!290641 (= lt!143599 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!151982 () Bool)

(assert (=> start!28390 (=> (not res!151982) (not e!183914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28390 (= res!151982 (validMask!0 mask!3809))))

(assert (=> start!28390 e!183914))

(assert (=> start!28390 true))

(declare-fun array_inv!4918 (array!14659) Bool)

(assert (=> start!28390 (array_inv!4918 a!3312)))

(declare-fun b!290642 () Bool)

(declare-fun res!151979 () Bool)

(assert (=> b!290642 (=> (not res!151979) (not e!183914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290642 (= res!151979 (validKeyInArray!0 k!2524))))

(declare-fun b!290643 () Bool)

(declare-fun res!151986 () Bool)

(assert (=> b!290643 (=> (not res!151986) (not e!183914))))

(declare-fun arrayContainsKey!0 (array!14659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290643 (= res!151986 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290644 () Bool)

(declare-fun e!183916 () Bool)

(assert (=> b!290644 (= e!183916 (not true))))

(declare-fun lt!143596 () SeekEntryResult!2104)

(assert (=> b!290644 (= (index!10588 lt!143596) i!1256)))

(declare-fun b!290645 () Bool)

(declare-fun res!151984 () Bool)

(assert (=> b!290645 (=> (not res!151984) (not e!183915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14659 (_ BitVec 32)) Bool)

(assert (=> b!290645 (= res!151984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290646 () Bool)

(declare-fun res!151980 () Bool)

(assert (=> b!290646 (=> (not res!151980) (not e!183914))))

(assert (=> b!290646 (= res!151980 (and (= (size!7307 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7307 a!3312))))))

(declare-fun b!290647 () Bool)

(declare-fun e!183917 () Bool)

(assert (=> b!290647 (= e!183917 e!183916)))

(declare-fun res!151983 () Bool)

(assert (=> b!290647 (=> (not res!151983) (not e!183916))))

(declare-fun lt!143598 () Bool)

(assert (=> b!290647 (= res!151983 (and (or lt!143598 (not (undefined!2916 lt!143596))) (not lt!143598) (= (select (arr!6955 a!3312) (index!10588 lt!143596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290647 (= lt!143598 (not (is-Intermediate!2104 lt!143596)))))

(declare-fun b!290648 () Bool)

(assert (=> b!290648 (= e!183915 e!183917)))

(declare-fun res!151981 () Bool)

(assert (=> b!290648 (=> (not res!151981) (not e!183917))))

(assert (=> b!290648 (= res!151981 (and (not lt!143594) (= lt!143599 (MissingVacant!2104 i!1256))))))

(declare-fun lt!143595 () (_ BitVec 32))

(declare-fun lt!143597 () SeekEntryResult!2104)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14659 (_ BitVec 32)) SeekEntryResult!2104)

(assert (=> b!290648 (= lt!143597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143595 k!2524 (array!14660 (store (arr!6955 a!3312) i!1256 k!2524) (size!7307 a!3312)) mask!3809))))

(assert (=> b!290648 (= lt!143596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143595 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290648 (= lt!143595 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28390 res!151982) b!290646))

(assert (= (and b!290646 res!151980) b!290642))

(assert (= (and b!290642 res!151979) b!290643))

(assert (= (and b!290643 res!151986) b!290641))

(assert (= (and b!290641 res!151985) b!290645))

(assert (= (and b!290645 res!151984) b!290648))

(assert (= (and b!290648 res!151981) b!290647))

(assert (= (and b!290647 res!151983) b!290644))

(declare-fun m!304643 () Bool)

(assert (=> b!290648 m!304643))

(declare-fun m!304645 () Bool)

(assert (=> b!290648 m!304645))

(declare-fun m!304647 () Bool)

(assert (=> b!290648 m!304647))

(declare-fun m!304649 () Bool)

(assert (=> b!290648 m!304649))

(declare-fun m!304651 () Bool)

(assert (=> b!290643 m!304651))

(declare-fun m!304653 () Bool)

(assert (=> b!290645 m!304653))

(declare-fun m!304655 () Bool)

(assert (=> start!28390 m!304655))

(declare-fun m!304657 () Bool)

(assert (=> start!28390 m!304657))

(declare-fun m!304659 () Bool)

(assert (=> b!290642 m!304659))

(declare-fun m!304661 () Bool)

(assert (=> b!290647 m!304661))

(declare-fun m!304663 () Bool)

(assert (=> b!290641 m!304663))

(push 1)

