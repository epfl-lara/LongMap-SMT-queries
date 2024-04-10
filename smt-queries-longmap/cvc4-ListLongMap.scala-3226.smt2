; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45166 () Bool)

(assert start!45166)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32054 0))(
  ( (array!32055 (arr!15410 (Array (_ BitVec 32) (_ BitVec 64))) (size!15774 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32054)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!495562 () Bool)

(declare-fun e!290725 () Bool)

(declare-datatypes ((SeekEntryResult!3877 0))(
  ( (MissingZero!3877 (index!17687 (_ BitVec 32))) (Found!3877 (index!17688 (_ BitVec 32))) (Intermediate!3877 (undefined!4689 Bool) (index!17689 (_ BitVec 32)) (x!46753 (_ BitVec 32))) (Undefined!3877) (MissingVacant!3877 (index!17690 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32054 (_ BitVec 32)) SeekEntryResult!3877)

(assert (=> b!495562 (= e!290725 (= (seekEntryOrOpen!0 (select (arr!15410 a!3235) j!176) a!3235 mask!3524) (Found!3877 j!176)))))

(declare-fun b!495563 () Bool)

(declare-fun res!297952 () Bool)

(declare-fun e!290724 () Bool)

(assert (=> b!495563 (=> (not res!297952) (not e!290724))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495563 (= res!297952 (and (= (size!15774 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15774 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15774 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495564 () Bool)

(declare-fun res!297953 () Bool)

(assert (=> b!495564 (=> (not res!297953) (not e!290724))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495564 (= res!297953 (validKeyInArray!0 k!2280))))

(declare-fun b!495565 () Bool)

(declare-fun res!297957 () Bool)

(declare-fun e!290723 () Bool)

(assert (=> b!495565 (=> (not res!297957) (not e!290723))))

(declare-datatypes ((List!9568 0))(
  ( (Nil!9565) (Cons!9564 (h!10435 (_ BitVec 64)) (t!15796 List!9568)) )
))
(declare-fun arrayNoDuplicates!0 (array!32054 (_ BitVec 32) List!9568) Bool)

(assert (=> b!495565 (= res!297957 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9565))))

(declare-fun b!495566 () Bool)

(declare-fun e!290727 () Bool)

(assert (=> b!495566 (= e!290723 (not e!290727))))

(declare-fun res!297956 () Bool)

(assert (=> b!495566 (=> res!297956 e!290727)))

(declare-fun lt!224345 () (_ BitVec 32))

(declare-fun lt!224344 () SeekEntryResult!3877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32054 (_ BitVec 32)) SeekEntryResult!3877)

(assert (=> b!495566 (= res!297956 (= lt!224344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224345 (select (store (arr!15410 a!3235) i!1204 k!2280) j!176) (array!32055 (store (arr!15410 a!3235) i!1204 k!2280) (size!15774 a!3235)) mask!3524)))))

(declare-fun lt!224343 () (_ BitVec 32))

(assert (=> b!495566 (= lt!224344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224343 (select (arr!15410 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495566 (= lt!224345 (toIndex!0 (select (store (arr!15410 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495566 (= lt!224343 (toIndex!0 (select (arr!15410 a!3235) j!176) mask!3524))))

(assert (=> b!495566 e!290725))

(declare-fun res!297949 () Bool)

(assert (=> b!495566 (=> (not res!297949) (not e!290725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32054 (_ BitVec 32)) Bool)

(assert (=> b!495566 (= res!297949 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14700 0))(
  ( (Unit!14701) )
))
(declare-fun lt!224346 () Unit!14700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14700)

(assert (=> b!495566 (= lt!224346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495567 () Bool)

(declare-fun res!297950 () Bool)

(assert (=> b!495567 (=> (not res!297950) (not e!290723))))

(assert (=> b!495567 (= res!297950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495568 () Bool)

(assert (=> b!495568 (= e!290724 e!290723)))

(declare-fun res!297955 () Bool)

(assert (=> b!495568 (=> (not res!297955) (not e!290723))))

(declare-fun lt!224347 () SeekEntryResult!3877)

(assert (=> b!495568 (= res!297955 (or (= lt!224347 (MissingZero!3877 i!1204)) (= lt!224347 (MissingVacant!3877 i!1204))))))

(assert (=> b!495568 (= lt!224347 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495570 () Bool)

(declare-fun res!297958 () Bool)

(assert (=> b!495570 (=> (not res!297958) (not e!290724))))

(assert (=> b!495570 (= res!297958 (validKeyInArray!0 (select (arr!15410 a!3235) j!176)))))

(declare-fun b!495571 () Bool)

(declare-fun res!297954 () Bool)

(assert (=> b!495571 (=> (not res!297954) (not e!290724))))

(declare-fun arrayContainsKey!0 (array!32054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495571 (= res!297954 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495572 () Bool)

(declare-fun res!297951 () Bool)

(assert (=> b!495572 (=> res!297951 e!290727)))

(assert (=> b!495572 (= res!297951 (or (undefined!4689 lt!224344) (not (is-Intermediate!3877 lt!224344))))))

(declare-fun b!495569 () Bool)

(assert (=> b!495569 (= e!290727 true)))

(assert (=> b!495569 (and (bvslt (x!46753 lt!224344) #b01111111111111111111111111111110) (or (= (select (arr!15410 a!3235) (index!17689 lt!224344)) (select (arr!15410 a!3235) j!176)) (= (select (arr!15410 a!3235) (index!17689 lt!224344)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15410 a!3235) (index!17689 lt!224344)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!297959 () Bool)

(assert (=> start!45166 (=> (not res!297959) (not e!290724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45166 (= res!297959 (validMask!0 mask!3524))))

(assert (=> start!45166 e!290724))

(assert (=> start!45166 true))

(declare-fun array_inv!11206 (array!32054) Bool)

(assert (=> start!45166 (array_inv!11206 a!3235)))

(assert (= (and start!45166 res!297959) b!495563))

(assert (= (and b!495563 res!297952) b!495570))

(assert (= (and b!495570 res!297958) b!495564))

(assert (= (and b!495564 res!297953) b!495571))

(assert (= (and b!495571 res!297954) b!495568))

(assert (= (and b!495568 res!297955) b!495567))

(assert (= (and b!495567 res!297950) b!495565))

(assert (= (and b!495565 res!297957) b!495566))

(assert (= (and b!495566 res!297949) b!495562))

(assert (= (and b!495566 (not res!297956)) b!495572))

(assert (= (and b!495572 (not res!297951)) b!495569))

(declare-fun m!476665 () Bool)

(assert (=> start!45166 m!476665))

(declare-fun m!476667 () Bool)

(assert (=> start!45166 m!476667))

(declare-fun m!476669 () Bool)

(assert (=> b!495564 m!476669))

(declare-fun m!476671 () Bool)

(assert (=> b!495569 m!476671))

(declare-fun m!476673 () Bool)

(assert (=> b!495569 m!476673))

(declare-fun m!476675 () Bool)

(assert (=> b!495571 m!476675))

(declare-fun m!476677 () Bool)

(assert (=> b!495566 m!476677))

(declare-fun m!476679 () Bool)

(assert (=> b!495566 m!476679))

(declare-fun m!476681 () Bool)

(assert (=> b!495566 m!476681))

(declare-fun m!476683 () Bool)

(assert (=> b!495566 m!476683))

(assert (=> b!495566 m!476677))

(assert (=> b!495566 m!476673))

(declare-fun m!476685 () Bool)

(assert (=> b!495566 m!476685))

(assert (=> b!495566 m!476673))

(declare-fun m!476687 () Bool)

(assert (=> b!495566 m!476687))

(assert (=> b!495566 m!476677))

(declare-fun m!476689 () Bool)

(assert (=> b!495566 m!476689))

(assert (=> b!495566 m!476673))

(declare-fun m!476691 () Bool)

(assert (=> b!495566 m!476691))

(assert (=> b!495570 m!476673))

(assert (=> b!495570 m!476673))

(declare-fun m!476693 () Bool)

(assert (=> b!495570 m!476693))

(declare-fun m!476695 () Bool)

(assert (=> b!495565 m!476695))

(declare-fun m!476697 () Bool)

(assert (=> b!495568 m!476697))

(assert (=> b!495562 m!476673))

(assert (=> b!495562 m!476673))

(declare-fun m!476699 () Bool)

(assert (=> b!495562 m!476699))

(declare-fun m!476701 () Bool)

(assert (=> b!495567 m!476701))

(push 1)

