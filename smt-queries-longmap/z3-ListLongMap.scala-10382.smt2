; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122402 () Bool)

(assert start!122402)

(declare-fun res!953919 () Bool)

(declare-fun e!803074 () Bool)

(assert (=> start!122402 (=> (not res!953919) (not e!803074))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122402 (= res!953919 (validMask!0 mask!2608))))

(assert (=> start!122402 e!803074))

(assert (=> start!122402 true))

(declare-datatypes ((array!96908 0))(
  ( (array!96909 (arr!46780 (Array (_ BitVec 32) (_ BitVec 64))) (size!47331 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96908)

(declare-fun array_inv!36061 (array!96908) Bool)

(assert (=> start!122402 (array_inv!36061 a!2831)))

(declare-fun b!1418870 () Bool)

(declare-fun res!953920 () Bool)

(assert (=> b!1418870 (=> (not res!953920) (not e!803074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96908 (_ BitVec 32)) Bool)

(assert (=> b!1418870 (= res!953920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418871 () Bool)

(declare-fun res!953918 () Bool)

(assert (=> b!1418871 (=> (not res!953918) (not e!803074))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418871 (= res!953918 (validKeyInArray!0 (select (arr!46780 a!2831) i!982)))))

(declare-fun b!1418872 () Bool)

(declare-fun res!953916 () Bool)

(assert (=> b!1418872 (=> (not res!953916) (not e!803074))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418872 (= res!953916 (validKeyInArray!0 (select (arr!46780 a!2831) j!81)))))

(declare-fun b!1418873 () Bool)

(assert (=> b!1418873 (= e!803074 (bvsgt #b00000000000000000000000000000000 (size!47331 a!2831)))))

(declare-fun b!1418874 () Bool)

(declare-fun res!953917 () Bool)

(assert (=> b!1418874 (=> (not res!953917) (not e!803074))))

(assert (=> b!1418874 (= res!953917 (and (= (size!47331 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47331 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47331 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122402 res!953919) b!1418874))

(assert (= (and b!1418874 res!953917) b!1418871))

(assert (= (and b!1418871 res!953918) b!1418872))

(assert (= (and b!1418872 res!953916) b!1418870))

(assert (= (and b!1418870 res!953920) b!1418873))

(declare-fun m!1309885 () Bool)

(assert (=> start!122402 m!1309885))

(declare-fun m!1309887 () Bool)

(assert (=> start!122402 m!1309887))

(declare-fun m!1309889 () Bool)

(assert (=> b!1418870 m!1309889))

(declare-fun m!1309891 () Bool)

(assert (=> b!1418871 m!1309891))

(assert (=> b!1418871 m!1309891))

(declare-fun m!1309893 () Bool)

(assert (=> b!1418871 m!1309893))

(declare-fun m!1309895 () Bool)

(assert (=> b!1418872 m!1309895))

(assert (=> b!1418872 m!1309895))

(declare-fun m!1309897 () Bool)

(assert (=> b!1418872 m!1309897))

(check-sat (not b!1418871) (not start!122402) (not b!1418870) (not b!1418872))
(check-sat)
