; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134994 () Bool)

(assert start!134994)

(declare-fun res!1074346 () Bool)

(declare-fun e!876775 () Bool)

(assert (=> start!134994 (=> (not res!1074346) (not e!876775))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134994 (= res!1074346 (validMask!0 mask!889))))

(assert (=> start!134994 e!876775))

(assert (=> start!134994 true))

(declare-datatypes ((array!105010 0))(
  ( (array!105011 (arr!50670 (Array (_ BitVec 32) (_ BitVec 64))) (size!51220 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105010)

(declare-fun array_inv!39397 (array!105010) Bool)

(assert (=> start!134994 (array_inv!39397 _keys!600)))

(declare-fun b!1572382 () Bool)

(declare-fun res!1074348 () Bool)

(assert (=> b!1572382 (=> (not res!1074348) (not e!876775))))

(assert (=> b!1572382 (= res!1074348 (= (size!51220 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572383 () Bool)

(declare-fun res!1074347 () Bool)

(assert (=> b!1572383 (=> (not res!1074347) (not e!876775))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572383 (= res!1074347 (validKeyInArray!0 k!754))))

(declare-fun b!1572384 () Bool)

(assert (=> b!1572384 (= e!876775 false)))

(declare-datatypes ((SeekEntryResult!13583 0))(
  ( (MissingZero!13583 (index!56730 (_ BitVec 32))) (Found!13583 (index!56731 (_ BitVec 32))) (Intermediate!13583 (undefined!14395 Bool) (index!56732 (_ BitVec 32)) (x!141501 (_ BitVec 32))) (Undefined!13583) (MissingVacant!13583 (index!56733 (_ BitVec 32))) )
))
(declare-fun lt!673966 () SeekEntryResult!13583)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105010 (_ BitVec 32)) SeekEntryResult!13583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572384 (= lt!673966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134994 res!1074346) b!1572382))

(assert (= (and b!1572382 res!1074348) b!1572383))

(assert (= (and b!1572383 res!1074347) b!1572384))

(declare-fun m!1446147 () Bool)

(assert (=> start!134994 m!1446147))

(declare-fun m!1446149 () Bool)

(assert (=> start!134994 m!1446149))

(declare-fun m!1446151 () Bool)

(assert (=> b!1572383 m!1446151))

(declare-fun m!1446153 () Bool)

(assert (=> b!1572384 m!1446153))

(assert (=> b!1572384 m!1446153))

(declare-fun m!1446155 () Bool)

(assert (=> b!1572384 m!1446155))

(push 1)

(assert (not start!134994))

(assert (not b!1572384))

(assert (not b!1572383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

