; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44952 () Bool)

(assert start!44952)

(declare-fun b!492960 () Bool)

(declare-fun res!295538 () Bool)

(declare-fun e!289572 () Bool)

(assert (=> b!492960 (=> (not res!295538) (not e!289572))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31897 0))(
  ( (array!31898 (arr!15333 (Array (_ BitVec 32) (_ BitVec 64))) (size!15697 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31897)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!492960 (= res!295538 (and (= (size!15697 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15697 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15697 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492961 () Bool)

(declare-fun res!295531 () Bool)

(declare-fun e!289570 () Bool)

(assert (=> b!492961 (=> (not res!295531) (not e!289570))))

(declare-datatypes ((List!9491 0))(
  ( (Nil!9488) (Cons!9487 (h!10355 (_ BitVec 64)) (t!15719 List!9491)) )
))
(declare-fun arrayNoDuplicates!0 (array!31897 (_ BitVec 32) List!9491) Bool)

(assert (=> b!492961 (= res!295531 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9488))))

(declare-fun b!492962 () Bool)

(declare-fun res!295532 () Bool)

(assert (=> b!492962 (=> (not res!295532) (not e!289570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31897 (_ BitVec 32)) Bool)

(assert (=> b!492962 (= res!295532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!295535 () Bool)

(assert (=> start!44952 (=> (not res!295535) (not e!289572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44952 (= res!295535 (validMask!0 mask!3524))))

(assert (=> start!44952 e!289572))

(assert (=> start!44952 true))

(declare-fun array_inv!11129 (array!31897) Bool)

(assert (=> start!44952 (array_inv!11129 a!3235)))

(declare-fun b!492963 () Bool)

(assert (=> b!492963 (= e!289570 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3800 0))(
  ( (MissingZero!3800 (index!17379 (_ BitVec 32))) (Found!3800 (index!17380 (_ BitVec 32))) (Intermediate!3800 (undefined!4612 Bool) (index!17381 (_ BitVec 32)) (x!46470 (_ BitVec 32))) (Undefined!3800) (MissingVacant!3800 (index!17382 (_ BitVec 32))) )
))
(declare-fun lt!222877 () SeekEntryResult!3800)

(declare-fun lt!222872 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31897 (_ BitVec 32)) SeekEntryResult!3800)

(assert (=> b!492963 (= lt!222877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222872 (select (store (arr!15333 a!3235) i!1204 k!2280) j!176) (array!31898 (store (arr!15333 a!3235) i!1204 k!2280) (size!15697 a!3235)) mask!3524))))

(declare-fun lt!222873 () SeekEntryResult!3800)

(declare-fun lt!222876 () (_ BitVec 32))

(assert (=> b!492963 (= lt!222873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222876 (select (arr!15333 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492963 (= lt!222872 (toIndex!0 (select (store (arr!15333 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492963 (= lt!222876 (toIndex!0 (select (arr!15333 a!3235) j!176) mask!3524))))

(declare-fun e!289571 () Bool)

(assert (=> b!492963 e!289571))

(declare-fun res!295530 () Bool)

(assert (=> b!492963 (=> (not res!295530) (not e!289571))))

(assert (=> b!492963 (= res!295530 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14546 0))(
  ( (Unit!14547) )
))
(declare-fun lt!222875 () Unit!14546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14546)

(assert (=> b!492963 (= lt!222875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492964 () Bool)

(declare-fun res!295537 () Bool)

(assert (=> b!492964 (=> (not res!295537) (not e!289572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492964 (= res!295537 (validKeyInArray!0 k!2280))))

(declare-fun b!492965 () Bool)

(assert (=> b!492965 (= e!289572 e!289570)))

(declare-fun res!295534 () Bool)

(assert (=> b!492965 (=> (not res!295534) (not e!289570))))

(declare-fun lt!222874 () SeekEntryResult!3800)

(assert (=> b!492965 (= res!295534 (or (= lt!222874 (MissingZero!3800 i!1204)) (= lt!222874 (MissingVacant!3800 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31897 (_ BitVec 32)) SeekEntryResult!3800)

(assert (=> b!492965 (= lt!222874 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492966 () Bool)

(declare-fun res!295533 () Bool)

(assert (=> b!492966 (=> (not res!295533) (not e!289572))))

(assert (=> b!492966 (= res!295533 (validKeyInArray!0 (select (arr!15333 a!3235) j!176)))))

(declare-fun b!492967 () Bool)

(assert (=> b!492967 (= e!289571 (= (seekEntryOrOpen!0 (select (arr!15333 a!3235) j!176) a!3235 mask!3524) (Found!3800 j!176)))))

(declare-fun b!492968 () Bool)

(declare-fun res!295536 () Bool)

(assert (=> b!492968 (=> (not res!295536) (not e!289572))))

(declare-fun arrayContainsKey!0 (array!31897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492968 (= res!295536 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44952 res!295535) b!492960))

(assert (= (and b!492960 res!295538) b!492966))

(assert (= (and b!492966 res!295533) b!492964))

(assert (= (and b!492964 res!295537) b!492968))

(assert (= (and b!492968 res!295536) b!492965))

(assert (= (and b!492965 res!295534) b!492962))

(assert (= (and b!492962 res!295532) b!492961))

(assert (= (and b!492961 res!295531) b!492963))

(assert (= (and b!492963 res!295530) b!492967))

(declare-fun m!473667 () Bool)

(assert (=> b!492967 m!473667))

(assert (=> b!492967 m!473667))

(declare-fun m!473669 () Bool)

(assert (=> b!492967 m!473669))

(declare-fun m!473671 () Bool)

(assert (=> b!492961 m!473671))

(declare-fun m!473673 () Bool)

(assert (=> b!492964 m!473673))

(declare-fun m!473675 () Bool)

(assert (=> b!492962 m!473675))

(declare-fun m!473677 () Bool)

(assert (=> b!492965 m!473677))

(assert (=> b!492966 m!473667))

(assert (=> b!492966 m!473667))

(declare-fun m!473679 () Bool)

(assert (=> b!492966 m!473679))

(declare-fun m!473681 () Bool)

(assert (=> b!492963 m!473681))

(declare-fun m!473683 () Bool)

(assert (=> b!492963 m!473683))

(declare-fun m!473685 () Bool)

(assert (=> b!492963 m!473685))

(assert (=> b!492963 m!473667))

(declare-fun m!473687 () Bool)

(assert (=> b!492963 m!473687))

(assert (=> b!492963 m!473667))

(assert (=> b!492963 m!473685))

(declare-fun m!473689 () Bool)

(assert (=> b!492963 m!473689))

(declare-fun m!473691 () Bool)

(assert (=> b!492963 m!473691))

(assert (=> b!492963 m!473685))

(declare-fun m!473693 () Bool)

(assert (=> b!492963 m!473693))

(assert (=> b!492963 m!473667))

(declare-fun m!473695 () Bool)

(assert (=> b!492963 m!473695))

(declare-fun m!473697 () Bool)

(assert (=> b!492968 m!473697))

(declare-fun m!473699 () Bool)

(assert (=> start!44952 m!473699))

(declare-fun m!473701 () Bool)

(assert (=> start!44952 m!473701))

(push 1)

