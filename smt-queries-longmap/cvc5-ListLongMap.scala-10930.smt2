; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127836 () Bool)

(assert start!127836)

(declare-fun res!1023369 () Bool)

(declare-fun e!840131 () Bool)

(assert (=> start!127836 (=> (not res!1023369) (not e!840131))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127836 (= res!1023369 (validMask!0 mask!2661))))

(assert (=> start!127836 e!840131))

(assert (=> start!127836 true))

(declare-datatypes ((array!100178 0))(
  ( (array!100179 (arr!48348 (Array (_ BitVec 32) (_ BitVec 64))) (size!48900 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100178)

(declare-fun array_inv!37581 (array!100178) Bool)

(assert (=> start!127836 (array_inv!37581 a!2850)))

(declare-fun b!1502194 () Bool)

(declare-fun res!1023368 () Bool)

(assert (=> b!1502194 (=> (not res!1023368) (not e!840131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100178 (_ BitVec 32)) Bool)

(assert (=> b!1502194 (= res!1023368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502195 () Bool)

(declare-fun res!1023371 () Bool)

(assert (=> b!1502195 (=> (not res!1023371) (not e!840131))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502195 (= res!1023371 (validKeyInArray!0 (select (arr!48348 a!2850) i!996)))))

(declare-fun b!1502196 () Bool)

(assert (=> b!1502196 (= e!840131 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12567 0))(
  ( (MissingZero!12567 (index!52660 (_ BitVec 32))) (Found!12567 (index!52661 (_ BitVec 32))) (Intermediate!12567 (undefined!13379 Bool) (index!52662 (_ BitVec 32)) (x!134351 (_ BitVec 32))) (Undefined!12567) (MissingVacant!12567 (index!52663 (_ BitVec 32))) )
))
(declare-fun lt!653110 () SeekEntryResult!12567)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100178 (_ BitVec 32)) SeekEntryResult!12567)

(assert (=> b!1502196 (= lt!653110 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48348 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502197 () Bool)

(declare-fun res!1023373 () Bool)

(assert (=> b!1502197 (=> (not res!1023373) (not e!840131))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502197 (= res!1023373 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48900 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48900 a!2850)) (= (select (arr!48348 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48348 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48900 a!2850))))))

(declare-fun b!1502198 () Bool)

(declare-fun res!1023374 () Bool)

(assert (=> b!1502198 (=> (not res!1023374) (not e!840131))))

(declare-datatypes ((List!34918 0))(
  ( (Nil!34915) (Cons!34914 (h!36312 (_ BitVec 64)) (t!49604 List!34918)) )
))
(declare-fun arrayNoDuplicates!0 (array!100178 (_ BitVec 32) List!34918) Bool)

(assert (=> b!1502198 (= res!1023374 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34915))))

(declare-fun b!1502199 () Bool)

(declare-fun res!1023370 () Bool)

(assert (=> b!1502199 (=> (not res!1023370) (not e!840131))))

(assert (=> b!1502199 (= res!1023370 (and (= (size!48900 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48900 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48900 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502200 () Bool)

(declare-fun res!1023372 () Bool)

(assert (=> b!1502200 (=> (not res!1023372) (not e!840131))))

(assert (=> b!1502200 (= res!1023372 (validKeyInArray!0 (select (arr!48348 a!2850) j!87)))))

(assert (= (and start!127836 res!1023369) b!1502199))

(assert (= (and b!1502199 res!1023370) b!1502195))

(assert (= (and b!1502195 res!1023371) b!1502200))

(assert (= (and b!1502200 res!1023372) b!1502194))

(assert (= (and b!1502194 res!1023368) b!1502198))

(assert (= (and b!1502198 res!1023374) b!1502197))

(assert (= (and b!1502197 res!1023373) b!1502196))

(declare-fun m!1384915 () Bool)

(assert (=> b!1502200 m!1384915))

(assert (=> b!1502200 m!1384915))

(declare-fun m!1384917 () Bool)

(assert (=> b!1502200 m!1384917))

(declare-fun m!1384919 () Bool)

(assert (=> start!127836 m!1384919))

(declare-fun m!1384921 () Bool)

(assert (=> start!127836 m!1384921))

(declare-fun m!1384923 () Bool)

(assert (=> b!1502194 m!1384923))

(assert (=> b!1502196 m!1384915))

(assert (=> b!1502196 m!1384915))

(declare-fun m!1384925 () Bool)

(assert (=> b!1502196 m!1384925))

(declare-fun m!1384927 () Bool)

(assert (=> b!1502198 m!1384927))

(declare-fun m!1384929 () Bool)

(assert (=> b!1502195 m!1384929))

(assert (=> b!1502195 m!1384929))

(declare-fun m!1384931 () Bool)

(assert (=> b!1502195 m!1384931))

(declare-fun m!1384933 () Bool)

(assert (=> b!1502197 m!1384933))

(declare-fun m!1384935 () Bool)

(assert (=> b!1502197 m!1384935))

(declare-fun m!1384937 () Bool)

(assert (=> b!1502197 m!1384937))

(push 1)

(assert (not b!1502200))

(assert (not b!1502195))

(assert (not start!127836))

(assert (not b!1502194))

(assert (not b!1502198))

(assert (not b!1502196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

