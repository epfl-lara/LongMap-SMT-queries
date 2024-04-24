; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137054 () Bool)

(assert start!137054)

(declare-fun b!1580569 () Bool)

(declare-fun res!1079041 () Bool)

(declare-fun e!881740 () Bool)

(assert (=> b!1580569 (=> (not res!1079041) (not e!881740))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580569 (= res!1079041 (validKeyInArray!0 k!772))))

(declare-fun b!1580571 () Bool)

(assert (=> b!1580571 (= e!881740 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun lt!677097 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580571 (= lt!677097 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580568 () Bool)

(declare-fun res!1079042 () Bool)

(assert (=> b!1580568 (=> (not res!1079042) (not e!881740))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-datatypes ((array!105816 0))(
  ( (array!105817 (arr!51012 (Array (_ BitVec 32) (_ BitVec 64))) (size!51563 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105816)

(assert (=> b!1580568 (= res!1079042 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51563 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51012 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1079040 () Bool)

(assert (=> start!137054 (=> (not res!1079040) (not e!881740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137054 (= res!1079040 (validMask!0 mask!918))))

(assert (=> start!137054 e!881740))

(assert (=> start!137054 true))

(declare-fun array_inv!39967 (array!105816) Bool)

(assert (=> start!137054 (array_inv!39967 _keys!614)))

(declare-fun b!1580570 () Bool)

(declare-fun res!1079039 () Bool)

(assert (=> b!1580570 (=> (not res!1079039) (not e!881740))))

(assert (=> b!1580570 (= res!1079039 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51012 _keys!614) ee!18) k!772)) (not (= (select (arr!51012 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137054 res!1079040) b!1580568))

(assert (= (and b!1580568 res!1079042) b!1580569))

(assert (= (and b!1580569 res!1079041) b!1580570))

(assert (= (and b!1580570 res!1079039) b!1580571))

(declare-fun m!1452489 () Bool)

(assert (=> b!1580571 m!1452489))

(declare-fun m!1452491 () Bool)

(assert (=> b!1580568 m!1452491))

(declare-fun m!1452493 () Bool)

(assert (=> start!137054 m!1452493))

(declare-fun m!1452495 () Bool)

(assert (=> start!137054 m!1452495))

(declare-fun m!1452497 () Bool)

(assert (=> b!1580569 m!1452497))

(declare-fun m!1452499 () Bool)

(assert (=> b!1580570 m!1452499))

(push 1)

(assert (not b!1580569))

(assert (not b!1580571))

(assert (not start!137054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

