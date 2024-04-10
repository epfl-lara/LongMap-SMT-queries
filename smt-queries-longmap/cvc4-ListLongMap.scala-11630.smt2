; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135694 () Bool)

(assert start!135694)

(declare-fun res!1076075 () Bool)

(declare-fun e!878314 () Bool)

(assert (=> start!135694 (=> (not res!1076075) (not e!878314))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135694 (= res!1076075 (validMask!0 mask!898))))

(assert (=> start!135694 e!878314))

(assert (=> start!135694 true))

(declare-datatypes ((array!105334 0))(
  ( (array!105335 (arr!50811 (Array (_ BitVec 32) (_ BitVec 64))) (size!51361 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105334)

(declare-fun array_inv!39538 (array!105334) Bool)

(assert (=> start!135694 (array_inv!39538 _keys!605)))

(declare-fun b!1574830 () Bool)

(declare-fun res!1076076 () Bool)

(assert (=> b!1574830 (=> (not res!1076076) (not e!878314))))

(assert (=> b!1574830 (= res!1076076 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51361 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574831 () Bool)

(declare-fun res!1076074 () Bool)

(assert (=> b!1574831 (=> (not res!1076074) (not e!878314))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574831 (= res!1076074 (validKeyInArray!0 k!761))))

(declare-fun b!1574832 () Bool)

(assert (=> b!1574832 (= e!878314 false)))

(declare-datatypes ((SeekEntryResult!13676 0))(
  ( (MissingZero!13676 (index!57102 (_ BitVec 32))) (Found!13676 (index!57103 (_ BitVec 32))) (Intermediate!13676 (undefined!14488 Bool) (index!57104 (_ BitVec 32)) (x!142048 (_ BitVec 32))) (Undefined!13676) (MissingVacant!13676 (index!57105 (_ BitVec 32))) )
))
(declare-fun lt!674956 () SeekEntryResult!13676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105334 (_ BitVec 32)) SeekEntryResult!13676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574832 (= lt!674956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135694 res!1076075) b!1574830))

(assert (= (and b!1574830 res!1076076) b!1574831))

(assert (= (and b!1574831 res!1076074) b!1574832))

(declare-fun m!1448025 () Bool)

(assert (=> start!135694 m!1448025))

(declare-fun m!1448027 () Bool)

(assert (=> start!135694 m!1448027))

(declare-fun m!1448029 () Bool)

(assert (=> b!1574831 m!1448029))

(declare-fun m!1448031 () Bool)

(assert (=> b!1574832 m!1448031))

(assert (=> b!1574832 m!1448031))

(declare-fun m!1448033 () Bool)

(assert (=> b!1574832 m!1448033))

(push 1)

(assert (not start!135694))

(assert (not b!1574832))

(assert (not b!1574831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

