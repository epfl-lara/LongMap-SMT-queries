; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127666 () Bool)

(assert start!127666)

(declare-fun b!1499951 () Bool)

(declare-fun res!1021031 () Bool)

(declare-fun e!839448 () Bool)

(assert (=> b!1499951 (=> (not res!1021031) (not e!839448))))

(declare-datatypes ((array!100047 0))(
  ( (array!100048 (arr!48283 (Array (_ BitVec 32) (_ BitVec 64))) (size!48833 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100047)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499951 (= res!1021031 (not (= (select (arr!48283 a!2850) index!625) (select (arr!48283 a!2850) j!87))))))

(declare-fun b!1499952 () Bool)

(declare-fun e!839449 () Bool)

(assert (=> b!1499952 (= e!839449 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652840 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12493 0))(
  ( (MissingZero!12493 (index!52364 (_ BitVec 32))) (Found!12493 (index!52365 (_ BitVec 32))) (Intermediate!12493 (undefined!13305 Bool) (index!52366 (_ BitVec 32)) (x!134039 (_ BitVec 32))) (Undefined!12493) (MissingVacant!12493 (index!52367 (_ BitVec 32))) )
))
(declare-fun lt!652839 () SeekEntryResult!12493)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100047 (_ BitVec 32)) SeekEntryResult!12493)

(assert (=> b!1499952 (= lt!652839 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652840 vacantBefore!10 (select (arr!48283 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499953 () Bool)

(declare-fun res!1021036 () Bool)

(assert (=> b!1499953 (=> (not res!1021036) (not e!839448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499953 (= res!1021036 (validKeyInArray!0 (select (arr!48283 a!2850) j!87)))))

(declare-fun b!1499954 () Bool)

(declare-fun res!1021032 () Bool)

(assert (=> b!1499954 (=> (not res!1021032) (not e!839448))))

(assert (=> b!1499954 (= res!1021032 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48283 a!2850) j!87) a!2850 mask!2661) (Found!12493 j!87)))))

(declare-fun b!1499955 () Bool)

(declare-fun res!1021029 () Bool)

(assert (=> b!1499955 (=> (not res!1021029) (not e!839448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100047 (_ BitVec 32)) Bool)

(assert (=> b!1499955 (= res!1021029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1021035 () Bool)

(assert (=> start!127666 (=> (not res!1021035) (not e!839448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127666 (= res!1021035 (validMask!0 mask!2661))))

(assert (=> start!127666 e!839448))

(assert (=> start!127666 true))

(declare-fun array_inv!37311 (array!100047) Bool)

(assert (=> start!127666 (array_inv!37311 a!2850)))

(declare-fun b!1499956 () Bool)

(declare-fun res!1021028 () Bool)

(assert (=> b!1499956 (=> (not res!1021028) (not e!839448))))

(declare-datatypes ((List!34775 0))(
  ( (Nil!34772) (Cons!34771 (h!36168 (_ BitVec 64)) (t!49469 List!34775)) )
))
(declare-fun arrayNoDuplicates!0 (array!100047 (_ BitVec 32) List!34775) Bool)

(assert (=> b!1499956 (= res!1021028 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34772))))

(declare-fun b!1499957 () Bool)

(declare-fun res!1021030 () Bool)

(assert (=> b!1499957 (=> (not res!1021030) (not e!839448))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499957 (= res!1021030 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48833 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48833 a!2850)) (= (select (arr!48283 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48283 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48833 a!2850))))))

(declare-fun b!1499958 () Bool)

(declare-fun res!1021034 () Bool)

(assert (=> b!1499958 (=> (not res!1021034) (not e!839448))))

(assert (=> b!1499958 (= res!1021034 (and (= (size!48833 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48833 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48833 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499959 () Bool)

(assert (=> b!1499959 (= e!839448 e!839449)))

(declare-fun res!1021027 () Bool)

(assert (=> b!1499959 (=> (not res!1021027) (not e!839449))))

(assert (=> b!1499959 (= res!1021027 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652840 #b00000000000000000000000000000000) (bvslt lt!652840 (size!48833 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499959 (= lt!652840 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499960 () Bool)

(declare-fun res!1021033 () Bool)

(assert (=> b!1499960 (=> (not res!1021033) (not e!839448))))

(assert (=> b!1499960 (= res!1021033 (validKeyInArray!0 (select (arr!48283 a!2850) i!996)))))

(assert (= (and start!127666 res!1021035) b!1499958))

(assert (= (and b!1499958 res!1021034) b!1499960))

(assert (= (and b!1499960 res!1021033) b!1499953))

(assert (= (and b!1499953 res!1021036) b!1499955))

(assert (= (and b!1499955 res!1021029) b!1499956))

(assert (= (and b!1499956 res!1021028) b!1499957))

(assert (= (and b!1499957 res!1021030) b!1499954))

(assert (= (and b!1499954 res!1021032) b!1499951))

(assert (= (and b!1499951 res!1021031) b!1499959))

(assert (= (and b!1499959 res!1021027) b!1499952))

(declare-fun m!1383145 () Bool)

(assert (=> b!1499952 m!1383145))

(assert (=> b!1499952 m!1383145))

(declare-fun m!1383147 () Bool)

(assert (=> b!1499952 m!1383147))

(declare-fun m!1383149 () Bool)

(assert (=> start!127666 m!1383149))

(declare-fun m!1383151 () Bool)

(assert (=> start!127666 m!1383151))

(declare-fun m!1383153 () Bool)

(assert (=> b!1499960 m!1383153))

(assert (=> b!1499960 m!1383153))

(declare-fun m!1383155 () Bool)

(assert (=> b!1499960 m!1383155))

(declare-fun m!1383157 () Bool)

(assert (=> b!1499955 m!1383157))

(declare-fun m!1383159 () Bool)

(assert (=> b!1499959 m!1383159))

(assert (=> b!1499954 m!1383145))

(assert (=> b!1499954 m!1383145))

(declare-fun m!1383161 () Bool)

(assert (=> b!1499954 m!1383161))

(declare-fun m!1383163 () Bool)

(assert (=> b!1499956 m!1383163))

(assert (=> b!1499953 m!1383145))

(assert (=> b!1499953 m!1383145))

(declare-fun m!1383165 () Bool)

(assert (=> b!1499953 m!1383165))

(declare-fun m!1383167 () Bool)

(assert (=> b!1499951 m!1383167))

(assert (=> b!1499951 m!1383145))

(declare-fun m!1383169 () Bool)

(assert (=> b!1499957 m!1383169))

(declare-fun m!1383171 () Bool)

(assert (=> b!1499957 m!1383171))

(declare-fun m!1383173 () Bool)

(assert (=> b!1499957 m!1383173))

(push 1)

(assert (not b!1499960))

(assert (not b!1499955))

(assert (not b!1499952))

(assert (not b!1499953))

(assert (not b!1499959))

(assert (not b!1499954))

(assert (not b!1499956))

(assert (not start!127666))

(check-sat)

