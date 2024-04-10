; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46724 () Bool)

(assert start!46724)

(declare-fun b!515809 () Bool)

(declare-fun res!315380 () Bool)

(declare-fun e!301117 () Bool)

(assert (=> b!515809 (=> (not res!315380) (not e!301117))))

(declare-datatypes ((array!33036 0))(
  ( (array!33037 (arr!15886 (Array (_ BitVec 32) (_ BitVec 64))) (size!16250 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33036)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33036 (_ BitVec 32)) Bool)

(assert (=> b!515809 (= res!315380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515810 () Bool)

(declare-fun res!315381 () Bool)

(declare-fun e!301118 () Bool)

(assert (=> b!515810 (=> (not res!315381) (not e!301118))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515810 (= res!315381 (validKeyInArray!0 k0!2280))))

(declare-fun b!515811 () Bool)

(declare-fun res!315375 () Bool)

(assert (=> b!515811 (=> (not res!315375) (not e!301118))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515811 (= res!315375 (and (= (size!16250 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16250 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16250 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515812 () Bool)

(declare-fun res!315382 () Bool)

(assert (=> b!515812 (=> (not res!315382) (not e!301117))))

(declare-datatypes ((List!10044 0))(
  ( (Nil!10041) (Cons!10040 (h!10938 (_ BitVec 64)) (t!16272 List!10044)) )
))
(declare-fun arrayNoDuplicates!0 (array!33036 (_ BitVec 32) List!10044) Bool)

(assert (=> b!515812 (= res!315382 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10041))))

(declare-fun b!515813 () Bool)

(declare-fun e!301116 () Bool)

(assert (=> b!515813 (= e!301116 true)))

(declare-datatypes ((SeekEntryResult!4353 0))(
  ( (MissingZero!4353 (index!19600 (_ BitVec 32))) (Found!4353 (index!19601 (_ BitVec 32))) (Intermediate!4353 (undefined!5165 Bool) (index!19602 (_ BitVec 32)) (x!48564 (_ BitVec 32))) (Undefined!4353) (MissingVacant!4353 (index!19603 (_ BitVec 32))) )
))
(declare-fun lt!236133 () SeekEntryResult!4353)

(assert (=> b!515813 (and (bvslt (x!48564 lt!236133) #b01111111111111111111111111111110) (or (= (select (arr!15886 a!3235) (index!19602 lt!236133)) (select (arr!15886 a!3235) j!176)) (= (select (arr!15886 a!3235) (index!19602 lt!236133)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15886 a!3235) (index!19602 lt!236133)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515814 () Bool)

(assert (=> b!515814 (= e!301118 e!301117)))

(declare-fun res!315377 () Bool)

(assert (=> b!515814 (=> (not res!315377) (not e!301117))))

(declare-fun lt!236132 () SeekEntryResult!4353)

(assert (=> b!515814 (= res!315377 (or (= lt!236132 (MissingZero!4353 i!1204)) (= lt!236132 (MissingVacant!4353 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33036 (_ BitVec 32)) SeekEntryResult!4353)

(assert (=> b!515814 (= lt!236132 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!315378 () Bool)

(assert (=> start!46724 (=> (not res!315378) (not e!301118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46724 (= res!315378 (validMask!0 mask!3524))))

(assert (=> start!46724 e!301118))

(assert (=> start!46724 true))

(declare-fun array_inv!11682 (array!33036) Bool)

(assert (=> start!46724 (array_inv!11682 a!3235)))

(declare-fun b!515815 () Bool)

(declare-fun e!301115 () Bool)

(assert (=> b!515815 (= e!301115 (= (seekEntryOrOpen!0 (select (arr!15886 a!3235) j!176) a!3235 mask!3524) (Found!4353 j!176)))))

(declare-fun b!515816 () Bool)

(declare-fun res!315373 () Bool)

(assert (=> b!515816 (=> (not res!315373) (not e!301118))))

(assert (=> b!515816 (= res!315373 (validKeyInArray!0 (select (arr!15886 a!3235) j!176)))))

(declare-fun b!515817 () Bool)

(assert (=> b!515817 (= e!301117 (not e!301116))))

(declare-fun res!315376 () Bool)

(assert (=> b!515817 (=> res!315376 e!301116)))

(declare-fun lt!236131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33036 (_ BitVec 32)) SeekEntryResult!4353)

(assert (=> b!515817 (= res!315376 (= lt!236133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236131 (select (store (arr!15886 a!3235) i!1204 k0!2280) j!176) (array!33037 (store (arr!15886 a!3235) i!1204 k0!2280) (size!16250 a!3235)) mask!3524)))))

(declare-fun lt!236134 () (_ BitVec 32))

(assert (=> b!515817 (= lt!236133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236134 (select (arr!15886 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515817 (= lt!236131 (toIndex!0 (select (store (arr!15886 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515817 (= lt!236134 (toIndex!0 (select (arr!15886 a!3235) j!176) mask!3524))))

(assert (=> b!515817 e!301115))

(declare-fun res!315379 () Bool)

(assert (=> b!515817 (=> (not res!315379) (not e!301115))))

(assert (=> b!515817 (= res!315379 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15964 0))(
  ( (Unit!15965) )
))
(declare-fun lt!236130 () Unit!15964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15964)

(assert (=> b!515817 (= lt!236130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515818 () Bool)

(declare-fun res!315374 () Bool)

(assert (=> b!515818 (=> res!315374 e!301116)))

(get-info :version)

(assert (=> b!515818 (= res!315374 (or (undefined!5165 lt!236133) (not ((_ is Intermediate!4353) lt!236133))))))

(declare-fun b!515819 () Bool)

(declare-fun res!315383 () Bool)

(assert (=> b!515819 (=> (not res!315383) (not e!301118))))

(declare-fun arrayContainsKey!0 (array!33036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515819 (= res!315383 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46724 res!315378) b!515811))

(assert (= (and b!515811 res!315375) b!515816))

(assert (= (and b!515816 res!315373) b!515810))

(assert (= (and b!515810 res!315381) b!515819))

(assert (= (and b!515819 res!315383) b!515814))

(assert (= (and b!515814 res!315377) b!515809))

(assert (= (and b!515809 res!315380) b!515812))

(assert (= (and b!515812 res!315382) b!515817))

(assert (= (and b!515817 res!315379) b!515815))

(assert (= (and b!515817 (not res!315376)) b!515818))

(assert (= (and b!515818 (not res!315374)) b!515813))

(declare-fun m!497201 () Bool)

(assert (=> b!515813 m!497201))

(declare-fun m!497203 () Bool)

(assert (=> b!515813 m!497203))

(declare-fun m!497205 () Bool)

(assert (=> b!515817 m!497205))

(declare-fun m!497207 () Bool)

(assert (=> b!515817 m!497207))

(declare-fun m!497209 () Bool)

(assert (=> b!515817 m!497209))

(assert (=> b!515817 m!497209))

(declare-fun m!497211 () Bool)

(assert (=> b!515817 m!497211))

(assert (=> b!515817 m!497203))

(declare-fun m!497213 () Bool)

(assert (=> b!515817 m!497213))

(assert (=> b!515817 m!497203))

(declare-fun m!497215 () Bool)

(assert (=> b!515817 m!497215))

(assert (=> b!515817 m!497203))

(declare-fun m!497217 () Bool)

(assert (=> b!515817 m!497217))

(assert (=> b!515817 m!497209))

(declare-fun m!497219 () Bool)

(assert (=> b!515817 m!497219))

(declare-fun m!497221 () Bool)

(assert (=> b!515814 m!497221))

(assert (=> b!515816 m!497203))

(assert (=> b!515816 m!497203))

(declare-fun m!497223 () Bool)

(assert (=> b!515816 m!497223))

(declare-fun m!497225 () Bool)

(assert (=> start!46724 m!497225))

(declare-fun m!497227 () Bool)

(assert (=> start!46724 m!497227))

(assert (=> b!515815 m!497203))

(assert (=> b!515815 m!497203))

(declare-fun m!497229 () Bool)

(assert (=> b!515815 m!497229))

(declare-fun m!497231 () Bool)

(assert (=> b!515809 m!497231))

(declare-fun m!497233 () Bool)

(assert (=> b!515810 m!497233))

(declare-fun m!497235 () Bool)

(assert (=> b!515819 m!497235))

(declare-fun m!497237 () Bool)

(assert (=> b!515812 m!497237))

(check-sat (not b!515815) (not b!515817) (not b!515810) (not b!515819) (not b!515809) (not b!515814) (not b!515816) (not start!46724) (not b!515812))
(check-sat)
