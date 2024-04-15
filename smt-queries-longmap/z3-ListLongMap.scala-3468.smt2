; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48126 () Bool)

(assert start!48126)

(declare-fun b!529965 () Bool)

(declare-fun res!325818 () Bool)

(declare-fun e!308777 () Bool)

(assert (=> b!529965 (=> (not res!325818) (not e!308777))))

(declare-datatypes ((array!33572 0))(
  ( (array!33573 (arr!16133 (Array (_ BitVec 32) (_ BitVec 64))) (size!16498 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33572)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529965 (= res!325818 (validKeyInArray!0 (select (arr!16133 a!3235) j!176)))))

(declare-fun b!529966 () Bool)

(declare-fun res!325816 () Bool)

(declare-fun e!308781 () Bool)

(assert (=> b!529966 (=> (not res!325816) (not e!308781))))

(declare-datatypes ((List!10330 0))(
  ( (Nil!10327) (Cons!10326 (h!11266 (_ BitVec 64)) (t!16549 List!10330)) )
))
(declare-fun arrayNoDuplicates!0 (array!33572 (_ BitVec 32) List!10330) Bool)

(assert (=> b!529966 (= res!325816 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10327))))

(declare-fun e!308776 () Bool)

(declare-fun b!529967 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4597 0))(
  ( (MissingZero!4597 (index!20612 (_ BitVec 32))) (Found!4597 (index!20613 (_ BitVec 32))) (Intermediate!4597 (undefined!5409 Bool) (index!20614 (_ BitVec 32)) (x!49590 (_ BitVec 32))) (Undefined!4597) (MissingVacant!4597 (index!20615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33572 (_ BitVec 32)) SeekEntryResult!4597)

(assert (=> b!529967 (= e!308776 (= (seekEntryOrOpen!0 (select (arr!16133 a!3235) j!176) a!3235 mask!3524) (Found!4597 j!176)))))

(declare-fun b!529968 () Bool)

(declare-fun res!325822 () Bool)

(assert (=> b!529968 (=> (not res!325822) (not e!308777))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!529968 (= res!325822 (validKeyInArray!0 k0!2280))))

(declare-fun b!529969 () Bool)

(declare-fun e!308780 () Bool)

(assert (=> b!529969 (= e!308781 (not e!308780))))

(declare-fun res!325817 () Bool)

(assert (=> b!529969 (=> res!325817 e!308780)))

(declare-fun lt!244385 () array!33572)

(declare-fun lt!244387 () (_ BitVec 32))

(declare-fun lt!244381 () SeekEntryResult!4597)

(declare-fun lt!244380 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33572 (_ BitVec 32)) SeekEntryResult!4597)

(assert (=> b!529969 (= res!325817 (= lt!244381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244387 lt!244380 lt!244385 mask!3524)))))

(declare-fun lt!244379 () (_ BitVec 32))

(assert (=> b!529969 (= lt!244381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244379 (select (arr!16133 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529969 (= lt!244387 (toIndex!0 lt!244380 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529969 (= lt!244380 (select (store (arr!16133 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529969 (= lt!244379 (toIndex!0 (select (arr!16133 a!3235) j!176) mask!3524))))

(assert (=> b!529969 (= lt!244385 (array!33573 (store (arr!16133 a!3235) i!1204 k0!2280) (size!16498 a!3235)))))

(assert (=> b!529969 e!308776))

(declare-fun res!325814 () Bool)

(assert (=> b!529969 (=> (not res!325814) (not e!308776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33572 (_ BitVec 32)) Bool)

(assert (=> b!529969 (= res!325814 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16792 0))(
  ( (Unit!16793) )
))
(declare-fun lt!244384 () Unit!16792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16792)

(assert (=> b!529969 (= lt!244384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!325821 () Bool)

(assert (=> start!48126 (=> (not res!325821) (not e!308777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48126 (= res!325821 (validMask!0 mask!3524))))

(assert (=> start!48126 e!308777))

(assert (=> start!48126 true))

(declare-fun array_inv!12016 (array!33572) Bool)

(assert (=> start!48126 (array_inv!12016 a!3235)))

(declare-fun b!529970 () Bool)

(declare-fun res!325819 () Bool)

(assert (=> b!529970 (=> (not res!325819) (not e!308777))))

(assert (=> b!529970 (= res!325819 (and (= (size!16498 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16498 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16498 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529971 () Bool)

(declare-fun res!325813 () Bool)

(assert (=> b!529971 (=> (not res!325813) (not e!308781))))

(assert (=> b!529971 (= res!325813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529972 () Bool)

(declare-fun res!325823 () Bool)

(assert (=> b!529972 (=> (not res!325823) (not e!308777))))

(declare-fun arrayContainsKey!0 (array!33572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529972 (= res!325823 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529973 () Bool)

(declare-fun e!308779 () Bool)

(assert (=> b!529973 (= e!308780 e!308779)))

(declare-fun res!325815 () Bool)

(assert (=> b!529973 (=> res!325815 e!308779)))

(declare-fun lt!244386 () Bool)

(assert (=> b!529973 (= res!325815 (or (and (not lt!244386) (undefined!5409 lt!244381)) (and (not lt!244386) (not (undefined!5409 lt!244381)))))))

(get-info :version)

(assert (=> b!529973 (= lt!244386 (not ((_ is Intermediate!4597) lt!244381)))))

(declare-fun b!529974 () Bool)

(assert (=> b!529974 (= e!308777 e!308781)))

(declare-fun res!325820 () Bool)

(assert (=> b!529974 (=> (not res!325820) (not e!308781))))

(declare-fun lt!244383 () SeekEntryResult!4597)

(assert (=> b!529974 (= res!325820 (or (= lt!244383 (MissingZero!4597 i!1204)) (= lt!244383 (MissingVacant!4597 i!1204))))))

(assert (=> b!529974 (= lt!244383 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529975 () Bool)

(assert (=> b!529975 (= e!308779 true)))

(declare-fun lt!244382 () SeekEntryResult!4597)

(assert (=> b!529975 (= lt!244382 (seekEntryOrOpen!0 lt!244380 lt!244385 mask!3524))))

(assert (=> b!529975 false))

(assert (= (and start!48126 res!325821) b!529970))

(assert (= (and b!529970 res!325819) b!529965))

(assert (= (and b!529965 res!325818) b!529968))

(assert (= (and b!529968 res!325822) b!529972))

(assert (= (and b!529972 res!325823) b!529974))

(assert (= (and b!529974 res!325820) b!529971))

(assert (= (and b!529971 res!325813) b!529966))

(assert (= (and b!529966 res!325816) b!529969))

(assert (= (and b!529969 res!325814) b!529967))

(assert (= (and b!529969 (not res!325817)) b!529973))

(assert (= (and b!529973 (not res!325815)) b!529975))

(declare-fun m!510037 () Bool)

(assert (=> b!529967 m!510037))

(assert (=> b!529967 m!510037))

(declare-fun m!510039 () Bool)

(assert (=> b!529967 m!510039))

(declare-fun m!510041 () Bool)

(assert (=> b!529975 m!510041))

(declare-fun m!510043 () Bool)

(assert (=> b!529966 m!510043))

(declare-fun m!510045 () Bool)

(assert (=> b!529972 m!510045))

(assert (=> b!529969 m!510037))

(declare-fun m!510047 () Bool)

(assert (=> b!529969 m!510047))

(declare-fun m!510049 () Bool)

(assert (=> b!529969 m!510049))

(declare-fun m!510051 () Bool)

(assert (=> b!529969 m!510051))

(declare-fun m!510053 () Bool)

(assert (=> b!529969 m!510053))

(declare-fun m!510055 () Bool)

(assert (=> b!529969 m!510055))

(declare-fun m!510057 () Bool)

(assert (=> b!529969 m!510057))

(assert (=> b!529969 m!510037))

(declare-fun m!510059 () Bool)

(assert (=> b!529969 m!510059))

(assert (=> b!529969 m!510037))

(declare-fun m!510061 () Bool)

(assert (=> b!529969 m!510061))

(assert (=> b!529965 m!510037))

(assert (=> b!529965 m!510037))

(declare-fun m!510063 () Bool)

(assert (=> b!529965 m!510063))

(declare-fun m!510065 () Bool)

(assert (=> b!529971 m!510065))

(declare-fun m!510067 () Bool)

(assert (=> b!529968 m!510067))

(declare-fun m!510069 () Bool)

(assert (=> start!48126 m!510069))

(declare-fun m!510071 () Bool)

(assert (=> start!48126 m!510071))

(declare-fun m!510073 () Bool)

(assert (=> b!529974 m!510073))

(check-sat (not b!529971) (not b!529975) (not b!529966) (not start!48126) (not b!529967) (not b!529969) (not b!529968) (not b!529965) (not b!529974) (not b!529972))
(check-sat)
