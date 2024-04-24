; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127832 () Bool)

(assert start!127832)

(declare-fun res!1020301 () Bool)

(declare-fun e!840128 () Bool)

(assert (=> start!127832 (=> (not res!1020301) (not e!840128))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127832 (= res!1020301 (validMask!0 mask!2661))))

(assert (=> start!127832 e!840128))

(assert (=> start!127832 true))

(declare-datatypes ((array!100058 0))(
  ( (array!100059 (arr!48285 (Array (_ BitVec 32) (_ BitVec 64))) (size!48836 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100058)

(declare-fun array_inv!37566 (array!100058) Bool)

(assert (=> start!127832 (array_inv!37566 a!2850)))

(declare-fun b!1500319 () Bool)

(declare-fun res!1020298 () Bool)

(assert (=> b!1500319 (=> (not res!1020298) (not e!840128))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500319 (= res!1020298 (and (= (size!48836 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48836 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48836 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500320 () Bool)

(declare-fun res!1020296 () Bool)

(assert (=> b!1500320 (=> (not res!1020296) (not e!840128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100058 (_ BitVec 32)) Bool)

(assert (=> b!1500320 (= res!1020296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500321 () Bool)

(declare-fun res!1020302 () Bool)

(assert (=> b!1500321 (=> (not res!1020302) (not e!840128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500321 (= res!1020302 (validKeyInArray!0 (select (arr!48285 a!2850) i!996)))))

(declare-fun b!1500322 () Bool)

(declare-fun res!1020300 () Bool)

(assert (=> b!1500322 (=> (not res!1020300) (not e!840128))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500322 (= res!1020300 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48836 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48836 a!2850)) (= (select (arr!48285 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48285 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48836 a!2850))))))

(declare-fun b!1500323 () Bool)

(declare-fun res!1020297 () Bool)

(assert (=> b!1500323 (=> (not res!1020297) (not e!840128))))

(assert (=> b!1500323 (= res!1020297 (validKeyInArray!0 (select (arr!48285 a!2850) j!87)))))

(declare-fun b!1500324 () Bool)

(assert (=> b!1500324 (= e!840128 false)))

(declare-datatypes ((SeekEntryResult!12388 0))(
  ( (MissingZero!12388 (index!51944 (_ BitVec 32))) (Found!12388 (index!51945 (_ BitVec 32))) (Intermediate!12388 (undefined!13200 Bool) (index!51946 (_ BitVec 32)) (x!133832 (_ BitVec 32))) (Undefined!12388) (MissingVacant!12388 (index!51947 (_ BitVec 32))) )
))
(declare-fun lt!653298 () SeekEntryResult!12388)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100058 (_ BitVec 32)) SeekEntryResult!12388)

(assert (=> b!1500324 (= lt!653298 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48285 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500325 () Bool)

(declare-fun res!1020299 () Bool)

(assert (=> b!1500325 (=> (not res!1020299) (not e!840128))))

(declare-datatypes ((List!34764 0))(
  ( (Nil!34761) (Cons!34760 (h!36172 (_ BitVec 64)) (t!49450 List!34764)) )
))
(declare-fun arrayNoDuplicates!0 (array!100058 (_ BitVec 32) List!34764) Bool)

(assert (=> b!1500325 (= res!1020299 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34761))))

(assert (= (and start!127832 res!1020301) b!1500319))

(assert (= (and b!1500319 res!1020298) b!1500321))

(assert (= (and b!1500321 res!1020302) b!1500323))

(assert (= (and b!1500323 res!1020297) b!1500320))

(assert (= (and b!1500320 res!1020296) b!1500325))

(assert (= (and b!1500325 res!1020299) b!1500322))

(assert (= (and b!1500322 res!1020300) b!1500324))

(declare-fun m!1383467 () Bool)

(assert (=> b!1500320 m!1383467))

(declare-fun m!1383469 () Bool)

(assert (=> b!1500324 m!1383469))

(assert (=> b!1500324 m!1383469))

(declare-fun m!1383471 () Bool)

(assert (=> b!1500324 m!1383471))

(declare-fun m!1383473 () Bool)

(assert (=> b!1500322 m!1383473))

(declare-fun m!1383475 () Bool)

(assert (=> b!1500322 m!1383475))

(declare-fun m!1383477 () Bool)

(assert (=> b!1500322 m!1383477))

(declare-fun m!1383479 () Bool)

(assert (=> b!1500321 m!1383479))

(assert (=> b!1500321 m!1383479))

(declare-fun m!1383481 () Bool)

(assert (=> b!1500321 m!1383481))

(declare-fun m!1383483 () Bool)

(assert (=> start!127832 m!1383483))

(declare-fun m!1383485 () Bool)

(assert (=> start!127832 m!1383485))

(assert (=> b!1500323 m!1383469))

(assert (=> b!1500323 m!1383469))

(declare-fun m!1383487 () Bool)

(assert (=> b!1500323 m!1383487))

(declare-fun m!1383489 () Bool)

(assert (=> b!1500325 m!1383489))

(push 1)

(assert (not b!1500321))

(assert (not start!127832))

(assert (not b!1500323))

(assert (not b!1500325))

(assert (not b!1500324))

(assert (not b!1500320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

