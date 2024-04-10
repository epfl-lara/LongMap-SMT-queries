; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131168 () Bool)

(assert start!131168)

(declare-fun b!1538766 () Bool)

(declare-fun res!1055750 () Bool)

(declare-fun e!856068 () Bool)

(assert (=> b!1538766 (=> (not res!1055750) (not e!856068))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102233 0))(
  ( (array!102234 (arr!49331 (Array (_ BitVec 32) (_ BitVec 64))) (size!49881 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102233)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13457 0))(
  ( (MissingZero!13457 (index!56223 (_ BitVec 32))) (Found!13457 (index!56224 (_ BitVec 32))) (Intermediate!13457 (undefined!14269 Bool) (index!56225 (_ BitVec 32)) (x!137958 (_ BitVec 32))) (Undefined!13457) (MissingVacant!13457 (index!56226 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102233 (_ BitVec 32)) SeekEntryResult!13457)

(assert (=> b!1538766 (= res!1055750 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49331 a!2792) j!64) a!2792 mask!2480) (Found!13457 j!64)))))

(declare-fun b!1538767 () Bool)

(declare-fun res!1055744 () Bool)

(assert (=> b!1538767 (=> (not res!1055744) (not e!856068))))

(assert (=> b!1538767 (= res!1055744 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49881 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49881 a!2792)) (= (select (arr!49331 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538768 () Bool)

(declare-fun res!1055745 () Bool)

(assert (=> b!1538768 (=> (not res!1055745) (not e!856068))))

(declare-datatypes ((List!35805 0))(
  ( (Nil!35802) (Cons!35801 (h!37246 (_ BitVec 64)) (t!50499 List!35805)) )
))
(declare-fun arrayNoDuplicates!0 (array!102233 (_ BitVec 32) List!35805) Bool)

(assert (=> b!1538768 (= res!1055745 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35802))))

(declare-fun b!1538770 () Bool)

(declare-fun res!1055747 () Bool)

(assert (=> b!1538770 (=> (not res!1055747) (not e!856068))))

(assert (=> b!1538770 (= res!1055747 (not (= (select (arr!49331 a!2792) index!463) (select (arr!49331 a!2792) j!64))))))

(declare-fun b!1538771 () Bool)

(assert (=> b!1538771 (= e!856068 false)))

(declare-fun lt!664936 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538771 (= lt!664936 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538772 () Bool)

(declare-fun res!1055752 () Bool)

(assert (=> b!1538772 (=> (not res!1055752) (not e!856068))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538772 (= res!1055752 (and (= (size!49881 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49881 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49881 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538773 () Bool)

(declare-fun res!1055748 () Bool)

(assert (=> b!1538773 (=> (not res!1055748) (not e!856068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538773 (= res!1055748 (validKeyInArray!0 (select (arr!49331 a!2792) j!64)))))

(declare-fun b!1538774 () Bool)

(declare-fun res!1055751 () Bool)

(assert (=> b!1538774 (=> (not res!1055751) (not e!856068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102233 (_ BitVec 32)) Bool)

(assert (=> b!1538774 (= res!1055751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538769 () Bool)

(declare-fun res!1055749 () Bool)

(assert (=> b!1538769 (=> (not res!1055749) (not e!856068))))

(assert (=> b!1538769 (= res!1055749 (validKeyInArray!0 (select (arr!49331 a!2792) i!951)))))

(declare-fun res!1055746 () Bool)

(assert (=> start!131168 (=> (not res!1055746) (not e!856068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131168 (= res!1055746 (validMask!0 mask!2480))))

(assert (=> start!131168 e!856068))

(assert (=> start!131168 true))

(declare-fun array_inv!38359 (array!102233) Bool)

(assert (=> start!131168 (array_inv!38359 a!2792)))

(assert (= (and start!131168 res!1055746) b!1538772))

(assert (= (and b!1538772 res!1055752) b!1538769))

(assert (= (and b!1538769 res!1055749) b!1538773))

(assert (= (and b!1538773 res!1055748) b!1538774))

(assert (= (and b!1538774 res!1055751) b!1538768))

(assert (= (and b!1538768 res!1055745) b!1538767))

(assert (= (and b!1538767 res!1055744) b!1538766))

(assert (= (and b!1538766 res!1055750) b!1538770))

(assert (= (and b!1538770 res!1055747) b!1538771))

(declare-fun m!1421163 () Bool)

(assert (=> b!1538768 m!1421163))

(declare-fun m!1421165 () Bool)

(assert (=> b!1538771 m!1421165))

(declare-fun m!1421167 () Bool)

(assert (=> b!1538769 m!1421167))

(assert (=> b!1538769 m!1421167))

(declare-fun m!1421169 () Bool)

(assert (=> b!1538769 m!1421169))

(declare-fun m!1421171 () Bool)

(assert (=> b!1538774 m!1421171))

(declare-fun m!1421173 () Bool)

(assert (=> b!1538770 m!1421173))

(declare-fun m!1421175 () Bool)

(assert (=> b!1538770 m!1421175))

(assert (=> b!1538773 m!1421175))

(assert (=> b!1538773 m!1421175))

(declare-fun m!1421177 () Bool)

(assert (=> b!1538773 m!1421177))

(declare-fun m!1421179 () Bool)

(assert (=> start!131168 m!1421179))

(declare-fun m!1421181 () Bool)

(assert (=> start!131168 m!1421181))

(assert (=> b!1538766 m!1421175))

(assert (=> b!1538766 m!1421175))

(declare-fun m!1421183 () Bool)

(assert (=> b!1538766 m!1421183))

(declare-fun m!1421185 () Bool)

(assert (=> b!1538767 m!1421185))

(push 1)

(assert (not b!1538768))

(assert (not b!1538771))

(assert (not b!1538774))

(assert (not b!1538766))

(assert (not start!131168))

(assert (not b!1538773))

(assert (not b!1538769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

