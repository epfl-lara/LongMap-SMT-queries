; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127998 () Bool)

(assert start!127998)

(declare-fun b!1503614 () Bool)

(declare-fun e!840582 () Bool)

(assert (=> b!1503614 (= e!840582 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun lt!653341 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503614 (= lt!653341 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503615 () Bool)

(declare-fun res!1024594 () Bool)

(assert (=> b!1503615 (=> (not res!1024594) (not e!840582))))

(declare-datatypes ((array!100268 0))(
  ( (array!100269 (arr!48390 (Array (_ BitVec 32) (_ BitVec 64))) (size!48942 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100268)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503615 (= res!1024594 (validKeyInArray!0 (select (arr!48390 a!2850) j!87)))))

(declare-fun b!1503616 () Bool)

(declare-fun res!1024596 () Bool)

(assert (=> b!1503616 (=> (not res!1024596) (not e!840582))))

(declare-datatypes ((List!34960 0))(
  ( (Nil!34957) (Cons!34956 (h!36354 (_ BitVec 64)) (t!49646 List!34960)) )
))
(declare-fun arrayNoDuplicates!0 (array!100268 (_ BitVec 32) List!34960) Bool)

(assert (=> b!1503616 (= res!1024596 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34957))))

(declare-fun b!1503618 () Bool)

(declare-fun res!1024591 () Bool)

(assert (=> b!1503618 (=> (not res!1024591) (not e!840582))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503618 (= res!1024591 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48942 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48942 a!2850)) (= (select (arr!48390 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48390 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48942 a!2850))))))

(declare-fun b!1503619 () Bool)

(declare-fun res!1024597 () Bool)

(assert (=> b!1503619 (=> (not res!1024597) (not e!840582))))

(assert (=> b!1503619 (= res!1024597 (validKeyInArray!0 (select (arr!48390 a!2850) i!996)))))

(declare-fun b!1503620 () Bool)

(declare-fun res!1024590 () Bool)

(assert (=> b!1503620 (=> (not res!1024590) (not e!840582))))

(assert (=> b!1503620 (= res!1024590 (not (= (select (arr!48390 a!2850) index!625) (select (arr!48390 a!2850) j!87))))))

(declare-fun b!1503621 () Bool)

(declare-fun res!1024595 () Bool)

(assert (=> b!1503621 (=> (not res!1024595) (not e!840582))))

(assert (=> b!1503621 (= res!1024595 (and (= (size!48942 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48942 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48942 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503622 () Bool)

(declare-fun res!1024598 () Bool)

(assert (=> b!1503622 (=> (not res!1024598) (not e!840582))))

(declare-datatypes ((SeekEntryResult!12609 0))(
  ( (MissingZero!12609 (index!52828 (_ BitVec 32))) (Found!12609 (index!52829 (_ BitVec 32))) (Intermediate!12609 (undefined!13421 Bool) (index!52830 (_ BitVec 32)) (x!134514 (_ BitVec 32))) (Undefined!12609) (MissingVacant!12609 (index!52831 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100268 (_ BitVec 32)) SeekEntryResult!12609)

(assert (=> b!1503622 (= res!1024598 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48390 a!2850) j!87) a!2850 mask!2661) (Found!12609 j!87)))))

(declare-fun b!1503617 () Bool)

(declare-fun res!1024592 () Bool)

(assert (=> b!1503617 (=> (not res!1024592) (not e!840582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100268 (_ BitVec 32)) Bool)

(assert (=> b!1503617 (= res!1024592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1024593 () Bool)

(assert (=> start!127998 (=> (not res!1024593) (not e!840582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127998 (= res!1024593 (validMask!0 mask!2661))))

(assert (=> start!127998 e!840582))

(assert (=> start!127998 true))

(declare-fun array_inv!37623 (array!100268) Bool)

(assert (=> start!127998 (array_inv!37623 a!2850)))

(assert (= (and start!127998 res!1024593) b!1503621))

(assert (= (and b!1503621 res!1024595) b!1503619))

(assert (= (and b!1503619 res!1024597) b!1503615))

(assert (= (and b!1503615 res!1024594) b!1503617))

(assert (= (and b!1503617 res!1024592) b!1503616))

(assert (= (and b!1503616 res!1024596) b!1503618))

(assert (= (and b!1503618 res!1024591) b!1503622))

(assert (= (and b!1503622 res!1024598) b!1503620))

(assert (= (and b!1503620 res!1024590) b!1503614))

(declare-fun m!1386261 () Bool)

(assert (=> b!1503618 m!1386261))

(declare-fun m!1386263 () Bool)

(assert (=> b!1503618 m!1386263))

(declare-fun m!1386265 () Bool)

(assert (=> b!1503618 m!1386265))

(declare-fun m!1386267 () Bool)

(assert (=> b!1503619 m!1386267))

(assert (=> b!1503619 m!1386267))

(declare-fun m!1386269 () Bool)

(assert (=> b!1503619 m!1386269))

(declare-fun m!1386271 () Bool)

(assert (=> b!1503616 m!1386271))

(declare-fun m!1386273 () Bool)

(assert (=> b!1503622 m!1386273))

(assert (=> b!1503622 m!1386273))

(declare-fun m!1386275 () Bool)

(assert (=> b!1503622 m!1386275))

(declare-fun m!1386277 () Bool)

(assert (=> b!1503620 m!1386277))

(assert (=> b!1503620 m!1386273))

(declare-fun m!1386279 () Bool)

(assert (=> start!127998 m!1386279))

(declare-fun m!1386281 () Bool)

(assert (=> start!127998 m!1386281))

(declare-fun m!1386283 () Bool)

(assert (=> b!1503617 m!1386283))

(assert (=> b!1503615 m!1386273))

(assert (=> b!1503615 m!1386273))

(declare-fun m!1386285 () Bool)

(assert (=> b!1503615 m!1386285))

(declare-fun m!1386287 () Bool)

(assert (=> b!1503614 m!1386287))

(push 1)

(assert (not start!127998))

(assert (not b!1503614))

(assert (not b!1503617))

(assert (not b!1503615))

(assert (not b!1503622))

(assert (not b!1503619))

(assert (not b!1503616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

