; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128052 () Bool)

(assert start!128052)

(declare-fun b!1504038 () Bool)

(declare-fun res!1024827 () Bool)

(declare-fun e!840805 () Bool)

(assert (=> b!1504038 (=> (not res!1024827) (not e!840805))))

(declare-datatypes ((array!100328 0))(
  ( (array!100329 (arr!48419 (Array (_ BitVec 32) (_ BitVec 64))) (size!48969 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100328)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504038 (= res!1024827 (not (= (select (arr!48419 a!2850) index!625) (select (arr!48419 a!2850) j!87))))))

(declare-fun b!1504039 () Bool)

(declare-fun res!1024833 () Bool)

(assert (=> b!1504039 (=> (not res!1024833) (not e!840805))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100328 (_ BitVec 32)) Bool)

(assert (=> b!1504039 (= res!1024833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504040 () Bool)

(assert (=> b!1504040 (= e!840805 false)))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653632 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504040 (= lt!653632 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504041 () Bool)

(declare-fun res!1024829 () Bool)

(assert (=> b!1504041 (=> (not res!1024829) (not e!840805))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504041 (= res!1024829 (and (= (size!48969 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48969 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48969 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504042 () Bool)

(declare-fun res!1024828 () Bool)

(assert (=> b!1504042 (=> (not res!1024828) (not e!840805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504042 (= res!1024828 (validKeyInArray!0 (select (arr!48419 a!2850) j!87)))))

(declare-fun b!1504043 () Bool)

(declare-fun res!1024831 () Bool)

(assert (=> b!1504043 (=> (not res!1024831) (not e!840805))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12617 0))(
  ( (MissingZero!12617 (index!52860 (_ BitVec 32))) (Found!12617 (index!52861 (_ BitVec 32))) (Intermediate!12617 (undefined!13429 Bool) (index!52862 (_ BitVec 32)) (x!134543 (_ BitVec 32))) (Undefined!12617) (MissingVacant!12617 (index!52863 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100328 (_ BitVec 32)) SeekEntryResult!12617)

(assert (=> b!1504043 (= res!1024831 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48419 a!2850) j!87) a!2850 mask!2661) (Found!12617 j!87)))))

(declare-fun b!1504045 () Bool)

(declare-fun res!1024834 () Bool)

(assert (=> b!1504045 (=> (not res!1024834) (not e!840805))))

(declare-datatypes ((List!34911 0))(
  ( (Nil!34908) (Cons!34907 (h!36304 (_ BitVec 64)) (t!49605 List!34911)) )
))
(declare-fun arrayNoDuplicates!0 (array!100328 (_ BitVec 32) List!34911) Bool)

(assert (=> b!1504045 (= res!1024834 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34908))))

(declare-fun b!1504046 () Bool)

(declare-fun res!1024830 () Bool)

(assert (=> b!1504046 (=> (not res!1024830) (not e!840805))))

(assert (=> b!1504046 (= res!1024830 (validKeyInArray!0 (select (arr!48419 a!2850) i!996)))))

(declare-fun b!1504044 () Bool)

(declare-fun res!1024832 () Bool)

(assert (=> b!1504044 (=> (not res!1024832) (not e!840805))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504044 (= res!1024832 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48969 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48969 a!2850)) (= (select (arr!48419 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48419 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48969 a!2850))))))

(declare-fun res!1024826 () Bool)

(assert (=> start!128052 (=> (not res!1024826) (not e!840805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128052 (= res!1024826 (validMask!0 mask!2661))))

(assert (=> start!128052 e!840805))

(assert (=> start!128052 true))

(declare-fun array_inv!37447 (array!100328) Bool)

(assert (=> start!128052 (array_inv!37447 a!2850)))

(assert (= (and start!128052 res!1024826) b!1504041))

(assert (= (and b!1504041 res!1024829) b!1504046))

(assert (= (and b!1504046 res!1024830) b!1504042))

(assert (= (and b!1504042 res!1024828) b!1504039))

(assert (= (and b!1504039 res!1024833) b!1504045))

(assert (= (and b!1504045 res!1024834) b!1504044))

(assert (= (and b!1504044 res!1024832) b!1504043))

(assert (= (and b!1504043 res!1024831) b!1504038))

(assert (= (and b!1504038 res!1024827) b!1504040))

(declare-fun m!1387243 () Bool)

(assert (=> b!1504044 m!1387243))

(declare-fun m!1387245 () Bool)

(assert (=> b!1504044 m!1387245))

(declare-fun m!1387247 () Bool)

(assert (=> b!1504044 m!1387247))

(declare-fun m!1387249 () Bool)

(assert (=> b!1504046 m!1387249))

(assert (=> b!1504046 m!1387249))

(declare-fun m!1387251 () Bool)

(assert (=> b!1504046 m!1387251))

(declare-fun m!1387253 () Bool)

(assert (=> b!1504043 m!1387253))

(assert (=> b!1504043 m!1387253))

(declare-fun m!1387255 () Bool)

(assert (=> b!1504043 m!1387255))

(declare-fun m!1387257 () Bool)

(assert (=> b!1504039 m!1387257))

(declare-fun m!1387259 () Bool)

(assert (=> b!1504045 m!1387259))

(assert (=> b!1504042 m!1387253))

(assert (=> b!1504042 m!1387253))

(declare-fun m!1387261 () Bool)

(assert (=> b!1504042 m!1387261))

(declare-fun m!1387263 () Bool)

(assert (=> start!128052 m!1387263))

(declare-fun m!1387265 () Bool)

(assert (=> start!128052 m!1387265))

(declare-fun m!1387267 () Bool)

(assert (=> b!1504040 m!1387267))

(declare-fun m!1387269 () Bool)

(assert (=> b!1504038 m!1387269))

(assert (=> b!1504038 m!1387253))

(push 1)

(assert (not b!1504042))

(assert (not b!1504039))

(assert (not b!1504040))

(assert (not b!1504045))

(assert (not b!1504043))

(assert (not b!1504046))

(assert (not start!128052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

