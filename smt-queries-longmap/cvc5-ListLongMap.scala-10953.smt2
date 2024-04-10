; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128178 () Bool)

(assert start!128178)

(declare-fun b!1504942 () Bool)

(declare-fun res!1025541 () Bool)

(declare-fun e!841179 () Bool)

(assert (=> b!1504942 (=> (not res!1025541) (not e!841179))))

(declare-datatypes ((array!100376 0))(
  ( (array!100377 (arr!48440 (Array (_ BitVec 32) (_ BitVec 64))) (size!48990 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100376)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504942 (= res!1025541 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48990 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48990 a!2850)) (= (select (arr!48440 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48440 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48990 a!2850))))))

(declare-fun b!1504943 () Bool)

(declare-fun e!841180 () Bool)

(assert (=> b!1504943 (= e!841179 e!841180)))

(declare-fun res!1025540 () Bool)

(assert (=> b!1504943 (=> (not res!1025540) (not e!841180))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12638 0))(
  ( (MissingZero!12638 (index!52944 (_ BitVec 32))) (Found!12638 (index!52945 (_ BitVec 32))) (Intermediate!12638 (undefined!13450 Bool) (index!52946 (_ BitVec 32)) (x!134632 (_ BitVec 32))) (Undefined!12638) (MissingVacant!12638 (index!52947 (_ BitVec 32))) )
))
(declare-fun lt!653849 () SeekEntryResult!12638)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100376 (_ BitVec 32)) SeekEntryResult!12638)

(assert (=> b!1504943 (= res!1025540 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48440 a!2850) j!87) a!2850 mask!2661) lt!653849))))

(assert (=> b!1504943 (= lt!653849 (Found!12638 j!87))))

(declare-fun b!1504944 () Bool)

(declare-fun e!841177 () Bool)

(assert (=> b!1504944 (= e!841177 (not true))))

(declare-fun lt!653851 () (_ BitVec 32))

(assert (=> b!1504944 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653851 vacantAfter!10 (select (store (arr!48440 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100377 (store (arr!48440 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48990 a!2850)) mask!2661) lt!653849)))

(declare-datatypes ((Unit!50282 0))(
  ( (Unit!50283) )
))
(declare-fun lt!653850 () Unit!50282)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50282)

(assert (=> b!1504944 (= lt!653850 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653851 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504945 () Bool)

(declare-fun res!1025539 () Bool)

(assert (=> b!1504945 (=> (not res!1025539) (not e!841179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504945 (= res!1025539 (validKeyInArray!0 (select (arr!48440 a!2850) j!87)))))

(declare-fun res!1025535 () Bool)

(assert (=> start!128178 (=> (not res!1025535) (not e!841179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128178 (= res!1025535 (validMask!0 mask!2661))))

(assert (=> start!128178 e!841179))

(assert (=> start!128178 true))

(declare-fun array_inv!37468 (array!100376) Bool)

(assert (=> start!128178 (array_inv!37468 a!2850)))

(declare-fun b!1504946 () Bool)

(declare-fun res!1025542 () Bool)

(assert (=> b!1504946 (=> (not res!1025542) (not e!841180))))

(assert (=> b!1504946 (= res!1025542 (not (= (select (arr!48440 a!2850) index!625) (select (arr!48440 a!2850) j!87))))))

(declare-fun b!1504947 () Bool)

(declare-fun res!1025533 () Bool)

(assert (=> b!1504947 (=> (not res!1025533) (not e!841177))))

(assert (=> b!1504947 (= res!1025533 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653851 vacantBefore!10 (select (arr!48440 a!2850) j!87) a!2850 mask!2661) lt!653849))))

(declare-fun b!1504948 () Bool)

(assert (=> b!1504948 (= e!841180 e!841177)))

(declare-fun res!1025534 () Bool)

(assert (=> b!1504948 (=> (not res!1025534) (not e!841177))))

(assert (=> b!1504948 (= res!1025534 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653851 #b00000000000000000000000000000000) (bvslt lt!653851 (size!48990 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504948 (= lt!653851 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504949 () Bool)

(declare-fun res!1025532 () Bool)

(assert (=> b!1504949 (=> (not res!1025532) (not e!841179))))

(declare-datatypes ((List!34932 0))(
  ( (Nil!34929) (Cons!34928 (h!36325 (_ BitVec 64)) (t!49626 List!34932)) )
))
(declare-fun arrayNoDuplicates!0 (array!100376 (_ BitVec 32) List!34932) Bool)

(assert (=> b!1504949 (= res!1025532 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34929))))

(declare-fun b!1504950 () Bool)

(declare-fun res!1025536 () Bool)

(assert (=> b!1504950 (=> (not res!1025536) (not e!841179))))

(assert (=> b!1504950 (= res!1025536 (validKeyInArray!0 (select (arr!48440 a!2850) i!996)))))

(declare-fun b!1504951 () Bool)

(declare-fun res!1025537 () Bool)

(assert (=> b!1504951 (=> (not res!1025537) (not e!841179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100376 (_ BitVec 32)) Bool)

(assert (=> b!1504951 (= res!1025537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504952 () Bool)

(declare-fun res!1025538 () Bool)

(assert (=> b!1504952 (=> (not res!1025538) (not e!841179))))

(assert (=> b!1504952 (= res!1025538 (and (= (size!48990 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48990 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48990 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128178 res!1025535) b!1504952))

(assert (= (and b!1504952 res!1025538) b!1504950))

(assert (= (and b!1504950 res!1025536) b!1504945))

(assert (= (and b!1504945 res!1025539) b!1504951))

(assert (= (and b!1504951 res!1025537) b!1504949))

(assert (= (and b!1504949 res!1025532) b!1504942))

(assert (= (and b!1504942 res!1025541) b!1504943))

(assert (= (and b!1504943 res!1025540) b!1504946))

(assert (= (and b!1504946 res!1025542) b!1504948))

(assert (= (and b!1504948 res!1025534) b!1504947))

(assert (= (and b!1504947 res!1025533) b!1504944))

(declare-fun m!1388041 () Bool)

(assert (=> b!1504945 m!1388041))

(assert (=> b!1504945 m!1388041))

(declare-fun m!1388043 () Bool)

(assert (=> b!1504945 m!1388043))

(assert (=> b!1504943 m!1388041))

(assert (=> b!1504943 m!1388041))

(declare-fun m!1388045 () Bool)

(assert (=> b!1504943 m!1388045))

(declare-fun m!1388047 () Bool)

(assert (=> b!1504950 m!1388047))

(assert (=> b!1504950 m!1388047))

(declare-fun m!1388049 () Bool)

(assert (=> b!1504950 m!1388049))

(declare-fun m!1388051 () Bool)

(assert (=> b!1504949 m!1388051))

(declare-fun m!1388053 () Bool)

(assert (=> b!1504948 m!1388053))

(declare-fun m!1388055 () Bool)

(assert (=> b!1504944 m!1388055))

(declare-fun m!1388057 () Bool)

(assert (=> b!1504944 m!1388057))

(assert (=> b!1504944 m!1388057))

(declare-fun m!1388059 () Bool)

(assert (=> b!1504944 m!1388059))

(declare-fun m!1388061 () Bool)

(assert (=> b!1504944 m!1388061))

(declare-fun m!1388063 () Bool)

(assert (=> b!1504946 m!1388063))

(assert (=> b!1504946 m!1388041))

(assert (=> b!1504947 m!1388041))

(assert (=> b!1504947 m!1388041))

(declare-fun m!1388065 () Bool)

(assert (=> b!1504947 m!1388065))

(declare-fun m!1388067 () Bool)

(assert (=> start!128178 m!1388067))

(declare-fun m!1388069 () Bool)

(assert (=> start!128178 m!1388069))

(declare-fun m!1388071 () Bool)

(assert (=> b!1504942 m!1388071))

(assert (=> b!1504942 m!1388055))

(declare-fun m!1388073 () Bool)

(assert (=> b!1504942 m!1388073))

(declare-fun m!1388075 () Bool)

(assert (=> b!1504951 m!1388075))

(push 1)

