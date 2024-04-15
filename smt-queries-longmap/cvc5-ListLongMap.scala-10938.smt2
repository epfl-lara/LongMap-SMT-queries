; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127920 () Bool)

(assert start!127920)

(declare-fun b!1502994 () Bool)

(declare-fun res!1024064 () Bool)

(declare-fun e!840384 () Bool)

(assert (=> b!1502994 (=> (not res!1024064) (not e!840384))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100229 0))(
  ( (array!100230 (arr!48372 (Array (_ BitVec 32) (_ BitVec 64))) (size!48924 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100229)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12591 0))(
  ( (MissingZero!12591 (index!52756 (_ BitVec 32))) (Found!12591 (index!52757 (_ BitVec 32))) (Intermediate!12591 (undefined!13403 Bool) (index!52758 (_ BitVec 32)) (x!134442 (_ BitVec 32))) (Undefined!12591) (MissingVacant!12591 (index!52759 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100229 (_ BitVec 32)) SeekEntryResult!12591)

(assert (=> b!1502994 (= res!1024064 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48372 a!2850) j!87) a!2850 mask!2661) (Found!12591 j!87)))))

(declare-fun b!1502995 () Bool)

(declare-fun res!1024067 () Bool)

(assert (=> b!1502995 (=> (not res!1024067) (not e!840384))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502995 (= res!1024067 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48924 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48924 a!2850)) (= (select (arr!48372 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48372 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48924 a!2850))))))

(declare-fun b!1502996 () Bool)

(assert (=> b!1502996 (= e!840384 false)))

(declare-fun lt!653233 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502996 (= lt!653233 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502997 () Bool)

(declare-fun res!1024060 () Bool)

(assert (=> b!1502997 (=> (not res!1024060) (not e!840384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100229 (_ BitVec 32)) Bool)

(assert (=> b!1502997 (= res!1024060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502998 () Bool)

(declare-fun res!1024063 () Bool)

(assert (=> b!1502998 (=> (not res!1024063) (not e!840384))))

(declare-datatypes ((List!34942 0))(
  ( (Nil!34939) (Cons!34938 (h!36336 (_ BitVec 64)) (t!49628 List!34942)) )
))
(declare-fun arrayNoDuplicates!0 (array!100229 (_ BitVec 32) List!34942) Bool)

(assert (=> b!1502998 (= res!1024063 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34939))))

(declare-fun b!1502999 () Bool)

(declare-fun res!1024065 () Bool)

(assert (=> b!1502999 (=> (not res!1024065) (not e!840384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502999 (= res!1024065 (validKeyInArray!0 (select (arr!48372 a!2850) j!87)))))

(declare-fun b!1503000 () Bool)

(declare-fun res!1024059 () Bool)

(assert (=> b!1503000 (=> (not res!1024059) (not e!840384))))

(assert (=> b!1503000 (= res!1024059 (not (= (select (arr!48372 a!2850) index!625) (select (arr!48372 a!2850) j!87))))))

(declare-fun b!1503001 () Bool)

(declare-fun res!1024061 () Bool)

(assert (=> b!1503001 (=> (not res!1024061) (not e!840384))))

(assert (=> b!1503001 (= res!1024061 (and (= (size!48924 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48924 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48924 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1024062 () Bool)

(assert (=> start!127920 (=> (not res!1024062) (not e!840384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127920 (= res!1024062 (validMask!0 mask!2661))))

(assert (=> start!127920 e!840384))

(assert (=> start!127920 true))

(declare-fun array_inv!37605 (array!100229) Bool)

(assert (=> start!127920 (array_inv!37605 a!2850)))

(declare-fun b!1502993 () Bool)

(declare-fun res!1024066 () Bool)

(assert (=> b!1502993 (=> (not res!1024066) (not e!840384))))

(assert (=> b!1502993 (= res!1024066 (validKeyInArray!0 (select (arr!48372 a!2850) i!996)))))

(assert (= (and start!127920 res!1024062) b!1503001))

(assert (= (and b!1503001 res!1024061) b!1502993))

(assert (= (and b!1502993 res!1024066) b!1502999))

(assert (= (and b!1502999 res!1024065) b!1502997))

(assert (= (and b!1502997 res!1024060) b!1502998))

(assert (= (and b!1502998 res!1024063) b!1502995))

(assert (= (and b!1502995 res!1024067) b!1502994))

(assert (= (and b!1502994 res!1024064) b!1503000))

(assert (= (and b!1503000 res!1024059) b!1502996))

(declare-fun m!1385685 () Bool)

(assert (=> start!127920 m!1385685))

(declare-fun m!1385687 () Bool)

(assert (=> start!127920 m!1385687))

(declare-fun m!1385689 () Bool)

(assert (=> b!1502997 m!1385689))

(declare-fun m!1385691 () Bool)

(assert (=> b!1502995 m!1385691))

(declare-fun m!1385693 () Bool)

(assert (=> b!1502995 m!1385693))

(declare-fun m!1385695 () Bool)

(assert (=> b!1502995 m!1385695))

(declare-fun m!1385697 () Bool)

(assert (=> b!1502993 m!1385697))

(assert (=> b!1502993 m!1385697))

(declare-fun m!1385699 () Bool)

(assert (=> b!1502993 m!1385699))

(declare-fun m!1385701 () Bool)

(assert (=> b!1502994 m!1385701))

(assert (=> b!1502994 m!1385701))

(declare-fun m!1385703 () Bool)

(assert (=> b!1502994 m!1385703))

(assert (=> b!1502999 m!1385701))

(assert (=> b!1502999 m!1385701))

(declare-fun m!1385705 () Bool)

(assert (=> b!1502999 m!1385705))

(declare-fun m!1385707 () Bool)

(assert (=> b!1502998 m!1385707))

(declare-fun m!1385709 () Bool)

(assert (=> b!1503000 m!1385709))

(assert (=> b!1503000 m!1385701))

(declare-fun m!1385711 () Bool)

(assert (=> b!1502996 m!1385711))

(push 1)

(assert (not start!127920))

(assert (not b!1502993))

(assert (not b!1502999))

(assert (not b!1502998))

(assert (not b!1502996))

(assert (not b!1502997))

(assert (not b!1502994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

