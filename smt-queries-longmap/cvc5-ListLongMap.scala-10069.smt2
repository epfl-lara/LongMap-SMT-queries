; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118548 () Bool)

(assert start!118548)

(declare-fun b!1385883 () Bool)

(declare-fun res!927180 () Bool)

(declare-fun e!785191 () Bool)

(assert (=> b!1385883 (=> (not res!927180) (not e!785191))))

(declare-datatypes ((array!94777 0))(
  ( (array!94778 (arr!45765 (Array (_ BitVec 32) (_ BitVec 64))) (size!46317 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94777)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385883 (= res!927180 (validKeyInArray!0 (select (arr!45765 a!2938) startIndex!16)))))

(declare-fun b!1385884 () Bool)

(declare-fun res!927177 () Bool)

(assert (=> b!1385884 (=> (not res!927177) (not e!785191))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385884 (= res!927177 (and (not (= (select (arr!45765 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45765 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385886 () Bool)

(declare-fun res!927182 () Bool)

(assert (=> b!1385886 (=> (not res!927182) (not e!785191))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385886 (= res!927182 (and (= (size!46317 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46317 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46317 a!2938))))))

(declare-fun b!1385887 () Bool)

(declare-fun res!927178 () Bool)

(assert (=> b!1385887 (=> (not res!927178) (not e!785191))))

(assert (=> b!1385887 (= res!927178 (validKeyInArray!0 (select (arr!45765 a!2938) i!1065)))))

(declare-fun b!1385888 () Bool)

(declare-fun res!927179 () Bool)

(assert (=> b!1385888 (=> (not res!927179) (not e!785191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94777 (_ BitVec 32)) Bool)

(assert (=> b!1385888 (= res!927179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385889 () Bool)

(assert (=> b!1385889 (= e!785191 (not true))))

(declare-datatypes ((SeekEntryResult!10134 0))(
  ( (MissingZero!10134 (index!42907 (_ BitVec 32))) (Found!10134 (index!42908 (_ BitVec 32))) (Intermediate!10134 (undefined!10946 Bool) (index!42909 (_ BitVec 32)) (x!124524 (_ BitVec 32))) (Undefined!10134) (MissingVacant!10134 (index!42910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94777 (_ BitVec 32)) SeekEntryResult!10134)

(assert (=> b!1385889 (= (seekEntryOrOpen!0 (select (arr!45765 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45765 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94778 (store (arr!45765 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46317 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46099 0))(
  ( (Unit!46100) )
))
(declare-fun lt!609167 () Unit!46099)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46099)

(assert (=> b!1385889 (= lt!609167 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun res!927181 () Bool)

(assert (=> start!118548 (=> (not res!927181) (not e!785191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118548 (= res!927181 (validMask!0 mask!2987))))

(assert (=> start!118548 e!785191))

(assert (=> start!118548 true))

(declare-fun array_inv!34998 (array!94777) Bool)

(assert (=> start!118548 (array_inv!34998 a!2938)))

(declare-fun b!1385885 () Bool)

(declare-fun res!927176 () Bool)

(assert (=> b!1385885 (=> (not res!927176) (not e!785191))))

(declare-datatypes ((List!32371 0))(
  ( (Nil!32368) (Cons!32367 (h!33576 (_ BitVec 64)) (t!47057 List!32371)) )
))
(declare-fun arrayNoDuplicates!0 (array!94777 (_ BitVec 32) List!32371) Bool)

(assert (=> b!1385885 (= res!927176 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32368))))

(assert (= (and start!118548 res!927181) b!1385886))

(assert (= (and b!1385886 res!927182) b!1385887))

(assert (= (and b!1385887 res!927178) b!1385885))

(assert (= (and b!1385885 res!927176) b!1385888))

(assert (= (and b!1385888 res!927179) b!1385884))

(assert (= (and b!1385884 res!927177) b!1385883))

(assert (= (and b!1385883 res!927180) b!1385889))

(declare-fun m!1270729 () Bool)

(assert (=> b!1385889 m!1270729))

(assert (=> b!1385889 m!1270729))

(declare-fun m!1270731 () Bool)

(assert (=> b!1385889 m!1270731))

(declare-fun m!1270733 () Bool)

(assert (=> b!1385889 m!1270733))

(declare-fun m!1270735 () Bool)

(assert (=> b!1385889 m!1270735))

(declare-fun m!1270737 () Bool)

(assert (=> b!1385889 m!1270737))

(assert (=> b!1385889 m!1270737))

(declare-fun m!1270739 () Bool)

(assert (=> b!1385889 m!1270739))

(declare-fun m!1270741 () Bool)

(assert (=> b!1385887 m!1270741))

(assert (=> b!1385887 m!1270741))

(declare-fun m!1270743 () Bool)

(assert (=> b!1385887 m!1270743))

(declare-fun m!1270745 () Bool)

(assert (=> b!1385885 m!1270745))

(declare-fun m!1270747 () Bool)

(assert (=> b!1385888 m!1270747))

(assert (=> b!1385884 m!1270741))

(assert (=> b!1385883 m!1270737))

(assert (=> b!1385883 m!1270737))

(declare-fun m!1270749 () Bool)

(assert (=> b!1385883 m!1270749))

(declare-fun m!1270751 () Bool)

(assert (=> start!118548 m!1270751))

(declare-fun m!1270753 () Bool)

(assert (=> start!118548 m!1270753))

(push 1)

(assert (not b!1385885))

(assert (not start!118548))

(assert (not b!1385888))

(assert (not b!1385887))

(assert (not b!1385883))

(assert (not b!1385889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

