; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130968 () Bool)

(assert start!130968)

(declare-fun b!1536918 () Bool)

(declare-fun res!1054195 () Bool)

(declare-fun e!855345 () Bool)

(assert (=> b!1536918 (=> (not res!1054195) (not e!855345))))

(declare-datatypes ((array!102064 0))(
  ( (array!102065 (arr!49249 (Array (_ BitVec 32) (_ BitVec 64))) (size!49801 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102064)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536918 (= res!1054195 (and (= (size!49801 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49801 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49801 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536919 () Bool)

(declare-fun res!1054194 () Bool)

(assert (=> b!1536919 (=> (not res!1054194) (not e!855345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536919 (= res!1054194 (validKeyInArray!0 (select (arr!49249 a!2792) i!951)))))

(declare-fun b!1536920 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun e!855346 () Bool)

(assert (=> b!1536920 (= e!855346 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-datatypes ((SeekEntryResult!13406 0))(
  ( (MissingZero!13406 (index!56019 (_ BitVec 32))) (Found!13406 (index!56020 (_ BitVec 32))) (Intermediate!13406 (undefined!14218 Bool) (index!56021 (_ BitVec 32)) (x!137747 (_ BitVec 32))) (Undefined!13406) (MissingVacant!13406 (index!56022 (_ BitVec 32))) )
))
(declare-fun lt!664356 () SeekEntryResult!13406)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664354 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102064 (_ BitVec 32)) SeekEntryResult!13406)

(assert (=> b!1536920 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664354 vacantIndex!5 (select (store (arr!49249 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102065 (store (arr!49249 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49801 a!2792)) mask!2480) lt!664356)))

(declare-datatypes ((Unit!51219 0))(
  ( (Unit!51220) )
))
(declare-fun lt!664353 () Unit!51219)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51219)

(assert (=> b!1536920 (= lt!664353 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664354 vacantIndex!5 mask!2480))))

(declare-fun b!1536921 () Bool)

(declare-fun res!1054197 () Bool)

(declare-fun e!855348 () Bool)

(assert (=> b!1536921 (=> (not res!1054197) (not e!855348))))

(assert (=> b!1536921 (= res!1054197 (not (= (select (arr!49249 a!2792) index!463) (select (arr!49249 a!2792) j!64))))))

(declare-fun b!1536922 () Bool)

(declare-fun res!1054188 () Bool)

(assert (=> b!1536922 (=> (not res!1054188) (not e!855345))))

(assert (=> b!1536922 (= res!1054188 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49801 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49801 a!2792)) (= (select (arr!49249 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1054189 () Bool)

(assert (=> start!130968 (=> (not res!1054189) (not e!855345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130968 (= res!1054189 (validMask!0 mask!2480))))

(assert (=> start!130968 e!855345))

(assert (=> start!130968 true))

(declare-fun array_inv!38482 (array!102064) Bool)

(assert (=> start!130968 (array_inv!38482 a!2792)))

(declare-fun b!1536923 () Bool)

(declare-fun e!855349 () Bool)

(assert (=> b!1536923 (= e!855349 e!855346)))

(declare-fun res!1054192 () Bool)

(assert (=> b!1536923 (=> (not res!1054192) (not e!855346))))

(declare-fun lt!664355 () SeekEntryResult!13406)

(assert (=> b!1536923 (= res!1054192 (= lt!664356 lt!664355))))

(assert (=> b!1536923 (= lt!664356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664354 vacantIndex!5 (select (arr!49249 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536924 () Bool)

(assert (=> b!1536924 (= e!855348 e!855349)))

(declare-fun res!1054190 () Bool)

(assert (=> b!1536924 (=> (not res!1054190) (not e!855349))))

(assert (=> b!1536924 (= res!1054190 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664354 #b00000000000000000000000000000000) (bvslt lt!664354 (size!49801 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536924 (= lt!664354 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536925 () Bool)

(declare-fun res!1054193 () Bool)

(assert (=> b!1536925 (=> (not res!1054193) (not e!855345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102064 (_ BitVec 32)) Bool)

(assert (=> b!1536925 (= res!1054193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536926 () Bool)

(assert (=> b!1536926 (= e!855345 e!855348)))

(declare-fun res!1054196 () Bool)

(assert (=> b!1536926 (=> (not res!1054196) (not e!855348))))

(assert (=> b!1536926 (= res!1054196 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49249 a!2792) j!64) a!2792 mask!2480) lt!664355))))

(assert (=> b!1536926 (= lt!664355 (Found!13406 j!64))))

(declare-fun b!1536927 () Bool)

(declare-fun res!1054198 () Bool)

(assert (=> b!1536927 (=> (not res!1054198) (not e!855345))))

(assert (=> b!1536927 (= res!1054198 (validKeyInArray!0 (select (arr!49249 a!2792) j!64)))))

(declare-fun b!1536928 () Bool)

(declare-fun res!1054191 () Bool)

(assert (=> b!1536928 (=> (not res!1054191) (not e!855345))))

(declare-datatypes ((List!35801 0))(
  ( (Nil!35798) (Cons!35797 (h!37243 (_ BitVec 64)) (t!50487 List!35801)) )
))
(declare-fun arrayNoDuplicates!0 (array!102064 (_ BitVec 32) List!35801) Bool)

(assert (=> b!1536928 (= res!1054191 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35798))))

(assert (= (and start!130968 res!1054189) b!1536918))

(assert (= (and b!1536918 res!1054195) b!1536919))

(assert (= (and b!1536919 res!1054194) b!1536927))

(assert (= (and b!1536927 res!1054198) b!1536925))

(assert (= (and b!1536925 res!1054193) b!1536928))

(assert (= (and b!1536928 res!1054191) b!1536922))

(assert (= (and b!1536922 res!1054188) b!1536926))

(assert (= (and b!1536926 res!1054196) b!1536921))

(assert (= (and b!1536921 res!1054197) b!1536924))

(assert (= (and b!1536924 res!1054190) b!1536923))

(assert (= (and b!1536923 res!1054192) b!1536920))

(declare-fun m!1418837 () Bool)

(assert (=> b!1536925 m!1418837))

(declare-fun m!1418839 () Bool)

(assert (=> b!1536920 m!1418839))

(declare-fun m!1418841 () Bool)

(assert (=> b!1536920 m!1418841))

(assert (=> b!1536920 m!1418841))

(declare-fun m!1418843 () Bool)

(assert (=> b!1536920 m!1418843))

(declare-fun m!1418845 () Bool)

(assert (=> b!1536920 m!1418845))

(declare-fun m!1418847 () Bool)

(assert (=> b!1536924 m!1418847))

(declare-fun m!1418849 () Bool)

(assert (=> b!1536922 m!1418849))

(declare-fun m!1418851 () Bool)

(assert (=> b!1536923 m!1418851))

(assert (=> b!1536923 m!1418851))

(declare-fun m!1418853 () Bool)

(assert (=> b!1536923 m!1418853))

(declare-fun m!1418855 () Bool)

(assert (=> b!1536928 m!1418855))

(assert (=> b!1536927 m!1418851))

(assert (=> b!1536927 m!1418851))

(declare-fun m!1418857 () Bool)

(assert (=> b!1536927 m!1418857))

(declare-fun m!1418859 () Bool)

(assert (=> start!130968 m!1418859))

(declare-fun m!1418861 () Bool)

(assert (=> start!130968 m!1418861))

(declare-fun m!1418863 () Bool)

(assert (=> b!1536919 m!1418863))

(assert (=> b!1536919 m!1418863))

(declare-fun m!1418865 () Bool)

(assert (=> b!1536919 m!1418865))

(declare-fun m!1418867 () Bool)

(assert (=> b!1536921 m!1418867))

(assert (=> b!1536921 m!1418851))

(assert (=> b!1536926 m!1418851))

(assert (=> b!1536926 m!1418851))

(declare-fun m!1418869 () Bool)

(assert (=> b!1536926 m!1418869))

(check-sat (not start!130968) (not b!1536927) (not b!1536923) (not b!1536920) (not b!1536919) (not b!1536924) (not b!1536928) (not b!1536925) (not b!1536926))
(check-sat)
