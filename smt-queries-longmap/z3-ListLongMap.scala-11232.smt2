; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131442 () Bool)

(assert start!131442)

(declare-fun b!1539766 () Bool)

(declare-fun e!857097 () Bool)

(declare-fun e!857098 () Bool)

(assert (=> b!1539766 (= e!857097 e!857098)))

(declare-fun res!1055280 () Bool)

(assert (=> b!1539766 (=> (not res!1055280) (not e!857098))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102244 0))(
  ( (array!102245 (arr!49330 (Array (_ BitVec 32) (_ BitVec 64))) (size!49881 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102244)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13357 0))(
  ( (MissingZero!13357 (index!55823 (_ BitVec 32))) (Found!13357 (index!55824 (_ BitVec 32))) (Intermediate!13357 (undefined!14169 Bool) (index!55825 (_ BitVec 32)) (x!137761 (_ BitVec 32))) (Undefined!13357) (MissingVacant!13357 (index!55826 (_ BitVec 32))) )
))
(declare-fun lt!665586 () SeekEntryResult!13357)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102244 (_ BitVec 32)) SeekEntryResult!13357)

(assert (=> b!1539766 (= res!1055280 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49330 a!2792) j!64) a!2792 mask!2480) lt!665586))))

(assert (=> b!1539766 (= lt!665586 (Found!13357 j!64))))

(declare-fun b!1539768 () Bool)

(declare-fun res!1055284 () Bool)

(assert (=> b!1539768 (=> (not res!1055284) (not e!857097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102244 (_ BitVec 32)) Bool)

(assert (=> b!1539768 (= res!1055284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539769 () Bool)

(declare-fun res!1055286 () Bool)

(assert (=> b!1539769 (=> (not res!1055286) (not e!857098))))

(assert (=> b!1539769 (= res!1055286 (not (= (select (arr!49330 a!2792) index!463) (select (arr!49330 a!2792) j!64))))))

(declare-fun b!1539767 () Bool)

(declare-fun e!857099 () Bool)

(assert (=> b!1539767 (= e!857099 (not true))))

(declare-fun lt!665589 () (_ BitVec 32))

(declare-fun lt!665588 () SeekEntryResult!13357)

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539767 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665589 vacantIndex!5 (select (store (arr!49330 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102245 (store (arr!49330 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49881 a!2792)) mask!2480) lt!665588)))

(declare-datatypes ((Unit!51323 0))(
  ( (Unit!51324) )
))
(declare-fun lt!665587 () Unit!51323)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51323)

(assert (=> b!1539767 (= lt!665587 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665589 vacantIndex!5 mask!2480))))

(declare-fun res!1055276 () Bool)

(assert (=> start!131442 (=> (not res!1055276) (not e!857097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131442 (= res!1055276 (validMask!0 mask!2480))))

(assert (=> start!131442 e!857097))

(assert (=> start!131442 true))

(declare-fun array_inv!38611 (array!102244) Bool)

(assert (=> start!131442 (array_inv!38611 a!2792)))

(declare-fun b!1539770 () Bool)

(declare-fun e!857101 () Bool)

(assert (=> b!1539770 (= e!857098 e!857101)))

(declare-fun res!1055281 () Bool)

(assert (=> b!1539770 (=> (not res!1055281) (not e!857101))))

(assert (=> b!1539770 (= res!1055281 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665589 #b00000000000000000000000000000000) (bvslt lt!665589 (size!49881 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539770 (= lt!665589 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539771 () Bool)

(declare-fun res!1055277 () Bool)

(assert (=> b!1539771 (=> (not res!1055277) (not e!857097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539771 (= res!1055277 (validKeyInArray!0 (select (arr!49330 a!2792) j!64)))))

(declare-fun b!1539772 () Bool)

(declare-fun res!1055278 () Bool)

(assert (=> b!1539772 (=> (not res!1055278) (not e!857097))))

(assert (=> b!1539772 (= res!1055278 (and (= (size!49881 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49881 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49881 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539773 () Bool)

(assert (=> b!1539773 (= e!857101 e!857099)))

(declare-fun res!1055282 () Bool)

(assert (=> b!1539773 (=> (not res!1055282) (not e!857099))))

(assert (=> b!1539773 (= res!1055282 (= lt!665588 lt!665586))))

(assert (=> b!1539773 (= lt!665588 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665589 vacantIndex!5 (select (arr!49330 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539774 () Bool)

(declare-fun res!1055279 () Bool)

(assert (=> b!1539774 (=> (not res!1055279) (not e!857097))))

(declare-datatypes ((List!35791 0))(
  ( (Nil!35788) (Cons!35787 (h!37250 (_ BitVec 64)) (t!50477 List!35791)) )
))
(declare-fun arrayNoDuplicates!0 (array!102244 (_ BitVec 32) List!35791) Bool)

(assert (=> b!1539774 (= res!1055279 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35788))))

(declare-fun b!1539775 () Bool)

(declare-fun res!1055285 () Bool)

(assert (=> b!1539775 (=> (not res!1055285) (not e!857097))))

(assert (=> b!1539775 (= res!1055285 (validKeyInArray!0 (select (arr!49330 a!2792) i!951)))))

(declare-fun b!1539776 () Bool)

(declare-fun res!1055283 () Bool)

(assert (=> b!1539776 (=> (not res!1055283) (not e!857097))))

(assert (=> b!1539776 (= res!1055283 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49881 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49881 a!2792)) (= (select (arr!49330 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131442 res!1055276) b!1539772))

(assert (= (and b!1539772 res!1055278) b!1539775))

(assert (= (and b!1539775 res!1055285) b!1539771))

(assert (= (and b!1539771 res!1055277) b!1539768))

(assert (= (and b!1539768 res!1055284) b!1539774))

(assert (= (and b!1539774 res!1055279) b!1539776))

(assert (= (and b!1539776 res!1055283) b!1539766))

(assert (= (and b!1539766 res!1055280) b!1539769))

(assert (= (and b!1539769 res!1055286) b!1539770))

(assert (= (and b!1539770 res!1055281) b!1539773))

(assert (= (and b!1539773 res!1055282) b!1539767))

(declare-fun m!1422067 () Bool)

(assert (=> b!1539776 m!1422067))

(declare-fun m!1422069 () Bool)

(assert (=> b!1539768 m!1422069))

(declare-fun m!1422071 () Bool)

(assert (=> b!1539774 m!1422071))

(declare-fun m!1422073 () Bool)

(assert (=> b!1539767 m!1422073))

(declare-fun m!1422075 () Bool)

(assert (=> b!1539767 m!1422075))

(assert (=> b!1539767 m!1422075))

(declare-fun m!1422077 () Bool)

(assert (=> b!1539767 m!1422077))

(declare-fun m!1422079 () Bool)

(assert (=> b!1539767 m!1422079))

(declare-fun m!1422081 () Bool)

(assert (=> b!1539771 m!1422081))

(assert (=> b!1539771 m!1422081))

(declare-fun m!1422083 () Bool)

(assert (=> b!1539771 m!1422083))

(declare-fun m!1422085 () Bool)

(assert (=> b!1539775 m!1422085))

(assert (=> b!1539775 m!1422085))

(declare-fun m!1422087 () Bool)

(assert (=> b!1539775 m!1422087))

(assert (=> b!1539766 m!1422081))

(assert (=> b!1539766 m!1422081))

(declare-fun m!1422089 () Bool)

(assert (=> b!1539766 m!1422089))

(declare-fun m!1422091 () Bool)

(assert (=> start!131442 m!1422091))

(declare-fun m!1422093 () Bool)

(assert (=> start!131442 m!1422093))

(assert (=> b!1539773 m!1422081))

(assert (=> b!1539773 m!1422081))

(declare-fun m!1422095 () Bool)

(assert (=> b!1539773 m!1422095))

(declare-fun m!1422097 () Bool)

(assert (=> b!1539770 m!1422097))

(declare-fun m!1422099 () Bool)

(assert (=> b!1539769 m!1422099))

(assert (=> b!1539769 m!1422081))

(check-sat (not b!1539768) (not b!1539771) (not b!1539775) (not b!1539773) (not b!1539767) (not b!1539770) (not b!1539766) (not start!131442) (not b!1539774))
(check-sat)
