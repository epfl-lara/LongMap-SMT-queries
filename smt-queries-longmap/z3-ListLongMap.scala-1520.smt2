; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28646 () Bool)

(assert start!28646)

(declare-fun b!292728 () Bool)

(declare-fun e!185141 () Bool)

(declare-fun e!185142 () Bool)

(assert (=> b!292728 (= e!185141 e!185142)))

(declare-fun res!153841 () Bool)

(assert (=> b!292728 (=> (not res!153841) (not e!185142))))

(declare-datatypes ((SeekEntryResult!2180 0))(
  ( (MissingZero!2180 (index!10890 (_ BitVec 32))) (Found!2180 (index!10891 (_ BitVec 32))) (Intermediate!2180 (undefined!2992 Bool) (index!10892 (_ BitVec 32)) (x!29090 (_ BitVec 32))) (Undefined!2180) (MissingVacant!2180 (index!10893 (_ BitVec 32))) )
))
(declare-fun lt!144954 () SeekEntryResult!2180)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292728 (= res!153841 (or (= lt!144954 (MissingZero!2180 i!1256)) (= lt!144954 (MissingVacant!2180 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14818 0))(
  ( (array!14819 (arr!7032 (Array (_ BitVec 32) (_ BitVec 64))) (size!7385 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14818)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14818 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!292728 (= lt!144954 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292729 () Bool)

(declare-fun res!153839 () Bool)

(assert (=> b!292729 (=> (not res!153839) (not e!185141))))

(declare-fun arrayContainsKey!0 (array!14818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292729 (= res!153839 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292730 () Bool)

(assert (=> b!292730 (= e!185142 false)))

(declare-fun lt!144951 () (_ BitVec 32))

(declare-fun lt!144952 () SeekEntryResult!2180)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14818 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!292730 (= lt!144952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144951 k0!2524 (array!14819 (store (arr!7032 a!3312) i!1256 k0!2524) (size!7385 a!3312)) mask!3809))))

(declare-fun lt!144953 () SeekEntryResult!2180)

(assert (=> b!292730 (= lt!144953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144951 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292730 (= lt!144951 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292731 () Bool)

(declare-fun res!153840 () Bool)

(assert (=> b!292731 (=> (not res!153840) (not e!185142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14818 (_ BitVec 32)) Bool)

(assert (=> b!292731 (= res!153840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292732 () Bool)

(declare-fun res!153837 () Bool)

(assert (=> b!292732 (=> (not res!153837) (not e!185141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292732 (= res!153837 (validKeyInArray!0 k0!2524))))

(declare-fun b!292733 () Bool)

(declare-fun res!153838 () Bool)

(assert (=> b!292733 (=> (not res!153838) (not e!185141))))

(assert (=> b!292733 (= res!153838 (and (= (size!7385 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7385 a!3312))))))

(declare-fun res!153836 () Bool)

(assert (=> start!28646 (=> (not res!153836) (not e!185141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28646 (= res!153836 (validMask!0 mask!3809))))

(assert (=> start!28646 e!185141))

(assert (=> start!28646 true))

(declare-fun array_inv!5004 (array!14818) Bool)

(assert (=> start!28646 (array_inv!5004 a!3312)))

(assert (= (and start!28646 res!153836) b!292733))

(assert (= (and b!292733 res!153838) b!292732))

(assert (= (and b!292732 res!153837) b!292729))

(assert (= (and b!292729 res!153839) b!292728))

(assert (= (and b!292728 res!153841) b!292731))

(assert (= (and b!292731 res!153840) b!292730))

(declare-fun m!306065 () Bool)

(assert (=> b!292728 m!306065))

(declare-fun m!306067 () Bool)

(assert (=> b!292729 m!306067))

(declare-fun m!306069 () Bool)

(assert (=> b!292731 m!306069))

(declare-fun m!306071 () Bool)

(assert (=> start!28646 m!306071))

(declare-fun m!306073 () Bool)

(assert (=> start!28646 m!306073))

(declare-fun m!306075 () Bool)

(assert (=> b!292732 m!306075))

(declare-fun m!306077 () Bool)

(assert (=> b!292730 m!306077))

(declare-fun m!306079 () Bool)

(assert (=> b!292730 m!306079))

(declare-fun m!306081 () Bool)

(assert (=> b!292730 m!306081))

(declare-fun m!306083 () Bool)

(assert (=> b!292730 m!306083))

(check-sat (not b!292731) (not b!292728) (not b!292732) (not start!28646) (not b!292729) (not b!292730))
(check-sat)
