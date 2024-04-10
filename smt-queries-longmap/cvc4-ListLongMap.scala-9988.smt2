; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117938 () Bool)

(assert start!117938)

(declare-fun res!923341 () Bool)

(declare-fun e!783226 () Bool)

(assert (=> start!117938 (=> (not res!923341) (not e!783226))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117938 (= res!923341 (validMask!0 mask!3034))))

(assert (=> start!117938 e!783226))

(assert (=> start!117938 true))

(declare-datatypes ((array!94329 0))(
  ( (array!94330 (arr!45547 (Array (_ BitVec 32) (_ BitVec 64))) (size!46097 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94329)

(declare-fun array_inv!34575 (array!94329) Bool)

(assert (=> start!117938 (array_inv!34575 a!2971)))

(declare-fun b!1381711 () Bool)

(declare-fun res!923339 () Bool)

(assert (=> b!1381711 (=> (not res!923339) (not e!783226))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381711 (= res!923339 (validKeyInArray!0 (select (arr!45547 a!2971) i!1094)))))

(declare-fun b!1381710 () Bool)

(declare-fun res!923340 () Bool)

(assert (=> b!1381710 (=> (not res!923340) (not e!783226))))

(assert (=> b!1381710 (= res!923340 (and (= (size!46097 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46097 a!2971))))))

(declare-fun b!1381713 () Bool)

(assert (=> b!1381713 (= e!783226 false)))

(declare-fun lt!608268 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94329 (_ BitVec 32)) Bool)

(assert (=> b!1381713 (= lt!608268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381712 () Bool)

(declare-fun res!923338 () Bool)

(assert (=> b!1381712 (=> (not res!923338) (not e!783226))))

(declare-datatypes ((List!32081 0))(
  ( (Nil!32078) (Cons!32077 (h!33286 (_ BitVec 64)) (t!46775 List!32081)) )
))
(declare-fun arrayNoDuplicates!0 (array!94329 (_ BitVec 32) List!32081) Bool)

(assert (=> b!1381712 (= res!923338 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32078))))

(assert (= (and start!117938 res!923341) b!1381710))

(assert (= (and b!1381710 res!923340) b!1381711))

(assert (= (and b!1381711 res!923339) b!1381712))

(assert (= (and b!1381712 res!923338) b!1381713))

(declare-fun m!1266891 () Bool)

(assert (=> start!117938 m!1266891))

(declare-fun m!1266893 () Bool)

(assert (=> start!117938 m!1266893))

(declare-fun m!1266895 () Bool)

(assert (=> b!1381711 m!1266895))

(assert (=> b!1381711 m!1266895))

(declare-fun m!1266897 () Bool)

(assert (=> b!1381711 m!1266897))

(declare-fun m!1266899 () Bool)

(assert (=> b!1381713 m!1266899))

(declare-fun m!1266901 () Bool)

(assert (=> b!1381712 m!1266901))

(push 1)

(assert (not b!1381713))

(assert (not start!117938))

(assert (not b!1381712))

(assert (not b!1381711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

