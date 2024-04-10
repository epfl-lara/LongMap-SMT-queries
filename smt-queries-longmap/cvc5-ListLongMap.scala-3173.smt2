; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44664 () Bool)

(assert start!44664)

(declare-fun b!490056 () Bool)

(declare-fun e!288137 () Bool)

(declare-fun e!288135 () Bool)

(assert (=> b!490056 (= e!288137 e!288135)))

(declare-fun res!292997 () Bool)

(assert (=> b!490056 (=> (not res!292997) (not e!288135))))

(declare-datatypes ((SeekEntryResult!3716 0))(
  ( (MissingZero!3716 (index!17043 (_ BitVec 32))) (Found!3716 (index!17044 (_ BitVec 32))) (Intermediate!3716 (undefined!4528 Bool) (index!17045 (_ BitVec 32)) (x!46150 (_ BitVec 32))) (Undefined!3716) (MissingVacant!3716 (index!17046 (_ BitVec 32))) )
))
(declare-fun lt!221242 () SeekEntryResult!3716)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490056 (= res!292997 (or (= lt!221242 (MissingZero!3716 i!1204)) (= lt!221242 (MissingVacant!3716 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31723 0))(
  ( (array!31724 (arr!15249 (Array (_ BitVec 32) (_ BitVec 64))) (size!15613 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31723)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31723 (_ BitVec 32)) SeekEntryResult!3716)

(assert (=> b!490056 (= lt!221242 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490057 () Bool)

(declare-fun res!292995 () Bool)

(assert (=> b!490057 (=> (not res!292995) (not e!288137))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490057 (= res!292995 (validKeyInArray!0 (select (arr!15249 a!3235) j!176)))))

(declare-fun b!490058 () Bool)

(assert (=> b!490058 (= e!288135 (not true))))

(declare-fun lt!221237 () SeekEntryResult!3716)

(declare-fun lt!221238 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31723 (_ BitVec 32)) SeekEntryResult!3716)

(assert (=> b!490058 (= lt!221237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221238 (select (store (arr!15249 a!3235) i!1204 k!2280) j!176) (array!31724 (store (arr!15249 a!3235) i!1204 k!2280) (size!15613 a!3235)) mask!3524))))

(declare-fun lt!221239 () (_ BitVec 32))

(declare-fun lt!221241 () SeekEntryResult!3716)

(assert (=> b!490058 (= lt!221241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221239 (select (arr!15249 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490058 (= lt!221238 (toIndex!0 (select (store (arr!15249 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490058 (= lt!221239 (toIndex!0 (select (arr!15249 a!3235) j!176) mask!3524))))

(declare-fun e!288136 () Bool)

(assert (=> b!490058 e!288136))

(declare-fun res!292996 () Bool)

(assert (=> b!490058 (=> (not res!292996) (not e!288136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31723 (_ BitVec 32)) Bool)

(assert (=> b!490058 (= res!292996 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14378 0))(
  ( (Unit!14379) )
))
(declare-fun lt!221240 () Unit!14378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14378)

(assert (=> b!490058 (= lt!221240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490059 () Bool)

(declare-fun res!293000 () Bool)

(assert (=> b!490059 (=> (not res!293000) (not e!288137))))

(declare-fun arrayContainsKey!0 (array!31723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490059 (= res!293000 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490060 () Bool)

(declare-fun res!292999 () Bool)

(assert (=> b!490060 (=> (not res!292999) (not e!288135))))

(assert (=> b!490060 (= res!292999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!292998 () Bool)

(assert (=> start!44664 (=> (not res!292998) (not e!288137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44664 (= res!292998 (validMask!0 mask!3524))))

(assert (=> start!44664 e!288137))

(assert (=> start!44664 true))

(declare-fun array_inv!11045 (array!31723) Bool)

(assert (=> start!44664 (array_inv!11045 a!3235)))

(declare-fun b!490061 () Bool)

(assert (=> b!490061 (= e!288136 (= (seekEntryOrOpen!0 (select (arr!15249 a!3235) j!176) a!3235 mask!3524) (Found!3716 j!176)))))

(declare-fun b!490062 () Bool)

(declare-fun res!292993 () Bool)

(assert (=> b!490062 (=> (not res!292993) (not e!288135))))

(declare-datatypes ((List!9407 0))(
  ( (Nil!9404) (Cons!9403 (h!10265 (_ BitVec 64)) (t!15635 List!9407)) )
))
(declare-fun arrayNoDuplicates!0 (array!31723 (_ BitVec 32) List!9407) Bool)

(assert (=> b!490062 (= res!292993 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9404))))

(declare-fun b!490063 () Bool)

(declare-fun res!292994 () Bool)

(assert (=> b!490063 (=> (not res!292994) (not e!288137))))

(assert (=> b!490063 (= res!292994 (validKeyInArray!0 k!2280))))

(declare-fun b!490064 () Bool)

(declare-fun res!292992 () Bool)

(assert (=> b!490064 (=> (not res!292992) (not e!288137))))

(assert (=> b!490064 (= res!292992 (and (= (size!15613 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15613 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15613 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44664 res!292998) b!490064))

(assert (= (and b!490064 res!292992) b!490057))

(assert (= (and b!490057 res!292995) b!490063))

(assert (= (and b!490063 res!292994) b!490059))

(assert (= (and b!490059 res!293000) b!490056))

(assert (= (and b!490056 res!292997) b!490060))

(assert (= (and b!490060 res!292999) b!490062))

(assert (= (and b!490062 res!292993) b!490058))

(assert (= (and b!490058 res!292996) b!490061))

(declare-fun m!470037 () Bool)

(assert (=> b!490060 m!470037))

(declare-fun m!470039 () Bool)

(assert (=> b!490058 m!470039))

(declare-fun m!470041 () Bool)

(assert (=> b!490058 m!470041))

(declare-fun m!470043 () Bool)

(assert (=> b!490058 m!470043))

(declare-fun m!470045 () Bool)

(assert (=> b!490058 m!470045))

(declare-fun m!470047 () Bool)

(assert (=> b!490058 m!470047))

(declare-fun m!470049 () Bool)

(assert (=> b!490058 m!470049))

(assert (=> b!490058 m!470045))

(assert (=> b!490058 m!470041))

(declare-fun m!470051 () Bool)

(assert (=> b!490058 m!470051))

(assert (=> b!490058 m!470041))

(declare-fun m!470053 () Bool)

(assert (=> b!490058 m!470053))

(assert (=> b!490058 m!470045))

(declare-fun m!470055 () Bool)

(assert (=> b!490058 m!470055))

(assert (=> b!490061 m!470041))

(assert (=> b!490061 m!470041))

(declare-fun m!470057 () Bool)

(assert (=> b!490061 m!470057))

(declare-fun m!470059 () Bool)

(assert (=> b!490059 m!470059))

(declare-fun m!470061 () Bool)

(assert (=> b!490062 m!470061))

(declare-fun m!470063 () Bool)

(assert (=> b!490063 m!470063))

(declare-fun m!470065 () Bool)

(assert (=> b!490056 m!470065))

(assert (=> b!490057 m!470041))

(assert (=> b!490057 m!470041))

(declare-fun m!470067 () Bool)

(assert (=> b!490057 m!470067))

(declare-fun m!470069 () Bool)

(assert (=> start!44664 m!470069))

(declare-fun m!470071 () Bool)

(assert (=> start!44664 m!470071))

(push 1)

