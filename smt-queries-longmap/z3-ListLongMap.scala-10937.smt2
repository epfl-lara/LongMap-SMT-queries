; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127958 () Bool)

(assert start!127958)

(declare-fun b!1503201 () Bool)

(declare-fun res!1024081 () Bool)

(declare-fun e!840559 () Bool)

(assert (=> b!1503201 (=> (not res!1024081) (not e!840559))))

(declare-datatypes ((array!100273 0))(
  ( (array!100274 (arr!48393 (Array (_ BitVec 32) (_ BitVec 64))) (size!48943 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100273)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503201 (= res!1024081 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48943 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48943 a!2850)) (= (select (arr!48393 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48393 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48943 a!2850))))))

(declare-fun b!1503202 () Bool)

(declare-fun res!1024082 () Bool)

(assert (=> b!1503202 (=> (not res!1024082) (not e!840559))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12591 0))(
  ( (MissingZero!12591 (index!52756 (_ BitVec 32))) (Found!12591 (index!52757 (_ BitVec 32))) (Intermediate!12591 (undefined!13403 Bool) (index!52758 (_ BitVec 32)) (x!134439 (_ BitVec 32))) (Undefined!12591) (MissingVacant!12591 (index!52759 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100273 (_ BitVec 32)) SeekEntryResult!12591)

(assert (=> b!1503202 (= res!1024082 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48393 a!2850) j!87) a!2850 mask!2661) (Found!12591 j!87)))))

(declare-fun b!1503203 () Bool)

(declare-fun res!1024079 () Bool)

(assert (=> b!1503203 (=> (not res!1024079) (not e!840559))))

(assert (=> b!1503203 (= res!1024079 (and (= (size!48943 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48943 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48943 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503205 () Bool)

(declare-fun res!1024084 () Bool)

(assert (=> b!1503205 (=> (not res!1024084) (not e!840559))))

(assert (=> b!1503205 (= res!1024084 (not (= (select (arr!48393 a!2850) index!625) (select (arr!48393 a!2850) j!87))))))

(declare-fun b!1503206 () Bool)

(declare-fun res!1024080 () Bool)

(assert (=> b!1503206 (=> (not res!1024080) (not e!840559))))

(declare-datatypes ((List!34885 0))(
  ( (Nil!34882) (Cons!34881 (h!36278 (_ BitVec 64)) (t!49579 List!34885)) )
))
(declare-fun arrayNoDuplicates!0 (array!100273 (_ BitVec 32) List!34885) Bool)

(assert (=> b!1503206 (= res!1024080 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34882))))

(declare-fun b!1503207 () Bool)

(assert (=> b!1503207 (= e!840559 false)))

(declare-fun lt!653500 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503207 (= lt!653500 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503204 () Bool)

(declare-fun res!1024085 () Bool)

(assert (=> b!1503204 (=> (not res!1024085) (not e!840559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503204 (= res!1024085 (validKeyInArray!0 (select (arr!48393 a!2850) j!87)))))

(declare-fun res!1024086 () Bool)

(assert (=> start!127958 (=> (not res!1024086) (not e!840559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127958 (= res!1024086 (validMask!0 mask!2661))))

(assert (=> start!127958 e!840559))

(assert (=> start!127958 true))

(declare-fun array_inv!37421 (array!100273) Bool)

(assert (=> start!127958 (array_inv!37421 a!2850)))

(declare-fun b!1503208 () Bool)

(declare-fun res!1024087 () Bool)

(assert (=> b!1503208 (=> (not res!1024087) (not e!840559))))

(assert (=> b!1503208 (= res!1024087 (validKeyInArray!0 (select (arr!48393 a!2850) i!996)))))

(declare-fun b!1503209 () Bool)

(declare-fun res!1024083 () Bool)

(assert (=> b!1503209 (=> (not res!1024083) (not e!840559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100273 (_ BitVec 32)) Bool)

(assert (=> b!1503209 (= res!1024083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127958 res!1024086) b!1503203))

(assert (= (and b!1503203 res!1024079) b!1503208))

(assert (= (and b!1503208 res!1024087) b!1503204))

(assert (= (and b!1503204 res!1024085) b!1503209))

(assert (= (and b!1503209 res!1024083) b!1503206))

(assert (= (and b!1503206 res!1024080) b!1503201))

(assert (= (and b!1503201 res!1024081) b!1503202))

(assert (= (and b!1503202 res!1024082) b!1503205))

(assert (= (and b!1503205 res!1024084) b!1503207))

(declare-fun m!1386443 () Bool)

(assert (=> b!1503209 m!1386443))

(declare-fun m!1386445 () Bool)

(assert (=> b!1503202 m!1386445))

(assert (=> b!1503202 m!1386445))

(declare-fun m!1386447 () Bool)

(assert (=> b!1503202 m!1386447))

(declare-fun m!1386449 () Bool)

(assert (=> start!127958 m!1386449))

(declare-fun m!1386451 () Bool)

(assert (=> start!127958 m!1386451))

(declare-fun m!1386453 () Bool)

(assert (=> b!1503205 m!1386453))

(assert (=> b!1503205 m!1386445))

(assert (=> b!1503204 m!1386445))

(assert (=> b!1503204 m!1386445))

(declare-fun m!1386455 () Bool)

(assert (=> b!1503204 m!1386455))

(declare-fun m!1386457 () Bool)

(assert (=> b!1503206 m!1386457))

(declare-fun m!1386459 () Bool)

(assert (=> b!1503208 m!1386459))

(assert (=> b!1503208 m!1386459))

(declare-fun m!1386461 () Bool)

(assert (=> b!1503208 m!1386461))

(declare-fun m!1386463 () Bool)

(assert (=> b!1503201 m!1386463))

(declare-fun m!1386465 () Bool)

(assert (=> b!1503201 m!1386465))

(declare-fun m!1386467 () Bool)

(assert (=> b!1503201 m!1386467))

(declare-fun m!1386469 () Bool)

(assert (=> b!1503207 m!1386469))

(check-sat (not b!1503209) (not b!1503208) (not b!1503204) (not start!127958) (not b!1503206) (not b!1503202) (not b!1503207))
