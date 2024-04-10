; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46750 () Bool)

(assert start!46750)

(declare-fun b!516238 () Bool)

(declare-fun res!315802 () Bool)

(declare-fun e!301311 () Bool)

(assert (=> b!516238 (=> (not res!315802) (not e!301311))))

(declare-datatypes ((array!33062 0))(
  ( (array!33063 (arr!15899 (Array (_ BitVec 32) (_ BitVec 64))) (size!16263 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33062)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33062 (_ BitVec 32)) Bool)

(assert (=> b!516238 (= res!315802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516239 () Bool)

(declare-fun e!301313 () Bool)

(assert (=> b!516239 (= e!301313 true)))

(declare-datatypes ((SeekEntryResult!4366 0))(
  ( (MissingZero!4366 (index!19652 (_ BitVec 32))) (Found!4366 (index!19653 (_ BitVec 32))) (Intermediate!4366 (undefined!5178 Bool) (index!19654 (_ BitVec 32)) (x!48609 (_ BitVec 32))) (Undefined!4366) (MissingVacant!4366 (index!19655 (_ BitVec 32))) )
))
(declare-fun lt!236329 () SeekEntryResult!4366)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516239 (and (bvslt (x!48609 lt!236329) #b01111111111111111111111111111110) (or (= (select (arr!15899 a!3235) (index!19654 lt!236329)) (select (arr!15899 a!3235) j!176)) (= (select (arr!15899 a!3235) (index!19654 lt!236329)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15899 a!3235) (index!19654 lt!236329)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516240 () Bool)

(declare-fun res!315812 () Bool)

(declare-fun e!301310 () Bool)

(assert (=> b!516240 (=> (not res!315812) (not e!301310))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516240 (= res!315812 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516241 () Bool)

(declare-fun res!315808 () Bool)

(assert (=> b!516241 (=> (not res!315808) (not e!301310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516241 (= res!315808 (validKeyInArray!0 (select (arr!15899 a!3235) j!176)))))

(declare-fun b!516242 () Bool)

(declare-fun res!315811 () Bool)

(assert (=> b!516242 (=> (not res!315811) (not e!301310))))

(assert (=> b!516242 (= res!315811 (validKeyInArray!0 k!2280))))

(declare-fun b!516243 () Bool)

(declare-fun res!315804 () Bool)

(assert (=> b!516243 (=> res!315804 e!301313)))

(assert (=> b!516243 (= res!315804 (or (undefined!5178 lt!236329) (not (is-Intermediate!4366 lt!236329))))))

(declare-fun b!516244 () Bool)

(declare-fun res!315810 () Bool)

(assert (=> b!516244 (=> (not res!315810) (not e!301311))))

(declare-datatypes ((List!10057 0))(
  ( (Nil!10054) (Cons!10053 (h!10951 (_ BitVec 64)) (t!16285 List!10057)) )
))
(declare-fun arrayNoDuplicates!0 (array!33062 (_ BitVec 32) List!10057) Bool)

(assert (=> b!516244 (= res!315810 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10054))))

(declare-fun e!301312 () Bool)

(declare-fun b!516245 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33062 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!516245 (= e!301312 (= (seekEntryOrOpen!0 (select (arr!15899 a!3235) j!176) a!3235 mask!3524) (Found!4366 j!176)))))

(declare-fun b!516246 () Bool)

(declare-fun res!315806 () Bool)

(assert (=> b!516246 (=> (not res!315806) (not e!301310))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516246 (= res!315806 (and (= (size!16263 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16263 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16263 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315803 () Bool)

(assert (=> start!46750 (=> (not res!315803) (not e!301310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46750 (= res!315803 (validMask!0 mask!3524))))

(assert (=> start!46750 e!301310))

(assert (=> start!46750 true))

(declare-fun array_inv!11695 (array!33062) Bool)

(assert (=> start!46750 (array_inv!11695 a!3235)))

(declare-fun b!516247 () Bool)

(assert (=> b!516247 (= e!301310 e!301311)))

(declare-fun res!315809 () Bool)

(assert (=> b!516247 (=> (not res!315809) (not e!301311))))

(declare-fun lt!236327 () SeekEntryResult!4366)

(assert (=> b!516247 (= res!315809 (or (= lt!236327 (MissingZero!4366 i!1204)) (= lt!236327 (MissingVacant!4366 i!1204))))))

(assert (=> b!516247 (= lt!236327 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516248 () Bool)

(assert (=> b!516248 (= e!301311 (not e!301313))))

(declare-fun res!315805 () Bool)

(assert (=> b!516248 (=> res!315805 e!301313)))

(declare-fun lt!236326 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33062 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!516248 (= res!315805 (= lt!236329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236326 (select (store (arr!15899 a!3235) i!1204 k!2280) j!176) (array!33063 (store (arr!15899 a!3235) i!1204 k!2280) (size!16263 a!3235)) mask!3524)))))

(declare-fun lt!236328 () (_ BitVec 32))

(assert (=> b!516248 (= lt!236329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236328 (select (arr!15899 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516248 (= lt!236326 (toIndex!0 (select (store (arr!15899 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516248 (= lt!236328 (toIndex!0 (select (arr!15899 a!3235) j!176) mask!3524))))

(assert (=> b!516248 e!301312))

(declare-fun res!315807 () Bool)

(assert (=> b!516248 (=> (not res!315807) (not e!301312))))

(assert (=> b!516248 (= res!315807 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15990 0))(
  ( (Unit!15991) )
))
(declare-fun lt!236325 () Unit!15990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15990)

(assert (=> b!516248 (= lt!236325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46750 res!315803) b!516246))

(assert (= (and b!516246 res!315806) b!516241))

(assert (= (and b!516241 res!315808) b!516242))

(assert (= (and b!516242 res!315811) b!516240))

(assert (= (and b!516240 res!315812) b!516247))

(assert (= (and b!516247 res!315809) b!516238))

(assert (= (and b!516238 res!315802) b!516244))

(assert (= (and b!516244 res!315810) b!516248))

(assert (= (and b!516248 res!315807) b!516245))

(assert (= (and b!516248 (not res!315805)) b!516243))

(assert (= (and b!516243 (not res!315804)) b!516239))

(declare-fun m!497695 () Bool)

(assert (=> b!516248 m!497695))

(declare-fun m!497697 () Bool)

(assert (=> b!516248 m!497697))

(declare-fun m!497699 () Bool)

(assert (=> b!516248 m!497699))

(declare-fun m!497701 () Bool)

(assert (=> b!516248 m!497701))

(assert (=> b!516248 m!497695))

(declare-fun m!497703 () Bool)

(assert (=> b!516248 m!497703))

(declare-fun m!497705 () Bool)

(assert (=> b!516248 m!497705))

(assert (=> b!516248 m!497703))

(declare-fun m!497707 () Bool)

(assert (=> b!516248 m!497707))

(assert (=> b!516248 m!497703))

(declare-fun m!497709 () Bool)

(assert (=> b!516248 m!497709))

(assert (=> b!516248 m!497695))

(declare-fun m!497711 () Bool)

(assert (=> b!516248 m!497711))

(declare-fun m!497713 () Bool)

(assert (=> b!516240 m!497713))

(assert (=> b!516245 m!497703))

(assert (=> b!516245 m!497703))

(declare-fun m!497715 () Bool)

(assert (=> b!516245 m!497715))

(declare-fun m!497717 () Bool)

(assert (=> b!516239 m!497717))

(assert (=> b!516239 m!497703))

(declare-fun m!497719 () Bool)

(assert (=> b!516238 m!497719))

(declare-fun m!497721 () Bool)

(assert (=> start!46750 m!497721))

(declare-fun m!497723 () Bool)

(assert (=> start!46750 m!497723))

(assert (=> b!516241 m!497703))

(assert (=> b!516241 m!497703))

(declare-fun m!497725 () Bool)

(assert (=> b!516241 m!497725))

(declare-fun m!497727 () Bool)

(assert (=> b!516242 m!497727))

(declare-fun m!497729 () Bool)

(assert (=> b!516244 m!497729))

(declare-fun m!497731 () Bool)

(assert (=> b!516247 m!497731))

(push 1)

