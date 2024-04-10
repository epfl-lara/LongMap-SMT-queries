; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45972 () Bool)

(assert start!45972)

(declare-fun b!508920 () Bool)

(declare-fun res!309765 () Bool)

(declare-fun e!297692 () Bool)

(assert (=> b!508920 (=> (not res!309765) (not e!297692))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508920 (= res!309765 (validKeyInArray!0 k!2280))))

(declare-fun b!508921 () Bool)

(declare-fun res!309770 () Bool)

(assert (=> b!508921 (=> (not res!309770) (not e!297692))))

(declare-datatypes ((array!32683 0))(
  ( (array!32684 (arr!15720 (Array (_ BitVec 32) (_ BitVec 64))) (size!16084 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32683)

(declare-fun arrayContainsKey!0 (array!32683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508921 (= res!309770 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508922 () Bool)

(declare-fun res!309766 () Bool)

(assert (=> b!508922 (=> (not res!309766) (not e!297692))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508922 (= res!309766 (and (= (size!16084 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16084 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16084 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508923 () Bool)

(declare-fun e!297690 () Bool)

(assert (=> b!508923 (= e!297692 e!297690)))

(declare-fun res!309772 () Bool)

(assert (=> b!508923 (=> (not res!309772) (not e!297690))))

(declare-datatypes ((SeekEntryResult!4187 0))(
  ( (MissingZero!4187 (index!18936 (_ BitVec 32))) (Found!4187 (index!18937 (_ BitVec 32))) (Intermediate!4187 (undefined!4999 Bool) (index!18938 (_ BitVec 32)) (x!47916 (_ BitVec 32))) (Undefined!4187) (MissingVacant!4187 (index!18939 (_ BitVec 32))) )
))
(declare-fun lt!232391 () SeekEntryResult!4187)

(assert (=> b!508923 (= res!309772 (or (= lt!232391 (MissingZero!4187 i!1204)) (= lt!232391 (MissingVacant!4187 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32683 (_ BitVec 32)) SeekEntryResult!4187)

(assert (=> b!508923 (= lt!232391 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508924 () Bool)

(declare-fun res!309767 () Bool)

(assert (=> b!508924 (=> (not res!309767) (not e!297690))))

(declare-datatypes ((List!9878 0))(
  ( (Nil!9875) (Cons!9874 (h!10751 (_ BitVec 64)) (t!16106 List!9878)) )
))
(declare-fun arrayNoDuplicates!0 (array!32683 (_ BitVec 32) List!9878) Bool)

(assert (=> b!508924 (= res!309767 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9875))))

(declare-fun b!508925 () Bool)

(declare-fun res!309771 () Bool)

(assert (=> b!508925 (=> (not res!309771) (not e!297690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32683 (_ BitVec 32)) Bool)

(assert (=> b!508925 (= res!309771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508926 () Bool)

(assert (=> b!508926 (= e!297690 (not true))))

(declare-fun lt!232392 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508926 (= lt!232392 (toIndex!0 (select (store (arr!15720 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!297693 () Bool)

(assert (=> b!508926 e!297693))

(declare-fun res!309769 () Bool)

(assert (=> b!508926 (=> (not res!309769) (not e!297693))))

(assert (=> b!508926 (= res!309769 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15632 0))(
  ( (Unit!15633) )
))
(declare-fun lt!232393 () Unit!15632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15632)

(assert (=> b!508926 (= lt!232393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309768 () Bool)

(assert (=> start!45972 (=> (not res!309768) (not e!297692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45972 (= res!309768 (validMask!0 mask!3524))))

(assert (=> start!45972 e!297692))

(assert (=> start!45972 true))

(declare-fun array_inv!11516 (array!32683) Bool)

(assert (=> start!45972 (array_inv!11516 a!3235)))

(declare-fun b!508927 () Bool)

(declare-fun res!309773 () Bool)

(assert (=> b!508927 (=> (not res!309773) (not e!297692))))

(assert (=> b!508927 (= res!309773 (validKeyInArray!0 (select (arr!15720 a!3235) j!176)))))

(declare-fun b!508928 () Bool)

(assert (=> b!508928 (= e!297693 (= (seekEntryOrOpen!0 (select (arr!15720 a!3235) j!176) a!3235 mask!3524) (Found!4187 j!176)))))

(assert (= (and start!45972 res!309768) b!508922))

(assert (= (and b!508922 res!309766) b!508927))

(assert (= (and b!508927 res!309773) b!508920))

(assert (= (and b!508920 res!309765) b!508921))

(assert (= (and b!508921 res!309770) b!508923))

(assert (= (and b!508923 res!309772) b!508925))

(assert (= (and b!508925 res!309771) b!508924))

(assert (= (and b!508924 res!309767) b!508926))

(assert (= (and b!508926 res!309769) b!508928))

(declare-fun m!489651 () Bool)

(assert (=> b!508928 m!489651))

(assert (=> b!508928 m!489651))

(declare-fun m!489653 () Bool)

(assert (=> b!508928 m!489653))

(assert (=> b!508927 m!489651))

(assert (=> b!508927 m!489651))

(declare-fun m!489655 () Bool)

(assert (=> b!508927 m!489655))

(declare-fun m!489657 () Bool)

(assert (=> b!508925 m!489657))

(declare-fun m!489659 () Bool)

(assert (=> start!45972 m!489659))

(declare-fun m!489661 () Bool)

(assert (=> start!45972 m!489661))

(declare-fun m!489663 () Bool)

(assert (=> b!508921 m!489663))

(declare-fun m!489665 () Bool)

(assert (=> b!508926 m!489665))

(declare-fun m!489667 () Bool)

(assert (=> b!508926 m!489667))

(declare-fun m!489669 () Bool)

(assert (=> b!508926 m!489669))

(declare-fun m!489671 () Bool)

(assert (=> b!508926 m!489671))

(assert (=> b!508926 m!489669))

(declare-fun m!489673 () Bool)

(assert (=> b!508926 m!489673))

(declare-fun m!489675 () Bool)

(assert (=> b!508924 m!489675))

(declare-fun m!489677 () Bool)

(assert (=> b!508923 m!489677))

(declare-fun m!489679 () Bool)

(assert (=> b!508920 m!489679))

(push 1)

