; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70022 () Bool)

(assert start!70022)

(declare-fun b_free!12443 () Bool)

(declare-fun b_next!12443 () Bool)

(assert (=> start!70022 (= b_free!12443 (not b_next!12443))))

(declare-fun tp!44044 () Bool)

(declare-fun b_and!21215 () Bool)

(assert (=> start!70022 (= tp!44044 b_and!21215)))

(declare-fun b!813806 () Bool)

(declare-fun e!451008 () Bool)

(declare-fun tp_is_empty!14153 () Bool)

(assert (=> b!813806 (= e!451008 tp_is_empty!14153)))

(declare-fun b!813807 () Bool)

(declare-fun res!555915 () Bool)

(declare-fun e!451006 () Bool)

(assert (=> b!813807 (=> (not res!555915) (not e!451006))))

(declare-datatypes ((array!44514 0))(
  ( (array!44515 (arr!21317 (Array (_ BitVec 32) (_ BitVec 64))) (size!21738 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44514)

(declare-datatypes ((List!15164 0))(
  ( (Nil!15161) (Cons!15160 (h!16289 (_ BitVec 64)) (t!21481 List!15164)) )
))
(declare-fun arrayNoDuplicates!0 (array!44514 (_ BitVec 32) List!15164) Bool)

(assert (=> b!813807 (= res!555915 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15161))))

(declare-fun b!813808 () Bool)

(declare-fun e!451005 () Bool)

(assert (=> b!813808 (= e!451005 tp_is_empty!14153)))

(declare-fun res!555918 () Bool)

(assert (=> start!70022 (=> (not res!555918) (not e!451006))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70022 (= res!555918 (validMask!0 mask!1312))))

(assert (=> start!70022 e!451006))

(assert (=> start!70022 tp_is_empty!14153))

(declare-fun array_inv!17069 (array!44514) Bool)

(assert (=> start!70022 (array_inv!17069 _keys!976)))

(assert (=> start!70022 true))

(declare-datatypes ((V!23871 0))(
  ( (V!23872 (val!7124 Int)) )
))
(declare-datatypes ((ValueCell!6661 0))(
  ( (ValueCellFull!6661 (v!9551 V!23871)) (EmptyCell!6661) )
))
(declare-datatypes ((array!44516 0))(
  ( (array!44517 (arr!21318 (Array (_ BitVec 32) ValueCell!6661)) (size!21739 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44516)

(declare-fun e!451007 () Bool)

(declare-fun array_inv!17070 (array!44516) Bool)

(assert (=> start!70022 (and (array_inv!17070 _values!788) e!451007)))

(assert (=> start!70022 tp!44044))

(declare-fun mapIsEmpty!22810 () Bool)

(declare-fun mapRes!22810 () Bool)

(assert (=> mapIsEmpty!22810 mapRes!22810))

(declare-fun b!813809 () Bool)

(declare-fun res!555916 () Bool)

(assert (=> b!813809 (=> (not res!555916) (not e!451006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44514 (_ BitVec 32)) Bool)

(assert (=> b!813809 (= res!555916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813810 () Bool)

(assert (=> b!813810 (= e!451006 false)))

(declare-datatypes ((tuple2!9330 0))(
  ( (tuple2!9331 (_1!4676 (_ BitVec 64)) (_2!4676 V!23871)) )
))
(declare-datatypes ((List!15165 0))(
  ( (Nil!15162) (Cons!15161 (h!16290 tuple2!9330) (t!21482 List!15165)) )
))
(declare-datatypes ((ListLongMap!8153 0))(
  ( (ListLongMap!8154 (toList!4092 List!15165)) )
))
(declare-fun lt!364400 () ListLongMap!8153)

(declare-fun zeroValueAfter!34 () V!23871)

(declare-fun minValue!754 () V!23871)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2142 (array!44514 array!44516 (_ BitVec 32) (_ BitVec 32) V!23871 V!23871 (_ BitVec 32) Int) ListLongMap!8153)

(assert (=> b!813810 (= lt!364400 (getCurrentListMapNoExtraKeys!2142 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23871)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364401 () ListLongMap!8153)

(assert (=> b!813810 (= lt!364401 (getCurrentListMapNoExtraKeys!2142 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813811 () Bool)

(declare-fun res!555917 () Bool)

(assert (=> b!813811 (=> (not res!555917) (not e!451006))))

(assert (=> b!813811 (= res!555917 (and (= (size!21739 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21738 _keys!976) (size!21739 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22810 () Bool)

(declare-fun tp!44043 () Bool)

(assert (=> mapNonEmpty!22810 (= mapRes!22810 (and tp!44043 e!451005))))

(declare-fun mapKey!22810 () (_ BitVec 32))

(declare-fun mapRest!22810 () (Array (_ BitVec 32) ValueCell!6661))

(declare-fun mapValue!22810 () ValueCell!6661)

(assert (=> mapNonEmpty!22810 (= (arr!21318 _values!788) (store mapRest!22810 mapKey!22810 mapValue!22810))))

(declare-fun b!813812 () Bool)

(assert (=> b!813812 (= e!451007 (and e!451008 mapRes!22810))))

(declare-fun condMapEmpty!22810 () Bool)

(declare-fun mapDefault!22810 () ValueCell!6661)

