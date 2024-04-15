; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46734 () Bool)

(assert start!46734)

(declare-fun b!515901 () Bool)

(declare-fun e!301107 () Bool)

(declare-fun e!301108 () Bool)

(assert (=> b!515901 (= e!301107 (not e!301108))))

(declare-fun res!315613 () Bool)

(assert (=> b!515901 (=> res!315613 e!301108)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!236064 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4360 0))(
  ( (MissingZero!4360 (index!19628 (_ BitVec 32))) (Found!4360 (index!19629 (_ BitVec 32))) (Intermediate!4360 (undefined!5172 Bool) (index!19630 (_ BitVec 32)) (x!48598 (_ BitVec 32))) (Undefined!4360) (MissingVacant!4360 (index!19631 (_ BitVec 32))) )
))
(declare-fun lt!236063 () SeekEntryResult!4360)

(declare-datatypes ((array!33056 0))(
  ( (array!33057 (arr!15896 (Array (_ BitVec 32) (_ BitVec 64))) (size!16261 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33056 (_ BitVec 32)) SeekEntryResult!4360)

(assert (=> b!515901 (= res!315613 (= lt!236063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236064 (select (store (arr!15896 a!3235) i!1204 k0!2280) j!176) (array!33057 (store (arr!15896 a!3235) i!1204 k0!2280) (size!16261 a!3235)) mask!3524)))))

(declare-fun lt!236061 () (_ BitVec 32))

(assert (=> b!515901 (= lt!236063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236061 (select (arr!15896 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515901 (= lt!236064 (toIndex!0 (select (store (arr!15896 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515901 (= lt!236061 (toIndex!0 (select (arr!15896 a!3235) j!176) mask!3524))))

(declare-fun e!301110 () Bool)

(assert (=> b!515901 e!301110))

(declare-fun res!315607 () Bool)

(assert (=> b!515901 (=> (not res!315607) (not e!301110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33056 (_ BitVec 32)) Bool)

(assert (=> b!515901 (= res!315607 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15964 0))(
  ( (Unit!15965) )
))
(declare-fun lt!236065 () Unit!15964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15964)

(assert (=> b!515901 (= lt!236065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515902 () Bool)

(declare-fun res!315617 () Bool)

(declare-fun e!301106 () Bool)

(assert (=> b!515902 (=> (not res!315617) (not e!301106))))

(assert (=> b!515902 (= res!315617 (and (= (size!16261 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16261 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16261 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515903 () Bool)

(declare-fun res!315609 () Bool)

(assert (=> b!515903 (=> (not res!315609) (not e!301106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515903 (= res!315609 (validKeyInArray!0 (select (arr!15896 a!3235) j!176)))))

(declare-fun b!515905 () Bool)

(declare-fun res!315611 () Bool)

(assert (=> b!515905 (=> res!315611 e!301108)))

(get-info :version)

(assert (=> b!515905 (= res!315611 (or (undefined!5172 lt!236063) (not ((_ is Intermediate!4360) lt!236063))))))

(declare-fun b!515906 () Bool)

(assert (=> b!515906 (= e!301108 true)))

(assert (=> b!515906 (and (bvslt (x!48598 lt!236063) #b01111111111111111111111111111110) (or (= (select (arr!15896 a!3235) (index!19630 lt!236063)) (select (arr!15896 a!3235) j!176)) (= (select (arr!15896 a!3235) (index!19630 lt!236063)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15896 a!3235) (index!19630 lt!236063)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515907 () Bool)

(assert (=> b!515907 (= e!301106 e!301107)))

(declare-fun res!315612 () Bool)

(assert (=> b!515907 (=> (not res!315612) (not e!301107))))

(declare-fun lt!236062 () SeekEntryResult!4360)

(assert (=> b!515907 (= res!315612 (or (= lt!236062 (MissingZero!4360 i!1204)) (= lt!236062 (MissingVacant!4360 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33056 (_ BitVec 32)) SeekEntryResult!4360)

(assert (=> b!515907 (= lt!236062 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515908 () Bool)

(declare-fun res!315615 () Bool)

(assert (=> b!515908 (=> (not res!315615) (not e!301107))))

(assert (=> b!515908 (= res!315615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315608 () Bool)

(assert (=> start!46734 (=> (not res!315608) (not e!301106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46734 (= res!315608 (validMask!0 mask!3524))))

(assert (=> start!46734 e!301106))

(assert (=> start!46734 true))

(declare-fun array_inv!11779 (array!33056) Bool)

(assert (=> start!46734 (array_inv!11779 a!3235)))

(declare-fun b!515904 () Bool)

(declare-fun res!315616 () Bool)

(assert (=> b!515904 (=> (not res!315616) (not e!301107))))

(declare-datatypes ((List!10093 0))(
  ( (Nil!10090) (Cons!10089 (h!10987 (_ BitVec 64)) (t!16312 List!10093)) )
))
(declare-fun arrayNoDuplicates!0 (array!33056 (_ BitVec 32) List!10093) Bool)

(assert (=> b!515904 (= res!315616 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10090))))

(declare-fun b!515909 () Bool)

(declare-fun res!315614 () Bool)

(assert (=> b!515909 (=> (not res!315614) (not e!301106))))

(assert (=> b!515909 (= res!315614 (validKeyInArray!0 k0!2280))))

(declare-fun b!515910 () Bool)

(assert (=> b!515910 (= e!301110 (= (seekEntryOrOpen!0 (select (arr!15896 a!3235) j!176) a!3235 mask!3524) (Found!4360 j!176)))))

(declare-fun b!515911 () Bool)

(declare-fun res!315610 () Bool)

(assert (=> b!515911 (=> (not res!315610) (not e!301106))))

(declare-fun arrayContainsKey!0 (array!33056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515911 (= res!315610 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46734 res!315608) b!515902))

(assert (= (and b!515902 res!315617) b!515903))

(assert (= (and b!515903 res!315609) b!515909))

(assert (= (and b!515909 res!315614) b!515911))

(assert (= (and b!515911 res!315610) b!515907))

(assert (= (and b!515907 res!315612) b!515908))

(assert (= (and b!515908 res!315615) b!515904))

(assert (= (and b!515904 res!315616) b!515901))

(assert (= (and b!515901 res!315607) b!515910))

(assert (= (and b!515901 (not res!315613)) b!515905))

(assert (= (and b!515905 (not res!315611)) b!515906))

(declare-fun m!496867 () Bool)

(assert (=> b!515909 m!496867))

(declare-fun m!496869 () Bool)

(assert (=> b!515911 m!496869))

(declare-fun m!496871 () Bool)

(assert (=> b!515903 m!496871))

(assert (=> b!515903 m!496871))

(declare-fun m!496873 () Bool)

(assert (=> b!515903 m!496873))

(declare-fun m!496875 () Bool)

(assert (=> b!515907 m!496875))

(assert (=> b!515910 m!496871))

(assert (=> b!515910 m!496871))

(declare-fun m!496877 () Bool)

(assert (=> b!515910 m!496877))

(assert (=> b!515901 m!496871))

(declare-fun m!496879 () Bool)

(assert (=> b!515901 m!496879))

(declare-fun m!496881 () Bool)

(assert (=> b!515901 m!496881))

(declare-fun m!496883 () Bool)

(assert (=> b!515901 m!496883))

(declare-fun m!496885 () Bool)

(assert (=> b!515901 m!496885))

(declare-fun m!496887 () Bool)

(assert (=> b!515901 m!496887))

(assert (=> b!515901 m!496881))

(assert (=> b!515901 m!496871))

(declare-fun m!496889 () Bool)

(assert (=> b!515901 m!496889))

(assert (=> b!515901 m!496871))

(declare-fun m!496891 () Bool)

(assert (=> b!515901 m!496891))

(assert (=> b!515901 m!496881))

(declare-fun m!496893 () Bool)

(assert (=> b!515901 m!496893))

(declare-fun m!496895 () Bool)

(assert (=> b!515906 m!496895))

(assert (=> b!515906 m!496871))

(declare-fun m!496897 () Bool)

(assert (=> b!515908 m!496897))

(declare-fun m!496899 () Bool)

(assert (=> b!515904 m!496899))

(declare-fun m!496901 () Bool)

(assert (=> start!46734 m!496901))

(declare-fun m!496903 () Bool)

(assert (=> start!46734 m!496903))

(check-sat (not b!515904) (not b!515908) (not b!515911) (not b!515907) (not b!515909) (not start!46734) (not b!515910) (not b!515901) (not b!515903))
(check-sat)
