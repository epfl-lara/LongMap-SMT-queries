; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128168 () Bool)

(assert start!128168)

(declare-fun b!1504777 () Bool)

(declare-fun res!1025368 () Bool)

(declare-fun e!841118 () Bool)

(assert (=> b!1504777 (=> (not res!1025368) (not e!841118))))

(declare-datatypes ((array!100366 0))(
  ( (array!100367 (arr!48435 (Array (_ BitVec 32) (_ BitVec 64))) (size!48985 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100366)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504777 (= res!1025368 (validKeyInArray!0 (select (arr!48435 a!2850) i!996)))))

(declare-fun b!1504778 () Bool)

(declare-fun res!1025376 () Bool)

(assert (=> b!1504778 (=> (not res!1025376) (not e!841118))))

(declare-datatypes ((List!34927 0))(
  ( (Nil!34924) (Cons!34923 (h!36320 (_ BitVec 64)) (t!49621 List!34927)) )
))
(declare-fun arrayNoDuplicates!0 (array!100366 (_ BitVec 32) List!34927) Bool)

(assert (=> b!1504778 (= res!1025376 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34924))))

(declare-fun b!1504779 () Bool)

(declare-fun e!841119 () Bool)

(declare-fun e!841117 () Bool)

(assert (=> b!1504779 (= e!841119 e!841117)))

(declare-fun res!1025373 () Bool)

(assert (=> b!1504779 (=> (not res!1025373) (not e!841117))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653809 () (_ BitVec 32))

(assert (=> b!1504779 (= res!1025373 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653809 #b00000000000000000000000000000000) (bvslt lt!653809 (size!48985 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504779 (= lt!653809 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504780 () Bool)

(assert (=> b!1504780 (= e!841117 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!647)) (bvsub #b01111111111111111111111111111110 x!647)))))

(declare-fun b!1504781 () Bool)

(declare-fun res!1025370 () Bool)

(assert (=> b!1504781 (=> (not res!1025370) (not e!841118))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504781 (= res!1025370 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48985 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48985 a!2850)) (= (select (arr!48435 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48435 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48985 a!2850))))))

(declare-fun b!1504782 () Bool)

(assert (=> b!1504782 (= e!841118 e!841119)))

(declare-fun res!1025372 () Bool)

(assert (=> b!1504782 (=> (not res!1025372) (not e!841119))))

(declare-datatypes ((SeekEntryResult!12633 0))(
  ( (MissingZero!12633 (index!52924 (_ BitVec 32))) (Found!12633 (index!52925 (_ BitVec 32))) (Intermediate!12633 (undefined!13445 Bool) (index!52926 (_ BitVec 32)) (x!134611 (_ BitVec 32))) (Undefined!12633) (MissingVacant!12633 (index!52927 (_ BitVec 32))) )
))
(declare-fun lt!653808 () SeekEntryResult!12633)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100366 (_ BitVec 32)) SeekEntryResult!12633)

(assert (=> b!1504782 (= res!1025372 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48435 a!2850) j!87) a!2850 mask!2661) lt!653808))))

(assert (=> b!1504782 (= lt!653808 (Found!12633 j!87))))

(declare-fun b!1504783 () Bool)

(declare-fun res!1025367 () Bool)

(assert (=> b!1504783 (=> (not res!1025367) (not e!841118))))

(assert (=> b!1504783 (= res!1025367 (validKeyInArray!0 (select (arr!48435 a!2850) j!87)))))

(declare-fun res!1025371 () Bool)

(assert (=> start!128168 (=> (not res!1025371) (not e!841118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128168 (= res!1025371 (validMask!0 mask!2661))))

(assert (=> start!128168 e!841118))

(assert (=> start!128168 true))

(declare-fun array_inv!37463 (array!100366) Bool)

(assert (=> start!128168 (array_inv!37463 a!2850)))

(declare-fun b!1504784 () Bool)

(declare-fun res!1025374 () Bool)

(assert (=> b!1504784 (=> (not res!1025374) (not e!841118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100366 (_ BitVec 32)) Bool)

(assert (=> b!1504784 (= res!1025374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504785 () Bool)

(declare-fun res!1025377 () Bool)

(assert (=> b!1504785 (=> (not res!1025377) (not e!841117))))

(assert (=> b!1504785 (= res!1025377 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653809 vacantBefore!10 (select (arr!48435 a!2850) j!87) a!2850 mask!2661) lt!653808))))

(declare-fun b!1504786 () Bool)

(declare-fun res!1025375 () Bool)

(assert (=> b!1504786 (=> (not res!1025375) (not e!841118))))

(assert (=> b!1504786 (= res!1025375 (and (= (size!48985 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48985 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48985 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504787 () Bool)

(declare-fun res!1025369 () Bool)

(assert (=> b!1504787 (=> (not res!1025369) (not e!841119))))

(assert (=> b!1504787 (= res!1025369 (not (= (select (arr!48435 a!2850) index!625) (select (arr!48435 a!2850) j!87))))))

(assert (= (and start!128168 res!1025371) b!1504786))

(assert (= (and b!1504786 res!1025375) b!1504777))

(assert (= (and b!1504777 res!1025368) b!1504783))

(assert (= (and b!1504783 res!1025367) b!1504784))

(assert (= (and b!1504784 res!1025374) b!1504778))

(assert (= (and b!1504778 res!1025376) b!1504781))

(assert (= (and b!1504781 res!1025370) b!1504782))

(assert (= (and b!1504782 res!1025372) b!1504787))

(assert (= (and b!1504787 res!1025369) b!1504779))

(assert (= (and b!1504779 res!1025373) b!1504785))

(assert (= (and b!1504785 res!1025377) b!1504780))

(declare-fun m!1387873 () Bool)

(assert (=> b!1504782 m!1387873))

(assert (=> b!1504782 m!1387873))

(declare-fun m!1387875 () Bool)

(assert (=> b!1504782 m!1387875))

(declare-fun m!1387877 () Bool)

(assert (=> b!1504779 m!1387877))

(assert (=> b!1504785 m!1387873))

(assert (=> b!1504785 m!1387873))

(declare-fun m!1387879 () Bool)

(assert (=> b!1504785 m!1387879))

(declare-fun m!1387881 () Bool)

(assert (=> b!1504787 m!1387881))

(assert (=> b!1504787 m!1387873))

(assert (=> b!1504783 m!1387873))

(assert (=> b!1504783 m!1387873))

(declare-fun m!1387883 () Bool)

(assert (=> b!1504783 m!1387883))

(declare-fun m!1387885 () Bool)

(assert (=> b!1504777 m!1387885))

(assert (=> b!1504777 m!1387885))

(declare-fun m!1387887 () Bool)

(assert (=> b!1504777 m!1387887))

(declare-fun m!1387889 () Bool)

(assert (=> b!1504778 m!1387889))

(declare-fun m!1387891 () Bool)

(assert (=> start!128168 m!1387891))

(declare-fun m!1387893 () Bool)

(assert (=> start!128168 m!1387893))

(declare-fun m!1387895 () Bool)

(assert (=> b!1504784 m!1387895))

(declare-fun m!1387897 () Bool)

(assert (=> b!1504781 m!1387897))

(declare-fun m!1387899 () Bool)

(assert (=> b!1504781 m!1387899))

(declare-fun m!1387901 () Bool)

(assert (=> b!1504781 m!1387901))

(check-sat (not b!1504777) (not b!1504782) (not b!1504783) (not b!1504778) (not b!1504785) (not b!1504784) (not start!128168) (not b!1504779))
(check-sat)
