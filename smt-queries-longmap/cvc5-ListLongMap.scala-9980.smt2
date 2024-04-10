; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117886 () Bool)

(assert start!117886)

(declare-fun res!923052 () Bool)

(declare-fun e!783071 () Bool)

(assert (=> start!117886 (=> (not res!923052) (not e!783071))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117886 (= res!923052 (validMask!0 mask!3034))))

(assert (=> start!117886 e!783071))

(assert (=> start!117886 true))

(declare-datatypes ((array!94277 0))(
  ( (array!94278 (arr!45521 (Array (_ BitVec 32) (_ BitVec 64))) (size!46071 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94277)

(declare-fun array_inv!34549 (array!94277) Bool)

(assert (=> start!117886 (array_inv!34549 a!2971)))

(declare-fun b!1381423 () Bool)

(declare-fun res!923053 () Bool)

(assert (=> b!1381423 (=> (not res!923053) (not e!783071))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381423 (= res!923053 (and (= (size!46071 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46071 a!2971))))))

(declare-fun b!1381424 () Bool)

(declare-fun res!923051 () Bool)

(assert (=> b!1381424 (=> (not res!923051) (not e!783071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381424 (= res!923051 (validKeyInArray!0 (select (arr!45521 a!2971) i!1094)))))

(declare-fun b!1381425 () Bool)

(assert (=> b!1381425 (= e!783071 false)))

(declare-fun lt!608199 () Bool)

(declare-datatypes ((List!32055 0))(
  ( (Nil!32052) (Cons!32051 (h!33260 (_ BitVec 64)) (t!46749 List!32055)) )
))
(declare-fun arrayNoDuplicates!0 (array!94277 (_ BitVec 32) List!32055) Bool)

(assert (=> b!1381425 (= lt!608199 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32052))))

(assert (= (and start!117886 res!923052) b!1381423))

(assert (= (and b!1381423 res!923053) b!1381424))

(assert (= (and b!1381424 res!923051) b!1381425))

(declare-fun m!1266603 () Bool)

(assert (=> start!117886 m!1266603))

(declare-fun m!1266605 () Bool)

(assert (=> start!117886 m!1266605))

(declare-fun m!1266607 () Bool)

(assert (=> b!1381424 m!1266607))

(assert (=> b!1381424 m!1266607))

(declare-fun m!1266609 () Bool)

(assert (=> b!1381424 m!1266609))

(declare-fun m!1266611 () Bool)

(assert (=> b!1381425 m!1266611))

(push 1)

(assert (not b!1381425))

(assert (not start!117886))

(assert (not b!1381424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

