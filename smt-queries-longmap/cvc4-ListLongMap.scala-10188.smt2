; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120058 () Bool)

(assert start!120058)

(declare-fun b!1397743 () Bool)

(declare-fun res!936656 () Bool)

(declare-fun e!791300 () Bool)

(assert (=> b!1397743 (=> (not res!936656) (not e!791300))))

(declare-datatypes ((array!95587 0))(
  ( (array!95588 (arr!46147 (Array (_ BitVec 32) (_ BitVec 64))) (size!46697 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95587)

(declare-datatypes ((List!32666 0))(
  ( (Nil!32663) (Cons!32662 (h!33904 (_ BitVec 64)) (t!47360 List!32666)) )
))
(declare-fun arrayNoDuplicates!0 (array!95587 (_ BitVec 32) List!32666) Bool)

(assert (=> b!1397743 (= res!936656 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32663))))

(declare-fun b!1397744 () Bool)

(declare-fun res!936660 () Bool)

(assert (=> b!1397744 (=> (not res!936660) (not e!791300))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397744 (= res!936660 (validKeyInArray!0 (select (arr!46147 a!2901) i!1037)))))

(declare-fun b!1397745 () Bool)

(declare-fun res!936662 () Bool)

(assert (=> b!1397745 (=> (not res!936662) (not e!791300))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95587 (_ BitVec 32)) Bool)

(assert (=> b!1397745 (= res!936662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936658 () Bool)

(assert (=> start!120058 (=> (not res!936658) (not e!791300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120058 (= res!936658 (validMask!0 mask!2840))))

(assert (=> start!120058 e!791300))

(assert (=> start!120058 true))

(declare-fun array_inv!35175 (array!95587) Bool)

(assert (=> start!120058 (array_inv!35175 a!2901)))

(declare-fun b!1397746 () Bool)

(declare-fun res!936659 () Bool)

(assert (=> b!1397746 (=> (not res!936659) (not e!791300))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397746 (= res!936659 (and (= (size!46697 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46697 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46697 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397747 () Bool)

(declare-fun e!791303 () Bool)

(assert (=> b!1397747 (= e!791300 (not e!791303))))

(declare-fun res!936657 () Bool)

(assert (=> b!1397747 (=> res!936657 e!791303)))

(declare-datatypes ((SeekEntryResult!10464 0))(
  ( (MissingZero!10464 (index!44227 (_ BitVec 32))) (Found!10464 (index!44228 (_ BitVec 32))) (Intermediate!10464 (undefined!11276 Bool) (index!44229 (_ BitVec 32)) (x!125878 (_ BitVec 32))) (Undefined!10464) (MissingVacant!10464 (index!44230 (_ BitVec 32))) )
))
(declare-fun lt!614445 () SeekEntryResult!10464)

(assert (=> b!1397747 (= res!936657 (or (not (is-Intermediate!10464 lt!614445)) (undefined!11276 lt!614445)))))

(declare-fun e!791299 () Bool)

(assert (=> b!1397747 e!791299))

(declare-fun res!936664 () Bool)

(assert (=> b!1397747 (=> (not res!936664) (not e!791299))))

(assert (=> b!1397747 (= res!936664 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46932 0))(
  ( (Unit!46933) )
))
(declare-fun lt!614443 () Unit!46932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46932)

(assert (=> b!1397747 (= lt!614443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614439 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95587 (_ BitVec 32)) SeekEntryResult!10464)

(assert (=> b!1397747 (= lt!614445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614439 (select (arr!46147 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397747 (= lt!614439 (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840))))

(declare-fun b!1397748 () Bool)

(declare-fun res!936663 () Bool)

(assert (=> b!1397748 (=> (not res!936663) (not e!791300))))

(assert (=> b!1397748 (= res!936663 (validKeyInArray!0 (select (arr!46147 a!2901) j!112)))))

(declare-fun b!1397749 () Bool)

(declare-fun e!791302 () Bool)

(assert (=> b!1397749 (= e!791302 true)))

(declare-fun lt!614442 () SeekEntryResult!10464)

(declare-fun lt!614440 () (_ BitVec 64))

(declare-fun lt!614444 () array!95587)

(assert (=> b!1397749 (= lt!614442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614439 lt!614440 lt!614444 mask!2840))))

(declare-fun b!1397750 () Bool)

(assert (=> b!1397750 (= e!791303 e!791302)))

(declare-fun res!936661 () Bool)

(assert (=> b!1397750 (=> res!936661 e!791302)))

(declare-fun lt!614441 () SeekEntryResult!10464)

(assert (=> b!1397750 (= res!936661 (or (= lt!614445 lt!614441) (not (is-Intermediate!10464 lt!614441)) (bvslt (x!125878 lt!614445) #b00000000000000000000000000000000) (bvsgt (x!125878 lt!614445) #b01111111111111111111111111111110) (bvslt lt!614439 #b00000000000000000000000000000000) (bvsge lt!614439 (size!46697 a!2901)) (bvslt (index!44229 lt!614445) #b00000000000000000000000000000000) (bvsge (index!44229 lt!614445) (size!46697 a!2901)) (not (= lt!614445 (Intermediate!10464 false (index!44229 lt!614445) (x!125878 lt!614445)))) (not (= lt!614441 (Intermediate!10464 (undefined!11276 lt!614441) (index!44229 lt!614441) (x!125878 lt!614441))))))))

(assert (=> b!1397750 (= lt!614441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614440 mask!2840) lt!614440 lt!614444 mask!2840))))

(assert (=> b!1397750 (= lt!614440 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397750 (= lt!614444 (array!95588 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46697 a!2901)))))

(declare-fun b!1397751 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95587 (_ BitVec 32)) SeekEntryResult!10464)

(assert (=> b!1397751 (= e!791299 (= (seekEntryOrOpen!0 (select (arr!46147 a!2901) j!112) a!2901 mask!2840) (Found!10464 j!112)))))

(assert (= (and start!120058 res!936658) b!1397746))

(assert (= (and b!1397746 res!936659) b!1397744))

(assert (= (and b!1397744 res!936660) b!1397748))

(assert (= (and b!1397748 res!936663) b!1397745))

(assert (= (and b!1397745 res!936662) b!1397743))

(assert (= (and b!1397743 res!936656) b!1397747))

(assert (= (and b!1397747 res!936664) b!1397751))

(assert (= (and b!1397747 (not res!936657)) b!1397750))

(assert (= (and b!1397750 (not res!936661)) b!1397749))

(declare-fun m!1284615 () Bool)

(assert (=> b!1397748 m!1284615))

(assert (=> b!1397748 m!1284615))

(declare-fun m!1284617 () Bool)

(assert (=> b!1397748 m!1284617))

(declare-fun m!1284619 () Bool)

(assert (=> b!1397749 m!1284619))

(declare-fun m!1284621 () Bool)

(assert (=> b!1397750 m!1284621))

(assert (=> b!1397750 m!1284621))

(declare-fun m!1284623 () Bool)

(assert (=> b!1397750 m!1284623))

(declare-fun m!1284625 () Bool)

(assert (=> b!1397750 m!1284625))

(declare-fun m!1284627 () Bool)

(assert (=> b!1397750 m!1284627))

(assert (=> b!1397747 m!1284615))

(declare-fun m!1284629 () Bool)

(assert (=> b!1397747 m!1284629))

(assert (=> b!1397747 m!1284615))

(assert (=> b!1397747 m!1284615))

(declare-fun m!1284631 () Bool)

(assert (=> b!1397747 m!1284631))

(declare-fun m!1284633 () Bool)

(assert (=> b!1397747 m!1284633))

(declare-fun m!1284635 () Bool)

(assert (=> b!1397747 m!1284635))

(declare-fun m!1284637 () Bool)

(assert (=> b!1397745 m!1284637))

(declare-fun m!1284639 () Bool)

(assert (=> b!1397744 m!1284639))

(assert (=> b!1397744 m!1284639))

(declare-fun m!1284641 () Bool)

(assert (=> b!1397744 m!1284641))

(declare-fun m!1284643 () Bool)

(assert (=> start!120058 m!1284643))

(declare-fun m!1284645 () Bool)

(assert (=> start!120058 m!1284645))

(assert (=> b!1397751 m!1284615))

(assert (=> b!1397751 m!1284615))

(declare-fun m!1284647 () Bool)

(assert (=> b!1397751 m!1284647))

(declare-fun m!1284649 () Bool)

(assert (=> b!1397743 m!1284649))

(push 1)

