; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128254 () Bool)

(assert start!128254)

(declare-fun b!1504952 () Bool)

(declare-fun res!1024655 () Bool)

(declare-fun e!841677 () Bool)

(assert (=> b!1504952 (=> (not res!1024655) (not e!841677))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100383 0))(
  ( (array!100384 (arr!48443 (Array (_ BitVec 32) (_ BitVec 64))) (size!48994 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100383)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504952 (= res!1024655 (and (= (size!48994 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48994 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48994 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1024658 () Bool)

(assert (=> start!128254 (=> (not res!1024658) (not e!841677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128254 (= res!1024658 (validMask!0 mask!2661))))

(assert (=> start!128254 e!841677))

(assert (=> start!128254 true))

(declare-fun array_inv!37724 (array!100383) Bool)

(assert (=> start!128254 (array_inv!37724 a!2850)))

(declare-fun b!1504953 () Bool)

(declare-fun res!1024661 () Bool)

(assert (=> b!1504953 (=> (not res!1024661) (not e!841677))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504953 (= res!1024661 (not (= (select (arr!48443 a!2850) index!625) (select (arr!48443 a!2850) j!87))))))

(declare-fun b!1504954 () Bool)

(declare-fun res!1024657 () Bool)

(assert (=> b!1504954 (=> (not res!1024657) (not e!841677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504954 (= res!1024657 (validKeyInArray!0 (select (arr!48443 a!2850) j!87)))))

(declare-fun b!1504955 () Bool)

(declare-fun res!1024653 () Bool)

(assert (=> b!1504955 (=> (not res!1024653) (not e!841677))))

(assert (=> b!1504955 (= res!1024653 (validKeyInArray!0 (select (arr!48443 a!2850) i!996)))))

(declare-fun b!1504956 () Bool)

(declare-fun res!1024660 () Bool)

(assert (=> b!1504956 (=> (not res!1024660) (not e!841677))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12534 0))(
  ( (MissingZero!12534 (index!52528 (_ BitVec 32))) (Found!12534 (index!52529 (_ BitVec 32))) (Intermediate!12534 (undefined!13346 Bool) (index!52530 (_ BitVec 32)) (x!134411 (_ BitVec 32))) (Undefined!12534) (MissingVacant!12534 (index!52531 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100383 (_ BitVec 32)) SeekEntryResult!12534)

(assert (=> b!1504956 (= res!1024660 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48443 a!2850) j!87) a!2850 mask!2661) (Found!12534 j!87)))))

(declare-fun b!1504957 () Bool)

(declare-fun res!1024659 () Bool)

(assert (=> b!1504957 (=> (not res!1024659) (not e!841677))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504957 (= res!1024659 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48994 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48994 a!2850)) (= (select (arr!48443 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48443 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48994 a!2850))))))

(declare-fun b!1504958 () Bool)

(declare-fun res!1024656 () Bool)

(assert (=> b!1504958 (=> (not res!1024656) (not e!841677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100383 (_ BitVec 32)) Bool)

(assert (=> b!1504958 (= res!1024656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504959 () Bool)

(assert (=> b!1504959 (= e!841677 false)))

(declare-fun lt!654154 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504959 (= lt!654154 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1504960 () Bool)

(declare-fun res!1024654 () Bool)

(assert (=> b!1504960 (=> (not res!1024654) (not e!841677))))

(declare-datatypes ((List!34922 0))(
  ( (Nil!34919) (Cons!34918 (h!36330 (_ BitVec 64)) (t!49608 List!34922)) )
))
(declare-fun arrayNoDuplicates!0 (array!100383 (_ BitVec 32) List!34922) Bool)

(assert (=> b!1504960 (= res!1024654 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34919))))

(assert (= (and start!128254 res!1024658) b!1504952))

(assert (= (and b!1504952 res!1024655) b!1504955))

(assert (= (and b!1504955 res!1024653) b!1504954))

(assert (= (and b!1504954 res!1024657) b!1504958))

(assert (= (and b!1504958 res!1024656) b!1504960))

(assert (= (and b!1504960 res!1024654) b!1504957))

(assert (= (and b!1504957 res!1024659) b!1504956))

(assert (= (and b!1504956 res!1024660) b!1504953))

(assert (= (and b!1504953 res!1024661) b!1504959))

(declare-fun m!1388131 () Bool)

(assert (=> b!1504956 m!1388131))

(assert (=> b!1504956 m!1388131))

(declare-fun m!1388133 () Bool)

(assert (=> b!1504956 m!1388133))

(assert (=> b!1504954 m!1388131))

(assert (=> b!1504954 m!1388131))

(declare-fun m!1388135 () Bool)

(assert (=> b!1504954 m!1388135))

(declare-fun m!1388137 () Bool)

(assert (=> b!1504958 m!1388137))

(declare-fun m!1388139 () Bool)

(assert (=> start!128254 m!1388139))

(declare-fun m!1388141 () Bool)

(assert (=> start!128254 m!1388141))

(declare-fun m!1388143 () Bool)

(assert (=> b!1504955 m!1388143))

(assert (=> b!1504955 m!1388143))

(declare-fun m!1388145 () Bool)

(assert (=> b!1504955 m!1388145))

(declare-fun m!1388147 () Bool)

(assert (=> b!1504957 m!1388147))

(declare-fun m!1388149 () Bool)

(assert (=> b!1504957 m!1388149))

(declare-fun m!1388151 () Bool)

(assert (=> b!1504957 m!1388151))

(declare-fun m!1388153 () Bool)

(assert (=> b!1504959 m!1388153))

(declare-fun m!1388155 () Bool)

(assert (=> b!1504953 m!1388155))

(assert (=> b!1504953 m!1388131))

(declare-fun m!1388157 () Bool)

(assert (=> b!1504960 m!1388157))

(push 1)

(assert (not b!1504954))

(assert (not b!1504959))

(assert (not b!1504958))

(assert (not b!1504956))

(assert (not b!1504955))

(assert (not b!1504960))

(assert (not start!128254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

