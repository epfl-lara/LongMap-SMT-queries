; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46830 () Bool)

(assert start!46830)

(declare-fun b!516786 () Bool)

(declare-fun res!316317 () Bool)

(declare-fun e!301565 () Bool)

(assert (=> b!516786 (=> (not res!316317) (not e!301565))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33095 0))(
  ( (array!33096 (arr!15914 (Array (_ BitVec 32) (_ BitVec 64))) (size!16279 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33095)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516786 (= res!316317 (and (= (size!16279 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16279 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16279 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516787 () Bool)

(declare-fun res!316318 () Bool)

(declare-fun e!301563 () Bool)

(assert (=> b!516787 (=> (not res!316318) (not e!301563))))

(declare-datatypes ((List!10111 0))(
  ( (Nil!10108) (Cons!10107 (h!11008 (_ BitVec 64)) (t!16330 List!10111)) )
))
(declare-fun arrayNoDuplicates!0 (array!33095 (_ BitVec 32) List!10111) Bool)

(assert (=> b!516787 (= res!316318 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10108))))

(declare-fun b!516788 () Bool)

(assert (=> b!516788 (= e!301565 e!301563)))

(declare-fun res!316310 () Bool)

(assert (=> b!516788 (=> (not res!316310) (not e!301563))))

(declare-datatypes ((SeekEntryResult!4378 0))(
  ( (MissingZero!4378 (index!19700 (_ BitVec 32))) (Found!4378 (index!19701 (_ BitVec 32))) (Intermediate!4378 (undefined!5190 Bool) (index!19702 (_ BitVec 32)) (x!48670 (_ BitVec 32))) (Undefined!4378) (MissingVacant!4378 (index!19703 (_ BitVec 32))) )
))
(declare-fun lt!236462 () SeekEntryResult!4378)

(assert (=> b!516788 (= res!316310 (or (= lt!236462 (MissingZero!4378 i!1204)) (= lt!236462 (MissingVacant!4378 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33095 (_ BitVec 32)) SeekEntryResult!4378)

(assert (=> b!516788 (= lt!236462 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516789 () Bool)

(declare-fun e!301564 () Bool)

(assert (=> b!516789 (= e!301564 true)))

(declare-fun lt!236464 () SeekEntryResult!4378)

(assert (=> b!516789 (and (bvslt (x!48670 lt!236464) #b01111111111111111111111111111110) (or (= (select (arr!15914 a!3235) (index!19702 lt!236464)) (select (arr!15914 a!3235) j!176)) (= (select (arr!15914 a!3235) (index!19702 lt!236464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15914 a!3235) (index!19702 lt!236464)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516790 () Bool)

(declare-fun res!316319 () Bool)

(assert (=> b!516790 (=> (not res!316319) (not e!301563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33095 (_ BitVec 32)) Bool)

(assert (=> b!516790 (= res!316319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!316315 () Bool)

(assert (=> start!46830 (=> (not res!316315) (not e!301565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46830 (= res!316315 (validMask!0 mask!3524))))

(assert (=> start!46830 e!301565))

(assert (=> start!46830 true))

(declare-fun array_inv!11797 (array!33095) Bool)

(assert (=> start!46830 (array_inv!11797 a!3235)))

(declare-fun b!516791 () Bool)

(declare-fun res!316311 () Bool)

(assert (=> b!516791 (=> (not res!316311) (not e!301565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516791 (= res!316311 (validKeyInArray!0 k0!2280))))

(declare-fun b!516792 () Bool)

(declare-fun res!316309 () Bool)

(assert (=> b!516792 (=> (not res!316309) (not e!301565))))

(assert (=> b!516792 (= res!316309 (validKeyInArray!0 (select (arr!15914 a!3235) j!176)))))

(declare-fun b!516793 () Bool)

(declare-fun res!316314 () Bool)

(assert (=> b!516793 (=> res!316314 e!301564)))

(get-info :version)

(assert (=> b!516793 (= res!316314 (or (undefined!5190 lt!236464) (not ((_ is Intermediate!4378) lt!236464))))))

(declare-fun b!516794 () Bool)

(assert (=> b!516794 (= e!301563 (not e!301564))))

(declare-fun res!316316 () Bool)

(assert (=> b!516794 (=> res!316316 e!301564)))

(declare-fun lt!236463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33095 (_ BitVec 32)) SeekEntryResult!4378)

(assert (=> b!516794 (= res!316316 (= lt!236464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236463 (select (store (arr!15914 a!3235) i!1204 k0!2280) j!176) (array!33096 (store (arr!15914 a!3235) i!1204 k0!2280) (size!16279 a!3235)) mask!3524)))))

(declare-fun lt!236461 () (_ BitVec 32))

(assert (=> b!516794 (= lt!236464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236461 (select (arr!15914 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516794 (= lt!236463 (toIndex!0 (select (store (arr!15914 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516794 (= lt!236461 (toIndex!0 (select (arr!15914 a!3235) j!176) mask!3524))))

(declare-fun e!301562 () Bool)

(assert (=> b!516794 e!301562))

(declare-fun res!316313 () Bool)

(assert (=> b!516794 (=> (not res!316313) (not e!301562))))

(assert (=> b!516794 (= res!316313 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16000 0))(
  ( (Unit!16001) )
))
(declare-fun lt!236460 () Unit!16000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16000)

(assert (=> b!516794 (= lt!236460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516795 () Bool)

(assert (=> b!516795 (= e!301562 (= (seekEntryOrOpen!0 (select (arr!15914 a!3235) j!176) a!3235 mask!3524) (Found!4378 j!176)))))

(declare-fun b!516796 () Bool)

(declare-fun res!316312 () Bool)

(assert (=> b!516796 (=> (not res!316312) (not e!301565))))

(declare-fun arrayContainsKey!0 (array!33095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516796 (= res!316312 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46830 res!316315) b!516786))

(assert (= (and b!516786 res!316317) b!516792))

(assert (= (and b!516792 res!316309) b!516791))

(assert (= (and b!516791 res!316311) b!516796))

(assert (= (and b!516796 res!316312) b!516788))

(assert (= (and b!516788 res!316310) b!516790))

(assert (= (and b!516790 res!316319) b!516787))

(assert (= (and b!516787 res!316318) b!516794))

(assert (= (and b!516794 res!316313) b!516795))

(assert (= (and b!516794 (not res!316316)) b!516793))

(assert (= (and b!516793 (not res!316314)) b!516789))

(declare-fun m!497755 () Bool)

(assert (=> b!516796 m!497755))

(declare-fun m!497757 () Bool)

(assert (=> b!516792 m!497757))

(assert (=> b!516792 m!497757))

(declare-fun m!497759 () Bool)

(assert (=> b!516792 m!497759))

(assert (=> b!516795 m!497757))

(assert (=> b!516795 m!497757))

(declare-fun m!497761 () Bool)

(assert (=> b!516795 m!497761))

(declare-fun m!497763 () Bool)

(assert (=> b!516794 m!497763))

(declare-fun m!497765 () Bool)

(assert (=> b!516794 m!497765))

(declare-fun m!497767 () Bool)

(assert (=> b!516794 m!497767))

(assert (=> b!516794 m!497757))

(declare-fun m!497769 () Bool)

(assert (=> b!516794 m!497769))

(assert (=> b!516794 m!497757))

(declare-fun m!497771 () Bool)

(assert (=> b!516794 m!497771))

(assert (=> b!516794 m!497767))

(declare-fun m!497773 () Bool)

(assert (=> b!516794 m!497773))

(assert (=> b!516794 m!497767))

(declare-fun m!497775 () Bool)

(assert (=> b!516794 m!497775))

(assert (=> b!516794 m!497757))

(declare-fun m!497777 () Bool)

(assert (=> b!516794 m!497777))

(declare-fun m!497779 () Bool)

(assert (=> b!516791 m!497779))

(declare-fun m!497781 () Bool)

(assert (=> b!516789 m!497781))

(assert (=> b!516789 m!497757))

(declare-fun m!497783 () Bool)

(assert (=> b!516787 m!497783))

(declare-fun m!497785 () Bool)

(assert (=> start!46830 m!497785))

(declare-fun m!497787 () Bool)

(assert (=> start!46830 m!497787))

(declare-fun m!497789 () Bool)

(assert (=> b!516788 m!497789))

(declare-fun m!497791 () Bool)

(assert (=> b!516790 m!497791))

(check-sat (not b!516788) (not b!516794) (not b!516790) (not b!516791) (not b!516795) (not b!516796) (not b!516787) (not start!46830) (not b!516792))
(check-sat)
