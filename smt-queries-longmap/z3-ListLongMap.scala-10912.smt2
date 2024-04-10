; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127736 () Bool)

(assert start!127736)

(declare-fun b!1501006 () Bool)

(declare-fun res!1022083 () Bool)

(declare-fun e!839768 () Bool)

(assert (=> b!1501006 (=> (not res!1022083) (not e!839768))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100117 0))(
  ( (array!100118 (arr!48318 (Array (_ BitVec 32) (_ BitVec 64))) (size!48868 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100117)

(declare-fun lt!653056 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12528 0))(
  ( (MissingZero!12528 (index!52504 (_ BitVec 32))) (Found!12528 (index!52505 (_ BitVec 32))) (Intermediate!12528 (undefined!13340 Bool) (index!52506 (_ BitVec 32)) (x!134170 (_ BitVec 32))) (Undefined!12528) (MissingVacant!12528 (index!52507 (_ BitVec 32))) )
))
(declare-fun lt!653055 () SeekEntryResult!12528)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100117 (_ BitVec 32)) SeekEntryResult!12528)

(assert (=> b!1501006 (= res!1022083 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653056 vacantBefore!10 (select (arr!48318 a!2850) j!87) a!2850 mask!2661) lt!653055))))

(declare-fun b!1501007 () Bool)

(declare-fun res!1022089 () Bool)

(declare-fun e!839769 () Bool)

(assert (=> b!1501007 (=> (not res!1022089) (not e!839769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100117 (_ BitVec 32)) Bool)

(assert (=> b!1501007 (= res!1022089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501008 () Bool)

(declare-fun e!839767 () Bool)

(assert (=> b!1501008 (= e!839769 e!839767)))

(declare-fun res!1022082 () Bool)

(assert (=> b!1501008 (=> (not res!1022082) (not e!839767))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501008 (= res!1022082 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48318 a!2850) j!87) a!2850 mask!2661) lt!653055))))

(assert (=> b!1501008 (= lt!653055 (Found!12528 j!87))))

(declare-fun b!1501009 () Bool)

(declare-fun res!1022092 () Bool)

(assert (=> b!1501009 (=> (not res!1022092) (not e!839769))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501009 (= res!1022092 (and (= (size!48868 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48868 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48868 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501011 () Bool)

(declare-fun res!1022087 () Bool)

(assert (=> b!1501011 (=> (not res!1022087) (not e!839769))))

(declare-datatypes ((List!34810 0))(
  ( (Nil!34807) (Cons!34806 (h!36203 (_ BitVec 64)) (t!49504 List!34810)) )
))
(declare-fun arrayNoDuplicates!0 (array!100117 (_ BitVec 32) List!34810) Bool)

(assert (=> b!1501011 (= res!1022087 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34807))))

(declare-fun b!1501012 () Bool)

(declare-fun res!1022086 () Bool)

(assert (=> b!1501012 (=> (not res!1022086) (not e!839767))))

(assert (=> b!1501012 (= res!1022086 (not (= (select (arr!48318 a!2850) index!625) (select (arr!48318 a!2850) j!87))))))

(declare-fun b!1501013 () Bool)

(assert (=> b!1501013 (= e!839768 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501013 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653056 vacantAfter!10 (select (store (arr!48318 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100118 (store (arr!48318 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48868 a!2850)) mask!2661) lt!653055)))

(declare-datatypes ((Unit!50210 0))(
  ( (Unit!50211) )
))
(declare-fun lt!653054 () Unit!50210)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50210)

(assert (=> b!1501013 (= lt!653054 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653056 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501014 () Bool)

(assert (=> b!1501014 (= e!839767 e!839768)))

(declare-fun res!1022088 () Bool)

(assert (=> b!1501014 (=> (not res!1022088) (not e!839768))))

(assert (=> b!1501014 (= res!1022088 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653056 #b00000000000000000000000000000000) (bvslt lt!653056 (size!48868 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501014 (= lt!653056 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1022084 () Bool)

(assert (=> start!127736 (=> (not res!1022084) (not e!839769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127736 (= res!1022084 (validMask!0 mask!2661))))

(assert (=> start!127736 e!839769))

(assert (=> start!127736 true))

(declare-fun array_inv!37346 (array!100117) Bool)

(assert (=> start!127736 (array_inv!37346 a!2850)))

(declare-fun b!1501010 () Bool)

(declare-fun res!1022091 () Bool)

(assert (=> b!1501010 (=> (not res!1022091) (not e!839769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501010 (= res!1022091 (validKeyInArray!0 (select (arr!48318 a!2850) j!87)))))

(declare-fun b!1501015 () Bool)

(declare-fun res!1022090 () Bool)

(assert (=> b!1501015 (=> (not res!1022090) (not e!839769))))

(assert (=> b!1501015 (= res!1022090 (validKeyInArray!0 (select (arr!48318 a!2850) i!996)))))

(declare-fun b!1501016 () Bool)

(declare-fun res!1022085 () Bool)

(assert (=> b!1501016 (=> (not res!1022085) (not e!839769))))

(assert (=> b!1501016 (= res!1022085 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48868 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48868 a!2850)) (= (select (arr!48318 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48318 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48868 a!2850))))))

(assert (= (and start!127736 res!1022084) b!1501009))

(assert (= (and b!1501009 res!1022092) b!1501015))

(assert (= (and b!1501015 res!1022090) b!1501010))

(assert (= (and b!1501010 res!1022091) b!1501007))

(assert (= (and b!1501007 res!1022089) b!1501011))

(assert (= (and b!1501011 res!1022087) b!1501016))

(assert (= (and b!1501016 res!1022085) b!1501008))

(assert (= (and b!1501008 res!1022082) b!1501012))

(assert (= (and b!1501012 res!1022086) b!1501014))

(assert (= (and b!1501014 res!1022088) b!1501006))

(assert (= (and b!1501006 res!1022083) b!1501013))

(declare-fun m!1384201 () Bool)

(assert (=> start!127736 m!1384201))

(declare-fun m!1384203 () Bool)

(assert (=> start!127736 m!1384203))

(declare-fun m!1384205 () Bool)

(assert (=> b!1501007 m!1384205))

(declare-fun m!1384207 () Bool)

(assert (=> b!1501015 m!1384207))

(assert (=> b!1501015 m!1384207))

(declare-fun m!1384209 () Bool)

(assert (=> b!1501015 m!1384209))

(declare-fun m!1384211 () Bool)

(assert (=> b!1501008 m!1384211))

(assert (=> b!1501008 m!1384211))

(declare-fun m!1384213 () Bool)

(assert (=> b!1501008 m!1384213))

(declare-fun m!1384215 () Bool)

(assert (=> b!1501016 m!1384215))

(declare-fun m!1384217 () Bool)

(assert (=> b!1501016 m!1384217))

(declare-fun m!1384219 () Bool)

(assert (=> b!1501016 m!1384219))

(assert (=> b!1501006 m!1384211))

(assert (=> b!1501006 m!1384211))

(declare-fun m!1384221 () Bool)

(assert (=> b!1501006 m!1384221))

(assert (=> b!1501010 m!1384211))

(assert (=> b!1501010 m!1384211))

(declare-fun m!1384223 () Bool)

(assert (=> b!1501010 m!1384223))

(assert (=> b!1501013 m!1384217))

(declare-fun m!1384225 () Bool)

(assert (=> b!1501013 m!1384225))

(assert (=> b!1501013 m!1384225))

(declare-fun m!1384227 () Bool)

(assert (=> b!1501013 m!1384227))

(declare-fun m!1384229 () Bool)

(assert (=> b!1501013 m!1384229))

(declare-fun m!1384231 () Bool)

(assert (=> b!1501011 m!1384231))

(declare-fun m!1384233 () Bool)

(assert (=> b!1501014 m!1384233))

(declare-fun m!1384235 () Bool)

(assert (=> b!1501012 m!1384235))

(assert (=> b!1501012 m!1384211))

(check-sat (not b!1501013) (not b!1501010) (not b!1501015) (not b!1501006) (not b!1501008) (not b!1501014) (not b!1501007) (not start!127736) (not b!1501011))
(check-sat)
