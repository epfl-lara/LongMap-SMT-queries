; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128356 () Bool)

(assert start!128356)

(declare-fun b!1505897 () Bool)

(declare-fun e!841946 () Bool)

(assert (=> b!1505897 (= e!841946 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!654298 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505897 (= lt!654298 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505898 () Bool)

(declare-fun res!1025515 () Bool)

(assert (=> b!1505898 (=> (not res!1025515) (not e!841946))))

(declare-datatypes ((array!100446 0))(
  ( (array!100447 (arr!48473 (Array (_ BitVec 32) (_ BitVec 64))) (size!49024 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100446)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100446 (_ BitVec 32)) Bool)

(assert (=> b!1505898 (= res!1025515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505899 () Bool)

(declare-fun res!1025508 () Bool)

(assert (=> b!1505899 (=> (not res!1025508) (not e!841946))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505899 (= res!1025508 (and (= (size!49024 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49024 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49024 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505900 () Bool)

(declare-fun res!1025514 () Bool)

(assert (=> b!1505900 (=> (not res!1025514) (not e!841946))))

(declare-datatypes ((List!34952 0))(
  ( (Nil!34949) (Cons!34948 (h!36360 (_ BitVec 64)) (t!49638 List!34952)) )
))
(declare-fun arrayNoDuplicates!0 (array!100446 (_ BitVec 32) List!34952) Bool)

(assert (=> b!1505900 (= res!1025514 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34949))))

(declare-fun b!1505901 () Bool)

(declare-fun res!1025512 () Bool)

(assert (=> b!1505901 (=> (not res!1025512) (not e!841946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505901 (= res!1025512 (validKeyInArray!0 (select (arr!48473 a!2850) i!996)))))

(declare-fun b!1505903 () Bool)

(declare-fun res!1025509 () Bool)

(assert (=> b!1505903 (=> (not res!1025509) (not e!841946))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505903 (= res!1025509 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49024 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49024 a!2850)) (= (select (arr!48473 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48473 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49024 a!2850))))))

(declare-fun b!1505904 () Bool)

(declare-fun res!1025510 () Bool)

(assert (=> b!1505904 (=> (not res!1025510) (not e!841946))))

(assert (=> b!1505904 (= res!1025510 (not (= (select (arr!48473 a!2850) index!625) (select (arr!48473 a!2850) j!87))))))

(declare-fun b!1505905 () Bool)

(declare-fun res!1025516 () Bool)

(assert (=> b!1505905 (=> (not res!1025516) (not e!841946))))

(declare-datatypes ((SeekEntryResult!12564 0))(
  ( (MissingZero!12564 (index!52648 (_ BitVec 32))) (Found!12564 (index!52649 (_ BitVec 32))) (Intermediate!12564 (undefined!13376 Bool) (index!52650 (_ BitVec 32)) (x!134527 (_ BitVec 32))) (Undefined!12564) (MissingVacant!12564 (index!52651 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100446 (_ BitVec 32)) SeekEntryResult!12564)

(assert (=> b!1505905 (= res!1025516 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48473 a!2850) j!87) a!2850 mask!2661) (Found!12564 j!87)))))

(declare-fun res!1025513 () Bool)

(assert (=> start!128356 (=> (not res!1025513) (not e!841946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128356 (= res!1025513 (validMask!0 mask!2661))))

(assert (=> start!128356 e!841946))

(assert (=> start!128356 true))

(declare-fun array_inv!37754 (array!100446) Bool)

(assert (=> start!128356 (array_inv!37754 a!2850)))

(declare-fun b!1505902 () Bool)

(declare-fun res!1025511 () Bool)

(assert (=> b!1505902 (=> (not res!1025511) (not e!841946))))

(assert (=> b!1505902 (= res!1025511 (validKeyInArray!0 (select (arr!48473 a!2850) j!87)))))

(assert (= (and start!128356 res!1025513) b!1505899))

(assert (= (and b!1505899 res!1025508) b!1505901))

(assert (= (and b!1505901 res!1025512) b!1505902))

(assert (= (and b!1505902 res!1025511) b!1505898))

(assert (= (and b!1505898 res!1025515) b!1505900))

(assert (= (and b!1505900 res!1025514) b!1505903))

(assert (= (and b!1505903 res!1025509) b!1505905))

(assert (= (and b!1505905 res!1025516) b!1505904))

(assert (= (and b!1505904 res!1025510) b!1505897))

(declare-fun m!1389049 () Bool)

(assert (=> b!1505904 m!1389049))

(declare-fun m!1389051 () Bool)

(assert (=> b!1505904 m!1389051))

(declare-fun m!1389053 () Bool)

(assert (=> b!1505897 m!1389053))

(assert (=> b!1505902 m!1389051))

(assert (=> b!1505902 m!1389051))

(declare-fun m!1389055 () Bool)

(assert (=> b!1505902 m!1389055))

(declare-fun m!1389057 () Bool)

(assert (=> b!1505898 m!1389057))

(declare-fun m!1389059 () Bool)

(assert (=> b!1505901 m!1389059))

(assert (=> b!1505901 m!1389059))

(declare-fun m!1389061 () Bool)

(assert (=> b!1505901 m!1389061))

(declare-fun m!1389063 () Bool)

(assert (=> b!1505903 m!1389063))

(declare-fun m!1389065 () Bool)

(assert (=> b!1505903 m!1389065))

(declare-fun m!1389067 () Bool)

(assert (=> b!1505903 m!1389067))

(declare-fun m!1389069 () Bool)

(assert (=> start!128356 m!1389069))

(declare-fun m!1389071 () Bool)

(assert (=> start!128356 m!1389071))

(assert (=> b!1505905 m!1389051))

(assert (=> b!1505905 m!1389051))

(declare-fun m!1389073 () Bool)

(assert (=> b!1505905 m!1389073))

(declare-fun m!1389075 () Bool)

(assert (=> b!1505900 m!1389075))

(push 1)

(assert (not start!128356))

(assert (not b!1505905))

(assert (not b!1505898))

(assert (not b!1505901))

(assert (not b!1505897))

(assert (not b!1505900))

(assert (not b!1505902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

