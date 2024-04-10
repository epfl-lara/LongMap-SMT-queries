; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120602 () Bool)

(assert start!120602)

(declare-fun b!1404205 () Bool)

(declare-fun res!942720 () Bool)

(declare-fun e!794962 () Bool)

(assert (=> b!1404205 (=> (not res!942720) (not e!794962))))

(declare-datatypes ((array!96011 0))(
  ( (array!96012 (arr!46356 (Array (_ BitVec 32) (_ BitVec 64))) (size!46906 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96011)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404205 (= res!942720 (validKeyInArray!0 (select (arr!46356 a!2901) i!1037)))))

(declare-fun b!1404207 () Bool)

(declare-fun res!942721 () Bool)

(assert (=> b!1404207 (=> (not res!942721) (not e!794962))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404207 (= res!942721 (validKeyInArray!0 (select (arr!46356 a!2901) j!112)))))

(declare-fun b!1404208 () Bool)

(declare-fun res!942718 () Bool)

(assert (=> b!1404208 (=> (not res!942718) (not e!794962))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1404208 (= res!942718 (and (= (size!46906 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46906 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46906 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404209 () Bool)

(assert (=> b!1404209 (= e!794962 false)))

(declare-datatypes ((SeekEntryResult!10667 0))(
  ( (MissingZero!10667 (index!45045 (_ BitVec 32))) (Found!10667 (index!45046 (_ BitVec 32))) (Intermediate!10667 (undefined!11479 Bool) (index!45047 (_ BitVec 32)) (x!126662 (_ BitVec 32))) (Undefined!10667) (MissingVacant!10667 (index!45048 (_ BitVec 32))) )
))
(declare-fun lt!618606 () SeekEntryResult!10667)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96011 (_ BitVec 32)) SeekEntryResult!10667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404209 (= lt!618606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46356 a!2901) j!112) mask!2840) (select (arr!46356 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404210 () Bool)

(declare-fun res!942716 () Bool)

(assert (=> b!1404210 (=> (not res!942716) (not e!794962))))

(declare-datatypes ((List!32875 0))(
  ( (Nil!32872) (Cons!32871 (h!34119 (_ BitVec 64)) (t!47569 List!32875)) )
))
(declare-fun arrayNoDuplicates!0 (array!96011 (_ BitVec 32) List!32875) Bool)

(assert (=> b!1404210 (= res!942716 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32872))))

(declare-fun res!942719 () Bool)

(assert (=> start!120602 (=> (not res!942719) (not e!794962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120602 (= res!942719 (validMask!0 mask!2840))))

(assert (=> start!120602 e!794962))

(assert (=> start!120602 true))

(declare-fun array_inv!35384 (array!96011) Bool)

(assert (=> start!120602 (array_inv!35384 a!2901)))

(declare-fun b!1404206 () Bool)

(declare-fun res!942717 () Bool)

(assert (=> b!1404206 (=> (not res!942717) (not e!794962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96011 (_ BitVec 32)) Bool)

(assert (=> b!1404206 (= res!942717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120602 res!942719) b!1404208))

(assert (= (and b!1404208 res!942718) b!1404205))

(assert (= (and b!1404205 res!942720) b!1404207))

(assert (= (and b!1404207 res!942721) b!1404206))

(assert (= (and b!1404206 res!942717) b!1404210))

(assert (= (and b!1404210 res!942716) b!1404209))

(declare-fun m!1293017 () Bool)

(assert (=> b!1404210 m!1293017))

(declare-fun m!1293019 () Bool)

(assert (=> b!1404207 m!1293019))

(assert (=> b!1404207 m!1293019))

(declare-fun m!1293021 () Bool)

(assert (=> b!1404207 m!1293021))

(declare-fun m!1293023 () Bool)

(assert (=> b!1404205 m!1293023))

(assert (=> b!1404205 m!1293023))

(declare-fun m!1293025 () Bool)

(assert (=> b!1404205 m!1293025))

(declare-fun m!1293027 () Bool)

(assert (=> b!1404206 m!1293027))

(assert (=> b!1404209 m!1293019))

(assert (=> b!1404209 m!1293019))

(declare-fun m!1293029 () Bool)

(assert (=> b!1404209 m!1293029))

(assert (=> b!1404209 m!1293029))

(assert (=> b!1404209 m!1293019))

(declare-fun m!1293031 () Bool)

(assert (=> b!1404209 m!1293031))

(declare-fun m!1293033 () Bool)

(assert (=> start!120602 m!1293033))

(declare-fun m!1293035 () Bool)

(assert (=> start!120602 m!1293035))

(check-sat (not b!1404205) (not start!120602) (not b!1404207) (not b!1404209) (not b!1404210) (not b!1404206))
