; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31842 () Bool)

(assert start!31842)

(declare-fun b!318272 () Bool)

(declare-fun res!172860 () Bool)

(declare-fun e!197782 () Bool)

(assert (=> b!318272 (=> (not res!172860) (not e!197782))))

(declare-datatypes ((array!16213 0))(
  ( (array!16214 (arr!7672 (Array (_ BitVec 32) (_ BitVec 64))) (size!8024 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16213)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318272 (= res!172860 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318273 () Bool)

(declare-fun res!172855 () Bool)

(assert (=> b!318273 (=> (not res!172855) (not e!197782))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16213 (_ BitVec 32)) Bool)

(assert (=> b!318273 (= res!172855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318274 () Bool)

(declare-fun res!172854 () Bool)

(assert (=> b!318274 (=> (not res!172854) (not e!197782))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318274 (= res!172854 (and (= (size!8024 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8024 a!3293))))))

(declare-fun b!318275 () Bool)

(declare-fun res!172852 () Bool)

(assert (=> b!318275 (=> (not res!172852) (not e!197782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318275 (= res!172852 (validKeyInArray!0 k!2441))))

(declare-fun res!172851 () Bool)

(assert (=> start!31842 (=> (not res!172851) (not e!197782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31842 (= res!172851 (validMask!0 mask!3709))))

(assert (=> start!31842 e!197782))

(declare-fun array_inv!5635 (array!16213) Bool)

(assert (=> start!31842 (array_inv!5635 a!3293)))

(assert (=> start!31842 true))

(declare-fun b!318276 () Bool)

(declare-fun e!197784 () Bool)

(declare-fun e!197785 () Bool)

(assert (=> b!318276 (= e!197784 e!197785)))

(declare-fun res!172857 () Bool)

(assert (=> b!318276 (=> (not res!172857) (not e!197785))))

(declare-datatypes ((SeekEntryResult!2812 0))(
  ( (MissingZero!2812 (index!13424 (_ BitVec 32))) (Found!2812 (index!13425 (_ BitVec 32))) (Intermediate!2812 (undefined!3624 Bool) (index!13426 (_ BitVec 32)) (x!31677 (_ BitVec 32))) (Undefined!2812) (MissingVacant!2812 (index!13427 (_ BitVec 32))) )
))
(declare-fun lt!155284 () SeekEntryResult!2812)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!155283 () SeekEntryResult!2812)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318276 (= res!172857 (and (= lt!155284 lt!155283) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7672 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16213 (_ BitVec 32)) SeekEntryResult!2812)

(assert (=> b!318276 (= lt!155284 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318277 () Bool)

(declare-fun res!172859 () Bool)

(assert (=> b!318277 (=> (not res!172859) (not e!197784))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318277 (= res!172859 (and (= (select (arr!7672 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8024 a!3293))))))

(declare-fun b!318278 () Bool)

(declare-fun res!172856 () Bool)

(assert (=> b!318278 (=> (not res!172856) (not e!197782))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16213 (_ BitVec 32)) SeekEntryResult!2812)

(assert (=> b!318278 (= res!172856 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2812 i!1240)))))

(declare-fun b!318279 () Bool)

(assert (=> b!318279 (= e!197785 (not true))))

(declare-fun e!197781 () Bool)

(assert (=> b!318279 e!197781))

(declare-fun res!172858 () Bool)

(assert (=> b!318279 (=> (not res!172858) (not e!197781))))

(declare-fun lt!155285 () (_ BitVec 32))

(assert (=> b!318279 (= res!172858 (= lt!155284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155285 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318279 (= lt!155285 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318280 () Bool)

(assert (=> b!318280 (= e!197782 e!197784)))

(declare-fun res!172853 () Bool)

(assert (=> b!318280 (=> (not res!172853) (not e!197784))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318280 (= res!172853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155283))))

(assert (=> b!318280 (= lt!155283 (Intermediate!2812 false resIndex!52 resX!52))))

(declare-fun lt!155286 () array!16213)

(declare-fun b!318281 () Bool)

(assert (=> b!318281 (= e!197781 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155286 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155285 k!2441 lt!155286 mask!3709)))))

(assert (=> b!318281 (= lt!155286 (array!16214 (store (arr!7672 a!3293) i!1240 k!2441) (size!8024 a!3293)))))

(assert (= (and start!31842 res!172851) b!318274))

(assert (= (and b!318274 res!172854) b!318275))

(assert (= (and b!318275 res!172852) b!318272))

(assert (= (and b!318272 res!172860) b!318278))

(assert (= (and b!318278 res!172856) b!318273))

(assert (= (and b!318273 res!172855) b!318280))

(assert (= (and b!318280 res!172853) b!318277))

(assert (= (and b!318277 res!172859) b!318276))

(assert (= (and b!318276 res!172857) b!318279))

(assert (= (and b!318279 res!172858) b!318281))

(declare-fun m!326961 () Bool)

(assert (=> b!318272 m!326961))

(declare-fun m!326963 () Bool)

(assert (=> b!318279 m!326963))

(declare-fun m!326965 () Bool)

(assert (=> b!318279 m!326965))

(declare-fun m!326967 () Bool)

(assert (=> b!318273 m!326967))

(declare-fun m!326969 () Bool)

(assert (=> b!318280 m!326969))

(assert (=> b!318280 m!326969))

(declare-fun m!326971 () Bool)

(assert (=> b!318280 m!326971))

(declare-fun m!326973 () Bool)

(assert (=> b!318281 m!326973))

(declare-fun m!326975 () Bool)

(assert (=> b!318281 m!326975))

(declare-fun m!326977 () Bool)

(assert (=> b!318281 m!326977))

(declare-fun m!326979 () Bool)

(assert (=> b!318278 m!326979))

(declare-fun m!326981 () Bool)

(assert (=> b!318277 m!326981))

(declare-fun m!326983 () Bool)

(assert (=> b!318276 m!326983))

(declare-fun m!326985 () Bool)

(assert (=> b!318276 m!326985))

(declare-fun m!326987 () Bool)

(assert (=> start!31842 m!326987))

(declare-fun m!326989 () Bool)

(assert (=> start!31842 m!326989))

(declare-fun m!326991 () Bool)

(assert (=> b!318275 m!326991))

(push 1)

(assert (not b!318281))

(assert (not start!31842))

