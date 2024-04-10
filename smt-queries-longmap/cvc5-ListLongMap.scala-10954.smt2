; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128184 () Bool)

(assert start!128184)

(declare-fun b!1505041 () Bool)

(declare-fun res!1025636 () Bool)

(declare-fun e!841216 () Bool)

(assert (=> b!1505041 (=> (not res!1025636) (not e!841216))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100382 0))(
  ( (array!100383 (arr!48443 (Array (_ BitVec 32) (_ BitVec 64))) (size!48993 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100382)

(declare-datatypes ((SeekEntryResult!12641 0))(
  ( (MissingZero!12641 (index!52956 (_ BitVec 32))) (Found!12641 (index!52957 (_ BitVec 32))) (Intermediate!12641 (undefined!13453 Bool) (index!52958 (_ BitVec 32)) (x!134643 (_ BitVec 32))) (Undefined!12641) (MissingVacant!12641 (index!52959 (_ BitVec 32))) )
))
(declare-fun lt!653876 () SeekEntryResult!12641)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun lt!653877 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100382 (_ BitVec 32)) SeekEntryResult!12641)

(assert (=> b!1505041 (= res!1025636 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653877 vacantBefore!10 (select (arr!48443 a!2850) j!87) a!2850 mask!2661) lt!653876))))

(declare-fun b!1505042 () Bool)

(declare-fun res!1025637 () Bool)

(declare-fun e!841215 () Bool)

(assert (=> b!1505042 (=> (not res!1025637) (not e!841215))))

(declare-datatypes ((List!34935 0))(
  ( (Nil!34932) (Cons!34931 (h!36328 (_ BitVec 64)) (t!49629 List!34935)) )
))
(declare-fun arrayNoDuplicates!0 (array!100382 (_ BitVec 32) List!34935) Bool)

(assert (=> b!1505042 (= res!1025637 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34932))))

(declare-fun b!1505043 () Bool)

(declare-fun res!1025635 () Bool)

(assert (=> b!1505043 (=> (not res!1025635) (not e!841215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100382 (_ BitVec 32)) Bool)

(assert (=> b!1505043 (= res!1025635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505044 () Bool)

(declare-fun e!841213 () Bool)

(assert (=> b!1505044 (= e!841215 e!841213)))

(declare-fun res!1025641 () Bool)

(assert (=> b!1505044 (=> (not res!1025641) (not e!841213))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1505044 (= res!1025641 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48443 a!2850) j!87) a!2850 mask!2661) lt!653876))))

(assert (=> b!1505044 (= lt!653876 (Found!12641 j!87))))

(declare-fun b!1505045 () Bool)

(assert (=> b!1505045 (= e!841216 (not true))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505045 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653877 vacantAfter!10 (select (store (arr!48443 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100383 (store (arr!48443 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48993 a!2850)) mask!2661) lt!653876)))

(declare-datatypes ((Unit!50288 0))(
  ( (Unit!50289) )
))
(declare-fun lt!653878 () Unit!50288)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50288)

(assert (=> b!1505045 (= lt!653878 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653877 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1505046 () Bool)

(declare-fun res!1025633 () Bool)

(assert (=> b!1505046 (=> (not res!1025633) (not e!841215))))

(assert (=> b!1505046 (= res!1025633 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48993 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48993 a!2850)) (= (select (arr!48443 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48443 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48993 a!2850))))))

(declare-fun b!1505047 () Bool)

(declare-fun res!1025638 () Bool)

(assert (=> b!1505047 (=> (not res!1025638) (not e!841215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505047 (= res!1025638 (validKeyInArray!0 (select (arr!48443 a!2850) j!87)))))

(declare-fun res!1025632 () Bool)

(assert (=> start!128184 (=> (not res!1025632) (not e!841215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128184 (= res!1025632 (validMask!0 mask!2661))))

(assert (=> start!128184 e!841215))

(assert (=> start!128184 true))

(declare-fun array_inv!37471 (array!100382) Bool)

(assert (=> start!128184 (array_inv!37471 a!2850)))

(declare-fun b!1505048 () Bool)

(declare-fun res!1025640 () Bool)

(assert (=> b!1505048 (=> (not res!1025640) (not e!841215))))

(assert (=> b!1505048 (= res!1025640 (and (= (size!48993 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48993 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48993 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505049 () Bool)

(declare-fun res!1025631 () Bool)

(assert (=> b!1505049 (=> (not res!1025631) (not e!841213))))

(assert (=> b!1505049 (= res!1025631 (not (= (select (arr!48443 a!2850) index!625) (select (arr!48443 a!2850) j!87))))))

(declare-fun b!1505050 () Bool)

(declare-fun res!1025634 () Bool)

(assert (=> b!1505050 (=> (not res!1025634) (not e!841215))))

(assert (=> b!1505050 (= res!1025634 (validKeyInArray!0 (select (arr!48443 a!2850) i!996)))))

(declare-fun b!1505051 () Bool)

(assert (=> b!1505051 (= e!841213 e!841216)))

(declare-fun res!1025639 () Bool)

(assert (=> b!1505051 (=> (not res!1025639) (not e!841216))))

(assert (=> b!1505051 (= res!1025639 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653877 #b00000000000000000000000000000000) (bvslt lt!653877 (size!48993 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505051 (= lt!653877 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128184 res!1025632) b!1505048))

(assert (= (and b!1505048 res!1025640) b!1505050))

(assert (= (and b!1505050 res!1025634) b!1505047))

(assert (= (and b!1505047 res!1025638) b!1505043))

(assert (= (and b!1505043 res!1025635) b!1505042))

(assert (= (and b!1505042 res!1025637) b!1505046))

(assert (= (and b!1505046 res!1025633) b!1505044))

(assert (= (and b!1505044 res!1025641) b!1505049))

(assert (= (and b!1505049 res!1025631) b!1505051))

(assert (= (and b!1505051 res!1025639) b!1505041))

(assert (= (and b!1505041 res!1025636) b!1505045))

(declare-fun m!1388149 () Bool)

(assert (=> b!1505042 m!1388149))

(declare-fun m!1388151 () Bool)

(assert (=> b!1505046 m!1388151))

(declare-fun m!1388153 () Bool)

(assert (=> b!1505046 m!1388153))

(declare-fun m!1388155 () Bool)

(assert (=> b!1505046 m!1388155))

(declare-fun m!1388157 () Bool)

(assert (=> b!1505050 m!1388157))

(assert (=> b!1505050 m!1388157))

(declare-fun m!1388159 () Bool)

(assert (=> b!1505050 m!1388159))

(declare-fun m!1388161 () Bool)

(assert (=> b!1505044 m!1388161))

(assert (=> b!1505044 m!1388161))

(declare-fun m!1388163 () Bool)

(assert (=> b!1505044 m!1388163))

(assert (=> b!1505041 m!1388161))

(assert (=> b!1505041 m!1388161))

(declare-fun m!1388165 () Bool)

(assert (=> b!1505041 m!1388165))

(assert (=> b!1505045 m!1388153))

(declare-fun m!1388167 () Bool)

(assert (=> b!1505045 m!1388167))

(assert (=> b!1505045 m!1388167))

(declare-fun m!1388169 () Bool)

(assert (=> b!1505045 m!1388169))

(declare-fun m!1388171 () Bool)

(assert (=> b!1505045 m!1388171))

(declare-fun m!1388173 () Bool)

(assert (=> b!1505049 m!1388173))

(assert (=> b!1505049 m!1388161))

(declare-fun m!1388175 () Bool)

(assert (=> b!1505051 m!1388175))

(declare-fun m!1388177 () Bool)

(assert (=> b!1505043 m!1388177))

(declare-fun m!1388179 () Bool)

(assert (=> start!128184 m!1388179))

(declare-fun m!1388181 () Bool)

(assert (=> start!128184 m!1388181))

(assert (=> b!1505047 m!1388161))

(assert (=> b!1505047 m!1388161))

(declare-fun m!1388183 () Bool)

(assert (=> b!1505047 m!1388183))

(push 1)

