; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127544 () Bool)

(assert start!127544)

(declare-fun b!1498592 () Bool)

(declare-fun res!1019859 () Bool)

(declare-fun e!838949 () Bool)

(assert (=> b!1498592 (=> (not res!1019859) (not e!838949))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99919 0))(
  ( (array!99920 (arr!48220 (Array (_ BitVec 32) (_ BitVec 64))) (size!48772 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99919)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498592 (= res!1019859 (and (= (size!48772 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48772 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48772 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498593 () Bool)

(declare-fun res!1019862 () Bool)

(assert (=> b!1498593 (=> (not res!1019862) (not e!838949))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498593 (= res!1019862 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48772 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48772 a!2850)) (= (select (arr!48220 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48220 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48772 a!2850))))))

(declare-fun b!1498594 () Bool)

(declare-fun res!1019861 () Bool)

(assert (=> b!1498594 (=> (not res!1019861) (not e!838949))))

(declare-datatypes ((List!34790 0))(
  ( (Nil!34787) (Cons!34786 (h!36184 (_ BitVec 64)) (t!49476 List!34790)) )
))
(declare-fun arrayNoDuplicates!0 (array!99919 (_ BitVec 32) List!34790) Bool)

(assert (=> b!1498594 (= res!1019861 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34787))))

(declare-fun b!1498595 () Bool)

(declare-fun res!1019857 () Bool)

(assert (=> b!1498595 (=> (not res!1019857) (not e!838949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99919 (_ BitVec 32)) Bool)

(assert (=> b!1498595 (= res!1019857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019860 () Bool)

(assert (=> start!127544 (=> (not res!1019860) (not e!838949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127544 (= res!1019860 (validMask!0 mask!2661))))

(assert (=> start!127544 e!838949))

(assert (=> start!127544 true))

(declare-fun array_inv!37453 (array!99919) Bool)

(assert (=> start!127544 (array_inv!37453 a!2850)))

(declare-fun b!1498596 () Bool)

(declare-fun res!1019856 () Bool)

(assert (=> b!1498596 (=> (not res!1019856) (not e!838949))))

(assert (=> b!1498596 (= res!1019856 (and (= (select (arr!48220 a!2850) index!625) (select (arr!48220 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498597 () Bool)

(declare-fun res!1019863 () Bool)

(assert (=> b!1498597 (=> (not res!1019863) (not e!838949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498597 (= res!1019863 (validKeyInArray!0 (select (arr!48220 a!2850) i!996)))))

(declare-fun b!1498598 () Bool)

(declare-fun res!1019864 () Bool)

(assert (=> b!1498598 (=> (not res!1019864) (not e!838949))))

(assert (=> b!1498598 (= res!1019864 (validKeyInArray!0 (select (arr!48220 a!2850) j!87)))))

(declare-fun b!1498599 () Bool)

(declare-fun res!1019858 () Bool)

(assert (=> b!1498599 (=> (not res!1019858) (not e!838949))))

(declare-datatypes ((SeekEntryResult!12451 0))(
  ( (MissingZero!12451 (index!52196 (_ BitVec 32))) (Found!12451 (index!52197 (_ BitVec 32))) (Intermediate!12451 (undefined!13263 Bool) (index!52198 (_ BitVec 32)) (x!133896 (_ BitVec 32))) (Undefined!12451) (MissingVacant!12451 (index!52199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99919 (_ BitVec 32)) SeekEntryResult!12451)

(assert (=> b!1498599 (= res!1019858 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48220 a!2850) j!87) a!2850 mask!2661) (Found!12451 j!87)))))

(declare-fun b!1498600 () Bool)

(assert (=> b!1498600 (= e!838949 (not (validKeyInArray!0 (select (store (arr!48220 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))))

(assert (= (and start!127544 res!1019860) b!1498592))

(assert (= (and b!1498592 res!1019859) b!1498597))

(assert (= (and b!1498597 res!1019863) b!1498598))

(assert (= (and b!1498598 res!1019864) b!1498595))

(assert (= (and b!1498595 res!1019857) b!1498594))

(assert (= (and b!1498594 res!1019861) b!1498593))

(assert (= (and b!1498593 res!1019862) b!1498599))

(assert (= (and b!1498599 res!1019858) b!1498596))

(assert (= (and b!1498596 res!1019856) b!1498600))

(declare-fun m!1381195 () Bool)

(assert (=> b!1498597 m!1381195))

(assert (=> b!1498597 m!1381195))

(declare-fun m!1381197 () Bool)

(assert (=> b!1498597 m!1381197))

(declare-fun m!1381199 () Bool)

(assert (=> b!1498594 m!1381199))

(declare-fun m!1381201 () Bool)

(assert (=> b!1498599 m!1381201))

(assert (=> b!1498599 m!1381201))

(declare-fun m!1381203 () Bool)

(assert (=> b!1498599 m!1381203))

(declare-fun m!1381205 () Bool)

(assert (=> b!1498593 m!1381205))

(declare-fun m!1381207 () Bool)

(assert (=> b!1498593 m!1381207))

(declare-fun m!1381209 () Bool)

(assert (=> b!1498593 m!1381209))

(assert (=> b!1498598 m!1381201))

(assert (=> b!1498598 m!1381201))

(declare-fun m!1381211 () Bool)

(assert (=> b!1498598 m!1381211))

(declare-fun m!1381213 () Bool)

(assert (=> b!1498596 m!1381213))

(assert (=> b!1498596 m!1381201))

(declare-fun m!1381215 () Bool)

(assert (=> b!1498595 m!1381215))

(assert (=> b!1498600 m!1381207))

(declare-fun m!1381217 () Bool)

(assert (=> b!1498600 m!1381217))

(assert (=> b!1498600 m!1381217))

(declare-fun m!1381219 () Bool)

(assert (=> b!1498600 m!1381219))

(declare-fun m!1381221 () Bool)

(assert (=> start!127544 m!1381221))

(declare-fun m!1381223 () Bool)

(assert (=> start!127544 m!1381223))

(check-sat (not b!1498597) (not b!1498598) (not b!1498595) (not b!1498600) (not b!1498594) (not start!127544) (not b!1498599))
(check-sat)
