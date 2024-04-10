; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31840 () Bool)

(assert start!31840)

(declare-fun b!318242 () Bool)

(declare-fun e!197766 () Bool)

(declare-fun e!197767 () Bool)

(assert (=> b!318242 (= e!197766 e!197767)))

(declare-fun res!172829 () Bool)

(assert (=> b!318242 (=> (not res!172829) (not e!197767))))

(declare-datatypes ((array!16211 0))(
  ( (array!16212 (arr!7671 (Array (_ BitVec 32) (_ BitVec 64))) (size!8023 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16211)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2811 0))(
  ( (MissingZero!2811 (index!13420 (_ BitVec 32))) (Found!2811 (index!13421 (_ BitVec 32))) (Intermediate!2811 (undefined!3623 Bool) (index!13422 (_ BitVec 32)) (x!31676 (_ BitVec 32))) (Undefined!2811) (MissingVacant!2811 (index!13423 (_ BitVec 32))) )
))
(declare-fun lt!155274 () SeekEntryResult!2811)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16211 (_ BitVec 32)) SeekEntryResult!2811)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318242 (= res!172829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155274))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318242 (= lt!155274 (Intermediate!2811 false resIndex!52 resX!52))))

(declare-fun res!172824 () Bool)

(assert (=> start!31840 (=> (not res!172824) (not e!197766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31840 (= res!172824 (validMask!0 mask!3709))))

(assert (=> start!31840 e!197766))

(declare-fun array_inv!5634 (array!16211) Bool)

(assert (=> start!31840 (array_inv!5634 a!3293)))

(assert (=> start!31840 true))

(declare-fun b!318243 () Bool)

(declare-fun res!172821 () Bool)

(assert (=> b!318243 (=> (not res!172821) (not e!197766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16211 (_ BitVec 32)) Bool)

(assert (=> b!318243 (= res!172821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318244 () Bool)

(declare-fun res!172827 () Bool)

(assert (=> b!318244 (=> (not res!172827) (not e!197766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318244 (= res!172827 (validKeyInArray!0 k0!2441))))

(declare-fun lt!155271 () array!16211)

(declare-fun lt!155273 () (_ BitVec 32))

(declare-fun b!318245 () Bool)

(declare-fun e!197768 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318245 (= e!197768 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155271 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155273 k0!2441 lt!155271 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318245 (= lt!155271 (array!16212 (store (arr!7671 a!3293) i!1240 k0!2441) (size!8023 a!3293)))))

(declare-fun b!318246 () Bool)

(declare-fun res!172826 () Bool)

(assert (=> b!318246 (=> (not res!172826) (not e!197766))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16211 (_ BitVec 32)) SeekEntryResult!2811)

(assert (=> b!318246 (= res!172826 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2811 i!1240)))))

(declare-fun b!318247 () Bool)

(declare-fun res!172822 () Bool)

(assert (=> b!318247 (=> (not res!172822) (not e!197766))))

(declare-fun arrayContainsKey!0 (array!16211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318247 (= res!172822 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318248 () Bool)

(declare-fun e!197770 () Bool)

(assert (=> b!318248 (= e!197770 (not true))))

(assert (=> b!318248 e!197768))

(declare-fun res!172823 () Bool)

(assert (=> b!318248 (=> (not res!172823) (not e!197768))))

(declare-fun lt!155272 () SeekEntryResult!2811)

(assert (=> b!318248 (= res!172823 (= lt!155272 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155273 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318248 (= lt!155273 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318249 () Bool)

(declare-fun res!172830 () Bool)

(assert (=> b!318249 (=> (not res!172830) (not e!197767))))

(assert (=> b!318249 (= res!172830 (and (= (select (arr!7671 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8023 a!3293))))))

(declare-fun b!318250 () Bool)

(declare-fun res!172825 () Bool)

(assert (=> b!318250 (=> (not res!172825) (not e!197766))))

(assert (=> b!318250 (= res!172825 (and (= (size!8023 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8023 a!3293))))))

(declare-fun b!318251 () Bool)

(assert (=> b!318251 (= e!197767 e!197770)))

(declare-fun res!172828 () Bool)

(assert (=> b!318251 (=> (not res!172828) (not e!197770))))

(assert (=> b!318251 (= res!172828 (and (= lt!155272 lt!155274) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7671 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318251 (= lt!155272 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31840 res!172824) b!318250))

(assert (= (and b!318250 res!172825) b!318244))

(assert (= (and b!318244 res!172827) b!318247))

(assert (= (and b!318247 res!172822) b!318246))

(assert (= (and b!318246 res!172826) b!318243))

(assert (= (and b!318243 res!172821) b!318242))

(assert (= (and b!318242 res!172829) b!318249))

(assert (= (and b!318249 res!172830) b!318251))

(assert (= (and b!318251 res!172828) b!318248))

(assert (= (and b!318248 res!172823) b!318245))

(declare-fun m!326929 () Bool)

(assert (=> b!318248 m!326929))

(declare-fun m!326931 () Bool)

(assert (=> b!318248 m!326931))

(declare-fun m!326933 () Bool)

(assert (=> b!318245 m!326933))

(declare-fun m!326935 () Bool)

(assert (=> b!318245 m!326935))

(declare-fun m!326937 () Bool)

(assert (=> b!318245 m!326937))

(declare-fun m!326939 () Bool)

(assert (=> b!318246 m!326939))

(declare-fun m!326941 () Bool)

(assert (=> b!318242 m!326941))

(assert (=> b!318242 m!326941))

(declare-fun m!326943 () Bool)

(assert (=> b!318242 m!326943))

(declare-fun m!326945 () Bool)

(assert (=> b!318251 m!326945))

(declare-fun m!326947 () Bool)

(assert (=> b!318251 m!326947))

(declare-fun m!326949 () Bool)

(assert (=> b!318249 m!326949))

(declare-fun m!326951 () Bool)

(assert (=> b!318244 m!326951))

(declare-fun m!326953 () Bool)

(assert (=> b!318247 m!326953))

(declare-fun m!326955 () Bool)

(assert (=> start!31840 m!326955))

(declare-fun m!326957 () Bool)

(assert (=> start!31840 m!326957))

(declare-fun m!326959 () Bool)

(assert (=> b!318243 m!326959))

(check-sat (not b!318242) (not b!318251) (not b!318247) (not b!318248) (not start!31840) (not b!318246) (not b!318244) (not b!318245) (not b!318243))
(check-sat)
