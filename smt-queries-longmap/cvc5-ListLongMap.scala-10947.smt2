; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128016 () Bool)

(assert start!128016)

(declare-fun b!1503857 () Bool)

(declare-fun res!1024841 () Bool)

(declare-fun e!840635 () Bool)

(assert (=> b!1503857 (=> (not res!1024841) (not e!840635))))

(declare-datatypes ((array!100286 0))(
  ( (array!100287 (arr!48399 (Array (_ BitVec 32) (_ BitVec 64))) (size!48951 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100286)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100286 (_ BitVec 32)) Bool)

(assert (=> b!1503857 (= res!1024841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503858 () Bool)

(declare-fun res!1024834 () Bool)

(assert (=> b!1503858 (=> (not res!1024834) (not e!840635))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503858 (= res!1024834 (validKeyInArray!0 (select (arr!48399 a!2850) i!996)))))

(declare-fun b!1503859 () Bool)

(declare-fun res!1024835 () Bool)

(assert (=> b!1503859 (=> (not res!1024835) (not e!840635))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503859 (= res!1024835 (validKeyInArray!0 (select (arr!48399 a!2850) j!87)))))

(declare-fun b!1503860 () Bool)

(declare-fun res!1024840 () Bool)

(assert (=> b!1503860 (=> (not res!1024840) (not e!840635))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503860 (= res!1024840 (not (= (select (arr!48399 a!2850) index!625) (select (arr!48399 a!2850) j!87))))))

(declare-fun b!1503861 () Bool)

(declare-fun res!1024833 () Bool)

(assert (=> b!1503861 (=> (not res!1024833) (not e!840635))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503861 (= res!1024833 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48951 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48951 a!2850)) (= (select (arr!48399 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48399 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48951 a!2850))))))

(declare-fun res!1024839 () Bool)

(assert (=> start!128016 (=> (not res!1024839) (not e!840635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128016 (= res!1024839 (validMask!0 mask!2661))))

(assert (=> start!128016 e!840635))

(assert (=> start!128016 true))

(declare-fun array_inv!37632 (array!100286) Bool)

(assert (=> start!128016 (array_inv!37632 a!2850)))

(declare-fun b!1503862 () Bool)

(declare-fun res!1024837 () Bool)

(assert (=> b!1503862 (=> (not res!1024837) (not e!840635))))

(declare-datatypes ((List!34969 0))(
  ( (Nil!34966) (Cons!34965 (h!36363 (_ BitVec 64)) (t!49655 List!34969)) )
))
(declare-fun arrayNoDuplicates!0 (array!100286 (_ BitVec 32) List!34969) Bool)

(assert (=> b!1503862 (= res!1024837 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34966))))

(declare-fun b!1503863 () Bool)

(declare-fun res!1024836 () Bool)

(assert (=> b!1503863 (=> (not res!1024836) (not e!840635))))

(declare-datatypes ((SeekEntryResult!12618 0))(
  ( (MissingZero!12618 (index!52864 (_ BitVec 32))) (Found!12618 (index!52865 (_ BitVec 32))) (Intermediate!12618 (undefined!13430 Bool) (index!52866 (_ BitVec 32)) (x!134547 (_ BitVec 32))) (Undefined!12618) (MissingVacant!12618 (index!52867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100286 (_ BitVec 32)) SeekEntryResult!12618)

(assert (=> b!1503863 (= res!1024836 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48399 a!2850) j!87) a!2850 mask!2661) (Found!12618 j!87)))))

(declare-fun b!1503864 () Bool)

(declare-fun res!1024838 () Bool)

(assert (=> b!1503864 (=> (not res!1024838) (not e!840635))))

(assert (=> b!1503864 (= res!1024838 (and (= (size!48951 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48951 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48951 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503865 () Bool)

(assert (=> b!1503865 (= e!840635 false)))

(declare-fun lt!653368 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503865 (= lt!653368 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128016 res!1024839) b!1503864))

(assert (= (and b!1503864 res!1024838) b!1503858))

(assert (= (and b!1503858 res!1024834) b!1503859))

(assert (= (and b!1503859 res!1024835) b!1503857))

(assert (= (and b!1503857 res!1024841) b!1503862))

(assert (= (and b!1503862 res!1024837) b!1503861))

(assert (= (and b!1503861 res!1024833) b!1503863))

(assert (= (and b!1503863 res!1024836) b!1503860))

(assert (= (and b!1503860 res!1024840) b!1503865))

(declare-fun m!1386513 () Bool)

(assert (=> b!1503865 m!1386513))

(declare-fun m!1386515 () Bool)

(assert (=> b!1503863 m!1386515))

(assert (=> b!1503863 m!1386515))

(declare-fun m!1386517 () Bool)

(assert (=> b!1503863 m!1386517))

(assert (=> b!1503859 m!1386515))

(assert (=> b!1503859 m!1386515))

(declare-fun m!1386519 () Bool)

(assert (=> b!1503859 m!1386519))

(declare-fun m!1386521 () Bool)

(assert (=> b!1503858 m!1386521))

(assert (=> b!1503858 m!1386521))

(declare-fun m!1386523 () Bool)

(assert (=> b!1503858 m!1386523))

(declare-fun m!1386525 () Bool)

(assert (=> b!1503861 m!1386525))

(declare-fun m!1386527 () Bool)

(assert (=> b!1503861 m!1386527))

(declare-fun m!1386529 () Bool)

(assert (=> b!1503861 m!1386529))

(declare-fun m!1386531 () Bool)

(assert (=> b!1503862 m!1386531))

(declare-fun m!1386533 () Bool)

(assert (=> b!1503857 m!1386533))

(declare-fun m!1386535 () Bool)

(assert (=> b!1503860 m!1386535))

(assert (=> b!1503860 m!1386515))

(declare-fun m!1386537 () Bool)

(assert (=> start!128016 m!1386537))

(declare-fun m!1386539 () Bool)

(assert (=> start!128016 m!1386539))

(push 1)

(assert (not b!1503863))

(assert (not b!1503857))

(assert (not b!1503858))

(assert (not b!1503862))

(assert (not b!1503859))

(assert (not start!128016))

(assert (not b!1503865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

