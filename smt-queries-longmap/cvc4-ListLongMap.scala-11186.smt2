; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130752 () Bool)

(assert start!130752)

(declare-fun res!1050530 () Bool)

(declare-fun e!854236 () Bool)

(assert (=> start!130752 (=> (not res!1050530) (not e!854236))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130752 (= res!1050530 (validMask!0 mask!2480))))

(assert (=> start!130752 e!854236))

(assert (=> start!130752 true))

(declare-datatypes ((array!101850 0))(
  ( (array!101851 (arr!49141 (Array (_ BitVec 32) (_ BitVec 64))) (size!49691 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101850)

(declare-fun array_inv!38169 (array!101850) Bool)

(assert (=> start!130752 (array_inv!38169 a!2792)))

(declare-fun b!1533440 () Bool)

(declare-fun res!1050532 () Bool)

(assert (=> b!1533440 (=> (not res!1050532) (not e!854236))))

(declare-datatypes ((List!35615 0))(
  ( (Nil!35612) (Cons!35611 (h!37056 (_ BitVec 64)) (t!50309 List!35615)) )
))
(declare-fun arrayNoDuplicates!0 (array!101850 (_ BitVec 32) List!35615) Bool)

(assert (=> b!1533440 (= res!1050532 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35612))))

(declare-fun b!1533441 () Bool)

(declare-fun res!1050528 () Bool)

(assert (=> b!1533441 (=> (not res!1050528) (not e!854236))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533441 (= res!1050528 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49691 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49691 a!2792)) (= (select (arr!49141 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533442 () Bool)

(declare-fun res!1050526 () Bool)

(assert (=> b!1533442 (=> (not res!1050526) (not e!854236))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533442 (= res!1050526 (and (= (size!49691 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49691 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49691 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533443 () Bool)

(declare-fun res!1050531 () Bool)

(assert (=> b!1533443 (=> (not res!1050531) (not e!854236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533443 (= res!1050531 (validKeyInArray!0 (select (arr!49141 a!2792) i!951)))))

(declare-fun b!1533444 () Bool)

(declare-fun res!1050529 () Bool)

(assert (=> b!1533444 (=> (not res!1050529) (not e!854236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101850 (_ BitVec 32)) Bool)

(assert (=> b!1533444 (= res!1050529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533445 () Bool)

(assert (=> b!1533445 (= e!854236 false)))

(declare-datatypes ((SeekEntryResult!13273 0))(
  ( (MissingZero!13273 (index!55487 (_ BitVec 32))) (Found!13273 (index!55488 (_ BitVec 32))) (Intermediate!13273 (undefined!14085 Bool) (index!55489 (_ BitVec 32)) (x!137259 (_ BitVec 32))) (Undefined!13273) (MissingVacant!13273 (index!55490 (_ BitVec 32))) )
))
(declare-fun lt!663802 () SeekEntryResult!13273)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101850 (_ BitVec 32)) SeekEntryResult!13273)

(assert (=> b!1533445 (= lt!663802 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49141 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533446 () Bool)

(declare-fun res!1050527 () Bool)

(assert (=> b!1533446 (=> (not res!1050527) (not e!854236))))

(assert (=> b!1533446 (= res!1050527 (validKeyInArray!0 (select (arr!49141 a!2792) j!64)))))

(assert (= (and start!130752 res!1050530) b!1533442))

(assert (= (and b!1533442 res!1050526) b!1533443))

(assert (= (and b!1533443 res!1050531) b!1533446))

(assert (= (and b!1533446 res!1050527) b!1533444))

(assert (= (and b!1533444 res!1050529) b!1533440))

(assert (= (and b!1533440 res!1050532) b!1533441))

(assert (= (and b!1533441 res!1050528) b!1533445))

(declare-fun m!1416133 () Bool)

(assert (=> start!130752 m!1416133))

(declare-fun m!1416135 () Bool)

(assert (=> start!130752 m!1416135))

(declare-fun m!1416137 () Bool)

(assert (=> b!1533443 m!1416137))

(assert (=> b!1533443 m!1416137))

(declare-fun m!1416139 () Bool)

(assert (=> b!1533443 m!1416139))

(declare-fun m!1416141 () Bool)

(assert (=> b!1533441 m!1416141))

(declare-fun m!1416143 () Bool)

(assert (=> b!1533440 m!1416143))

(declare-fun m!1416145 () Bool)

(assert (=> b!1533445 m!1416145))

(assert (=> b!1533445 m!1416145))

(declare-fun m!1416147 () Bool)

(assert (=> b!1533445 m!1416147))

(declare-fun m!1416149 () Bool)

(assert (=> b!1533444 m!1416149))

(assert (=> b!1533446 m!1416145))

(assert (=> b!1533446 m!1416145))

(declare-fun m!1416151 () Bool)

(assert (=> b!1533446 m!1416151))

(push 1)

(assert (not b!1533440))

(assert (not b!1533446))

(assert (not b!1533443))

(assert (not start!130752))

(assert (not b!1533444))

(assert (not b!1533445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

