; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31908 () Bool)

(assert start!31908)

(declare-fun b!318906 () Bool)

(declare-fun res!173340 () Bool)

(declare-fun e!198121 () Bool)

(assert (=> b!318906 (=> (not res!173340) (not e!198121))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318906 (= res!173340 (validKeyInArray!0 k0!2441))))

(declare-fun b!318907 () Bool)

(declare-fun res!173343 () Bool)

(assert (=> b!318907 (=> (not res!173343) (not e!198121))))

(declare-datatypes ((array!16241 0))(
  ( (array!16242 (arr!7684 (Array (_ BitVec 32) (_ BitVec 64))) (size!8036 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16241)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16241 (_ BitVec 32)) Bool)

(assert (=> b!318907 (= res!173343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318908 () Bool)

(declare-fun e!198120 () Bool)

(declare-fun e!198123 () Bool)

(assert (=> b!318908 (= e!198120 e!198123)))

(declare-fun res!173348 () Bool)

(assert (=> b!318908 (=> (not res!173348) (not e!198123))))

(declare-datatypes ((SeekEntryResult!2789 0))(
  ( (MissingZero!2789 (index!13332 (_ BitVec 32))) (Found!2789 (index!13333 (_ BitVec 32))) (Intermediate!2789 (undefined!3601 Bool) (index!13334 (_ BitVec 32)) (x!31700 (_ BitVec 32))) (Undefined!2789) (MissingVacant!2789 (index!13335 (_ BitVec 32))) )
))
(declare-fun lt!155582 () SeekEntryResult!2789)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155583 () SeekEntryResult!2789)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318908 (= res!173348 (and (= lt!155583 lt!155582) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7684 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16241 (_ BitVec 32)) SeekEntryResult!2789)

(assert (=> b!318908 (= lt!155583 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!173346 () Bool)

(assert (=> start!31908 (=> (not res!173346) (not e!198121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31908 (= res!173346 (validMask!0 mask!3709))))

(assert (=> start!31908 e!198121))

(declare-fun array_inv!5634 (array!16241) Bool)

(assert (=> start!31908 (array_inv!5634 a!3293)))

(assert (=> start!31908 true))

(declare-fun lt!155585 () (_ BitVec 32))

(declare-fun lt!155584 () array!16241)

(declare-fun e!198122 () Bool)

(declare-fun b!318909 () Bool)

(assert (=> b!318909 (= e!198122 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155584 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155585 k0!2441 lt!155584 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318909 (= lt!155584 (array!16242 (store (arr!7684 a!3293) i!1240 k0!2441) (size!8036 a!3293)))))

(declare-fun b!318910 () Bool)

(declare-fun res!173347 () Bool)

(assert (=> b!318910 (=> (not res!173347) (not e!198121))))

(declare-fun arrayContainsKey!0 (array!16241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318910 (= res!173347 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318911 () Bool)

(declare-fun res!173349 () Bool)

(assert (=> b!318911 (=> (not res!173349) (not e!198121))))

(assert (=> b!318911 (= res!173349 (and (= (size!8036 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8036 a!3293))))))

(declare-fun b!318912 () Bool)

(assert (=> b!318912 (= e!198121 e!198120)))

(declare-fun res!173345 () Bool)

(assert (=> b!318912 (=> (not res!173345) (not e!198120))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318912 (= res!173345 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155582))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318912 (= lt!155582 (Intermediate!2789 false resIndex!52 resX!52))))

(declare-fun b!318913 () Bool)

(declare-fun lt!155586 () SeekEntryResult!2789)

(assert (=> b!318913 (= e!198123 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155585 #b00000000000000000000000000000000) (bvsge lt!155585 (size!8036 a!3293)) (= lt!155586 lt!155582))))))

(assert (=> b!318913 e!198122))

(declare-fun res!173341 () Bool)

(assert (=> b!318913 (=> (not res!173341) (not e!198122))))

(assert (=> b!318913 (= res!173341 (= lt!155583 lt!155586))))

(assert (=> b!318913 (= lt!155586 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155585 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318913 (= lt!155585 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!318914 () Bool)

(declare-fun res!173342 () Bool)

(assert (=> b!318914 (=> (not res!173342) (not e!198121))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16241 (_ BitVec 32)) SeekEntryResult!2789)

(assert (=> b!318914 (= res!173342 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2789 i!1240)))))

(declare-fun b!318915 () Bool)

(declare-fun res!173344 () Bool)

(assert (=> b!318915 (=> (not res!173344) (not e!198120))))

(assert (=> b!318915 (= res!173344 (and (= (select (arr!7684 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8036 a!3293))))))

(assert (= (and start!31908 res!173346) b!318911))

(assert (= (and b!318911 res!173349) b!318906))

(assert (= (and b!318906 res!173340) b!318910))

(assert (= (and b!318910 res!173347) b!318914))

(assert (= (and b!318914 res!173342) b!318907))

(assert (= (and b!318907 res!173343) b!318912))

(assert (= (and b!318912 res!173345) b!318915))

(assert (= (and b!318915 res!173344) b!318908))

(assert (= (and b!318908 res!173348) b!318913))

(assert (= (and b!318913 res!173341) b!318909))

(declare-fun m!327727 () Bool)

(assert (=> start!31908 m!327727))

(declare-fun m!327729 () Bool)

(assert (=> start!31908 m!327729))

(declare-fun m!327731 () Bool)

(assert (=> b!318910 m!327731))

(declare-fun m!327733 () Bool)

(assert (=> b!318906 m!327733))

(declare-fun m!327735 () Bool)

(assert (=> b!318908 m!327735))

(declare-fun m!327737 () Bool)

(assert (=> b!318908 m!327737))

(declare-fun m!327739 () Bool)

(assert (=> b!318915 m!327739))

(declare-fun m!327741 () Bool)

(assert (=> b!318907 m!327741))

(declare-fun m!327743 () Bool)

(assert (=> b!318909 m!327743))

(declare-fun m!327745 () Bool)

(assert (=> b!318909 m!327745))

(declare-fun m!327747 () Bool)

(assert (=> b!318909 m!327747))

(declare-fun m!327749 () Bool)

(assert (=> b!318912 m!327749))

(assert (=> b!318912 m!327749))

(declare-fun m!327751 () Bool)

(assert (=> b!318912 m!327751))

(declare-fun m!327753 () Bool)

(assert (=> b!318914 m!327753))

(declare-fun m!327755 () Bool)

(assert (=> b!318913 m!327755))

(declare-fun m!327757 () Bool)

(assert (=> b!318913 m!327757))

(check-sat (not b!318909) (not b!318914) (not b!318910) (not b!318907) (not b!318913) (not start!31908) (not b!318906) (not b!318912) (not b!318908))
(check-sat)
