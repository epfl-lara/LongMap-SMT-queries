; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70024 () Bool)

(assert start!70024)

(declare-fun b_free!12445 () Bool)

(declare-fun b_next!12445 () Bool)

(assert (=> start!70024 (= b_free!12445 (not b_next!12445))))

(declare-fun tp!44049 () Bool)

(declare-fun b_and!21217 () Bool)

(assert (=> start!70024 (= tp!44049 b_and!21217)))

(declare-fun b!813827 () Bool)

(declare-fun res!555928 () Bool)

(declare-fun e!451019 () Bool)

(assert (=> b!813827 (=> (not res!555928) (not e!451019))))

(declare-datatypes ((array!44518 0))(
  ( (array!44519 (arr!21319 (Array (_ BitVec 32) (_ BitVec 64))) (size!21740 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44518)

(declare-datatypes ((List!15166 0))(
  ( (Nil!15163) (Cons!15162 (h!16291 (_ BitVec 64)) (t!21483 List!15166)) )
))
(declare-fun arrayNoDuplicates!0 (array!44518 (_ BitVec 32) List!15166) Bool)

(assert (=> b!813827 (= res!555928 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15163))))

(declare-fun b!813828 () Bool)

(assert (=> b!813828 (= e!451019 false)))

(declare-datatypes ((V!23875 0))(
  ( (V!23876 (val!7125 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23875)

(declare-datatypes ((ValueCell!6662 0))(
  ( (ValueCellFull!6662 (v!9552 V!23875)) (EmptyCell!6662) )
))
(declare-datatypes ((array!44520 0))(
  ( (array!44521 (arr!21320 (Array (_ BitVec 32) ValueCell!6662)) (size!21741 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44520)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!23875)

(declare-datatypes ((tuple2!9332 0))(
  ( (tuple2!9333 (_1!4677 (_ BitVec 64)) (_2!4677 V!23875)) )
))
(declare-datatypes ((List!15167 0))(
  ( (Nil!15164) (Cons!15163 (h!16292 tuple2!9332) (t!21484 List!15167)) )
))
(declare-datatypes ((ListLongMap!8155 0))(
  ( (ListLongMap!8156 (toList!4093 List!15167)) )
))
(declare-fun lt!364406 () ListLongMap!8155)

(declare-fun getCurrentListMapNoExtraKeys!2143 (array!44518 array!44520 (_ BitVec 32) (_ BitVec 32) V!23875 V!23875 (_ BitVec 32) Int) ListLongMap!8155)

(assert (=> b!813828 (= lt!364406 (getCurrentListMapNoExtraKeys!2143 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23875)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364407 () ListLongMap!8155)

(assert (=> b!813828 (= lt!364407 (getCurrentListMapNoExtraKeys!2143 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813829 () Bool)

(declare-fun res!555930 () Bool)

(assert (=> b!813829 (=> (not res!555930) (not e!451019))))

(assert (=> b!813829 (= res!555930 (and (= (size!21741 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21740 _keys!976) (size!21741 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813830 () Bool)

(declare-fun e!451023 () Bool)

(declare-fun tp_is_empty!14155 () Bool)

(assert (=> b!813830 (= e!451023 tp_is_empty!14155)))

(declare-fun mapIsEmpty!22813 () Bool)

(declare-fun mapRes!22813 () Bool)

(assert (=> mapIsEmpty!22813 mapRes!22813))

(declare-fun b!813831 () Bool)

(declare-fun res!555927 () Bool)

(assert (=> b!813831 (=> (not res!555927) (not e!451019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44518 (_ BitVec 32)) Bool)

(assert (=> b!813831 (= res!555927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555929 () Bool)

(assert (=> start!70024 (=> (not res!555929) (not e!451019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70024 (= res!555929 (validMask!0 mask!1312))))

(assert (=> start!70024 e!451019))

(assert (=> start!70024 tp_is_empty!14155))

(declare-fun array_inv!17071 (array!44518) Bool)

(assert (=> start!70024 (array_inv!17071 _keys!976)))

(assert (=> start!70024 true))

(declare-fun e!451021 () Bool)

(declare-fun array_inv!17072 (array!44520) Bool)

(assert (=> start!70024 (and (array_inv!17072 _values!788) e!451021)))

(assert (=> start!70024 tp!44049))

(declare-fun mapNonEmpty!22813 () Bool)

(declare-fun tp!44050 () Bool)

(assert (=> mapNonEmpty!22813 (= mapRes!22813 (and tp!44050 e!451023))))

(declare-fun mapRest!22813 () (Array (_ BitVec 32) ValueCell!6662))

(declare-fun mapKey!22813 () (_ BitVec 32))

(declare-fun mapValue!22813 () ValueCell!6662)

(assert (=> mapNonEmpty!22813 (= (arr!21320 _values!788) (store mapRest!22813 mapKey!22813 mapValue!22813))))

(declare-fun b!813832 () Bool)

(declare-fun e!451022 () Bool)

(assert (=> b!813832 (= e!451021 (and e!451022 mapRes!22813))))

(declare-fun condMapEmpty!22813 () Bool)

(declare-fun mapDefault!22813 () ValueCell!6662)

