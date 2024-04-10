; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119740 () Bool)

(assert start!119740)

(declare-datatypes ((array!95422 0))(
  ( (array!95423 (arr!46069 (Array (_ BitVec 32) (_ BitVec 64))) (size!46619 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95422)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!789719 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1394908 () Bool)

(declare-datatypes ((SeekEntryResult!10386 0))(
  ( (MissingZero!10386 (index!43915 (_ BitVec 32))) (Found!10386 (index!43916 (_ BitVec 32))) (Intermediate!10386 (undefined!11198 Bool) (index!43917 (_ BitVec 32)) (x!125574 (_ BitVec 32))) (Undefined!10386) (MissingVacant!10386 (index!43918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95422 (_ BitVec 32)) SeekEntryResult!10386)

(assert (=> b!1394908 (= e!789719 (= (seekEntryOrOpen!0 (select (arr!46069 a!2901) j!112) a!2901 mask!2840) (Found!10386 j!112)))))

(declare-fun b!1394910 () Bool)

(declare-fun res!934324 () Bool)

(declare-fun e!789717 () Bool)

(assert (=> b!1394910 (=> (not res!934324) (not e!789717))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394910 (= res!934324 (and (= (size!46619 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46619 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46619 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394911 () Bool)

(declare-fun res!934323 () Bool)

(assert (=> b!1394911 (=> (not res!934323) (not e!789717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95422 (_ BitVec 32)) Bool)

(assert (=> b!1394911 (= res!934323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394912 () Bool)

(declare-fun e!789718 () Bool)

(assert (=> b!1394912 (= e!789718 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1394913 () Bool)

(declare-fun res!934320 () Bool)

(assert (=> b!1394913 (=> (not res!934320) (not e!789717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394913 (= res!934320 (validKeyInArray!0 (select (arr!46069 a!2901) j!112)))))

(declare-fun b!1394914 () Bool)

(declare-fun res!934316 () Bool)

(assert (=> b!1394914 (=> res!934316 e!789718)))

(declare-fun lt!612789 () SeekEntryResult!10386)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95422 (_ BitVec 32)) SeekEntryResult!10386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394914 (= res!934316 (= lt!612789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95423 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46619 a!2901)) mask!2840)))))

(declare-fun b!1394915 () Bool)

(declare-fun res!934322 () Bool)

(assert (=> b!1394915 (=> (not res!934322) (not e!789717))))

(assert (=> b!1394915 (= res!934322 (validKeyInArray!0 (select (arr!46069 a!2901) i!1037)))))

(declare-fun b!1394916 () Bool)

(assert (=> b!1394916 (= e!789717 (not e!789718))))

(declare-fun res!934319 () Bool)

(assert (=> b!1394916 (=> res!934319 e!789718)))

(assert (=> b!1394916 (= res!934319 (or (not (is-Intermediate!10386 lt!612789)) (undefined!11198 lt!612789)))))

(assert (=> b!1394916 e!789719))

(declare-fun res!934317 () Bool)

(assert (=> b!1394916 (=> (not res!934317) (not e!789719))))

(assert (=> b!1394916 (= res!934317 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46776 0))(
  ( (Unit!46777) )
))
(declare-fun lt!612788 () Unit!46776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46776)

(assert (=> b!1394916 (= lt!612788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394916 (= lt!612789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) (select (arr!46069 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934318 () Bool)

(assert (=> start!119740 (=> (not res!934318) (not e!789717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119740 (= res!934318 (validMask!0 mask!2840))))

(assert (=> start!119740 e!789717))

(assert (=> start!119740 true))

(declare-fun array_inv!35097 (array!95422) Bool)

(assert (=> start!119740 (array_inv!35097 a!2901)))

(declare-fun b!1394909 () Bool)

(declare-fun res!934321 () Bool)

(assert (=> b!1394909 (=> (not res!934321) (not e!789717))))

(declare-datatypes ((List!32588 0))(
  ( (Nil!32585) (Cons!32584 (h!33817 (_ BitVec 64)) (t!47282 List!32588)) )
))
(declare-fun arrayNoDuplicates!0 (array!95422 (_ BitVec 32) List!32588) Bool)

(assert (=> b!1394909 (= res!934321 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32585))))

(assert (= (and start!119740 res!934318) b!1394910))

(assert (= (and b!1394910 res!934324) b!1394915))

(assert (= (and b!1394915 res!934322) b!1394913))

(assert (= (and b!1394913 res!934320) b!1394911))

(assert (= (and b!1394911 res!934323) b!1394909))

(assert (= (and b!1394909 res!934321) b!1394916))

(assert (= (and b!1394916 res!934317) b!1394908))

(assert (= (and b!1394916 (not res!934319)) b!1394914))

(assert (= (and b!1394914 (not res!934316)) b!1394912))

(declare-fun m!1281407 () Bool)

(assert (=> b!1394916 m!1281407))

(declare-fun m!1281409 () Bool)

(assert (=> b!1394916 m!1281409))

(assert (=> b!1394916 m!1281407))

(declare-fun m!1281411 () Bool)

(assert (=> b!1394916 m!1281411))

(assert (=> b!1394916 m!1281409))

(assert (=> b!1394916 m!1281407))

(declare-fun m!1281413 () Bool)

(assert (=> b!1394916 m!1281413))

(declare-fun m!1281415 () Bool)

(assert (=> b!1394916 m!1281415))

(declare-fun m!1281417 () Bool)

(assert (=> b!1394914 m!1281417))

(declare-fun m!1281419 () Bool)

(assert (=> b!1394914 m!1281419))

(assert (=> b!1394914 m!1281419))

(declare-fun m!1281421 () Bool)

(assert (=> b!1394914 m!1281421))

(assert (=> b!1394914 m!1281421))

(assert (=> b!1394914 m!1281419))

(declare-fun m!1281423 () Bool)

(assert (=> b!1394914 m!1281423))

(assert (=> b!1394908 m!1281407))

(assert (=> b!1394908 m!1281407))

(declare-fun m!1281425 () Bool)

(assert (=> b!1394908 m!1281425))

(assert (=> b!1394913 m!1281407))

(assert (=> b!1394913 m!1281407))

(declare-fun m!1281427 () Bool)

(assert (=> b!1394913 m!1281427))

(declare-fun m!1281429 () Bool)

(assert (=> start!119740 m!1281429))

(declare-fun m!1281431 () Bool)

(assert (=> start!119740 m!1281431))

(declare-fun m!1281433 () Bool)

(assert (=> b!1394909 m!1281433))

(declare-fun m!1281435 () Bool)

(assert (=> b!1394915 m!1281435))

(assert (=> b!1394915 m!1281435))

(declare-fun m!1281437 () Bool)

(assert (=> b!1394915 m!1281437))

(declare-fun m!1281439 () Bool)

(assert (=> b!1394911 m!1281439))

(push 1)

(assert (not b!1394911))

(assert (not b!1394914))

(assert (not b!1394915))

(assert (not b!1394913))

(assert (not b!1394908))

(assert (not b!1394909))

