; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128022 () Bool)

(assert start!128022)

(declare-fun b!1503938 () Bool)

(declare-fun res!1024922 () Bool)

(declare-fun e!840654 () Bool)

(assert (=> b!1503938 (=> (not res!1024922) (not e!840654))))

(declare-datatypes ((array!100292 0))(
  ( (array!100293 (arr!48402 (Array (_ BitVec 32) (_ BitVec 64))) (size!48954 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100292)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503938 (= res!1024922 (validKeyInArray!0 (select (arr!48402 a!2850) j!87)))))

(declare-fun b!1503939 () Bool)

(declare-fun res!1024915 () Bool)

(assert (=> b!1503939 (=> (not res!1024915) (not e!840654))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503939 (= res!1024915 (validKeyInArray!0 (select (arr!48402 a!2850) i!996)))))

(declare-fun b!1503940 () Bool)

(declare-fun res!1024918 () Bool)

(assert (=> b!1503940 (=> (not res!1024918) (not e!840654))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503940 (= res!1024918 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48954 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48954 a!2850)) (= (select (arr!48402 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48402 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48954 a!2850))))))

(declare-fun b!1503941 () Bool)

(declare-fun res!1024917 () Bool)

(assert (=> b!1503941 (=> (not res!1024917) (not e!840654))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100292 (_ BitVec 32)) Bool)

(assert (=> b!1503941 (= res!1024917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503942 () Bool)

(declare-fun res!1024916 () Bool)

(assert (=> b!1503942 (=> (not res!1024916) (not e!840654))))

(declare-datatypes ((SeekEntryResult!12621 0))(
  ( (MissingZero!12621 (index!52876 (_ BitVec 32))) (Found!12621 (index!52877 (_ BitVec 32))) (Intermediate!12621 (undefined!13433 Bool) (index!52878 (_ BitVec 32)) (x!134558 (_ BitVec 32))) (Undefined!12621) (MissingVacant!12621 (index!52879 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100292 (_ BitVec 32)) SeekEntryResult!12621)

(assert (=> b!1503942 (= res!1024916 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48402 a!2850) j!87) a!2850 mask!2661) (Found!12621 j!87)))))

(declare-fun b!1503943 () Bool)

(declare-fun res!1024921 () Bool)

(assert (=> b!1503943 (=> (not res!1024921) (not e!840654))))

(assert (=> b!1503943 (= res!1024921 (and (= (size!48954 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48954 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48954 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503944 () Bool)

(declare-fun res!1024914 () Bool)

(assert (=> b!1503944 (=> (not res!1024914) (not e!840654))))

(declare-datatypes ((List!34972 0))(
  ( (Nil!34969) (Cons!34968 (h!36366 (_ BitVec 64)) (t!49658 List!34972)) )
))
(declare-fun arrayNoDuplicates!0 (array!100292 (_ BitVec 32) List!34972) Bool)

(assert (=> b!1503944 (= res!1024914 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34969))))

(declare-fun b!1503945 () Bool)

(declare-fun res!1024920 () Bool)

(assert (=> b!1503945 (=> (not res!1024920) (not e!840654))))

(assert (=> b!1503945 (= res!1024920 (not (= (select (arr!48402 a!2850) index!625) (select (arr!48402 a!2850) j!87))))))

(declare-fun b!1503946 () Bool)

(assert (=> b!1503946 (= e!840654 false)))

(declare-fun lt!653377 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503946 (= lt!653377 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024919 () Bool)

(assert (=> start!128022 (=> (not res!1024919) (not e!840654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128022 (= res!1024919 (validMask!0 mask!2661))))

(assert (=> start!128022 e!840654))

(assert (=> start!128022 true))

(declare-fun array_inv!37635 (array!100292) Bool)

(assert (=> start!128022 (array_inv!37635 a!2850)))

(assert (= (and start!128022 res!1024919) b!1503943))

(assert (= (and b!1503943 res!1024921) b!1503939))

(assert (= (and b!1503939 res!1024915) b!1503938))

(assert (= (and b!1503938 res!1024922) b!1503941))

(assert (= (and b!1503941 res!1024917) b!1503944))

(assert (= (and b!1503944 res!1024914) b!1503940))

(assert (= (and b!1503940 res!1024918) b!1503942))

(assert (= (and b!1503942 res!1024916) b!1503945))

(assert (= (and b!1503945 res!1024920) b!1503946))

(declare-fun m!1386597 () Bool)

(assert (=> b!1503941 m!1386597))

(declare-fun m!1386599 () Bool)

(assert (=> b!1503946 m!1386599))

(declare-fun m!1386601 () Bool)

(assert (=> b!1503939 m!1386601))

(assert (=> b!1503939 m!1386601))

(declare-fun m!1386603 () Bool)

(assert (=> b!1503939 m!1386603))

(declare-fun m!1386605 () Bool)

(assert (=> b!1503944 m!1386605))

(declare-fun m!1386607 () Bool)

(assert (=> b!1503942 m!1386607))

(assert (=> b!1503942 m!1386607))

(declare-fun m!1386609 () Bool)

(assert (=> b!1503942 m!1386609))

(declare-fun m!1386611 () Bool)

(assert (=> b!1503945 m!1386611))

(assert (=> b!1503945 m!1386607))

(declare-fun m!1386613 () Bool)

(assert (=> b!1503940 m!1386613))

(declare-fun m!1386615 () Bool)

(assert (=> b!1503940 m!1386615))

(declare-fun m!1386617 () Bool)

(assert (=> b!1503940 m!1386617))

(declare-fun m!1386619 () Bool)

(assert (=> start!128022 m!1386619))

(declare-fun m!1386621 () Bool)

(assert (=> start!128022 m!1386621))

(assert (=> b!1503938 m!1386607))

(assert (=> b!1503938 m!1386607))

(declare-fun m!1386623 () Bool)

(assert (=> b!1503938 m!1386623))

(push 1)

(assert (not b!1503944))

(assert (not b!1503941))

(assert (not b!1503938))

(assert (not b!1503939))

(assert (not b!1503942))

(assert (not start!128022))

(assert (not b!1503946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

