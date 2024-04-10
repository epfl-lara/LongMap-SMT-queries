; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31838 () Bool)

(assert start!31838)

(declare-fun b!318212 () Bool)

(declare-fun res!172800 () Bool)

(declare-fun e!197755 () Bool)

(assert (=> b!318212 (=> (not res!172800) (not e!197755))))

(declare-datatypes ((array!16209 0))(
  ( (array!16210 (arr!7670 (Array (_ BitVec 32) (_ BitVec 64))) (size!8022 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16209)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318212 (= res!172800 (and (= (select (arr!7670 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8022 a!3293))))))

(declare-fun b!318214 () Bool)

(declare-fun e!197753 () Bool)

(assert (=> b!318214 (= e!197755 e!197753)))

(declare-fun res!172794 () Bool)

(assert (=> b!318214 (=> (not res!172794) (not e!197753))))

(declare-datatypes ((SeekEntryResult!2810 0))(
  ( (MissingZero!2810 (index!13416 (_ BitVec 32))) (Found!2810 (index!13417 (_ BitVec 32))) (Intermediate!2810 (undefined!3622 Bool) (index!13418 (_ BitVec 32)) (x!31675 (_ BitVec 32))) (Undefined!2810) (MissingVacant!2810 (index!13419 (_ BitVec 32))) )
))
(declare-fun lt!155261 () SeekEntryResult!2810)

(declare-fun lt!155260 () SeekEntryResult!2810)

(declare-fun k!2441 () (_ BitVec 64))

(assert (=> b!318214 (= res!172794 (and (= lt!155261 lt!155260) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7670 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16209 (_ BitVec 32)) SeekEntryResult!2810)

(assert (=> b!318214 (= lt!155261 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318215 () Bool)

(declare-fun res!172791 () Bool)

(declare-fun e!197751 () Bool)

(assert (=> b!318215 (=> (not res!172791) (not e!197751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16209 (_ BitVec 32)) Bool)

(assert (=> b!318215 (= res!172791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318216 () Bool)

(declare-fun res!172799 () Bool)

(assert (=> b!318216 (=> (not res!172799) (not e!197751))))

(declare-fun arrayContainsKey!0 (array!16209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318216 (= res!172799 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318217 () Bool)

(declare-fun res!172795 () Bool)

(assert (=> b!318217 (=> (not res!172795) (not e!197751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318217 (= res!172795 (validKeyInArray!0 k!2441))))

(declare-fun res!172798 () Bool)

(assert (=> start!31838 (=> (not res!172798) (not e!197751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31838 (= res!172798 (validMask!0 mask!3709))))

(assert (=> start!31838 e!197751))

(declare-fun array_inv!5633 (array!16209) Bool)

(assert (=> start!31838 (array_inv!5633 a!3293)))

(assert (=> start!31838 true))

(declare-fun b!318213 () Bool)

(assert (=> b!318213 (= e!197751 e!197755)))

(declare-fun res!172793 () Bool)

(assert (=> b!318213 (=> (not res!172793) (not e!197755))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318213 (= res!172793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155260))))

(assert (=> b!318213 (= lt!155260 (Intermediate!2810 false resIndex!52 resX!52))))

(declare-fun b!318218 () Bool)

(declare-fun res!172797 () Bool)

(assert (=> b!318218 (=> (not res!172797) (not e!197751))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16209 (_ BitVec 32)) SeekEntryResult!2810)

(assert (=> b!318218 (= res!172797 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2810 i!1240)))))

(declare-fun e!197752 () Bool)

(declare-fun lt!155259 () (_ BitVec 32))

(declare-fun b!318219 () Bool)

(declare-fun lt!155262 () array!16209)

(assert (=> b!318219 (= e!197752 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155262 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155259 k!2441 lt!155262 mask!3709)))))

(assert (=> b!318219 (= lt!155262 (array!16210 (store (arr!7670 a!3293) i!1240 k!2441) (size!8022 a!3293)))))

(declare-fun b!318220 () Bool)

(assert (=> b!318220 (= e!197753 (not true))))

(assert (=> b!318220 e!197752))

(declare-fun res!172796 () Bool)

(assert (=> b!318220 (=> (not res!172796) (not e!197752))))

(assert (=> b!318220 (= res!172796 (= lt!155261 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155259 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318220 (= lt!155259 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318221 () Bool)

(declare-fun res!172792 () Bool)

(assert (=> b!318221 (=> (not res!172792) (not e!197751))))

(assert (=> b!318221 (= res!172792 (and (= (size!8022 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8022 a!3293))))))

(assert (= (and start!31838 res!172798) b!318221))

(assert (= (and b!318221 res!172792) b!318217))

(assert (= (and b!318217 res!172795) b!318216))

(assert (= (and b!318216 res!172799) b!318218))

(assert (= (and b!318218 res!172797) b!318215))

(assert (= (and b!318215 res!172791) b!318213))

(assert (= (and b!318213 res!172793) b!318212))

(assert (= (and b!318212 res!172800) b!318214))

(assert (= (and b!318214 res!172794) b!318220))

(assert (= (and b!318220 res!172796) b!318219))

(declare-fun m!326897 () Bool)

(assert (=> b!318217 m!326897))

(declare-fun m!326899 () Bool)

(assert (=> b!318215 m!326899))

(declare-fun m!326901 () Bool)

(assert (=> b!318216 m!326901))

(declare-fun m!326903 () Bool)

(assert (=> b!318212 m!326903))

(declare-fun m!326905 () Bool)

(assert (=> b!318218 m!326905))

(declare-fun m!326907 () Bool)

(assert (=> start!31838 m!326907))

(declare-fun m!326909 () Bool)

(assert (=> start!31838 m!326909))

(declare-fun m!326911 () Bool)

(assert (=> b!318219 m!326911))

(declare-fun m!326913 () Bool)

(assert (=> b!318219 m!326913))

(declare-fun m!326915 () Bool)

(assert (=> b!318219 m!326915))

(declare-fun m!326917 () Bool)

(assert (=> b!318220 m!326917))

(declare-fun m!326919 () Bool)

(assert (=> b!318220 m!326919))

(declare-fun m!326921 () Bool)

(assert (=> b!318214 m!326921))

(declare-fun m!326923 () Bool)

(assert (=> b!318214 m!326923))

(declare-fun m!326925 () Bool)

(assert (=> b!318213 m!326925))

(assert (=> b!318213 m!326925))

(declare-fun m!326927 () Bool)

(assert (=> b!318213 m!326927))

(push 1)

