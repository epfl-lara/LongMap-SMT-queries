; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45224 () Bool)

(assert start!45224)

(declare-fun b!496519 () Bool)

(declare-fun res!298909 () Bool)

(declare-fun e!291162 () Bool)

(assert (=> b!496519 (=> (not res!298909) (not e!291162))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496519 (= res!298909 (validKeyInArray!0 k0!2280))))

(declare-fun res!298912 () Bool)

(assert (=> start!45224 (=> (not res!298912) (not e!291162))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45224 (= res!298912 (validMask!0 mask!3524))))

(assert (=> start!45224 e!291162))

(assert (=> start!45224 true))

(declare-datatypes ((array!32112 0))(
  ( (array!32113 (arr!15439 (Array (_ BitVec 32) (_ BitVec 64))) (size!15803 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32112)

(declare-fun array_inv!11235 (array!32112) Bool)

(assert (=> start!45224 (array_inv!11235 a!3235)))

(declare-fun b!496520 () Bool)

(declare-fun e!291161 () Bool)

(assert (=> b!496520 (= e!291161 true)))

(declare-datatypes ((SeekEntryResult!3906 0))(
  ( (MissingZero!3906 (index!17803 (_ BitVec 32))) (Found!3906 (index!17804 (_ BitVec 32))) (Intermediate!3906 (undefined!4718 Bool) (index!17805 (_ BitVec 32)) (x!46862 (_ BitVec 32))) (Undefined!3906) (MissingVacant!3906 (index!17806 (_ BitVec 32))) )
))
(declare-fun lt!224782 () SeekEntryResult!3906)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496520 (and (bvslt (x!46862 lt!224782) #b01111111111111111111111111111110) (or (= (select (arr!15439 a!3235) (index!17805 lt!224782)) (select (arr!15439 a!3235) j!176)) (= (select (arr!15439 a!3235) (index!17805 lt!224782)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15439 a!3235) (index!17805 lt!224782)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496521 () Bool)

(declare-fun e!291158 () Bool)

(assert (=> b!496521 (= e!291158 (not e!291161))))

(declare-fun res!298913 () Bool)

(assert (=> b!496521 (=> res!298913 e!291161)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32112 (_ BitVec 32)) SeekEntryResult!3906)

(assert (=> b!496521 (= res!298913 (= lt!224782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224781 (select (store (arr!15439 a!3235) i!1204 k0!2280) j!176) (array!32113 (store (arr!15439 a!3235) i!1204 k0!2280) (size!15803 a!3235)) mask!3524)))))

(declare-fun lt!224778 () (_ BitVec 32))

(assert (=> b!496521 (= lt!224782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224778 (select (arr!15439 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496521 (= lt!224781 (toIndex!0 (select (store (arr!15439 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496521 (= lt!224778 (toIndex!0 (select (arr!15439 a!3235) j!176) mask!3524))))

(declare-fun e!291159 () Bool)

(assert (=> b!496521 e!291159))

(declare-fun res!298906 () Bool)

(assert (=> b!496521 (=> (not res!298906) (not e!291159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32112 (_ BitVec 32)) Bool)

(assert (=> b!496521 (= res!298906 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14758 0))(
  ( (Unit!14759) )
))
(declare-fun lt!224779 () Unit!14758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14758)

(assert (=> b!496521 (= lt!224779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496522 () Bool)

(declare-fun res!298907 () Bool)

(assert (=> b!496522 (=> (not res!298907) (not e!291162))))

(assert (=> b!496522 (= res!298907 (and (= (size!15803 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15803 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15803 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496523 () Bool)

(declare-fun res!298915 () Bool)

(assert (=> b!496523 (=> res!298915 e!291161)))

(get-info :version)

(assert (=> b!496523 (= res!298915 (or (undefined!4718 lt!224782) (not ((_ is Intermediate!3906) lt!224782))))))

(declare-fun b!496524 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32112 (_ BitVec 32)) SeekEntryResult!3906)

(assert (=> b!496524 (= e!291159 (= (seekEntryOrOpen!0 (select (arr!15439 a!3235) j!176) a!3235 mask!3524) (Found!3906 j!176)))))

(declare-fun b!496525 () Bool)

(declare-fun res!298910 () Bool)

(assert (=> b!496525 (=> (not res!298910) (not e!291158))))

(declare-datatypes ((List!9597 0))(
  ( (Nil!9594) (Cons!9593 (h!10464 (_ BitVec 64)) (t!15825 List!9597)) )
))
(declare-fun arrayNoDuplicates!0 (array!32112 (_ BitVec 32) List!9597) Bool)

(assert (=> b!496525 (= res!298910 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9594))))

(declare-fun b!496526 () Bool)

(declare-fun res!298914 () Bool)

(assert (=> b!496526 (=> (not res!298914) (not e!291162))))

(assert (=> b!496526 (= res!298914 (validKeyInArray!0 (select (arr!15439 a!3235) j!176)))))

(declare-fun b!496527 () Bool)

(declare-fun res!298911 () Bool)

(assert (=> b!496527 (=> (not res!298911) (not e!291158))))

(assert (=> b!496527 (= res!298911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496528 () Bool)

(declare-fun res!298908 () Bool)

(assert (=> b!496528 (=> (not res!298908) (not e!291162))))

(declare-fun arrayContainsKey!0 (array!32112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496528 (= res!298908 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496529 () Bool)

(assert (=> b!496529 (= e!291162 e!291158)))

(declare-fun res!298916 () Bool)

(assert (=> b!496529 (=> (not res!298916) (not e!291158))))

(declare-fun lt!224780 () SeekEntryResult!3906)

(assert (=> b!496529 (= res!298916 (or (= lt!224780 (MissingZero!3906 i!1204)) (= lt!224780 (MissingVacant!3906 i!1204))))))

(assert (=> b!496529 (= lt!224780 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45224 res!298912) b!496522))

(assert (= (and b!496522 res!298907) b!496526))

(assert (= (and b!496526 res!298914) b!496519))

(assert (= (and b!496519 res!298909) b!496528))

(assert (= (and b!496528 res!298908) b!496529))

(assert (= (and b!496529 res!298916) b!496527))

(assert (= (and b!496527 res!298911) b!496525))

(assert (= (and b!496525 res!298910) b!496521))

(assert (= (and b!496521 res!298906) b!496524))

(assert (= (and b!496521 (not res!298913)) b!496523))

(assert (= (and b!496523 (not res!298915)) b!496520))

(declare-fun m!477767 () Bool)

(assert (=> b!496529 m!477767))

(declare-fun m!477769 () Bool)

(assert (=> b!496526 m!477769))

(assert (=> b!496526 m!477769))

(declare-fun m!477771 () Bool)

(assert (=> b!496526 m!477771))

(declare-fun m!477773 () Bool)

(assert (=> b!496525 m!477773))

(assert (=> b!496524 m!477769))

(assert (=> b!496524 m!477769))

(declare-fun m!477775 () Bool)

(assert (=> b!496524 m!477775))

(declare-fun m!477777 () Bool)

(assert (=> b!496527 m!477777))

(declare-fun m!477779 () Bool)

(assert (=> b!496521 m!477779))

(declare-fun m!477781 () Bool)

(assert (=> b!496521 m!477781))

(declare-fun m!477783 () Bool)

(assert (=> b!496521 m!477783))

(assert (=> b!496521 m!477769))

(declare-fun m!477785 () Bool)

(assert (=> b!496521 m!477785))

(assert (=> b!496521 m!477769))

(declare-fun m!477787 () Bool)

(assert (=> b!496521 m!477787))

(assert (=> b!496521 m!477783))

(declare-fun m!477789 () Bool)

(assert (=> b!496521 m!477789))

(assert (=> b!496521 m!477783))

(declare-fun m!477791 () Bool)

(assert (=> b!496521 m!477791))

(assert (=> b!496521 m!477769))

(declare-fun m!477793 () Bool)

(assert (=> b!496521 m!477793))

(declare-fun m!477795 () Bool)

(assert (=> start!45224 m!477795))

(declare-fun m!477797 () Bool)

(assert (=> start!45224 m!477797))

(declare-fun m!477799 () Bool)

(assert (=> b!496528 m!477799))

(declare-fun m!477801 () Bool)

(assert (=> b!496519 m!477801))

(declare-fun m!477803 () Bool)

(assert (=> b!496520 m!477803))

(assert (=> b!496520 m!477769))

(check-sat (not b!496521) (not b!496526) (not b!496519) (not b!496524) (not b!496529) (not b!496528) (not start!45224) (not b!496527) (not b!496525))
