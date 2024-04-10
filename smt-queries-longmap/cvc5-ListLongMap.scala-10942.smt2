; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127986 () Bool)

(assert start!127986)

(declare-fun b!1503579 () Bool)

(declare-fun res!1024463 () Bool)

(declare-fun e!840642 () Bool)

(assert (=> b!1503579 (=> (not res!1024463) (not e!840642))))

(declare-datatypes ((array!100301 0))(
  ( (array!100302 (arr!48407 (Array (_ BitVec 32) (_ BitVec 64))) (size!48957 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100301)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503579 (= res!1024463 (not (= (select (arr!48407 a!2850) index!625) (select (arr!48407 a!2850) j!87))))))

(declare-fun b!1503580 () Bool)

(declare-fun res!1024457 () Bool)

(assert (=> b!1503580 (=> (not res!1024457) (not e!840642))))

(declare-datatypes ((List!34899 0))(
  ( (Nil!34896) (Cons!34895 (h!36292 (_ BitVec 64)) (t!49593 List!34899)) )
))
(declare-fun arrayNoDuplicates!0 (array!100301 (_ BitVec 32) List!34899) Bool)

(assert (=> b!1503580 (= res!1024457 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34896))))

(declare-fun res!1024465 () Bool)

(assert (=> start!127986 (=> (not res!1024465) (not e!840642))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127986 (= res!1024465 (validMask!0 mask!2661))))

(assert (=> start!127986 e!840642))

(assert (=> start!127986 true))

(declare-fun array_inv!37435 (array!100301) Bool)

(assert (=> start!127986 (array_inv!37435 a!2850)))

(declare-fun b!1503581 () Bool)

(declare-fun res!1024464 () Bool)

(assert (=> b!1503581 (=> (not res!1024464) (not e!840642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100301 (_ BitVec 32)) Bool)

(assert (=> b!1503581 (= res!1024464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503582 () Bool)

(declare-fun res!1024462 () Bool)

(assert (=> b!1503582 (=> (not res!1024462) (not e!840642))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1503582 (= res!1024462 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48957 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48957 a!2850)) (= (select (arr!48407 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48407 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48957 a!2850))))))

(declare-fun b!1503583 () Bool)

(assert (=> b!1503583 (= e!840642 false)))

(declare-fun lt!653542 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503583 (= lt!653542 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503584 () Bool)

(declare-fun res!1024461 () Bool)

(assert (=> b!1503584 (=> (not res!1024461) (not e!840642))))

(assert (=> b!1503584 (= res!1024461 (and (= (size!48957 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48957 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48957 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503585 () Bool)

(declare-fun res!1024458 () Bool)

(assert (=> b!1503585 (=> (not res!1024458) (not e!840642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503585 (= res!1024458 (validKeyInArray!0 (select (arr!48407 a!2850) j!87)))))

(declare-fun b!1503586 () Bool)

(declare-fun res!1024459 () Bool)

(assert (=> b!1503586 (=> (not res!1024459) (not e!840642))))

(declare-datatypes ((SeekEntryResult!12605 0))(
  ( (MissingZero!12605 (index!52812 (_ BitVec 32))) (Found!12605 (index!52813 (_ BitVec 32))) (Intermediate!12605 (undefined!13417 Bool) (index!52814 (_ BitVec 32)) (x!134493 (_ BitVec 32))) (Undefined!12605) (MissingVacant!12605 (index!52815 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100301 (_ BitVec 32)) SeekEntryResult!12605)

(assert (=> b!1503586 (= res!1024459 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48407 a!2850) j!87) a!2850 mask!2661) (Found!12605 j!87)))))

(declare-fun b!1503587 () Bool)

(declare-fun res!1024460 () Bool)

(assert (=> b!1503587 (=> (not res!1024460) (not e!840642))))

(assert (=> b!1503587 (= res!1024460 (validKeyInArray!0 (select (arr!48407 a!2850) i!996)))))

(assert (= (and start!127986 res!1024465) b!1503584))

(assert (= (and b!1503584 res!1024461) b!1503587))

(assert (= (and b!1503587 res!1024460) b!1503585))

(assert (= (and b!1503585 res!1024458) b!1503581))

(assert (= (and b!1503581 res!1024464) b!1503580))

(assert (= (and b!1503580 res!1024457) b!1503582))

(assert (= (and b!1503582 res!1024462) b!1503586))

(assert (= (and b!1503586 res!1024459) b!1503579))

(assert (= (and b!1503579 res!1024463) b!1503583))

(declare-fun m!1386835 () Bool)

(assert (=> b!1503585 m!1386835))

(assert (=> b!1503585 m!1386835))

(declare-fun m!1386837 () Bool)

(assert (=> b!1503585 m!1386837))

(declare-fun m!1386839 () Bool)

(assert (=> b!1503580 m!1386839))

(declare-fun m!1386841 () Bool)

(assert (=> b!1503579 m!1386841))

(assert (=> b!1503579 m!1386835))

(declare-fun m!1386843 () Bool)

(assert (=> b!1503583 m!1386843))

(declare-fun m!1386845 () Bool)

(assert (=> b!1503581 m!1386845))

(declare-fun m!1386847 () Bool)

(assert (=> b!1503587 m!1386847))

(assert (=> b!1503587 m!1386847))

(declare-fun m!1386849 () Bool)

(assert (=> b!1503587 m!1386849))

(declare-fun m!1386851 () Bool)

(assert (=> b!1503582 m!1386851))

(declare-fun m!1386853 () Bool)

(assert (=> b!1503582 m!1386853))

(declare-fun m!1386855 () Bool)

(assert (=> b!1503582 m!1386855))

(declare-fun m!1386857 () Bool)

(assert (=> start!127986 m!1386857))

(declare-fun m!1386859 () Bool)

(assert (=> start!127986 m!1386859))

(assert (=> b!1503586 m!1386835))

(assert (=> b!1503586 m!1386835))

(declare-fun m!1386861 () Bool)

(assert (=> b!1503586 m!1386861))

(push 1)

(assert (not b!1503587))

(assert (not start!127986))

(assert (not b!1503580))

(assert (not b!1503583))

(assert (not b!1503586))

(assert (not b!1503585))

(assert (not b!1503581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

