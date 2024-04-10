; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70108 () Bool)

(assert start!70108)

(declare-fun b_free!12529 () Bool)

(declare-fun b_next!12529 () Bool)

(assert (=> start!70108 (= b_free!12529 (not b_next!12529))))

(declare-fun tp!44301 () Bool)

(declare-fun b_and!21301 () Bool)

(assert (=> start!70108 (= tp!44301 b_and!21301)))

(declare-fun b!814709 () Bool)

(declare-fun e!451649 () Bool)

(declare-fun tp_is_empty!14239 () Bool)

(assert (=> b!814709 (= e!451649 tp_is_empty!14239)))

(declare-fun mapNonEmpty!22939 () Bool)

(declare-fun mapRes!22939 () Bool)

(declare-fun tp!44302 () Bool)

(declare-fun e!451652 () Bool)

(assert (=> mapNonEmpty!22939 (= mapRes!22939 (and tp!44302 e!451652))))

(declare-fun mapKey!22939 () (_ BitVec 32))

(declare-datatypes ((V!23987 0))(
  ( (V!23988 (val!7167 Int)) )
))
(declare-datatypes ((ValueCell!6704 0))(
  ( (ValueCellFull!6704 (v!9594 V!23987)) (EmptyCell!6704) )
))
(declare-datatypes ((array!44680 0))(
  ( (array!44681 (arr!21400 (Array (_ BitVec 32) ValueCell!6704)) (size!21821 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44680)

(declare-fun mapValue!22939 () ValueCell!6704)

(declare-fun mapRest!22939 () (Array (_ BitVec 32) ValueCell!6704))

(assert (=> mapNonEmpty!22939 (= (arr!21400 _values!788) (store mapRest!22939 mapKey!22939 mapValue!22939))))

(declare-fun b!814710 () Bool)

(declare-fun e!451653 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((array!44682 0))(
  ( (array!44683 (arr!21401 (Array (_ BitVec 32) (_ BitVec 64))) (size!21822 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44682)

(assert (=> b!814710 (= e!451653 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21822 _keys!976)))))))

(declare-datatypes ((tuple2!9394 0))(
  ( (tuple2!9395 (_1!4708 (_ BitVec 64)) (_2!4708 V!23987)) )
))
(declare-datatypes ((List!15226 0))(
  ( (Nil!15223) (Cons!15222 (h!16351 tuple2!9394) (t!21543 List!15226)) )
))
(declare-datatypes ((ListLongMap!8217 0))(
  ( (ListLongMap!8218 (toList!4124 List!15226)) )
))
(declare-fun lt!364733 () ListLongMap!8217)

(declare-fun lt!364734 () ListLongMap!8217)

(assert (=> b!814710 (= lt!364733 lt!364734)))

(declare-fun zeroValueBefore!34 () V!23987)

(declare-fun zeroValueAfter!34 () V!23987)

(declare-fun minValue!754 () V!23987)

(declare-datatypes ((Unit!27746 0))(
  ( (Unit!27747) )
))
(declare-fun lt!364732 () Unit!27746)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!284 (array!44682 array!44680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 V!23987 V!23987 (_ BitVec 32) Int) Unit!27746)

(assert (=> b!814710 (= lt!364732 (lemmaNoChangeToArrayThenSameMapNoExtras!284 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2174 (array!44682 array!44680 (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 (_ BitVec 32) Int) ListLongMap!8217)

(assert (=> b!814710 (= lt!364734 (getCurrentListMapNoExtraKeys!2174 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814710 (= lt!364733 (getCurrentListMapNoExtraKeys!2174 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22939 () Bool)

(assert (=> mapIsEmpty!22939 mapRes!22939))

(declare-fun b!814711 () Bool)

(declare-fun res!556432 () Bool)

(assert (=> b!814711 (=> (not res!556432) (not e!451653))))

(declare-datatypes ((List!15227 0))(
  ( (Nil!15224) (Cons!15223 (h!16352 (_ BitVec 64)) (t!21544 List!15227)) )
))
(declare-fun arrayNoDuplicates!0 (array!44682 (_ BitVec 32) List!15227) Bool)

(assert (=> b!814711 (= res!556432 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15224))))

(declare-fun b!814712 () Bool)

(declare-fun e!451650 () Bool)

(assert (=> b!814712 (= e!451650 (and e!451649 mapRes!22939))))

(declare-fun condMapEmpty!22939 () Bool)

(declare-fun mapDefault!22939 () ValueCell!6704)

