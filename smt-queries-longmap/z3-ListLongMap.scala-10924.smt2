; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127808 () Bool)

(assert start!127808)

(declare-fun b!1501967 () Bool)

(declare-fun res!1023044 () Bool)

(declare-fun e!840126 () Bool)

(assert (=> b!1501967 (=> (not res!1023044) (not e!840126))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100189 0))(
  ( (array!100190 (arr!48354 (Array (_ BitVec 32) (_ BitVec 64))) (size!48904 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100189)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501967 (= res!1023044 (and (= (size!48904 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48904 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48904 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501968 () Bool)

(declare-fun res!1023043 () Bool)

(assert (=> b!1501968 (=> (not res!1023043) (not e!840126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501968 (= res!1023043 (validKeyInArray!0 (select (arr!48354 a!2850) i!996)))))

(declare-fun b!1501969 () Bool)

(declare-fun res!1023046 () Bool)

(assert (=> b!1501969 (=> (not res!1023046) (not e!840126))))

(declare-datatypes ((List!34846 0))(
  ( (Nil!34843) (Cons!34842 (h!36239 (_ BitVec 64)) (t!49540 List!34846)) )
))
(declare-fun arrayNoDuplicates!0 (array!100189 (_ BitVec 32) List!34846) Bool)

(assert (=> b!1501969 (= res!1023046 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34843))))

(declare-fun res!1023049 () Bool)

(assert (=> start!127808 (=> (not res!1023049) (not e!840126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127808 (= res!1023049 (validMask!0 mask!2661))))

(assert (=> start!127808 e!840126))

(assert (=> start!127808 true))

(declare-fun array_inv!37382 (array!100189) Bool)

(assert (=> start!127808 (array_inv!37382 a!2850)))

(declare-fun b!1501970 () Bool)

(declare-fun res!1023047 () Bool)

(assert (=> b!1501970 (=> (not res!1023047) (not e!840126))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501970 (= res!1023047 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48904 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48904 a!2850)) (= (select (arr!48354 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48354 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48904 a!2850))))))

(declare-fun b!1501971 () Bool)

(declare-fun res!1023045 () Bool)

(assert (=> b!1501971 (=> (not res!1023045) (not e!840126))))

(assert (=> b!1501971 (= res!1023045 (validKeyInArray!0 (select (arr!48354 a!2850) j!87)))))

(declare-fun b!1501972 () Bool)

(declare-fun res!1023048 () Bool)

(assert (=> b!1501972 (=> (not res!1023048) (not e!840126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100189 (_ BitVec 32)) Bool)

(assert (=> b!1501972 (= res!1023048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501973 () Bool)

(assert (=> b!1501973 (= e!840126 false)))

(declare-datatypes ((SeekEntryResult!12552 0))(
  ( (MissingZero!12552 (index!52600 (_ BitVec 32))) (Found!12552 (index!52601 (_ BitVec 32))) (Intermediate!12552 (undefined!13364 Bool) (index!52602 (_ BitVec 32)) (x!134290 (_ BitVec 32))) (Undefined!12552) (MissingVacant!12552 (index!52603 (_ BitVec 32))) )
))
(declare-fun lt!653296 () SeekEntryResult!12552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100189 (_ BitVec 32)) SeekEntryResult!12552)

(assert (=> b!1501973 (= lt!653296 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48354 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127808 res!1023049) b!1501967))

(assert (= (and b!1501967 res!1023044) b!1501968))

(assert (= (and b!1501968 res!1023043) b!1501971))

(assert (= (and b!1501971 res!1023045) b!1501972))

(assert (= (and b!1501972 res!1023048) b!1501969))

(assert (= (and b!1501969 res!1023046) b!1501970))

(assert (= (and b!1501970 res!1023047) b!1501973))

(declare-fun m!1385251 () Bool)

(assert (=> b!1501971 m!1385251))

(assert (=> b!1501971 m!1385251))

(declare-fun m!1385253 () Bool)

(assert (=> b!1501971 m!1385253))

(declare-fun m!1385255 () Bool)

(assert (=> start!127808 m!1385255))

(declare-fun m!1385257 () Bool)

(assert (=> start!127808 m!1385257))

(declare-fun m!1385259 () Bool)

(assert (=> b!1501968 m!1385259))

(assert (=> b!1501968 m!1385259))

(declare-fun m!1385261 () Bool)

(assert (=> b!1501968 m!1385261))

(assert (=> b!1501973 m!1385251))

(assert (=> b!1501973 m!1385251))

(declare-fun m!1385263 () Bool)

(assert (=> b!1501973 m!1385263))

(declare-fun m!1385265 () Bool)

(assert (=> b!1501972 m!1385265))

(declare-fun m!1385267 () Bool)

(assert (=> b!1501970 m!1385267))

(declare-fun m!1385269 () Bool)

(assert (=> b!1501970 m!1385269))

(declare-fun m!1385271 () Bool)

(assert (=> b!1501970 m!1385271))

(declare-fun m!1385273 () Bool)

(assert (=> b!1501969 m!1385273))

(check-sat (not b!1501973) (not b!1501969) (not b!1501972) (not start!127808) (not b!1501968) (not b!1501971))
