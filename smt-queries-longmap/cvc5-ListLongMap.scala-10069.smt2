; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118548 () Bool)

(assert start!118548)

(declare-fun b!1385910 () Bool)

(declare-fun res!927162 () Bool)

(declare-fun e!785209 () Bool)

(assert (=> b!1385910 (=> (not res!927162) (not e!785209))))

(declare-datatypes ((array!94824 0))(
  ( (array!94825 (arr!45788 (Array (_ BitVec 32) (_ BitVec 64))) (size!46338 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94824)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385910 (= res!927162 (validKeyInArray!0 (select (arr!45788 a!2938) startIndex!16)))))

(declare-fun b!1385911 () Bool)

(declare-fun res!927160 () Bool)

(assert (=> b!1385911 (=> (not res!927160) (not e!785209))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385911 (= res!927160 (validKeyInArray!0 (select (arr!45788 a!2938) i!1065)))))

(declare-fun b!1385912 () Bool)

(declare-fun res!927164 () Bool)

(assert (=> b!1385912 (=> (not res!927164) (not e!785209))))

(assert (=> b!1385912 (= res!927164 (and (not (= (select (arr!45788 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45788 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun res!927163 () Bool)

(assert (=> start!118548 (=> (not res!927163) (not e!785209))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118548 (= res!927163 (validMask!0 mask!2987))))

(assert (=> start!118548 e!785209))

(assert (=> start!118548 true))

(declare-fun array_inv!34816 (array!94824) Bool)

(assert (=> start!118548 (array_inv!34816 a!2938)))

(declare-fun b!1385913 () Bool)

(declare-fun res!927161 () Bool)

(assert (=> b!1385913 (=> (not res!927161) (not e!785209))))

(assert (=> b!1385913 (= res!927161 (and (= (size!46338 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46338 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46338 a!2938))))))

(declare-fun b!1385914 () Bool)

(declare-fun res!927166 () Bool)

(assert (=> b!1385914 (=> (not res!927166) (not e!785209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94824 (_ BitVec 32)) Bool)

(assert (=> b!1385914 (= res!927166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385915 () Bool)

(declare-fun res!927165 () Bool)

(assert (=> b!1385915 (=> (not res!927165) (not e!785209))))

(declare-datatypes ((List!32316 0))(
  ( (Nil!32313) (Cons!32312 (h!33521 (_ BitVec 64)) (t!47010 List!32316)) )
))
(declare-fun arrayNoDuplicates!0 (array!94824 (_ BitVec 32) List!32316) Bool)

(assert (=> b!1385915 (= res!927165 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32313))))

(declare-fun b!1385916 () Bool)

(assert (=> b!1385916 (= e!785209 (not true))))

(declare-datatypes ((SeekEntryResult!10131 0))(
  ( (MissingZero!10131 (index!42895 (_ BitVec 32))) (Found!10131 (index!42896 (_ BitVec 32))) (Intermediate!10131 (undefined!10943 Bool) (index!42897 (_ BitVec 32)) (x!124524 (_ BitVec 32))) (Undefined!10131) (MissingVacant!10131 (index!42898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94824 (_ BitVec 32)) SeekEntryResult!10131)

(assert (=> b!1385916 (= (seekEntryOrOpen!0 (select (arr!45788 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45788 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94825 (store (arr!45788 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46338 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46250 0))(
  ( (Unit!46251) )
))
(declare-fun lt!609345 () Unit!46250)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46250)

(assert (=> b!1385916 (= lt!609345 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118548 res!927163) b!1385913))

(assert (= (and b!1385913 res!927161) b!1385911))

(assert (= (and b!1385911 res!927160) b!1385915))

(assert (= (and b!1385915 res!927165) b!1385914))

(assert (= (and b!1385914 res!927166) b!1385912))

(assert (= (and b!1385912 res!927164) b!1385910))

(assert (= (and b!1385910 res!927162) b!1385916))

(declare-fun m!1271181 () Bool)

(assert (=> b!1385914 m!1271181))

(declare-fun m!1271183 () Bool)

(assert (=> b!1385912 m!1271183))

(declare-fun m!1271185 () Bool)

(assert (=> b!1385910 m!1271185))

(assert (=> b!1385910 m!1271185))

(declare-fun m!1271187 () Bool)

(assert (=> b!1385910 m!1271187))

(declare-fun m!1271189 () Bool)

(assert (=> b!1385916 m!1271189))

(assert (=> b!1385916 m!1271189))

(declare-fun m!1271191 () Bool)

(assert (=> b!1385916 m!1271191))

(declare-fun m!1271193 () Bool)

(assert (=> b!1385916 m!1271193))

(declare-fun m!1271195 () Bool)

(assert (=> b!1385916 m!1271195))

(assert (=> b!1385916 m!1271185))

(assert (=> b!1385916 m!1271185))

(declare-fun m!1271197 () Bool)

(assert (=> b!1385916 m!1271197))

(assert (=> b!1385911 m!1271183))

(assert (=> b!1385911 m!1271183))

(declare-fun m!1271199 () Bool)

(assert (=> b!1385911 m!1271199))

(declare-fun m!1271201 () Bool)

(assert (=> start!118548 m!1271201))

(declare-fun m!1271203 () Bool)

(assert (=> start!118548 m!1271203))

(declare-fun m!1271205 () Bool)

(assert (=> b!1385915 m!1271205))

(push 1)

(assert (not b!1385914))

(assert (not b!1385910))

(assert (not b!1385916))

(assert (not start!118548))

(assert (not b!1385915))

(assert (not b!1385911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

