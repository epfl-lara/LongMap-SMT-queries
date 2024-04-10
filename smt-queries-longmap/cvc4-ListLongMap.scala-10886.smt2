; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127582 () Bool)

(assert start!127582)

(declare-fun b!1498819 () Bool)

(declare-fun res!1019899 () Bool)

(declare-fun e!839125 () Bool)

(assert (=> b!1498819 (=> (not res!1019899) (not e!839125))))

(declare-datatypes ((array!99963 0))(
  ( (array!99964 (arr!48241 (Array (_ BitVec 32) (_ BitVec 64))) (size!48791 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99963)

(declare-datatypes ((List!34733 0))(
  ( (Nil!34730) (Cons!34729 (h!36126 (_ BitVec 64)) (t!49427 List!34733)) )
))
(declare-fun arrayNoDuplicates!0 (array!99963 (_ BitVec 32) List!34733) Bool)

(assert (=> b!1498819 (= res!1019899 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34730))))

(declare-fun b!1498820 () Bool)

(declare-fun res!1019898 () Bool)

(assert (=> b!1498820 (=> (not res!1019898) (not e!839125))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498820 (= res!1019898 (and (= (size!48791 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48791 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48791 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498821 () Bool)

(declare-fun res!1019900 () Bool)

(assert (=> b!1498821 (=> (not res!1019900) (not e!839125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498821 (= res!1019900 (validKeyInArray!0 (select (arr!48241 a!2850) i!996)))))

(declare-fun b!1498822 () Bool)

(declare-fun res!1019896 () Bool)

(assert (=> b!1498822 (=> (not res!1019896) (not e!839125))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498822 (= res!1019896 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48791 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48791 a!2850)) (= (select (arr!48241 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48241 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48791 a!2850))))))

(declare-fun res!1019897 () Bool)

(assert (=> start!127582 (=> (not res!1019897) (not e!839125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127582 (= res!1019897 (validMask!0 mask!2661))))

(assert (=> start!127582 e!839125))

(assert (=> start!127582 true))

(declare-fun array_inv!37269 (array!99963) Bool)

(assert (=> start!127582 (array_inv!37269 a!2850)))

(declare-fun b!1498823 () Bool)

(declare-fun res!1019902 () Bool)

(assert (=> b!1498823 (=> (not res!1019902) (not e!839125))))

(declare-datatypes ((SeekEntryResult!12451 0))(
  ( (MissingZero!12451 (index!52196 (_ BitVec 32))) (Found!12451 (index!52197 (_ BitVec 32))) (Intermediate!12451 (undefined!13263 Bool) (index!52198 (_ BitVec 32)) (x!133885 (_ BitVec 32))) (Undefined!12451) (MissingVacant!12451 (index!52199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99963 (_ BitVec 32)) SeekEntryResult!12451)

(assert (=> b!1498823 (= res!1019902 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48241 a!2850) j!87) a!2850 mask!2661) (Found!12451 j!87)))))

(declare-fun b!1498824 () Bool)

(declare-fun res!1019901 () Bool)

(assert (=> b!1498824 (=> (not res!1019901) (not e!839125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99963 (_ BitVec 32)) Bool)

(assert (=> b!1498824 (= res!1019901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498825 () Bool)

(declare-fun res!1019895 () Bool)

(assert (=> b!1498825 (=> (not res!1019895) (not e!839125))))

(assert (=> b!1498825 (= res!1019895 (validKeyInArray!0 (select (arr!48241 a!2850) j!87)))))

(declare-fun b!1498826 () Bool)

(assert (=> b!1498826 (= e!839125 (and (= (select (arr!48241 a!2850) index!625) (select (arr!48241 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (= (and start!127582 res!1019897) b!1498820))

(assert (= (and b!1498820 res!1019898) b!1498821))

(assert (= (and b!1498821 res!1019900) b!1498825))

(assert (= (and b!1498825 res!1019895) b!1498824))

(assert (= (and b!1498824 res!1019901) b!1498819))

(assert (= (and b!1498819 res!1019899) b!1498822))

(assert (= (and b!1498822 res!1019896) b!1498823))

(assert (= (and b!1498823 res!1019902) b!1498826))

(declare-fun m!1381967 () Bool)

(assert (=> b!1498824 m!1381967))

(declare-fun m!1381969 () Bool)

(assert (=> b!1498819 m!1381969))

(declare-fun m!1381971 () Bool)

(assert (=> b!1498825 m!1381971))

(assert (=> b!1498825 m!1381971))

(declare-fun m!1381973 () Bool)

(assert (=> b!1498825 m!1381973))

(declare-fun m!1381975 () Bool)

(assert (=> b!1498821 m!1381975))

(assert (=> b!1498821 m!1381975))

(declare-fun m!1381977 () Bool)

(assert (=> b!1498821 m!1381977))

(declare-fun m!1381979 () Bool)

(assert (=> b!1498826 m!1381979))

(assert (=> b!1498826 m!1381971))

(declare-fun m!1381981 () Bool)

(assert (=> b!1498822 m!1381981))

(declare-fun m!1381983 () Bool)

(assert (=> b!1498822 m!1381983))

(declare-fun m!1381985 () Bool)

(assert (=> b!1498822 m!1381985))

(assert (=> b!1498823 m!1381971))

(assert (=> b!1498823 m!1381971))

(declare-fun m!1381987 () Bool)

(assert (=> b!1498823 m!1381987))

(declare-fun m!1381989 () Bool)

(assert (=> start!127582 m!1381989))

(declare-fun m!1381991 () Bool)

(assert (=> start!127582 m!1381991))

(push 1)

(assert (not start!127582))

(assert (not b!1498819))

(assert (not b!1498821))

(assert (not b!1498823))

(assert (not b!1498824))

(assert (not b!1498825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

