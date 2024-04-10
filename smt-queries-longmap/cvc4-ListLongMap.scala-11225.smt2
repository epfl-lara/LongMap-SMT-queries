; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130986 () Bool)

(assert start!130986)

(declare-fun b!1536702 () Bool)

(declare-fun res!1053796 () Bool)

(declare-fun e!855304 () Bool)

(assert (=> b!1536702 (=> (not res!1053796) (not e!855304))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102084 0))(
  ( (array!102085 (arr!49258 (Array (_ BitVec 32) (_ BitVec 64))) (size!49808 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102084)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536702 (= res!1053796 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49808 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49808 a!2792)) (= (select (arr!49258 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536703 () Bool)

(declare-fun res!1053788 () Bool)

(declare-fun e!855305 () Bool)

(assert (=> b!1536703 (=> (not res!1053788) (not e!855305))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536703 (= res!1053788 (not (= (select (arr!49258 a!2792) index!463) (select (arr!49258 a!2792) j!64))))))

(declare-fun b!1536704 () Bool)

(declare-fun res!1053795 () Bool)

(assert (=> b!1536704 (=> (not res!1053795) (not e!855304))))

(declare-datatypes ((List!35732 0))(
  ( (Nil!35729) (Cons!35728 (h!37173 (_ BitVec 64)) (t!50426 List!35732)) )
))
(declare-fun arrayNoDuplicates!0 (array!102084 (_ BitVec 32) List!35732) Bool)

(assert (=> b!1536704 (= res!1053795 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35729))))

(declare-fun res!1053794 () Bool)

(assert (=> start!130986 (=> (not res!1053794) (not e!855304))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130986 (= res!1053794 (validMask!0 mask!2480))))

(assert (=> start!130986 e!855304))

(assert (=> start!130986 true))

(declare-fun array_inv!38286 (array!102084) Bool)

(assert (=> start!130986 (array_inv!38286 a!2792)))

(declare-fun b!1536705 () Bool)

(declare-fun res!1053790 () Bool)

(assert (=> b!1536705 (=> (not res!1053790) (not e!855304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536705 (= res!1053790 (validKeyInArray!0 (select (arr!49258 a!2792) j!64)))))

(declare-fun b!1536706 () Bool)

(declare-fun e!855303 () Bool)

(assert (=> b!1536706 (= e!855305 e!855303)))

(declare-fun res!1053799 () Bool)

(assert (=> b!1536706 (=> (not res!1053799) (not e!855303))))

(declare-fun lt!664448 () (_ BitVec 32))

(assert (=> b!1536706 (= res!1053799 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664448 #b00000000000000000000000000000000) (bvslt lt!664448 (size!49808 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536706 (= lt!664448 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536707 () Bool)

(declare-fun e!855306 () Bool)

(assert (=> b!1536707 (= e!855303 e!855306)))

(declare-fun res!1053797 () Bool)

(assert (=> b!1536707 (=> (not res!1053797) (not e!855306))))

(declare-datatypes ((SeekEntryResult!13390 0))(
  ( (MissingZero!13390 (index!55955 (_ BitVec 32))) (Found!13390 (index!55956 (_ BitVec 32))) (Intermediate!13390 (undefined!14202 Bool) (index!55957 (_ BitVec 32)) (x!137688 (_ BitVec 32))) (Undefined!13390) (MissingVacant!13390 (index!55958 (_ BitVec 32))) )
))
(declare-fun lt!664450 () SeekEntryResult!13390)

(declare-fun lt!664447 () SeekEntryResult!13390)

(assert (=> b!1536707 (= res!1053797 (= lt!664450 lt!664447))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102084 (_ BitVec 32)) SeekEntryResult!13390)

(assert (=> b!1536707 (= lt!664450 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664448 vacantIndex!5 (select (arr!49258 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536708 () Bool)

(declare-fun res!1053792 () Bool)

(assert (=> b!1536708 (=> (not res!1053792) (not e!855304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102084 (_ BitVec 32)) Bool)

(assert (=> b!1536708 (= res!1053792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536709 () Bool)

(assert (=> b!1536709 (= e!855304 e!855305)))

(declare-fun res!1053789 () Bool)

(assert (=> b!1536709 (=> (not res!1053789) (not e!855305))))

(assert (=> b!1536709 (= res!1053789 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49258 a!2792) j!64) a!2792 mask!2480) lt!664447))))

(assert (=> b!1536709 (= lt!664447 (Found!13390 j!64))))

(declare-fun b!1536710 () Bool)

(declare-fun e!855302 () Bool)

(assert (=> b!1536710 (= e!855306 (not e!855302))))

(declare-fun res!1053791 () Bool)

(assert (=> b!1536710 (=> res!1053791 e!855302)))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536710 (= res!1053791 (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49258 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!664449 () (_ BitVec 64))

(assert (=> b!1536710 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664448 vacantIndex!5 lt!664449 (array!102085 (store (arr!49258 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49808 a!2792)) mask!2480) lt!664450)))

(assert (=> b!1536710 (= lt!664449 (select (store (arr!49258 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(declare-datatypes ((Unit!51352 0))(
  ( (Unit!51353) )
))
(declare-fun lt!664446 () Unit!51352)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51352)

(assert (=> b!1536710 (= lt!664446 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664448 vacantIndex!5 mask!2480))))

(declare-fun b!1536711 () Bool)

(assert (=> b!1536711 (= e!855302 (validKeyInArray!0 lt!664449))))

(declare-fun b!1536712 () Bool)

(declare-fun res!1053798 () Bool)

(assert (=> b!1536712 (=> (not res!1053798) (not e!855304))))

(assert (=> b!1536712 (= res!1053798 (validKeyInArray!0 (select (arr!49258 a!2792) i!951)))))

(declare-fun b!1536713 () Bool)

(declare-fun res!1053793 () Bool)

(assert (=> b!1536713 (=> (not res!1053793) (not e!855304))))

(assert (=> b!1536713 (= res!1053793 (and (= (size!49808 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49808 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49808 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130986 res!1053794) b!1536713))

(assert (= (and b!1536713 res!1053793) b!1536712))

(assert (= (and b!1536712 res!1053798) b!1536705))

(assert (= (and b!1536705 res!1053790) b!1536708))

(assert (= (and b!1536708 res!1053792) b!1536704))

(assert (= (and b!1536704 res!1053795) b!1536702))

(assert (= (and b!1536702 res!1053796) b!1536709))

(assert (= (and b!1536709 res!1053789) b!1536703))

(assert (= (and b!1536703 res!1053788) b!1536706))

(assert (= (and b!1536706 res!1053799) b!1536707))

(assert (= (and b!1536707 res!1053797) b!1536710))

(assert (= (and b!1536710 (not res!1053791)) b!1536711))

(declare-fun m!1419181 () Bool)

(assert (=> b!1536703 m!1419181))

(declare-fun m!1419183 () Bool)

(assert (=> b!1536703 m!1419183))

(assert (=> b!1536705 m!1419183))

(assert (=> b!1536705 m!1419183))

(declare-fun m!1419185 () Bool)

(assert (=> b!1536705 m!1419185))

(declare-fun m!1419187 () Bool)

(assert (=> b!1536704 m!1419187))

(declare-fun m!1419189 () Bool)

(assert (=> b!1536712 m!1419189))

(assert (=> b!1536712 m!1419189))

(declare-fun m!1419191 () Bool)

(assert (=> b!1536712 m!1419191))

(declare-fun m!1419193 () Bool)

(assert (=> b!1536706 m!1419193))

(declare-fun m!1419195 () Bool)

(assert (=> b!1536708 m!1419195))

(declare-fun m!1419197 () Bool)

(assert (=> b!1536711 m!1419197))

(assert (=> b!1536707 m!1419183))

(assert (=> b!1536707 m!1419183))

(declare-fun m!1419199 () Bool)

(assert (=> b!1536707 m!1419199))

(declare-fun m!1419201 () Bool)

(assert (=> b!1536710 m!1419201))

(declare-fun m!1419203 () Bool)

(assert (=> b!1536710 m!1419203))

(declare-fun m!1419205 () Bool)

(assert (=> b!1536710 m!1419205))

(declare-fun m!1419207 () Bool)

(assert (=> b!1536710 m!1419207))

(declare-fun m!1419209 () Bool)

(assert (=> b!1536710 m!1419209))

(assert (=> b!1536709 m!1419183))

(assert (=> b!1536709 m!1419183))

(declare-fun m!1419211 () Bool)

(assert (=> b!1536709 m!1419211))

(declare-fun m!1419213 () Bool)

(assert (=> b!1536702 m!1419213))

(declare-fun m!1419215 () Bool)

(assert (=> start!130986 m!1419215))

(declare-fun m!1419217 () Bool)

(assert (=> start!130986 m!1419217))

(push 1)

