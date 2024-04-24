; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131482 () Bool)

(assert start!131482)

(declare-fun b!1540214 () Bool)

(declare-fun res!1055729 () Bool)

(declare-fun e!857265 () Bool)

(assert (=> b!1540214 (=> (not res!1055729) (not e!857265))))

(declare-datatypes ((array!102284 0))(
  ( (array!102285 (arr!49350 (Array (_ BitVec 32) (_ BitVec 64))) (size!49901 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102284)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540214 (= res!1055729 (validKeyInArray!0 (select (arr!49350 a!2792) j!64)))))

(declare-fun b!1540215 () Bool)

(declare-fun res!1055728 () Bool)

(assert (=> b!1540215 (=> (not res!1055728) (not e!857265))))

(declare-datatypes ((List!35811 0))(
  ( (Nil!35808) (Cons!35807 (h!37270 (_ BitVec 64)) (t!50497 List!35811)) )
))
(declare-fun arrayNoDuplicates!0 (array!102284 (_ BitVec 32) List!35811) Bool)

(assert (=> b!1540215 (= res!1055728 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35808))))

(declare-fun b!1540216 () Bool)

(declare-fun res!1055726 () Bool)

(assert (=> b!1540216 (=> (not res!1055726) (not e!857265))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540216 (= res!1055726 (and (= (size!49901 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49901 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49901 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540217 () Bool)

(assert (=> b!1540217 (= e!857265 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13371 0))(
  ( (MissingZero!13371 (index!55879 (_ BitVec 32))) (Found!13371 (index!55880 (_ BitVec 32))) (Intermediate!13371 (undefined!14183 Bool) (index!55881 (_ BitVec 32)) (x!137823 (_ BitVec 32))) (Undefined!13371) (MissingVacant!13371 (index!55882 (_ BitVec 32))) )
))
(declare-fun lt!665694 () SeekEntryResult!13371)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102284 (_ BitVec 32)) SeekEntryResult!13371)

(assert (=> b!1540217 (= lt!665694 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49350 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540219 () Bool)

(declare-fun res!1055730 () Bool)

(assert (=> b!1540219 (=> (not res!1055730) (not e!857265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102284 (_ BitVec 32)) Bool)

(assert (=> b!1540219 (= res!1055730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540220 () Bool)

(declare-fun res!1055727 () Bool)

(assert (=> b!1540220 (=> (not res!1055727) (not e!857265))))

(assert (=> b!1540220 (= res!1055727 (validKeyInArray!0 (select (arr!49350 a!2792) i!951)))))

(declare-fun b!1540218 () Bool)

(declare-fun res!1055725 () Bool)

(assert (=> b!1540218 (=> (not res!1055725) (not e!857265))))

(assert (=> b!1540218 (= res!1055725 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49901 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49901 a!2792)) (= (select (arr!49350 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055724 () Bool)

(assert (=> start!131482 (=> (not res!1055724) (not e!857265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131482 (= res!1055724 (validMask!0 mask!2480))))

(assert (=> start!131482 e!857265))

(assert (=> start!131482 true))

(declare-fun array_inv!38631 (array!102284) Bool)

(assert (=> start!131482 (array_inv!38631 a!2792)))

(assert (= (and start!131482 res!1055724) b!1540216))

(assert (= (and b!1540216 res!1055726) b!1540220))

(assert (= (and b!1540220 res!1055727) b!1540214))

(assert (= (and b!1540214 res!1055729) b!1540219))

(assert (= (and b!1540219 res!1055730) b!1540215))

(assert (= (and b!1540215 res!1055728) b!1540218))

(assert (= (and b!1540218 res!1055725) b!1540217))

(declare-fun m!1422527 () Bool)

(assert (=> b!1540219 m!1422527))

(declare-fun m!1422529 () Bool)

(assert (=> b!1540220 m!1422529))

(assert (=> b!1540220 m!1422529))

(declare-fun m!1422531 () Bool)

(assert (=> b!1540220 m!1422531))

(declare-fun m!1422533 () Bool)

(assert (=> b!1540218 m!1422533))

(declare-fun m!1422535 () Bool)

(assert (=> start!131482 m!1422535))

(declare-fun m!1422537 () Bool)

(assert (=> start!131482 m!1422537))

(declare-fun m!1422539 () Bool)

(assert (=> b!1540217 m!1422539))

(assert (=> b!1540217 m!1422539))

(declare-fun m!1422541 () Bool)

(assert (=> b!1540217 m!1422541))

(declare-fun m!1422543 () Bool)

(assert (=> b!1540215 m!1422543))

(assert (=> b!1540214 m!1422539))

(assert (=> b!1540214 m!1422539))

(declare-fun m!1422545 () Bool)

(assert (=> b!1540214 m!1422545))

(push 1)

(assert (not b!1540214))

(assert (not b!1540219))

(assert (not b!1540220))

(assert (not start!131482))

(assert (not b!1540215))

(assert (not b!1540217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

