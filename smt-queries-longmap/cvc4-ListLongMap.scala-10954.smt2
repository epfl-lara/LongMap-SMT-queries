; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128188 () Bool)

(assert start!128188)

(declare-fun b!1505107 () Bool)

(declare-fun e!841239 () Bool)

(declare-fun e!841238 () Bool)

(assert (=> b!1505107 (= e!841239 e!841238)))

(declare-fun res!1025697 () Bool)

(assert (=> b!1505107 (=> (not res!1025697) (not e!841238))))

(declare-datatypes ((SeekEntryResult!12643 0))(
  ( (MissingZero!12643 (index!52964 (_ BitVec 32))) (Found!12643 (index!52965 (_ BitVec 32))) (Intermediate!12643 (undefined!13455 Bool) (index!52966 (_ BitVec 32)) (x!134645 (_ BitVec 32))) (Undefined!12643) (MissingVacant!12643 (index!52967 (_ BitVec 32))) )
))
(declare-fun lt!653896 () SeekEntryResult!12643)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100386 0))(
  ( (array!100387 (arr!48445 (Array (_ BitVec 32) (_ BitVec 64))) (size!48995 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100386)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100386 (_ BitVec 32)) SeekEntryResult!12643)

(assert (=> b!1505107 (= res!1025697 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48445 a!2850) j!87) a!2850 mask!2661) lt!653896))))

(assert (=> b!1505107 (= lt!653896 (Found!12643 j!87))))

(declare-fun b!1505108 () Bool)

(declare-fun res!1025707 () Bool)

(declare-fun e!841240 () Bool)

(assert (=> b!1505108 (=> (not res!1025707) (not e!841240))))

(declare-fun lt!653894 () (_ BitVec 32))

(assert (=> b!1505108 (= res!1025707 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653894 vacantBefore!10 (select (arr!48445 a!2850) j!87) a!2850 mask!2661) lt!653896))))

(declare-fun b!1505109 () Bool)

(declare-fun res!1025704 () Bool)

(assert (=> b!1505109 (=> (not res!1025704) (not e!841239))))

(declare-datatypes ((List!34937 0))(
  ( (Nil!34934) (Cons!34933 (h!36330 (_ BitVec 64)) (t!49631 List!34937)) )
))
(declare-fun arrayNoDuplicates!0 (array!100386 (_ BitVec 32) List!34937) Bool)

(assert (=> b!1505109 (= res!1025704 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34934))))

(declare-fun res!1025700 () Bool)

(assert (=> start!128188 (=> (not res!1025700) (not e!841239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128188 (= res!1025700 (validMask!0 mask!2661))))

(assert (=> start!128188 e!841239))

(assert (=> start!128188 true))

(declare-fun array_inv!37473 (array!100386) Bool)

(assert (=> start!128188 (array_inv!37473 a!2850)))

(declare-fun b!1505110 () Bool)

(declare-fun res!1025699 () Bool)

(assert (=> b!1505110 (=> (not res!1025699) (not e!841239))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1505110 (= res!1025699 (and (= (size!48995 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48995 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48995 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505111 () Bool)

(declare-fun res!1025706 () Bool)

(assert (=> b!1505111 (=> (not res!1025706) (not e!841238))))

(assert (=> b!1505111 (= res!1025706 (not (= (select (arr!48445 a!2850) index!625) (select (arr!48445 a!2850) j!87))))))

(declare-fun b!1505112 () Bool)

(declare-fun res!1025702 () Bool)

(assert (=> b!1505112 (=> (not res!1025702) (not e!841239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505112 (= res!1025702 (validKeyInArray!0 (select (arr!48445 a!2850) j!87)))))

(declare-fun b!1505113 () Bool)

(assert (=> b!1505113 (= e!841240 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505113 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653894 vacantAfter!10 (select (store (arr!48445 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100387 (store (arr!48445 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48995 a!2850)) mask!2661) lt!653896)))

(declare-datatypes ((Unit!50292 0))(
  ( (Unit!50293) )
))
(declare-fun lt!653895 () Unit!50292)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50292)

(assert (=> b!1505113 (= lt!653895 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653894 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1505114 () Bool)

(declare-fun res!1025703 () Bool)

(assert (=> b!1505114 (=> (not res!1025703) (not e!841239))))

(assert (=> b!1505114 (= res!1025703 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48995 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48995 a!2850)) (= (select (arr!48445 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48445 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48995 a!2850))))))

(declare-fun b!1505115 () Bool)

(assert (=> b!1505115 (= e!841238 e!841240)))

(declare-fun res!1025701 () Bool)

(assert (=> b!1505115 (=> (not res!1025701) (not e!841240))))

(assert (=> b!1505115 (= res!1025701 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653894 #b00000000000000000000000000000000) (bvslt lt!653894 (size!48995 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505115 (= lt!653894 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1505116 () Bool)

(declare-fun res!1025698 () Bool)

(assert (=> b!1505116 (=> (not res!1025698) (not e!841239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100386 (_ BitVec 32)) Bool)

(assert (=> b!1505116 (= res!1025698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505117 () Bool)

(declare-fun res!1025705 () Bool)

(assert (=> b!1505117 (=> (not res!1025705) (not e!841239))))

(assert (=> b!1505117 (= res!1025705 (validKeyInArray!0 (select (arr!48445 a!2850) i!996)))))

(assert (= (and start!128188 res!1025700) b!1505110))

(assert (= (and b!1505110 res!1025699) b!1505117))

(assert (= (and b!1505117 res!1025705) b!1505112))

(assert (= (and b!1505112 res!1025702) b!1505116))

(assert (= (and b!1505116 res!1025698) b!1505109))

(assert (= (and b!1505109 res!1025704) b!1505114))

(assert (= (and b!1505114 res!1025703) b!1505107))

(assert (= (and b!1505107 res!1025697) b!1505111))

(assert (= (and b!1505111 res!1025706) b!1505115))

(assert (= (and b!1505115 res!1025701) b!1505108))

(assert (= (and b!1505108 res!1025707) b!1505113))

(declare-fun m!1388221 () Bool)

(assert (=> b!1505108 m!1388221))

(assert (=> b!1505108 m!1388221))

(declare-fun m!1388223 () Bool)

(assert (=> b!1505108 m!1388223))

(assert (=> b!1505112 m!1388221))

(assert (=> b!1505112 m!1388221))

(declare-fun m!1388225 () Bool)

(assert (=> b!1505112 m!1388225))

(assert (=> b!1505107 m!1388221))

(assert (=> b!1505107 m!1388221))

(declare-fun m!1388227 () Bool)

(assert (=> b!1505107 m!1388227))

(declare-fun m!1388229 () Bool)

(assert (=> b!1505114 m!1388229))

(declare-fun m!1388231 () Bool)

(assert (=> b!1505114 m!1388231))

(declare-fun m!1388233 () Bool)

(assert (=> b!1505114 m!1388233))

(assert (=> b!1505113 m!1388231))

(declare-fun m!1388235 () Bool)

(assert (=> b!1505113 m!1388235))

(assert (=> b!1505113 m!1388235))

(declare-fun m!1388237 () Bool)

(assert (=> b!1505113 m!1388237))

(declare-fun m!1388239 () Bool)

(assert (=> b!1505113 m!1388239))

(declare-fun m!1388241 () Bool)

(assert (=> b!1505111 m!1388241))

(assert (=> b!1505111 m!1388221))

(declare-fun m!1388243 () Bool)

(assert (=> b!1505117 m!1388243))

(assert (=> b!1505117 m!1388243))

(declare-fun m!1388245 () Bool)

(assert (=> b!1505117 m!1388245))

(declare-fun m!1388247 () Bool)

(assert (=> b!1505109 m!1388247))

(declare-fun m!1388249 () Bool)

(assert (=> start!128188 m!1388249))

(declare-fun m!1388251 () Bool)

(assert (=> start!128188 m!1388251))

(declare-fun m!1388253 () Bool)

(assert (=> b!1505115 m!1388253))

(declare-fun m!1388255 () Bool)

(assert (=> b!1505116 m!1388255))

(push 1)

(assert (not b!1505112))

(assert (not b!1505117))

(assert (not b!1505116))

(assert (not start!128188))

(assert (not b!1505109))

(assert (not b!1505113))

(assert (not b!1505107))

(assert (not b!1505108))

(assert (not b!1505115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

