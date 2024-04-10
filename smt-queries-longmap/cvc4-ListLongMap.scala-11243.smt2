; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131094 () Bool)

(assert start!131094)

(declare-fun b!1538101 () Bool)

(declare-fun res!1055187 () Bool)

(declare-fun e!855856 () Bool)

(assert (=> b!1538101 (=> (not res!1055187) (not e!855856))))

(declare-datatypes ((array!102192 0))(
  ( (array!102193 (arr!49312 (Array (_ BitVec 32) (_ BitVec 64))) (size!49862 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102192)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538101 (= res!1055187 (validKeyInArray!0 (select (arr!49312 a!2792) i!951)))))

(declare-fun res!1055189 () Bool)

(assert (=> start!131094 (=> (not res!1055189) (not e!855856))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131094 (= res!1055189 (validMask!0 mask!2480))))

(assert (=> start!131094 e!855856))

(assert (=> start!131094 true))

(declare-fun array_inv!38340 (array!102192) Bool)

(assert (=> start!131094 (array_inv!38340 a!2792)))

(declare-fun b!1538102 () Bool)

(declare-fun e!855854 () Bool)

(assert (=> b!1538102 (= e!855856 e!855854)))

(declare-fun res!1055188 () Bool)

(assert (=> b!1538102 (=> (not res!1055188) (not e!855854))))

(declare-datatypes ((SeekEntryResult!13438 0))(
  ( (MissingZero!13438 (index!56147 (_ BitVec 32))) (Found!13438 (index!56148 (_ BitVec 32))) (Intermediate!13438 (undefined!14250 Bool) (index!56149 (_ BitVec 32)) (x!137880 (_ BitVec 32))) (Undefined!13438) (MissingVacant!13438 (index!56150 (_ BitVec 32))) )
))
(declare-fun lt!664828 () SeekEntryResult!13438)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538102 (= res!1055188 (and (= lt!664828 (Found!13438 j!64)) (= (select (arr!49312 a!2792) index!463) (select (arr!49312 a!2792) j!64))))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102192 (_ BitVec 32)) SeekEntryResult!13438)

(assert (=> b!1538102 (= lt!664828 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49312 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538103 () Bool)

(assert (=> b!1538103 (= e!855854 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49312 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102193 (store (arr!49312 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49862 a!2792)) mask!2480) lt!664828)))))

(declare-fun b!1538104 () Bool)

(declare-fun res!1055191 () Bool)

(assert (=> b!1538104 (=> (not res!1055191) (not e!855856))))

(declare-datatypes ((List!35786 0))(
  ( (Nil!35783) (Cons!35782 (h!37227 (_ BitVec 64)) (t!50480 List!35786)) )
))
(declare-fun arrayNoDuplicates!0 (array!102192 (_ BitVec 32) List!35786) Bool)

(assert (=> b!1538104 (= res!1055191 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35783))))

(declare-fun b!1538105 () Bool)

(declare-fun res!1055192 () Bool)

(assert (=> b!1538105 (=> (not res!1055192) (not e!855856))))

(assert (=> b!1538105 (= res!1055192 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49862 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49862 a!2792)) (= (select (arr!49312 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538106 () Bool)

(declare-fun res!1055193 () Bool)

(assert (=> b!1538106 (=> (not res!1055193) (not e!855856))))

(assert (=> b!1538106 (= res!1055193 (and (= (size!49862 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49862 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49862 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538107 () Bool)

(declare-fun res!1055194 () Bool)

(assert (=> b!1538107 (=> (not res!1055194) (not e!855856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102192 (_ BitVec 32)) Bool)

(assert (=> b!1538107 (= res!1055194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538108 () Bool)

(declare-fun res!1055190 () Bool)

(assert (=> b!1538108 (=> (not res!1055190) (not e!855856))))

(assert (=> b!1538108 (= res!1055190 (validKeyInArray!0 (select (arr!49312 a!2792) j!64)))))

(assert (= (and start!131094 res!1055189) b!1538106))

(assert (= (and b!1538106 res!1055193) b!1538101))

(assert (= (and b!1538101 res!1055187) b!1538108))

(assert (= (and b!1538108 res!1055190) b!1538107))

(assert (= (and b!1538107 res!1055194) b!1538104))

(assert (= (and b!1538104 res!1055191) b!1538105))

(assert (= (and b!1538105 res!1055192) b!1538102))

(assert (= (and b!1538102 res!1055188) b!1538103))

(declare-fun m!1420607 () Bool)

(assert (=> b!1538102 m!1420607))

(declare-fun m!1420609 () Bool)

(assert (=> b!1538102 m!1420609))

(assert (=> b!1538102 m!1420609))

(declare-fun m!1420611 () Bool)

(assert (=> b!1538102 m!1420611))

(declare-fun m!1420613 () Bool)

(assert (=> b!1538107 m!1420613))

(declare-fun m!1420615 () Bool)

(assert (=> b!1538103 m!1420615))

(declare-fun m!1420617 () Bool)

(assert (=> b!1538103 m!1420617))

(assert (=> b!1538103 m!1420617))

(declare-fun m!1420619 () Bool)

(assert (=> b!1538103 m!1420619))

(declare-fun m!1420621 () Bool)

(assert (=> b!1538105 m!1420621))

(declare-fun m!1420623 () Bool)

(assert (=> start!131094 m!1420623))

(declare-fun m!1420625 () Bool)

(assert (=> start!131094 m!1420625))

(assert (=> b!1538108 m!1420609))

(assert (=> b!1538108 m!1420609))

(declare-fun m!1420627 () Bool)

(assert (=> b!1538108 m!1420627))

(declare-fun m!1420629 () Bool)

(assert (=> b!1538101 m!1420629))

(assert (=> b!1538101 m!1420629))

(declare-fun m!1420631 () Bool)

(assert (=> b!1538101 m!1420631))

(declare-fun m!1420633 () Bool)

(assert (=> b!1538104 m!1420633))

(push 1)

(assert (not b!1538107))

(assert (not b!1538101))

(assert (not b!1538104))

(assert (not b!1538108))

(assert (not b!1538102))

(assert (not b!1538103))

(assert (not start!131094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160315 () Bool)

(assert (=> d!160315 (= (validKeyInArray!0 (select (arr!49312 a!2792) j!64)) (and (not (= (select (arr!49312 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49312 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1538108 d!160315))

(declare-fun d!160319 () Bool)

(declare-fun lt!664859 () SeekEntryResult!13438)

