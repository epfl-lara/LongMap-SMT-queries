; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71232 () Bool)

(assert start!71232)

(declare-fun b_free!13399 () Bool)

(declare-fun b_next!13399 () Bool)

(assert (=> start!71232 (= b_free!13399 (not b_next!13399))))

(declare-fun tp!46960 () Bool)

(declare-fun b_and!22311 () Bool)

(assert (=> start!71232 (= tp!46960 b_and!22311)))

(declare-fun b!827392 () Bool)

(declare-fun e!460930 () Bool)

(declare-fun tp_is_empty!15109 () Bool)

(assert (=> b!827392 (= e!460930 tp_is_empty!15109)))

(declare-fun b!827393 () Bool)

(declare-fun e!460932 () Bool)

(assert (=> b!827393 (= e!460932 false)))

(declare-datatypes ((array!46357 0))(
  ( (array!46358 (arr!22223 (Array (_ BitVec 32) (_ BitVec 64))) (size!22644 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46357)

(declare-datatypes ((V!25147 0))(
  ( (V!25148 (val!7602 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25147)

(declare-fun minValue!754 () V!25147)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!7139 0))(
  ( (ValueCellFull!7139 (v!10031 V!25147)) (EmptyCell!7139) )
))
(declare-datatypes ((array!46359 0))(
  ( (array!46360 (arr!22224 (Array (_ BitVec 32) ValueCell!7139)) (size!22645 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46359)

(declare-datatypes ((tuple2!10090 0))(
  ( (tuple2!10091 (_1!5056 (_ BitVec 64)) (_2!5056 V!25147)) )
))
(declare-datatypes ((List!15876 0))(
  ( (Nil!15873) (Cons!15872 (h!17001 tuple2!10090) (t!22216 List!15876)) )
))
(declare-datatypes ((ListLongMap!8903 0))(
  ( (ListLongMap!8904 (toList!4467 List!15876)) )
))
(declare-fun lt!374719 () ListLongMap!8903)

(declare-fun getCurrentListMapNoExtraKeys!2499 (array!46357 array!46359 (_ BitVec 32) (_ BitVec 32) V!25147 V!25147 (_ BitVec 32) Int) ListLongMap!8903)

(assert (=> b!827393 (= lt!374719 (getCurrentListMapNoExtraKeys!2499 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25147)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374720 () ListLongMap!8903)

(assert (=> b!827393 (= lt!374720 (getCurrentListMapNoExtraKeys!2499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563983 () Bool)

(assert (=> start!71232 (=> (not res!563983) (not e!460932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71232 (= res!563983 (validMask!0 mask!1312))))

(assert (=> start!71232 e!460932))

(assert (=> start!71232 tp_is_empty!15109))

(declare-fun array_inv!17771 (array!46357) Bool)

(assert (=> start!71232 (array_inv!17771 _keys!976)))

(assert (=> start!71232 true))

(declare-fun e!460933 () Bool)

(declare-fun array_inv!17772 (array!46359) Bool)

(assert (=> start!71232 (and (array_inv!17772 _values!788) e!460933)))

(assert (=> start!71232 tp!46960))

(declare-fun mapIsEmpty!24292 () Bool)

(declare-fun mapRes!24292 () Bool)

(assert (=> mapIsEmpty!24292 mapRes!24292))

(declare-fun b!827394 () Bool)

(declare-fun res!563985 () Bool)

(assert (=> b!827394 (=> (not res!563985) (not e!460932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46357 (_ BitVec 32)) Bool)

(assert (=> b!827394 (= res!563985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24292 () Bool)

(declare-fun tp!46959 () Bool)

(assert (=> mapNonEmpty!24292 (= mapRes!24292 (and tp!46959 e!460930))))

(declare-fun mapRest!24292 () (Array (_ BitVec 32) ValueCell!7139))

(declare-fun mapValue!24292 () ValueCell!7139)

(declare-fun mapKey!24292 () (_ BitVec 32))

(assert (=> mapNonEmpty!24292 (= (arr!22224 _values!788) (store mapRest!24292 mapKey!24292 mapValue!24292))))

(declare-fun b!827395 () Bool)

(declare-fun e!460934 () Bool)

(assert (=> b!827395 (= e!460934 tp_is_empty!15109)))

(declare-fun b!827396 () Bool)

(assert (=> b!827396 (= e!460933 (and e!460934 mapRes!24292))))

(declare-fun condMapEmpty!24292 () Bool)

(declare-fun mapDefault!24292 () ValueCell!7139)

(assert (=> b!827396 (= condMapEmpty!24292 (= (arr!22224 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7139)) mapDefault!24292)))))

(declare-fun b!827397 () Bool)

(declare-fun res!563986 () Bool)

(assert (=> b!827397 (=> (not res!563986) (not e!460932))))

(assert (=> b!827397 (= res!563986 (and (= (size!22645 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22644 _keys!976) (size!22645 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827398 () Bool)

(declare-fun res!563984 () Bool)

(assert (=> b!827398 (=> (not res!563984) (not e!460932))))

(declare-datatypes ((List!15877 0))(
  ( (Nil!15874) (Cons!15873 (h!17002 (_ BitVec 64)) (t!22217 List!15877)) )
))
(declare-fun arrayNoDuplicates!0 (array!46357 (_ BitVec 32) List!15877) Bool)

(assert (=> b!827398 (= res!563984 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15874))))

(assert (= (and start!71232 res!563983) b!827397))

(assert (= (and b!827397 res!563986) b!827394))

(assert (= (and b!827394 res!563985) b!827398))

(assert (= (and b!827398 res!563984) b!827393))

(assert (= (and b!827396 condMapEmpty!24292) mapIsEmpty!24292))

(assert (= (and b!827396 (not condMapEmpty!24292)) mapNonEmpty!24292))

(get-info :version)

(assert (= (and mapNonEmpty!24292 ((_ is ValueCellFull!7139) mapValue!24292)) b!827392))

(assert (= (and b!827396 ((_ is ValueCellFull!7139) mapDefault!24292)) b!827395))

(assert (= start!71232 b!827396))

(declare-fun m!769919 () Bool)

(assert (=> mapNonEmpty!24292 m!769919))

(declare-fun m!769921 () Bool)

(assert (=> b!827393 m!769921))

(declare-fun m!769923 () Bool)

(assert (=> b!827393 m!769923))

(declare-fun m!769925 () Bool)

(assert (=> start!71232 m!769925))

(declare-fun m!769927 () Bool)

(assert (=> start!71232 m!769927))

(declare-fun m!769929 () Bool)

(assert (=> start!71232 m!769929))

(declare-fun m!769931 () Bool)

(assert (=> b!827394 m!769931))

(declare-fun m!769933 () Bool)

(assert (=> b!827398 m!769933))

(check-sat tp_is_empty!15109 (not mapNonEmpty!24292) (not start!71232) (not b!827393) (not b_next!13399) (not b!827394) b_and!22311 (not b!827398))
(check-sat b_and!22311 (not b_next!13399))
