; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121958 () Bool)

(assert start!121958)

(declare-fun b!1415334 () Bool)

(declare-fun e!801038 () Bool)

(assert (=> b!1415334 (= e!801038 true)))

(declare-fun e!801033 () Bool)

(assert (=> b!1415334 e!801033))

(declare-fun res!951379 () Bool)

(assert (=> b!1415334 (=> (not res!951379) (not e!801033))))

(declare-datatypes ((SeekEntryResult!10964 0))(
  ( (MissingZero!10964 (index!46248 (_ BitVec 32))) (Found!10964 (index!46249 (_ BitVec 32))) (Intermediate!10964 (undefined!11776 Bool) (index!46250 (_ BitVec 32)) (x!127859 (_ BitVec 32))) (Undefined!10964) (MissingVacant!10964 (index!46251 (_ BitVec 32))) )
))
(declare-fun lt!624075 () SeekEntryResult!10964)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!624071 () SeekEntryResult!10964)

(declare-datatypes ((array!96644 0))(
  ( (array!96645 (arr!46653 (Array (_ BitVec 32) (_ BitVec 64))) (size!47203 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96644)

(assert (=> b!1415334 (= res!951379 (and (not (undefined!11776 lt!624071)) (= (index!46250 lt!624071) i!1037) (bvslt (x!127859 lt!624071) (x!127859 lt!624075)) (= (select (store (arr!46653 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46250 lt!624071)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624073 () (_ BitVec 32))

(declare-datatypes ((Unit!47902 0))(
  ( (Unit!47903) )
))
(declare-fun lt!624070 () Unit!47902)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47902)

(assert (=> b!1415334 (= lt!624070 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624073 (x!127859 lt!624075) (index!46250 lt!624075) (x!127859 lt!624071) (index!46250 lt!624071) (undefined!11776 lt!624071) mask!2840))))

(declare-fun b!1415335 () Bool)

(declare-fun e!801037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96644 (_ BitVec 32)) SeekEntryResult!10964)

(assert (=> b!1415335 (= e!801037 (= (seekEntryOrOpen!0 (select (arr!46653 a!2901) j!112) a!2901 mask!2840) (Found!10964 j!112)))))

(declare-fun b!1415336 () Bool)

(declare-fun res!951383 () Bool)

(declare-fun e!801036 () Bool)

(assert (=> b!1415336 (=> (not res!951383) (not e!801036))))

(declare-datatypes ((List!33172 0))(
  ( (Nil!33169) (Cons!33168 (h!34455 (_ BitVec 64)) (t!47866 List!33172)) )
))
(declare-fun arrayNoDuplicates!0 (array!96644 (_ BitVec 32) List!33172) Bool)

(assert (=> b!1415336 (= res!951383 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33169))))

(declare-fun b!1415337 () Bool)

(declare-fun res!951381 () Bool)

(assert (=> b!1415337 (=> (not res!951381) (not e!801036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96644 (_ BitVec 32)) Bool)

(assert (=> b!1415337 (= res!951381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415338 () Bool)

(declare-fun e!801035 () Bool)

(assert (=> b!1415338 (= e!801036 (not e!801035))))

(declare-fun res!951382 () Bool)

(assert (=> b!1415338 (=> res!951382 e!801035)))

(get-info :version)

(assert (=> b!1415338 (= res!951382 (or (not ((_ is Intermediate!10964) lt!624075)) (undefined!11776 lt!624075)))))

(assert (=> b!1415338 e!801037))

(declare-fun res!951378 () Bool)

(assert (=> b!1415338 (=> (not res!951378) (not e!801037))))

(assert (=> b!1415338 (= res!951378 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624074 () Unit!47902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47902)

(assert (=> b!1415338 (= lt!624074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96644 (_ BitVec 32)) SeekEntryResult!10964)

(assert (=> b!1415338 (= lt!624075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624073 (select (arr!46653 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415338 (= lt!624073 (toIndex!0 (select (arr!46653 a!2901) j!112) mask!2840))))

(declare-fun b!1415339 () Bool)

(declare-fun lt!624072 () (_ BitVec 64))

(declare-fun lt!624069 () array!96644)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96644 (_ BitVec 32)) SeekEntryResult!10964)

(assert (=> b!1415339 (= e!801033 (= (seekEntryOrOpen!0 lt!624072 lt!624069 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127859 lt!624071) (index!46250 lt!624071) (index!46250 lt!624071) (select (arr!46653 a!2901) j!112) lt!624069 mask!2840)))))

(declare-fun b!1415340 () Bool)

(assert (=> b!1415340 (= e!801035 e!801038)))

(declare-fun res!951380 () Bool)

(assert (=> b!1415340 (=> res!951380 e!801038)))

(assert (=> b!1415340 (= res!951380 (or (= lt!624075 lt!624071) (not ((_ is Intermediate!10964) lt!624071))))))

(assert (=> b!1415340 (= lt!624071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624072 mask!2840) lt!624072 lt!624069 mask!2840))))

(assert (=> b!1415340 (= lt!624072 (select (store (arr!46653 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415340 (= lt!624069 (array!96645 (store (arr!46653 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47203 a!2901)))))

(declare-fun b!1415341 () Bool)

(declare-fun res!951384 () Bool)

(assert (=> b!1415341 (=> (not res!951384) (not e!801036))))

(assert (=> b!1415341 (= res!951384 (and (= (size!47203 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47203 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47203 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415342 () Bool)

(declare-fun res!951376 () Bool)

(assert (=> b!1415342 (=> (not res!951376) (not e!801036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415342 (= res!951376 (validKeyInArray!0 (select (arr!46653 a!2901) j!112)))))

(declare-fun b!1415343 () Bool)

(declare-fun res!951385 () Bool)

(assert (=> b!1415343 (=> (not res!951385) (not e!801036))))

(assert (=> b!1415343 (= res!951385 (validKeyInArray!0 (select (arr!46653 a!2901) i!1037)))))

(declare-fun res!951377 () Bool)

(assert (=> start!121958 (=> (not res!951377) (not e!801036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121958 (= res!951377 (validMask!0 mask!2840))))

(assert (=> start!121958 e!801036))

(assert (=> start!121958 true))

(declare-fun array_inv!35681 (array!96644) Bool)

(assert (=> start!121958 (array_inv!35681 a!2901)))

(assert (= (and start!121958 res!951377) b!1415341))

(assert (= (and b!1415341 res!951384) b!1415343))

(assert (= (and b!1415343 res!951385) b!1415342))

(assert (= (and b!1415342 res!951376) b!1415337))

(assert (= (and b!1415337 res!951381) b!1415336))

(assert (= (and b!1415336 res!951383) b!1415338))

(assert (= (and b!1415338 res!951378) b!1415335))

(assert (= (and b!1415338 (not res!951382)) b!1415340))

(assert (= (and b!1415340 (not res!951380)) b!1415334))

(assert (= (and b!1415334 res!951379) b!1415339))

(declare-fun m!1305573 () Bool)

(assert (=> b!1415338 m!1305573))

(declare-fun m!1305575 () Bool)

(assert (=> b!1415338 m!1305575))

(assert (=> b!1415338 m!1305573))

(declare-fun m!1305577 () Bool)

(assert (=> b!1415338 m!1305577))

(assert (=> b!1415338 m!1305573))

(declare-fun m!1305579 () Bool)

(assert (=> b!1415338 m!1305579))

(declare-fun m!1305581 () Bool)

(assert (=> b!1415338 m!1305581))

(declare-fun m!1305583 () Bool)

(assert (=> b!1415340 m!1305583))

(assert (=> b!1415340 m!1305583))

(declare-fun m!1305585 () Bool)

(assert (=> b!1415340 m!1305585))

(declare-fun m!1305587 () Bool)

(assert (=> b!1415340 m!1305587))

(declare-fun m!1305589 () Bool)

(assert (=> b!1415340 m!1305589))

(declare-fun m!1305591 () Bool)

(assert (=> start!121958 m!1305591))

(declare-fun m!1305593 () Bool)

(assert (=> start!121958 m!1305593))

(declare-fun m!1305595 () Bool)

(assert (=> b!1415343 m!1305595))

(assert (=> b!1415343 m!1305595))

(declare-fun m!1305597 () Bool)

(assert (=> b!1415343 m!1305597))

(declare-fun m!1305599 () Bool)

(assert (=> b!1415339 m!1305599))

(assert (=> b!1415339 m!1305573))

(assert (=> b!1415339 m!1305573))

(declare-fun m!1305601 () Bool)

(assert (=> b!1415339 m!1305601))

(assert (=> b!1415334 m!1305587))

(declare-fun m!1305603 () Bool)

(assert (=> b!1415334 m!1305603))

(declare-fun m!1305605 () Bool)

(assert (=> b!1415334 m!1305605))

(declare-fun m!1305607 () Bool)

(assert (=> b!1415336 m!1305607))

(assert (=> b!1415335 m!1305573))

(assert (=> b!1415335 m!1305573))

(declare-fun m!1305609 () Bool)

(assert (=> b!1415335 m!1305609))

(declare-fun m!1305611 () Bool)

(assert (=> b!1415337 m!1305611))

(assert (=> b!1415342 m!1305573))

(assert (=> b!1415342 m!1305573))

(declare-fun m!1305613 () Bool)

(assert (=> b!1415342 m!1305613))

(check-sat (not b!1415343) (not b!1415335) (not b!1415334) (not b!1415336) (not b!1415338) (not start!121958) (not b!1415339) (not b!1415340) (not b!1415342) (not b!1415337))
(check-sat)
