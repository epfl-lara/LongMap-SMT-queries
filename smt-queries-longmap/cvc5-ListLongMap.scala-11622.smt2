; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135578 () Bool)

(assert start!135578)

(declare-fun res!1075701 () Bool)

(declare-fun e!877927 () Bool)

(assert (=> start!135578 (=> (not res!1075701) (not e!877927))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135578 (= res!1075701 (validMask!0 mask!898))))

(assert (=> start!135578 e!877927))

(assert (=> start!135578 true))

(declare-datatypes ((array!105213 0))(
  ( (array!105214 (arr!50752 (Array (_ BitVec 32) (_ BitVec 64))) (size!51304 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105213)

(declare-fun array_inv!39688 (array!105213) Bool)

(assert (=> start!135578 (array_inv!39688 _keys!605)))

(declare-fun b!1574220 () Bool)

(declare-fun res!1075699 () Bool)

(assert (=> b!1574220 (=> (not res!1075699) (not e!877927))))

(assert (=> b!1574220 (= res!1075699 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51304 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574221 () Bool)

(declare-fun res!1075700 () Bool)

(assert (=> b!1574221 (=> (not res!1075700) (not e!877927))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574221 (= res!1075700 (validKeyInArray!0 k!761))))

(declare-fun b!1574222 () Bool)

(assert (=> b!1574222 (= e!877927 false)))

(declare-fun lt!674562 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574222 (= lt!674562 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135578 res!1075701) b!1574220))

(assert (= (and b!1574220 res!1075699) b!1574221))

(assert (= (and b!1574221 res!1075700) b!1574222))

(declare-fun m!1446865 () Bool)

(assert (=> start!135578 m!1446865))

(declare-fun m!1446867 () Bool)

(assert (=> start!135578 m!1446867))

(declare-fun m!1446869 () Bool)

(assert (=> b!1574221 m!1446869))

(declare-fun m!1446871 () Bool)

(assert (=> b!1574222 m!1446871))

(push 1)

(assert (not b!1574221))

(assert (not b!1574222))

(assert (not start!135578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

