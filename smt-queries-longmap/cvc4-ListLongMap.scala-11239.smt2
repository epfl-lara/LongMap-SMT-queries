; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131070 () Bool)

(assert start!131070)

(declare-fun res!1054932 () Bool)

(declare-fun e!855775 () Bool)

(assert (=> start!131070 (=> (not res!1054932) (not e!855775))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131070 (= res!1054932 (validMask!0 mask!2480))))

(assert (=> start!131070 e!855775))

(assert (=> start!131070 true))

(declare-datatypes ((array!102168 0))(
  ( (array!102169 (arr!49300 (Array (_ BitVec 32) (_ BitVec 64))) (size!49850 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102168)

(declare-fun array_inv!38328 (array!102168) Bool)

(assert (=> start!131070 (array_inv!38328 a!2792)))

(declare-fun b!1537841 () Bool)

(declare-fun res!1054927 () Bool)

(assert (=> b!1537841 (=> (not res!1054927) (not e!855775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102168 (_ BitVec 32)) Bool)

(assert (=> b!1537841 (= res!1054927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537842 () Bool)

(assert (=> b!1537842 (= e!855775 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13426 0))(
  ( (MissingZero!13426 (index!56099 (_ BitVec 32))) (Found!13426 (index!56100 (_ BitVec 32))) (Intermediate!13426 (undefined!14238 Bool) (index!56101 (_ BitVec 32)) (x!137836 (_ BitVec 32))) (Undefined!13426) (MissingVacant!13426 (index!56102 (_ BitVec 32))) )
))
(declare-fun lt!664792 () SeekEntryResult!13426)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102168 (_ BitVec 32)) SeekEntryResult!13426)

(assert (=> b!1537842 (= lt!664792 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49300 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537843 () Bool)

(declare-fun res!1054929 () Bool)

(assert (=> b!1537843 (=> (not res!1054929) (not e!855775))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537843 (= res!1054929 (and (= (size!49850 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49850 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49850 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537844 () Bool)

(declare-fun res!1054930 () Bool)

(assert (=> b!1537844 (=> (not res!1054930) (not e!855775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537844 (= res!1054930 (validKeyInArray!0 (select (arr!49300 a!2792) i!951)))))

(declare-fun b!1537845 () Bool)

(declare-fun res!1054928 () Bool)

(assert (=> b!1537845 (=> (not res!1054928) (not e!855775))))

(assert (=> b!1537845 (= res!1054928 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49850 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49850 a!2792)) (= (select (arr!49300 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537846 () Bool)

(declare-fun res!1054931 () Bool)

(assert (=> b!1537846 (=> (not res!1054931) (not e!855775))))

(assert (=> b!1537846 (= res!1054931 (validKeyInArray!0 (select (arr!49300 a!2792) j!64)))))

(declare-fun b!1537847 () Bool)

(declare-fun res!1054933 () Bool)

(assert (=> b!1537847 (=> (not res!1054933) (not e!855775))))

(declare-datatypes ((List!35774 0))(
  ( (Nil!35771) (Cons!35770 (h!37215 (_ BitVec 64)) (t!50468 List!35774)) )
))
(declare-fun arrayNoDuplicates!0 (array!102168 (_ BitVec 32) List!35774) Bool)

(assert (=> b!1537847 (= res!1054933 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35771))))

(assert (= (and start!131070 res!1054932) b!1537843))

(assert (= (and b!1537843 res!1054929) b!1537844))

(assert (= (and b!1537844 res!1054930) b!1537846))

(assert (= (and b!1537846 res!1054931) b!1537841))

(assert (= (and b!1537841 res!1054927) b!1537847))

(assert (= (and b!1537847 res!1054933) b!1537845))

(assert (= (and b!1537845 res!1054928) b!1537842))

(declare-fun m!1420351 () Bool)

(assert (=> b!1537842 m!1420351))

(assert (=> b!1537842 m!1420351))

(declare-fun m!1420353 () Bool)

(assert (=> b!1537842 m!1420353))

(declare-fun m!1420355 () Bool)

(assert (=> start!131070 m!1420355))

(declare-fun m!1420357 () Bool)

(assert (=> start!131070 m!1420357))

(declare-fun m!1420359 () Bool)

(assert (=> b!1537844 m!1420359))

(assert (=> b!1537844 m!1420359))

(declare-fun m!1420361 () Bool)

(assert (=> b!1537844 m!1420361))

(assert (=> b!1537846 m!1420351))

(assert (=> b!1537846 m!1420351))

(declare-fun m!1420363 () Bool)

(assert (=> b!1537846 m!1420363))

(declare-fun m!1420365 () Bool)

(assert (=> b!1537847 m!1420365))

(declare-fun m!1420367 () Bool)

(assert (=> b!1537845 m!1420367))

(declare-fun m!1420369 () Bool)

(assert (=> b!1537841 m!1420369))

(push 1)

(assert (not start!131070))

(assert (not b!1537844))

(assert (not b!1537846))

(assert (not b!1537847))

(assert (not b!1537841))

(assert (not b!1537842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

