; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128044 () Bool)

(assert start!128044)

(declare-fun b!1503930 () Bool)

(declare-fun res!1024718 () Bool)

(declare-fun e!840781 () Bool)

(assert (=> b!1503930 (=> (not res!1024718) (not e!840781))))

(declare-datatypes ((array!100320 0))(
  ( (array!100321 (arr!48415 (Array (_ BitVec 32) (_ BitVec 64))) (size!48965 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100320)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100320 (_ BitVec 32)) Bool)

(assert (=> b!1503930 (= res!1024718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503931 () Bool)

(declare-fun res!1024721 () Bool)

(assert (=> b!1503931 (=> (not res!1024721) (not e!840781))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503931 (= res!1024721 (validKeyInArray!0 (select (arr!48415 a!2850) j!87)))))

(declare-fun b!1503932 () Bool)

(declare-fun res!1024723 () Bool)

(assert (=> b!1503932 (=> (not res!1024723) (not e!840781))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503932 (= res!1024723 (and (= (size!48965 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48965 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48965 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503933 () Bool)

(assert (=> b!1503933 (= e!840781 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653620 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503933 (= lt!653620 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503934 () Bool)

(declare-fun res!1024726 () Bool)

(assert (=> b!1503934 (=> (not res!1024726) (not e!840781))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503934 (= res!1024726 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48965 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48965 a!2850)) (= (select (arr!48415 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48415 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48965 a!2850))))))

(declare-fun res!1024725 () Bool)

(assert (=> start!128044 (=> (not res!1024725) (not e!840781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128044 (= res!1024725 (validMask!0 mask!2661))))

(assert (=> start!128044 e!840781))

(assert (=> start!128044 true))

(declare-fun array_inv!37443 (array!100320) Bool)

(assert (=> start!128044 (array_inv!37443 a!2850)))

(declare-fun b!1503935 () Bool)

(declare-fun res!1024722 () Bool)

(assert (=> b!1503935 (=> (not res!1024722) (not e!840781))))

(declare-datatypes ((SeekEntryResult!12613 0))(
  ( (MissingZero!12613 (index!52844 (_ BitVec 32))) (Found!12613 (index!52845 (_ BitVec 32))) (Intermediate!12613 (undefined!13425 Bool) (index!52846 (_ BitVec 32)) (x!134523 (_ BitVec 32))) (Undefined!12613) (MissingVacant!12613 (index!52847 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100320 (_ BitVec 32)) SeekEntryResult!12613)

(assert (=> b!1503935 (= res!1024722 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48415 a!2850) j!87) a!2850 mask!2661) (Found!12613 j!87)))))

(declare-fun b!1503936 () Bool)

(declare-fun res!1024719 () Bool)

(assert (=> b!1503936 (=> (not res!1024719) (not e!840781))))

(assert (=> b!1503936 (= res!1024719 (validKeyInArray!0 (select (arr!48415 a!2850) i!996)))))

(declare-fun b!1503937 () Bool)

(declare-fun res!1024720 () Bool)

(assert (=> b!1503937 (=> (not res!1024720) (not e!840781))))

(assert (=> b!1503937 (= res!1024720 (not (= (select (arr!48415 a!2850) index!625) (select (arr!48415 a!2850) j!87))))))

(declare-fun b!1503938 () Bool)

(declare-fun res!1024724 () Bool)

(assert (=> b!1503938 (=> (not res!1024724) (not e!840781))))

(declare-datatypes ((List!34907 0))(
  ( (Nil!34904) (Cons!34903 (h!36300 (_ BitVec 64)) (t!49601 List!34907)) )
))
(declare-fun arrayNoDuplicates!0 (array!100320 (_ BitVec 32) List!34907) Bool)

(assert (=> b!1503938 (= res!1024724 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34904))))

(assert (= (and start!128044 res!1024725) b!1503932))

(assert (= (and b!1503932 res!1024723) b!1503936))

(assert (= (and b!1503936 res!1024719) b!1503931))

(assert (= (and b!1503931 res!1024721) b!1503930))

(assert (= (and b!1503930 res!1024718) b!1503938))

(assert (= (and b!1503938 res!1024724) b!1503934))

(assert (= (and b!1503934 res!1024726) b!1503935))

(assert (= (and b!1503935 res!1024722) b!1503937))

(assert (= (and b!1503937 res!1024720) b!1503933))

(declare-fun m!1387131 () Bool)

(assert (=> b!1503933 m!1387131))

(declare-fun m!1387133 () Bool)

(assert (=> b!1503930 m!1387133))

(declare-fun m!1387135 () Bool)

(assert (=> b!1503935 m!1387135))

(assert (=> b!1503935 m!1387135))

(declare-fun m!1387137 () Bool)

(assert (=> b!1503935 m!1387137))

(assert (=> b!1503931 m!1387135))

(assert (=> b!1503931 m!1387135))

(declare-fun m!1387139 () Bool)

(assert (=> b!1503931 m!1387139))

(declare-fun m!1387141 () Bool)

(assert (=> b!1503936 m!1387141))

(assert (=> b!1503936 m!1387141))

(declare-fun m!1387143 () Bool)

(assert (=> b!1503936 m!1387143))

(declare-fun m!1387145 () Bool)

(assert (=> start!128044 m!1387145))

(declare-fun m!1387147 () Bool)

(assert (=> start!128044 m!1387147))

(declare-fun m!1387149 () Bool)

(assert (=> b!1503934 m!1387149))

(declare-fun m!1387151 () Bool)

(assert (=> b!1503934 m!1387151))

(declare-fun m!1387153 () Bool)

(assert (=> b!1503934 m!1387153))

(declare-fun m!1387155 () Bool)

(assert (=> b!1503937 m!1387155))

(assert (=> b!1503937 m!1387135))

(declare-fun m!1387157 () Bool)

(assert (=> b!1503938 m!1387157))

(push 1)

(assert (not b!1503935))

(assert (not start!128044))

(assert (not b!1503938))

(assert (not b!1503936))

(assert (not b!1503931))

(assert (not b!1503930))

(assert (not b!1503933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

