; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84196 () Bool)

(assert start!84196)

(declare-fun b_free!19897 () Bool)

(declare-fun b_next!19897 () Bool)

(assert (=> start!84196 (= b_free!19897 (not b_next!19897))))

(declare-fun tp!69294 () Bool)

(declare-fun b_and!31871 () Bool)

(assert (=> start!84196 (= tp!69294 b_and!31871)))

(declare-fun b!984737 () Bool)

(declare-fun res!658937 () Bool)

(declare-fun e!555118 () Bool)

(assert (=> b!984737 (=> (not res!658937) (not e!555118))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984737 (= res!658937 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984738 () Bool)

(declare-fun res!658941 () Bool)

(assert (=> b!984738 (=> (not res!658941) (not e!555118))))

(declare-datatypes ((array!61977 0))(
  ( (array!61978 (arr!29846 (Array (_ BitVec 32) (_ BitVec 64))) (size!30325 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61977)

(declare-datatypes ((List!20666 0))(
  ( (Nil!20663) (Cons!20662 (h!21824 (_ BitVec 64)) (t!29507 List!20666)) )
))
(declare-fun arrayNoDuplicates!0 (array!61977 (_ BitVec 32) List!20666) Bool)

(assert (=> b!984738 (= res!658941 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20663))))

(declare-fun mapNonEmpty!36527 () Bool)

(declare-fun mapRes!36527 () Bool)

(declare-fun tp!69295 () Bool)

(declare-fun e!555116 () Bool)

(assert (=> mapNonEmpty!36527 (= mapRes!36527 (and tp!69295 e!555116))))

(declare-fun mapKey!36527 () (_ BitVec 32))

(declare-datatypes ((V!35649 0))(
  ( (V!35650 (val!11550 Int)) )
))
(declare-datatypes ((ValueCell!11018 0))(
  ( (ValueCellFull!11018 (v!14112 V!35649)) (EmptyCell!11018) )
))
(declare-datatypes ((array!61979 0))(
  ( (array!61980 (arr!29847 (Array (_ BitVec 32) ValueCell!11018)) (size!30326 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61979)

(declare-fun mapValue!36527 () ValueCell!11018)

(declare-fun mapRest!36527 () (Array (_ BitVec 32) ValueCell!11018))

(assert (=> mapNonEmpty!36527 (= (arr!29847 _values!1278) (store mapRest!36527 mapKey!36527 mapValue!36527))))

(declare-fun res!658938 () Bool)

(assert (=> start!84196 (=> (not res!658938) (not e!555118))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84196 (= res!658938 (validMask!0 mask!1948))))

(assert (=> start!84196 e!555118))

(assert (=> start!84196 true))

(declare-fun tp_is_empty!22999 () Bool)

(assert (=> start!84196 tp_is_empty!22999))

(declare-fun e!555115 () Bool)

(declare-fun array_inv!23073 (array!61979) Bool)

(assert (=> start!84196 (and (array_inv!23073 _values!1278) e!555115)))

(assert (=> start!84196 tp!69294))

(declare-fun array_inv!23074 (array!61977) Bool)

(assert (=> start!84196 (array_inv!23074 _keys!1544)))

(declare-fun b!984739 () Bool)

(declare-fun e!555117 () Bool)

(assert (=> b!984739 (= e!555115 (and e!555117 mapRes!36527))))

(declare-fun condMapEmpty!36527 () Bool)

(declare-fun mapDefault!36527 () ValueCell!11018)

