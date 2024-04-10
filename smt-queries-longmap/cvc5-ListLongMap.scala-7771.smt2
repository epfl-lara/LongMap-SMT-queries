; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97370 () Bool)

(assert start!97370)

(declare-fun b_free!23341 () Bool)

(declare-fun b_next!23341 () Bool)

(assert (=> start!97370 (= b_free!23341 (not b_next!23341))))

(declare-fun tp!82321 () Bool)

(declare-fun b_and!37517 () Bool)

(assert (=> start!97370 (= tp!82321 b_and!37517)))

(declare-fun b!1109919 () Bool)

(declare-fun res!740699 () Bool)

(declare-fun e!633039 () Bool)

(assert (=> b!1109919 (=> (not res!740699) (not e!633039))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109919 (= res!740699 (validMask!0 mask!1564))))

(declare-fun b!1109920 () Bool)

(declare-fun res!740691 () Bool)

(assert (=> b!1109920 (=> (not res!740691) (not e!633039))))

(declare-datatypes ((array!72119 0))(
  ( (array!72120 (arr!34712 (Array (_ BitVec 32) (_ BitVec 64))) (size!35248 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72119)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72119 (_ BitVec 32)) Bool)

(assert (=> b!1109920 (= res!740691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43219 () Bool)

(declare-fun mapRes!43219 () Bool)

(declare-fun tp!82322 () Bool)

(declare-fun e!633045 () Bool)

(assert (=> mapNonEmpty!43219 (= mapRes!43219 (and tp!82322 e!633045))))

(declare-datatypes ((V!41929 0))(
  ( (V!41930 (val!13857 Int)) )
))
(declare-datatypes ((ValueCell!13091 0))(
  ( (ValueCellFull!13091 (v!16490 V!41929)) (EmptyCell!13091) )
))
(declare-fun mapRest!43219 () (Array (_ BitVec 32) ValueCell!13091))

(declare-fun mapValue!43219 () ValueCell!13091)

(declare-fun mapKey!43219 () (_ BitVec 32))

(declare-datatypes ((array!72121 0))(
  ( (array!72122 (arr!34713 (Array (_ BitVec 32) ValueCell!13091)) (size!35249 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72121)

(assert (=> mapNonEmpty!43219 (= (arr!34713 _values!996) (store mapRest!43219 mapKey!43219 mapValue!43219))))

(declare-fun b!1109921 () Bool)

(declare-fun res!740698 () Bool)

(assert (=> b!1109921 (=> (not res!740698) (not e!633039))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1109921 (= res!740698 (= (select (arr!34712 _keys!1208) i!673) k!934))))

(declare-fun b!1109922 () Bool)

(declare-fun tp_is_empty!27601 () Bool)

(assert (=> b!1109922 (= e!633045 tp_is_empty!27601)))

(declare-fun b!1109923 () Bool)

(declare-fun res!740700 () Bool)

(assert (=> b!1109923 (=> (not res!740700) (not e!633039))))

(declare-datatypes ((List!24205 0))(
  ( (Nil!24202) (Cons!24201 (h!25410 (_ BitVec 64)) (t!34592 List!24205)) )
))
(declare-fun arrayNoDuplicates!0 (array!72119 (_ BitVec 32) List!24205) Bool)

(assert (=> b!1109923 (= res!740700 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24202))))

(declare-fun b!1109924 () Bool)

(declare-fun e!633038 () Bool)

(declare-fun e!633044 () Bool)

(assert (=> b!1109924 (= e!633038 (and e!633044 mapRes!43219))))

(declare-fun condMapEmpty!43219 () Bool)

(declare-fun mapDefault!43219 () ValueCell!13091)

