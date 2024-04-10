; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127570 () Bool)

(assert start!127570)

(declare-fun b!1498684 () Bool)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99951 0))(
  ( (array!99952 (arr!48235 (Array (_ BitVec 32) (_ BitVec 64))) (size!48785 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99951)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun e!839089 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498684 (= e!839089 (and (= (select (arr!48235 a!2850) index!625) (select (arr!48235 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498685 () Bool)

(declare-fun res!1019764 () Bool)

(assert (=> b!1498685 (=> (not res!1019764) (not e!839089))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498685 (= res!1019764 (validKeyInArray!0 (select (arr!48235 a!2850) i!996)))))

(declare-fun b!1498686 () Bool)

(declare-fun res!1019760 () Bool)

(assert (=> b!1498686 (=> (not res!1019760) (not e!839089))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12445 0))(
  ( (MissingZero!12445 (index!52172 (_ BitVec 32))) (Found!12445 (index!52173 (_ BitVec 32))) (Intermediate!12445 (undefined!13257 Bool) (index!52174 (_ BitVec 32)) (x!133863 (_ BitVec 32))) (Undefined!12445) (MissingVacant!12445 (index!52175 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99951 (_ BitVec 32)) SeekEntryResult!12445)

(assert (=> b!1498686 (= res!1019760 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48235 a!2850) j!87) a!2850 mask!2661) (Found!12445 j!87)))))

(declare-fun res!1019767 () Bool)

(assert (=> start!127570 (=> (not res!1019767) (not e!839089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127570 (= res!1019767 (validMask!0 mask!2661))))

(assert (=> start!127570 e!839089))

(assert (=> start!127570 true))

(declare-fun array_inv!37263 (array!99951) Bool)

(assert (=> start!127570 (array_inv!37263 a!2850)))

(declare-fun b!1498687 () Bool)

(declare-fun res!1019761 () Bool)

(assert (=> b!1498687 (=> (not res!1019761) (not e!839089))))

(assert (=> b!1498687 (= res!1019761 (validKeyInArray!0 (select (arr!48235 a!2850) j!87)))))

(declare-fun b!1498688 () Bool)

(declare-fun res!1019763 () Bool)

(assert (=> b!1498688 (=> (not res!1019763) (not e!839089))))

(declare-datatypes ((List!34727 0))(
  ( (Nil!34724) (Cons!34723 (h!36120 (_ BitVec 64)) (t!49421 List!34727)) )
))
(declare-fun arrayNoDuplicates!0 (array!99951 (_ BitVec 32) List!34727) Bool)

(assert (=> b!1498688 (= res!1019763 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34724))))

(declare-fun b!1498689 () Bool)

(declare-fun res!1019765 () Bool)

(assert (=> b!1498689 (=> (not res!1019765) (not e!839089))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498689 (= res!1019765 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48785 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48785 a!2850)) (= (select (arr!48235 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48235 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48785 a!2850))))))

(declare-fun b!1498690 () Bool)

(declare-fun res!1019766 () Bool)

(assert (=> b!1498690 (=> (not res!1019766) (not e!839089))))

(assert (=> b!1498690 (= res!1019766 (and (= (size!48785 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48785 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48785 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498691 () Bool)

(declare-fun res!1019762 () Bool)

(assert (=> b!1498691 (=> (not res!1019762) (not e!839089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99951 (_ BitVec 32)) Bool)

(assert (=> b!1498691 (= res!1019762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127570 res!1019767) b!1498690))

(assert (= (and b!1498690 res!1019766) b!1498685))

(assert (= (and b!1498685 res!1019764) b!1498687))

(assert (= (and b!1498687 res!1019761) b!1498691))

(assert (= (and b!1498691 res!1019762) b!1498688))

(assert (= (and b!1498688 res!1019763) b!1498689))

(assert (= (and b!1498689 res!1019765) b!1498686))

(assert (= (and b!1498686 res!1019760) b!1498684))

(declare-fun m!1381817 () Bool)

(assert (=> b!1498691 m!1381817))

(declare-fun m!1381819 () Bool)

(assert (=> b!1498684 m!1381819))

(declare-fun m!1381821 () Bool)

(assert (=> b!1498684 m!1381821))

(declare-fun m!1381823 () Bool)

(assert (=> b!1498689 m!1381823))

(declare-fun m!1381825 () Bool)

(assert (=> b!1498689 m!1381825))

(declare-fun m!1381827 () Bool)

(assert (=> b!1498689 m!1381827))

(assert (=> b!1498686 m!1381821))

(assert (=> b!1498686 m!1381821))

(declare-fun m!1381829 () Bool)

(assert (=> b!1498686 m!1381829))

(assert (=> b!1498687 m!1381821))

(assert (=> b!1498687 m!1381821))

(declare-fun m!1381831 () Bool)

(assert (=> b!1498687 m!1381831))

(declare-fun m!1381833 () Bool)

(assert (=> b!1498685 m!1381833))

(assert (=> b!1498685 m!1381833))

(declare-fun m!1381835 () Bool)

(assert (=> b!1498685 m!1381835))

(declare-fun m!1381837 () Bool)

(assert (=> start!127570 m!1381837))

(declare-fun m!1381839 () Bool)

(assert (=> start!127570 m!1381839))

(declare-fun m!1381841 () Bool)

(assert (=> b!1498688 m!1381841))

(push 1)

(assert (not b!1498688))

(assert (not b!1498686))

(assert (not b!1498685))

(assert (not b!1498687))

(assert (not b!1498691))

(assert (not start!127570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

