; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111506 () Bool)

(assert start!111506)

(declare-fun b_free!30163 () Bool)

(declare-fun b_next!30163 () Bool)

(assert (=> start!111506 (= b_free!30163 (not b_next!30163))))

(declare-fun tp!105964 () Bool)

(declare-fun b_and!48485 () Bool)

(assert (=> start!111506 (= tp!105964 b_and!48485)))

(declare-fun b!1320070 () Bool)

(declare-fun e!753064 () Bool)

(declare-fun e!753062 () Bool)

(declare-fun mapRes!55622 () Bool)

(assert (=> b!1320070 (= e!753064 (and e!753062 mapRes!55622))))

(declare-fun condMapEmpty!55622 () Bool)

(declare-datatypes ((V!53081 0))(
  ( (V!53082 (val!18066 Int)) )
))
(declare-datatypes ((ValueCell!17093 0))(
  ( (ValueCellFull!17093 (v!20696 V!53081)) (EmptyCell!17093) )
))
(declare-datatypes ((array!88898 0))(
  ( (array!88899 (arr!42923 (Array (_ BitVec 32) ValueCell!17093)) (size!43473 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88898)

(declare-fun mapDefault!55622 () ValueCell!17093)

