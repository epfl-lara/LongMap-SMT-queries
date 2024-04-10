; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128054 () Bool)

(assert start!128054)

(declare-fun b!1504065 () Bool)

(declare-fun res!1024857 () Bool)

(declare-fun e!840811 () Bool)

(assert (=> b!1504065 (=> (not res!1024857) (not e!840811))))

(declare-datatypes ((array!100330 0))(
  ( (array!100331 (arr!48420 (Array (_ BitVec 32) (_ BitVec 64))) (size!48970 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100330)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504065 (= res!1024857 (validKeyInArray!0 (select (arr!48420 a!2850) j!87)))))

(declare-fun b!1504066 () Bool)

(declare-fun res!1024853 () Bool)

(assert (=> b!1504066 (=> (not res!1024853) (not e!840811))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504066 (= res!1024853 (not (= (select (arr!48420 a!2850) index!625) (select (arr!48420 a!2850) j!87))))))

(declare-fun b!1504067 () Bool)

(declare-fun res!1024858 () Bool)

(assert (=> b!1504067 (=> (not res!1024858) (not e!840811))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12618 0))(
  ( (MissingZero!12618 (index!52864 (_ BitVec 32))) (Found!12618 (index!52865 (_ BitVec 32))) (Intermediate!12618 (undefined!13430 Bool) (index!52866 (_ BitVec 32)) (x!134544 (_ BitVec 32))) (Undefined!12618) (MissingVacant!12618 (index!52867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100330 (_ BitVec 32)) SeekEntryResult!12618)

(assert (=> b!1504067 (= res!1024858 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48420 a!2850) j!87) a!2850 mask!2661) (Found!12618 j!87)))))

(declare-fun b!1504068 () Bool)

(declare-fun res!1024856 () Bool)

(assert (=> b!1504068 (=> (not res!1024856) (not e!840811))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504068 (= res!1024856 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48970 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48970 a!2850)) (= (select (arr!48420 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48420 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48970 a!2850))))))

(declare-fun b!1504070 () Bool)

(declare-fun res!1024855 () Bool)

(assert (=> b!1504070 (=> (not res!1024855) (not e!840811))))

(declare-datatypes ((List!34912 0))(
  ( (Nil!34909) (Cons!34908 (h!36305 (_ BitVec 64)) (t!49606 List!34912)) )
))
(declare-fun arrayNoDuplicates!0 (array!100330 (_ BitVec 32) List!34912) Bool)

(assert (=> b!1504070 (= res!1024855 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34909))))

(declare-fun b!1504071 () Bool)

(declare-fun res!1024859 () Bool)

(assert (=> b!1504071 (=> (not res!1024859) (not e!840811))))

(assert (=> b!1504071 (= res!1024859 (validKeyInArray!0 (select (arr!48420 a!2850) i!996)))))

(declare-fun b!1504072 () Bool)

(assert (=> b!1504072 (= e!840811 false)))

(declare-fun lt!653635 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504072 (= lt!653635 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504073 () Bool)

(declare-fun res!1024854 () Bool)

(assert (=> b!1504073 (=> (not res!1024854) (not e!840811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100330 (_ BitVec 32)) Bool)

(assert (=> b!1504073 (= res!1024854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1024861 () Bool)

(assert (=> start!128054 (=> (not res!1024861) (not e!840811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128054 (= res!1024861 (validMask!0 mask!2661))))

(assert (=> start!128054 e!840811))

(assert (=> start!128054 true))

(declare-fun array_inv!37448 (array!100330) Bool)

(assert (=> start!128054 (array_inv!37448 a!2850)))

(declare-fun b!1504069 () Bool)

(declare-fun res!1024860 () Bool)

(assert (=> b!1504069 (=> (not res!1024860) (not e!840811))))

(assert (=> b!1504069 (= res!1024860 (and (= (size!48970 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48970 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48970 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128054 res!1024861) b!1504069))

(assert (= (and b!1504069 res!1024860) b!1504071))

(assert (= (and b!1504071 res!1024859) b!1504065))

(assert (= (and b!1504065 res!1024857) b!1504073))

(assert (= (and b!1504073 res!1024854) b!1504070))

(assert (= (and b!1504070 res!1024855) b!1504068))

(assert (= (and b!1504068 res!1024856) b!1504067))

(assert (= (and b!1504067 res!1024858) b!1504066))

(assert (= (and b!1504066 res!1024853) b!1504072))

(declare-fun m!1387271 () Bool)

(assert (=> b!1504066 m!1387271))

(declare-fun m!1387273 () Bool)

(assert (=> b!1504066 m!1387273))

(declare-fun m!1387275 () Bool)

(assert (=> b!1504068 m!1387275))

(declare-fun m!1387277 () Bool)

(assert (=> b!1504068 m!1387277))

(declare-fun m!1387279 () Bool)

(assert (=> b!1504068 m!1387279))

(declare-fun m!1387281 () Bool)

(assert (=> b!1504073 m!1387281))

(declare-fun m!1387283 () Bool)

(assert (=> b!1504071 m!1387283))

(assert (=> b!1504071 m!1387283))

(declare-fun m!1387285 () Bool)

(assert (=> b!1504071 m!1387285))

(assert (=> b!1504065 m!1387273))

(assert (=> b!1504065 m!1387273))

(declare-fun m!1387287 () Bool)

(assert (=> b!1504065 m!1387287))

(assert (=> b!1504067 m!1387273))

(assert (=> b!1504067 m!1387273))

(declare-fun m!1387289 () Bool)

(assert (=> b!1504067 m!1387289))

(declare-fun m!1387291 () Bool)

(assert (=> b!1504070 m!1387291))

(declare-fun m!1387293 () Bool)

(assert (=> b!1504072 m!1387293))

(declare-fun m!1387295 () Bool)

(assert (=> start!128054 m!1387295))

(declare-fun m!1387297 () Bool)

(assert (=> start!128054 m!1387297))

(check-sat (not b!1504067) (not b!1504073) (not start!128054) (not b!1504071) (not b!1504065) (not b!1504070) (not b!1504072))
