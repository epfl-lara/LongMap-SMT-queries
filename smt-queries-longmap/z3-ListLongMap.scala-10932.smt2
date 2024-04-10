; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127928 () Bool)

(assert start!127928)

(declare-fun b!1502796 () Bool)

(declare-fun e!840468 () Bool)

(assert (=> b!1502796 (= e!840468 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun lt!653455 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502796 (= lt!653455 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1023677 () Bool)

(assert (=> start!127928 (=> (not res!1023677) (not e!840468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127928 (= res!1023677 (validMask!0 mask!2661))))

(assert (=> start!127928 e!840468))

(assert (=> start!127928 true))

(declare-datatypes ((array!100243 0))(
  ( (array!100244 (arr!48378 (Array (_ BitVec 32) (_ BitVec 64))) (size!48928 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100243)

(declare-fun array_inv!37406 (array!100243) Bool)

(assert (=> start!127928 (array_inv!37406 a!2850)))

(declare-fun b!1502797 () Bool)

(declare-fun res!1023674 () Bool)

(assert (=> b!1502797 (=> (not res!1023674) (not e!840468))))

(declare-datatypes ((List!34870 0))(
  ( (Nil!34867) (Cons!34866 (h!36263 (_ BitVec 64)) (t!49564 List!34870)) )
))
(declare-fun arrayNoDuplicates!0 (array!100243 (_ BitVec 32) List!34870) Bool)

(assert (=> b!1502797 (= res!1023674 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34867))))

(declare-fun b!1502798 () Bool)

(declare-fun res!1023680 () Bool)

(assert (=> b!1502798 (=> (not res!1023680) (not e!840468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100243 (_ BitVec 32)) Bool)

(assert (=> b!1502798 (= res!1023680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502799 () Bool)

(declare-fun res!1023678 () Bool)

(assert (=> b!1502799 (=> (not res!1023678) (not e!840468))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502799 (= res!1023678 (not (= (select (arr!48378 a!2850) index!625) (select (arr!48378 a!2850) j!87))))))

(declare-fun b!1502800 () Bool)

(declare-fun res!1023679 () Bool)

(assert (=> b!1502800 (=> (not res!1023679) (not e!840468))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502800 (= res!1023679 (validKeyInArray!0 (select (arr!48378 a!2850) i!996)))))

(declare-fun b!1502801 () Bool)

(declare-fun res!1023676 () Bool)

(assert (=> b!1502801 (=> (not res!1023676) (not e!840468))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12576 0))(
  ( (MissingZero!12576 (index!52696 (_ BitVec 32))) (Found!12576 (index!52697 (_ BitVec 32))) (Intermediate!12576 (undefined!13388 Bool) (index!52698 (_ BitVec 32)) (x!134384 (_ BitVec 32))) (Undefined!12576) (MissingVacant!12576 (index!52699 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100243 (_ BitVec 32)) SeekEntryResult!12576)

(assert (=> b!1502801 (= res!1023676 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48378 a!2850) j!87) a!2850 mask!2661) (Found!12576 j!87)))))

(declare-fun b!1502802 () Bool)

(declare-fun res!1023682 () Bool)

(assert (=> b!1502802 (=> (not res!1023682) (not e!840468))))

(assert (=> b!1502802 (= res!1023682 (validKeyInArray!0 (select (arr!48378 a!2850) j!87)))))

(declare-fun b!1502803 () Bool)

(declare-fun res!1023675 () Bool)

(assert (=> b!1502803 (=> (not res!1023675) (not e!840468))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502803 (= res!1023675 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48928 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48928 a!2850)) (= (select (arr!48378 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48378 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48928 a!2850))))))

(declare-fun b!1502804 () Bool)

(declare-fun res!1023681 () Bool)

(assert (=> b!1502804 (=> (not res!1023681) (not e!840468))))

(assert (=> b!1502804 (= res!1023681 (and (= (size!48928 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48928 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48928 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127928 res!1023677) b!1502804))

(assert (= (and b!1502804 res!1023681) b!1502800))

(assert (= (and b!1502800 res!1023679) b!1502802))

(assert (= (and b!1502802 res!1023682) b!1502798))

(assert (= (and b!1502798 res!1023680) b!1502797))

(assert (= (and b!1502797 res!1023674) b!1502803))

(assert (= (and b!1502803 res!1023675) b!1502801))

(assert (= (and b!1502801 res!1023676) b!1502799))

(assert (= (and b!1502799 res!1023678) b!1502796))

(declare-fun m!1386023 () Bool)

(assert (=> b!1502799 m!1386023))

(declare-fun m!1386025 () Bool)

(assert (=> b!1502799 m!1386025))

(declare-fun m!1386027 () Bool)

(assert (=> b!1502797 m!1386027))

(declare-fun m!1386029 () Bool)

(assert (=> start!127928 m!1386029))

(declare-fun m!1386031 () Bool)

(assert (=> start!127928 m!1386031))

(declare-fun m!1386033 () Bool)

(assert (=> b!1502798 m!1386033))

(assert (=> b!1502802 m!1386025))

(assert (=> b!1502802 m!1386025))

(declare-fun m!1386035 () Bool)

(assert (=> b!1502802 m!1386035))

(declare-fun m!1386037 () Bool)

(assert (=> b!1502796 m!1386037))

(assert (=> b!1502801 m!1386025))

(assert (=> b!1502801 m!1386025))

(declare-fun m!1386039 () Bool)

(assert (=> b!1502801 m!1386039))

(declare-fun m!1386041 () Bool)

(assert (=> b!1502800 m!1386041))

(assert (=> b!1502800 m!1386041))

(declare-fun m!1386043 () Bool)

(assert (=> b!1502800 m!1386043))

(declare-fun m!1386045 () Bool)

(assert (=> b!1502803 m!1386045))

(declare-fun m!1386047 () Bool)

(assert (=> b!1502803 m!1386047))

(declare-fun m!1386049 () Bool)

(assert (=> b!1502803 m!1386049))

(check-sat (not b!1502798) (not start!127928) (not b!1502796) (not b!1502801) (not b!1502797) (not b!1502802) (not b!1502800))
