; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127664 () Bool)

(assert start!127664)

(declare-fun b!1499921 () Bool)

(declare-fun res!1021003 () Bool)

(declare-fun e!839438 () Bool)

(assert (=> b!1499921 (=> (not res!1021003) (not e!839438))))

(declare-datatypes ((array!100045 0))(
  ( (array!100046 (arr!48282 (Array (_ BitVec 32) (_ BitVec 64))) (size!48832 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100045)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499921 (= res!1021003 (validKeyInArray!0 (select (arr!48282 a!2850) j!87)))))

(declare-fun b!1499922 () Bool)

(declare-fun res!1020998 () Bool)

(assert (=> b!1499922 (=> (not res!1020998) (not e!839438))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1499922 (= res!1020998 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48832 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48832 a!2850)) (= (select (arr!48282 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48282 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48832 a!2850))))))

(declare-fun b!1499923 () Bool)

(declare-fun res!1020999 () Bool)

(assert (=> b!1499923 (=> (not res!1020999) (not e!839438))))

(declare-datatypes ((List!34774 0))(
  ( (Nil!34771) (Cons!34770 (h!36167 (_ BitVec 64)) (t!49468 List!34774)) )
))
(declare-fun arrayNoDuplicates!0 (array!100045 (_ BitVec 32) List!34774) Bool)

(assert (=> b!1499923 (= res!1020999 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34771))))

(declare-fun res!1021001 () Bool)

(assert (=> start!127664 (=> (not res!1021001) (not e!839438))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127664 (= res!1021001 (validMask!0 mask!2661))))

(assert (=> start!127664 e!839438))

(assert (=> start!127664 true))

(declare-fun array_inv!37310 (array!100045) Bool)

(assert (=> start!127664 (array_inv!37310 a!2850)))

(declare-fun b!1499924 () Bool)

(declare-fun res!1021002 () Bool)

(assert (=> b!1499924 (=> (not res!1021002) (not e!839438))))

(assert (=> b!1499924 (= res!1021002 (and (= (size!48832 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48832 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48832 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499925 () Bool)

(declare-fun res!1021004 () Bool)

(assert (=> b!1499925 (=> (not res!1021004) (not e!839438))))

(assert (=> b!1499925 (= res!1021004 (not (= (select (arr!48282 a!2850) index!625) (select (arr!48282 a!2850) j!87))))))

(declare-fun b!1499926 () Bool)

(declare-fun e!839439 () Bool)

(assert (=> b!1499926 (= e!839438 e!839439)))

(declare-fun res!1021005 () Bool)

(assert (=> b!1499926 (=> (not res!1021005) (not e!839439))))

(declare-fun lt!652833 () (_ BitVec 32))

(assert (=> b!1499926 (= res!1021005 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652833 #b00000000000000000000000000000000) (bvslt lt!652833 (size!48832 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499926 (= lt!652833 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499927 () Bool)

(assert (=> b!1499927 (= e!839439 false)))

(declare-datatypes ((SeekEntryResult!12492 0))(
  ( (MissingZero!12492 (index!52360 (_ BitVec 32))) (Found!12492 (index!52361 (_ BitVec 32))) (Intermediate!12492 (undefined!13304 Bool) (index!52362 (_ BitVec 32)) (x!134038 (_ BitVec 32))) (Undefined!12492) (MissingVacant!12492 (index!52363 (_ BitVec 32))) )
))
(declare-fun lt!652834 () SeekEntryResult!12492)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100045 (_ BitVec 32)) SeekEntryResult!12492)

(assert (=> b!1499927 (= lt!652834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652833 vacantBefore!10 (select (arr!48282 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499928 () Bool)

(declare-fun res!1020997 () Bool)

(assert (=> b!1499928 (=> (not res!1020997) (not e!839438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100045 (_ BitVec 32)) Bool)

(assert (=> b!1499928 (= res!1020997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499929 () Bool)

(declare-fun res!1021000 () Bool)

(assert (=> b!1499929 (=> (not res!1021000) (not e!839438))))

(assert (=> b!1499929 (= res!1021000 (validKeyInArray!0 (select (arr!48282 a!2850) i!996)))))

(declare-fun b!1499930 () Bool)

(declare-fun res!1021006 () Bool)

(assert (=> b!1499930 (=> (not res!1021006) (not e!839438))))

(assert (=> b!1499930 (= res!1021006 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48282 a!2850) j!87) a!2850 mask!2661) (Found!12492 j!87)))))

(assert (= (and start!127664 res!1021001) b!1499924))

(assert (= (and b!1499924 res!1021002) b!1499929))

(assert (= (and b!1499929 res!1021000) b!1499921))

(assert (= (and b!1499921 res!1021003) b!1499928))

(assert (= (and b!1499928 res!1020997) b!1499923))

(assert (= (and b!1499923 res!1020999) b!1499922))

(assert (= (and b!1499922 res!1020998) b!1499930))

(assert (= (and b!1499930 res!1021006) b!1499925))

(assert (= (and b!1499925 res!1021004) b!1499926))

(assert (= (and b!1499926 res!1021005) b!1499927))

(declare-fun m!1383115 () Bool)

(assert (=> b!1499927 m!1383115))

(assert (=> b!1499927 m!1383115))

(declare-fun m!1383117 () Bool)

(assert (=> b!1499927 m!1383117))

(declare-fun m!1383119 () Bool)

(assert (=> b!1499922 m!1383119))

(declare-fun m!1383121 () Bool)

(assert (=> b!1499922 m!1383121))

(declare-fun m!1383123 () Bool)

(assert (=> b!1499922 m!1383123))

(declare-fun m!1383125 () Bool)

(assert (=> start!127664 m!1383125))

(declare-fun m!1383127 () Bool)

(assert (=> start!127664 m!1383127))

(assert (=> b!1499921 m!1383115))

(assert (=> b!1499921 m!1383115))

(declare-fun m!1383129 () Bool)

(assert (=> b!1499921 m!1383129))

(declare-fun m!1383131 () Bool)

(assert (=> b!1499926 m!1383131))

(declare-fun m!1383133 () Bool)

(assert (=> b!1499928 m!1383133))

(assert (=> b!1499930 m!1383115))

(assert (=> b!1499930 m!1383115))

(declare-fun m!1383135 () Bool)

(assert (=> b!1499930 m!1383135))

(declare-fun m!1383137 () Bool)

(assert (=> b!1499925 m!1383137))

(assert (=> b!1499925 m!1383115))

(declare-fun m!1383139 () Bool)

(assert (=> b!1499929 m!1383139))

(assert (=> b!1499929 m!1383139))

(declare-fun m!1383141 () Bool)

(assert (=> b!1499929 m!1383141))

(declare-fun m!1383143 () Bool)

(assert (=> b!1499923 m!1383143))

(check-sat (not b!1499921) (not b!1499930) (not b!1499926) (not start!127664) (not b!1499927) (not b!1499923) (not b!1499928) (not b!1499929))
(check-sat)
