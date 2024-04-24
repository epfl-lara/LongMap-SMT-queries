; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128350 () Bool)

(assert start!128350)

(declare-fun b!1505816 () Bool)

(declare-fun res!1025434 () Bool)

(declare-fun e!841928 () Bool)

(assert (=> b!1505816 (=> (not res!1025434) (not e!841928))))

(declare-datatypes ((array!100440 0))(
  ( (array!100441 (arr!48470 (Array (_ BitVec 32) (_ BitVec 64))) (size!49021 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100440)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505816 (= res!1025434 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49021 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49021 a!2850)) (= (select (arr!48470 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48470 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49021 a!2850))))))

(declare-fun b!1505817 () Bool)

(declare-fun res!1025432 () Bool)

(assert (=> b!1505817 (=> (not res!1025432) (not e!841928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505817 (= res!1025432 (validKeyInArray!0 (select (arr!48470 a!2850) i!996)))))

(declare-fun b!1505818 () Bool)

(declare-fun res!1025427 () Bool)

(assert (=> b!1505818 (=> (not res!1025427) (not e!841928))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100440 (_ BitVec 32)) Bool)

(assert (=> b!1505818 (= res!1025427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505819 () Bool)

(declare-fun res!1025433 () Bool)

(assert (=> b!1505819 (=> (not res!1025433) (not e!841928))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12561 0))(
  ( (MissingZero!12561 (index!52636 (_ BitVec 32))) (Found!12561 (index!52637 (_ BitVec 32))) (Intermediate!12561 (undefined!13373 Bool) (index!52638 (_ BitVec 32)) (x!134516 (_ BitVec 32))) (Undefined!12561) (MissingVacant!12561 (index!52639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100440 (_ BitVec 32)) SeekEntryResult!12561)

(assert (=> b!1505819 (= res!1025433 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48470 a!2850) j!87) a!2850 mask!2661) (Found!12561 j!87)))))

(declare-fun res!1025430 () Bool)

(assert (=> start!128350 (=> (not res!1025430) (not e!841928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128350 (= res!1025430 (validMask!0 mask!2661))))

(assert (=> start!128350 e!841928))

(assert (=> start!128350 true))

(declare-fun array_inv!37751 (array!100440) Bool)

(assert (=> start!128350 (array_inv!37751 a!2850)))

(declare-fun b!1505820 () Bool)

(assert (=> b!1505820 (= e!841928 false)))

(declare-fun lt!654289 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505820 (= lt!654289 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505821 () Bool)

(declare-fun res!1025428 () Bool)

(assert (=> b!1505821 (=> (not res!1025428) (not e!841928))))

(assert (=> b!1505821 (= res!1025428 (and (= (size!49021 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49021 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49021 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505822 () Bool)

(declare-fun res!1025435 () Bool)

(assert (=> b!1505822 (=> (not res!1025435) (not e!841928))))

(assert (=> b!1505822 (= res!1025435 (validKeyInArray!0 (select (arr!48470 a!2850) j!87)))))

(declare-fun b!1505823 () Bool)

(declare-fun res!1025429 () Bool)

(assert (=> b!1505823 (=> (not res!1025429) (not e!841928))))

(declare-datatypes ((List!34949 0))(
  ( (Nil!34946) (Cons!34945 (h!36357 (_ BitVec 64)) (t!49635 List!34949)) )
))
(declare-fun arrayNoDuplicates!0 (array!100440 (_ BitVec 32) List!34949) Bool)

(assert (=> b!1505823 (= res!1025429 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34946))))

(declare-fun b!1505824 () Bool)

(declare-fun res!1025431 () Bool)

(assert (=> b!1505824 (=> (not res!1025431) (not e!841928))))

(assert (=> b!1505824 (= res!1025431 (not (= (select (arr!48470 a!2850) index!625) (select (arr!48470 a!2850) j!87))))))

(assert (= (and start!128350 res!1025430) b!1505821))

(assert (= (and b!1505821 res!1025428) b!1505817))

(assert (= (and b!1505817 res!1025432) b!1505822))

(assert (= (and b!1505822 res!1025435) b!1505818))

(assert (= (and b!1505818 res!1025427) b!1505823))

(assert (= (and b!1505823 res!1025429) b!1505816))

(assert (= (and b!1505816 res!1025434) b!1505819))

(assert (= (and b!1505819 res!1025433) b!1505824))

(assert (= (and b!1505824 res!1025431) b!1505820))

(declare-fun m!1388965 () Bool)

(assert (=> b!1505823 m!1388965))

(declare-fun m!1388967 () Bool)

(assert (=> b!1505822 m!1388967))

(assert (=> b!1505822 m!1388967))

(declare-fun m!1388969 () Bool)

(assert (=> b!1505822 m!1388969))

(declare-fun m!1388971 () Bool)

(assert (=> start!128350 m!1388971))

(declare-fun m!1388973 () Bool)

(assert (=> start!128350 m!1388973))

(declare-fun m!1388975 () Bool)

(assert (=> b!1505817 m!1388975))

(assert (=> b!1505817 m!1388975))

(declare-fun m!1388977 () Bool)

(assert (=> b!1505817 m!1388977))

(declare-fun m!1388979 () Bool)

(assert (=> b!1505820 m!1388979))

(declare-fun m!1388981 () Bool)

(assert (=> b!1505824 m!1388981))

(assert (=> b!1505824 m!1388967))

(declare-fun m!1388983 () Bool)

(assert (=> b!1505818 m!1388983))

(declare-fun m!1388985 () Bool)

(assert (=> b!1505816 m!1388985))

(declare-fun m!1388987 () Bool)

(assert (=> b!1505816 m!1388987))

(declare-fun m!1388989 () Bool)

(assert (=> b!1505816 m!1388989))

(assert (=> b!1505819 m!1388967))

(assert (=> b!1505819 m!1388967))

(declare-fun m!1388991 () Bool)

(assert (=> b!1505819 m!1388991))

(push 1)

(assert (not start!128350))

(assert (not b!1505817))

(assert (not b!1505819))

(assert (not b!1505823))

(assert (not b!1505822))

(assert (not b!1505818))

(assert (not b!1505820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

