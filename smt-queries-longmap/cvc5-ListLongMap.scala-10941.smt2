; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127938 () Bool)

(assert start!127938)

(declare-fun b!1503236 () Bool)

(declare-fun res!1024305 () Bool)

(declare-fun e!840438 () Bool)

(assert (=> b!1503236 (=> (not res!1024305) (not e!840438))))

(declare-datatypes ((array!100247 0))(
  ( (array!100248 (arr!48381 (Array (_ BitVec 32) (_ BitVec 64))) (size!48933 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100247)

(declare-datatypes ((List!34951 0))(
  ( (Nil!34948) (Cons!34947 (h!36345 (_ BitVec 64)) (t!49637 List!34951)) )
))
(declare-fun arrayNoDuplicates!0 (array!100247 (_ BitVec 32) List!34951) Bool)

(assert (=> b!1503236 (= res!1024305 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34948))))

(declare-fun b!1503237 () Bool)

(declare-fun res!1024310 () Bool)

(assert (=> b!1503237 (=> (not res!1024310) (not e!840438))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503237 (= res!1024310 (not (= (select (arr!48381 a!2850) index!625) (select (arr!48381 a!2850) j!87))))))

(declare-fun res!1024302 () Bool)

(assert (=> start!127938 (=> (not res!1024302) (not e!840438))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127938 (= res!1024302 (validMask!0 mask!2661))))

(assert (=> start!127938 e!840438))

(assert (=> start!127938 true))

(declare-fun array_inv!37614 (array!100247) Bool)

(assert (=> start!127938 (array_inv!37614 a!2850)))

(declare-fun b!1503238 () Bool)

(declare-fun res!1024304 () Bool)

(assert (=> b!1503238 (=> (not res!1024304) (not e!840438))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503238 (= res!1024304 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48933 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48933 a!2850)) (= (select (arr!48381 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48381 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48933 a!2850))))))

(declare-fun b!1503239 () Bool)

(declare-fun res!1024303 () Bool)

(assert (=> b!1503239 (=> (not res!1024303) (not e!840438))))

(declare-datatypes ((SeekEntryResult!12600 0))(
  ( (MissingZero!12600 (index!52792 (_ BitVec 32))) (Found!12600 (index!52793 (_ BitVec 32))) (Intermediate!12600 (undefined!13412 Bool) (index!52794 (_ BitVec 32)) (x!134475 (_ BitVec 32))) (Undefined!12600) (MissingVacant!12600 (index!52795 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100247 (_ BitVec 32)) SeekEntryResult!12600)

(assert (=> b!1503239 (= res!1024303 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48381 a!2850) j!87) a!2850 mask!2661) (Found!12600 j!87)))))

(declare-fun b!1503240 () Bool)

(assert (=> b!1503240 (= e!840438 false)))

(declare-fun lt!653260 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503240 (= lt!653260 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503241 () Bool)

(declare-fun res!1024308 () Bool)

(assert (=> b!1503241 (=> (not res!1024308) (not e!840438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503241 (= res!1024308 (validKeyInArray!0 (select (arr!48381 a!2850) i!996)))))

(declare-fun b!1503242 () Bool)

(declare-fun res!1024306 () Bool)

(assert (=> b!1503242 (=> (not res!1024306) (not e!840438))))

(assert (=> b!1503242 (= res!1024306 (and (= (size!48933 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48933 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48933 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503243 () Bool)

(declare-fun res!1024309 () Bool)

(assert (=> b!1503243 (=> (not res!1024309) (not e!840438))))

(assert (=> b!1503243 (= res!1024309 (validKeyInArray!0 (select (arr!48381 a!2850) j!87)))))

(declare-fun b!1503244 () Bool)

(declare-fun res!1024307 () Bool)

(assert (=> b!1503244 (=> (not res!1024307) (not e!840438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100247 (_ BitVec 32)) Bool)

(assert (=> b!1503244 (= res!1024307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127938 res!1024302) b!1503242))

(assert (= (and b!1503242 res!1024306) b!1503241))

(assert (= (and b!1503241 res!1024308) b!1503243))

(assert (= (and b!1503243 res!1024309) b!1503244))

(assert (= (and b!1503244 res!1024307) b!1503236))

(assert (= (and b!1503236 res!1024305) b!1503238))

(assert (= (and b!1503238 res!1024304) b!1503239))

(assert (= (and b!1503239 res!1024303) b!1503237))

(assert (= (and b!1503237 res!1024310) b!1503240))

(declare-fun m!1385937 () Bool)

(assert (=> b!1503240 m!1385937))

(declare-fun m!1385939 () Bool)

(assert (=> b!1503239 m!1385939))

(assert (=> b!1503239 m!1385939))

(declare-fun m!1385941 () Bool)

(assert (=> b!1503239 m!1385941))

(declare-fun m!1385943 () Bool)

(assert (=> b!1503241 m!1385943))

(assert (=> b!1503241 m!1385943))

(declare-fun m!1385945 () Bool)

(assert (=> b!1503241 m!1385945))

(declare-fun m!1385947 () Bool)

(assert (=> start!127938 m!1385947))

(declare-fun m!1385949 () Bool)

(assert (=> start!127938 m!1385949))

(declare-fun m!1385951 () Bool)

(assert (=> b!1503244 m!1385951))

(declare-fun m!1385953 () Bool)

(assert (=> b!1503237 m!1385953))

(assert (=> b!1503237 m!1385939))

(declare-fun m!1385955 () Bool)

(assert (=> b!1503236 m!1385955))

(declare-fun m!1385957 () Bool)

(assert (=> b!1503238 m!1385957))

(declare-fun m!1385959 () Bool)

(assert (=> b!1503238 m!1385959))

(declare-fun m!1385961 () Bool)

(assert (=> b!1503238 m!1385961))

(assert (=> b!1503243 m!1385939))

(assert (=> b!1503243 m!1385939))

(declare-fun m!1385963 () Bool)

(assert (=> b!1503243 m!1385963))

(push 1)

(assert (not b!1503239))

(assert (not b!1503241))

(assert (not b!1503244))

(assert (not start!127938))

(assert (not b!1503240))

(assert (not b!1503236))

(assert (not b!1503243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

