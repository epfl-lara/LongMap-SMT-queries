; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71382 () Bool)

(assert start!71382)

(declare-fun b_free!13463 () Bool)

(declare-fun b_next!13463 () Bool)

(assert (=> start!71382 (= b_free!13463 (not b_next!13463))))

(declare-fun tp!47163 () Bool)

(declare-fun b_and!22445 () Bool)

(assert (=> start!71382 (= tp!47163 b_and!22445)))

(declare-fun b!829029 () Bool)

(declare-fun e!462054 () Bool)

(declare-fun tp_is_empty!15173 () Bool)

(assert (=> b!829029 (= e!462054 tp_is_empty!15173)))

(declare-datatypes ((V!25231 0))(
  ( (V!25232 (val!7634 Int)) )
))
(declare-fun zeroValueBefore!34 () V!25231)

(declare-datatypes ((array!46508 0))(
  ( (array!46509 (arr!22294 (Array (_ BitVec 32) (_ BitVec 64))) (size!22715 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46508)

(declare-fun e!462053 () Bool)

(declare-fun minValue!754 () V!25231)

(declare-datatypes ((ValueCell!7171 0))(
  ( (ValueCellFull!7171 (v!10072 V!25231)) (EmptyCell!7171) )
))
(declare-datatypes ((array!46510 0))(
  ( (array!46511 (arr!22295 (Array (_ BitVec 32) ValueCell!7171)) (size!22716 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46510)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun b!829030 () Bool)

(declare-datatypes ((tuple2!10122 0))(
  ( (tuple2!10123 (_1!5072 (_ BitVec 64)) (_2!5072 V!25231)) )
))
(declare-datatypes ((List!15915 0))(
  ( (Nil!15912) (Cons!15911 (h!17040 tuple2!10122) (t!22272 List!15915)) )
))
(declare-datatypes ((ListLongMap!8945 0))(
  ( (ListLongMap!8946 (toList!4488 List!15915)) )
))
(declare-fun lt!375823 () ListLongMap!8945)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMap!2588 (array!46508 array!46510 (_ BitVec 32) (_ BitVec 32) V!25231 V!25231 (_ BitVec 32) Int) ListLongMap!8945)

(declare-fun +!1969 (ListLongMap!8945 tuple2!10122) ListLongMap!8945)

(assert (=> b!829030 (= e!462053 (= (getCurrentListMap!2588 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1969 lt!375823 (tuple2!10123 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun zeroValueAfter!34 () V!25231)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!375822 () ListLongMap!8945)

(assert (=> b!829030 (= lt!375822 (getCurrentListMap!2588 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829031 () Bool)

(declare-fun res!564832 () Bool)

(declare-fun e!462058 () Bool)

(assert (=> b!829031 (=> (not res!564832) (not e!462058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46508 (_ BitVec 32)) Bool)

(assert (=> b!829031 (= res!564832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829032 () Bool)

(assert (=> b!829032 (= e!462058 (not e!462053))))

(declare-fun res!564836 () Bool)

(assert (=> b!829032 (=> res!564836 e!462053)))

(assert (=> b!829032 (= res!564836 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!375820 () ListLongMap!8945)

(assert (=> b!829032 (= lt!375823 lt!375820)))

(declare-datatypes ((Unit!28397 0))(
  ( (Unit!28398) )
))
(declare-fun lt!375821 () Unit!28397)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!577 (array!46508 array!46510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25231 V!25231 V!25231 V!25231 (_ BitVec 32) Int) Unit!28397)

(assert (=> b!829032 (= lt!375821 (lemmaNoChangeToArrayThenSameMapNoExtras!577 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2489 (array!46508 array!46510 (_ BitVec 32) (_ BitVec 32) V!25231 V!25231 (_ BitVec 32) Int) ListLongMap!8945)

(assert (=> b!829032 (= lt!375820 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829032 (= lt!375823 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829033 () Bool)

(declare-fun e!462057 () Bool)

(assert (=> b!829033 (= e!462057 tp_is_empty!15173)))

(declare-fun b!829034 () Bool)

(declare-fun res!564833 () Bool)

(assert (=> b!829034 (=> (not res!564833) (not e!462058))))

(declare-datatypes ((List!15916 0))(
  ( (Nil!15913) (Cons!15912 (h!17041 (_ BitVec 64)) (t!22273 List!15916)) )
))
(declare-fun arrayNoDuplicates!0 (array!46508 (_ BitVec 32) List!15916) Bool)

(assert (=> b!829034 (= res!564833 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15913))))

(declare-fun mapNonEmpty!24400 () Bool)

(declare-fun mapRes!24400 () Bool)

(declare-fun tp!47164 () Bool)

(assert (=> mapNonEmpty!24400 (= mapRes!24400 (and tp!47164 e!462054))))

(declare-fun mapRest!24400 () (Array (_ BitVec 32) ValueCell!7171))

(declare-fun mapKey!24400 () (_ BitVec 32))

(declare-fun mapValue!24400 () ValueCell!7171)

(assert (=> mapNonEmpty!24400 (= (arr!22295 _values!788) (store mapRest!24400 mapKey!24400 mapValue!24400))))

(declare-fun b!829035 () Bool)

(declare-fun res!564835 () Bool)

(assert (=> b!829035 (=> (not res!564835) (not e!462058))))

(assert (=> b!829035 (= res!564835 (and (= (size!22716 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22715 _keys!976) (size!22716 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!564834 () Bool)

(assert (=> start!71382 (=> (not res!564834) (not e!462058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71382 (= res!564834 (validMask!0 mask!1312))))

(assert (=> start!71382 e!462058))

(assert (=> start!71382 tp_is_empty!15173))

(declare-fun array_inv!17759 (array!46508) Bool)

(assert (=> start!71382 (array_inv!17759 _keys!976)))

(assert (=> start!71382 true))

(declare-fun e!462056 () Bool)

(declare-fun array_inv!17760 (array!46510) Bool)

(assert (=> start!71382 (and (array_inv!17760 _values!788) e!462056)))

(assert (=> start!71382 tp!47163))

(declare-fun mapIsEmpty!24400 () Bool)

(assert (=> mapIsEmpty!24400 mapRes!24400))

(declare-fun b!829036 () Bool)

(assert (=> b!829036 (= e!462056 (and e!462057 mapRes!24400))))

(declare-fun condMapEmpty!24400 () Bool)

(declare-fun mapDefault!24400 () ValueCell!7171)

