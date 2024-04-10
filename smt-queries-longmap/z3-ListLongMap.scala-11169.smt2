; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130558 () Bool)

(assert start!130558)

(declare-fun b!1532330 () Bool)

(declare-fun e!853773 () Bool)

(declare-datatypes ((array!101737 0))(
  ( (array!101738 (arr!49089 (Array (_ BitVec 32) (_ BitVec 64))) (size!49639 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101737)

(assert (=> b!1532330 (= e!853773 (bvsgt #b00000000000000000000000000000000 (size!49639 a!2792)))))

(declare-fun b!1532329 () Bool)

(declare-fun res!1049469 () Bool)

(assert (=> b!1532329 (=> (not res!1049469) (not e!853773))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532329 (= res!1049469 (validKeyInArray!0 (select (arr!49089 a!2792) j!64)))))

(declare-fun b!1532328 () Bool)

(declare-fun res!1049468 () Bool)

(assert (=> b!1532328 (=> (not res!1049468) (not e!853773))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532328 (= res!1049468 (validKeyInArray!0 (select (arr!49089 a!2792) i!951)))))

(declare-fun b!1532327 () Bool)

(declare-fun res!1049470 () Bool)

(assert (=> b!1532327 (=> (not res!1049470) (not e!853773))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532327 (= res!1049470 (and (= (size!49639 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49639 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49639 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049467 () Bool)

(assert (=> start!130558 (=> (not res!1049467) (not e!853773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130558 (= res!1049467 (validMask!0 mask!2480))))

(assert (=> start!130558 e!853773))

(assert (=> start!130558 true))

(declare-fun array_inv!38117 (array!101737) Bool)

(assert (=> start!130558 (array_inv!38117 a!2792)))

(assert (= (and start!130558 res!1049467) b!1532327))

(assert (= (and b!1532327 res!1049470) b!1532328))

(assert (= (and b!1532328 res!1049468) b!1532329))

(assert (= (and b!1532329 res!1049469) b!1532330))

(declare-fun m!1415061 () Bool)

(assert (=> b!1532329 m!1415061))

(assert (=> b!1532329 m!1415061))

(declare-fun m!1415063 () Bool)

(assert (=> b!1532329 m!1415063))

(declare-fun m!1415065 () Bool)

(assert (=> b!1532328 m!1415065))

(assert (=> b!1532328 m!1415065))

(declare-fun m!1415067 () Bool)

(assert (=> b!1532328 m!1415067))

(declare-fun m!1415069 () Bool)

(assert (=> start!130558 m!1415069))

(declare-fun m!1415071 () Bool)

(assert (=> start!130558 m!1415071))

(check-sat (not start!130558) (not b!1532328) (not b!1532329))
(check-sat)
