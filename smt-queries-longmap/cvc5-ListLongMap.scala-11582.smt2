; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134984 () Bool)

(assert start!134984)

(declare-fun res!1074302 () Bool)

(declare-fun e!876746 () Bool)

(assert (=> start!134984 (=> (not res!1074302) (not e!876746))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134984 (= res!1074302 (validMask!0 mask!889))))

(assert (=> start!134984 e!876746))

(assert (=> start!134984 true))

(declare-datatypes ((array!105000 0))(
  ( (array!105001 (arr!50665 (Array (_ BitVec 32) (_ BitVec 64))) (size!51215 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105000)

(declare-fun array_inv!39392 (array!105000) Bool)

(assert (=> start!134984 (array_inv!39392 _keys!600)))

(declare-fun b!1572337 () Bool)

(declare-fun res!1074303 () Bool)

(assert (=> b!1572337 (=> (not res!1074303) (not e!876746))))

(assert (=> b!1572337 (= res!1074303 (= (size!51215 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572338 () Bool)

(declare-fun res!1074301 () Bool)

(assert (=> b!1572338 (=> (not res!1074301) (not e!876746))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572338 (= res!1074301 (validKeyInArray!0 k!754))))

(declare-fun b!1572339 () Bool)

(assert (=> b!1572339 (= e!876746 false)))

(declare-datatypes ((SeekEntryResult!13578 0))(
  ( (MissingZero!13578 (index!56710 (_ BitVec 32))) (Found!13578 (index!56711 (_ BitVec 32))) (Intermediate!13578 (undefined!14390 Bool) (index!56712 (_ BitVec 32)) (x!141488 (_ BitVec 32))) (Undefined!13578) (MissingVacant!13578 (index!56713 (_ BitVec 32))) )
))
(declare-fun lt!673951 () SeekEntryResult!13578)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105000 (_ BitVec 32)) SeekEntryResult!13578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572339 (= lt!673951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134984 res!1074302) b!1572337))

(assert (= (and b!1572337 res!1074303) b!1572338))

(assert (= (and b!1572338 res!1074301) b!1572339))

(declare-fun m!1446097 () Bool)

(assert (=> start!134984 m!1446097))

(declare-fun m!1446099 () Bool)

(assert (=> start!134984 m!1446099))

(declare-fun m!1446101 () Bool)

(assert (=> b!1572338 m!1446101))

(declare-fun m!1446103 () Bool)

(assert (=> b!1572339 m!1446103))

(assert (=> b!1572339 m!1446103))

(declare-fun m!1446105 () Bool)

(assert (=> b!1572339 m!1446105))

(push 1)

(assert (not start!134984))

(assert (not b!1572339))

(assert (not b!1572338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

