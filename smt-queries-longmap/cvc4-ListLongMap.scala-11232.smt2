; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131028 () Bool)

(assert start!131028)

(declare-fun b!1537396 () Bool)

(declare-fun e!855618 () Bool)

(declare-fun e!855622 () Bool)

(assert (=> b!1537396 (= e!855618 e!855622)))

(declare-fun res!1054489 () Bool)

(assert (=> b!1537396 (=> (not res!1054489) (not e!855622))))

(declare-datatypes ((SeekEntryResult!13411 0))(
  ( (MissingZero!13411 (index!56039 (_ BitVec 32))) (Found!13411 (index!56040 (_ BitVec 32))) (Intermediate!13411 (undefined!14223 Bool) (index!56041 (_ BitVec 32)) (x!137765 (_ BitVec 32))) (Undefined!13411) (MissingVacant!13411 (index!56042 (_ BitVec 32))) )
))
(declare-fun lt!664700 () SeekEntryResult!13411)

(declare-fun lt!664699 () SeekEntryResult!13411)

(assert (=> b!1537396 (= res!1054489 (= lt!664700 lt!664699))))

(declare-fun lt!664701 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102126 0))(
  ( (array!102127 (arr!49279 (Array (_ BitVec 32) (_ BitVec 64))) (size!49829 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102126)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102126 (_ BitVec 32)) SeekEntryResult!13411)

(assert (=> b!1537396 (= lt!664700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664701 vacantIndex!5 (select (arr!49279 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537397 () Bool)

(declare-fun res!1054487 () Bool)

(declare-fun e!855619 () Bool)

(assert (=> b!1537397 (=> (not res!1054487) (not e!855619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537397 (= res!1054487 (validKeyInArray!0 (select (arr!49279 a!2792) j!64)))))

(declare-fun res!1054482 () Bool)

(assert (=> start!131028 (=> (not res!1054482) (not e!855619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131028 (= res!1054482 (validMask!0 mask!2480))))

(assert (=> start!131028 e!855619))

(assert (=> start!131028 true))

(declare-fun array_inv!38307 (array!102126) Bool)

(assert (=> start!131028 (array_inv!38307 a!2792)))

(declare-fun b!1537398 () Bool)

(assert (=> b!1537398 (= e!855622 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537398 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664701 vacantIndex!5 (select (store (arr!49279 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102127 (store (arr!49279 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49829 a!2792)) mask!2480) lt!664700)))

(declare-datatypes ((Unit!51394 0))(
  ( (Unit!51395) )
))
(declare-fun lt!664702 () Unit!51394)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51394)

(assert (=> b!1537398 (= lt!664702 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664701 vacantIndex!5 mask!2480))))

(declare-fun b!1537399 () Bool)

(declare-fun e!855621 () Bool)

(assert (=> b!1537399 (= e!855619 e!855621)))

(declare-fun res!1054485 () Bool)

(assert (=> b!1537399 (=> (not res!1054485) (not e!855621))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537399 (= res!1054485 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49279 a!2792) j!64) a!2792 mask!2480) lt!664699))))

(assert (=> b!1537399 (= lt!664699 (Found!13411 j!64))))

(declare-fun b!1537400 () Bool)

(declare-fun res!1054488 () Bool)

(assert (=> b!1537400 (=> (not res!1054488) (not e!855619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102126 (_ BitVec 32)) Bool)

(assert (=> b!1537400 (= res!1054488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537401 () Bool)

(declare-fun res!1054492 () Bool)

(assert (=> b!1537401 (=> (not res!1054492) (not e!855619))))

(assert (=> b!1537401 (= res!1054492 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49829 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49829 a!2792)) (= (select (arr!49279 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537402 () Bool)

(assert (=> b!1537402 (= e!855621 e!855618)))

(declare-fun res!1054484 () Bool)

(assert (=> b!1537402 (=> (not res!1054484) (not e!855618))))

(assert (=> b!1537402 (= res!1054484 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664701 #b00000000000000000000000000000000) (bvslt lt!664701 (size!49829 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537402 (= lt!664701 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537403 () Bool)

(declare-fun res!1054491 () Bool)

(assert (=> b!1537403 (=> (not res!1054491) (not e!855619))))

(assert (=> b!1537403 (= res!1054491 (and (= (size!49829 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49829 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49829 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537404 () Bool)

(declare-fun res!1054490 () Bool)

(assert (=> b!1537404 (=> (not res!1054490) (not e!855619))))

(declare-datatypes ((List!35753 0))(
  ( (Nil!35750) (Cons!35749 (h!37194 (_ BitVec 64)) (t!50447 List!35753)) )
))
(declare-fun arrayNoDuplicates!0 (array!102126 (_ BitVec 32) List!35753) Bool)

(assert (=> b!1537404 (= res!1054490 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35750))))

(declare-fun b!1537405 () Bool)

(declare-fun res!1054486 () Bool)

(assert (=> b!1537405 (=> (not res!1054486) (not e!855619))))

(assert (=> b!1537405 (= res!1054486 (validKeyInArray!0 (select (arr!49279 a!2792) i!951)))))

(declare-fun b!1537406 () Bool)

(declare-fun res!1054483 () Bool)

(assert (=> b!1537406 (=> (not res!1054483) (not e!855621))))

(assert (=> b!1537406 (= res!1054483 (not (= (select (arr!49279 a!2792) index!463) (select (arr!49279 a!2792) j!64))))))

(assert (= (and start!131028 res!1054482) b!1537403))

(assert (= (and b!1537403 res!1054491) b!1537405))

(assert (= (and b!1537405 res!1054486) b!1537397))

(assert (= (and b!1537397 res!1054487) b!1537400))

(assert (= (and b!1537400 res!1054488) b!1537404))

(assert (= (and b!1537404 res!1054490) b!1537401))

(assert (= (and b!1537401 res!1054492) b!1537399))

(assert (= (and b!1537399 res!1054485) b!1537406))

(assert (= (and b!1537406 res!1054483) b!1537402))

(assert (= (and b!1537402 res!1054484) b!1537396))

(assert (= (and b!1537396 res!1054489) b!1537398))

(declare-fun m!1419899 () Bool)

(assert (=> b!1537396 m!1419899))

(assert (=> b!1537396 m!1419899))

(declare-fun m!1419901 () Bool)

(assert (=> b!1537396 m!1419901))

(declare-fun m!1419903 () Bool)

(assert (=> b!1537401 m!1419903))

(declare-fun m!1419905 () Bool)

(assert (=> b!1537400 m!1419905))

(assert (=> b!1537397 m!1419899))

(assert (=> b!1537397 m!1419899))

(declare-fun m!1419907 () Bool)

(assert (=> b!1537397 m!1419907))

(declare-fun m!1419909 () Bool)

(assert (=> b!1537402 m!1419909))

(declare-fun m!1419911 () Bool)

(assert (=> b!1537405 m!1419911))

(assert (=> b!1537405 m!1419911))

(declare-fun m!1419913 () Bool)

(assert (=> b!1537405 m!1419913))

(declare-fun m!1419915 () Bool)

(assert (=> start!131028 m!1419915))

(declare-fun m!1419917 () Bool)

(assert (=> start!131028 m!1419917))

(declare-fun m!1419919 () Bool)

(assert (=> b!1537406 m!1419919))

(assert (=> b!1537406 m!1419899))

(declare-fun m!1419921 () Bool)

(assert (=> b!1537398 m!1419921))

(declare-fun m!1419923 () Bool)

(assert (=> b!1537398 m!1419923))

(assert (=> b!1537398 m!1419923))

(declare-fun m!1419925 () Bool)

(assert (=> b!1537398 m!1419925))

(declare-fun m!1419927 () Bool)

(assert (=> b!1537398 m!1419927))

(assert (=> b!1537399 m!1419899))

(assert (=> b!1537399 m!1419899))

(declare-fun m!1419929 () Bool)

(assert (=> b!1537399 m!1419929))

(declare-fun m!1419931 () Bool)

(assert (=> b!1537404 m!1419931))

(push 1)

(assert (not b!1537405))

(assert (not b!1537398))

(assert (not b!1537399))

