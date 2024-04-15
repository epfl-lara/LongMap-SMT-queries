; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127508 () Bool)

(assert start!127508)

(declare-fun b!1498185 () Bool)

(declare-fun res!1019454 () Bool)

(declare-fun e!838842 () Bool)

(assert (=> b!1498185 (=> (not res!1019454) (not e!838842))))

(declare-datatypes ((array!99883 0))(
  ( (array!99884 (arr!48202 (Array (_ BitVec 32) (_ BitVec 64))) (size!48754 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99883)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498185 (= res!1019454 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48754 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48754 a!2850)) (= (select (arr!48202 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48202 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48754 a!2850))))))

(declare-fun b!1498186 () Bool)

(declare-fun res!1019455 () Bool)

(assert (=> b!1498186 (=> (not res!1019455) (not e!838842))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99883 (_ BitVec 32)) Bool)

(assert (=> b!1498186 (= res!1019455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498187 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498187 (= e!838842 (and (= (select (arr!48202 a!2850) index!625) (select (arr!48202 a!2850) j!87)) (= j!87 index!625) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1498188 () Bool)

(declare-fun res!1019453 () Bool)

(assert (=> b!1498188 (=> (not res!1019453) (not e!838842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498188 (= res!1019453 (validKeyInArray!0 (select (arr!48202 a!2850) i!996)))))

(declare-fun res!1019449 () Bool)

(assert (=> start!127508 (=> (not res!1019449) (not e!838842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127508 (= res!1019449 (validMask!0 mask!2661))))

(assert (=> start!127508 e!838842))

(assert (=> start!127508 true))

(declare-fun array_inv!37435 (array!99883) Bool)

(assert (=> start!127508 (array_inv!37435 a!2850)))

(declare-fun b!1498189 () Bool)

(declare-fun res!1019451 () Bool)

(assert (=> b!1498189 (=> (not res!1019451) (not e!838842))))

(assert (=> b!1498189 (= res!1019451 (validKeyInArray!0 (select (arr!48202 a!2850) j!87)))))

(declare-fun b!1498190 () Bool)

(declare-fun res!1019452 () Bool)

(assert (=> b!1498190 (=> (not res!1019452) (not e!838842))))

(declare-datatypes ((List!34772 0))(
  ( (Nil!34769) (Cons!34768 (h!36166 (_ BitVec 64)) (t!49458 List!34772)) )
))
(declare-fun arrayNoDuplicates!0 (array!99883 (_ BitVec 32) List!34772) Bool)

(assert (=> b!1498190 (= res!1019452 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34769))))

(declare-fun b!1498191 () Bool)

(declare-fun res!1019456 () Bool)

(assert (=> b!1498191 (=> (not res!1019456) (not e!838842))))

(declare-datatypes ((SeekEntryResult!12433 0))(
  ( (MissingZero!12433 (index!52124 (_ BitVec 32))) (Found!12433 (index!52125 (_ BitVec 32))) (Intermediate!12433 (undefined!13245 Bool) (index!52126 (_ BitVec 32)) (x!133830 (_ BitVec 32))) (Undefined!12433) (MissingVacant!12433 (index!52127 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99883 (_ BitVec 32)) SeekEntryResult!12433)

(assert (=> b!1498191 (= res!1019456 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48202 a!2850) j!87) a!2850 mask!2661) (Found!12433 j!87)))))

(declare-fun b!1498192 () Bool)

(declare-fun res!1019450 () Bool)

(assert (=> b!1498192 (=> (not res!1019450) (not e!838842))))

(assert (=> b!1498192 (= res!1019450 (and (= (size!48754 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48754 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48754 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127508 res!1019449) b!1498192))

(assert (= (and b!1498192 res!1019450) b!1498188))

(assert (= (and b!1498188 res!1019453) b!1498189))

(assert (= (and b!1498189 res!1019451) b!1498186))

(assert (= (and b!1498186 res!1019455) b!1498190))

(assert (= (and b!1498190 res!1019452) b!1498185))

(assert (= (and b!1498185 res!1019454) b!1498191))

(assert (= (and b!1498191 res!1019456) b!1498187))

(declare-fun m!1380745 () Bool)

(assert (=> b!1498187 m!1380745))

(declare-fun m!1380747 () Bool)

(assert (=> b!1498187 m!1380747))

(declare-fun m!1380749 () Bool)

(assert (=> start!127508 m!1380749))

(declare-fun m!1380751 () Bool)

(assert (=> start!127508 m!1380751))

(declare-fun m!1380753 () Bool)

(assert (=> b!1498188 m!1380753))

(assert (=> b!1498188 m!1380753))

(declare-fun m!1380755 () Bool)

(assert (=> b!1498188 m!1380755))

(declare-fun m!1380757 () Bool)

(assert (=> b!1498185 m!1380757))

(declare-fun m!1380759 () Bool)

(assert (=> b!1498185 m!1380759))

(declare-fun m!1380761 () Bool)

(assert (=> b!1498185 m!1380761))

(assert (=> b!1498191 m!1380747))

(assert (=> b!1498191 m!1380747))

(declare-fun m!1380763 () Bool)

(assert (=> b!1498191 m!1380763))

(assert (=> b!1498189 m!1380747))

(assert (=> b!1498189 m!1380747))

(declare-fun m!1380765 () Bool)

(assert (=> b!1498189 m!1380765))

(declare-fun m!1380767 () Bool)

(assert (=> b!1498186 m!1380767))

(declare-fun m!1380769 () Bool)

(assert (=> b!1498190 m!1380769))

(check-sat (not b!1498189) (not start!127508) (not b!1498188) (not b!1498191) (not b!1498186) (not b!1498190))
(check-sat)
