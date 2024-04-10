; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127816 () Bool)

(assert start!127816)

(declare-fun b!1502051 () Bool)

(declare-fun res!1023127 () Bool)

(declare-fun e!840150 () Bool)

(assert (=> b!1502051 (=> (not res!1023127) (not e!840150))))

(declare-datatypes ((array!100197 0))(
  ( (array!100198 (arr!48358 (Array (_ BitVec 32) (_ BitVec 64))) (size!48908 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100197)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502051 (= res!1023127 (validKeyInArray!0 (select (arr!48358 a!2850) i!996)))))

(declare-fun b!1502052 () Bool)

(declare-fun res!1023131 () Bool)

(assert (=> b!1502052 (=> (not res!1023131) (not e!840150))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502052 (= res!1023131 (validKeyInArray!0 (select (arr!48358 a!2850) j!87)))))

(declare-fun b!1502053 () Bool)

(assert (=> b!1502053 (= e!840150 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12556 0))(
  ( (MissingZero!12556 (index!52616 (_ BitVec 32))) (Found!12556 (index!52617 (_ BitVec 32))) (Intermediate!12556 (undefined!13368 Bool) (index!52618 (_ BitVec 32)) (x!134302 (_ BitVec 32))) (Undefined!12556) (MissingVacant!12556 (index!52619 (_ BitVec 32))) )
))
(declare-fun lt!653308 () SeekEntryResult!12556)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100197 (_ BitVec 32)) SeekEntryResult!12556)

(assert (=> b!1502053 (= lt!653308 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48358 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502054 () Bool)

(declare-fun res!1023128 () Bool)

(assert (=> b!1502054 (=> (not res!1023128) (not e!840150))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502054 (= res!1023128 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48908 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48908 a!2850)) (= (select (arr!48358 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48358 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48908 a!2850))))))

(declare-fun b!1502055 () Bool)

(declare-fun res!1023130 () Bool)

(assert (=> b!1502055 (=> (not res!1023130) (not e!840150))))

(declare-datatypes ((List!34850 0))(
  ( (Nil!34847) (Cons!34846 (h!36243 (_ BitVec 64)) (t!49544 List!34850)) )
))
(declare-fun arrayNoDuplicates!0 (array!100197 (_ BitVec 32) List!34850) Bool)

(assert (=> b!1502055 (= res!1023130 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34847))))

(declare-fun b!1502056 () Bool)

(declare-fun res!1023132 () Bool)

(assert (=> b!1502056 (=> (not res!1023132) (not e!840150))))

(assert (=> b!1502056 (= res!1023132 (and (= (size!48908 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48908 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48908 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1023129 () Bool)

(assert (=> start!127816 (=> (not res!1023129) (not e!840150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127816 (= res!1023129 (validMask!0 mask!2661))))

(assert (=> start!127816 e!840150))

(assert (=> start!127816 true))

(declare-fun array_inv!37386 (array!100197) Bool)

(assert (=> start!127816 (array_inv!37386 a!2850)))

(declare-fun b!1502057 () Bool)

(declare-fun res!1023133 () Bool)

(assert (=> b!1502057 (=> (not res!1023133) (not e!840150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100197 (_ BitVec 32)) Bool)

(assert (=> b!1502057 (= res!1023133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127816 res!1023129) b!1502056))

(assert (= (and b!1502056 res!1023132) b!1502051))

(assert (= (and b!1502051 res!1023127) b!1502052))

(assert (= (and b!1502052 res!1023131) b!1502057))

(assert (= (and b!1502057 res!1023133) b!1502055))

(assert (= (and b!1502055 res!1023130) b!1502054))

(assert (= (and b!1502054 res!1023128) b!1502053))

(declare-fun m!1385347 () Bool)

(assert (=> b!1502052 m!1385347))

(assert (=> b!1502052 m!1385347))

(declare-fun m!1385349 () Bool)

(assert (=> b!1502052 m!1385349))

(declare-fun m!1385351 () Bool)

(assert (=> b!1502055 m!1385351))

(declare-fun m!1385353 () Bool)

(assert (=> b!1502051 m!1385353))

(assert (=> b!1502051 m!1385353))

(declare-fun m!1385355 () Bool)

(assert (=> b!1502051 m!1385355))

(declare-fun m!1385357 () Bool)

(assert (=> b!1502054 m!1385357))

(declare-fun m!1385359 () Bool)

(assert (=> b!1502054 m!1385359))

(declare-fun m!1385361 () Bool)

(assert (=> b!1502054 m!1385361))

(declare-fun m!1385363 () Bool)

(assert (=> start!127816 m!1385363))

(declare-fun m!1385365 () Bool)

(assert (=> start!127816 m!1385365))

(assert (=> b!1502053 m!1385347))

(assert (=> b!1502053 m!1385347))

(declare-fun m!1385367 () Bool)

(assert (=> b!1502053 m!1385367))

(declare-fun m!1385369 () Bool)

(assert (=> b!1502057 m!1385369))

(push 1)

(assert (not b!1502053))

(assert (not b!1502051))

(assert (not b!1502055))

(assert (not b!1502052))

(assert (not start!127816))

(assert (not b!1502057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

