; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131470 () Bool)

(assert start!131470)

(declare-fun b!1540088 () Bool)

(declare-fun res!1055603 () Bool)

(declare-fun e!857229 () Bool)

(assert (=> b!1540088 (=> (not res!1055603) (not e!857229))))

(declare-datatypes ((array!102272 0))(
  ( (array!102273 (arr!49344 (Array (_ BitVec 32) (_ BitVec 64))) (size!49895 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102272)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540088 (= res!1055603 (validKeyInArray!0 (select (arr!49344 a!2792) j!64)))))

(declare-fun b!1540089 () Bool)

(declare-fun res!1055602 () Bool)

(assert (=> b!1540089 (=> (not res!1055602) (not e!857229))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540089 (= res!1055602 (and (= (size!49895 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49895 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49895 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540090 () Bool)

(declare-fun res!1055600 () Bool)

(assert (=> b!1540090 (=> (not res!1055600) (not e!857229))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540090 (= res!1055600 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49895 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49895 a!2792)) (= (select (arr!49344 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540091 () Bool)

(declare-fun res!1055598 () Bool)

(assert (=> b!1540091 (=> (not res!1055598) (not e!857229))))

(declare-datatypes ((List!35805 0))(
  ( (Nil!35802) (Cons!35801 (h!37264 (_ BitVec 64)) (t!50491 List!35805)) )
))
(declare-fun arrayNoDuplicates!0 (array!102272 (_ BitVec 32) List!35805) Bool)

(assert (=> b!1540091 (= res!1055598 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35802))))

(declare-fun res!1055599 () Bool)

(assert (=> start!131470 (=> (not res!1055599) (not e!857229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131470 (= res!1055599 (validMask!0 mask!2480))))

(assert (=> start!131470 e!857229))

(assert (=> start!131470 true))

(declare-fun array_inv!38625 (array!102272) Bool)

(assert (=> start!131470 (array_inv!38625 a!2792)))

(declare-fun b!1540092 () Bool)

(assert (=> b!1540092 (= e!857229 false)))

(declare-datatypes ((SeekEntryResult!13365 0))(
  ( (MissingZero!13365 (index!55855 (_ BitVec 32))) (Found!13365 (index!55856 (_ BitVec 32))) (Intermediate!13365 (undefined!14177 Bool) (index!55857 (_ BitVec 32)) (x!137801 (_ BitVec 32))) (Undefined!13365) (MissingVacant!13365 (index!55858 (_ BitVec 32))) )
))
(declare-fun lt!665676 () SeekEntryResult!13365)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102272 (_ BitVec 32)) SeekEntryResult!13365)

(assert (=> b!1540092 (= lt!665676 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49344 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540093 () Bool)

(declare-fun res!1055604 () Bool)

(assert (=> b!1540093 (=> (not res!1055604) (not e!857229))))

(assert (=> b!1540093 (= res!1055604 (validKeyInArray!0 (select (arr!49344 a!2792) i!951)))))

(declare-fun b!1540094 () Bool)

(declare-fun res!1055601 () Bool)

(assert (=> b!1540094 (=> (not res!1055601) (not e!857229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102272 (_ BitVec 32)) Bool)

(assert (=> b!1540094 (= res!1055601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131470 res!1055599) b!1540089))

(assert (= (and b!1540089 res!1055602) b!1540093))

(assert (= (and b!1540093 res!1055604) b!1540088))

(assert (= (and b!1540088 res!1055603) b!1540094))

(assert (= (and b!1540094 res!1055601) b!1540091))

(assert (= (and b!1540091 res!1055598) b!1540090))

(assert (= (and b!1540090 res!1055600) b!1540092))

(declare-fun m!1422407 () Bool)

(assert (=> b!1540090 m!1422407))

(declare-fun m!1422409 () Bool)

(assert (=> start!131470 m!1422409))

(declare-fun m!1422411 () Bool)

(assert (=> start!131470 m!1422411))

(declare-fun m!1422413 () Bool)

(assert (=> b!1540094 m!1422413))

(declare-fun m!1422415 () Bool)

(assert (=> b!1540088 m!1422415))

(assert (=> b!1540088 m!1422415))

(declare-fun m!1422417 () Bool)

(assert (=> b!1540088 m!1422417))

(assert (=> b!1540092 m!1422415))

(assert (=> b!1540092 m!1422415))

(declare-fun m!1422419 () Bool)

(assert (=> b!1540092 m!1422419))

(declare-fun m!1422421 () Bool)

(assert (=> b!1540091 m!1422421))

(declare-fun m!1422423 () Bool)

(assert (=> b!1540093 m!1422423))

(assert (=> b!1540093 m!1422423))

(declare-fun m!1422425 () Bool)

(assert (=> b!1540093 m!1422425))

(push 1)

(assert (not b!1540094))

(assert (not start!131470))

(assert (not b!1540091))

(assert (not b!1540092))

(assert (not b!1540088))

(assert (not b!1540093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

