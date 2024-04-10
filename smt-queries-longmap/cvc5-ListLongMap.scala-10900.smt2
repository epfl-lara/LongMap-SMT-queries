; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127662 () Bool)

(assert start!127662)

(declare-fun b!1499891 () Bool)

(declare-fun res!1020971 () Bool)

(declare-fun e!839429 () Bool)

(assert (=> b!1499891 (=> (not res!1020971) (not e!839429))))

(declare-datatypes ((array!100043 0))(
  ( (array!100044 (arr!48281 (Array (_ BitVec 32) (_ BitVec 64))) (size!48831 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100043)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100043 (_ BitVec 32)) Bool)

(assert (=> b!1499891 (= res!1020971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1020974 () Bool)

(assert (=> start!127662 (=> (not res!1020974) (not e!839429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127662 (= res!1020974 (validMask!0 mask!2661))))

(assert (=> start!127662 e!839429))

(assert (=> start!127662 true))

(declare-fun array_inv!37309 (array!100043) Bool)

(assert (=> start!127662 (array_inv!37309 a!2850)))

(declare-fun b!1499892 () Bool)

(declare-fun e!839431 () Bool)

(assert (=> b!1499892 (= e!839429 e!839431)))

(declare-fun res!1020976 () Bool)

(assert (=> b!1499892 (=> (not res!1020976) (not e!839431))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652828 () (_ BitVec 32))

(assert (=> b!1499892 (= res!1020976 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652828 #b00000000000000000000000000000000) (bvslt lt!652828 (size!48831 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499892 (= lt!652828 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499893 () Bool)

(declare-fun res!1020970 () Bool)

(assert (=> b!1499893 (=> (not res!1020970) (not e!839429))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499893 (= res!1020970 (and (= (size!48831 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48831 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48831 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499894 () Bool)

(declare-fun res!1020968 () Bool)

(assert (=> b!1499894 (=> (not res!1020968) (not e!839429))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12491 0))(
  ( (MissingZero!12491 (index!52356 (_ BitVec 32))) (Found!12491 (index!52357 (_ BitVec 32))) (Intermediate!12491 (undefined!13303 Bool) (index!52358 (_ BitVec 32)) (x!134037 (_ BitVec 32))) (Undefined!12491) (MissingVacant!12491 (index!52359 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100043 (_ BitVec 32)) SeekEntryResult!12491)

(assert (=> b!1499894 (= res!1020968 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48281 a!2850) j!87) a!2850 mask!2661) (Found!12491 j!87)))))

(declare-fun b!1499895 () Bool)

(declare-fun res!1020969 () Bool)

(assert (=> b!1499895 (=> (not res!1020969) (not e!839429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499895 (= res!1020969 (validKeyInArray!0 (select (arr!48281 a!2850) j!87)))))

(declare-fun b!1499896 () Bool)

(assert (=> b!1499896 (= e!839431 false)))

(declare-fun lt!652827 () SeekEntryResult!12491)

(assert (=> b!1499896 (= lt!652827 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652828 vacantBefore!10 (select (arr!48281 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499897 () Bool)

(declare-fun res!1020975 () Bool)

(assert (=> b!1499897 (=> (not res!1020975) (not e!839429))))

(assert (=> b!1499897 (= res!1020975 (validKeyInArray!0 (select (arr!48281 a!2850) i!996)))))

(declare-fun b!1499898 () Bool)

(declare-fun res!1020967 () Bool)

(assert (=> b!1499898 (=> (not res!1020967) (not e!839429))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499898 (= res!1020967 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48831 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48831 a!2850)) (= (select (arr!48281 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48281 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48831 a!2850))))))

(declare-fun b!1499899 () Bool)

(declare-fun res!1020973 () Bool)

(assert (=> b!1499899 (=> (not res!1020973) (not e!839429))))

(assert (=> b!1499899 (= res!1020973 (not (= (select (arr!48281 a!2850) index!625) (select (arr!48281 a!2850) j!87))))))

(declare-fun b!1499900 () Bool)

(declare-fun res!1020972 () Bool)

(assert (=> b!1499900 (=> (not res!1020972) (not e!839429))))

(declare-datatypes ((List!34773 0))(
  ( (Nil!34770) (Cons!34769 (h!36166 (_ BitVec 64)) (t!49467 List!34773)) )
))
(declare-fun arrayNoDuplicates!0 (array!100043 (_ BitVec 32) List!34773) Bool)

(assert (=> b!1499900 (= res!1020972 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34770))))

(assert (= (and start!127662 res!1020974) b!1499893))

(assert (= (and b!1499893 res!1020970) b!1499897))

(assert (= (and b!1499897 res!1020975) b!1499895))

(assert (= (and b!1499895 res!1020969) b!1499891))

(assert (= (and b!1499891 res!1020971) b!1499900))

(assert (= (and b!1499900 res!1020972) b!1499898))

(assert (= (and b!1499898 res!1020967) b!1499894))

(assert (= (and b!1499894 res!1020968) b!1499899))

(assert (= (and b!1499899 res!1020973) b!1499892))

(assert (= (and b!1499892 res!1020976) b!1499896))

(declare-fun m!1383085 () Bool)

(assert (=> start!127662 m!1383085))

(declare-fun m!1383087 () Bool)

(assert (=> start!127662 m!1383087))

(declare-fun m!1383089 () Bool)

(assert (=> b!1499895 m!1383089))

(assert (=> b!1499895 m!1383089))

(declare-fun m!1383091 () Bool)

(assert (=> b!1499895 m!1383091))

(declare-fun m!1383093 () Bool)

(assert (=> b!1499900 m!1383093))

(declare-fun m!1383095 () Bool)

(assert (=> b!1499897 m!1383095))

(assert (=> b!1499897 m!1383095))

(declare-fun m!1383097 () Bool)

(assert (=> b!1499897 m!1383097))

(assert (=> b!1499896 m!1383089))

(assert (=> b!1499896 m!1383089))

(declare-fun m!1383099 () Bool)

(assert (=> b!1499896 m!1383099))

(declare-fun m!1383101 () Bool)

(assert (=> b!1499891 m!1383101))

(declare-fun m!1383103 () Bool)

(assert (=> b!1499892 m!1383103))

(declare-fun m!1383105 () Bool)

(assert (=> b!1499898 m!1383105))

(declare-fun m!1383107 () Bool)

(assert (=> b!1499898 m!1383107))

(declare-fun m!1383109 () Bool)

(assert (=> b!1499898 m!1383109))

(assert (=> b!1499894 m!1383089))

(assert (=> b!1499894 m!1383089))

(declare-fun m!1383111 () Bool)

(assert (=> b!1499894 m!1383111))

(declare-fun m!1383113 () Bool)

(assert (=> b!1499899 m!1383113))

(assert (=> b!1499899 m!1383089))

(push 1)

