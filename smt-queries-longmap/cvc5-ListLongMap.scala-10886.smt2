; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127536 () Bool)

(assert start!127536)

(declare-fun b!1498503 () Bool)

(declare-fun res!1019770 () Bool)

(declare-fun e!838925 () Bool)

(assert (=> b!1498503 (=> (not res!1019770) (not e!838925))))

(declare-datatypes ((array!99911 0))(
  ( (array!99912 (arr!48216 (Array (_ BitVec 32) (_ BitVec 64))) (size!48768 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99911)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498503 (= res!1019770 (validKeyInArray!0 (select (arr!48216 a!2850) i!996)))))

(declare-fun b!1498504 () Bool)

(declare-fun res!1019773 () Bool)

(assert (=> b!1498504 (=> (not res!1019773) (not e!838925))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99911 (_ BitVec 32)) Bool)

(assert (=> b!1498504 (= res!1019773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498505 () Bool)

(declare-fun res!1019771 () Bool)

(assert (=> b!1498505 (=> (not res!1019771) (not e!838925))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498505 (= res!1019771 (validKeyInArray!0 (select (arr!48216 a!2850) j!87)))))

(declare-fun b!1498506 () Bool)

(declare-fun res!1019769 () Bool)

(assert (=> b!1498506 (=> (not res!1019769) (not e!838925))))

(assert (=> b!1498506 (= res!1019769 (and (= (size!48768 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48768 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48768 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019774 () Bool)

(assert (=> start!127536 (=> (not res!1019774) (not e!838925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127536 (= res!1019774 (validMask!0 mask!2661))))

(assert (=> start!127536 e!838925))

(assert (=> start!127536 true))

(declare-fun array_inv!37449 (array!99911) Bool)

(assert (=> start!127536 (array_inv!37449 a!2850)))

(declare-fun b!1498507 () Bool)

(declare-fun res!1019767 () Bool)

(assert (=> b!1498507 (=> (not res!1019767) (not e!838925))))

(declare-datatypes ((List!34786 0))(
  ( (Nil!34783) (Cons!34782 (h!36180 (_ BitVec 64)) (t!49472 List!34786)) )
))
(declare-fun arrayNoDuplicates!0 (array!99911 (_ BitVec 32) List!34786) Bool)

(assert (=> b!1498507 (= res!1019767 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34783))))

(declare-fun b!1498508 () Bool)

(declare-fun res!1019772 () Bool)

(assert (=> b!1498508 (=> (not res!1019772) (not e!838925))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1498508 (= res!1019772 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48768 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48768 a!2850)) (= (select (arr!48216 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48216 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48768 a!2850))))))

(declare-fun b!1498509 () Bool)

(assert (=> b!1498509 (= e!838925 (and (= (select (arr!48216 a!2850) index!625) (select (arr!48216 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498510 () Bool)

(declare-fun res!1019768 () Bool)

(assert (=> b!1498510 (=> (not res!1019768) (not e!838925))))

(declare-datatypes ((SeekEntryResult!12447 0))(
  ( (MissingZero!12447 (index!52180 (_ BitVec 32))) (Found!12447 (index!52181 (_ BitVec 32))) (Intermediate!12447 (undefined!13259 Bool) (index!52182 (_ BitVec 32)) (x!133876 (_ BitVec 32))) (Undefined!12447) (MissingVacant!12447 (index!52183 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99911 (_ BitVec 32)) SeekEntryResult!12447)

(assert (=> b!1498510 (= res!1019768 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48216 a!2850) j!87) a!2850 mask!2661) (Found!12447 j!87)))))

(assert (= (and start!127536 res!1019774) b!1498506))

(assert (= (and b!1498506 res!1019769) b!1498503))

(assert (= (and b!1498503 res!1019770) b!1498505))

(assert (= (and b!1498505 res!1019771) b!1498504))

(assert (= (and b!1498504 res!1019773) b!1498507))

(assert (= (and b!1498507 res!1019767) b!1498508))

(assert (= (and b!1498508 res!1019772) b!1498510))

(assert (= (and b!1498510 res!1019768) b!1498509))

(declare-fun m!1381097 () Bool)

(assert (=> b!1498507 m!1381097))

(declare-fun m!1381099 () Bool)

(assert (=> b!1498509 m!1381099))

(declare-fun m!1381101 () Bool)

(assert (=> b!1498509 m!1381101))

(declare-fun m!1381103 () Bool)

(assert (=> b!1498504 m!1381103))

(declare-fun m!1381105 () Bool)

(assert (=> start!127536 m!1381105))

(declare-fun m!1381107 () Bool)

(assert (=> start!127536 m!1381107))

(assert (=> b!1498505 m!1381101))

(assert (=> b!1498505 m!1381101))

(declare-fun m!1381109 () Bool)

(assert (=> b!1498505 m!1381109))

(assert (=> b!1498510 m!1381101))

(assert (=> b!1498510 m!1381101))

(declare-fun m!1381111 () Bool)

(assert (=> b!1498510 m!1381111))

(declare-fun m!1381113 () Bool)

(assert (=> b!1498503 m!1381113))

(assert (=> b!1498503 m!1381113))

(declare-fun m!1381115 () Bool)

(assert (=> b!1498503 m!1381115))

(declare-fun m!1381117 () Bool)

(assert (=> b!1498508 m!1381117))

(declare-fun m!1381119 () Bool)

(assert (=> b!1498508 m!1381119))

(declare-fun m!1381121 () Bool)

(assert (=> b!1498508 m!1381121))

(push 1)

(assert (not b!1498505))

(assert (not b!1498503))

(assert (not b!1498507))

(assert (not b!1498510))

(assert (not start!127536))

(assert (not b!1498504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

