; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32394 () Bool)

(assert start!32394)

(declare-fun b!323060 () Bool)

(declare-fun res!176747 () Bool)

(declare-fun e!199790 () Bool)

(assert (=> b!323060 (=> (not res!176747) (not e!199790))))

(declare-datatypes ((array!16533 0))(
  ( (array!16534 (arr!7824 (Array (_ BitVec 32) (_ BitVec 64))) (size!8176 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16533)

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2955 0))(
  ( (MissingZero!2955 (index!13996 (_ BitVec 32))) (Found!2955 (index!13997 (_ BitVec 32))) (Intermediate!2955 (undefined!3767 Bool) (index!13998 (_ BitVec 32)) (x!32255 (_ BitVec 32))) (Undefined!2955) (MissingVacant!2955 (index!13999 (_ BitVec 32))) )
))
(declare-fun lt!156566 () SeekEntryResult!2955)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16533 (_ BitVec 32)) SeekEntryResult!2955)

(assert (=> b!323060 (= res!176747 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156566))))

(declare-fun b!323061 () Bool)

(declare-datatypes ((Unit!9948 0))(
  ( (Unit!9949) )
))
(declare-fun e!199793 () Unit!9948)

(declare-fun e!199794 () Unit!9948)

(assert (=> b!323061 (= e!199793 e!199794)))

(declare-fun c!50790 () Bool)

(assert (=> b!323061 (= c!50790 (or (= (select (arr!7824 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7824 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323062 () Bool)

(declare-fun e!199792 () Unit!9948)

(declare-fun Unit!9950 () Unit!9948)

(assert (=> b!323062 (= e!199792 Unit!9950)))

(assert (=> b!323062 false))

(declare-fun b!323063 () Bool)

(assert (=> b!323063 (= e!199790 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323063 (= index!1840 resIndex!58)))

(declare-fun lt!156567 () Unit!9948)

(assert (=> b!323063 (= lt!156567 e!199793)))

(declare-fun c!50788 () Bool)

(assert (=> b!323063 (= c!50788 (not (= resIndex!58 index!1840)))))

(declare-fun b!323064 () Bool)

(declare-fun res!176748 () Bool)

(declare-fun e!199791 () Bool)

(assert (=> b!323064 (=> (not res!176748) (not e!199791))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16533 (_ BitVec 32)) SeekEntryResult!2955)

(assert (=> b!323064 (= res!176748 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2955 i!1250)))))

(declare-fun b!323065 () Bool)

(declare-fun res!176740 () Bool)

(assert (=> b!323065 (=> (not res!176740) (not e!199790))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323065 (= res!176740 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7824 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323066 () Bool)

(assert (=> b!323066 false))

(declare-fun Unit!9951 () Unit!9948)

(assert (=> b!323066 (= e!199794 Unit!9951)))

(declare-fun b!323067 () Bool)

(declare-fun res!176745 () Bool)

(assert (=> b!323067 (=> (not res!176745) (not e!199791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323067 (= res!176745 (validKeyInArray!0 k0!2497))))

(declare-fun b!323068 () Bool)

(declare-fun Unit!9952 () Unit!9948)

(assert (=> b!323068 (= e!199793 Unit!9952)))

(declare-fun res!176742 () Bool)

(assert (=> start!32394 (=> (not res!176742) (not e!199791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32394 (= res!176742 (validMask!0 mask!3777))))

(assert (=> start!32394 e!199791))

(declare-fun array_inv!5787 (array!16533) Bool)

(assert (=> start!32394 (array_inv!5787 a!3305)))

(assert (=> start!32394 true))

(declare-fun b!323069 () Bool)

(declare-fun res!176741 () Bool)

(assert (=> b!323069 (=> (not res!176741) (not e!199791))))

(assert (=> b!323069 (= res!176741 (and (= (size!8176 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8176 a!3305))))))

(declare-fun b!323070 () Bool)

(declare-fun Unit!9953 () Unit!9948)

(assert (=> b!323070 (= e!199792 Unit!9953)))

(declare-fun b!323071 () Bool)

(declare-fun res!176743 () Bool)

(assert (=> b!323071 (=> (not res!176743) (not e!199791))))

(declare-fun arrayContainsKey!0 (array!16533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323071 (= res!176743 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323072 () Bool)

(assert (=> b!323072 false))

(declare-fun lt!156565 () Unit!9948)

(assert (=> b!323072 (= lt!156565 e!199792)))

(declare-fun c!50789 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323072 (= c!50789 ((_ is Intermediate!2955) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9954 () Unit!9948)

(assert (=> b!323072 (= e!199794 Unit!9954)))

(declare-fun b!323073 () Bool)

(assert (=> b!323073 (= e!199791 e!199790)))

(declare-fun res!176739 () Bool)

(assert (=> b!323073 (=> (not res!176739) (not e!199790))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323073 (= res!176739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156566))))

(assert (=> b!323073 (= lt!156566 (Intermediate!2955 false resIndex!58 resX!58))))

(declare-fun b!323074 () Bool)

(declare-fun res!176744 () Bool)

(assert (=> b!323074 (=> (not res!176744) (not e!199790))))

(assert (=> b!323074 (= res!176744 (and (= (select (arr!7824 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8176 a!3305))))))

(declare-fun b!323075 () Bool)

(declare-fun res!176746 () Bool)

(assert (=> b!323075 (=> (not res!176746) (not e!199791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16533 (_ BitVec 32)) Bool)

(assert (=> b!323075 (= res!176746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32394 res!176742) b!323069))

(assert (= (and b!323069 res!176741) b!323067))

(assert (= (and b!323067 res!176745) b!323071))

(assert (= (and b!323071 res!176743) b!323064))

(assert (= (and b!323064 res!176748) b!323075))

(assert (= (and b!323075 res!176746) b!323073))

(assert (= (and b!323073 res!176739) b!323074))

(assert (= (and b!323074 res!176744) b!323060))

(assert (= (and b!323060 res!176747) b!323065))

(assert (= (and b!323065 res!176740) b!323063))

(assert (= (and b!323063 c!50788) b!323061))

(assert (= (and b!323063 (not c!50788)) b!323068))

(assert (= (and b!323061 c!50790) b!323066))

(assert (= (and b!323061 (not c!50790)) b!323072))

(assert (= (and b!323072 c!50789) b!323070))

(assert (= (and b!323072 (not c!50789)) b!323062))

(declare-fun m!330613 () Bool)

(assert (=> b!323073 m!330613))

(assert (=> b!323073 m!330613))

(declare-fun m!330615 () Bool)

(assert (=> b!323073 m!330615))

(declare-fun m!330617 () Bool)

(assert (=> start!32394 m!330617))

(declare-fun m!330619 () Bool)

(assert (=> start!32394 m!330619))

(declare-fun m!330621 () Bool)

(assert (=> b!323061 m!330621))

(declare-fun m!330623 () Bool)

(assert (=> b!323074 m!330623))

(declare-fun m!330625 () Bool)

(assert (=> b!323067 m!330625))

(declare-fun m!330627 () Bool)

(assert (=> b!323072 m!330627))

(assert (=> b!323072 m!330627))

(declare-fun m!330629 () Bool)

(assert (=> b!323072 m!330629))

(declare-fun m!330631 () Bool)

(assert (=> b!323060 m!330631))

(declare-fun m!330633 () Bool)

(assert (=> b!323064 m!330633))

(assert (=> b!323065 m!330621))

(declare-fun m!330635 () Bool)

(assert (=> b!323071 m!330635))

(declare-fun m!330637 () Bool)

(assert (=> b!323075 m!330637))

(check-sat (not b!323072) (not b!323060) (not b!323067) (not b!323073) (not b!323075) (not b!323064) (not start!32394) (not b!323071))
(check-sat)
