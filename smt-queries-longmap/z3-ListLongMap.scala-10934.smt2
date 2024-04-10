; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127940 () Bool)

(assert start!127940)

(declare-fun b!1502958 () Bool)

(declare-fun e!840505 () Bool)

(assert (=> b!1502958 (= e!840505 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun lt!653473 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502958 (= lt!653473 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502959 () Bool)

(declare-fun res!1023842 () Bool)

(assert (=> b!1502959 (=> (not res!1023842) (not e!840505))))

(declare-datatypes ((array!100255 0))(
  ( (array!100256 (arr!48384 (Array (_ BitVec 32) (_ BitVec 64))) (size!48934 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100255)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12582 0))(
  ( (MissingZero!12582 (index!52720 (_ BitVec 32))) (Found!12582 (index!52721 (_ BitVec 32))) (Intermediate!12582 (undefined!13394 Bool) (index!52722 (_ BitVec 32)) (x!134406 (_ BitVec 32))) (Undefined!12582) (MissingVacant!12582 (index!52723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100255 (_ BitVec 32)) SeekEntryResult!12582)

(assert (=> b!1502959 (= res!1023842 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48384 a!2850) j!87) a!2850 mask!2661) (Found!12582 j!87)))))

(declare-fun b!1502960 () Bool)

(declare-fun res!1023840 () Bool)

(assert (=> b!1502960 (=> (not res!1023840) (not e!840505))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502960 (= res!1023840 (and (= (size!48934 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48934 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48934 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502961 () Bool)

(declare-fun res!1023841 () Bool)

(assert (=> b!1502961 (=> (not res!1023841) (not e!840505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100255 (_ BitVec 32)) Bool)

(assert (=> b!1502961 (= res!1023841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502962 () Bool)

(declare-fun res!1023836 () Bool)

(assert (=> b!1502962 (=> (not res!1023836) (not e!840505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502962 (= res!1023836 (validKeyInArray!0 (select (arr!48384 a!2850) i!996)))))

(declare-fun b!1502963 () Bool)

(declare-fun res!1023837 () Bool)

(assert (=> b!1502963 (=> (not res!1023837) (not e!840505))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502963 (= res!1023837 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48934 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48934 a!2850)) (= (select (arr!48384 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48384 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48934 a!2850))))))

(declare-fun res!1023844 () Bool)

(assert (=> start!127940 (=> (not res!1023844) (not e!840505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127940 (= res!1023844 (validMask!0 mask!2661))))

(assert (=> start!127940 e!840505))

(assert (=> start!127940 true))

(declare-fun array_inv!37412 (array!100255) Bool)

(assert (=> start!127940 (array_inv!37412 a!2850)))

(declare-fun b!1502964 () Bool)

(declare-fun res!1023839 () Bool)

(assert (=> b!1502964 (=> (not res!1023839) (not e!840505))))

(assert (=> b!1502964 (= res!1023839 (validKeyInArray!0 (select (arr!48384 a!2850) j!87)))))

(declare-fun b!1502965 () Bool)

(declare-fun res!1023843 () Bool)

(assert (=> b!1502965 (=> (not res!1023843) (not e!840505))))

(assert (=> b!1502965 (= res!1023843 (not (= (select (arr!48384 a!2850) index!625) (select (arr!48384 a!2850) j!87))))))

(declare-fun b!1502966 () Bool)

(declare-fun res!1023838 () Bool)

(assert (=> b!1502966 (=> (not res!1023838) (not e!840505))))

(declare-datatypes ((List!34876 0))(
  ( (Nil!34873) (Cons!34872 (h!36269 (_ BitVec 64)) (t!49570 List!34876)) )
))
(declare-fun arrayNoDuplicates!0 (array!100255 (_ BitVec 32) List!34876) Bool)

(assert (=> b!1502966 (= res!1023838 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34873))))

(assert (= (and start!127940 res!1023844) b!1502960))

(assert (= (and b!1502960 res!1023840) b!1502962))

(assert (= (and b!1502962 res!1023836) b!1502964))

(assert (= (and b!1502964 res!1023839) b!1502961))

(assert (= (and b!1502961 res!1023841) b!1502966))

(assert (= (and b!1502966 res!1023838) b!1502963))

(assert (= (and b!1502963 res!1023837) b!1502959))

(assert (= (and b!1502959 res!1023842) b!1502965))

(assert (= (and b!1502965 res!1023843) b!1502958))

(declare-fun m!1386191 () Bool)

(assert (=> b!1502963 m!1386191))

(declare-fun m!1386193 () Bool)

(assert (=> b!1502963 m!1386193))

(declare-fun m!1386195 () Bool)

(assert (=> b!1502963 m!1386195))

(declare-fun m!1386197 () Bool)

(assert (=> start!127940 m!1386197))

(declare-fun m!1386199 () Bool)

(assert (=> start!127940 m!1386199))

(declare-fun m!1386201 () Bool)

(assert (=> b!1502958 m!1386201))

(declare-fun m!1386203 () Bool)

(assert (=> b!1502966 m!1386203))

(declare-fun m!1386205 () Bool)

(assert (=> b!1502964 m!1386205))

(assert (=> b!1502964 m!1386205))

(declare-fun m!1386207 () Bool)

(assert (=> b!1502964 m!1386207))

(declare-fun m!1386209 () Bool)

(assert (=> b!1502962 m!1386209))

(assert (=> b!1502962 m!1386209))

(declare-fun m!1386211 () Bool)

(assert (=> b!1502962 m!1386211))

(declare-fun m!1386213 () Bool)

(assert (=> b!1502965 m!1386213))

(assert (=> b!1502965 m!1386205))

(assert (=> b!1502959 m!1386205))

(assert (=> b!1502959 m!1386205))

(declare-fun m!1386215 () Bool)

(assert (=> b!1502959 m!1386215))

(declare-fun m!1386217 () Bool)

(assert (=> b!1502961 m!1386217))

(check-sat (not b!1502959) (not b!1502962) (not start!127940) (not b!1502966) (not b!1502961) (not b!1502958) (not b!1502964))
