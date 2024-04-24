; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128242 () Bool)

(assert start!128242)

(declare-fun b!1504790 () Bool)

(declare-fun res!1024498 () Bool)

(declare-fun e!841641 () Bool)

(assert (=> b!1504790 (=> (not res!1024498) (not e!841641))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100371 0))(
  ( (array!100372 (arr!48437 (Array (_ BitVec 32) (_ BitVec 64))) (size!48988 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100371)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504790 (= res!1024498 (and (= (size!48988 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48988 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48988 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504791 () Bool)

(declare-fun res!1024499 () Bool)

(assert (=> b!1504791 (=> (not res!1024499) (not e!841641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504791 (= res!1024499 (validKeyInArray!0 (select (arr!48437 a!2850) j!87)))))

(declare-fun res!1024491 () Bool)

(assert (=> start!128242 (=> (not res!1024491) (not e!841641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128242 (= res!1024491 (validMask!0 mask!2661))))

(assert (=> start!128242 e!841641))

(assert (=> start!128242 true))

(declare-fun array_inv!37718 (array!100371) Bool)

(assert (=> start!128242 (array_inv!37718 a!2850)))

(declare-fun b!1504792 () Bool)

(declare-fun res!1024492 () Bool)

(assert (=> b!1504792 (=> (not res!1024492) (not e!841641))))

(declare-datatypes ((List!34916 0))(
  ( (Nil!34913) (Cons!34912 (h!36324 (_ BitVec 64)) (t!49602 List!34916)) )
))
(declare-fun arrayNoDuplicates!0 (array!100371 (_ BitVec 32) List!34916) Bool)

(assert (=> b!1504792 (= res!1024492 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34913))))

(declare-fun b!1504793 () Bool)

(declare-fun res!1024497 () Bool)

(assert (=> b!1504793 (=> (not res!1024497) (not e!841641))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504793 (= res!1024497 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48988 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48988 a!2850)) (= (select (arr!48437 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48437 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48988 a!2850))))))

(declare-fun b!1504794 () Bool)

(assert (=> b!1504794 (= e!841641 false)))

(declare-fun lt!654136 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504794 (= lt!654136 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1504795 () Bool)

(declare-fun res!1024496 () Bool)

(assert (=> b!1504795 (=> (not res!1024496) (not e!841641))))

(assert (=> b!1504795 (= res!1024496 (not (= (select (arr!48437 a!2850) index!625) (select (arr!48437 a!2850) j!87))))))

(declare-fun b!1504796 () Bool)

(declare-fun res!1024495 () Bool)

(assert (=> b!1504796 (=> (not res!1024495) (not e!841641))))

(declare-datatypes ((SeekEntryResult!12528 0))(
  ( (MissingZero!12528 (index!52504 (_ BitVec 32))) (Found!12528 (index!52505 (_ BitVec 32))) (Intermediate!12528 (undefined!13340 Bool) (index!52506 (_ BitVec 32)) (x!134389 (_ BitVec 32))) (Undefined!12528) (MissingVacant!12528 (index!52507 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100371 (_ BitVec 32)) SeekEntryResult!12528)

(assert (=> b!1504796 (= res!1024495 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48437 a!2850) j!87) a!2850 mask!2661) (Found!12528 j!87)))))

(declare-fun b!1504797 () Bool)

(declare-fun res!1024493 () Bool)

(assert (=> b!1504797 (=> (not res!1024493) (not e!841641))))

(assert (=> b!1504797 (= res!1024493 (validKeyInArray!0 (select (arr!48437 a!2850) i!996)))))

(declare-fun b!1504798 () Bool)

(declare-fun res!1024494 () Bool)

(assert (=> b!1504798 (=> (not res!1024494) (not e!841641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100371 (_ BitVec 32)) Bool)

(assert (=> b!1504798 (= res!1024494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128242 res!1024491) b!1504790))

(assert (= (and b!1504790 res!1024498) b!1504797))

(assert (= (and b!1504797 res!1024493) b!1504791))

(assert (= (and b!1504791 res!1024499) b!1504798))

(assert (= (and b!1504798 res!1024494) b!1504792))

(assert (= (and b!1504792 res!1024492) b!1504793))

(assert (= (and b!1504793 res!1024497) b!1504796))

(assert (= (and b!1504796 res!1024495) b!1504795))

(assert (= (and b!1504795 res!1024496) b!1504794))

(declare-fun m!1387963 () Bool)

(assert (=> b!1504797 m!1387963))

(assert (=> b!1504797 m!1387963))

(declare-fun m!1387965 () Bool)

(assert (=> b!1504797 m!1387965))

(declare-fun m!1387967 () Bool)

(assert (=> b!1504795 m!1387967))

(declare-fun m!1387969 () Bool)

(assert (=> b!1504795 m!1387969))

(declare-fun m!1387971 () Bool)

(assert (=> b!1504792 m!1387971))

(assert (=> b!1504796 m!1387969))

(assert (=> b!1504796 m!1387969))

(declare-fun m!1387973 () Bool)

(assert (=> b!1504796 m!1387973))

(declare-fun m!1387975 () Bool)

(assert (=> b!1504798 m!1387975))

(declare-fun m!1387977 () Bool)

(assert (=> b!1504793 m!1387977))

(declare-fun m!1387979 () Bool)

(assert (=> b!1504793 m!1387979))

(declare-fun m!1387981 () Bool)

(assert (=> b!1504793 m!1387981))

(assert (=> b!1504791 m!1387969))

(assert (=> b!1504791 m!1387969))

(declare-fun m!1387983 () Bool)

(assert (=> b!1504791 m!1387983))

(declare-fun m!1387985 () Bool)

(assert (=> start!128242 m!1387985))

(declare-fun m!1387987 () Bool)

(assert (=> start!128242 m!1387987))

(declare-fun m!1387989 () Bool)

(assert (=> b!1504794 m!1387989))

(push 1)

(assert (not b!1504792))

(assert (not b!1504798))

(assert (not b!1504797))

(assert (not start!128242))

(assert (not b!1504794))

(assert (not b!1504791))

(assert (not b!1504796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

