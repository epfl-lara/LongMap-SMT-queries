; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45222 () Bool)

(assert start!45222)

(declare-fun b!496486 () Bool)

(declare-fun e!291145 () Bool)

(declare-fun e!291144 () Bool)

(assert (=> b!496486 (= e!291145 (not e!291144))))

(declare-fun res!298874 () Bool)

(assert (=> b!496486 (=> res!298874 e!291144)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32110 0))(
  ( (array!32111 (arr!15438 (Array (_ BitVec 32) (_ BitVec 64))) (size!15802 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32110)

(declare-datatypes ((SeekEntryResult!3905 0))(
  ( (MissingZero!3905 (index!17799 (_ BitVec 32))) (Found!3905 (index!17800 (_ BitVec 32))) (Intermediate!3905 (undefined!4717 Bool) (index!17801 (_ BitVec 32)) (x!46861 (_ BitVec 32))) (Undefined!3905) (MissingVacant!3905 (index!17802 (_ BitVec 32))) )
))
(declare-fun lt!224763 () SeekEntryResult!3905)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224767 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32110 (_ BitVec 32)) SeekEntryResult!3905)

(assert (=> b!496486 (= res!298874 (= lt!224763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224767 (select (store (arr!15438 a!3235) i!1204 k!2280) j!176) (array!32111 (store (arr!15438 a!3235) i!1204 k!2280) (size!15802 a!3235)) mask!3524)))))

(declare-fun lt!224764 () (_ BitVec 32))

(assert (=> b!496486 (= lt!224763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224764 (select (arr!15438 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496486 (= lt!224767 (toIndex!0 (select (store (arr!15438 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496486 (= lt!224764 (toIndex!0 (select (arr!15438 a!3235) j!176) mask!3524))))

(declare-fun e!291143 () Bool)

(assert (=> b!496486 e!291143))

(declare-fun res!298883 () Bool)

(assert (=> b!496486 (=> (not res!298883) (not e!291143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32110 (_ BitVec 32)) Bool)

(assert (=> b!496486 (= res!298883 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14756 0))(
  ( (Unit!14757) )
))
(declare-fun lt!224766 () Unit!14756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14756)

(assert (=> b!496486 (= lt!224766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496487 () Bool)

(declare-fun e!291146 () Bool)

(assert (=> b!496487 (= e!291146 e!291145)))

(declare-fun res!298875 () Bool)

(assert (=> b!496487 (=> (not res!298875) (not e!291145))))

(declare-fun lt!224765 () SeekEntryResult!3905)

(assert (=> b!496487 (= res!298875 (or (= lt!224765 (MissingZero!3905 i!1204)) (= lt!224765 (MissingVacant!3905 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32110 (_ BitVec 32)) SeekEntryResult!3905)

(assert (=> b!496487 (= lt!224765 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496488 () Bool)

(declare-fun res!298877 () Bool)

(assert (=> b!496488 (=> (not res!298877) (not e!291145))))

(declare-datatypes ((List!9596 0))(
  ( (Nil!9593) (Cons!9592 (h!10463 (_ BitVec 64)) (t!15824 List!9596)) )
))
(declare-fun arrayNoDuplicates!0 (array!32110 (_ BitVec 32) List!9596) Bool)

(assert (=> b!496488 (= res!298877 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9593))))

(declare-fun b!496489 () Bool)

(declare-fun res!298876 () Bool)

(assert (=> b!496489 (=> (not res!298876) (not e!291146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496489 (= res!298876 (validKeyInArray!0 (select (arr!15438 a!3235) j!176)))))

(declare-fun b!496490 () Bool)

(assert (=> b!496490 (= e!291144 true)))

(assert (=> b!496490 (and (bvslt (x!46861 lt!224763) #b01111111111111111111111111111110) (or (= (select (arr!15438 a!3235) (index!17801 lt!224763)) (select (arr!15438 a!3235) j!176)) (= (select (arr!15438 a!3235) (index!17801 lt!224763)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15438 a!3235) (index!17801 lt!224763)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496491 () Bool)

(assert (=> b!496491 (= e!291143 (= (seekEntryOrOpen!0 (select (arr!15438 a!3235) j!176) a!3235 mask!3524) (Found!3905 j!176)))))

(declare-fun res!298881 () Bool)

(assert (=> start!45222 (=> (not res!298881) (not e!291146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45222 (= res!298881 (validMask!0 mask!3524))))

(assert (=> start!45222 e!291146))

(assert (=> start!45222 true))

(declare-fun array_inv!11234 (array!32110) Bool)

(assert (=> start!45222 (array_inv!11234 a!3235)))

(declare-fun b!496492 () Bool)

(declare-fun res!298873 () Bool)

(assert (=> b!496492 (=> (not res!298873) (not e!291146))))

(assert (=> b!496492 (= res!298873 (and (= (size!15802 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15802 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15802 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496493 () Bool)

(declare-fun res!298880 () Bool)

(assert (=> b!496493 (=> res!298880 e!291144)))

(assert (=> b!496493 (= res!298880 (or (undefined!4717 lt!224763) (not (is-Intermediate!3905 lt!224763))))))

(declare-fun b!496494 () Bool)

(declare-fun res!298879 () Bool)

(assert (=> b!496494 (=> (not res!298879) (not e!291145))))

(assert (=> b!496494 (= res!298879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496495 () Bool)

(declare-fun res!298882 () Bool)

(assert (=> b!496495 (=> (not res!298882) (not e!291146))))

(declare-fun arrayContainsKey!0 (array!32110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496495 (= res!298882 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496496 () Bool)

(declare-fun res!298878 () Bool)

(assert (=> b!496496 (=> (not res!298878) (not e!291146))))

(assert (=> b!496496 (= res!298878 (validKeyInArray!0 k!2280))))

(assert (= (and start!45222 res!298881) b!496492))

(assert (= (and b!496492 res!298873) b!496489))

(assert (= (and b!496489 res!298876) b!496496))

(assert (= (and b!496496 res!298878) b!496495))

(assert (= (and b!496495 res!298882) b!496487))

(assert (= (and b!496487 res!298875) b!496494))

(assert (= (and b!496494 res!298879) b!496488))

(assert (= (and b!496488 res!298877) b!496486))

(assert (= (and b!496486 res!298883) b!496491))

(assert (= (and b!496486 (not res!298874)) b!496493))

(assert (= (and b!496493 (not res!298880)) b!496490))

(declare-fun m!477729 () Bool)

(assert (=> b!496494 m!477729))

(declare-fun m!477731 () Bool)

(assert (=> b!496487 m!477731))

(declare-fun m!477733 () Bool)

(assert (=> b!496496 m!477733))

(declare-fun m!477735 () Bool)

(assert (=> b!496488 m!477735))

(declare-fun m!477737 () Bool)

(assert (=> b!496489 m!477737))

(assert (=> b!496489 m!477737))

(declare-fun m!477739 () Bool)

(assert (=> b!496489 m!477739))

(declare-fun m!477741 () Bool)

(assert (=> b!496486 m!477741))

(declare-fun m!477743 () Bool)

(assert (=> b!496486 m!477743))

(declare-fun m!477745 () Bool)

(assert (=> b!496486 m!477745))

(assert (=> b!496486 m!477737))

(declare-fun m!477747 () Bool)

(assert (=> b!496486 m!477747))

(assert (=> b!496486 m!477745))

(declare-fun m!477749 () Bool)

(assert (=> b!496486 m!477749))

(assert (=> b!496486 m!477737))

(declare-fun m!477751 () Bool)

(assert (=> b!496486 m!477751))

(assert (=> b!496486 m!477745))

(declare-fun m!477753 () Bool)

(assert (=> b!496486 m!477753))

(assert (=> b!496486 m!477737))

(declare-fun m!477755 () Bool)

(assert (=> b!496486 m!477755))

(assert (=> b!496491 m!477737))

(assert (=> b!496491 m!477737))

(declare-fun m!477757 () Bool)

(assert (=> b!496491 m!477757))

(declare-fun m!477759 () Bool)

(assert (=> start!45222 m!477759))

(declare-fun m!477761 () Bool)

(assert (=> start!45222 m!477761))

(declare-fun m!477763 () Bool)

(assert (=> b!496490 m!477763))

(assert (=> b!496490 m!477737))

(declare-fun m!477765 () Bool)

(assert (=> b!496495 m!477765))

(push 1)

(assert (not b!496488))

(assert (not b!496496))

(assert (not b!496487))

(assert (not b!496486))

(assert (not b!496494))

(assert (not b!496491))

(assert (not b!496489))

(assert (not start!45222))

(assert (not b!496495))

(check-sat)

(pop 1)

