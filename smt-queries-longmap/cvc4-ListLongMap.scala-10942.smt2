; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127990 () Bool)

(assert start!127990)

(declare-fun b!1503633 () Bool)

(declare-fun res!1024513 () Bool)

(declare-fun e!840654 () Bool)

(assert (=> b!1503633 (=> (not res!1024513) (not e!840654))))

(declare-datatypes ((array!100305 0))(
  ( (array!100306 (arr!48409 (Array (_ BitVec 32) (_ BitVec 64))) (size!48959 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100305)

(declare-datatypes ((List!34901 0))(
  ( (Nil!34898) (Cons!34897 (h!36294 (_ BitVec 64)) (t!49595 List!34901)) )
))
(declare-fun arrayNoDuplicates!0 (array!100305 (_ BitVec 32) List!34901) Bool)

(assert (=> b!1503633 (= res!1024513 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34898))))

(declare-fun res!1024518 () Bool)

(assert (=> start!127990 (=> (not res!1024518) (not e!840654))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127990 (= res!1024518 (validMask!0 mask!2661))))

(assert (=> start!127990 e!840654))

(assert (=> start!127990 true))

(declare-fun array_inv!37437 (array!100305) Bool)

(assert (=> start!127990 (array_inv!37437 a!2850)))

(declare-fun b!1503634 () Bool)

(declare-fun res!1024514 () Bool)

(assert (=> b!1503634 (=> (not res!1024514) (not e!840654))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503634 (= res!1024514 (validKeyInArray!0 (select (arr!48409 a!2850) i!996)))))

(declare-fun b!1503635 () Bool)

(declare-fun res!1024516 () Bool)

(assert (=> b!1503635 (=> (not res!1024516) (not e!840654))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503635 (= res!1024516 (validKeyInArray!0 (select (arr!48409 a!2850) j!87)))))

(declare-fun b!1503636 () Bool)

(declare-fun res!1024519 () Bool)

(assert (=> b!1503636 (=> (not res!1024519) (not e!840654))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1503636 (= res!1024519 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48959 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48959 a!2850)) (= (select (arr!48409 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48409 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48959 a!2850))))))

(declare-fun b!1503637 () Bool)

(declare-fun res!1024515 () Bool)

(assert (=> b!1503637 (=> (not res!1024515) (not e!840654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100305 (_ BitVec 32)) Bool)

(assert (=> b!1503637 (= res!1024515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503638 () Bool)

(declare-fun res!1024511 () Bool)

(assert (=> b!1503638 (=> (not res!1024511) (not e!840654))))

(assert (=> b!1503638 (= res!1024511 (and (= (size!48959 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48959 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48959 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503639 () Bool)

(declare-fun res!1024517 () Bool)

(assert (=> b!1503639 (=> (not res!1024517) (not e!840654))))

(declare-datatypes ((SeekEntryResult!12607 0))(
  ( (MissingZero!12607 (index!52820 (_ BitVec 32))) (Found!12607 (index!52821 (_ BitVec 32))) (Intermediate!12607 (undefined!13419 Bool) (index!52822 (_ BitVec 32)) (x!134495 (_ BitVec 32))) (Undefined!12607) (MissingVacant!12607 (index!52823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100305 (_ BitVec 32)) SeekEntryResult!12607)

(assert (=> b!1503639 (= res!1024517 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48409 a!2850) j!87) a!2850 mask!2661) (Found!12607 j!87)))))

(declare-fun b!1503640 () Bool)

(assert (=> b!1503640 (= e!840654 false)))

(declare-fun lt!653548 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503640 (= lt!653548 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503641 () Bool)

(declare-fun res!1024512 () Bool)

(assert (=> b!1503641 (=> (not res!1024512) (not e!840654))))

(assert (=> b!1503641 (= res!1024512 (not (= (select (arr!48409 a!2850) index!625) (select (arr!48409 a!2850) j!87))))))

(assert (= (and start!127990 res!1024518) b!1503638))

(assert (= (and b!1503638 res!1024511) b!1503634))

(assert (= (and b!1503634 res!1024514) b!1503635))

(assert (= (and b!1503635 res!1024516) b!1503637))

(assert (= (and b!1503637 res!1024515) b!1503633))

(assert (= (and b!1503633 res!1024513) b!1503636))

(assert (= (and b!1503636 res!1024519) b!1503639))

(assert (= (and b!1503639 res!1024517) b!1503641))

(assert (= (and b!1503641 res!1024512) b!1503640))

(declare-fun m!1386891 () Bool)

(assert (=> b!1503641 m!1386891))

(declare-fun m!1386893 () Bool)

(assert (=> b!1503641 m!1386893))

(declare-fun m!1386895 () Bool)

(assert (=> b!1503640 m!1386895))

(declare-fun m!1386897 () Bool)

(assert (=> b!1503634 m!1386897))

(assert (=> b!1503634 m!1386897))

(declare-fun m!1386899 () Bool)

(assert (=> b!1503634 m!1386899))

(declare-fun m!1386901 () Bool)

(assert (=> start!127990 m!1386901))

(declare-fun m!1386903 () Bool)

(assert (=> start!127990 m!1386903))

(declare-fun m!1386905 () Bool)

(assert (=> b!1503637 m!1386905))

(assert (=> b!1503639 m!1386893))

(assert (=> b!1503639 m!1386893))

(declare-fun m!1386907 () Bool)

(assert (=> b!1503639 m!1386907))

(assert (=> b!1503635 m!1386893))

(assert (=> b!1503635 m!1386893))

(declare-fun m!1386909 () Bool)

(assert (=> b!1503635 m!1386909))

(declare-fun m!1386911 () Bool)

(assert (=> b!1503636 m!1386911))

(declare-fun m!1386913 () Bool)

(assert (=> b!1503636 m!1386913))

(declare-fun m!1386915 () Bool)

(assert (=> b!1503636 m!1386915))

(declare-fun m!1386917 () Bool)

(assert (=> b!1503633 m!1386917))

(push 1)

(assert (not b!1503634))

(assert (not b!1503633))

(assert (not b!1503639))

(assert (not start!127990))

(assert (not b!1503640))

(assert (not b!1503637))

(assert (not b!1503635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

