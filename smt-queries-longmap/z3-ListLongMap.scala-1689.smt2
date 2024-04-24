; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31008 () Bool)

(assert start!31008)

(declare-fun b!311814 () Bool)

(declare-fun res!168318 () Bool)

(declare-fun e!194498 () Bool)

(assert (=> b!311814 (=> (not res!168318) (not e!194498))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311814 (= res!168318 (validKeyInArray!0 k0!2441))))

(declare-fun b!311815 () Bool)

(declare-fun res!168321 () Bool)

(assert (=> b!311815 (=> (not res!168321) (not e!194498))))

(declare-datatypes ((array!15923 0))(
  ( (array!15924 (arr!7543 (Array (_ BitVec 32) (_ BitVec 64))) (size!7895 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15923)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2648 0))(
  ( (MissingZero!2648 (index!12768 (_ BitVec 32))) (Found!2648 (index!12769 (_ BitVec 32))) (Intermediate!2648 (undefined!3460 Bool) (index!12770 (_ BitVec 32)) (x!31090 (_ BitVec 32))) (Undefined!2648) (MissingVacant!2648 (index!12771 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15923 (_ BitVec 32)) SeekEntryResult!2648)

(assert (=> b!311815 (= res!168321 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2648 i!1240)))))

(declare-fun b!311816 () Bool)

(declare-fun res!168320 () Bool)

(declare-fun e!194502 () Bool)

(assert (=> b!311816 (=> (not res!168320) (not e!194502))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311816 (= res!168320 (and (= (select (arr!7543 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7895 a!3293))))))

(declare-fun b!311817 () Bool)

(declare-fun e!194501 () Bool)

(assert (=> b!311817 (= e!194502 e!194501)))

(declare-fun res!168319 () Bool)

(assert (=> b!311817 (=> (not res!168319) (not e!194501))))

(declare-fun lt!152594 () SeekEntryResult!2648)

(declare-fun lt!152595 () SeekEntryResult!2648)

(assert (=> b!311817 (= res!168319 (and (= lt!152595 lt!152594) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7543 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15923 (_ BitVec 32)) SeekEntryResult!2648)

(assert (=> b!311817 (= lt!152595 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311818 () Bool)

(assert (=> b!311818 (= e!194498 e!194502)))

(declare-fun res!168324 () Bool)

(assert (=> b!311818 (=> (not res!168324) (not e!194502))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311818 (= res!168324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152594))))

(assert (=> b!311818 (= lt!152594 (Intermediate!2648 false resIndex!52 resX!52))))

(declare-fun b!311819 () Bool)

(declare-fun res!168323 () Bool)

(assert (=> b!311819 (=> (not res!168323) (not e!194498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15923 (_ BitVec 32)) Bool)

(assert (=> b!311819 (= res!168323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311820 () Bool)

(declare-fun e!194500 () Bool)

(assert (=> b!311820 (= e!194501 (not e!194500))))

(declare-fun res!168326 () Bool)

(assert (=> b!311820 (=> res!168326 e!194500)))

(declare-fun lt!152590 () (_ BitVec 32))

(declare-fun lt!152591 () SeekEntryResult!2648)

(assert (=> b!311820 (= res!168326 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152590 #b00000000000000000000000000000000) (bvsge lt!152590 (size!7895 a!3293)) (not (= lt!152591 lt!152594))))))

(declare-fun lt!152588 () SeekEntryResult!2648)

(declare-fun lt!152593 () SeekEntryResult!2648)

(assert (=> b!311820 (= lt!152588 lt!152593)))

(declare-fun lt!152592 () array!15923)

(assert (=> b!311820 (= lt!152593 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152590 k0!2441 lt!152592 mask!3709))))

(assert (=> b!311820 (= lt!152588 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152592 mask!3709))))

(assert (=> b!311820 (= lt!152592 (array!15924 (store (arr!7543 a!3293) i!1240 k0!2441) (size!7895 a!3293)))))

(assert (=> b!311820 (= lt!152595 lt!152591)))

(assert (=> b!311820 (= lt!152591 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152590 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311820 (= lt!152590 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311821 () Bool)

(declare-fun res!168327 () Bool)

(assert (=> b!311821 (=> (not res!168327) (not e!194498))))

(assert (=> b!311821 (= res!168327 (and (= (size!7895 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7895 a!3293))))))

(declare-fun b!311822 () Bool)

(declare-fun res!168322 () Bool)

(assert (=> b!311822 (=> (not res!168322) (not e!194498))))

(declare-fun arrayContainsKey!0 (array!15923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311822 (= res!168322 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168325 () Bool)

(assert (=> start!31008 (=> (not res!168325) (not e!194498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31008 (= res!168325 (validMask!0 mask!3709))))

(assert (=> start!31008 e!194498))

(declare-fun array_inv!5493 (array!15923) Bool)

(assert (=> start!31008 (array_inv!5493 a!3293)))

(assert (=> start!31008 true))

(declare-fun b!311823 () Bool)

(assert (=> b!311823 (= e!194500 (bvsge mask!3709 #b00000000000000000000000000000000))))

(assert (=> b!311823 (= lt!152593 lt!152591)))

(declare-datatypes ((Unit!9557 0))(
  ( (Unit!9558) )
))
(declare-fun lt!152589 () Unit!9557)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9557)

(assert (=> b!311823 (= lt!152589 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152590 resIndex!52 resX!52 mask!3709))))

(assert (= (and start!31008 res!168325) b!311821))

(assert (= (and b!311821 res!168327) b!311814))

(assert (= (and b!311814 res!168318) b!311822))

(assert (= (and b!311822 res!168322) b!311815))

(assert (= (and b!311815 res!168321) b!311819))

(assert (= (and b!311819 res!168323) b!311818))

(assert (= (and b!311818 res!168324) b!311816))

(assert (= (and b!311816 res!168320) b!311817))

(assert (= (and b!311817 res!168319) b!311820))

(assert (= (and b!311820 (not res!168326)) b!311823))

(declare-fun m!322009 () Bool)

(assert (=> b!311823 m!322009))

(declare-fun m!322011 () Bool)

(assert (=> b!311820 m!322011))

(declare-fun m!322013 () Bool)

(assert (=> b!311820 m!322013))

(declare-fun m!322015 () Bool)

(assert (=> b!311820 m!322015))

(declare-fun m!322017 () Bool)

(assert (=> b!311820 m!322017))

(declare-fun m!322019 () Bool)

(assert (=> b!311820 m!322019))

(declare-fun m!322021 () Bool)

(assert (=> b!311819 m!322021))

(declare-fun m!322023 () Bool)

(assert (=> b!311822 m!322023))

(declare-fun m!322025 () Bool)

(assert (=> b!311816 m!322025))

(declare-fun m!322027 () Bool)

(assert (=> b!311815 m!322027))

(declare-fun m!322029 () Bool)

(assert (=> start!31008 m!322029))

(declare-fun m!322031 () Bool)

(assert (=> start!31008 m!322031))

(declare-fun m!322033 () Bool)

(assert (=> b!311818 m!322033))

(assert (=> b!311818 m!322033))

(declare-fun m!322035 () Bool)

(assert (=> b!311818 m!322035))

(declare-fun m!322037 () Bool)

(assert (=> b!311814 m!322037))

(declare-fun m!322039 () Bool)

(assert (=> b!311817 m!322039))

(declare-fun m!322041 () Bool)

(assert (=> b!311817 m!322041))

(check-sat (not b!311814) (not b!311819) (not b!311817) (not b!311815) (not start!31008) (not b!311823) (not b!311818) (not b!311820) (not b!311822))
(check-sat)
