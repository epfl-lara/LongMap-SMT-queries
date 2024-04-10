; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119802 () Bool)

(assert start!119802)

(declare-fun b!1395269 () Bool)

(declare-fun res!934518 () Bool)

(declare-fun e!789926 () Bool)

(assert (=> b!1395269 (=> (not res!934518) (not e!789926))))

(declare-datatypes ((array!95433 0))(
  ( (array!95434 (arr!46073 (Array (_ BitVec 32) (_ BitVec 64))) (size!46623 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95433)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395269 (= res!934518 (validKeyInArray!0 (select (arr!46073 a!2901) j!112)))))

(declare-fun b!1395270 () Bool)

(declare-fun res!934512 () Bool)

(assert (=> b!1395270 (=> (not res!934512) (not e!789926))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95433 (_ BitVec 32)) Bool)

(assert (=> b!1395270 (= res!934512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395271 () Bool)

(declare-fun res!934519 () Bool)

(assert (=> b!1395271 (=> (not res!934519) (not e!789926))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395271 (= res!934519 (and (= (size!46623 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46623 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46623 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395272 () Bool)

(declare-fun res!934514 () Bool)

(assert (=> b!1395272 (=> (not res!934514) (not e!789926))))

(declare-datatypes ((List!32592 0))(
  ( (Nil!32589) (Cons!32588 (h!33824 (_ BitVec 64)) (t!47286 List!32592)) )
))
(declare-fun arrayNoDuplicates!0 (array!95433 (_ BitVec 32) List!32592) Bool)

(assert (=> b!1395272 (= res!934514 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32589))))

(declare-fun b!1395273 () Bool)

(declare-fun res!934515 () Bool)

(assert (=> b!1395273 (=> (not res!934515) (not e!789926))))

(assert (=> b!1395273 (= res!934515 (validKeyInArray!0 (select (arr!46073 a!2901) i!1037)))))

(declare-fun b!1395274 () Bool)

(declare-fun e!789923 () Bool)

(declare-datatypes ((SeekEntryResult!10390 0))(
  ( (MissingZero!10390 (index!43931 (_ BitVec 32))) (Found!10390 (index!43932 (_ BitVec 32))) (Intermediate!10390 (undefined!11202 Bool) (index!43933 (_ BitVec 32)) (x!125600 (_ BitVec 32))) (Undefined!10390) (MissingVacant!10390 (index!43934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95433 (_ BitVec 32)) SeekEntryResult!10390)

(assert (=> b!1395274 (= e!789923 (= (seekEntryOrOpen!0 (select (arr!46073 a!2901) j!112) a!2901 mask!2840) (Found!10390 j!112)))))

(declare-fun res!934513 () Bool)

(assert (=> start!119802 (=> (not res!934513) (not e!789926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119802 (= res!934513 (validMask!0 mask!2840))))

(assert (=> start!119802 e!789926))

(assert (=> start!119802 true))

(declare-fun array_inv!35101 (array!95433) Bool)

(assert (=> start!119802 (array_inv!35101 a!2901)))

(declare-fun b!1395275 () Bool)

(declare-fun e!789925 () Bool)

(assert (=> b!1395275 (= e!789925 true)))

(declare-fun lt!612935 () SeekEntryResult!10390)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95433 (_ BitVec 32)) SeekEntryResult!10390)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395275 (= lt!612935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46073 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46073 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95434 (store (arr!46073 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46623 a!2901)) mask!2840))))

(declare-fun b!1395276 () Bool)

(assert (=> b!1395276 (= e!789926 (not e!789925))))

(declare-fun res!934517 () Bool)

(assert (=> b!1395276 (=> res!934517 e!789925)))

(declare-fun lt!612936 () SeekEntryResult!10390)

(assert (=> b!1395276 (= res!934517 (or (not (is-Intermediate!10390 lt!612936)) (undefined!11202 lt!612936)))))

(assert (=> b!1395276 e!789923))

(declare-fun res!934516 () Bool)

(assert (=> b!1395276 (=> (not res!934516) (not e!789923))))

(assert (=> b!1395276 (= res!934516 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46784 0))(
  ( (Unit!46785) )
))
(declare-fun lt!612934 () Unit!46784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46784)

(assert (=> b!1395276 (= lt!612934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395276 (= lt!612936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46073 a!2901) j!112) mask!2840) (select (arr!46073 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119802 res!934513) b!1395271))

(assert (= (and b!1395271 res!934519) b!1395273))

(assert (= (and b!1395273 res!934515) b!1395269))

(assert (= (and b!1395269 res!934518) b!1395270))

(assert (= (and b!1395270 res!934512) b!1395272))

(assert (= (and b!1395272 res!934514) b!1395276))

(assert (= (and b!1395276 res!934516) b!1395274))

(assert (= (and b!1395276 (not res!934517)) b!1395275))

(declare-fun m!1281693 () Bool)

(assert (=> b!1395276 m!1281693))

(declare-fun m!1281695 () Bool)

(assert (=> b!1395276 m!1281695))

(assert (=> b!1395276 m!1281693))

(declare-fun m!1281697 () Bool)

(assert (=> b!1395276 m!1281697))

(assert (=> b!1395276 m!1281695))

(assert (=> b!1395276 m!1281693))

(declare-fun m!1281699 () Bool)

(assert (=> b!1395276 m!1281699))

(declare-fun m!1281701 () Bool)

(assert (=> b!1395276 m!1281701))

(declare-fun m!1281703 () Bool)

(assert (=> b!1395270 m!1281703))

(assert (=> b!1395274 m!1281693))

(assert (=> b!1395274 m!1281693))

(declare-fun m!1281705 () Bool)

(assert (=> b!1395274 m!1281705))

(declare-fun m!1281707 () Bool)

(assert (=> b!1395273 m!1281707))

(assert (=> b!1395273 m!1281707))

(declare-fun m!1281709 () Bool)

(assert (=> b!1395273 m!1281709))

(declare-fun m!1281711 () Bool)

(assert (=> b!1395272 m!1281711))

(declare-fun m!1281713 () Bool)

(assert (=> start!119802 m!1281713))

(declare-fun m!1281715 () Bool)

(assert (=> start!119802 m!1281715))

(declare-fun m!1281717 () Bool)

(assert (=> b!1395275 m!1281717))

(declare-fun m!1281719 () Bool)

(assert (=> b!1395275 m!1281719))

(assert (=> b!1395275 m!1281719))

(declare-fun m!1281721 () Bool)

(assert (=> b!1395275 m!1281721))

(assert (=> b!1395275 m!1281721))

(assert (=> b!1395275 m!1281719))

(declare-fun m!1281723 () Bool)

(assert (=> b!1395275 m!1281723))

(assert (=> b!1395269 m!1281693))

(assert (=> b!1395269 m!1281693))

(declare-fun m!1281725 () Bool)

(assert (=> b!1395269 m!1281725))

(push 1)

(assert (not b!1395270))

(assert (not b!1395272))

(assert (not b!1395269))

(assert (not b!1395275))

(assert (not b!1395273))

(assert (not start!119802))

(assert (not b!1395276))

(assert (not b!1395274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

