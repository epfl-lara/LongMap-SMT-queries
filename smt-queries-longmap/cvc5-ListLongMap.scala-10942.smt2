; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127944 () Bool)

(assert start!127944)

(declare-fun b!1503317 () Bool)

(declare-fun res!1024390 () Bool)

(declare-fun e!840456 () Bool)

(assert (=> b!1503317 (=> (not res!1024390) (not e!840456))))

(declare-datatypes ((array!100253 0))(
  ( (array!100254 (arr!48384 (Array (_ BitVec 32) (_ BitVec 64))) (size!48936 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100253)

(declare-datatypes ((List!34954 0))(
  ( (Nil!34951) (Cons!34950 (h!36348 (_ BitVec 64)) (t!49640 List!34954)) )
))
(declare-fun arrayNoDuplicates!0 (array!100253 (_ BitVec 32) List!34954) Bool)

(assert (=> b!1503317 (= res!1024390 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34951))))

(declare-fun b!1503318 () Bool)

(declare-fun res!1024389 () Bool)

(assert (=> b!1503318 (=> (not res!1024389) (not e!840456))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503318 (= res!1024389 (validKeyInArray!0 (select (arr!48384 a!2850) i!996)))))

(declare-fun b!1503319 () Bool)

(declare-fun res!1024384 () Bool)

(assert (=> b!1503319 (=> (not res!1024384) (not e!840456))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503319 (= res!1024384 (validKeyInArray!0 (select (arr!48384 a!2850) j!87)))))

(declare-fun b!1503320 () Bool)

(declare-fun res!1024386 () Bool)

(assert (=> b!1503320 (=> (not res!1024386) (not e!840456))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100253 (_ BitVec 32)) Bool)

(assert (=> b!1503320 (= res!1024386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503321 () Bool)

(assert (=> b!1503321 (= e!840456 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653269 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503321 (= lt!653269 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024388 () Bool)

(assert (=> start!127944 (=> (not res!1024388) (not e!840456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127944 (= res!1024388 (validMask!0 mask!2661))))

(assert (=> start!127944 e!840456))

(assert (=> start!127944 true))

(declare-fun array_inv!37617 (array!100253) Bool)

(assert (=> start!127944 (array_inv!37617 a!2850)))

(declare-fun b!1503322 () Bool)

(declare-fun res!1024385 () Bool)

(assert (=> b!1503322 (=> (not res!1024385) (not e!840456))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12603 0))(
  ( (MissingZero!12603 (index!52804 (_ BitVec 32))) (Found!12603 (index!52805 (_ BitVec 32))) (Intermediate!12603 (undefined!13415 Bool) (index!52806 (_ BitVec 32)) (x!134486 (_ BitVec 32))) (Undefined!12603) (MissingVacant!12603 (index!52807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100253 (_ BitVec 32)) SeekEntryResult!12603)

(assert (=> b!1503322 (= res!1024385 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48384 a!2850) j!87) a!2850 mask!2661) (Found!12603 j!87)))))

(declare-fun b!1503323 () Bool)

(declare-fun res!1024391 () Bool)

(assert (=> b!1503323 (=> (not res!1024391) (not e!840456))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503323 (= res!1024391 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48936 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48936 a!2850)) (= (select (arr!48384 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48384 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48936 a!2850))))))

(declare-fun b!1503324 () Bool)

(declare-fun res!1024387 () Bool)

(assert (=> b!1503324 (=> (not res!1024387) (not e!840456))))

(assert (=> b!1503324 (= res!1024387 (not (= (select (arr!48384 a!2850) index!625) (select (arr!48384 a!2850) j!87))))))

(declare-fun b!1503325 () Bool)

(declare-fun res!1024383 () Bool)

(assert (=> b!1503325 (=> (not res!1024383) (not e!840456))))

(assert (=> b!1503325 (= res!1024383 (and (= (size!48936 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48936 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48936 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127944 res!1024388) b!1503325))

(assert (= (and b!1503325 res!1024383) b!1503318))

(assert (= (and b!1503318 res!1024389) b!1503319))

(assert (= (and b!1503319 res!1024384) b!1503320))

(assert (= (and b!1503320 res!1024386) b!1503317))

(assert (= (and b!1503317 res!1024390) b!1503323))

(assert (= (and b!1503323 res!1024391) b!1503322))

(assert (= (and b!1503322 res!1024385) b!1503324))

(assert (= (and b!1503324 res!1024387) b!1503321))

(declare-fun m!1386021 () Bool)

(assert (=> b!1503323 m!1386021))

(declare-fun m!1386023 () Bool)

(assert (=> b!1503323 m!1386023))

(declare-fun m!1386025 () Bool)

(assert (=> b!1503323 m!1386025))

(declare-fun m!1386027 () Bool)

(assert (=> start!127944 m!1386027))

(declare-fun m!1386029 () Bool)

(assert (=> start!127944 m!1386029))

(declare-fun m!1386031 () Bool)

(assert (=> b!1503321 m!1386031))

(declare-fun m!1386033 () Bool)

(assert (=> b!1503322 m!1386033))

(assert (=> b!1503322 m!1386033))

(declare-fun m!1386035 () Bool)

(assert (=> b!1503322 m!1386035))

(declare-fun m!1386037 () Bool)

(assert (=> b!1503324 m!1386037))

(assert (=> b!1503324 m!1386033))

(declare-fun m!1386039 () Bool)

(assert (=> b!1503320 m!1386039))

(declare-fun m!1386041 () Bool)

(assert (=> b!1503318 m!1386041))

(assert (=> b!1503318 m!1386041))

(declare-fun m!1386043 () Bool)

(assert (=> b!1503318 m!1386043))

(declare-fun m!1386045 () Bool)

(assert (=> b!1503317 m!1386045))

(assert (=> b!1503319 m!1386033))

(assert (=> b!1503319 m!1386033))

(declare-fun m!1386047 () Bool)

(assert (=> b!1503319 m!1386047))

(push 1)

(assert (not b!1503318))

(assert (not b!1503320))

(assert (not b!1503321))

(assert (not b!1503317))

(assert (not b!1503319))

(assert (not b!1503322))

(assert (not start!127944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

