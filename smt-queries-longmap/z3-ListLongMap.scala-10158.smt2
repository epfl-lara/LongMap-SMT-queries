; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119900 () Bool)

(assert start!119900)

(declare-fun res!934390 () Bool)

(declare-fun e!790279 () Bool)

(assert (=> start!119900 (=> (not res!934390) (not e!790279))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119900 (= res!934390 (validMask!0 mask!2840))))

(assert (=> start!119900 e!790279))

(assert (=> start!119900 true))

(declare-datatypes ((array!95504 0))(
  ( (array!95505 (arr!46108 (Array (_ BitVec 32) (_ BitVec 64))) (size!46659 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95504)

(declare-fun array_inv!35389 (array!95504) Bool)

(assert (=> start!119900 (array_inv!35389 a!2901)))

(declare-fun b!1395661 () Bool)

(declare-fun res!934393 () Bool)

(assert (=> b!1395661 (=> (not res!934393) (not e!790279))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395661 (= res!934393 (validKeyInArray!0 (select (arr!46108 a!2901) j!112)))))

(declare-fun b!1395662 () Bool)

(declare-fun e!790278 () Bool)

(declare-fun e!790277 () Bool)

(assert (=> b!1395662 (= e!790278 e!790277)))

(declare-fun res!934389 () Bool)

(assert (=> b!1395662 (=> res!934389 e!790277)))

(declare-fun lt!612932 () array!95504)

(declare-datatypes ((SeekEntryResult!10328 0))(
  ( (MissingZero!10328 (index!43683 (_ BitVec 32))) (Found!10328 (index!43684 (_ BitVec 32))) (Intermediate!10328 (undefined!11140 Bool) (index!43685 (_ BitVec 32)) (x!125503 (_ BitVec 32))) (Undefined!10328) (MissingVacant!10328 (index!43686 (_ BitVec 32))) )
))
(declare-fun lt!612934 () SeekEntryResult!10328)

(declare-fun lt!612936 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95504 (_ BitVec 32)) SeekEntryResult!10328)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395662 (= res!934389 (not (= lt!612934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612936 mask!2840) lt!612936 lt!612932 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395662 (= lt!612936 (select (store (arr!46108 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395662 (= lt!612932 (array!95505 (store (arr!46108 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46659 a!2901)))))

(declare-fun b!1395663 () Bool)

(declare-fun res!934386 () Bool)

(assert (=> b!1395663 (=> (not res!934386) (not e!790279))))

(assert (=> b!1395663 (= res!934386 (validKeyInArray!0 (select (arr!46108 a!2901) i!1037)))))

(declare-fun b!1395664 () Bool)

(declare-fun res!934387 () Bool)

(assert (=> b!1395664 (=> res!934387 e!790277)))

(declare-fun lt!612937 () (_ BitVec 32))

(assert (=> b!1395664 (= res!934387 (or (bvslt (x!125503 lt!612934) #b00000000000000000000000000000000) (bvsgt (x!125503 lt!612934) #b01111111111111111111111111111110) (bvslt lt!612937 #b00000000000000000000000000000000) (bvsge lt!612937 (size!46659 a!2901)) (bvslt (index!43685 lt!612934) #b00000000000000000000000000000000) (bvsge (index!43685 lt!612934) (size!46659 a!2901)) (not (= lt!612934 (Intermediate!10328 false (index!43685 lt!612934) (x!125503 lt!612934))))))))

(declare-fun b!1395665 () Bool)

(assert (=> b!1395665 (= e!790279 (not e!790278))))

(declare-fun res!934385 () Bool)

(assert (=> b!1395665 (=> res!934385 e!790278)))

(get-info :version)

(assert (=> b!1395665 (= res!934385 (or (not ((_ is Intermediate!10328) lt!612934)) (undefined!11140 lt!612934)))))

(declare-fun lt!612938 () SeekEntryResult!10328)

(assert (=> b!1395665 (= lt!612938 (Found!10328 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95504 (_ BitVec 32)) SeekEntryResult!10328)

(assert (=> b!1395665 (= lt!612938 (seekEntryOrOpen!0 (select (arr!46108 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95504 (_ BitVec 32)) Bool)

(assert (=> b!1395665 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46687 0))(
  ( (Unit!46688) )
))
(declare-fun lt!612935 () Unit!46687)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46687)

(assert (=> b!1395665 (= lt!612935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395665 (= lt!612934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612937 (select (arr!46108 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395665 (= lt!612937 (toIndex!0 (select (arr!46108 a!2901) j!112) mask!2840))))

(declare-fun b!1395666 () Bool)

(declare-fun res!934391 () Bool)

(assert (=> b!1395666 (=> (not res!934391) (not e!790279))))

(assert (=> b!1395666 (= res!934391 (and (= (size!46659 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46659 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46659 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395667 () Bool)

(declare-fun res!934392 () Bool)

(assert (=> b!1395667 (=> (not res!934392) (not e!790279))))

(declare-datatypes ((List!32614 0))(
  ( (Nil!32611) (Cons!32610 (h!33851 (_ BitVec 64)) (t!47300 List!32614)) )
))
(declare-fun arrayNoDuplicates!0 (array!95504 (_ BitVec 32) List!32614) Bool)

(assert (=> b!1395667 (= res!934392 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32611))))

(declare-fun b!1395668 () Bool)

(declare-fun res!934388 () Bool)

(assert (=> b!1395668 (=> (not res!934388) (not e!790279))))

(assert (=> b!1395668 (= res!934388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395669 () Bool)

(assert (=> b!1395669 (= e!790277 true)))

(assert (=> b!1395669 (= lt!612938 (seekEntryOrOpen!0 lt!612936 lt!612932 mask!2840))))

(declare-fun lt!612933 () Unit!46687)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46687)

(assert (=> b!1395669 (= lt!612933 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612937 (x!125503 lt!612934) (index!43685 lt!612934) mask!2840))))

(assert (= (and start!119900 res!934390) b!1395666))

(assert (= (and b!1395666 res!934391) b!1395663))

(assert (= (and b!1395663 res!934386) b!1395661))

(assert (= (and b!1395661 res!934393) b!1395668))

(assert (= (and b!1395668 res!934388) b!1395667))

(assert (= (and b!1395667 res!934392) b!1395665))

(assert (= (and b!1395665 (not res!934385)) b!1395662))

(assert (= (and b!1395662 (not res!934389)) b!1395664))

(assert (= (and b!1395664 (not res!934387)) b!1395669))

(declare-fun m!1282249 () Bool)

(assert (=> b!1395667 m!1282249))

(declare-fun m!1282251 () Bool)

(assert (=> b!1395663 m!1282251))

(assert (=> b!1395663 m!1282251))

(declare-fun m!1282253 () Bool)

(assert (=> b!1395663 m!1282253))

(declare-fun m!1282255 () Bool)

(assert (=> b!1395662 m!1282255))

(assert (=> b!1395662 m!1282255))

(declare-fun m!1282257 () Bool)

(assert (=> b!1395662 m!1282257))

(declare-fun m!1282259 () Bool)

(assert (=> b!1395662 m!1282259))

(declare-fun m!1282261 () Bool)

(assert (=> b!1395662 m!1282261))

(declare-fun m!1282263 () Bool)

(assert (=> b!1395665 m!1282263))

(declare-fun m!1282265 () Bool)

(assert (=> b!1395665 m!1282265))

(assert (=> b!1395665 m!1282263))

(declare-fun m!1282267 () Bool)

(assert (=> b!1395665 m!1282267))

(assert (=> b!1395665 m!1282263))

(declare-fun m!1282269 () Bool)

(assert (=> b!1395665 m!1282269))

(assert (=> b!1395665 m!1282263))

(declare-fun m!1282271 () Bool)

(assert (=> b!1395665 m!1282271))

(declare-fun m!1282273 () Bool)

(assert (=> b!1395665 m!1282273))

(declare-fun m!1282275 () Bool)

(assert (=> start!119900 m!1282275))

(declare-fun m!1282277 () Bool)

(assert (=> start!119900 m!1282277))

(declare-fun m!1282279 () Bool)

(assert (=> b!1395669 m!1282279))

(declare-fun m!1282281 () Bool)

(assert (=> b!1395669 m!1282281))

(declare-fun m!1282283 () Bool)

(assert (=> b!1395668 m!1282283))

(assert (=> b!1395661 m!1282263))

(assert (=> b!1395661 m!1282263))

(declare-fun m!1282285 () Bool)

(assert (=> b!1395661 m!1282285))

(check-sat (not b!1395665) (not b!1395662) (not b!1395661) (not b!1395667) (not b!1395669) (not b!1395663) (not b!1395668) (not start!119900))
(check-sat)
