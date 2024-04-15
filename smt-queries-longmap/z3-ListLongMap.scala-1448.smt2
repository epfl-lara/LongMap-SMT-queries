; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27926 () Bool)

(assert start!27926)

(declare-fun b!286734 () Bool)

(declare-fun res!148800 () Bool)

(declare-fun e!181642 () Bool)

(assert (=> b!286734 (=> (not res!148800) (not e!181642))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286734 (= res!148800 (validKeyInArray!0 k0!2524))))

(declare-fun res!148796 () Bool)

(assert (=> start!27926 (=> (not res!148796) (not e!181642))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27926 (= res!148796 (validMask!0 mask!3809))))

(assert (=> start!27926 e!181642))

(assert (=> start!27926 true))

(declare-datatypes ((array!14368 0))(
  ( (array!14369 (arr!6816 (Array (_ BitVec 32) (_ BitVec 64))) (size!7169 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14368)

(declare-fun array_inv!4788 (array!14368) Bool)

(assert (=> start!27926 (array_inv!4788 a!3312)))

(declare-fun b!286735 () Bool)

(declare-fun e!181644 () Bool)

(assert (=> b!286735 (= e!181642 e!181644)))

(declare-fun res!148801 () Bool)

(assert (=> b!286735 (=> (not res!148801) (not e!181644))))

(declare-datatypes ((SeekEntryResult!1964 0))(
  ( (MissingZero!1964 (index!10026 (_ BitVec 32))) (Found!1964 (index!10027 (_ BitVec 32))) (Intermediate!1964 (undefined!2776 Bool) (index!10028 (_ BitVec 32)) (x!28262 (_ BitVec 32))) (Undefined!1964) (MissingVacant!1964 (index!10029 (_ BitVec 32))) )
))
(declare-fun lt!141108 () SeekEntryResult!1964)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286735 (= res!148801 (or (= lt!141108 (MissingZero!1964 i!1256)) (= lt!141108 (MissingVacant!1964 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14368 (_ BitVec 32)) SeekEntryResult!1964)

(assert (=> b!286735 (= lt!141108 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286736 () Bool)

(declare-fun res!148799 () Bool)

(assert (=> b!286736 (=> (not res!148799) (not e!181644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14368 (_ BitVec 32)) Bool)

(assert (=> b!286736 (= res!148799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286737 () Bool)

(declare-fun res!148797 () Bool)

(assert (=> b!286737 (=> (not res!148797) (not e!181642))))

(assert (=> b!286737 (= res!148797 (and (= (size!7169 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7169 a!3312))))))

(declare-fun b!286738 () Bool)

(assert (=> b!286738 (= e!181644 false)))

(declare-fun lt!141107 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286738 (= lt!141107 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286739 () Bool)

(declare-fun res!148798 () Bool)

(assert (=> b!286739 (=> (not res!148798) (not e!181642))))

(declare-fun arrayContainsKey!0 (array!14368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286739 (= res!148798 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27926 res!148796) b!286737))

(assert (= (and b!286737 res!148797) b!286734))

(assert (= (and b!286734 res!148800) b!286739))

(assert (= (and b!286739 res!148798) b!286735))

(assert (= (and b!286735 res!148801) b!286736))

(assert (= (and b!286736 res!148799) b!286738))

(declare-fun m!300857 () Bool)

(assert (=> b!286734 m!300857))

(declare-fun m!300859 () Bool)

(assert (=> b!286739 m!300859))

(declare-fun m!300861 () Bool)

(assert (=> start!27926 m!300861))

(declare-fun m!300863 () Bool)

(assert (=> start!27926 m!300863))

(declare-fun m!300865 () Bool)

(assert (=> b!286738 m!300865))

(declare-fun m!300867 () Bool)

(assert (=> b!286736 m!300867))

(declare-fun m!300869 () Bool)

(assert (=> b!286735 m!300869))

(check-sat (not b!286736) (not b!286735) (not start!27926) (not b!286738) (not b!286734) (not b!286739))
(check-sat)
