; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131148 () Bool)

(assert start!131148)

(declare-fun b!1535901 () Bool)

(declare-fun res!1051509 () Bool)

(declare-fun e!855697 () Bool)

(assert (=> b!1535901 (=> (not res!1051509) (not e!855697))))

(declare-datatypes ((array!101983 0))(
  ( (array!101984 (arr!49201 (Array (_ BitVec 32) (_ BitVec 64))) (size!49752 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101983)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535901 (= res!1051509 (validKeyInArray!0 (select (arr!49201 a!2792) j!64)))))

(declare-fun b!1535902 () Bool)

(declare-fun res!1051508 () Bool)

(assert (=> b!1535902 (=> (not res!1051508) (not e!855697))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535902 (= res!1051508 (and (= (size!49752 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49752 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49752 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535903 () Bool)

(assert (=> b!1535903 (= e!855697 (not (validKeyInArray!0 (select (store (arr!49201 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))))

(declare-fun b!1535904 () Bool)

(declare-fun res!1051506 () Bool)

(assert (=> b!1535904 (=> (not res!1051506) (not e!855697))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13228 0))(
  ( (MissingZero!13228 (index!55307 (_ BitVec 32))) (Found!13228 (index!55308 (_ BitVec 32))) (Intermediate!13228 (undefined!14040 Bool) (index!55309 (_ BitVec 32)) (x!137285 (_ BitVec 32))) (Undefined!13228) (MissingVacant!13228 (index!55310 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101983 (_ BitVec 32)) SeekEntryResult!13228)

(assert (=> b!1535904 (= res!1051506 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49201 a!2792) j!64) a!2792 mask!2480) (Found!13228 j!64)))))

(declare-fun res!1051503 () Bool)

(assert (=> start!131148 (=> (not res!1051503) (not e!855697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131148 (= res!1051503 (validMask!0 mask!2480))))

(assert (=> start!131148 e!855697))

(assert (=> start!131148 true))

(declare-fun array_inv!38482 (array!101983) Bool)

(assert (=> start!131148 (array_inv!38482 a!2792)))

(declare-fun b!1535905 () Bool)

(declare-fun res!1051507 () Bool)

(assert (=> b!1535905 (=> (not res!1051507) (not e!855697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101983 (_ BitVec 32)) Bool)

(assert (=> b!1535905 (= res!1051507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535906 () Bool)

(declare-fun res!1051502 () Bool)

(assert (=> b!1535906 (=> (not res!1051502) (not e!855697))))

(declare-datatypes ((List!35662 0))(
  ( (Nil!35659) (Cons!35658 (h!37121 (_ BitVec 64)) (t!50348 List!35662)) )
))
(declare-fun arrayNoDuplicates!0 (array!101983 (_ BitVec 32) List!35662) Bool)

(assert (=> b!1535906 (= res!1051502 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35659))))

(declare-fun b!1535907 () Bool)

(declare-fun res!1051504 () Bool)

(assert (=> b!1535907 (=> (not res!1051504) (not e!855697))))

(assert (=> b!1535907 (= res!1051504 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49752 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49752 a!2792)) (= (select (arr!49201 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535908 () Bool)

(declare-fun res!1051501 () Bool)

(assert (=> b!1535908 (=> (not res!1051501) (not e!855697))))

(assert (=> b!1535908 (= res!1051501 (validKeyInArray!0 (select (arr!49201 a!2792) i!951)))))

(declare-fun b!1535909 () Bool)

(declare-fun res!1051505 () Bool)

(assert (=> b!1535909 (=> (not res!1051505) (not e!855697))))

(assert (=> b!1535909 (= res!1051505 (and (= (select (arr!49201 a!2792) index!463) (select (arr!49201 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49201 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131148 res!1051503) b!1535902))

(assert (= (and b!1535902 res!1051508) b!1535908))

(assert (= (and b!1535908 res!1051501) b!1535901))

(assert (= (and b!1535901 res!1051509) b!1535905))

(assert (= (and b!1535905 res!1051507) b!1535906))

(assert (= (and b!1535906 res!1051502) b!1535907))

(assert (= (and b!1535907 res!1051504) b!1535904))

(assert (= (and b!1535904 res!1051506) b!1535909))

(assert (= (and b!1535909 res!1051505) b!1535903))

(declare-fun m!1418455 () Bool)

(assert (=> b!1535906 m!1418455))

(declare-fun m!1418457 () Bool)

(assert (=> b!1535907 m!1418457))

(declare-fun m!1418459 () Bool)

(assert (=> b!1535908 m!1418459))

(assert (=> b!1535908 m!1418459))

(declare-fun m!1418461 () Bool)

(assert (=> b!1535908 m!1418461))

(declare-fun m!1418463 () Bool)

(assert (=> b!1535901 m!1418463))

(assert (=> b!1535901 m!1418463))

(declare-fun m!1418465 () Bool)

(assert (=> b!1535901 m!1418465))

(assert (=> b!1535904 m!1418463))

(assert (=> b!1535904 m!1418463))

(declare-fun m!1418467 () Bool)

(assert (=> b!1535904 m!1418467))

(declare-fun m!1418469 () Bool)

(assert (=> b!1535909 m!1418469))

(assert (=> b!1535909 m!1418463))

(declare-fun m!1418471 () Bool)

(assert (=> b!1535909 m!1418471))

(declare-fun m!1418473 () Bool)

(assert (=> b!1535909 m!1418473))

(declare-fun m!1418475 () Bool)

(assert (=> b!1535905 m!1418475))

(declare-fun m!1418477 () Bool)

(assert (=> start!131148 m!1418477))

(declare-fun m!1418479 () Bool)

(assert (=> start!131148 m!1418479))

(assert (=> b!1535903 m!1418471))

(declare-fun m!1418481 () Bool)

(assert (=> b!1535903 m!1418481))

(assert (=> b!1535903 m!1418481))

(declare-fun m!1418483 () Bool)

(assert (=> b!1535903 m!1418483))

(check-sat (not b!1535904) (not b!1535903) (not b!1535906) (not start!131148) (not b!1535908) (not b!1535901) (not b!1535905))
(check-sat)
