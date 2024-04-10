; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127590 () Bool)

(assert start!127590)

(declare-datatypes ((array!99971 0))(
  ( (array!99972 (arr!48245 (Array (_ BitVec 32) (_ BitVec 64))) (size!48795 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99971)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun b!1498908 () Bool)

(declare-fun e!839149 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498908 (= e!839149 (not (validKeyInArray!0 (select (store (arr!48245 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))))

(declare-fun b!1498909 () Bool)

(declare-fun res!1019990 () Bool)

(assert (=> b!1498909 (=> (not res!1019990) (not e!839149))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498909 (= res!1019990 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48795 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48795 a!2850)) (= (select (arr!48245 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48245 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48795 a!2850))))))

(declare-fun b!1498910 () Bool)

(declare-fun res!1019986 () Bool)

(assert (=> b!1498910 (=> (not res!1019986) (not e!839149))))

(assert (=> b!1498910 (= res!1019986 (validKeyInArray!0 (select (arr!48245 a!2850) i!996)))))

(declare-fun b!1498911 () Bool)

(declare-fun res!1019988 () Bool)

(assert (=> b!1498911 (=> (not res!1019988) (not e!839149))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12455 0))(
  ( (MissingZero!12455 (index!52212 (_ BitVec 32))) (Found!12455 (index!52213 (_ BitVec 32))) (Intermediate!12455 (undefined!13267 Bool) (index!52214 (_ BitVec 32)) (x!133905 (_ BitVec 32))) (Undefined!12455) (MissingVacant!12455 (index!52215 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99971 (_ BitVec 32)) SeekEntryResult!12455)

(assert (=> b!1498911 (= res!1019988 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48245 a!2850) j!87) a!2850 mask!2661) (Found!12455 j!87)))))

(declare-fun b!1498912 () Bool)

(declare-fun res!1019991 () Bool)

(assert (=> b!1498912 (=> (not res!1019991) (not e!839149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99971 (_ BitVec 32)) Bool)

(assert (=> b!1498912 (= res!1019991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498913 () Bool)

(declare-fun res!1019987 () Bool)

(assert (=> b!1498913 (=> (not res!1019987) (not e!839149))))

(assert (=> b!1498913 (= res!1019987 (and (= (size!48795 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48795 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48795 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498914 () Bool)

(declare-fun res!1019992 () Bool)

(assert (=> b!1498914 (=> (not res!1019992) (not e!839149))))

(declare-datatypes ((List!34737 0))(
  ( (Nil!34734) (Cons!34733 (h!36130 (_ BitVec 64)) (t!49431 List!34737)) )
))
(declare-fun arrayNoDuplicates!0 (array!99971 (_ BitVec 32) List!34737) Bool)

(assert (=> b!1498914 (= res!1019992 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34734))))

(declare-fun res!1019984 () Bool)

(assert (=> start!127590 (=> (not res!1019984) (not e!839149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127590 (= res!1019984 (validMask!0 mask!2661))))

(assert (=> start!127590 e!839149))

(assert (=> start!127590 true))

(declare-fun array_inv!37273 (array!99971) Bool)

(assert (=> start!127590 (array_inv!37273 a!2850)))

(declare-fun b!1498915 () Bool)

(declare-fun res!1019989 () Bool)

(assert (=> b!1498915 (=> (not res!1019989) (not e!839149))))

(assert (=> b!1498915 (= res!1019989 (and (= (select (arr!48245 a!2850) index!625) (select (arr!48245 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498916 () Bool)

(declare-fun res!1019985 () Bool)

(assert (=> b!1498916 (=> (not res!1019985) (not e!839149))))

(assert (=> b!1498916 (= res!1019985 (validKeyInArray!0 (select (arr!48245 a!2850) j!87)))))

(assert (= (and start!127590 res!1019984) b!1498913))

(assert (= (and b!1498913 res!1019987) b!1498910))

(assert (= (and b!1498910 res!1019986) b!1498916))

(assert (= (and b!1498916 res!1019985) b!1498912))

(assert (= (and b!1498912 res!1019991) b!1498914))

(assert (= (and b!1498914 res!1019992) b!1498909))

(assert (= (and b!1498909 res!1019990) b!1498911))

(assert (= (and b!1498911 res!1019988) b!1498915))

(assert (= (and b!1498915 res!1019989) b!1498908))

(declare-fun m!1382065 () Bool)

(assert (=> b!1498916 m!1382065))

(assert (=> b!1498916 m!1382065))

(declare-fun m!1382067 () Bool)

(assert (=> b!1498916 m!1382067))

(declare-fun m!1382069 () Bool)

(assert (=> start!127590 m!1382069))

(declare-fun m!1382071 () Bool)

(assert (=> start!127590 m!1382071))

(declare-fun m!1382073 () Bool)

(assert (=> b!1498912 m!1382073))

(assert (=> b!1498911 m!1382065))

(assert (=> b!1498911 m!1382065))

(declare-fun m!1382075 () Bool)

(assert (=> b!1498911 m!1382075))

(declare-fun m!1382077 () Bool)

(assert (=> b!1498908 m!1382077))

(declare-fun m!1382079 () Bool)

(assert (=> b!1498908 m!1382079))

(assert (=> b!1498908 m!1382079))

(declare-fun m!1382081 () Bool)

(assert (=> b!1498908 m!1382081))

(declare-fun m!1382083 () Bool)

(assert (=> b!1498910 m!1382083))

(assert (=> b!1498910 m!1382083))

(declare-fun m!1382085 () Bool)

(assert (=> b!1498910 m!1382085))

(declare-fun m!1382087 () Bool)

(assert (=> b!1498914 m!1382087))

(declare-fun m!1382089 () Bool)

(assert (=> b!1498915 m!1382089))

(assert (=> b!1498915 m!1382065))

(declare-fun m!1382091 () Bool)

(assert (=> b!1498909 m!1382091))

(assert (=> b!1498909 m!1382077))

(declare-fun m!1382093 () Bool)

(assert (=> b!1498909 m!1382093))

(push 1)

(assert (not b!1498910))

(assert (not start!127590))

(assert (not b!1498911))

