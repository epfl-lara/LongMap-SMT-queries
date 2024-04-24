; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118728 () Bool)

(assert start!118728)

(declare-fun b!1386994 () Bool)

(declare-fun res!927455 () Bool)

(declare-fun e!785962 () Bool)

(assert (=> b!1386994 (=> (not res!927455) (not e!785962))))

(declare-datatypes ((array!94902 0))(
  ( (array!94903 (arr!45825 (Array (_ BitVec 32) (_ BitVec 64))) (size!46376 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94902)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386994 (= res!927455 (validKeyInArray!0 (select (arr!45825 a!2938) i!1065)))))

(declare-fun b!1386996 () Bool)

(assert (=> b!1386996 (= e!785962 false)))

(declare-fun lt!609786 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94902 (_ BitVec 32)) Bool)

(assert (=> b!1386996 (= lt!609786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386993 () Bool)

(declare-fun res!927454 () Bool)

(assert (=> b!1386993 (=> (not res!927454) (not e!785962))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386993 (= res!927454 (and (= (size!46376 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46376 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46376 a!2938))))))

(declare-fun res!927457 () Bool)

(assert (=> start!118728 (=> (not res!927457) (not e!785962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118728 (= res!927457 (validMask!0 mask!2987))))

(assert (=> start!118728 e!785962))

(assert (=> start!118728 true))

(declare-fun array_inv!35106 (array!94902) Bool)

(assert (=> start!118728 (array_inv!35106 a!2938)))

(declare-fun b!1386995 () Bool)

(declare-fun res!927456 () Bool)

(assert (=> b!1386995 (=> (not res!927456) (not e!785962))))

(declare-datatypes ((List!32340 0))(
  ( (Nil!32337) (Cons!32336 (h!33554 (_ BitVec 64)) (t!47026 List!32340)) )
))
(declare-fun arrayNoDuplicates!0 (array!94902 (_ BitVec 32) List!32340) Bool)

(assert (=> b!1386995 (= res!927456 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32337))))

(assert (= (and start!118728 res!927457) b!1386993))

(assert (= (and b!1386993 res!927454) b!1386994))

(assert (= (and b!1386994 res!927455) b!1386995))

(assert (= (and b!1386995 res!927456) b!1386996))

(declare-fun m!1272609 () Bool)

(assert (=> b!1386994 m!1272609))

(assert (=> b!1386994 m!1272609))

(declare-fun m!1272611 () Bool)

(assert (=> b!1386994 m!1272611))

(declare-fun m!1272613 () Bool)

(assert (=> b!1386996 m!1272613))

(declare-fun m!1272615 () Bool)

(assert (=> start!118728 m!1272615))

(declare-fun m!1272617 () Bool)

(assert (=> start!118728 m!1272617))

(declare-fun m!1272619 () Bool)

(assert (=> b!1386995 m!1272619))

(push 1)

(assert (not b!1386996))

(assert (not b!1386994))

(assert (not b!1386995))

(assert (not start!118728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

