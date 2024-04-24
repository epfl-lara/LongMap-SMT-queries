; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120296 () Bool)

(assert start!120296)

(declare-fun b!1399567 () Bool)

(declare-fun res!937800 () Bool)

(declare-fun e!792425 () Bool)

(assert (=> b!1399567 (=> (not res!937800) (not e!792425))))

(declare-datatypes ((array!95747 0))(
  ( (array!95748 (arr!46225 (Array (_ BitVec 32) (_ BitVec 64))) (size!46776 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95747)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95747 (_ BitVec 32)) Bool)

(assert (=> b!1399567 (= res!937800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!937803 () Bool)

(assert (=> start!120296 (=> (not res!937803) (not e!792425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120296 (= res!937803 (validMask!0 mask!2840))))

(assert (=> start!120296 e!792425))

(assert (=> start!120296 true))

(declare-fun array_inv!35506 (array!95747) Bool)

(assert (=> start!120296 (array_inv!35506 a!2901)))

(declare-fun e!792422 () Bool)

(declare-fun b!1399568 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10445 0))(
  ( (MissingZero!10445 (index!44151 (_ BitVec 32))) (Found!10445 (index!44152 (_ BitVec 32))) (Intermediate!10445 (undefined!11257 Bool) (index!44153 (_ BitVec 32)) (x!125950 (_ BitVec 32))) (Undefined!10445) (MissingVacant!10445 (index!44154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95747 (_ BitVec 32)) SeekEntryResult!10445)

(assert (=> b!1399568 (= e!792422 (= (seekEntryOrOpen!0 (select (arr!46225 a!2901) j!112) a!2901 mask!2840) (Found!10445 j!112)))))

(declare-fun b!1399569 () Bool)

(declare-fun res!937802 () Bool)

(assert (=> b!1399569 (=> (not res!937802) (not e!792425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399569 (= res!937802 (validKeyInArray!0 (select (arr!46225 a!2901) j!112)))))

(declare-fun b!1399570 () Bool)

(declare-fun res!937801 () Bool)

(assert (=> b!1399570 (=> (not res!937801) (not e!792425))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399570 (= res!937801 (validKeyInArray!0 (select (arr!46225 a!2901) i!1037)))))

(declare-fun b!1399571 () Bool)

(declare-fun e!792423 () Bool)

(assert (=> b!1399571 (= e!792425 (not e!792423))))

(declare-fun res!937798 () Bool)

(assert (=> b!1399571 (=> res!937798 e!792423)))

(declare-fun lt!615318 () SeekEntryResult!10445)

(get-info :version)

(assert (=> b!1399571 (= res!937798 (or (not ((_ is Intermediate!10445) lt!615318)) (undefined!11257 lt!615318)))))

(assert (=> b!1399571 e!792422))

(declare-fun res!937796 () Bool)

(assert (=> b!1399571 (=> (not res!937796) (not e!792422))))

(assert (=> b!1399571 (= res!937796 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46921 0))(
  ( (Unit!46922) )
))
(declare-fun lt!615317 () Unit!46921)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46921)

(assert (=> b!1399571 (= lt!615317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615316 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95747 (_ BitVec 32)) SeekEntryResult!10445)

(assert (=> b!1399571 (= lt!615318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615316 (select (arr!46225 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399571 (= lt!615316 (toIndex!0 (select (arr!46225 a!2901) j!112) mask!2840))))

(declare-fun b!1399572 () Bool)

(declare-fun e!792421 () Bool)

(assert (=> b!1399572 (= e!792423 e!792421)))

(declare-fun res!937797 () Bool)

(assert (=> b!1399572 (=> res!937797 e!792421)))

(declare-fun lt!615320 () SeekEntryResult!10445)

(assert (=> b!1399572 (= res!937797 (or (= lt!615318 lt!615320) (not ((_ is Intermediate!10445) lt!615320))))))

(declare-fun lt!615315 () (_ BitVec 64))

(assert (=> b!1399572 (= lt!615320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615315 mask!2840) lt!615315 (array!95748 (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46776 a!2901)) mask!2840))))

(assert (=> b!1399572 (= lt!615315 (select (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399573 () Bool)

(assert (=> b!1399573 (= e!792421 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1399573 (and (not (undefined!11257 lt!615320)) (= (index!44153 lt!615320) i!1037) (bvslt (x!125950 lt!615320) (x!125950 lt!615318)) (= (select (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44153 lt!615320)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615319 () Unit!46921)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46921)

(assert (=> b!1399573 (= lt!615319 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615316 (x!125950 lt!615318) (index!44153 lt!615318) (x!125950 lt!615320) (index!44153 lt!615320) (undefined!11257 lt!615320) mask!2840))))

(declare-fun b!1399574 () Bool)

(declare-fun res!937804 () Bool)

(assert (=> b!1399574 (=> (not res!937804) (not e!792425))))

(declare-datatypes ((List!32731 0))(
  ( (Nil!32728) (Cons!32727 (h!33977 (_ BitVec 64)) (t!47417 List!32731)) )
))
(declare-fun arrayNoDuplicates!0 (array!95747 (_ BitVec 32) List!32731) Bool)

(assert (=> b!1399574 (= res!937804 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32728))))

(declare-fun b!1399575 () Bool)

(declare-fun res!937799 () Bool)

(assert (=> b!1399575 (=> (not res!937799) (not e!792425))))

(assert (=> b!1399575 (= res!937799 (and (= (size!46776 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46776 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46776 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120296 res!937803) b!1399575))

(assert (= (and b!1399575 res!937799) b!1399570))

(assert (= (and b!1399570 res!937801) b!1399569))

(assert (= (and b!1399569 res!937802) b!1399567))

(assert (= (and b!1399567 res!937800) b!1399574))

(assert (= (and b!1399574 res!937804) b!1399571))

(assert (= (and b!1399571 res!937796) b!1399568))

(assert (= (and b!1399571 (not res!937798)) b!1399572))

(assert (= (and b!1399572 (not res!937797)) b!1399573))

(declare-fun m!1286923 () Bool)

(assert (=> b!1399573 m!1286923))

(declare-fun m!1286925 () Bool)

(assert (=> b!1399573 m!1286925))

(declare-fun m!1286927 () Bool)

(assert (=> b!1399573 m!1286927))

(declare-fun m!1286929 () Bool)

(assert (=> b!1399567 m!1286929))

(declare-fun m!1286931 () Bool)

(assert (=> b!1399568 m!1286931))

(assert (=> b!1399568 m!1286931))

(declare-fun m!1286933 () Bool)

(assert (=> b!1399568 m!1286933))

(assert (=> b!1399569 m!1286931))

(assert (=> b!1399569 m!1286931))

(declare-fun m!1286935 () Bool)

(assert (=> b!1399569 m!1286935))

(declare-fun m!1286937 () Bool)

(assert (=> start!120296 m!1286937))

(declare-fun m!1286939 () Bool)

(assert (=> start!120296 m!1286939))

(declare-fun m!1286941 () Bool)

(assert (=> b!1399574 m!1286941))

(declare-fun m!1286943 () Bool)

(assert (=> b!1399572 m!1286943))

(assert (=> b!1399572 m!1286923))

(assert (=> b!1399572 m!1286943))

(declare-fun m!1286945 () Bool)

(assert (=> b!1399572 m!1286945))

(declare-fun m!1286947 () Bool)

(assert (=> b!1399572 m!1286947))

(declare-fun m!1286949 () Bool)

(assert (=> b!1399570 m!1286949))

(assert (=> b!1399570 m!1286949))

(declare-fun m!1286951 () Bool)

(assert (=> b!1399570 m!1286951))

(assert (=> b!1399571 m!1286931))

(declare-fun m!1286953 () Bool)

(assert (=> b!1399571 m!1286953))

(assert (=> b!1399571 m!1286931))

(declare-fun m!1286955 () Bool)

(assert (=> b!1399571 m!1286955))

(declare-fun m!1286957 () Bool)

(assert (=> b!1399571 m!1286957))

(assert (=> b!1399571 m!1286931))

(declare-fun m!1286959 () Bool)

(assert (=> b!1399571 m!1286959))

(check-sat (not b!1399572) (not start!120296) (not b!1399568) (not b!1399574) (not b!1399573) (not b!1399569) (not b!1399571) (not b!1399570) (not b!1399567))
(check-sat)
