; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121112 () Bool)

(assert start!121112)

(declare-fun b!1408168 () Bool)

(declare-fun e!796973 () Bool)

(assert (=> b!1408168 (= e!796973 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96266 0))(
  ( (array!96267 (arr!46476 (Array (_ BitVec 32) (_ BitVec 64))) (size!47026 (_ BitVec 32))) )
))
(declare-fun lt!620169 () array!96266)

(declare-datatypes ((SeekEntryResult!10787 0))(
  ( (MissingZero!10787 (index!45525 (_ BitVec 32))) (Found!10787 (index!45526 (_ BitVec 32))) (Intermediate!10787 (undefined!11599 Bool) (index!45527 (_ BitVec 32)) (x!127132 (_ BitVec 32))) (Undefined!10787) (MissingVacant!10787 (index!45528 (_ BitVec 32))) )
))
(declare-fun lt!620172 () SeekEntryResult!10787)

(declare-fun lt!620171 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96266 (_ BitVec 32)) SeekEntryResult!10787)

(assert (=> b!1408168 (= lt!620172 (seekEntryOrOpen!0 lt!620171 lt!620169 mask!2840))))

(declare-fun a!2901 () array!96266)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47548 0))(
  ( (Unit!47549) )
))
(declare-fun lt!620170 () Unit!47548)

(declare-fun lt!620168 () (_ BitVec 32))

(declare-fun lt!620166 () SeekEntryResult!10787)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47548)

(assert (=> b!1408168 (= lt!620170 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620168 (x!127132 lt!620166) (index!45527 lt!620166) mask!2840))))

(declare-fun b!1408169 () Bool)

(declare-fun e!796971 () Bool)

(assert (=> b!1408169 (= e!796971 e!796973)))

(declare-fun res!945895 () Bool)

(assert (=> b!1408169 (=> res!945895 e!796973)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96266 (_ BitVec 32)) SeekEntryResult!10787)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408169 (= res!945895 (not (= lt!620166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620171 mask!2840) lt!620171 lt!620169 mask!2840))))))

(assert (=> b!1408169 (= lt!620171 (select (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408169 (= lt!620169 (array!96267 (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47026 a!2901)))))

(declare-fun b!1408170 () Bool)

(declare-fun res!945894 () Bool)

(declare-fun e!796970 () Bool)

(assert (=> b!1408170 (=> (not res!945894) (not e!796970))))

(declare-datatypes ((List!32995 0))(
  ( (Nil!32992) (Cons!32991 (h!34254 (_ BitVec 64)) (t!47689 List!32995)) )
))
(declare-fun arrayNoDuplicates!0 (array!96266 (_ BitVec 32) List!32995) Bool)

(assert (=> b!1408170 (= res!945894 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32992))))

(declare-fun b!1408172 () Bool)

(declare-fun res!945891 () Bool)

(assert (=> b!1408172 (=> (not res!945891) (not e!796970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408172 (= res!945891 (validKeyInArray!0 (select (arr!46476 a!2901) j!112)))))

(declare-fun b!1408173 () Bool)

(declare-fun res!945892 () Bool)

(assert (=> b!1408173 (=> (not res!945892) (not e!796970))))

(assert (=> b!1408173 (= res!945892 (and (= (size!47026 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47026 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47026 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408174 () Bool)

(declare-fun res!945890 () Bool)

(assert (=> b!1408174 (=> (not res!945890) (not e!796970))))

(assert (=> b!1408174 (= res!945890 (validKeyInArray!0 (select (arr!46476 a!2901) i!1037)))))

(declare-fun b!1408175 () Bool)

(assert (=> b!1408175 (= e!796970 (not e!796971))))

(declare-fun res!945893 () Bool)

(assert (=> b!1408175 (=> res!945893 e!796971)))

(get-info :version)

(assert (=> b!1408175 (= res!945893 (or (not ((_ is Intermediate!10787) lt!620166)) (undefined!11599 lt!620166)))))

(assert (=> b!1408175 (= lt!620172 (Found!10787 j!112))))

(assert (=> b!1408175 (= lt!620172 (seekEntryOrOpen!0 (select (arr!46476 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96266 (_ BitVec 32)) Bool)

(assert (=> b!1408175 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620167 () Unit!47548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47548)

(assert (=> b!1408175 (= lt!620167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408175 (= lt!620166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620168 (select (arr!46476 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408175 (= lt!620168 (toIndex!0 (select (arr!46476 a!2901) j!112) mask!2840))))

(declare-fun b!1408176 () Bool)

(declare-fun res!945896 () Bool)

(assert (=> b!1408176 (=> res!945896 e!796973)))

(assert (=> b!1408176 (= res!945896 (or (bvslt (x!127132 lt!620166) #b00000000000000000000000000000000) (bvsgt (x!127132 lt!620166) #b01111111111111111111111111111110) (bvslt lt!620168 #b00000000000000000000000000000000) (bvsge lt!620168 (size!47026 a!2901)) (bvslt (index!45527 lt!620166) #b00000000000000000000000000000000) (bvsge (index!45527 lt!620166) (size!47026 a!2901)) (not (= lt!620166 (Intermediate!10787 false (index!45527 lt!620166) (x!127132 lt!620166))))))))

(declare-fun res!945898 () Bool)

(assert (=> start!121112 (=> (not res!945898) (not e!796970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121112 (= res!945898 (validMask!0 mask!2840))))

(assert (=> start!121112 e!796970))

(assert (=> start!121112 true))

(declare-fun array_inv!35504 (array!96266) Bool)

(assert (=> start!121112 (array_inv!35504 a!2901)))

(declare-fun b!1408171 () Bool)

(declare-fun res!945897 () Bool)

(assert (=> b!1408171 (=> (not res!945897) (not e!796970))))

(assert (=> b!1408171 (= res!945897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121112 res!945898) b!1408173))

(assert (= (and b!1408173 res!945892) b!1408174))

(assert (= (and b!1408174 res!945890) b!1408172))

(assert (= (and b!1408172 res!945891) b!1408171))

(assert (= (and b!1408171 res!945897) b!1408170))

(assert (= (and b!1408170 res!945894) b!1408175))

(assert (= (and b!1408175 (not res!945893)) b!1408169))

(assert (= (and b!1408169 (not res!945895)) b!1408176))

(assert (= (and b!1408176 (not res!945896)) b!1408168))

(declare-fun m!1297355 () Bool)

(assert (=> b!1408170 m!1297355))

(declare-fun m!1297357 () Bool)

(assert (=> start!121112 m!1297357))

(declare-fun m!1297359 () Bool)

(assert (=> start!121112 m!1297359))

(declare-fun m!1297361 () Bool)

(assert (=> b!1408169 m!1297361))

(assert (=> b!1408169 m!1297361))

(declare-fun m!1297363 () Bool)

(assert (=> b!1408169 m!1297363))

(declare-fun m!1297365 () Bool)

(assert (=> b!1408169 m!1297365))

(declare-fun m!1297367 () Bool)

(assert (=> b!1408169 m!1297367))

(declare-fun m!1297369 () Bool)

(assert (=> b!1408174 m!1297369))

(assert (=> b!1408174 m!1297369))

(declare-fun m!1297371 () Bool)

(assert (=> b!1408174 m!1297371))

(declare-fun m!1297373 () Bool)

(assert (=> b!1408175 m!1297373))

(declare-fun m!1297375 () Bool)

(assert (=> b!1408175 m!1297375))

(assert (=> b!1408175 m!1297373))

(declare-fun m!1297377 () Bool)

(assert (=> b!1408175 m!1297377))

(assert (=> b!1408175 m!1297373))

(declare-fun m!1297379 () Bool)

(assert (=> b!1408175 m!1297379))

(assert (=> b!1408175 m!1297373))

(declare-fun m!1297381 () Bool)

(assert (=> b!1408175 m!1297381))

(declare-fun m!1297383 () Bool)

(assert (=> b!1408175 m!1297383))

(assert (=> b!1408172 m!1297373))

(assert (=> b!1408172 m!1297373))

(declare-fun m!1297385 () Bool)

(assert (=> b!1408172 m!1297385))

(declare-fun m!1297387 () Bool)

(assert (=> b!1408168 m!1297387))

(declare-fun m!1297389 () Bool)

(assert (=> b!1408168 m!1297389))

(declare-fun m!1297391 () Bool)

(assert (=> b!1408171 m!1297391))

(check-sat (not b!1408171) (not b!1408170) (not start!121112) (not b!1408169) (not b!1408168) (not b!1408175) (not b!1408172) (not b!1408174))
