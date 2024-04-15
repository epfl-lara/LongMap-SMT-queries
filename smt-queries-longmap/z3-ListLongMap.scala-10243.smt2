; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120506 () Bool)

(assert start!120506)

(declare-fun b!1403165 () Bool)

(declare-fun res!941729 () Bool)

(declare-fun e!794508 () Bool)

(assert (=> b!1403165 (=> (not res!941729) (not e!794508))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95868 0))(
  ( (array!95869 (arr!46285 (Array (_ BitVec 32) (_ BitVec 64))) (size!46837 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95868)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403165 (= res!941729 (and (= (size!46837 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46837 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46837 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403166 () Bool)

(declare-fun res!941728 () Bool)

(assert (=> b!1403166 (=> (not res!941728) (not e!794508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95868 (_ BitVec 32)) Bool)

(assert (=> b!1403166 (= res!941728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403167 () Bool)

(declare-fun e!794507 () Bool)

(declare-datatypes ((SeekEntryResult!10628 0))(
  ( (MissingZero!10628 (index!44889 (_ BitVec 32))) (Found!10628 (index!44890 (_ BitVec 32))) (Intermediate!10628 (undefined!11440 Bool) (index!44891 (_ BitVec 32)) (x!126500 (_ BitVec 32))) (Undefined!10628) (MissingVacant!10628 (index!44892 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95868 (_ BitVec 32)) SeekEntryResult!10628)

(assert (=> b!1403167 (= e!794507 (= (seekEntryOrOpen!0 (select (arr!46285 a!2901) j!112) a!2901 mask!2840) (Found!10628 j!112)))))

(declare-fun b!1403168 () Bool)

(declare-fun res!941733 () Bool)

(assert (=> b!1403168 (=> (not res!941733) (not e!794508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403168 (= res!941733 (validKeyInArray!0 (select (arr!46285 a!2901) i!1037)))))

(declare-fun b!1403169 () Bool)

(declare-fun res!941732 () Bool)

(assert (=> b!1403169 (=> (not res!941732) (not e!794508))))

(assert (=> b!1403169 (= res!941732 (validKeyInArray!0 (select (arr!46285 a!2901) j!112)))))

(declare-fun b!1403170 () Bool)

(declare-fun res!941731 () Bool)

(assert (=> b!1403170 (=> (not res!941731) (not e!794508))))

(declare-datatypes ((List!32882 0))(
  ( (Nil!32879) (Cons!32878 (h!34126 (_ BitVec 64)) (t!47568 List!32882)) )
))
(declare-fun arrayNoDuplicates!0 (array!95868 (_ BitVec 32) List!32882) Bool)

(assert (=> b!1403170 (= res!941731 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32879))))

(declare-fun b!1403171 () Bool)

(declare-fun e!794509 () Bool)

(assert (=> b!1403171 (= e!794509 true)))

(declare-fun lt!618138 () SeekEntryResult!10628)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95868 (_ BitVec 32)) SeekEntryResult!10628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403171 (= lt!618138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95869 (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46837 a!2901)) mask!2840))))

(declare-fun b!1403172 () Bool)

(assert (=> b!1403172 (= e!794508 (not e!794509))))

(declare-fun res!941734 () Bool)

(assert (=> b!1403172 (=> res!941734 e!794509)))

(declare-fun lt!618140 () SeekEntryResult!10628)

(get-info :version)

(assert (=> b!1403172 (= res!941734 (or (not ((_ is Intermediate!10628) lt!618140)) (undefined!11440 lt!618140)))))

(assert (=> b!1403172 e!794507))

(declare-fun res!941730 () Bool)

(assert (=> b!1403172 (=> (not res!941730) (not e!794507))))

(assert (=> b!1403172 (= res!941730 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47103 0))(
  ( (Unit!47104) )
))
(declare-fun lt!618139 () Unit!47103)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47103)

(assert (=> b!1403172 (= lt!618139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403172 (= lt!618140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46285 a!2901) j!112) mask!2840) (select (arr!46285 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!941727 () Bool)

(assert (=> start!120506 (=> (not res!941727) (not e!794508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120506 (= res!941727 (validMask!0 mask!2840))))

(assert (=> start!120506 e!794508))

(assert (=> start!120506 true))

(declare-fun array_inv!35518 (array!95868) Bool)

(assert (=> start!120506 (array_inv!35518 a!2901)))

(assert (= (and start!120506 res!941727) b!1403165))

(assert (= (and b!1403165 res!941729) b!1403168))

(assert (= (and b!1403168 res!941733) b!1403169))

(assert (= (and b!1403169 res!941732) b!1403166))

(assert (= (and b!1403166 res!941728) b!1403170))

(assert (= (and b!1403170 res!941731) b!1403172))

(assert (= (and b!1403172 res!941730) b!1403167))

(assert (= (and b!1403172 (not res!941734)) b!1403171))

(declare-fun m!1291267 () Bool)

(assert (=> b!1403167 m!1291267))

(assert (=> b!1403167 m!1291267))

(declare-fun m!1291269 () Bool)

(assert (=> b!1403167 m!1291269))

(assert (=> b!1403169 m!1291267))

(assert (=> b!1403169 m!1291267))

(declare-fun m!1291271 () Bool)

(assert (=> b!1403169 m!1291271))

(declare-fun m!1291273 () Bool)

(assert (=> b!1403166 m!1291273))

(declare-fun m!1291275 () Bool)

(assert (=> b!1403171 m!1291275))

(declare-fun m!1291277 () Bool)

(assert (=> b!1403171 m!1291277))

(assert (=> b!1403171 m!1291277))

(declare-fun m!1291279 () Bool)

(assert (=> b!1403171 m!1291279))

(assert (=> b!1403171 m!1291279))

(assert (=> b!1403171 m!1291277))

(declare-fun m!1291281 () Bool)

(assert (=> b!1403171 m!1291281))

(declare-fun m!1291283 () Bool)

(assert (=> b!1403170 m!1291283))

(assert (=> b!1403172 m!1291267))

(declare-fun m!1291285 () Bool)

(assert (=> b!1403172 m!1291285))

(assert (=> b!1403172 m!1291267))

(declare-fun m!1291287 () Bool)

(assert (=> b!1403172 m!1291287))

(assert (=> b!1403172 m!1291285))

(assert (=> b!1403172 m!1291267))

(declare-fun m!1291289 () Bool)

(assert (=> b!1403172 m!1291289))

(declare-fun m!1291291 () Bool)

(assert (=> b!1403172 m!1291291))

(declare-fun m!1291293 () Bool)

(assert (=> start!120506 m!1291293))

(declare-fun m!1291295 () Bool)

(assert (=> start!120506 m!1291295))

(declare-fun m!1291297 () Bool)

(assert (=> b!1403168 m!1291297))

(assert (=> b!1403168 m!1291297))

(declare-fun m!1291299 () Bool)

(assert (=> b!1403168 m!1291299))

(check-sat (not b!1403169) (not b!1403172) (not b!1403171) (not b!1403167) (not b!1403168) (not start!120506) (not b!1403170) (not b!1403166))
(check-sat)
