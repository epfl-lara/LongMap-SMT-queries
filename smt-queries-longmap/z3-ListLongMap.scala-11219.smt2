; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130948 () Bool)

(assert start!130948)

(declare-fun b!1536067 () Bool)

(declare-fun res!1053154 () Bool)

(declare-fun e!855012 () Bool)

(assert (=> b!1536067 (=> (not res!1053154) (not e!855012))))

(declare-datatypes ((array!102046 0))(
  ( (array!102047 (arr!49239 (Array (_ BitVec 32) (_ BitVec 64))) (size!49789 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102046)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536067 (= res!1053154 (validKeyInArray!0 (select (arr!49239 a!2792) j!64)))))

(declare-fun b!1536068 () Bool)

(declare-fun e!855010 () Bool)

(assert (=> b!1536068 (= e!855012 e!855010)))

(declare-fun res!1053160 () Bool)

(assert (=> b!1536068 (=> (not res!1053160) (not e!855010))))

(declare-datatypes ((SeekEntryResult!13371 0))(
  ( (MissingZero!13371 (index!55879 (_ BitVec 32))) (Found!13371 (index!55880 (_ BitVec 32))) (Intermediate!13371 (undefined!14183 Bool) (index!55881 (_ BitVec 32)) (x!137621 (_ BitVec 32))) (Undefined!13371) (MissingVacant!13371 (index!55882 (_ BitVec 32))) )
))
(declare-fun lt!664213 () SeekEntryResult!13371)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102046 (_ BitVec 32)) SeekEntryResult!13371)

(assert (=> b!1536068 (= res!1053160 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49239 a!2792) j!64) a!2792 mask!2480) lt!664213))))

(assert (=> b!1536068 (= lt!664213 (Found!13371 j!64))))

(declare-fun b!1536069 () Bool)

(declare-fun res!1053155 () Bool)

(assert (=> b!1536069 (=> (not res!1053155) (not e!855012))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536069 (= res!1053155 (and (= (size!49789 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49789 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49789 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536070 () Bool)

(declare-fun e!855011 () Bool)

(assert (=> b!1536070 (= e!855010 e!855011)))

(declare-fun res!1053158 () Bool)

(assert (=> b!1536070 (=> (not res!1053158) (not e!855011))))

(declare-fun lt!664211 () (_ BitVec 32))

(assert (=> b!1536070 (= res!1053158 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664211 #b00000000000000000000000000000000) (bvslt lt!664211 (size!49789 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536070 (= lt!664211 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536071 () Bool)

(declare-fun res!1053163 () Bool)

(assert (=> b!1536071 (=> (not res!1053163) (not e!855010))))

(assert (=> b!1536071 (= res!1053163 (not (= (select (arr!49239 a!2792) index!463) (select (arr!49239 a!2792) j!64))))))

(declare-fun b!1536072 () Bool)

(declare-fun res!1053162 () Bool)

(assert (=> b!1536072 (=> (not res!1053162) (not e!855012))))

(declare-datatypes ((List!35713 0))(
  ( (Nil!35710) (Cons!35709 (h!37154 (_ BitVec 64)) (t!50407 List!35713)) )
))
(declare-fun arrayNoDuplicates!0 (array!102046 (_ BitVec 32) List!35713) Bool)

(assert (=> b!1536072 (= res!1053162 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35710))))

(declare-fun b!1536073 () Bool)

(declare-fun e!855013 () Bool)

(assert (=> b!1536073 (= e!855011 e!855013)))

(declare-fun res!1053156 () Bool)

(assert (=> b!1536073 (=> (not res!1053156) (not e!855013))))

(declare-fun lt!664212 () SeekEntryResult!13371)

(assert (=> b!1536073 (= res!1053156 (= lt!664212 lt!664213))))

(assert (=> b!1536073 (= lt!664212 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664211 vacantIndex!5 (select (arr!49239 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1053161 () Bool)

(assert (=> start!130948 (=> (not res!1053161) (not e!855012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130948 (= res!1053161 (validMask!0 mask!2480))))

(assert (=> start!130948 e!855012))

(assert (=> start!130948 true))

(declare-fun array_inv!38267 (array!102046) Bool)

(assert (=> start!130948 (array_inv!38267 a!2792)))

(declare-fun b!1536074 () Bool)

(declare-fun res!1053153 () Bool)

(assert (=> b!1536074 (=> (not res!1053153) (not e!855012))))

(assert (=> b!1536074 (= res!1053153 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49789 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49789 a!2792)) (= (select (arr!49239 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536075 () Bool)

(assert (=> b!1536075 (= e!855013 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1536075 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664211 vacantIndex!5 (select (store (arr!49239 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102047 (store (arr!49239 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49789 a!2792)) mask!2480) lt!664212)))

(declare-datatypes ((Unit!51314 0))(
  ( (Unit!51315) )
))
(declare-fun lt!664210 () Unit!51314)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51314)

(assert (=> b!1536075 (= lt!664210 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664211 vacantIndex!5 mask!2480))))

(declare-fun b!1536076 () Bool)

(declare-fun res!1053157 () Bool)

(assert (=> b!1536076 (=> (not res!1053157) (not e!855012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102046 (_ BitVec 32)) Bool)

(assert (=> b!1536076 (= res!1053157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536077 () Bool)

(declare-fun res!1053159 () Bool)

(assert (=> b!1536077 (=> (not res!1053159) (not e!855012))))

(assert (=> b!1536077 (= res!1053159 (validKeyInArray!0 (select (arr!49239 a!2792) i!951)))))

(assert (= (and start!130948 res!1053161) b!1536069))

(assert (= (and b!1536069 res!1053155) b!1536077))

(assert (= (and b!1536077 res!1053159) b!1536067))

(assert (= (and b!1536067 res!1053154) b!1536076))

(assert (= (and b!1536076 res!1053157) b!1536072))

(assert (= (and b!1536072 res!1053162) b!1536074))

(assert (= (and b!1536074 res!1053153) b!1536068))

(assert (= (and b!1536068 res!1053160) b!1536071))

(assert (= (and b!1536071 res!1053163) b!1536070))

(assert (= (and b!1536070 res!1053158) b!1536073))

(assert (= (and b!1536073 res!1053156) b!1536075))

(declare-fun m!1418521 () Bool)

(assert (=> b!1536073 m!1418521))

(assert (=> b!1536073 m!1418521))

(declare-fun m!1418523 () Bool)

(assert (=> b!1536073 m!1418523))

(declare-fun m!1418525 () Bool)

(assert (=> b!1536075 m!1418525))

(declare-fun m!1418527 () Bool)

(assert (=> b!1536075 m!1418527))

(assert (=> b!1536075 m!1418527))

(declare-fun m!1418529 () Bool)

(assert (=> b!1536075 m!1418529))

(declare-fun m!1418531 () Bool)

(assert (=> b!1536075 m!1418531))

(declare-fun m!1418533 () Bool)

(assert (=> b!1536077 m!1418533))

(assert (=> b!1536077 m!1418533))

(declare-fun m!1418535 () Bool)

(assert (=> b!1536077 m!1418535))

(assert (=> b!1536068 m!1418521))

(assert (=> b!1536068 m!1418521))

(declare-fun m!1418537 () Bool)

(assert (=> b!1536068 m!1418537))

(declare-fun m!1418539 () Bool)

(assert (=> b!1536074 m!1418539))

(declare-fun m!1418541 () Bool)

(assert (=> b!1536076 m!1418541))

(declare-fun m!1418543 () Bool)

(assert (=> b!1536072 m!1418543))

(declare-fun m!1418545 () Bool)

(assert (=> b!1536071 m!1418545))

(assert (=> b!1536071 m!1418521))

(declare-fun m!1418547 () Bool)

(assert (=> b!1536070 m!1418547))

(declare-fun m!1418549 () Bool)

(assert (=> start!130948 m!1418549))

(declare-fun m!1418551 () Bool)

(assert (=> start!130948 m!1418551))

(assert (=> b!1536067 m!1418521))

(assert (=> b!1536067 m!1418521))

(declare-fun m!1418553 () Bool)

(assert (=> b!1536067 m!1418553))

(check-sat (not b!1536067) (not b!1536076) (not b!1536068) (not b!1536077) (not b!1536070) (not b!1536073) (not start!130948) (not b!1536072) (not b!1536075))
(check-sat)
