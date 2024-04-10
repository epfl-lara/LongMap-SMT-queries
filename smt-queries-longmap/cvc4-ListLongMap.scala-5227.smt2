; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70430 () Bool)

(assert start!70430)

(declare-fun b_free!12773 () Bool)

(declare-fun b_next!12773 () Bool)

(assert (=> start!70430 (= b_free!12773 (not b_next!12773))))

(declare-fun tp!45049 () Bool)

(declare-fun b_and!21593 () Bool)

(assert (=> start!70430 (= tp!45049 b_and!21593)))

(declare-fun b!818091 () Bool)

(declare-fun e!454062 () Bool)

(declare-fun tp_is_empty!14483 () Bool)

(assert (=> b!818091 (= e!454062 tp_is_empty!14483)))

(declare-fun mapNonEmpty!23320 () Bool)

(declare-fun mapRes!23320 () Bool)

(declare-fun tp!45048 () Bool)

(declare-fun e!454061 () Bool)

(assert (=> mapNonEmpty!23320 (= mapRes!23320 (and tp!45048 e!454061))))

(declare-datatypes ((V!24311 0))(
  ( (V!24312 (val!7289 Int)) )
))
(declare-datatypes ((ValueCell!6826 0))(
  ( (ValueCellFull!6826 (v!9718 V!24311)) (EmptyCell!6826) )
))
(declare-fun mapValue!23320 () ValueCell!6826)

(declare-datatypes ((array!45166 0))(
  ( (array!45167 (arr!21638 (Array (_ BitVec 32) ValueCell!6826)) (size!22059 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45166)

(declare-fun mapRest!23320 () (Array (_ BitVec 32) ValueCell!6826))

(declare-fun mapKey!23320 () (_ BitVec 32))

(assert (=> mapNonEmpty!23320 (= (arr!21638 _values!788) (store mapRest!23320 mapKey!23320 mapValue!23320))))

(declare-fun b!818092 () Bool)

(declare-fun e!454066 () Bool)

(assert (=> b!818092 (= e!454066 true)))

(declare-fun zeroValueBefore!34 () V!24311)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24311)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!45168 0))(
  ( (array!45169 (arr!21639 (Array (_ BitVec 32) (_ BitVec 64))) (size!22060 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45168)

(declare-datatypes ((tuple2!9580 0))(
  ( (tuple2!9581 (_1!4801 (_ BitVec 64)) (_2!4801 V!24311)) )
))
(declare-datatypes ((List!15409 0))(
  ( (Nil!15406) (Cons!15405 (h!16534 tuple2!9580) (t!21736 List!15409)) )
))
(declare-datatypes ((ListLongMap!8403 0))(
  ( (ListLongMap!8404 (toList!4217 List!15409)) )
))
(declare-fun lt!366556 () ListLongMap!8403)

(declare-fun getCurrentListMap!2423 (array!45168 array!45166 (_ BitVec 32) (_ BitVec 32) V!24311 V!24311 (_ BitVec 32) Int) ListLongMap!8403)

(assert (=> b!818092 (= lt!366556 (getCurrentListMap!2423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818093 () Bool)

(assert (=> b!818093 (= e!454061 tp_is_empty!14483)))

(declare-fun b!818094 () Bool)

(declare-fun e!454063 () Bool)

(assert (=> b!818094 (= e!454063 (not e!454066))))

(declare-fun res!558351 () Bool)

(assert (=> b!818094 (=> res!558351 e!454066)))

(assert (=> b!818094 (= res!558351 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366553 () ListLongMap!8403)

(declare-fun lt!366555 () ListLongMap!8403)

(assert (=> b!818094 (= lt!366553 lt!366555)))

(declare-datatypes ((Unit!27918 0))(
  ( (Unit!27919) )
))
(declare-fun lt!366554 () Unit!27918)

(declare-fun zeroValueAfter!34 () V!24311)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!368 (array!45168 array!45166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24311 V!24311 V!24311 V!24311 (_ BitVec 32) Int) Unit!27918)

(assert (=> b!818094 (= lt!366554 (lemmaNoChangeToArrayThenSameMapNoExtras!368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2258 (array!45168 array!45166 (_ BitVec 32) (_ BitVec 32) V!24311 V!24311 (_ BitVec 32) Int) ListLongMap!8403)

(assert (=> b!818094 (= lt!366555 (getCurrentListMapNoExtraKeys!2258 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818094 (= lt!366553 (getCurrentListMapNoExtraKeys!2258 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818095 () Bool)

(declare-fun res!558350 () Bool)

(assert (=> b!818095 (=> (not res!558350) (not e!454063))))

(assert (=> b!818095 (= res!558350 (and (= (size!22059 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22060 _keys!976) (size!22059 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23320 () Bool)

(assert (=> mapIsEmpty!23320 mapRes!23320))

(declare-fun b!818096 () Bool)

(declare-fun res!558352 () Bool)

(assert (=> b!818096 (=> (not res!558352) (not e!454063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45168 (_ BitVec 32)) Bool)

(assert (=> b!818096 (= res!558352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818097 () Bool)

(declare-fun res!558353 () Bool)

(assert (=> b!818097 (=> (not res!558353) (not e!454063))))

(declare-datatypes ((List!15410 0))(
  ( (Nil!15407) (Cons!15406 (h!16535 (_ BitVec 64)) (t!21737 List!15410)) )
))
(declare-fun arrayNoDuplicates!0 (array!45168 (_ BitVec 32) List!15410) Bool)

(assert (=> b!818097 (= res!558353 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15407))))

(declare-fun res!558349 () Bool)

(assert (=> start!70430 (=> (not res!558349) (not e!454063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70430 (= res!558349 (validMask!0 mask!1312))))

(assert (=> start!70430 e!454063))

(assert (=> start!70430 tp_is_empty!14483))

(declare-fun array_inv!17305 (array!45168) Bool)

(assert (=> start!70430 (array_inv!17305 _keys!976)))

(assert (=> start!70430 true))

(declare-fun e!454065 () Bool)

(declare-fun array_inv!17306 (array!45166) Bool)

(assert (=> start!70430 (and (array_inv!17306 _values!788) e!454065)))

(assert (=> start!70430 tp!45049))

(declare-fun b!818098 () Bool)

(assert (=> b!818098 (= e!454065 (and e!454062 mapRes!23320))))

(declare-fun condMapEmpty!23320 () Bool)

(declare-fun mapDefault!23320 () ValueCell!6826)

