; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119718 () Bool)

(assert start!119718)

(declare-fun b!1394602 () Bool)

(declare-fun res!934016 () Bool)

(declare-fun e!789576 () Bool)

(assert (=> b!1394602 (=> (not res!934016) (not e!789576))))

(declare-datatypes ((array!95400 0))(
  ( (array!95401 (arr!46058 (Array (_ BitVec 32) (_ BitVec 64))) (size!46608 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95400)

(declare-datatypes ((List!32577 0))(
  ( (Nil!32574) (Cons!32573 (h!33806 (_ BitVec 64)) (t!47271 List!32577)) )
))
(declare-fun arrayNoDuplicates!0 (array!95400 (_ BitVec 32) List!32577) Bool)

(assert (=> b!1394602 (= res!934016 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32574))))

(declare-fun b!1394603 () Bool)

(declare-fun res!934013 () Bool)

(assert (=> b!1394603 (=> (not res!934013) (not e!789576))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95400 (_ BitVec 32)) Bool)

(assert (=> b!1394603 (= res!934013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394604 () Bool)

(declare-fun res!934018 () Bool)

(declare-fun e!789578 () Bool)

(assert (=> b!1394604 (=> res!934018 e!789578)))

(declare-fun lt!612602 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10375 0))(
  ( (MissingZero!10375 (index!43871 (_ BitVec 32))) (Found!10375 (index!43872 (_ BitVec 32))) (Intermediate!10375 (undefined!11187 Bool) (index!43873 (_ BitVec 32)) (x!125539 (_ BitVec 32))) (Undefined!10375) (MissingVacant!10375 (index!43874 (_ BitVec 32))) )
))
(declare-fun lt!612599 () SeekEntryResult!10375)

(assert (=> b!1394604 (= res!934018 (or (bvslt (x!125539 lt!612599) #b00000000000000000000000000000000) (bvsgt (x!125539 lt!612599) #b01111111111111111111111111111110) (bvslt lt!612602 #b00000000000000000000000000000000) (bvsge lt!612602 (size!46608 a!2901)) (bvslt (index!43873 lt!612599) #b00000000000000000000000000000000) (bvsge (index!43873 lt!612599) (size!46608 a!2901)) (not (= lt!612599 (Intermediate!10375 false (index!43873 lt!612599) (x!125539 lt!612599))))))))

(declare-fun b!1394605 () Bool)

(assert (=> b!1394605 (= e!789578 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612600 () SeekEntryResult!10375)

(declare-fun lt!612597 () array!95400)

(declare-fun lt!612601 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10375)

(assert (=> b!1394605 (= lt!612600 (seekEntryOrOpen!0 lt!612601 lt!612597 mask!2840))))

(declare-datatypes ((Unit!46754 0))(
  ( (Unit!46755) )
))
(declare-fun lt!612603 () Unit!46754)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46754)

(assert (=> b!1394605 (= lt!612603 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612602 (x!125539 lt!612599) (index!43873 lt!612599) mask!2840))))

(declare-fun b!1394606 () Bool)

(declare-fun e!789575 () Bool)

(assert (=> b!1394606 (= e!789576 (not e!789575))))

(declare-fun res!934010 () Bool)

(assert (=> b!1394606 (=> res!934010 e!789575)))

(assert (=> b!1394606 (= res!934010 (or (not (is-Intermediate!10375 lt!612599)) (undefined!11187 lt!612599)))))

(assert (=> b!1394606 (= lt!612600 (Found!10375 j!112))))

(assert (=> b!1394606 (= lt!612600 (seekEntryOrOpen!0 (select (arr!46058 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394606 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612598 () Unit!46754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46754)

(assert (=> b!1394606 (= lt!612598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10375)

(assert (=> b!1394606 (= lt!612599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612602 (select (arr!46058 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394606 (= lt!612602 (toIndex!0 (select (arr!46058 a!2901) j!112) mask!2840))))

(declare-fun b!1394607 () Bool)

(assert (=> b!1394607 (= e!789575 e!789578)))

(declare-fun res!934015 () Bool)

(assert (=> b!1394607 (=> res!934015 e!789578)))

(assert (=> b!1394607 (= res!934015 (not (= lt!612599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612601 mask!2840) lt!612601 lt!612597 mask!2840))))))

(assert (=> b!1394607 (= lt!612601 (select (store (arr!46058 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394607 (= lt!612597 (array!95401 (store (arr!46058 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46608 a!2901)))))

(declare-fun res!934012 () Bool)

(assert (=> start!119718 (=> (not res!934012) (not e!789576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119718 (= res!934012 (validMask!0 mask!2840))))

(assert (=> start!119718 e!789576))

(assert (=> start!119718 true))

(declare-fun array_inv!35086 (array!95400) Bool)

(assert (=> start!119718 (array_inv!35086 a!2901)))

(declare-fun b!1394608 () Bool)

(declare-fun res!934017 () Bool)

(assert (=> b!1394608 (=> (not res!934017) (not e!789576))))

(assert (=> b!1394608 (= res!934017 (and (= (size!46608 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46608 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46608 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394609 () Bool)

(declare-fun res!934014 () Bool)

(assert (=> b!1394609 (=> (not res!934014) (not e!789576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394609 (= res!934014 (validKeyInArray!0 (select (arr!46058 a!2901) j!112)))))

(declare-fun b!1394610 () Bool)

(declare-fun res!934011 () Bool)

(assert (=> b!1394610 (=> (not res!934011) (not e!789576))))

(assert (=> b!1394610 (= res!934011 (validKeyInArray!0 (select (arr!46058 a!2901) i!1037)))))

(assert (= (and start!119718 res!934012) b!1394608))

(assert (= (and b!1394608 res!934017) b!1394610))

(assert (= (and b!1394610 res!934011) b!1394609))

(assert (= (and b!1394609 res!934014) b!1394603))

(assert (= (and b!1394603 res!934013) b!1394602))

(assert (= (and b!1394602 res!934016) b!1394606))

(assert (= (and b!1394606 (not res!934010)) b!1394607))

(assert (= (and b!1394607 (not res!934015)) b!1394604))

(assert (= (and b!1394604 (not res!934018)) b!1394605))

(declare-fun m!1280991 () Bool)

(assert (=> start!119718 m!1280991))

(declare-fun m!1280993 () Bool)

(assert (=> start!119718 m!1280993))

(declare-fun m!1280995 () Bool)

(assert (=> b!1394605 m!1280995))

(declare-fun m!1280997 () Bool)

(assert (=> b!1394605 m!1280997))

(declare-fun m!1280999 () Bool)

(assert (=> b!1394607 m!1280999))

(assert (=> b!1394607 m!1280999))

(declare-fun m!1281001 () Bool)

(assert (=> b!1394607 m!1281001))

(declare-fun m!1281003 () Bool)

(assert (=> b!1394607 m!1281003))

(declare-fun m!1281005 () Bool)

(assert (=> b!1394607 m!1281005))

(declare-fun m!1281007 () Bool)

(assert (=> b!1394609 m!1281007))

(assert (=> b!1394609 m!1281007))

(declare-fun m!1281009 () Bool)

(assert (=> b!1394609 m!1281009))

(declare-fun m!1281011 () Bool)

(assert (=> b!1394602 m!1281011))

(assert (=> b!1394606 m!1281007))

(declare-fun m!1281013 () Bool)

(assert (=> b!1394606 m!1281013))

(assert (=> b!1394606 m!1281007))

(assert (=> b!1394606 m!1281007))

(declare-fun m!1281015 () Bool)

(assert (=> b!1394606 m!1281015))

(declare-fun m!1281017 () Bool)

(assert (=> b!1394606 m!1281017))

(assert (=> b!1394606 m!1281007))

(declare-fun m!1281019 () Bool)

(assert (=> b!1394606 m!1281019))

(declare-fun m!1281021 () Bool)

(assert (=> b!1394606 m!1281021))

(declare-fun m!1281023 () Bool)

(assert (=> b!1394603 m!1281023))

(declare-fun m!1281025 () Bool)

(assert (=> b!1394610 m!1281025))

(assert (=> b!1394610 m!1281025))

(declare-fun m!1281027 () Bool)

(assert (=> b!1394610 m!1281027))

(push 1)

