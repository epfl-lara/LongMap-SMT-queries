; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127554 () Bool)

(assert start!127554)

(declare-fun b!1498501 () Bool)

(declare-fun res!1019578 () Bool)

(declare-fun e!839040 () Bool)

(assert (=> b!1498501 (=> (not res!1019578) (not e!839040))))

(declare-datatypes ((array!99935 0))(
  ( (array!99936 (arr!48227 (Array (_ BitVec 32) (_ BitVec 64))) (size!48777 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99935)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498501 (= res!1019578 (validKeyInArray!0 (select (arr!48227 a!2850) i!996)))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun b!1498502 () Bool)

(assert (=> b!1498502 (= e!839040 (and (= (select (arr!48227 a!2850) index!625) (select (arr!48227 a!2850) j!87)) (= j!87 index!625) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1498503 () Bool)

(declare-fun res!1019583 () Bool)

(assert (=> b!1498503 (=> (not res!1019583) (not e!839040))))

(assert (=> b!1498503 (= res!1019583 (and (= (size!48777 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48777 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48777 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019581 () Bool)

(assert (=> start!127554 (=> (not res!1019581) (not e!839040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127554 (= res!1019581 (validMask!0 mask!2661))))

(assert (=> start!127554 e!839040))

(assert (=> start!127554 true))

(declare-fun array_inv!37255 (array!99935) Bool)

(assert (=> start!127554 (array_inv!37255 a!2850)))

(declare-fun b!1498504 () Bool)

(declare-fun res!1019579 () Bool)

(assert (=> b!1498504 (=> (not res!1019579) (not e!839040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99935 (_ BitVec 32)) Bool)

(assert (=> b!1498504 (= res!1019579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498505 () Bool)

(declare-fun res!1019577 () Bool)

(assert (=> b!1498505 (=> (not res!1019577) (not e!839040))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1498505 (= res!1019577 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48777 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48777 a!2850)) (= (select (arr!48227 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48227 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48777 a!2850))))))

(declare-fun b!1498506 () Bool)

(declare-fun res!1019580 () Bool)

(assert (=> b!1498506 (=> (not res!1019580) (not e!839040))))

(declare-datatypes ((SeekEntryResult!12437 0))(
  ( (MissingZero!12437 (index!52140 (_ BitVec 32))) (Found!12437 (index!52141 (_ BitVec 32))) (Intermediate!12437 (undefined!13249 Bool) (index!52142 (_ BitVec 32)) (x!133839 (_ BitVec 32))) (Undefined!12437) (MissingVacant!12437 (index!52143 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99935 (_ BitVec 32)) SeekEntryResult!12437)

(assert (=> b!1498506 (= res!1019580 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48227 a!2850) j!87) a!2850 mask!2661) (Found!12437 j!87)))))

(declare-fun b!1498507 () Bool)

(declare-fun res!1019582 () Bool)

(assert (=> b!1498507 (=> (not res!1019582) (not e!839040))))

(declare-datatypes ((List!34719 0))(
  ( (Nil!34716) (Cons!34715 (h!36112 (_ BitVec 64)) (t!49413 List!34719)) )
))
(declare-fun arrayNoDuplicates!0 (array!99935 (_ BitVec 32) List!34719) Bool)

(assert (=> b!1498507 (= res!1019582 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34716))))

(declare-fun b!1498508 () Bool)

(declare-fun res!1019584 () Bool)

(assert (=> b!1498508 (=> (not res!1019584) (not e!839040))))

(assert (=> b!1498508 (= res!1019584 (validKeyInArray!0 (select (arr!48227 a!2850) j!87)))))

(assert (= (and start!127554 res!1019581) b!1498503))

(assert (= (and b!1498503 res!1019583) b!1498501))

(assert (= (and b!1498501 res!1019578) b!1498508))

(assert (= (and b!1498508 res!1019584) b!1498504))

(assert (= (and b!1498504 res!1019579) b!1498507))

(assert (= (and b!1498507 res!1019582) b!1498505))

(assert (= (and b!1498505 res!1019577) b!1498506))

(assert (= (and b!1498506 res!1019580) b!1498502))

(declare-fun m!1381615 () Bool)

(assert (=> b!1498505 m!1381615))

(declare-fun m!1381617 () Bool)

(assert (=> b!1498505 m!1381617))

(declare-fun m!1381619 () Bool)

(assert (=> b!1498505 m!1381619))

(declare-fun m!1381621 () Bool)

(assert (=> b!1498506 m!1381621))

(assert (=> b!1498506 m!1381621))

(declare-fun m!1381623 () Bool)

(assert (=> b!1498506 m!1381623))

(assert (=> b!1498508 m!1381621))

(assert (=> b!1498508 m!1381621))

(declare-fun m!1381625 () Bool)

(assert (=> b!1498508 m!1381625))

(declare-fun m!1381627 () Bool)

(assert (=> b!1498501 m!1381627))

(assert (=> b!1498501 m!1381627))

(declare-fun m!1381629 () Bool)

(assert (=> b!1498501 m!1381629))

(declare-fun m!1381631 () Bool)

(assert (=> b!1498502 m!1381631))

(assert (=> b!1498502 m!1381621))

(declare-fun m!1381633 () Bool)

(assert (=> start!127554 m!1381633))

(declare-fun m!1381635 () Bool)

(assert (=> start!127554 m!1381635))

(declare-fun m!1381637 () Bool)

(assert (=> b!1498504 m!1381637))

(declare-fun m!1381639 () Bool)

(assert (=> b!1498507 m!1381639))

(push 1)

(assert (not b!1498508))

(assert (not b!1498504))

(assert (not b!1498501))

(assert (not b!1498506))

(assert (not b!1498507))

