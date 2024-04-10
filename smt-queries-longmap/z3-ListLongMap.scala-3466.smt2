; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48128 () Bool)

(assert start!48128)

(declare-fun b!530071 () Bool)

(declare-fun e!308864 () Bool)

(declare-fun e!308862 () Bool)

(assert (=> b!530071 (= e!308864 e!308862)))

(declare-fun res!325785 () Bool)

(assert (=> b!530071 (=> (not res!325785) (not e!308862))))

(declare-datatypes ((SeekEntryResult!4596 0))(
  ( (MissingZero!4596 (index!20608 (_ BitVec 32))) (Found!4596 (index!20609 (_ BitVec 32))) (Intermediate!4596 (undefined!5408 Bool) (index!20610 (_ BitVec 32)) (x!49578 (_ BitVec 32))) (Undefined!4596) (MissingVacant!4596 (index!20611 (_ BitVec 32))) )
))
(declare-fun lt!244479 () SeekEntryResult!4596)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530071 (= res!325785 (or (= lt!244479 (MissingZero!4596 i!1204)) (= lt!244479 (MissingVacant!4596 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33564 0))(
  ( (array!33565 (arr!16129 (Array (_ BitVec 32) (_ BitVec 64))) (size!16493 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33564)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33564 (_ BitVec 32)) SeekEntryResult!4596)

(assert (=> b!530071 (= lt!244479 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530072 () Bool)

(declare-fun res!325777 () Bool)

(assert (=> b!530072 (=> (not res!325777) (not e!308862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33564 (_ BitVec 32)) Bool)

(assert (=> b!530072 (= res!325777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530073 () Bool)

(declare-fun res!325783 () Bool)

(assert (=> b!530073 (=> (not res!325783) (not e!308864))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530073 (= res!325783 (validKeyInArray!0 (select (arr!16129 a!3235) j!176)))))

(declare-fun b!530074 () Bool)

(declare-fun res!325780 () Bool)

(assert (=> b!530074 (=> (not res!325780) (not e!308864))))

(declare-fun arrayContainsKey!0 (array!33564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530074 (= res!325780 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530075 () Bool)

(declare-fun res!325778 () Bool)

(assert (=> b!530075 (=> (not res!325778) (not e!308862))))

(declare-datatypes ((List!10287 0))(
  ( (Nil!10284) (Cons!10283 (h!11223 (_ BitVec 64)) (t!16515 List!10287)) )
))
(declare-fun arrayNoDuplicates!0 (array!33564 (_ BitVec 32) List!10287) Bool)

(assert (=> b!530075 (= res!325778 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10284))))

(declare-fun b!530076 () Bool)

(declare-fun e!308863 () Bool)

(assert (=> b!530076 (= e!308863 true)))

(declare-fun lt!244484 () (_ BitVec 64))

(declare-fun lt!244482 () SeekEntryResult!4596)

(declare-fun lt!244480 () array!33564)

(assert (=> b!530076 (= lt!244482 (seekEntryOrOpen!0 lt!244484 lt!244480 mask!3524))))

(assert (=> b!530076 false))

(declare-fun res!325779 () Bool)

(assert (=> start!48128 (=> (not res!325779) (not e!308864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48128 (= res!325779 (validMask!0 mask!3524))))

(assert (=> start!48128 e!308864))

(assert (=> start!48128 true))

(declare-fun array_inv!11925 (array!33564) Bool)

(assert (=> start!48128 (array_inv!11925 a!3235)))

(declare-fun b!530077 () Bool)

(declare-fun e!308860 () Bool)

(assert (=> b!530077 (= e!308862 (not e!308860))))

(declare-fun res!325786 () Bool)

(assert (=> b!530077 (=> res!325786 e!308860)))

(declare-fun lt!244483 () SeekEntryResult!4596)

(declare-fun lt!244486 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33564 (_ BitVec 32)) SeekEntryResult!4596)

(assert (=> b!530077 (= res!325786 (= lt!244483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244486 lt!244484 lt!244480 mask!3524)))))

(declare-fun lt!244481 () (_ BitVec 32))

(assert (=> b!530077 (= lt!244483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244481 (select (arr!16129 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530077 (= lt!244486 (toIndex!0 lt!244484 mask!3524))))

(assert (=> b!530077 (= lt!244484 (select (store (arr!16129 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530077 (= lt!244481 (toIndex!0 (select (arr!16129 a!3235) j!176) mask!3524))))

(assert (=> b!530077 (= lt!244480 (array!33565 (store (arr!16129 a!3235) i!1204 k0!2280) (size!16493 a!3235)))))

(declare-fun e!308861 () Bool)

(assert (=> b!530077 e!308861))

(declare-fun res!325781 () Bool)

(assert (=> b!530077 (=> (not res!325781) (not e!308861))))

(assert (=> b!530077 (= res!325781 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16804 0))(
  ( (Unit!16805) )
))
(declare-fun lt!244485 () Unit!16804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16804)

(assert (=> b!530077 (= lt!244485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530078 () Bool)

(declare-fun res!325782 () Bool)

(assert (=> b!530078 (=> (not res!325782) (not e!308864))))

(assert (=> b!530078 (= res!325782 (validKeyInArray!0 k0!2280))))

(declare-fun b!530079 () Bool)

(assert (=> b!530079 (= e!308861 (= (seekEntryOrOpen!0 (select (arr!16129 a!3235) j!176) a!3235 mask!3524) (Found!4596 j!176)))))

(declare-fun b!530080 () Bool)

(declare-fun res!325784 () Bool)

(assert (=> b!530080 (=> (not res!325784) (not e!308864))))

(assert (=> b!530080 (= res!325784 (and (= (size!16493 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16493 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16493 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530081 () Bool)

(assert (=> b!530081 (= e!308860 e!308863)))

(declare-fun res!325787 () Bool)

(assert (=> b!530081 (=> res!325787 e!308863)))

(declare-fun lt!244478 () Bool)

(assert (=> b!530081 (= res!325787 (or (and (not lt!244478) (undefined!5408 lt!244483)) (and (not lt!244478) (not (undefined!5408 lt!244483)))))))

(get-info :version)

(assert (=> b!530081 (= lt!244478 (not ((_ is Intermediate!4596) lt!244483)))))

(assert (= (and start!48128 res!325779) b!530080))

(assert (= (and b!530080 res!325784) b!530073))

(assert (= (and b!530073 res!325783) b!530078))

(assert (= (and b!530078 res!325782) b!530074))

(assert (= (and b!530074 res!325780) b!530071))

(assert (= (and b!530071 res!325785) b!530072))

(assert (= (and b!530072 res!325777) b!530075))

(assert (= (and b!530075 res!325778) b!530077))

(assert (= (and b!530077 res!325781) b!530079))

(assert (= (and b!530077 (not res!325786)) b!530081))

(assert (= (and b!530081 (not res!325787)) b!530076))

(declare-fun m!510599 () Bool)

(assert (=> start!48128 m!510599))

(declare-fun m!510601 () Bool)

(assert (=> start!48128 m!510601))

(declare-fun m!510603 () Bool)

(assert (=> b!530078 m!510603))

(declare-fun m!510605 () Bool)

(assert (=> b!530073 m!510605))

(assert (=> b!530073 m!510605))

(declare-fun m!510607 () Bool)

(assert (=> b!530073 m!510607))

(assert (=> b!530079 m!510605))

(assert (=> b!530079 m!510605))

(declare-fun m!510609 () Bool)

(assert (=> b!530079 m!510609))

(declare-fun m!510611 () Bool)

(assert (=> b!530076 m!510611))

(declare-fun m!510613 () Bool)

(assert (=> b!530075 m!510613))

(declare-fun m!510615 () Bool)

(assert (=> b!530072 m!510615))

(declare-fun m!510617 () Bool)

(assert (=> b!530071 m!510617))

(assert (=> b!530077 m!510605))

(declare-fun m!510619 () Bool)

(assert (=> b!530077 m!510619))

(declare-fun m!510621 () Bool)

(assert (=> b!530077 m!510621))

(declare-fun m!510623 () Bool)

(assert (=> b!530077 m!510623))

(declare-fun m!510625 () Bool)

(assert (=> b!530077 m!510625))

(declare-fun m!510627 () Bool)

(assert (=> b!530077 m!510627))

(assert (=> b!530077 m!510605))

(declare-fun m!510629 () Bool)

(assert (=> b!530077 m!510629))

(assert (=> b!530077 m!510605))

(declare-fun m!510631 () Bool)

(assert (=> b!530077 m!510631))

(declare-fun m!510633 () Bool)

(assert (=> b!530077 m!510633))

(declare-fun m!510635 () Bool)

(assert (=> b!530074 m!510635))

(check-sat (not b!530076) (not start!48128) (not b!530079) (not b!530074) (not b!530078) (not b!530071) (not b!530075) (not b!530077) (not b!530073) (not b!530072))
(check-sat)
