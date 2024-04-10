; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127608 () Bool)

(assert start!127608)

(declare-fun res!1020199 () Bool)

(declare-fun e!839202 () Bool)

(assert (=> start!127608 (=> (not res!1020199) (not e!839202))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127608 (= res!1020199 (validMask!0 mask!2661))))

(assert (=> start!127608 e!839202))

(assert (=> start!127608 true))

(declare-datatypes ((array!99989 0))(
  ( (array!99990 (arr!48254 (Array (_ BitVec 32) (_ BitVec 64))) (size!48804 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99989)

(declare-fun array_inv!37282 (array!99989) Bool)

(assert (=> start!127608 (array_inv!37282 a!2850)))

(declare-fun b!1499122 () Bool)

(declare-fun res!1020202 () Bool)

(assert (=> b!1499122 (=> (not res!1020202) (not e!839202))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499122 (= res!1020202 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48804 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48804 a!2850)) (= (select (arr!48254 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48254 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48804 a!2850))))))

(declare-fun b!1499123 () Bool)

(declare-fun res!1020198 () Bool)

(assert (=> b!1499123 (=> (not res!1020198) (not e!839202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499123 (= res!1020198 (validKeyInArray!0 (select (arr!48254 a!2850) i!996)))))

(declare-fun b!1499124 () Bool)

(declare-fun res!1020203 () Bool)

(assert (=> b!1499124 (=> (not res!1020203) (not e!839202))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499124 (= res!1020203 (validKeyInArray!0 (select (arr!48254 a!2850) j!87)))))

(declare-fun b!1499125 () Bool)

(declare-fun res!1020205 () Bool)

(assert (=> b!1499125 (=> (not res!1020205) (not e!839202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99989 (_ BitVec 32)) Bool)

(assert (=> b!1499125 (= res!1020205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499126 () Bool)

(declare-fun res!1020200 () Bool)

(assert (=> b!1499126 (=> (not res!1020200) (not e!839202))))

(assert (=> b!1499126 (= res!1020200 (and (= (size!48804 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48804 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48804 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499127 () Bool)

(declare-fun res!1020204 () Bool)

(assert (=> b!1499127 (=> (not res!1020204) (not e!839202))))

(declare-datatypes ((SeekEntryResult!12464 0))(
  ( (MissingZero!12464 (index!52248 (_ BitVec 32))) (Found!12464 (index!52249 (_ BitVec 32))) (Intermediate!12464 (undefined!13276 Bool) (index!52250 (_ BitVec 32)) (x!133938 (_ BitVec 32))) (Undefined!12464) (MissingVacant!12464 (index!52251 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99989 (_ BitVec 32)) SeekEntryResult!12464)

(assert (=> b!1499127 (= res!1020204 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48254 a!2850) j!87) a!2850 mask!2661) (Found!12464 j!87)))))

(declare-fun b!1499128 () Bool)

(declare-fun res!1020201 () Bool)

(assert (=> b!1499128 (=> (not res!1020201) (not e!839202))))

(declare-datatypes ((List!34746 0))(
  ( (Nil!34743) (Cons!34742 (h!36139 (_ BitVec 64)) (t!49440 List!34746)) )
))
(declare-fun arrayNoDuplicates!0 (array!99989 (_ BitVec 32) List!34746) Bool)

(assert (=> b!1499128 (= res!1020201 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34743))))

(declare-fun b!1499129 () Bool)

(assert (=> b!1499129 (= e!839202 (and (not (= (select (arr!48254 a!2850) index!625) (select (arr!48254 a!2850) j!87))) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (= (and start!127608 res!1020199) b!1499126))

(assert (= (and b!1499126 res!1020200) b!1499123))

(assert (= (and b!1499123 res!1020198) b!1499124))

(assert (= (and b!1499124 res!1020203) b!1499125))

(assert (= (and b!1499125 res!1020205) b!1499128))

(assert (= (and b!1499128 res!1020201) b!1499122))

(assert (= (and b!1499122 res!1020202) b!1499127))

(assert (= (and b!1499127 res!1020204) b!1499129))

(declare-fun m!1382305 () Bool)

(assert (=> b!1499127 m!1382305))

(assert (=> b!1499127 m!1382305))

(declare-fun m!1382307 () Bool)

(assert (=> b!1499127 m!1382307))

(declare-fun m!1382309 () Bool)

(assert (=> b!1499122 m!1382309))

(declare-fun m!1382311 () Bool)

(assert (=> b!1499122 m!1382311))

(declare-fun m!1382313 () Bool)

(assert (=> b!1499122 m!1382313))

(assert (=> b!1499124 m!1382305))

(assert (=> b!1499124 m!1382305))

(declare-fun m!1382315 () Bool)

(assert (=> b!1499124 m!1382315))

(declare-fun m!1382317 () Bool)

(assert (=> b!1499123 m!1382317))

(assert (=> b!1499123 m!1382317))

(declare-fun m!1382319 () Bool)

(assert (=> b!1499123 m!1382319))

(declare-fun m!1382321 () Bool)

(assert (=> b!1499125 m!1382321))

(declare-fun m!1382323 () Bool)

(assert (=> start!127608 m!1382323))

(declare-fun m!1382325 () Bool)

(assert (=> start!127608 m!1382325))

(declare-fun m!1382327 () Bool)

(assert (=> b!1499129 m!1382327))

(assert (=> b!1499129 m!1382305))

(declare-fun m!1382329 () Bool)

(assert (=> b!1499128 m!1382329))

(push 1)

(assert (not b!1499125))

(assert (not b!1499124))

(assert (not b!1499128))

(assert (not b!1499127))

(assert (not b!1499123))

(assert (not start!127608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

