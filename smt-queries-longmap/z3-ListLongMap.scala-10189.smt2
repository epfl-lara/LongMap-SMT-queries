; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120062 () Bool)

(assert start!120062)

(declare-fun b!1397797 () Bool)

(declare-fun res!936715 () Bool)

(declare-fun e!791333 () Bool)

(assert (=> b!1397797 (=> (not res!936715) (not e!791333))))

(declare-datatypes ((array!95591 0))(
  ( (array!95592 (arr!46149 (Array (_ BitVec 32) (_ BitVec 64))) (size!46699 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95591)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397797 (= res!936715 (validKeyInArray!0 (select (arr!46149 a!2901) j!112)))))

(declare-fun res!936716 () Bool)

(assert (=> start!120062 (=> (not res!936716) (not e!791333))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120062 (= res!936716 (validMask!0 mask!2840))))

(assert (=> start!120062 e!791333))

(assert (=> start!120062 true))

(declare-fun array_inv!35177 (array!95591) Bool)

(assert (=> start!120062 (array_inv!35177 a!2901)))

(declare-fun e!791330 () Bool)

(declare-fun b!1397798 () Bool)

(declare-datatypes ((SeekEntryResult!10466 0))(
  ( (MissingZero!10466 (index!44235 (_ BitVec 32))) (Found!10466 (index!44236 (_ BitVec 32))) (Intermediate!10466 (undefined!11278 Bool) (index!44237 (_ BitVec 32)) (x!125888 (_ BitVec 32))) (Undefined!10466) (MissingVacant!10466 (index!44238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95591 (_ BitVec 32)) SeekEntryResult!10466)

(assert (=> b!1397798 (= e!791330 (= (seekEntryOrOpen!0 (select (arr!46149 a!2901) j!112) a!2901 mask!2840) (Found!10466 j!112)))))

(declare-fun b!1397799 () Bool)

(declare-fun res!936711 () Bool)

(assert (=> b!1397799 (=> (not res!936711) (not e!791333))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397799 (= res!936711 (and (= (size!46699 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46699 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46699 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397800 () Bool)

(declare-fun res!936714 () Bool)

(assert (=> b!1397800 (=> (not res!936714) (not e!791333))))

(declare-datatypes ((List!32668 0))(
  ( (Nil!32665) (Cons!32664 (h!33906 (_ BitVec 64)) (t!47362 List!32668)) )
))
(declare-fun arrayNoDuplicates!0 (array!95591 (_ BitVec 32) List!32668) Bool)

(assert (=> b!1397800 (= res!936714 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32665))))

(declare-fun b!1397801 () Bool)

(declare-fun e!791331 () Bool)

(declare-fun e!791329 () Bool)

(assert (=> b!1397801 (= e!791331 e!791329)))

(declare-fun res!936718 () Bool)

(assert (=> b!1397801 (=> res!936718 e!791329)))

(declare-fun lt!614485 () SeekEntryResult!10466)

(declare-fun lt!614481 () (_ BitVec 32))

(declare-fun lt!614482 () SeekEntryResult!10466)

(get-info :version)

(assert (=> b!1397801 (= res!936718 (or (= lt!614482 lt!614485) (not ((_ is Intermediate!10466) lt!614485)) (bvslt (x!125888 lt!614482) #b00000000000000000000000000000000) (bvsgt (x!125888 lt!614482) #b01111111111111111111111111111110) (bvslt lt!614481 #b00000000000000000000000000000000) (bvsge lt!614481 (size!46699 a!2901)) (bvslt (index!44237 lt!614482) #b00000000000000000000000000000000) (bvsge (index!44237 lt!614482) (size!46699 a!2901)) (not (= lt!614482 (Intermediate!10466 false (index!44237 lt!614482) (x!125888 lt!614482)))) (not (= lt!614485 (Intermediate!10466 (undefined!11278 lt!614485) (index!44237 lt!614485) (x!125888 lt!614485))))))))

(declare-fun lt!614487 () (_ BitVec 64))

(declare-fun lt!614484 () array!95591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95591 (_ BitVec 32)) SeekEntryResult!10466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397801 (= lt!614485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614487 mask!2840) lt!614487 lt!614484 mask!2840))))

(assert (=> b!1397801 (= lt!614487 (select (store (arr!46149 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397801 (= lt!614484 (array!95592 (store (arr!46149 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46699 a!2901)))))

(declare-fun b!1397802 () Bool)

(declare-fun res!936717 () Bool)

(assert (=> b!1397802 (=> (not res!936717) (not e!791333))))

(assert (=> b!1397802 (= res!936717 (validKeyInArray!0 (select (arr!46149 a!2901) i!1037)))))

(declare-fun b!1397803 () Bool)

(declare-fun res!936710 () Bool)

(assert (=> b!1397803 (=> (not res!936710) (not e!791333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95591 (_ BitVec 32)) Bool)

(assert (=> b!1397803 (= res!936710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397804 () Bool)

(assert (=> b!1397804 (= e!791329 true)))

(declare-fun lt!614483 () SeekEntryResult!10466)

(assert (=> b!1397804 (= lt!614483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614481 lt!614487 lt!614484 mask!2840))))

(declare-fun b!1397805 () Bool)

(assert (=> b!1397805 (= e!791333 (not e!791331))))

(declare-fun res!936713 () Bool)

(assert (=> b!1397805 (=> res!936713 e!791331)))

(assert (=> b!1397805 (= res!936713 (or (not ((_ is Intermediate!10466) lt!614482)) (undefined!11278 lt!614482)))))

(assert (=> b!1397805 e!791330))

(declare-fun res!936712 () Bool)

(assert (=> b!1397805 (=> (not res!936712) (not e!791330))))

(assert (=> b!1397805 (= res!936712 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46936 0))(
  ( (Unit!46937) )
))
(declare-fun lt!614486 () Unit!46936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46936)

(assert (=> b!1397805 (= lt!614486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397805 (= lt!614482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614481 (select (arr!46149 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397805 (= lt!614481 (toIndex!0 (select (arr!46149 a!2901) j!112) mask!2840))))

(assert (= (and start!120062 res!936716) b!1397799))

(assert (= (and b!1397799 res!936711) b!1397802))

(assert (= (and b!1397802 res!936717) b!1397797))

(assert (= (and b!1397797 res!936715) b!1397803))

(assert (= (and b!1397803 res!936710) b!1397800))

(assert (= (and b!1397800 res!936714) b!1397805))

(assert (= (and b!1397805 res!936712) b!1397798))

(assert (= (and b!1397805 (not res!936713)) b!1397801))

(assert (= (and b!1397801 (not res!936718)) b!1397804))

(declare-fun m!1284687 () Bool)

(assert (=> b!1397805 m!1284687))

(declare-fun m!1284689 () Bool)

(assert (=> b!1397805 m!1284689))

(assert (=> b!1397805 m!1284687))

(declare-fun m!1284691 () Bool)

(assert (=> b!1397805 m!1284691))

(declare-fun m!1284693 () Bool)

(assert (=> b!1397805 m!1284693))

(assert (=> b!1397805 m!1284687))

(declare-fun m!1284695 () Bool)

(assert (=> b!1397805 m!1284695))

(assert (=> b!1397797 m!1284687))

(assert (=> b!1397797 m!1284687))

(declare-fun m!1284697 () Bool)

(assert (=> b!1397797 m!1284697))

(declare-fun m!1284699 () Bool)

(assert (=> b!1397804 m!1284699))

(declare-fun m!1284701 () Bool)

(assert (=> b!1397802 m!1284701))

(assert (=> b!1397802 m!1284701))

(declare-fun m!1284703 () Bool)

(assert (=> b!1397802 m!1284703))

(declare-fun m!1284705 () Bool)

(assert (=> b!1397801 m!1284705))

(assert (=> b!1397801 m!1284705))

(declare-fun m!1284707 () Bool)

(assert (=> b!1397801 m!1284707))

(declare-fun m!1284709 () Bool)

(assert (=> b!1397801 m!1284709))

(declare-fun m!1284711 () Bool)

(assert (=> b!1397801 m!1284711))

(declare-fun m!1284713 () Bool)

(assert (=> start!120062 m!1284713))

(declare-fun m!1284715 () Bool)

(assert (=> start!120062 m!1284715))

(declare-fun m!1284717 () Bool)

(assert (=> b!1397803 m!1284717))

(declare-fun m!1284719 () Bool)

(assert (=> b!1397800 m!1284719))

(assert (=> b!1397798 m!1284687))

(assert (=> b!1397798 m!1284687))

(declare-fun m!1284721 () Bool)

(assert (=> b!1397798 m!1284721))

(check-sat (not b!1397802) (not b!1397800) (not b!1397805) (not b!1397797) (not b!1397798) (not start!120062) (not b!1397803) (not b!1397801) (not b!1397804))
(check-sat)
