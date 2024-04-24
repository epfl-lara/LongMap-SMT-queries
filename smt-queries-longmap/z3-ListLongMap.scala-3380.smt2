; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46682 () Bool)

(assert start!46682)

(declare-fun b!515220 () Bool)

(declare-fun res!314845 () Bool)

(declare-fun e!300837 () Bool)

(assert (=> b!515220 (=> res!314845 e!300837)))

(declare-datatypes ((SeekEntryResult!4288 0))(
  ( (MissingZero!4288 (index!19340 (_ BitVec 32))) (Found!4288 (index!19341 (_ BitVec 32))) (Intermediate!4288 (undefined!5100 Bool) (index!19342 (_ BitVec 32)) (x!48456 (_ BitVec 32))) (Undefined!4288) (MissingVacant!4288 (index!19343 (_ BitVec 32))) )
))
(declare-fun lt!235902 () SeekEntryResult!4288)

(get-info :version)

(assert (=> b!515220 (= res!314845 (or (undefined!5100 lt!235902) (not ((_ is Intermediate!4288) lt!235902))))))

(declare-fun b!515221 () Bool)

(declare-fun res!314844 () Bool)

(declare-fun e!300840 () Bool)

(assert (=> b!515221 (=> (not res!314844) (not e!300840))))

(declare-datatypes ((array!32995 0))(
  ( (array!32996 (arr!15865 (Array (_ BitVec 32) (_ BitVec 64))) (size!16229 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32995)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515221 (= res!314844 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515222 () Bool)

(declare-fun e!300839 () Bool)

(assert (=> b!515222 (= e!300840 e!300839)))

(declare-fun res!314842 () Bool)

(assert (=> b!515222 (=> (not res!314842) (not e!300839))))

(declare-fun lt!235904 () SeekEntryResult!4288)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515222 (= res!314842 (or (= lt!235904 (MissingZero!4288 i!1204)) (= lt!235904 (MissingVacant!4288 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32995 (_ BitVec 32)) SeekEntryResult!4288)

(assert (=> b!515222 (= lt!235904 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515223 () Bool)

(assert (=> b!515223 (= e!300839 (not e!300837))))

(declare-fun res!314847 () Bool)

(assert (=> b!515223 (=> res!314847 e!300837)))

(declare-fun lt!235905 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32995 (_ BitVec 32)) SeekEntryResult!4288)

(assert (=> b!515223 (= res!314847 (= lt!235902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235905 (select (store (arr!15865 a!3235) i!1204 k0!2280) j!176) (array!32996 (store (arr!15865 a!3235) i!1204 k0!2280) (size!16229 a!3235)) mask!3524)))))

(declare-fun lt!235906 () (_ BitVec 32))

(assert (=> b!515223 (= lt!235902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235906 (select (arr!15865 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515223 (= lt!235905 (toIndex!0 (select (store (arr!15865 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515223 (= lt!235906 (toIndex!0 (select (arr!15865 a!3235) j!176) mask!3524))))

(declare-fun e!300838 () Bool)

(assert (=> b!515223 e!300838))

(declare-fun res!314848 () Bool)

(assert (=> b!515223 (=> (not res!314848) (not e!300838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32995 (_ BitVec 32)) Bool)

(assert (=> b!515223 (= res!314848 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15895 0))(
  ( (Unit!15896) )
))
(declare-fun lt!235903 () Unit!15895)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15895)

(assert (=> b!515223 (= lt!235903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515224 () Bool)

(declare-fun res!314843 () Bool)

(assert (=> b!515224 (=> (not res!314843) (not e!300839))))

(assert (=> b!515224 (= res!314843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515225 () Bool)

(assert (=> b!515225 (= e!300837 true)))

(assert (=> b!515225 (and (bvslt (x!48456 lt!235902) #b01111111111111111111111111111110) (or (= (select (arr!15865 a!3235) (index!19342 lt!235902)) (select (arr!15865 a!3235) j!176)) (= (select (arr!15865 a!3235) (index!19342 lt!235902)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15865 a!3235) (index!19342 lt!235902)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!314838 () Bool)

(assert (=> start!46682 (=> (not res!314838) (not e!300840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46682 (= res!314838 (validMask!0 mask!3524))))

(assert (=> start!46682 e!300840))

(assert (=> start!46682 true))

(declare-fun array_inv!11724 (array!32995) Bool)

(assert (=> start!46682 (array_inv!11724 a!3235)))

(declare-fun b!515226 () Bool)

(declare-fun res!314846 () Bool)

(assert (=> b!515226 (=> (not res!314846) (not e!300840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515226 (= res!314846 (validKeyInArray!0 k0!2280))))

(declare-fun b!515227 () Bool)

(assert (=> b!515227 (= e!300838 (= (seekEntryOrOpen!0 (select (arr!15865 a!3235) j!176) a!3235 mask!3524) (Found!4288 j!176)))))

(declare-fun b!515228 () Bool)

(declare-fun res!314841 () Bool)

(assert (=> b!515228 (=> (not res!314841) (not e!300840))))

(assert (=> b!515228 (= res!314841 (and (= (size!16229 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16229 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16229 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515229 () Bool)

(declare-fun res!314839 () Bool)

(assert (=> b!515229 (=> (not res!314839) (not e!300839))))

(declare-datatypes ((List!9930 0))(
  ( (Nil!9927) (Cons!9926 (h!10824 (_ BitVec 64)) (t!16150 List!9930)) )
))
(declare-fun arrayNoDuplicates!0 (array!32995 (_ BitVec 32) List!9930) Bool)

(assert (=> b!515229 (= res!314839 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9927))))

(declare-fun b!515230 () Bool)

(declare-fun res!314840 () Bool)

(assert (=> b!515230 (=> (not res!314840) (not e!300840))))

(assert (=> b!515230 (= res!314840 (validKeyInArray!0 (select (arr!15865 a!3235) j!176)))))

(assert (= (and start!46682 res!314838) b!515228))

(assert (= (and b!515228 res!314841) b!515230))

(assert (= (and b!515230 res!314840) b!515226))

(assert (= (and b!515226 res!314846) b!515221))

(assert (= (and b!515221 res!314844) b!515222))

(assert (= (and b!515222 res!314842) b!515224))

(assert (= (and b!515224 res!314843) b!515229))

(assert (= (and b!515229 res!314839) b!515223))

(assert (= (and b!515223 res!314848) b!515227))

(assert (= (and b!515223 (not res!314847)) b!515220))

(assert (= (and b!515220 (not res!314845)) b!515225))

(declare-fun m!496777 () Bool)

(assert (=> b!515227 m!496777))

(assert (=> b!515227 m!496777))

(declare-fun m!496779 () Bool)

(assert (=> b!515227 m!496779))

(assert (=> b!515230 m!496777))

(assert (=> b!515230 m!496777))

(declare-fun m!496781 () Bool)

(assert (=> b!515230 m!496781))

(declare-fun m!496783 () Bool)

(assert (=> b!515224 m!496783))

(declare-fun m!496785 () Bool)

(assert (=> start!46682 m!496785))

(declare-fun m!496787 () Bool)

(assert (=> start!46682 m!496787))

(declare-fun m!496789 () Bool)

(assert (=> b!515221 m!496789))

(declare-fun m!496791 () Bool)

(assert (=> b!515222 m!496791))

(declare-fun m!496793 () Bool)

(assert (=> b!515229 m!496793))

(declare-fun m!496795 () Bool)

(assert (=> b!515223 m!496795))

(declare-fun m!496797 () Bool)

(assert (=> b!515223 m!496797))

(assert (=> b!515223 m!496777))

(declare-fun m!496799 () Bool)

(assert (=> b!515223 m!496799))

(assert (=> b!515223 m!496797))

(declare-fun m!496801 () Bool)

(assert (=> b!515223 m!496801))

(assert (=> b!515223 m!496777))

(declare-fun m!496803 () Bool)

(assert (=> b!515223 m!496803))

(assert (=> b!515223 m!496797))

(declare-fun m!496805 () Bool)

(assert (=> b!515223 m!496805))

(assert (=> b!515223 m!496777))

(declare-fun m!496807 () Bool)

(assert (=> b!515223 m!496807))

(declare-fun m!496809 () Bool)

(assert (=> b!515223 m!496809))

(declare-fun m!496811 () Bool)

(assert (=> b!515225 m!496811))

(assert (=> b!515225 m!496777))

(declare-fun m!496813 () Bool)

(assert (=> b!515226 m!496813))

(check-sat (not b!515223) (not b!515230) (not b!515222) (not b!515229) (not start!46682) (not b!515224) (not b!515226) (not b!515227) (not b!515221))
(check-sat)
