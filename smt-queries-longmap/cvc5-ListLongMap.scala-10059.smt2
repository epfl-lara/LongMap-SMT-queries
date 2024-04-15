; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118488 () Bool)

(assert start!118488)

(declare-fun b!1385475 () Bool)

(declare-fun e!785011 () Bool)

(assert (=> b!1385475 (= e!785011 false)))

(declare-fun lt!609086 () Bool)

(declare-datatypes ((array!94717 0))(
  ( (array!94718 (arr!45735 (Array (_ BitVec 32) (_ BitVec 64))) (size!46287 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94717)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94717 (_ BitVec 32)) Bool)

(assert (=> b!1385475 (= lt!609086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385473 () Bool)

(declare-fun res!926767 () Bool)

(assert (=> b!1385473 (=> (not res!926767) (not e!785011))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385473 (= res!926767 (validKeyInArray!0 (select (arr!45735 a!2938) i!1065)))))

(declare-fun b!1385472 () Bool)

(declare-fun res!926766 () Bool)

(assert (=> b!1385472 (=> (not res!926766) (not e!785011))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385472 (= res!926766 (and (= (size!46287 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46287 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46287 a!2938))))))

(declare-fun b!1385474 () Bool)

(declare-fun res!926765 () Bool)

(assert (=> b!1385474 (=> (not res!926765) (not e!785011))))

(declare-datatypes ((List!32341 0))(
  ( (Nil!32338) (Cons!32337 (h!33546 (_ BitVec 64)) (t!47027 List!32341)) )
))
(declare-fun arrayNoDuplicates!0 (array!94717 (_ BitVec 32) List!32341) Bool)

(assert (=> b!1385474 (= res!926765 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32338))))

(declare-fun res!926768 () Bool)

(assert (=> start!118488 (=> (not res!926768) (not e!785011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118488 (= res!926768 (validMask!0 mask!2987))))

(assert (=> start!118488 e!785011))

(assert (=> start!118488 true))

(declare-fun array_inv!34968 (array!94717) Bool)

(assert (=> start!118488 (array_inv!34968 a!2938)))

(assert (= (and start!118488 res!926768) b!1385472))

(assert (= (and b!1385472 res!926766) b!1385473))

(assert (= (and b!1385473 res!926767) b!1385474))

(assert (= (and b!1385474 res!926765) b!1385475))

(declare-fun m!1270329 () Bool)

(assert (=> b!1385475 m!1270329))

(declare-fun m!1270331 () Bool)

(assert (=> b!1385473 m!1270331))

(assert (=> b!1385473 m!1270331))

(declare-fun m!1270333 () Bool)

(assert (=> b!1385473 m!1270333))

(declare-fun m!1270335 () Bool)

(assert (=> b!1385474 m!1270335))

(declare-fun m!1270337 () Bool)

(assert (=> start!118488 m!1270337))

(declare-fun m!1270339 () Bool)

(assert (=> start!118488 m!1270339))

(push 1)

(assert (not b!1385474))

(assert (not start!118488))

(assert (not b!1385473))

(assert (not b!1385475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

