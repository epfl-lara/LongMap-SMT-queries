; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119994 () Bool)

(assert start!119994)

(declare-fun b!1396457 () Bool)

(declare-fun e!790687 () Bool)

(assert (=> b!1396457 (= e!790687 true)))

(declare-datatypes ((array!95547 0))(
  ( (array!95548 (arr!46128 (Array (_ BitVec 32) (_ BitVec 64))) (size!46679 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95547)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10348 0))(
  ( (MissingZero!10348 (index!43763 (_ BitVec 32))) (Found!10348 (index!43764 (_ BitVec 32))) (Intermediate!10348 (undefined!11160 Bool) (index!43765 (_ BitVec 32)) (x!125577 (_ BitVec 32))) (Undefined!10348) (MissingVacant!10348 (index!43766 (_ BitVec 32))) )
))
(declare-fun lt!613352 () SeekEntryResult!10348)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95547 (_ BitVec 32)) SeekEntryResult!10348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396457 (= lt!613352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46128 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46128 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95548 (store (arr!46128 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46679 a!2901)) mask!2840))))

(declare-fun b!1396458 () Bool)

(declare-fun e!790685 () Bool)

(assert (=> b!1396458 (= e!790685 (not e!790687))))

(declare-fun res!935022 () Bool)

(assert (=> b!1396458 (=> res!935022 e!790687)))

(declare-fun lt!613350 () SeekEntryResult!10348)

(assert (=> b!1396458 (= res!935022 (or (not (is-Intermediate!10348 lt!613350)) (undefined!11160 lt!613350)))))

(declare-fun e!790688 () Bool)

(assert (=> b!1396458 e!790688))

(declare-fun res!935018 () Bool)

(assert (=> b!1396458 (=> (not res!935018) (not e!790688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95547 (_ BitVec 32)) Bool)

(assert (=> b!1396458 (= res!935018 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46727 0))(
  ( (Unit!46728) )
))
(declare-fun lt!613351 () Unit!46727)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46727)

(assert (=> b!1396458 (= lt!613351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396458 (= lt!613350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46128 a!2901) j!112) mask!2840) (select (arr!46128 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396459 () Bool)

(declare-fun res!935017 () Bool)

(assert (=> b!1396459 (=> (not res!935017) (not e!790685))))

(assert (=> b!1396459 (= res!935017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396460 () Bool)

(declare-fun res!935016 () Bool)

(assert (=> b!1396460 (=> (not res!935016) (not e!790685))))

(declare-datatypes ((List!32634 0))(
  ( (Nil!32631) (Cons!32630 (h!33874 (_ BitVec 64)) (t!47320 List!32634)) )
))
(declare-fun arrayNoDuplicates!0 (array!95547 (_ BitVec 32) List!32634) Bool)

(assert (=> b!1396460 (= res!935016 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32631))))

(declare-fun b!1396461 () Bool)

(declare-fun res!935019 () Bool)

(assert (=> b!1396461 (=> (not res!935019) (not e!790685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396461 (= res!935019 (validKeyInArray!0 (select (arr!46128 a!2901) i!1037)))))

(declare-fun b!1396462 () Bool)

(declare-fun res!935021 () Bool)

(assert (=> b!1396462 (=> (not res!935021) (not e!790685))))

(assert (=> b!1396462 (= res!935021 (and (= (size!46679 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46679 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46679 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396463 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95547 (_ BitVec 32)) SeekEntryResult!10348)

(assert (=> b!1396463 (= e!790688 (= (seekEntryOrOpen!0 (select (arr!46128 a!2901) j!112) a!2901 mask!2840) (Found!10348 j!112)))))

(declare-fun res!935023 () Bool)

(assert (=> start!119994 (=> (not res!935023) (not e!790685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119994 (= res!935023 (validMask!0 mask!2840))))

(assert (=> start!119994 e!790685))

(assert (=> start!119994 true))

(declare-fun array_inv!35409 (array!95547) Bool)

(assert (=> start!119994 (array_inv!35409 a!2901)))

(declare-fun b!1396464 () Bool)

(declare-fun res!935020 () Bool)

(assert (=> b!1396464 (=> (not res!935020) (not e!790685))))

(assert (=> b!1396464 (= res!935020 (validKeyInArray!0 (select (arr!46128 a!2901) j!112)))))

(assert (= (and start!119994 res!935023) b!1396462))

(assert (= (and b!1396462 res!935021) b!1396461))

(assert (= (and b!1396461 res!935019) b!1396464))

(assert (= (and b!1396464 res!935020) b!1396459))

(assert (= (and b!1396459 res!935017) b!1396460))

(assert (= (and b!1396460 res!935016) b!1396458))

(assert (= (and b!1396458 res!935018) b!1396463))

(assert (= (and b!1396458 (not res!935022)) b!1396457))

(declare-fun m!1283133 () Bool)

(assert (=> b!1396458 m!1283133))

(declare-fun m!1283135 () Bool)

(assert (=> b!1396458 m!1283135))

(assert (=> b!1396458 m!1283133))

(declare-fun m!1283137 () Bool)

(assert (=> b!1396458 m!1283137))

(assert (=> b!1396458 m!1283135))

(assert (=> b!1396458 m!1283133))

(declare-fun m!1283139 () Bool)

(assert (=> b!1396458 m!1283139))

(declare-fun m!1283141 () Bool)

(assert (=> b!1396458 m!1283141))

(declare-fun m!1283143 () Bool)

(assert (=> b!1396460 m!1283143))

(declare-fun m!1283145 () Bool)

(assert (=> start!119994 m!1283145))

(declare-fun m!1283147 () Bool)

(assert (=> start!119994 m!1283147))

(declare-fun m!1283149 () Bool)

(assert (=> b!1396457 m!1283149))

(declare-fun m!1283151 () Bool)

(assert (=> b!1396457 m!1283151))

(assert (=> b!1396457 m!1283151))

(declare-fun m!1283153 () Bool)

(assert (=> b!1396457 m!1283153))

(assert (=> b!1396457 m!1283153))

(assert (=> b!1396457 m!1283151))

(declare-fun m!1283155 () Bool)

(assert (=> b!1396457 m!1283155))

(assert (=> b!1396464 m!1283133))

(assert (=> b!1396464 m!1283133))

(declare-fun m!1283157 () Bool)

(assert (=> b!1396464 m!1283157))

(assert (=> b!1396463 m!1283133))

(assert (=> b!1396463 m!1283133))

(declare-fun m!1283159 () Bool)

(assert (=> b!1396463 m!1283159))

(declare-fun m!1283161 () Bool)

(assert (=> b!1396459 m!1283161))

(declare-fun m!1283163 () Bool)

(assert (=> b!1396461 m!1283163))

(assert (=> b!1396461 m!1283163))

(declare-fun m!1283165 () Bool)

(assert (=> b!1396461 m!1283165))

(push 1)

(assert (not b!1396458))

(assert (not b!1396464))

(assert (not start!119994))

(assert (not b!1396461))

(assert (not b!1396459))

(assert (not b!1396460))

(assert (not b!1396463))

(assert (not b!1396457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

