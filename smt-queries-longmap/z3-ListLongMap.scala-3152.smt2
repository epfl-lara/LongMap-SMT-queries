; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44372 () Bool)

(assert start!44372)

(declare-fun b!487736 () Bool)

(declare-fun res!291064 () Bool)

(declare-fun e!286956 () Bool)

(assert (=> b!487736 (=> (not res!291064) (not e!286956))))

(declare-datatypes ((array!31579 0))(
  ( (array!31580 (arr!15181 (Array (_ BitVec 32) (_ BitVec 64))) (size!15545 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31579)

(declare-datatypes ((List!9246 0))(
  ( (Nil!9243) (Cons!9242 (h!10098 (_ BitVec 64)) (t!15466 List!9246)) )
))
(declare-fun arrayNoDuplicates!0 (array!31579 (_ BitVec 32) List!9246) Bool)

(assert (=> b!487736 (= res!291064 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9243))))

(declare-fun b!487737 () Bool)

(declare-fun e!286955 () Bool)

(assert (=> b!487737 (= e!286955 e!286956)))

(declare-fun res!291069 () Bool)

(assert (=> b!487737 (=> (not res!291069) (not e!286956))))

(declare-datatypes ((SeekEntryResult!3604 0))(
  ( (MissingZero!3604 (index!16595 (_ BitVec 32))) (Found!3604 (index!16596 (_ BitVec 32))) (Intermediate!3604 (undefined!4416 Bool) (index!16597 (_ BitVec 32)) (x!45861 (_ BitVec 32))) (Undefined!3604) (MissingVacant!3604 (index!16598 (_ BitVec 32))) )
))
(declare-fun lt!220172 () SeekEntryResult!3604)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487737 (= res!291069 (or (= lt!220172 (MissingZero!3604 i!1204)) (= lt!220172 (MissingVacant!3604 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31579 (_ BitVec 32)) SeekEntryResult!3604)

(assert (=> b!487737 (= lt!220172 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487738 () Bool)

(assert (=> b!487738 (= e!286956 (not true))))

(declare-fun lt!220174 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487738 (= lt!220174 (toIndex!0 (select (arr!15181 a!3235) j!176) mask!3524))))

(declare-fun e!286954 () Bool)

(assert (=> b!487738 e!286954))

(declare-fun res!291065 () Bool)

(assert (=> b!487738 (=> (not res!291065) (not e!286954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31579 (_ BitVec 32)) Bool)

(assert (=> b!487738 (= res!291065 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14215 0))(
  ( (Unit!14216) )
))
(declare-fun lt!220173 () Unit!14215)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14215)

(assert (=> b!487738 (= lt!220173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487739 () Bool)

(declare-fun res!291062 () Bool)

(assert (=> b!487739 (=> (not res!291062) (not e!286955))))

(assert (=> b!487739 (= res!291062 (and (= (size!15545 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15545 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15545 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!291066 () Bool)

(assert (=> start!44372 (=> (not res!291066) (not e!286955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44372 (= res!291066 (validMask!0 mask!3524))))

(assert (=> start!44372 e!286955))

(assert (=> start!44372 true))

(declare-fun array_inv!11040 (array!31579) Bool)

(assert (=> start!44372 (array_inv!11040 a!3235)))

(declare-fun b!487740 () Bool)

(declare-fun res!291070 () Bool)

(assert (=> b!487740 (=> (not res!291070) (not e!286955))))

(declare-fun arrayContainsKey!0 (array!31579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487740 (= res!291070 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487741 () Bool)

(declare-fun res!291068 () Bool)

(assert (=> b!487741 (=> (not res!291068) (not e!286955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487741 (= res!291068 (validKeyInArray!0 k0!2280))))

(declare-fun b!487742 () Bool)

(assert (=> b!487742 (= e!286954 (= (seekEntryOrOpen!0 (select (arr!15181 a!3235) j!176) a!3235 mask!3524) (Found!3604 j!176)))))

(declare-fun b!487743 () Bool)

(declare-fun res!291067 () Bool)

(assert (=> b!487743 (=> (not res!291067) (not e!286955))))

(assert (=> b!487743 (= res!291067 (validKeyInArray!0 (select (arr!15181 a!3235) j!176)))))

(declare-fun b!487744 () Bool)

(declare-fun res!291063 () Bool)

(assert (=> b!487744 (=> (not res!291063) (not e!286956))))

(assert (=> b!487744 (= res!291063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44372 res!291066) b!487739))

(assert (= (and b!487739 res!291062) b!487743))

(assert (= (and b!487743 res!291067) b!487741))

(assert (= (and b!487741 res!291068) b!487740))

(assert (= (and b!487740 res!291070) b!487737))

(assert (= (and b!487737 res!291069) b!487744))

(assert (= (and b!487744 res!291063) b!487736))

(assert (= (and b!487736 res!291064) b!487738))

(assert (= (and b!487738 res!291065) b!487742))

(declare-fun m!467767 () Bool)

(assert (=> b!487736 m!467767))

(declare-fun m!467769 () Bool)

(assert (=> b!487741 m!467769))

(declare-fun m!467771 () Bool)

(assert (=> b!487742 m!467771))

(assert (=> b!487742 m!467771))

(declare-fun m!467773 () Bool)

(assert (=> b!487742 m!467773))

(declare-fun m!467775 () Bool)

(assert (=> start!44372 m!467775))

(declare-fun m!467777 () Bool)

(assert (=> start!44372 m!467777))

(assert (=> b!487743 m!467771))

(assert (=> b!487743 m!467771))

(declare-fun m!467779 () Bool)

(assert (=> b!487743 m!467779))

(assert (=> b!487738 m!467771))

(assert (=> b!487738 m!467771))

(declare-fun m!467781 () Bool)

(assert (=> b!487738 m!467781))

(declare-fun m!467783 () Bool)

(assert (=> b!487738 m!467783))

(declare-fun m!467785 () Bool)

(assert (=> b!487738 m!467785))

(declare-fun m!467787 () Bool)

(assert (=> b!487744 m!467787))

(declare-fun m!467789 () Bool)

(assert (=> b!487740 m!467789))

(declare-fun m!467791 () Bool)

(assert (=> b!487737 m!467791))

(check-sat (not start!44372) (not b!487736) (not b!487741) (not b!487737) (not b!487738) (not b!487742) (not b!487744) (not b!487743) (not b!487740))
(check-sat)
