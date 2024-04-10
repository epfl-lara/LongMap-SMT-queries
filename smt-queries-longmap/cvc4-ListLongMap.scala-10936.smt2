; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127954 () Bool)

(assert start!127954)

(declare-fun b!1503147 () Bool)

(declare-fun res!1024026 () Bool)

(declare-fun e!840547 () Bool)

(assert (=> b!1503147 (=> (not res!1024026) (not e!840547))))

(declare-datatypes ((array!100269 0))(
  ( (array!100270 (arr!48391 (Array (_ BitVec 32) (_ BitVec 64))) (size!48941 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100269)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503147 (= res!1024026 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48941 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48941 a!2850)) (= (select (arr!48391 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48391 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48941 a!2850))))))

(declare-fun b!1503148 () Bool)

(declare-fun res!1024025 () Bool)

(assert (=> b!1503148 (=> (not res!1024025) (not e!840547))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503148 (= res!1024025 (not (= (select (arr!48391 a!2850) index!625) (select (arr!48391 a!2850) j!87))))))

(declare-fun b!1503149 () Bool)

(declare-fun res!1024030 () Bool)

(assert (=> b!1503149 (=> (not res!1024030) (not e!840547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503149 (= res!1024030 (validKeyInArray!0 (select (arr!48391 a!2850) i!996)))))

(declare-fun b!1503150 () Bool)

(assert (=> b!1503150 (= e!840547 false)))

(declare-fun lt!653494 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503150 (= lt!653494 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024028 () Bool)

(assert (=> start!127954 (=> (not res!1024028) (not e!840547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127954 (= res!1024028 (validMask!0 mask!2661))))

(assert (=> start!127954 e!840547))

(assert (=> start!127954 true))

(declare-fun array_inv!37419 (array!100269) Bool)

(assert (=> start!127954 (array_inv!37419 a!2850)))

(declare-fun b!1503151 () Bool)

(declare-fun res!1024029 () Bool)

(assert (=> b!1503151 (=> (not res!1024029) (not e!840547))))

(assert (=> b!1503151 (= res!1024029 (and (= (size!48941 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48941 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48941 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503152 () Bool)

(declare-fun res!1024032 () Bool)

(assert (=> b!1503152 (=> (not res!1024032) (not e!840547))))

(assert (=> b!1503152 (= res!1024032 (validKeyInArray!0 (select (arr!48391 a!2850) j!87)))))

(declare-fun b!1503153 () Bool)

(declare-fun res!1024033 () Bool)

(assert (=> b!1503153 (=> (not res!1024033) (not e!840547))))

(declare-datatypes ((SeekEntryResult!12589 0))(
  ( (MissingZero!12589 (index!52748 (_ BitVec 32))) (Found!12589 (index!52749 (_ BitVec 32))) (Intermediate!12589 (undefined!13401 Bool) (index!52750 (_ BitVec 32)) (x!134429 (_ BitVec 32))) (Undefined!12589) (MissingVacant!12589 (index!52751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100269 (_ BitVec 32)) SeekEntryResult!12589)

(assert (=> b!1503153 (= res!1024033 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48391 a!2850) j!87) a!2850 mask!2661) (Found!12589 j!87)))))

(declare-fun b!1503154 () Bool)

(declare-fun res!1024027 () Bool)

(assert (=> b!1503154 (=> (not res!1024027) (not e!840547))))

(declare-datatypes ((List!34883 0))(
  ( (Nil!34880) (Cons!34879 (h!36276 (_ BitVec 64)) (t!49577 List!34883)) )
))
(declare-fun arrayNoDuplicates!0 (array!100269 (_ BitVec 32) List!34883) Bool)

(assert (=> b!1503154 (= res!1024027 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34880))))

(declare-fun b!1503155 () Bool)

(declare-fun res!1024031 () Bool)

(assert (=> b!1503155 (=> (not res!1024031) (not e!840547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100269 (_ BitVec 32)) Bool)

(assert (=> b!1503155 (= res!1024031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127954 res!1024028) b!1503151))

(assert (= (and b!1503151 res!1024029) b!1503149))

(assert (= (and b!1503149 res!1024030) b!1503152))

(assert (= (and b!1503152 res!1024032) b!1503155))

(assert (= (and b!1503155 res!1024031) b!1503154))

(assert (= (and b!1503154 res!1024027) b!1503147))

(assert (= (and b!1503147 res!1024026) b!1503153))

(assert (= (and b!1503153 res!1024033) b!1503148))

(assert (= (and b!1503148 res!1024025) b!1503150))

(declare-fun m!1386387 () Bool)

(assert (=> b!1503154 m!1386387))

(declare-fun m!1386389 () Bool)

(assert (=> b!1503153 m!1386389))

(assert (=> b!1503153 m!1386389))

(declare-fun m!1386391 () Bool)

(assert (=> b!1503153 m!1386391))

(declare-fun m!1386393 () Bool)

(assert (=> b!1503150 m!1386393))

(declare-fun m!1386395 () Bool)

(assert (=> b!1503148 m!1386395))

(assert (=> b!1503148 m!1386389))

(declare-fun m!1386397 () Bool)

(assert (=> b!1503155 m!1386397))

(assert (=> b!1503152 m!1386389))

(assert (=> b!1503152 m!1386389))

(declare-fun m!1386399 () Bool)

(assert (=> b!1503152 m!1386399))

(declare-fun m!1386401 () Bool)

(assert (=> b!1503149 m!1386401))

(assert (=> b!1503149 m!1386401))

(declare-fun m!1386403 () Bool)

(assert (=> b!1503149 m!1386403))

(declare-fun m!1386405 () Bool)

(assert (=> start!127954 m!1386405))

(declare-fun m!1386407 () Bool)

(assert (=> start!127954 m!1386407))

(declare-fun m!1386409 () Bool)

(assert (=> b!1503147 m!1386409))

(declare-fun m!1386411 () Bool)

(assert (=> b!1503147 m!1386411))

(declare-fun m!1386413 () Bool)

(assert (=> b!1503147 m!1386413))

(push 1)

(assert (not b!1503153))

(assert (not b!1503149))

(assert (not b!1503152))

(assert (not b!1503155))

(assert (not b!1503150))

(assert (not start!127954))

(assert (not b!1503154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

