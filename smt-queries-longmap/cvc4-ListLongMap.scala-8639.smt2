; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105140 () Bool)

(assert start!105140)

(declare-fun b_free!26873 () Bool)

(declare-fun b_next!26873 () Bool)

(assert (=> start!105140 (= b_free!26873 (not b_next!26873))))

(declare-fun tp!94120 () Bool)

(declare-fun b_and!44677 () Bool)

(assert (=> start!105140 (= tp!94120 b_and!44677)))

(declare-fun b!1252944 () Bool)

(declare-fun res!835552 () Bool)

(declare-fun e!711722 () Bool)

(assert (=> b!1252944 (=> (not res!835552) (not e!711722))))

(declare-datatypes ((array!81210 0))(
  ( (array!81211 (arr!39168 (Array (_ BitVec 32) (_ BitVec 64))) (size!39704 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81210)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81210 (_ BitVec 32)) Bool)

(assert (=> b!1252944 (= res!835552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252945 () Bool)

(declare-fun res!835551 () Bool)

(assert (=> b!1252945 (=> (not res!835551) (not e!711722))))

(declare-datatypes ((List!27811 0))(
  ( (Nil!27808) (Cons!27807 (h!29016 (_ BitVec 64)) (t!41290 List!27811)) )
))
(declare-fun arrayNoDuplicates!0 (array!81210 (_ BitVec 32) List!27811) Bool)

(assert (=> b!1252945 (= res!835551 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27808))))

(declare-fun b!1252946 () Bool)

(declare-fun e!711719 () Bool)

(declare-fun e!711720 () Bool)

(declare-fun mapRes!49435 () Bool)

(assert (=> b!1252946 (= e!711719 (and e!711720 mapRes!49435))))

(declare-fun condMapEmpty!49435 () Bool)

(declare-datatypes ((V!47731 0))(
  ( (V!47732 (val!15950 Int)) )
))
(declare-datatypes ((ValueCell!15124 0))(
  ( (ValueCellFull!15124 (v!18648 V!47731)) (EmptyCell!15124) )
))
(declare-datatypes ((array!81212 0))(
  ( (array!81213 (arr!39169 (Array (_ BitVec 32) ValueCell!15124)) (size!39705 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81212)

(declare-fun mapDefault!49435 () ValueCell!15124)

