; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117910 () Bool)

(assert start!117910)

(declare-fun b!1381543 () Bool)

(declare-fun res!923172 () Bool)

(declare-fun e!783143 () Bool)

(assert (=> b!1381543 (=> (not res!923172) (not e!783143))))

(declare-datatypes ((array!94301 0))(
  ( (array!94302 (arr!45533 (Array (_ BitVec 32) (_ BitVec 64))) (size!46083 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94301)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381543 (= res!923172 (validKeyInArray!0 (select (arr!45533 a!2971) i!1094)))))

(declare-fun res!923170 () Bool)

(assert (=> start!117910 (=> (not res!923170) (not e!783143))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117910 (= res!923170 (validMask!0 mask!3034))))

(assert (=> start!117910 e!783143))

(assert (=> start!117910 true))

(declare-fun array_inv!34561 (array!94301) Bool)

(assert (=> start!117910 (array_inv!34561 a!2971)))

(declare-fun b!1381545 () Bool)

(assert (=> b!1381545 (= e!783143 false)))

(declare-fun lt!608226 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94301 (_ BitVec 32)) Bool)

(assert (=> b!1381545 (= lt!608226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381544 () Bool)

(declare-fun res!923173 () Bool)

(assert (=> b!1381544 (=> (not res!923173) (not e!783143))))

(declare-datatypes ((List!32067 0))(
  ( (Nil!32064) (Cons!32063 (h!33272 (_ BitVec 64)) (t!46761 List!32067)) )
))
(declare-fun arrayNoDuplicates!0 (array!94301 (_ BitVec 32) List!32067) Bool)

(assert (=> b!1381544 (= res!923173 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32064))))

(declare-fun b!1381542 () Bool)

(declare-fun res!923171 () Bool)

(assert (=> b!1381542 (=> (not res!923171) (not e!783143))))

(assert (=> b!1381542 (= res!923171 (and (= (size!46083 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46083 a!2971))))))

(assert (= (and start!117910 res!923170) b!1381542))

(assert (= (and b!1381542 res!923171) b!1381543))

(assert (= (and b!1381543 res!923172) b!1381544))

(assert (= (and b!1381544 res!923173) b!1381545))

(declare-fun m!1266723 () Bool)

(assert (=> b!1381543 m!1266723))

(assert (=> b!1381543 m!1266723))

(declare-fun m!1266725 () Bool)

(assert (=> b!1381543 m!1266725))

(declare-fun m!1266727 () Bool)

(assert (=> start!117910 m!1266727))

(declare-fun m!1266729 () Bool)

(assert (=> start!117910 m!1266729))

(declare-fun m!1266731 () Bool)

(assert (=> b!1381545 m!1266731))

(declare-fun m!1266733 () Bool)

(assert (=> b!1381544 m!1266733))

(push 1)

(assert (not b!1381545))

(assert (not start!117910))

(assert (not b!1381544))

(assert (not b!1381543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

