; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120056 () Bool)

(assert start!120056)

(declare-fun b!1397716 () Bool)

(declare-fun e!791288 () Bool)

(declare-fun e!791285 () Bool)

(assert (=> b!1397716 (= e!791288 (not e!791285))))

(declare-fun res!936635 () Bool)

(assert (=> b!1397716 (=> res!936635 e!791285)))

(declare-datatypes ((SeekEntryResult!10463 0))(
  ( (MissingZero!10463 (index!44223 (_ BitVec 32))) (Found!10463 (index!44224 (_ BitVec 32))) (Intermediate!10463 (undefined!11275 Bool) (index!44225 (_ BitVec 32)) (x!125877 (_ BitVec 32))) (Undefined!10463) (MissingVacant!10463 (index!44226 (_ BitVec 32))) )
))
(declare-fun lt!614420 () SeekEntryResult!10463)

(get-info :version)

(assert (=> b!1397716 (= res!936635 (or (not ((_ is Intermediate!10463) lt!614420)) (undefined!11275 lt!614420)))))

(declare-fun e!791286 () Bool)

(assert (=> b!1397716 e!791286))

(declare-fun res!936630 () Bool)

(assert (=> b!1397716 (=> (not res!936630) (not e!791286))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95585 0))(
  ( (array!95586 (arr!46146 (Array (_ BitVec 32) (_ BitVec 64))) (size!46696 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95585)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95585 (_ BitVec 32)) Bool)

(assert (=> b!1397716 (= res!936630 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46930 0))(
  ( (Unit!46931) )
))
(declare-fun lt!614422 () Unit!46930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46930)

(assert (=> b!1397716 (= lt!614422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614419 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95585 (_ BitVec 32)) SeekEntryResult!10463)

(assert (=> b!1397716 (= lt!614420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614419 (select (arr!46146 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397716 (= lt!614419 (toIndex!0 (select (arr!46146 a!2901) j!112) mask!2840))))

(declare-fun b!1397717 () Bool)

(declare-fun res!936634 () Bool)

(assert (=> b!1397717 (=> (not res!936634) (not e!791288))))

(assert (=> b!1397717 (= res!936634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397718 () Bool)

(declare-fun res!936633 () Bool)

(assert (=> b!1397718 (=> (not res!936633) (not e!791288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397718 (= res!936633 (validKeyInArray!0 (select (arr!46146 a!2901) j!112)))))

(declare-fun b!1397719 () Bool)

(declare-fun e!791287 () Bool)

(assert (=> b!1397719 (= e!791287 true)))

(declare-fun lt!614424 () (_ BitVec 64))

(declare-fun lt!614423 () array!95585)

(declare-fun lt!614418 () SeekEntryResult!10463)

(assert (=> b!1397719 (= lt!614418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614419 lt!614424 lt!614423 mask!2840))))

(declare-fun b!1397720 () Bool)

(declare-fun res!936637 () Bool)

(assert (=> b!1397720 (=> (not res!936637) (not e!791288))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397720 (= res!936637 (and (= (size!46696 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46696 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46696 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!936631 () Bool)

(assert (=> start!120056 (=> (not res!936631) (not e!791288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120056 (= res!936631 (validMask!0 mask!2840))))

(assert (=> start!120056 e!791288))

(assert (=> start!120056 true))

(declare-fun array_inv!35174 (array!95585) Bool)

(assert (=> start!120056 (array_inv!35174 a!2901)))

(declare-fun b!1397721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95585 (_ BitVec 32)) SeekEntryResult!10463)

(assert (=> b!1397721 (= e!791286 (= (seekEntryOrOpen!0 (select (arr!46146 a!2901) j!112) a!2901 mask!2840) (Found!10463 j!112)))))

(declare-fun b!1397722 () Bool)

(assert (=> b!1397722 (= e!791285 e!791287)))

(declare-fun res!936629 () Bool)

(assert (=> b!1397722 (=> res!936629 e!791287)))

(declare-fun lt!614421 () SeekEntryResult!10463)

(assert (=> b!1397722 (= res!936629 (or (= lt!614420 lt!614421) (not ((_ is Intermediate!10463) lt!614421)) (bvslt (x!125877 lt!614420) #b00000000000000000000000000000000) (bvsgt (x!125877 lt!614420) #b01111111111111111111111111111110) (bvslt lt!614419 #b00000000000000000000000000000000) (bvsge lt!614419 (size!46696 a!2901)) (bvslt (index!44225 lt!614420) #b00000000000000000000000000000000) (bvsge (index!44225 lt!614420) (size!46696 a!2901)) (not (= lt!614420 (Intermediate!10463 false (index!44225 lt!614420) (x!125877 lt!614420)))) (not (= lt!614421 (Intermediate!10463 (undefined!11275 lt!614421) (index!44225 lt!614421) (x!125877 lt!614421))))))))

(assert (=> b!1397722 (= lt!614421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614424 mask!2840) lt!614424 lt!614423 mask!2840))))

(assert (=> b!1397722 (= lt!614424 (select (store (arr!46146 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397722 (= lt!614423 (array!95586 (store (arr!46146 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46696 a!2901)))))

(declare-fun b!1397723 () Bool)

(declare-fun res!936636 () Bool)

(assert (=> b!1397723 (=> (not res!936636) (not e!791288))))

(declare-datatypes ((List!32665 0))(
  ( (Nil!32662) (Cons!32661 (h!33903 (_ BitVec 64)) (t!47359 List!32665)) )
))
(declare-fun arrayNoDuplicates!0 (array!95585 (_ BitVec 32) List!32665) Bool)

(assert (=> b!1397723 (= res!936636 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32662))))

(declare-fun b!1397724 () Bool)

(declare-fun res!936632 () Bool)

(assert (=> b!1397724 (=> (not res!936632) (not e!791288))))

(assert (=> b!1397724 (= res!936632 (validKeyInArray!0 (select (arr!46146 a!2901) i!1037)))))

(assert (= (and start!120056 res!936631) b!1397720))

(assert (= (and b!1397720 res!936637) b!1397724))

(assert (= (and b!1397724 res!936632) b!1397718))

(assert (= (and b!1397718 res!936633) b!1397717))

(assert (= (and b!1397717 res!936634) b!1397723))

(assert (= (and b!1397723 res!936636) b!1397716))

(assert (= (and b!1397716 res!936630) b!1397721))

(assert (= (and b!1397716 (not res!936635)) b!1397722))

(assert (= (and b!1397722 (not res!936629)) b!1397719))

(declare-fun m!1284579 () Bool)

(assert (=> b!1397723 m!1284579))

(declare-fun m!1284581 () Bool)

(assert (=> b!1397721 m!1284581))

(assert (=> b!1397721 m!1284581))

(declare-fun m!1284583 () Bool)

(assert (=> b!1397721 m!1284583))

(declare-fun m!1284585 () Bool)

(assert (=> b!1397717 m!1284585))

(assert (=> b!1397716 m!1284581))

(declare-fun m!1284587 () Bool)

(assert (=> b!1397716 m!1284587))

(assert (=> b!1397716 m!1284581))

(declare-fun m!1284589 () Bool)

(assert (=> b!1397716 m!1284589))

(assert (=> b!1397716 m!1284581))

(declare-fun m!1284591 () Bool)

(assert (=> b!1397716 m!1284591))

(declare-fun m!1284593 () Bool)

(assert (=> b!1397716 m!1284593))

(declare-fun m!1284595 () Bool)

(assert (=> b!1397722 m!1284595))

(assert (=> b!1397722 m!1284595))

(declare-fun m!1284597 () Bool)

(assert (=> b!1397722 m!1284597))

(declare-fun m!1284599 () Bool)

(assert (=> b!1397722 m!1284599))

(declare-fun m!1284601 () Bool)

(assert (=> b!1397722 m!1284601))

(assert (=> b!1397718 m!1284581))

(assert (=> b!1397718 m!1284581))

(declare-fun m!1284603 () Bool)

(assert (=> b!1397718 m!1284603))

(declare-fun m!1284605 () Bool)

(assert (=> b!1397724 m!1284605))

(assert (=> b!1397724 m!1284605))

(declare-fun m!1284607 () Bool)

(assert (=> b!1397724 m!1284607))

(declare-fun m!1284609 () Bool)

(assert (=> b!1397719 m!1284609))

(declare-fun m!1284611 () Bool)

(assert (=> start!120056 m!1284611))

(declare-fun m!1284613 () Bool)

(assert (=> start!120056 m!1284613))

(check-sat (not b!1397722) (not b!1397717) (not b!1397719) (not b!1397723) (not b!1397718) (not start!120056) (not b!1397724) (not b!1397716) (not b!1397721))
(check-sat)
