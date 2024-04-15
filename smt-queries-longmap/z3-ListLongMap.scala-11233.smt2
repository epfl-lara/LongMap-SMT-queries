; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130980 () Bool)

(assert start!130980)

(declare-fun b!1537117 () Bool)

(declare-fun e!855437 () Bool)

(declare-fun e!855435 () Bool)

(assert (=> b!1537117 (= e!855437 e!855435)))

(declare-fun res!1054387 () Bool)

(assert (=> b!1537117 (=> (not res!1054387) (not e!855435))))

(declare-datatypes ((SeekEntryResult!13412 0))(
  ( (MissingZero!13412 (index!56043 (_ BitVec 32))) (Found!13412 (index!56044 (_ BitVec 32))) (Intermediate!13412 (undefined!14224 Bool) (index!56045 (_ BitVec 32)) (x!137769 (_ BitVec 32))) (Undefined!13412) (MissingVacant!13412 (index!56046 (_ BitVec 32))) )
))
(declare-fun lt!664425 () SeekEntryResult!13412)

(declare-fun lt!664428 () SeekEntryResult!13412)

(assert (=> b!1537117 (= res!1054387 (= lt!664425 lt!664428))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102076 0))(
  ( (array!102077 (arr!49255 (Array (_ BitVec 32) (_ BitVec 64))) (size!49807 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102076)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664426 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102076 (_ BitVec 32)) SeekEntryResult!13412)

(assert (=> b!1537117 (= lt!664425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664426 vacantIndex!5 (select (arr!49255 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537118 () Bool)

(declare-fun res!1054389 () Bool)

(declare-fun e!855439 () Bool)

(assert (=> b!1537118 (=> (not res!1054389) (not e!855439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537118 (= res!1054389 (validKeyInArray!0 (select (arr!49255 a!2792) j!64)))))

(declare-fun b!1537119 () Bool)

(declare-fun res!1054386 () Bool)

(assert (=> b!1537119 (=> (not res!1054386) (not e!855439))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537119 (= res!1054386 (and (= (size!49807 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49807 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49807 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537120 () Bool)

(declare-fun res!1054391 () Bool)

(assert (=> b!1537120 (=> (not res!1054391) (not e!855439))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537120 (= res!1054391 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49807 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49807 a!2792)) (= (select (arr!49255 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537121 () Bool)

(assert (=> b!1537121 (= e!855435 (not true))))

(assert (=> b!1537121 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664426 vacantIndex!5 (select (store (arr!49255 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102077 (store (arr!49255 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49807 a!2792)) mask!2480) lt!664425)))

(declare-datatypes ((Unit!51231 0))(
  ( (Unit!51232) )
))
(declare-fun lt!664427 () Unit!51231)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51231)

(assert (=> b!1537121 (= lt!664427 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664426 vacantIndex!5 mask!2480))))

(declare-fun b!1537122 () Bool)

(declare-fun res!1054393 () Bool)

(assert (=> b!1537122 (=> (not res!1054393) (not e!855439))))

(assert (=> b!1537122 (= res!1054393 (validKeyInArray!0 (select (arr!49255 a!2792) i!951)))))

(declare-fun b!1537123 () Bool)

(declare-fun res!1054396 () Bool)

(declare-fun e!855438 () Bool)

(assert (=> b!1537123 (=> (not res!1054396) (not e!855438))))

(assert (=> b!1537123 (= res!1054396 (not (= (select (arr!49255 a!2792) index!463) (select (arr!49255 a!2792) j!64))))))

(declare-fun b!1537124 () Bool)

(declare-fun res!1054388 () Bool)

(assert (=> b!1537124 (=> (not res!1054388) (not e!855439))))

(declare-datatypes ((List!35807 0))(
  ( (Nil!35804) (Cons!35803 (h!37249 (_ BitVec 64)) (t!50493 List!35807)) )
))
(declare-fun arrayNoDuplicates!0 (array!102076 (_ BitVec 32) List!35807) Bool)

(assert (=> b!1537124 (= res!1054388 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35804))))

(declare-fun b!1537116 () Bool)

(assert (=> b!1537116 (= e!855439 e!855438)))

(declare-fun res!1054394 () Bool)

(assert (=> b!1537116 (=> (not res!1054394) (not e!855438))))

(assert (=> b!1537116 (= res!1054394 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49255 a!2792) j!64) a!2792 mask!2480) lt!664428))))

(assert (=> b!1537116 (= lt!664428 (Found!13412 j!64))))

(declare-fun res!1054395 () Bool)

(assert (=> start!130980 (=> (not res!1054395) (not e!855439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130980 (= res!1054395 (validMask!0 mask!2480))))

(assert (=> start!130980 e!855439))

(assert (=> start!130980 true))

(declare-fun array_inv!38488 (array!102076) Bool)

(assert (=> start!130980 (array_inv!38488 a!2792)))

(declare-fun b!1537125 () Bool)

(declare-fun res!1054390 () Bool)

(assert (=> b!1537125 (=> (not res!1054390) (not e!855439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102076 (_ BitVec 32)) Bool)

(assert (=> b!1537125 (= res!1054390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537126 () Bool)

(assert (=> b!1537126 (= e!855438 e!855437)))

(declare-fun res!1054392 () Bool)

(assert (=> b!1537126 (=> (not res!1054392) (not e!855437))))

(assert (=> b!1537126 (= res!1054392 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664426 #b00000000000000000000000000000000) (bvslt lt!664426 (size!49807 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537126 (= lt!664426 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130980 res!1054395) b!1537119))

(assert (= (and b!1537119 res!1054386) b!1537122))

(assert (= (and b!1537122 res!1054393) b!1537118))

(assert (= (and b!1537118 res!1054389) b!1537125))

(assert (= (and b!1537125 res!1054390) b!1537124))

(assert (= (and b!1537124 res!1054388) b!1537120))

(assert (= (and b!1537120 res!1054391) b!1537116))

(assert (= (and b!1537116 res!1054394) b!1537123))

(assert (= (and b!1537123 res!1054396) b!1537126))

(assert (= (and b!1537126 res!1054392) b!1537117))

(assert (= (and b!1537117 res!1054387) b!1537121))

(declare-fun m!1419041 () Bool)

(assert (=> b!1537125 m!1419041))

(declare-fun m!1419043 () Bool)

(assert (=> start!130980 m!1419043))

(declare-fun m!1419045 () Bool)

(assert (=> start!130980 m!1419045))

(declare-fun m!1419047 () Bool)

(assert (=> b!1537116 m!1419047))

(assert (=> b!1537116 m!1419047))

(declare-fun m!1419049 () Bool)

(assert (=> b!1537116 m!1419049))

(assert (=> b!1537117 m!1419047))

(assert (=> b!1537117 m!1419047))

(declare-fun m!1419051 () Bool)

(assert (=> b!1537117 m!1419051))

(declare-fun m!1419053 () Bool)

(assert (=> b!1537126 m!1419053))

(declare-fun m!1419055 () Bool)

(assert (=> b!1537120 m!1419055))

(declare-fun m!1419057 () Bool)

(assert (=> b!1537122 m!1419057))

(assert (=> b!1537122 m!1419057))

(declare-fun m!1419059 () Bool)

(assert (=> b!1537122 m!1419059))

(declare-fun m!1419061 () Bool)

(assert (=> b!1537124 m!1419061))

(declare-fun m!1419063 () Bool)

(assert (=> b!1537123 m!1419063))

(assert (=> b!1537123 m!1419047))

(assert (=> b!1537118 m!1419047))

(assert (=> b!1537118 m!1419047))

(declare-fun m!1419065 () Bool)

(assert (=> b!1537118 m!1419065))

(declare-fun m!1419067 () Bool)

(assert (=> b!1537121 m!1419067))

(declare-fun m!1419069 () Bool)

(assert (=> b!1537121 m!1419069))

(assert (=> b!1537121 m!1419069))

(declare-fun m!1419071 () Bool)

(assert (=> b!1537121 m!1419071))

(declare-fun m!1419073 () Bool)

(assert (=> b!1537121 m!1419073))

(check-sat (not start!130980) (not b!1537126) (not b!1537116) (not b!1537122) (not b!1537121) (not b!1537124) (not b!1537125) (not b!1537117) (not b!1537118))
(check-sat)
