; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130984 () Bool)

(assert start!130984)

(declare-fun b!1536666 () Bool)

(declare-fun e!855287 () Bool)

(declare-fun e!855289 () Bool)

(assert (=> b!1536666 (= e!855287 e!855289)))

(declare-fun res!1053761 () Bool)

(assert (=> b!1536666 (=> (not res!1053761) (not e!855289))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102082 0))(
  ( (array!102083 (arr!49257 (Array (_ BitVec 32) (_ BitVec 64))) (size!49807 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102082)

(declare-fun lt!664431 () (_ BitVec 32))

(assert (=> b!1536666 (= res!1053761 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664431 #b00000000000000000000000000000000) (bvslt lt!664431 (size!49807 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536666 (= lt!664431 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536667 () Bool)

(declare-fun res!1053753 () Bool)

(declare-fun e!855288 () Bool)

(assert (=> b!1536667 (=> (not res!1053753) (not e!855288))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536667 (= res!1053753 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49807 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49807 a!2792)) (= (select (arr!49257 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536668 () Bool)

(declare-fun e!855284 () Bool)

(assert (=> b!1536668 (= e!855289 e!855284)))

(declare-fun res!1053759 () Bool)

(assert (=> b!1536668 (=> (not res!1053759) (not e!855284))))

(declare-datatypes ((SeekEntryResult!13389 0))(
  ( (MissingZero!13389 (index!55951 (_ BitVec 32))) (Found!13389 (index!55952 (_ BitVec 32))) (Intermediate!13389 (undefined!14201 Bool) (index!55953 (_ BitVec 32)) (x!137687 (_ BitVec 32))) (Undefined!13389) (MissingVacant!13389 (index!55954 (_ BitVec 32))) )
))
(declare-fun lt!664435 () SeekEntryResult!13389)

(declare-fun lt!664434 () SeekEntryResult!13389)

(assert (=> b!1536668 (= res!1053759 (= lt!664435 lt!664434))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102082 (_ BitVec 32)) SeekEntryResult!13389)

(assert (=> b!1536668 (= lt!664435 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664431 vacantIndex!5 (select (arr!49257 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536669 () Bool)

(declare-fun res!1053752 () Bool)

(assert (=> b!1536669 (=> (not res!1053752) (not e!855288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102082 (_ BitVec 32)) Bool)

(assert (=> b!1536669 (= res!1053752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536670 () Bool)

(declare-fun res!1053758 () Bool)

(assert (=> b!1536670 (=> (not res!1053758) (not e!855288))))

(declare-datatypes ((List!35731 0))(
  ( (Nil!35728) (Cons!35727 (h!37172 (_ BitVec 64)) (t!50425 List!35731)) )
))
(declare-fun arrayNoDuplicates!0 (array!102082 (_ BitVec 32) List!35731) Bool)

(assert (=> b!1536670 (= res!1053758 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35728))))

(declare-fun res!1053755 () Bool)

(assert (=> start!130984 (=> (not res!1053755) (not e!855288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130984 (= res!1053755 (validMask!0 mask!2480))))

(assert (=> start!130984 e!855288))

(assert (=> start!130984 true))

(declare-fun array_inv!38285 (array!102082) Bool)

(assert (=> start!130984 (array_inv!38285 a!2792)))

(declare-fun b!1536671 () Bool)

(declare-fun res!1053763 () Bool)

(assert (=> b!1536671 (=> (not res!1053763) (not e!855288))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536671 (= res!1053763 (and (= (size!49807 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49807 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49807 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536672 () Bool)

(declare-fun res!1053762 () Bool)

(assert (=> b!1536672 (=> (not res!1053762) (not e!855288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536672 (= res!1053762 (validKeyInArray!0 (select (arr!49257 a!2792) j!64)))))

(declare-fun b!1536673 () Bool)

(assert (=> b!1536673 (= e!855288 e!855287)))

(declare-fun res!1053760 () Bool)

(assert (=> b!1536673 (=> (not res!1053760) (not e!855287))))

(assert (=> b!1536673 (= res!1053760 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49257 a!2792) j!64) a!2792 mask!2480) lt!664434))))

(assert (=> b!1536673 (= lt!664434 (Found!13389 j!64))))

(declare-fun b!1536674 () Bool)

(declare-fun e!855286 () Bool)

(assert (=> b!1536674 (= e!855284 (not e!855286))))

(declare-fun res!1053756 () Bool)

(assert (=> b!1536674 (=> res!1053756 e!855286)))

(assert (=> b!1536674 (= res!1053756 (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49257 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!664433 () (_ BitVec 64))

(assert (=> b!1536674 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664431 vacantIndex!5 lt!664433 (array!102083 (store (arr!49257 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49807 a!2792)) mask!2480) lt!664435)))

(assert (=> b!1536674 (= lt!664433 (select (store (arr!49257 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(declare-datatypes ((Unit!51350 0))(
  ( (Unit!51351) )
))
(declare-fun lt!664432 () Unit!51350)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51350)

(assert (=> b!1536674 (= lt!664432 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664431 vacantIndex!5 mask!2480))))

(declare-fun b!1536675 () Bool)

(declare-fun res!1053754 () Bool)

(assert (=> b!1536675 (=> (not res!1053754) (not e!855287))))

(assert (=> b!1536675 (= res!1053754 (not (= (select (arr!49257 a!2792) index!463) (select (arr!49257 a!2792) j!64))))))

(declare-fun b!1536676 () Bool)

(assert (=> b!1536676 (= e!855286 (validKeyInArray!0 lt!664433))))

(declare-fun b!1536677 () Bool)

(declare-fun res!1053757 () Bool)

(assert (=> b!1536677 (=> (not res!1053757) (not e!855288))))

(assert (=> b!1536677 (= res!1053757 (validKeyInArray!0 (select (arr!49257 a!2792) i!951)))))

(assert (= (and start!130984 res!1053755) b!1536671))

(assert (= (and b!1536671 res!1053763) b!1536677))

(assert (= (and b!1536677 res!1053757) b!1536672))

(assert (= (and b!1536672 res!1053762) b!1536669))

(assert (= (and b!1536669 res!1053752) b!1536670))

(assert (= (and b!1536670 res!1053758) b!1536667))

(assert (= (and b!1536667 res!1053753) b!1536673))

(assert (= (and b!1536673 res!1053760) b!1536675))

(assert (= (and b!1536675 res!1053754) b!1536666))

(assert (= (and b!1536666 res!1053761) b!1536668))

(assert (= (and b!1536668 res!1053759) b!1536674))

(assert (= (and b!1536674 (not res!1053756)) b!1536676))

(declare-fun m!1419143 () Bool)

(assert (=> b!1536670 m!1419143))

(declare-fun m!1419145 () Bool)

(assert (=> b!1536674 m!1419145))

(declare-fun m!1419147 () Bool)

(assert (=> b!1536674 m!1419147))

(declare-fun m!1419149 () Bool)

(assert (=> b!1536674 m!1419149))

(declare-fun m!1419151 () Bool)

(assert (=> b!1536674 m!1419151))

(declare-fun m!1419153 () Bool)

(assert (=> b!1536674 m!1419153))

(declare-fun m!1419155 () Bool)

(assert (=> b!1536667 m!1419155))

(declare-fun m!1419157 () Bool)

(assert (=> start!130984 m!1419157))

(declare-fun m!1419159 () Bool)

(assert (=> start!130984 m!1419159))

(declare-fun m!1419161 () Bool)

(assert (=> b!1536666 m!1419161))

(declare-fun m!1419163 () Bool)

(assert (=> b!1536677 m!1419163))

(assert (=> b!1536677 m!1419163))

(declare-fun m!1419165 () Bool)

(assert (=> b!1536677 m!1419165))

(declare-fun m!1419167 () Bool)

(assert (=> b!1536673 m!1419167))

(assert (=> b!1536673 m!1419167))

(declare-fun m!1419169 () Bool)

(assert (=> b!1536673 m!1419169))

(assert (=> b!1536672 m!1419167))

(assert (=> b!1536672 m!1419167))

(declare-fun m!1419171 () Bool)

(assert (=> b!1536672 m!1419171))

(declare-fun m!1419173 () Bool)

(assert (=> b!1536669 m!1419173))

(declare-fun m!1419175 () Bool)

(assert (=> b!1536675 m!1419175))

(assert (=> b!1536675 m!1419167))

(declare-fun m!1419177 () Bool)

(assert (=> b!1536676 m!1419177))

(assert (=> b!1536668 m!1419167))

(assert (=> b!1536668 m!1419167))

(declare-fun m!1419179 () Bool)

(assert (=> b!1536668 m!1419179))

(check-sat (not b!1536674) (not b!1536673) (not b!1536668) (not b!1536666) (not b!1536672) (not b!1536670) (not start!130984) (not b!1536676) (not b!1536677) (not b!1536669))
(check-sat)
