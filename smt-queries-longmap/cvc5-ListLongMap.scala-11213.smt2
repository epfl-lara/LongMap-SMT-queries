; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130910 () Bool)

(assert start!130910)

(declare-fun b!1535483 () Bool)

(declare-fun res!1052570 () Bool)

(declare-fun e!854810 () Bool)

(assert (=> b!1535483 (=> (not res!1052570) (not e!854810))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102008 0))(
  ( (array!102009 (arr!49220 (Array (_ BitVec 32) (_ BitVec 64))) (size!49770 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102008)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535483 (= res!1052570 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49770 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49770 a!2792)) (= (select (arr!49220 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535484 () Bool)

(declare-fun res!1052574 () Bool)

(assert (=> b!1535484 (=> (not res!1052574) (not e!854810))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535484 (= res!1052574 (not (= (select (arr!49220 a!2792) index!463) (select (arr!49220 a!2792) j!64))))))

(declare-fun b!1535485 () Bool)

(declare-fun res!1052571 () Bool)

(assert (=> b!1535485 (=> (not res!1052571) (not e!854810))))

(declare-datatypes ((List!35694 0))(
  ( (Nil!35691) (Cons!35690 (h!37135 (_ BitVec 64)) (t!50388 List!35694)) )
))
(declare-fun arrayNoDuplicates!0 (array!102008 (_ BitVec 32) List!35694) Bool)

(assert (=> b!1535485 (= res!1052571 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35691))))

(declare-fun b!1535486 () Bool)

(declare-fun res!1052576 () Bool)

(assert (=> b!1535486 (=> (not res!1052576) (not e!854810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535486 (= res!1052576 (validKeyInArray!0 (select (arr!49220 a!2792) j!64)))))

(declare-fun b!1535487 () Bool)

(declare-fun res!1052578 () Bool)

(assert (=> b!1535487 (=> (not res!1052578) (not e!854810))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535487 (= res!1052578 (and (= (size!49770 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49770 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49770 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535488 () Bool)

(declare-fun e!854811 () Bool)

(assert (=> b!1535488 (= e!854810 e!854811)))

(declare-fun res!1052577 () Bool)

(assert (=> b!1535488 (=> (not res!1052577) (not e!854811))))

(declare-fun lt!664068 () (_ BitVec 32))

(assert (=> b!1535488 (= res!1052577 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664068 #b00000000000000000000000000000000) (bvslt lt!664068 (size!49770 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535488 (= lt!664068 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535489 () Bool)

(declare-fun res!1052575 () Bool)

(assert (=> b!1535489 (=> (not res!1052575) (not e!854810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102008 (_ BitVec 32)) Bool)

(assert (=> b!1535489 (= res!1052575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535490 () Bool)

(declare-fun res!1052572 () Bool)

(assert (=> b!1535490 (=> (not res!1052572) (not e!854810))))

(declare-datatypes ((SeekEntryResult!13352 0))(
  ( (MissingZero!13352 (index!55803 (_ BitVec 32))) (Found!13352 (index!55804 (_ BitVec 32))) (Intermediate!13352 (undefined!14164 Bool) (index!55805 (_ BitVec 32)) (x!137554 (_ BitVec 32))) (Undefined!13352) (MissingVacant!13352 (index!55806 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102008 (_ BitVec 32)) SeekEntryResult!13352)

(assert (=> b!1535490 (= res!1052572 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49220 a!2792) j!64) a!2792 mask!2480) (Found!13352 j!64)))))

(declare-fun res!1052573 () Bool)

(assert (=> start!130910 (=> (not res!1052573) (not e!854810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130910 (= res!1052573 (validMask!0 mask!2480))))

(assert (=> start!130910 e!854810))

(assert (=> start!130910 true))

(declare-fun array_inv!38248 (array!102008) Bool)

(assert (=> start!130910 (array_inv!38248 a!2792)))

(declare-fun b!1535491 () Bool)

(assert (=> b!1535491 (= e!854811 false)))

(declare-fun lt!664069 () SeekEntryResult!13352)

(assert (=> b!1535491 (= lt!664069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664068 vacantIndex!5 (select (arr!49220 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535492 () Bool)

(declare-fun res!1052569 () Bool)

(assert (=> b!1535492 (=> (not res!1052569) (not e!854810))))

(assert (=> b!1535492 (= res!1052569 (validKeyInArray!0 (select (arr!49220 a!2792) i!951)))))

(assert (= (and start!130910 res!1052573) b!1535487))

(assert (= (and b!1535487 res!1052578) b!1535492))

(assert (= (and b!1535492 res!1052569) b!1535486))

(assert (= (and b!1535486 res!1052576) b!1535489))

(assert (= (and b!1535489 res!1052575) b!1535485))

(assert (= (and b!1535485 res!1052571) b!1535483))

(assert (= (and b!1535483 res!1052570) b!1535490))

(assert (= (and b!1535490 res!1052572) b!1535484))

(assert (= (and b!1535484 res!1052574) b!1535488))

(assert (= (and b!1535488 res!1052577) b!1535491))

(declare-fun m!1417995 () Bool)

(assert (=> b!1535488 m!1417995))

(declare-fun m!1417997 () Bool)

(assert (=> b!1535484 m!1417997))

(declare-fun m!1417999 () Bool)

(assert (=> b!1535484 m!1417999))

(declare-fun m!1418001 () Bool)

(assert (=> b!1535492 m!1418001))

(assert (=> b!1535492 m!1418001))

(declare-fun m!1418003 () Bool)

(assert (=> b!1535492 m!1418003))

(declare-fun m!1418005 () Bool)

(assert (=> b!1535485 m!1418005))

(assert (=> b!1535486 m!1417999))

(assert (=> b!1535486 m!1417999))

(declare-fun m!1418007 () Bool)

(assert (=> b!1535486 m!1418007))

(assert (=> b!1535490 m!1417999))

(assert (=> b!1535490 m!1417999))

(declare-fun m!1418009 () Bool)

(assert (=> b!1535490 m!1418009))

(declare-fun m!1418011 () Bool)

(assert (=> b!1535483 m!1418011))

(declare-fun m!1418013 () Bool)

(assert (=> start!130910 m!1418013))

(declare-fun m!1418015 () Bool)

(assert (=> start!130910 m!1418015))

(assert (=> b!1535491 m!1417999))

(assert (=> b!1535491 m!1417999))

(declare-fun m!1418017 () Bool)

(assert (=> b!1535491 m!1418017))

(declare-fun m!1418019 () Bool)

(assert (=> b!1535489 m!1418019))

(push 1)

