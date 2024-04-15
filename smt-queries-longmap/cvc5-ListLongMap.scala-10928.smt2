; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127824 () Bool)

(assert start!127824)

(declare-fun b!1502068 () Bool)

(declare-fun res!1023244 () Bool)

(declare-fun e!840096 () Bool)

(assert (=> b!1502068 (=> (not res!1023244) (not e!840096))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100166 0))(
  ( (array!100167 (arr!48342 (Array (_ BitVec 32) (_ BitVec 64))) (size!48894 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100166)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502068 (= res!1023244 (and (= (size!48894 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48894 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48894 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502069 () Bool)

(declare-fun res!1023243 () Bool)

(assert (=> b!1502069 (=> (not res!1023243) (not e!840096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502069 (= res!1023243 (validKeyInArray!0 (select (arr!48342 a!2850) j!87)))))

(declare-fun b!1502070 () Bool)

(assert (=> b!1502070 (= e!840096 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12561 0))(
  ( (MissingZero!12561 (index!52636 (_ BitVec 32))) (Found!12561 (index!52637 (_ BitVec 32))) (Intermediate!12561 (undefined!13373 Bool) (index!52638 (_ BitVec 32)) (x!134329 (_ BitVec 32))) (Undefined!12561) (MissingVacant!12561 (index!52639 (_ BitVec 32))) )
))
(declare-fun lt!653092 () SeekEntryResult!12561)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100166 (_ BitVec 32)) SeekEntryResult!12561)

(assert (=> b!1502070 (= lt!653092 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48342 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1023248 () Bool)

(assert (=> start!127824 (=> (not res!1023248) (not e!840096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127824 (= res!1023248 (validMask!0 mask!2661))))

(assert (=> start!127824 e!840096))

(assert (=> start!127824 true))

(declare-fun array_inv!37575 (array!100166) Bool)

(assert (=> start!127824 (array_inv!37575 a!2850)))

(declare-fun b!1502071 () Bool)

(declare-fun res!1023247 () Bool)

(assert (=> b!1502071 (=> (not res!1023247) (not e!840096))))

(declare-datatypes ((List!34912 0))(
  ( (Nil!34909) (Cons!34908 (h!36306 (_ BitVec 64)) (t!49598 List!34912)) )
))
(declare-fun arrayNoDuplicates!0 (array!100166 (_ BitVec 32) List!34912) Bool)

(assert (=> b!1502071 (= res!1023247 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34909))))

(declare-fun b!1502072 () Bool)

(declare-fun res!1023246 () Bool)

(assert (=> b!1502072 (=> (not res!1023246) (not e!840096))))

(assert (=> b!1502072 (= res!1023246 (validKeyInArray!0 (select (arr!48342 a!2850) i!996)))))

(declare-fun b!1502073 () Bool)

(declare-fun res!1023242 () Bool)

(assert (=> b!1502073 (=> (not res!1023242) (not e!840096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100166 (_ BitVec 32)) Bool)

(assert (=> b!1502073 (= res!1023242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502074 () Bool)

(declare-fun res!1023245 () Bool)

(assert (=> b!1502074 (=> (not res!1023245) (not e!840096))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502074 (= res!1023245 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48894 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48894 a!2850)) (= (select (arr!48342 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48342 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48894 a!2850))))))

(assert (= (and start!127824 res!1023248) b!1502068))

(assert (= (and b!1502068 res!1023244) b!1502072))

(assert (= (and b!1502072 res!1023246) b!1502069))

(assert (= (and b!1502069 res!1023243) b!1502073))

(assert (= (and b!1502073 res!1023242) b!1502071))

(assert (= (and b!1502071 res!1023247) b!1502074))

(assert (= (and b!1502074 res!1023245) b!1502070))

(declare-fun m!1384771 () Bool)

(assert (=> b!1502071 m!1384771))

(declare-fun m!1384773 () Bool)

(assert (=> start!127824 m!1384773))

(declare-fun m!1384775 () Bool)

(assert (=> start!127824 m!1384775))

(declare-fun m!1384777 () Bool)

(assert (=> b!1502074 m!1384777))

(declare-fun m!1384779 () Bool)

(assert (=> b!1502074 m!1384779))

(declare-fun m!1384781 () Bool)

(assert (=> b!1502074 m!1384781))

(declare-fun m!1384783 () Bool)

(assert (=> b!1502070 m!1384783))

(assert (=> b!1502070 m!1384783))

(declare-fun m!1384785 () Bool)

(assert (=> b!1502070 m!1384785))

(declare-fun m!1384787 () Bool)

(assert (=> b!1502073 m!1384787))

(declare-fun m!1384789 () Bool)

(assert (=> b!1502072 m!1384789))

(assert (=> b!1502072 m!1384789))

(declare-fun m!1384791 () Bool)

(assert (=> b!1502072 m!1384791))

(assert (=> b!1502069 m!1384783))

(assert (=> b!1502069 m!1384783))

(declare-fun m!1384793 () Bool)

(assert (=> b!1502069 m!1384793))

(push 1)

(assert (not start!127824))

(assert (not b!1502072))

(assert (not b!1502070))

(assert (not b!1502071))

(assert (not b!1502073))

(assert (not b!1502069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

