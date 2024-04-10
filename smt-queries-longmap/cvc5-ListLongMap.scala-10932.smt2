; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127926 () Bool)

(assert start!127926)

(declare-fun b!1502769 () Bool)

(declare-fun res!1023653 () Bool)

(declare-fun e!840463 () Bool)

(assert (=> b!1502769 (=> (not res!1023653) (not e!840463))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100241 0))(
  ( (array!100242 (arr!48377 (Array (_ BitVec 32) (_ BitVec 64))) (size!48927 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100241)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502769 (= res!1023653 (and (= (size!48927 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48927 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48927 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502770 () Bool)

(assert (=> b!1502770 (= e!840463 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653452 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502770 (= lt!653452 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1023651 () Bool)

(assert (=> start!127926 (=> (not res!1023651) (not e!840463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127926 (= res!1023651 (validMask!0 mask!2661))))

(assert (=> start!127926 e!840463))

(assert (=> start!127926 true))

(declare-fun array_inv!37405 (array!100241) Bool)

(assert (=> start!127926 (array_inv!37405 a!2850)))

(declare-fun b!1502771 () Bool)

(declare-fun res!1023647 () Bool)

(assert (=> b!1502771 (=> (not res!1023647) (not e!840463))))

(declare-datatypes ((List!34869 0))(
  ( (Nil!34866) (Cons!34865 (h!36262 (_ BitVec 64)) (t!49563 List!34869)) )
))
(declare-fun arrayNoDuplicates!0 (array!100241 (_ BitVec 32) List!34869) Bool)

(assert (=> b!1502771 (= res!1023647 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34866))))

(declare-fun b!1502772 () Bool)

(declare-fun res!1023650 () Bool)

(assert (=> b!1502772 (=> (not res!1023650) (not e!840463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502772 (= res!1023650 (validKeyInArray!0 (select (arr!48377 a!2850) i!996)))))

(declare-fun b!1502773 () Bool)

(declare-fun res!1023655 () Bool)

(assert (=> b!1502773 (=> (not res!1023655) (not e!840463))))

(assert (=> b!1502773 (= res!1023655 (validKeyInArray!0 (select (arr!48377 a!2850) j!87)))))

(declare-fun b!1502774 () Bool)

(declare-fun res!1023654 () Bool)

(assert (=> b!1502774 (=> (not res!1023654) (not e!840463))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12575 0))(
  ( (MissingZero!12575 (index!52692 (_ BitVec 32))) (Found!12575 (index!52693 (_ BitVec 32))) (Intermediate!12575 (undefined!13387 Bool) (index!52694 (_ BitVec 32)) (x!134383 (_ BitVec 32))) (Undefined!12575) (MissingVacant!12575 (index!52695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100241 (_ BitVec 32)) SeekEntryResult!12575)

(assert (=> b!1502774 (= res!1023654 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48377 a!2850) j!87) a!2850 mask!2661) (Found!12575 j!87)))))

(declare-fun b!1502775 () Bool)

(declare-fun res!1023652 () Bool)

(assert (=> b!1502775 (=> (not res!1023652) (not e!840463))))

(assert (=> b!1502775 (= res!1023652 (not (= (select (arr!48377 a!2850) index!625) (select (arr!48377 a!2850) j!87))))))

(declare-fun b!1502776 () Bool)

(declare-fun res!1023649 () Bool)

(assert (=> b!1502776 (=> (not res!1023649) (not e!840463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100241 (_ BitVec 32)) Bool)

(assert (=> b!1502776 (= res!1023649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502777 () Bool)

(declare-fun res!1023648 () Bool)

(assert (=> b!1502777 (=> (not res!1023648) (not e!840463))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502777 (= res!1023648 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48927 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48927 a!2850)) (= (select (arr!48377 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48377 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48927 a!2850))))))

(assert (= (and start!127926 res!1023651) b!1502769))

(assert (= (and b!1502769 res!1023653) b!1502772))

(assert (= (and b!1502772 res!1023650) b!1502773))

(assert (= (and b!1502773 res!1023655) b!1502776))

(assert (= (and b!1502776 res!1023649) b!1502771))

(assert (= (and b!1502771 res!1023647) b!1502777))

(assert (= (and b!1502777 res!1023648) b!1502774))

(assert (= (and b!1502774 res!1023654) b!1502775))

(assert (= (and b!1502775 res!1023652) b!1502770))

(declare-fun m!1385995 () Bool)

(assert (=> b!1502772 m!1385995))

(assert (=> b!1502772 m!1385995))

(declare-fun m!1385997 () Bool)

(assert (=> b!1502772 m!1385997))

(declare-fun m!1385999 () Bool)

(assert (=> b!1502770 m!1385999))

(declare-fun m!1386001 () Bool)

(assert (=> start!127926 m!1386001))

(declare-fun m!1386003 () Bool)

(assert (=> start!127926 m!1386003))

(declare-fun m!1386005 () Bool)

(assert (=> b!1502771 m!1386005))

(declare-fun m!1386007 () Bool)

(assert (=> b!1502774 m!1386007))

(assert (=> b!1502774 m!1386007))

(declare-fun m!1386009 () Bool)

(assert (=> b!1502774 m!1386009))

(declare-fun m!1386011 () Bool)

(assert (=> b!1502776 m!1386011))

(declare-fun m!1386013 () Bool)

(assert (=> b!1502775 m!1386013))

(assert (=> b!1502775 m!1386007))

(declare-fun m!1386015 () Bool)

(assert (=> b!1502777 m!1386015))

(declare-fun m!1386017 () Bool)

(assert (=> b!1502777 m!1386017))

(declare-fun m!1386019 () Bool)

(assert (=> b!1502777 m!1386019))

(assert (=> b!1502773 m!1386007))

(assert (=> b!1502773 m!1386007))

(declare-fun m!1386021 () Bool)

(assert (=> b!1502773 m!1386021))

(push 1)

(assert (not b!1502770))

(assert (not b!1502774))

(assert (not b!1502771))

(assert (not b!1502776))

(assert (not b!1502773))

(assert (not b!1502772))

(assert (not start!127926))

(check-sat)

