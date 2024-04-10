; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127648 () Bool)

(assert start!127648)

(declare-fun b!1499681 () Bool)

(declare-fun e!839366 () Bool)

(declare-fun e!839368 () Bool)

(assert (=> b!1499681 (= e!839366 e!839368)))

(declare-fun res!1020759 () Bool)

(assert (=> b!1499681 (=> (not res!1020759) (not e!839368))))

(declare-datatypes ((array!100029 0))(
  ( (array!100030 (arr!48274 (Array (_ BitVec 32) (_ BitVec 64))) (size!48824 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100029)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652786 () (_ BitVec 32))

(assert (=> b!1499681 (= res!1020759 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652786 #b00000000000000000000000000000000) (bvslt lt!652786 (size!48824 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499681 (= lt!652786 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499682 () Bool)

(declare-fun res!1020760 () Bool)

(assert (=> b!1499682 (=> (not res!1020760) (not e!839366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100029 (_ BitVec 32)) Bool)

(assert (=> b!1499682 (= res!1020760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499683 () Bool)

(declare-fun res!1020757 () Bool)

(assert (=> b!1499683 (=> (not res!1020757) (not e!839366))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499683 (= res!1020757 (validKeyInArray!0 (select (arr!48274 a!2850) i!996)))))

(declare-fun b!1499684 () Bool)

(declare-fun res!1020764 () Bool)

(assert (=> b!1499684 (=> (not res!1020764) (not e!839366))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499684 (= res!1020764 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48824 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48824 a!2850)) (= (select (arr!48274 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48274 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48824 a!2850))))))

(declare-fun b!1499685 () Bool)

(declare-fun res!1020758 () Bool)

(assert (=> b!1499685 (=> (not res!1020758) (not e!839366))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499685 (= res!1020758 (and (= (size!48824 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48824 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48824 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499686 () Bool)

(declare-fun res!1020766 () Bool)

(assert (=> b!1499686 (=> (not res!1020766) (not e!839366))))

(assert (=> b!1499686 (= res!1020766 (validKeyInArray!0 (select (arr!48274 a!2850) j!87)))))

(declare-fun res!1020762 () Bool)

(assert (=> start!127648 (=> (not res!1020762) (not e!839366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127648 (= res!1020762 (validMask!0 mask!2661))))

(assert (=> start!127648 e!839366))

(assert (=> start!127648 true))

(declare-fun array_inv!37302 (array!100029) Bool)

(assert (=> start!127648 (array_inv!37302 a!2850)))

(declare-fun b!1499687 () Bool)

(declare-fun res!1020765 () Bool)

(assert (=> b!1499687 (=> (not res!1020765) (not e!839366))))

(declare-datatypes ((SeekEntryResult!12484 0))(
  ( (MissingZero!12484 (index!52328 (_ BitVec 32))) (Found!12484 (index!52329 (_ BitVec 32))) (Intermediate!12484 (undefined!13296 Bool) (index!52330 (_ BitVec 32)) (x!134006 (_ BitVec 32))) (Undefined!12484) (MissingVacant!12484 (index!52331 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100029 (_ BitVec 32)) SeekEntryResult!12484)

(assert (=> b!1499687 (= res!1020765 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48274 a!2850) j!87) a!2850 mask!2661) (Found!12484 j!87)))))

(declare-fun b!1499688 () Bool)

(assert (=> b!1499688 (= e!839368 false)))

(declare-fun lt!652785 () SeekEntryResult!12484)

(assert (=> b!1499688 (= lt!652785 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652786 vacantBefore!10 (select (arr!48274 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499689 () Bool)

(declare-fun res!1020761 () Bool)

(assert (=> b!1499689 (=> (not res!1020761) (not e!839366))))

(assert (=> b!1499689 (= res!1020761 (not (= (select (arr!48274 a!2850) index!625) (select (arr!48274 a!2850) j!87))))))

(declare-fun b!1499690 () Bool)

(declare-fun res!1020763 () Bool)

(assert (=> b!1499690 (=> (not res!1020763) (not e!839366))))

(declare-datatypes ((List!34766 0))(
  ( (Nil!34763) (Cons!34762 (h!36159 (_ BitVec 64)) (t!49460 List!34766)) )
))
(declare-fun arrayNoDuplicates!0 (array!100029 (_ BitVec 32) List!34766) Bool)

(assert (=> b!1499690 (= res!1020763 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34763))))

(assert (= (and start!127648 res!1020762) b!1499685))

(assert (= (and b!1499685 res!1020758) b!1499683))

(assert (= (and b!1499683 res!1020757) b!1499686))

(assert (= (and b!1499686 res!1020766) b!1499682))

(assert (= (and b!1499682 res!1020760) b!1499690))

(assert (= (and b!1499690 res!1020763) b!1499684))

(assert (= (and b!1499684 res!1020764) b!1499687))

(assert (= (and b!1499687 res!1020765) b!1499689))

(assert (= (and b!1499689 res!1020761) b!1499681))

(assert (= (and b!1499681 res!1020759) b!1499688))

(declare-fun m!1382875 () Bool)

(assert (=> b!1499684 m!1382875))

(declare-fun m!1382877 () Bool)

(assert (=> b!1499684 m!1382877))

(declare-fun m!1382879 () Bool)

(assert (=> b!1499684 m!1382879))

(declare-fun m!1382881 () Bool)

(assert (=> start!127648 m!1382881))

(declare-fun m!1382883 () Bool)

(assert (=> start!127648 m!1382883))

(declare-fun m!1382885 () Bool)

(assert (=> b!1499686 m!1382885))

(assert (=> b!1499686 m!1382885))

(declare-fun m!1382887 () Bool)

(assert (=> b!1499686 m!1382887))

(declare-fun m!1382889 () Bool)

(assert (=> b!1499690 m!1382889))

(declare-fun m!1382891 () Bool)

(assert (=> b!1499682 m!1382891))

(declare-fun m!1382893 () Bool)

(assert (=> b!1499681 m!1382893))

(assert (=> b!1499688 m!1382885))

(assert (=> b!1499688 m!1382885))

(declare-fun m!1382895 () Bool)

(assert (=> b!1499688 m!1382895))

(assert (=> b!1499687 m!1382885))

(assert (=> b!1499687 m!1382885))

(declare-fun m!1382897 () Bool)

(assert (=> b!1499687 m!1382897))

(declare-fun m!1382899 () Bool)

(assert (=> b!1499689 m!1382899))

(assert (=> b!1499689 m!1382885))

(declare-fun m!1382901 () Bool)

(assert (=> b!1499683 m!1382901))

(assert (=> b!1499683 m!1382901))

(declare-fun m!1382903 () Bool)

(assert (=> b!1499683 m!1382903))

(push 1)

(assert (not b!1499688))

(assert (not b!1499681))

(assert (not b!1499686))

(assert (not b!1499690))

(assert (not start!127648))

(assert (not b!1499683))

(assert (not b!1499687))

(assert (not b!1499682))

(check-sat)

(pop 1)

