; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71164 () Bool)

(assert start!71164)

(declare-fun b_free!13331 () Bool)

(declare-fun b_next!13331 () Bool)

(assert (=> start!71164 (= b_free!13331 (not b_next!13331))))

(declare-fun tp!46753 () Bool)

(declare-fun b_and!22257 () Bool)

(assert (=> start!71164 (= tp!46753 b_and!22257)))

(declare-fun mapIsEmpty!24187 () Bool)

(declare-fun mapRes!24187 () Bool)

(assert (=> mapIsEmpty!24187 mapRes!24187))

(declare-fun b!826635 () Bool)

(declare-fun e!460361 () Bool)

(assert (=> b!826635 (= e!460361 true)))

(declare-datatypes ((V!25055 0))(
  ( (V!25056 (val!7568 Int)) )
))
(declare-datatypes ((tuple2!10028 0))(
  ( (tuple2!10029 (_1!5025 (_ BitVec 64)) (_2!5025 V!25055)) )
))
(declare-datatypes ((List!15825 0))(
  ( (Nil!15822) (Cons!15821 (h!16950 tuple2!10028) (t!22172 List!15825)) )
))
(declare-datatypes ((ListLongMap!8851 0))(
  ( (ListLongMap!8852 (toList!4441 List!15825)) )
))
(declare-fun lt!374238 () ListLongMap!8851)

(declare-fun lt!374236 () tuple2!10028)

(declare-fun lt!374243 () tuple2!10028)

(declare-fun lt!374239 () ListLongMap!8851)

(declare-fun +!1948 (ListLongMap!8851 tuple2!10028) ListLongMap!8851)

(assert (=> b!826635 (= lt!374239 (+!1948 (+!1948 lt!374238 lt!374236) lt!374243))))

(declare-fun lt!374235 () ListLongMap!8851)

(declare-fun lt!374242 () ListLongMap!8851)

(declare-fun lt!374237 () ListLongMap!8851)

(assert (=> b!826635 (and (= lt!374235 lt!374242) (= lt!374237 lt!374242) (= lt!374237 lt!374235))))

(declare-fun lt!374244 () ListLongMap!8851)

(assert (=> b!826635 (= lt!374242 (+!1948 lt!374244 lt!374236))))

(declare-fun lt!374245 () ListLongMap!8851)

(assert (=> b!826635 (= lt!374235 (+!1948 lt!374245 lt!374236))))

(declare-fun zeroValueAfter!34 () V!25055)

(declare-fun zeroValueBefore!34 () V!25055)

(declare-datatypes ((Unit!28343 0))(
  ( (Unit!28344) )
))
(declare-fun lt!374240 () Unit!28343)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!230 (ListLongMap!8851 (_ BitVec 64) V!25055 V!25055) Unit!28343)

(assert (=> b!826635 (= lt!374240 (addSameAsAddTwiceSameKeyDiffValues!230 lt!374245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460356 () Bool)

(assert (=> b!826635 e!460356))

(declare-fun res!563497 () Bool)

(assert (=> b!826635 (=> (not res!563497) (not e!460356))))

(declare-fun lt!374247 () ListLongMap!8851)

(assert (=> b!826635 (= res!563497 (= lt!374247 lt!374244))))

(declare-fun lt!374248 () tuple2!10028)

(assert (=> b!826635 (= lt!374244 (+!1948 lt!374245 lt!374248))))

(assert (=> b!826635 (= lt!374245 (+!1948 lt!374238 lt!374243))))

(assert (=> b!826635 (= lt!374236 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460358 () Bool)

(assert (=> b!826635 e!460358))

(declare-fun res!563495 () Bool)

(assert (=> b!826635 (=> (not res!563495) (not e!460358))))

(assert (=> b!826635 (= res!563495 (= lt!374247 (+!1948 (+!1948 lt!374238 lt!374248) lt!374243)))))

(declare-fun minValue!754 () V!25055)

(assert (=> b!826635 (= lt!374243 (tuple2!10029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826635 (= lt!374248 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46260 0))(
  ( (array!46261 (arr!22175 (Array (_ BitVec 32) (_ BitVec 64))) (size!22596 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46260)

(declare-datatypes ((ValueCell!7105 0))(
  ( (ValueCellFull!7105 (v!10002 V!25055)) (EmptyCell!7105) )
))
(declare-datatypes ((array!46262 0))(
  ( (array!46263 (arr!22176 (Array (_ BitVec 32) ValueCell!7105)) (size!22597 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46262)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2570 (array!46260 array!46262 (_ BitVec 32) (_ BitVec 32) V!25055 V!25055 (_ BitVec 32) Int) ListLongMap!8851)

(assert (=> b!826635 (= lt!374237 (getCurrentListMap!2570 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826635 (= lt!374247 (getCurrentListMap!2570 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826636 () Bool)

(declare-fun lt!374246 () ListLongMap!8851)

(assert (=> b!826636 (= e!460356 (= lt!374237 (+!1948 (+!1948 lt!374246 lt!374243) lt!374236)))))

(declare-fun b!826637 () Bool)

(declare-fun res!563499 () Bool)

(declare-fun e!460359 () Bool)

(assert (=> b!826637 (=> (not res!563499) (not e!460359))))

(assert (=> b!826637 (= res!563499 (and (= (size!22597 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22596 _keys!976) (size!22597 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826638 () Bool)

(declare-fun res!563493 () Bool)

(assert (=> b!826638 (=> (not res!563493) (not e!460359))))

(declare-datatypes ((List!15826 0))(
  ( (Nil!15823) (Cons!15822 (h!16951 (_ BitVec 64)) (t!22173 List!15826)) )
))
(declare-fun arrayNoDuplicates!0 (array!46260 (_ BitVec 32) List!15826) Bool)

(assert (=> b!826638 (= res!563493 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15823))))

(declare-fun mapNonEmpty!24187 () Bool)

(declare-fun tp!46752 () Bool)

(declare-fun e!460360 () Bool)

(assert (=> mapNonEmpty!24187 (= mapRes!24187 (and tp!46752 e!460360))))

(declare-fun mapRest!24187 () (Array (_ BitVec 32) ValueCell!7105))

(declare-fun mapKey!24187 () (_ BitVec 32))

(declare-fun mapValue!24187 () ValueCell!7105)

(assert (=> mapNonEmpty!24187 (= (arr!22176 _values!788) (store mapRest!24187 mapKey!24187 mapValue!24187))))

(declare-fun b!826639 () Bool)

(declare-fun res!563496 () Bool)

(assert (=> b!826639 (=> (not res!563496) (not e!460359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46260 (_ BitVec 32)) Bool)

(assert (=> b!826639 (= res!563496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563494 () Bool)

(assert (=> start!71164 (=> (not res!563494) (not e!460359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71164 (= res!563494 (validMask!0 mask!1312))))

(assert (=> start!71164 e!460359))

(declare-fun tp_is_empty!15041 () Bool)

(assert (=> start!71164 tp_is_empty!15041))

(declare-fun array_inv!17675 (array!46260) Bool)

(assert (=> start!71164 (array_inv!17675 _keys!976)))

(assert (=> start!71164 true))

(declare-fun e!460363 () Bool)

(declare-fun array_inv!17676 (array!46262) Bool)

(assert (=> start!71164 (and (array_inv!17676 _values!788) e!460363)))

(assert (=> start!71164 tp!46753))

(declare-fun b!826634 () Bool)

(assert (=> b!826634 (= e!460359 (not e!460361))))

(declare-fun res!563498 () Bool)

(assert (=> b!826634 (=> res!563498 e!460361)))

(assert (=> b!826634 (= res!563498 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826634 (= lt!374238 lt!374246)))

(declare-fun lt!374241 () Unit!28343)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!556 (array!46260 array!46262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25055 V!25055 V!25055 V!25055 (_ BitVec 32) Int) Unit!28343)

(assert (=> b!826634 (= lt!374241 (lemmaNoChangeToArrayThenSameMapNoExtras!556 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2446 (array!46260 array!46262 (_ BitVec 32) (_ BitVec 32) V!25055 V!25055 (_ BitVec 32) Int) ListLongMap!8851)

(assert (=> b!826634 (= lt!374246 (getCurrentListMapNoExtraKeys!2446 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826634 (= lt!374238 (getCurrentListMapNoExtraKeys!2446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826640 () Bool)

(assert (=> b!826640 (= e!460358 (= lt!374237 (+!1948 (+!1948 lt!374246 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374243)))))

(declare-fun b!826641 () Bool)

(declare-fun e!460357 () Bool)

(assert (=> b!826641 (= e!460363 (and e!460357 mapRes!24187))))

(declare-fun condMapEmpty!24187 () Bool)

(declare-fun mapDefault!24187 () ValueCell!7105)

