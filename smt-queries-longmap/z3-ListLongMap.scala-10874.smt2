; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127460 () Bool)

(assert start!127460)

(declare-fun b!1497776 () Bool)

(declare-fun res!1019042 () Bool)

(declare-fun e!838697 () Bool)

(assert (=> b!1497776 (=> (not res!1019042) (not e!838697))))

(declare-datatypes ((array!99835 0))(
  ( (array!99836 (arr!48178 (Array (_ BitVec 32) (_ BitVec 64))) (size!48730 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99835)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1497776 (= res!1019042 (and (= (size!48730 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48730 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48730 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497777 () Bool)

(declare-fun res!1019045 () Bool)

(assert (=> b!1497777 (=> (not res!1019045) (not e!838697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497777 (= res!1019045 (validKeyInArray!0 (select (arr!48178 a!2850) j!87)))))

(declare-fun b!1497778 () Bool)

(declare-fun res!1019044 () Bool)

(assert (=> b!1497778 (=> (not res!1019044) (not e!838697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99835 (_ BitVec 32)) Bool)

(assert (=> b!1497778 (= res!1019044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019043 () Bool)

(assert (=> start!127460 (=> (not res!1019043) (not e!838697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127460 (= res!1019043 (validMask!0 mask!2661))))

(assert (=> start!127460 e!838697))

(assert (=> start!127460 true))

(declare-fun array_inv!37411 (array!99835) Bool)

(assert (=> start!127460 (array_inv!37411 a!2850)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1497779 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1497779 (= e!838697 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48730 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48730 a!2850)) (= (select (arr!48178 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48178 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48730 a!2850)) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1497780 () Bool)

(declare-fun res!1019041 () Bool)

(assert (=> b!1497780 (=> (not res!1019041) (not e!838697))))

(declare-datatypes ((List!34748 0))(
  ( (Nil!34745) (Cons!34744 (h!36142 (_ BitVec 64)) (t!49434 List!34748)) )
))
(declare-fun arrayNoDuplicates!0 (array!99835 (_ BitVec 32) List!34748) Bool)

(assert (=> b!1497780 (= res!1019041 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34745))))

(declare-fun b!1497781 () Bool)

(declare-fun res!1019040 () Bool)

(assert (=> b!1497781 (=> (not res!1019040) (not e!838697))))

(assert (=> b!1497781 (= res!1019040 (validKeyInArray!0 (select (arr!48178 a!2850) i!996)))))

(assert (= (and start!127460 res!1019043) b!1497776))

(assert (= (and b!1497776 res!1019042) b!1497781))

(assert (= (and b!1497781 res!1019040) b!1497777))

(assert (= (and b!1497777 res!1019045) b!1497778))

(assert (= (and b!1497778 res!1019044) b!1497780))

(assert (= (and b!1497780 res!1019041) b!1497779))

(declare-fun m!1380283 () Bool)

(assert (=> start!127460 m!1380283))

(declare-fun m!1380285 () Bool)

(assert (=> start!127460 m!1380285))

(declare-fun m!1380287 () Bool)

(assert (=> b!1497781 m!1380287))

(assert (=> b!1497781 m!1380287))

(declare-fun m!1380289 () Bool)

(assert (=> b!1497781 m!1380289))

(declare-fun m!1380291 () Bool)

(assert (=> b!1497778 m!1380291))

(declare-fun m!1380293 () Bool)

(assert (=> b!1497779 m!1380293))

(declare-fun m!1380295 () Bool)

(assert (=> b!1497779 m!1380295))

(declare-fun m!1380297 () Bool)

(assert (=> b!1497779 m!1380297))

(declare-fun m!1380299 () Bool)

(assert (=> b!1497780 m!1380299))

(declare-fun m!1380301 () Bool)

(assert (=> b!1497777 m!1380301))

(assert (=> b!1497777 m!1380301))

(declare-fun m!1380303 () Bool)

(assert (=> b!1497777 m!1380303))

(check-sat (not b!1497781) (not b!1497777) (not b!1497778) (not start!127460) (not b!1497780))
(check-sat)
