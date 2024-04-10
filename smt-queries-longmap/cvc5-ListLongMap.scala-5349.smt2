; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71580 () Bool)

(assert start!71580)

(declare-fun b_free!13501 () Bool)

(declare-fun b_next!13501 () Bool)

(assert (=> start!71580 (= b_free!13501 (not b_next!13501))))

(declare-fun tp!47294 () Bool)

(declare-fun b_and!22559 () Bool)

(assert (=> start!71580 (= tp!47294 b_and!22559)))

(declare-fun b!831765 () Bool)

(declare-fun res!566055 () Bool)

(declare-fun e!463841 () Bool)

(assert (=> b!831765 (=> (not res!566055) (not e!463841))))

(declare-datatypes ((array!46594 0))(
  ( (array!46595 (arr!22332 (Array (_ BitVec 32) (_ BitVec 64))) (size!22753 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46594)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46594 (_ BitVec 32)) Bool)

(assert (=> b!831765 (= res!566055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!831766 () Bool)

(declare-fun e!463844 () Bool)

(declare-fun tp_is_empty!15211 () Bool)

(assert (=> b!831766 (= e!463844 tp_is_empty!15211)))

(declare-fun res!566060 () Bool)

(assert (=> start!71580 (=> (not res!566060) (not e!463841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71580 (= res!566060 (validMask!0 mask!1312))))

(assert (=> start!71580 e!463841))

(assert (=> start!71580 tp_is_empty!15211))

(declare-fun array_inv!17785 (array!46594) Bool)

(assert (=> start!71580 (array_inv!17785 _keys!976)))

(assert (=> start!71580 true))

(declare-datatypes ((V!25283 0))(
  ( (V!25284 (val!7653 Int)) )
))
(declare-datatypes ((ValueCell!7190 0))(
  ( (ValueCellFull!7190 (v!10098 V!25283)) (EmptyCell!7190) )
))
(declare-datatypes ((array!46596 0))(
  ( (array!46597 (arr!22333 (Array (_ BitVec 32) ValueCell!7190)) (size!22754 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46596)

(declare-fun e!463840 () Bool)

(declare-fun array_inv!17786 (array!46596) Bool)

(assert (=> start!71580 (and (array_inv!17786 _values!788) e!463840)))

(assert (=> start!71580 tp!47294))

(declare-fun mapNonEmpty!24474 () Bool)

(declare-fun mapRes!24474 () Bool)

(declare-fun tp!47295 () Bool)

(declare-fun e!463842 () Bool)

(assert (=> mapNonEmpty!24474 (= mapRes!24474 (and tp!47295 e!463842))))

(declare-fun mapKey!24474 () (_ BitVec 32))

(declare-fun mapValue!24474 () ValueCell!7190)

(declare-fun mapRest!24474 () (Array (_ BitVec 32) ValueCell!7190))

(assert (=> mapNonEmpty!24474 (= (arr!22333 _values!788) (store mapRest!24474 mapKey!24474 mapValue!24474))))

(declare-datatypes ((tuple2!10154 0))(
  ( (tuple2!10155 (_1!5088 (_ BitVec 64)) (_2!5088 V!25283)) )
))
(declare-datatypes ((List!15948 0))(
  ( (Nil!15945) (Cons!15944 (h!17074 tuple2!10154) (t!22316 List!15948)) )
))
(declare-datatypes ((ListLongMap!8977 0))(
  ( (ListLongMap!8978 (toList!4504 List!15948)) )
))
(declare-fun lt!377402 () ListLongMap!8977)

(declare-fun lt!377406 () ListLongMap!8977)

(declare-fun zeroValueAfter!34 () V!25283)

(declare-fun lt!377404 () tuple2!10154)

(declare-fun e!463843 () Bool)

(declare-fun b!831767 () Bool)

(declare-fun +!1982 (ListLongMap!8977 tuple2!10154) ListLongMap!8977)

(assert (=> b!831767 (= e!463843 (= lt!377402 (+!1982 (+!1982 lt!377406 lt!377404) (tuple2!10155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463839 () Bool)

(assert (=> b!831767 e!463839))

(declare-fun res!566057 () Bool)

(assert (=> b!831767 (=> (not res!566057) (not e!463839))))

(declare-fun lt!377407 () ListLongMap!8977)

(declare-fun lt!377401 () tuple2!10154)

(declare-fun lt!377403 () ListLongMap!8977)

(assert (=> b!831767 (= res!566057 (= lt!377403 (+!1982 (+!1982 lt!377407 lt!377401) lt!377404)))))

(declare-fun minValue!754 () V!25283)

(assert (=> b!831767 (= lt!377404 (tuple2!10155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun zeroValueBefore!34 () V!25283)

(assert (=> b!831767 (= lt!377401 (tuple2!10155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2600 (array!46594 array!46596 (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 (_ BitVec 32) Int) ListLongMap!8977)

(assert (=> b!831767 (= lt!377402 (getCurrentListMap!2600 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!831767 (= lt!377403 (getCurrentListMap!2600 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831768 () Bool)

(declare-fun res!566054 () Bool)

(assert (=> b!831768 (=> (not res!566054) (not e!463839))))

(assert (=> b!831768 (= res!566054 (= lt!377402 (+!1982 (+!1982 lt!377406 (tuple2!10155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377404)))))

(declare-fun b!831769 () Bool)

(declare-fun res!566059 () Bool)

(assert (=> b!831769 (=> (not res!566059) (not e!463841))))

(assert (=> b!831769 (= res!566059 (and (= (size!22754 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22753 _keys!976) (size!22754 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!831770 () Bool)

(assert (=> b!831770 (= e!463841 (not e!463843))))

(declare-fun res!566058 () Bool)

(assert (=> b!831770 (=> res!566058 e!463843)))

(assert (=> b!831770 (= res!566058 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831770 (= lt!377407 lt!377406)))

(declare-datatypes ((Unit!28491 0))(
  ( (Unit!28492) )
))
(declare-fun lt!377405 () Unit!28491)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!591 (array!46594 array!46596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 V!25283 V!25283 (_ BitVec 32) Int) Unit!28491)

(assert (=> b!831770 (= lt!377405 (lemmaNoChangeToArrayThenSameMapNoExtras!591 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2503 (array!46594 array!46596 (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 (_ BitVec 32) Int) ListLongMap!8977)

(assert (=> b!831770 (= lt!377406 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831770 (= lt!377407 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831771 () Bool)

(assert (=> b!831771 (= e!463840 (and e!463844 mapRes!24474))))

(declare-fun condMapEmpty!24474 () Bool)

(declare-fun mapDefault!24474 () ValueCell!7190)

