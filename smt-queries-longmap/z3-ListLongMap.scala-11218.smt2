; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130942 () Bool)

(assert start!130942)

(declare-fun b!1535969 () Bool)

(declare-fun e!854964 () Bool)

(declare-fun e!854968 () Bool)

(assert (=> b!1535969 (= e!854964 e!854968)))

(declare-fun res!1053055 () Bool)

(assert (=> b!1535969 (=> (not res!1053055) (not e!854968))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102040 0))(
  ( (array!102041 (arr!49236 (Array (_ BitVec 32) (_ BitVec 64))) (size!49786 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102040)

(declare-fun lt!664175 () (_ BitVec 32))

(assert (=> b!1535969 (= res!1053055 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664175 #b00000000000000000000000000000000) (bvslt lt!664175 (size!49786 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535969 (= lt!664175 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535970 () Bool)

(declare-fun res!1053057 () Bool)

(declare-fun e!854967 () Bool)

(assert (=> b!1535970 (=> (not res!1053057) (not e!854967))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535970 (= res!1053057 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49786 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49786 a!2792)) (= (select (arr!49236 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535971 () Bool)

(declare-fun res!1053058 () Bool)

(assert (=> b!1535971 (=> (not res!1053058) (not e!854967))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535971 (= res!1053058 (validKeyInArray!0 (select (arr!49236 a!2792) j!64)))))

(declare-fun b!1535972 () Bool)

(assert (=> b!1535972 (= e!854967 e!854964)))

(declare-fun res!1053064 () Bool)

(assert (=> b!1535972 (=> (not res!1053064) (not e!854964))))

(declare-datatypes ((SeekEntryResult!13368 0))(
  ( (MissingZero!13368 (index!55867 (_ BitVec 32))) (Found!13368 (index!55868 (_ BitVec 32))) (Intermediate!13368 (undefined!14180 Bool) (index!55869 (_ BitVec 32)) (x!137610 (_ BitVec 32))) (Undefined!13368) (MissingVacant!13368 (index!55870 (_ BitVec 32))) )
))
(declare-fun lt!664177 () SeekEntryResult!13368)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102040 (_ BitVec 32)) SeekEntryResult!13368)

(assert (=> b!1535972 (= res!1053064 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49236 a!2792) j!64) a!2792 mask!2480) lt!664177))))

(assert (=> b!1535972 (= lt!664177 (Found!13368 j!64))))

(declare-fun b!1535973 () Bool)

(declare-fun res!1053062 () Bool)

(assert (=> b!1535973 (=> (not res!1053062) (not e!854967))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535973 (= res!1053062 (and (= (size!49786 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49786 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49786 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535974 () Bool)

(declare-fun res!1053054 () Bool)

(assert (=> b!1535974 (=> (not res!1053054) (not e!854967))))

(declare-datatypes ((List!35710 0))(
  ( (Nil!35707) (Cons!35706 (h!37151 (_ BitVec 64)) (t!50404 List!35710)) )
))
(declare-fun arrayNoDuplicates!0 (array!102040 (_ BitVec 32) List!35710) Bool)

(assert (=> b!1535974 (= res!1053054 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35707))))

(declare-fun b!1535968 () Bool)

(declare-fun res!1053061 () Bool)

(assert (=> b!1535968 (=> (not res!1053061) (not e!854967))))

(assert (=> b!1535968 (= res!1053061 (validKeyInArray!0 (select (arr!49236 a!2792) i!951)))))

(declare-fun res!1053056 () Bool)

(assert (=> start!130942 (=> (not res!1053056) (not e!854967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130942 (= res!1053056 (validMask!0 mask!2480))))

(assert (=> start!130942 e!854967))

(assert (=> start!130942 true))

(declare-fun array_inv!38264 (array!102040) Bool)

(assert (=> start!130942 (array_inv!38264 a!2792)))

(declare-fun b!1535975 () Bool)

(declare-fun e!854965 () Bool)

(assert (=> b!1535975 (= e!854968 e!854965)))

(declare-fun res!1053059 () Bool)

(assert (=> b!1535975 (=> (not res!1053059) (not e!854965))))

(declare-fun lt!664174 () SeekEntryResult!13368)

(assert (=> b!1535975 (= res!1053059 (= lt!664174 lt!664177))))

(assert (=> b!1535975 (= lt!664174 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664175 vacantIndex!5 (select (arr!49236 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535976 () Bool)

(declare-fun res!1053060 () Bool)

(assert (=> b!1535976 (=> (not res!1053060) (not e!854967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102040 (_ BitVec 32)) Bool)

(assert (=> b!1535976 (= res!1053060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535977 () Bool)

(assert (=> b!1535977 (= e!854965 (not true))))

(assert (=> b!1535977 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664175 vacantIndex!5 (select (store (arr!49236 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102041 (store (arr!49236 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49786 a!2792)) mask!2480) lt!664174)))

(declare-datatypes ((Unit!51308 0))(
  ( (Unit!51309) )
))
(declare-fun lt!664176 () Unit!51308)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51308)

(assert (=> b!1535977 (= lt!664176 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664175 vacantIndex!5 mask!2480))))

(declare-fun b!1535978 () Bool)

(declare-fun res!1053063 () Bool)

(assert (=> b!1535978 (=> (not res!1053063) (not e!854964))))

(assert (=> b!1535978 (= res!1053063 (not (= (select (arr!49236 a!2792) index!463) (select (arr!49236 a!2792) j!64))))))

(assert (= (and start!130942 res!1053056) b!1535973))

(assert (= (and b!1535973 res!1053062) b!1535968))

(assert (= (and b!1535968 res!1053061) b!1535971))

(assert (= (and b!1535971 res!1053058) b!1535976))

(assert (= (and b!1535976 res!1053060) b!1535974))

(assert (= (and b!1535974 res!1053054) b!1535970))

(assert (= (and b!1535970 res!1053057) b!1535972))

(assert (= (and b!1535972 res!1053064) b!1535978))

(assert (= (and b!1535978 res!1053063) b!1535969))

(assert (= (and b!1535969 res!1053055) b!1535975))

(assert (= (and b!1535975 res!1053059) b!1535977))

(declare-fun m!1418419 () Bool)

(assert (=> b!1535972 m!1418419))

(assert (=> b!1535972 m!1418419))

(declare-fun m!1418421 () Bool)

(assert (=> b!1535972 m!1418421))

(declare-fun m!1418423 () Bool)

(assert (=> b!1535974 m!1418423))

(declare-fun m!1418425 () Bool)

(assert (=> b!1535976 m!1418425))

(declare-fun m!1418427 () Bool)

(assert (=> start!130942 m!1418427))

(declare-fun m!1418429 () Bool)

(assert (=> start!130942 m!1418429))

(declare-fun m!1418431 () Bool)

(assert (=> b!1535968 m!1418431))

(assert (=> b!1535968 m!1418431))

(declare-fun m!1418433 () Bool)

(assert (=> b!1535968 m!1418433))

(declare-fun m!1418435 () Bool)

(assert (=> b!1535977 m!1418435))

(declare-fun m!1418437 () Bool)

(assert (=> b!1535977 m!1418437))

(assert (=> b!1535977 m!1418437))

(declare-fun m!1418439 () Bool)

(assert (=> b!1535977 m!1418439))

(declare-fun m!1418441 () Bool)

(assert (=> b!1535977 m!1418441))

(declare-fun m!1418443 () Bool)

(assert (=> b!1535969 m!1418443))

(assert (=> b!1535975 m!1418419))

(assert (=> b!1535975 m!1418419))

(declare-fun m!1418445 () Bool)

(assert (=> b!1535975 m!1418445))

(declare-fun m!1418447 () Bool)

(assert (=> b!1535978 m!1418447))

(assert (=> b!1535978 m!1418419))

(assert (=> b!1535971 m!1418419))

(assert (=> b!1535971 m!1418419))

(declare-fun m!1418449 () Bool)

(assert (=> b!1535971 m!1418449))

(declare-fun m!1418451 () Bool)

(assert (=> b!1535970 m!1418451))

(check-sat (not b!1535969) (not b!1535972) (not start!130942) (not b!1535974) (not b!1535977) (not b!1535976) (not b!1535975) (not b!1535968) (not b!1535971))
(check-sat)
