; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71152 () Bool)

(assert start!71152)

(declare-fun b_free!13319 () Bool)

(declare-fun b_next!13319 () Bool)

(assert (=> start!71152 (= b_free!13319 (not b_next!13319))))

(declare-fun tp!46716 () Bool)

(declare-fun b_and!22245 () Bool)

(assert (=> start!71152 (= tp!46716 b_and!22245)))

(declare-fun b!826454 () Bool)

(declare-fun e!460212 () Bool)

(assert (=> b!826454 (= e!460212 true)))

(declare-datatypes ((V!25039 0))(
  ( (V!25040 (val!7562 Int)) )
))
(declare-datatypes ((tuple2!10018 0))(
  ( (tuple2!10019 (_1!5020 (_ BitVec 64)) (_2!5020 V!25039)) )
))
(declare-fun lt!373994 () tuple2!10018)

(declare-fun lt!373991 () tuple2!10018)

(declare-datatypes ((List!15817 0))(
  ( (Nil!15814) (Cons!15813 (h!16942 tuple2!10018) (t!22164 List!15817)) )
))
(declare-datatypes ((ListLongMap!8841 0))(
  ( (ListLongMap!8842 (toList!4436 List!15817)) )
))
(declare-fun lt!373992 () ListLongMap!8841)

(declare-fun lt!373993 () ListLongMap!8841)

(declare-fun +!1943 (ListLongMap!8841 tuple2!10018) ListLongMap!8841)

(assert (=> b!826454 (= lt!373993 (+!1943 (+!1943 lt!373992 lt!373991) lt!373994))))

(declare-fun lt!373990 () ListLongMap!8841)

(declare-fun lt!373988 () ListLongMap!8841)

(declare-fun lt!373995 () ListLongMap!8841)

(assert (=> b!826454 (and (= lt!373990 lt!373988) (= lt!373995 lt!373988) (= lt!373995 lt!373990))))

(declare-fun lt!373987 () ListLongMap!8841)

(assert (=> b!826454 (= lt!373988 (+!1943 lt!373987 lt!373991))))

(declare-fun lt!373983 () ListLongMap!8841)

(assert (=> b!826454 (= lt!373990 (+!1943 lt!373983 lt!373991))))

(declare-fun zeroValueBefore!34 () V!25039)

(declare-fun zeroValueAfter!34 () V!25039)

(declare-datatypes ((Unit!28335 0))(
  ( (Unit!28336) )
))
(declare-fun lt!373985 () Unit!28335)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!226 (ListLongMap!8841 (_ BitVec 64) V!25039 V!25039) Unit!28335)

(assert (=> b!826454 (= lt!373985 (addSameAsAddTwiceSameKeyDiffValues!226 lt!373983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460216 () Bool)

(assert (=> b!826454 e!460216))

(declare-fun res!563367 () Bool)

(assert (=> b!826454 (=> (not res!563367) (not e!460216))))

(declare-fun lt!373989 () ListLongMap!8841)

(assert (=> b!826454 (= res!563367 (= lt!373989 lt!373987))))

(declare-fun lt!373984 () tuple2!10018)

(assert (=> b!826454 (= lt!373987 (+!1943 lt!373983 lt!373984))))

(assert (=> b!826454 (= lt!373983 (+!1943 lt!373992 lt!373994))))

(assert (=> b!826454 (= lt!373991 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460214 () Bool)

(assert (=> b!826454 e!460214))

(declare-fun res!563369 () Bool)

(assert (=> b!826454 (=> (not res!563369) (not e!460214))))

(assert (=> b!826454 (= res!563369 (= lt!373989 (+!1943 (+!1943 lt!373992 lt!373984) lt!373994)))))

(declare-fun minValue!754 () V!25039)

(assert (=> b!826454 (= lt!373994 (tuple2!10019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826454 (= lt!373984 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46238 0))(
  ( (array!46239 (arr!22164 (Array (_ BitVec 32) (_ BitVec 64))) (size!22585 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46238)

(declare-datatypes ((ValueCell!7099 0))(
  ( (ValueCellFull!7099 (v!9996 V!25039)) (EmptyCell!7099) )
))
(declare-datatypes ((array!46240 0))(
  ( (array!46241 (arr!22165 (Array (_ BitVec 32) ValueCell!7099)) (size!22586 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46240)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2566 (array!46238 array!46240 (_ BitVec 32) (_ BitVec 32) V!25039 V!25039 (_ BitVec 32) Int) ListLongMap!8841)

(assert (=> b!826454 (= lt!373995 (getCurrentListMap!2566 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826454 (= lt!373989 (getCurrentListMap!2566 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24169 () Bool)

(declare-fun mapRes!24169 () Bool)

(declare-fun tp!46717 () Bool)

(declare-fun e!460219 () Bool)

(assert (=> mapNonEmpty!24169 (= mapRes!24169 (and tp!46717 e!460219))))

(declare-fun mapValue!24169 () ValueCell!7099)

(declare-fun mapRest!24169 () (Array (_ BitVec 32) ValueCell!7099))

(declare-fun mapKey!24169 () (_ BitVec 32))

(assert (=> mapNonEmpty!24169 (= (arr!22165 _values!788) (store mapRest!24169 mapKey!24169 mapValue!24169))))

(declare-fun b!826455 () Bool)

(declare-fun res!563370 () Bool)

(declare-fun e!460215 () Bool)

(assert (=> b!826455 (=> (not res!563370) (not e!460215))))

(assert (=> b!826455 (= res!563370 (and (= (size!22586 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22585 _keys!976) (size!22586 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!373986 () ListLongMap!8841)

(declare-fun b!826456 () Bool)

(assert (=> b!826456 (= e!460214 (= lt!373995 (+!1943 (+!1943 lt!373986 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373994)))))

(declare-fun b!826457 () Bool)

(assert (=> b!826457 (= e!460216 (= lt!373995 (+!1943 (+!1943 lt!373986 lt!373994) lt!373991)))))

(declare-fun mapIsEmpty!24169 () Bool)

(assert (=> mapIsEmpty!24169 mapRes!24169))

(declare-fun res!563373 () Bool)

(assert (=> start!71152 (=> (not res!563373) (not e!460215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71152 (= res!563373 (validMask!0 mask!1312))))

(assert (=> start!71152 e!460215))

(declare-fun tp_is_empty!15029 () Bool)

(assert (=> start!71152 tp_is_empty!15029))

(declare-fun array_inv!17667 (array!46238) Bool)

(assert (=> start!71152 (array_inv!17667 _keys!976)))

(assert (=> start!71152 true))

(declare-fun e!460218 () Bool)

(declare-fun array_inv!17668 (array!46240) Bool)

(assert (=> start!71152 (and (array_inv!17668 _values!788) e!460218)))

(assert (=> start!71152 tp!46716))

(declare-fun b!826458 () Bool)

(declare-fun res!563371 () Bool)

(assert (=> b!826458 (=> (not res!563371) (not e!460215))))

(declare-datatypes ((List!15818 0))(
  ( (Nil!15815) (Cons!15814 (h!16943 (_ BitVec 64)) (t!22165 List!15818)) )
))
(declare-fun arrayNoDuplicates!0 (array!46238 (_ BitVec 32) List!15818) Bool)

(assert (=> b!826458 (= res!563371 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15815))))

(declare-fun b!826459 () Bool)

(assert (=> b!826459 (= e!460215 (not e!460212))))

(declare-fun res!563372 () Bool)

(assert (=> b!826459 (=> res!563372 e!460212)))

(assert (=> b!826459 (= res!563372 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826459 (= lt!373992 lt!373986)))

(declare-fun lt!373996 () Unit!28335)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!553 (array!46238 array!46240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25039 V!25039 V!25039 V!25039 (_ BitVec 32) Int) Unit!28335)

(assert (=> b!826459 (= lt!373996 (lemmaNoChangeToArrayThenSameMapNoExtras!553 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2443 (array!46238 array!46240 (_ BitVec 32) (_ BitVec 32) V!25039 V!25039 (_ BitVec 32) Int) ListLongMap!8841)

(assert (=> b!826459 (= lt!373986 (getCurrentListMapNoExtraKeys!2443 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826459 (= lt!373992 (getCurrentListMapNoExtraKeys!2443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826460 () Bool)

(assert (=> b!826460 (= e!460219 tp_is_empty!15029)))

(declare-fun b!826461 () Bool)

(declare-fun e!460217 () Bool)

(assert (=> b!826461 (= e!460217 tp_is_empty!15029)))

(declare-fun b!826462 () Bool)

(declare-fun res!563368 () Bool)

(assert (=> b!826462 (=> (not res!563368) (not e!460215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46238 (_ BitVec 32)) Bool)

(assert (=> b!826462 (= res!563368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826463 () Bool)

(assert (=> b!826463 (= e!460218 (and e!460217 mapRes!24169))))

(declare-fun condMapEmpty!24169 () Bool)

(declare-fun mapDefault!24169 () ValueCell!7099)

