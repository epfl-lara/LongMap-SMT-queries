; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127868 () Bool)

(assert start!127868)

(declare-fun res!1020710 () Bool)

(declare-fun e!840237 () Bool)

(assert (=> start!127868 (=> (not res!1020710) (not e!840237))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127868 (= res!1020710 (validMask!0 mask!2661))))

(assert (=> start!127868 e!840237))

(assert (=> start!127868 true))

(declare-datatypes ((array!100094 0))(
  ( (array!100095 (arr!48303 (Array (_ BitVec 32) (_ BitVec 64))) (size!48854 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100094)

(declare-fun array_inv!37584 (array!100094) Bool)

(assert (=> start!127868 (array_inv!37584 a!2850)))

(declare-fun b!1500733 () Bool)

(declare-fun res!1020714 () Bool)

(assert (=> b!1500733 (=> (not res!1020714) (not e!840237))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500733 (= res!1020714 (validKeyInArray!0 (select (arr!48303 a!2850) i!996)))))

(declare-fun b!1500734 () Bool)

(assert (=> b!1500734 (= e!840237 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12406 0))(
  ( (MissingZero!12406 (index!52016 (_ BitVec 32))) (Found!12406 (index!52017 (_ BitVec 32))) (Intermediate!12406 (undefined!13218 Bool) (index!52018 (_ BitVec 32)) (x!133898 (_ BitVec 32))) (Undefined!12406) (MissingVacant!12406 (index!52019 (_ BitVec 32))) )
))
(declare-fun lt!653325 () SeekEntryResult!12406)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100094 (_ BitVec 32)) SeekEntryResult!12406)

(assert (=> b!1500734 (= lt!653325 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48303 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500735 () Bool)

(declare-fun res!1020713 () Bool)

(assert (=> b!1500735 (=> (not res!1020713) (not e!840237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100094 (_ BitVec 32)) Bool)

(assert (=> b!1500735 (= res!1020713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500736 () Bool)

(declare-fun res!1020712 () Bool)

(assert (=> b!1500736 (=> (not res!1020712) (not e!840237))))

(assert (=> b!1500736 (= res!1020712 (and (= (size!48854 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48854 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48854 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500737 () Bool)

(declare-fun res!1020715 () Bool)

(assert (=> b!1500737 (=> (not res!1020715) (not e!840237))))

(declare-datatypes ((List!34782 0))(
  ( (Nil!34779) (Cons!34778 (h!36190 (_ BitVec 64)) (t!49468 List!34782)) )
))
(declare-fun arrayNoDuplicates!0 (array!100094 (_ BitVec 32) List!34782) Bool)

(assert (=> b!1500737 (= res!1020715 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34779))))

(declare-fun b!1500738 () Bool)

(declare-fun res!1020716 () Bool)

(assert (=> b!1500738 (=> (not res!1020716) (not e!840237))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500738 (= res!1020716 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48854 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48854 a!2850)) (= (select (arr!48303 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48303 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48854 a!2850))))))

(declare-fun b!1500739 () Bool)

(declare-fun res!1020711 () Bool)

(assert (=> b!1500739 (=> (not res!1020711) (not e!840237))))

(assert (=> b!1500739 (= res!1020711 (validKeyInArray!0 (select (arr!48303 a!2850) j!87)))))

(assert (= (and start!127868 res!1020710) b!1500736))

(assert (= (and b!1500736 res!1020712) b!1500733))

(assert (= (and b!1500733 res!1020714) b!1500739))

(assert (= (and b!1500739 res!1020711) b!1500735))

(assert (= (and b!1500735 res!1020713) b!1500737))

(assert (= (and b!1500737 res!1020715) b!1500738))

(assert (= (and b!1500738 res!1020716) b!1500734))

(declare-fun m!1383929 () Bool)

(assert (=> b!1500735 m!1383929))

(declare-fun m!1383931 () Bool)

(assert (=> b!1500739 m!1383931))

(assert (=> b!1500739 m!1383931))

(declare-fun m!1383933 () Bool)

(assert (=> b!1500739 m!1383933))

(declare-fun m!1383935 () Bool)

(assert (=> b!1500737 m!1383935))

(assert (=> b!1500734 m!1383931))

(assert (=> b!1500734 m!1383931))

(declare-fun m!1383937 () Bool)

(assert (=> b!1500734 m!1383937))

(declare-fun m!1383939 () Bool)

(assert (=> b!1500738 m!1383939))

(declare-fun m!1383941 () Bool)

(assert (=> b!1500738 m!1383941))

(declare-fun m!1383943 () Bool)

(assert (=> b!1500738 m!1383943))

(declare-fun m!1383945 () Bool)

(assert (=> b!1500733 m!1383945))

(assert (=> b!1500733 m!1383945))

(declare-fun m!1383947 () Bool)

(assert (=> b!1500733 m!1383947))

(declare-fun m!1383949 () Bool)

(assert (=> start!127868 m!1383949))

(declare-fun m!1383951 () Bool)

(assert (=> start!127868 m!1383951))

(push 1)

(assert (not b!1500737))

(assert (not b!1500734))

(assert (not start!127868))

(assert (not b!1500739))

(assert (not b!1500735))

(assert (not b!1500733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

