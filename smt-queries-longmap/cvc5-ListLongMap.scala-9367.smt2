; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111638 () Bool)

(assert start!111638)

(declare-fun b_free!30295 () Bool)

(declare-fun b_next!30295 () Bool)

(assert (=> start!111638 (= b_free!30295 (not b_next!30295))))

(declare-fun tp!106361 () Bool)

(declare-fun b_and!48749 () Bool)

(assert (=> start!111638 (= tp!106361 b_and!48749)))

(declare-fun res!877719 () Bool)

(declare-fun e!754051 () Bool)

(assert (=> start!111638 (=> (not res!877719) (not e!754051))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111638 (= res!877719 (validMask!0 mask!2019))))

(assert (=> start!111638 e!754051))

(declare-datatypes ((array!89152 0))(
  ( (array!89153 (arr!43050 (Array (_ BitVec 32) (_ BitVec 64))) (size!43600 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89152)

(declare-fun array_inv!32503 (array!89152) Bool)

(assert (=> start!111638 (array_inv!32503 _keys!1609)))

(assert (=> start!111638 true))

(declare-fun tp_is_empty!36115 () Bool)

(assert (=> start!111638 tp_is_empty!36115))

(declare-datatypes ((V!53257 0))(
  ( (V!53258 (val!18132 Int)) )
))
(declare-datatypes ((ValueCell!17159 0))(
  ( (ValueCellFull!17159 (v!20762 V!53257)) (EmptyCell!17159) )
))
(declare-datatypes ((array!89154 0))(
  ( (array!89155 (arr!43051 (Array (_ BitVec 32) ValueCell!17159)) (size!43601 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89154)

(declare-fun e!754053 () Bool)

(declare-fun array_inv!32504 (array!89154) Bool)

(assert (=> start!111638 (and (array_inv!32504 _values!1337) e!754053)))

(assert (=> start!111638 tp!106361))

(declare-fun b!1322380 () Bool)

(declare-fun e!754054 () Bool)

(declare-fun mapRes!55820 () Bool)

(assert (=> b!1322380 (= e!754053 (and e!754054 mapRes!55820))))

(declare-fun condMapEmpty!55820 () Bool)

(declare-fun mapDefault!55820 () ValueCell!17159)

