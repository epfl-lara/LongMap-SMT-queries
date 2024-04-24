; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128030 () Bool)

(assert start!128030)

(declare-fun b!1502719 () Bool)

(declare-fun res!1022619 () Bool)

(declare-fun e!840865 () Bool)

(assert (=> b!1502719 (=> (not res!1022619) (not e!840865))))

(declare-datatypes ((array!100225 0))(
  ( (array!100226 (arr!48367 (Array (_ BitVec 32) (_ BitVec 64))) (size!48918 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100225)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502719 (= res!1022619 (validKeyInArray!0 (select (arr!48367 a!2850) i!996)))))

(declare-fun b!1502720 () Bool)

(declare-fun e!840866 () Bool)

(assert (=> b!1502720 (= e!840865 e!840866)))

(declare-fun res!1022612 () Bool)

(assert (=> b!1502720 (=> (not res!1022612) (not e!840866))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653690 () (_ BitVec 32))

(assert (=> b!1502720 (= res!1022612 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653690 #b00000000000000000000000000000000) (bvslt lt!653690 (size!48918 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502720 (= lt!653690 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502721 () Bool)

(declare-fun res!1022614 () Bool)

(assert (=> b!1502721 (=> (not res!1022614) (not e!840865))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12470 0))(
  ( (MissingZero!12470 (index!52272 (_ BitVec 32))) (Found!12470 (index!52273 (_ BitVec 32))) (Intermediate!12470 (undefined!13282 Bool) (index!52274 (_ BitVec 32)) (x!134141 (_ BitVec 32))) (Undefined!12470) (MissingVacant!12470 (index!52275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100225 (_ BitVec 32)) SeekEntryResult!12470)

(assert (=> b!1502721 (= res!1022614 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48367 a!2850) j!87) a!2850 mask!2661) (Found!12470 j!87)))))

(declare-fun b!1502722 () Bool)

(assert (=> b!1502722 (= e!840866 false)))

(declare-fun lt!653691 () SeekEntryResult!12470)

(assert (=> b!1502722 (= lt!653691 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653690 vacantBefore!10 (select (arr!48367 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502723 () Bool)

(declare-fun res!1022616 () Bool)

(assert (=> b!1502723 (=> (not res!1022616) (not e!840865))))

(declare-datatypes ((List!34846 0))(
  ( (Nil!34843) (Cons!34842 (h!36254 (_ BitVec 64)) (t!49532 List!34846)) )
))
(declare-fun arrayNoDuplicates!0 (array!100225 (_ BitVec 32) List!34846) Bool)

(assert (=> b!1502723 (= res!1022616 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34843))))

(declare-fun b!1502724 () Bool)

(declare-fun res!1022621 () Bool)

(assert (=> b!1502724 (=> (not res!1022621) (not e!840865))))

(assert (=> b!1502724 (= res!1022621 (and (= (size!48918 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48918 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48918 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502726 () Bool)

(declare-fun res!1022620 () Bool)

(assert (=> b!1502726 (=> (not res!1022620) (not e!840865))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502726 (= res!1022620 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48918 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48918 a!2850)) (= (select (arr!48367 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48367 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48918 a!2850))))))

(declare-fun b!1502727 () Bool)

(declare-fun res!1022617 () Bool)

(assert (=> b!1502727 (=> (not res!1022617) (not e!840865))))

(assert (=> b!1502727 (= res!1022617 (not (= (select (arr!48367 a!2850) index!625) (select (arr!48367 a!2850) j!87))))))

(declare-fun b!1502728 () Bool)

(declare-fun res!1022618 () Bool)

(assert (=> b!1502728 (=> (not res!1022618) (not e!840865))))

(assert (=> b!1502728 (= res!1022618 (validKeyInArray!0 (select (arr!48367 a!2850) j!87)))))

(declare-fun res!1022613 () Bool)

(assert (=> start!128030 (=> (not res!1022613) (not e!840865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128030 (= res!1022613 (validMask!0 mask!2661))))

(assert (=> start!128030 e!840865))

(assert (=> start!128030 true))

(declare-fun array_inv!37648 (array!100225) Bool)

(assert (=> start!128030 (array_inv!37648 a!2850)))

(declare-fun b!1502725 () Bool)

(declare-fun res!1022615 () Bool)

(assert (=> b!1502725 (=> (not res!1022615) (not e!840865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100225 (_ BitVec 32)) Bool)

(assert (=> b!1502725 (= res!1022615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128030 res!1022613) b!1502724))

(assert (= (and b!1502724 res!1022621) b!1502719))

(assert (= (and b!1502719 res!1022619) b!1502728))

(assert (= (and b!1502728 res!1022618) b!1502725))

(assert (= (and b!1502725 res!1022615) b!1502723))

(assert (= (and b!1502723 res!1022616) b!1502726))

(assert (= (and b!1502726 res!1022620) b!1502721))

(assert (= (and b!1502721 res!1022614) b!1502727))

(assert (= (and b!1502727 res!1022617) b!1502720))

(assert (= (and b!1502720 res!1022612) b!1502722))

(declare-fun m!1385863 () Bool)

(assert (=> b!1502728 m!1385863))

(assert (=> b!1502728 m!1385863))

(declare-fun m!1385865 () Bool)

(assert (=> b!1502728 m!1385865))

(declare-fun m!1385867 () Bool)

(assert (=> b!1502725 m!1385867))

(declare-fun m!1385869 () Bool)

(assert (=> start!128030 m!1385869))

(declare-fun m!1385871 () Bool)

(assert (=> start!128030 m!1385871))

(declare-fun m!1385873 () Bool)

(assert (=> b!1502727 m!1385873))

(assert (=> b!1502727 m!1385863))

(assert (=> b!1502721 m!1385863))

(assert (=> b!1502721 m!1385863))

(declare-fun m!1385875 () Bool)

(assert (=> b!1502721 m!1385875))

(declare-fun m!1385877 () Bool)

(assert (=> b!1502720 m!1385877))

(assert (=> b!1502722 m!1385863))

(assert (=> b!1502722 m!1385863))

(declare-fun m!1385879 () Bool)

(assert (=> b!1502722 m!1385879))

(declare-fun m!1385881 () Bool)

(assert (=> b!1502719 m!1385881))

(assert (=> b!1502719 m!1385881))

(declare-fun m!1385883 () Bool)

(assert (=> b!1502719 m!1385883))

(declare-fun m!1385885 () Bool)

(assert (=> b!1502723 m!1385885))

(declare-fun m!1385887 () Bool)

(assert (=> b!1502726 m!1385887))

(declare-fun m!1385889 () Bool)

(assert (=> b!1502726 m!1385889))

(declare-fun m!1385891 () Bool)

(assert (=> b!1502726 m!1385891))

(check-sat (not b!1502720) (not start!128030) (not b!1502721) (not b!1502722) (not b!1502728) (not b!1502723) (not b!1502719) (not b!1502725))
(check-sat)
