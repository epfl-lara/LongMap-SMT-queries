; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70798 () Bool)

(assert start!70798)

(declare-fun b_free!13055 () Bool)

(declare-fun b_next!13055 () Bool)

(assert (=> start!70798 (= b_free!13055 (not b_next!13055))))

(declare-fun tp!45910 () Bool)

(declare-fun b_and!21927 () Bool)

(assert (=> start!70798 (= tp!45910 b_and!21927)))

(declare-fun b!822334 () Bool)

(declare-fun res!560885 () Bool)

(declare-fun e!457184 () Bool)

(assert (=> b!822334 (=> (not res!560885) (not e!457184))))

(declare-datatypes ((array!45722 0))(
  ( (array!45723 (arr!21911 (Array (_ BitVec 32) (_ BitVec 64))) (size!22332 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45722)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45722 (_ BitVec 32)) Bool)

(assert (=> b!822334 (= res!560885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822335 () Bool)

(declare-fun res!560889 () Bool)

(assert (=> b!822335 (=> (not res!560889) (not e!457184))))

(declare-datatypes ((List!15626 0))(
  ( (Nil!15623) (Cons!15622 (h!16751 (_ BitVec 64)) (t!21963 List!15626)) )
))
(declare-fun arrayNoDuplicates!0 (array!45722 (_ BitVec 32) List!15626) Bool)

(assert (=> b!822335 (= res!560889 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15623))))

(declare-fun b!822336 () Bool)

(declare-fun e!457181 () Bool)

(declare-fun tp_is_empty!14765 () Bool)

(assert (=> b!822336 (= e!457181 tp_is_empty!14765)))

(declare-fun b!822337 () Bool)

(declare-fun e!457180 () Bool)

(assert (=> b!822337 (= e!457180 true)))

(declare-datatypes ((V!24687 0))(
  ( (V!24688 (val!7430 Int)) )
))
(declare-datatypes ((tuple2!9810 0))(
  ( (tuple2!9811 (_1!4916 (_ BitVec 64)) (_2!4916 V!24687)) )
))
(declare-datatypes ((List!15627 0))(
  ( (Nil!15624) (Cons!15623 (h!16752 tuple2!9810) (t!21964 List!15627)) )
))
(declare-datatypes ((ListLongMap!8633 0))(
  ( (ListLongMap!8634 (toList!4332 List!15627)) )
))
(declare-fun lt!369984 () ListLongMap!8633)

(declare-fun lt!369978 () ListLongMap!8633)

(declare-fun lt!369985 () tuple2!9810)

(declare-fun +!1883 (ListLongMap!8633 tuple2!9810) ListLongMap!8633)

(assert (=> b!822337 (= lt!369984 (+!1883 lt!369978 lt!369985))))

(declare-fun zeroValueAfter!34 () V!24687)

(declare-datatypes ((Unit!28128 0))(
  ( (Unit!28129) )
))
(declare-fun lt!369987 () Unit!28128)

(declare-fun minValue!754 () V!24687)

(declare-fun lt!369983 () ListLongMap!8633)

(declare-fun addCommutativeForDiffKeys!446 (ListLongMap!8633 (_ BitVec 64) V!24687 (_ BitVec 64) V!24687) Unit!28128)

(assert (=> b!822337 (= lt!369987 (addCommutativeForDiffKeys!446 lt!369983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369981 () ListLongMap!8633)

(assert (=> b!822337 (= lt!369981 lt!369984)))

(declare-fun lt!369979 () tuple2!9810)

(assert (=> b!822337 (= lt!369984 (+!1883 (+!1883 lt!369983 lt!369985) lt!369979))))

(assert (=> b!822337 (= lt!369985 (tuple2!9811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369986 () ListLongMap!8633)

(assert (=> b!822337 (= lt!369986 lt!369978)))

(assert (=> b!822337 (= lt!369978 (+!1883 lt!369983 lt!369979))))

(assert (=> b!822337 (= lt!369979 (tuple2!9811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((ValueCell!6967 0))(
  ( (ValueCellFull!6967 (v!9861 V!24687)) (EmptyCell!6967) )
))
(declare-datatypes ((array!45724 0))(
  ( (array!45725 (arr!21912 (Array (_ BitVec 32) ValueCell!6967)) (size!22333 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45724)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2497 (array!45722 array!45724 (_ BitVec 32) (_ BitVec 32) V!24687 V!24687 (_ BitVec 32) Int) ListLongMap!8633)

(assert (=> b!822337 (= lt!369981 (getCurrentListMap!2497 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24687)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822337 (= lt!369986 (getCurrentListMap!2497 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822338 () Bool)

(assert (=> b!822338 (= e!457184 (not e!457180))))

(declare-fun res!560887 () Bool)

(assert (=> b!822338 (=> res!560887 e!457180)))

(assert (=> b!822338 (= res!560887 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369980 () ListLongMap!8633)

(assert (=> b!822338 (= lt!369983 lt!369980)))

(declare-fun lt!369982 () Unit!28128)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!461 (array!45722 array!45724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24687 V!24687 V!24687 V!24687 (_ BitVec 32) Int) Unit!28128)

(assert (=> b!822338 (= lt!369982 (lemmaNoChangeToArrayThenSameMapNoExtras!461 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2351 (array!45722 array!45724 (_ BitVec 32) (_ BitVec 32) V!24687 V!24687 (_ BitVec 32) Int) ListLongMap!8633)

(assert (=> b!822338 (= lt!369980 (getCurrentListMapNoExtraKeys!2351 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822338 (= lt!369983 (getCurrentListMapNoExtraKeys!2351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23758 () Bool)

(declare-fun mapRes!23758 () Bool)

(assert (=> mapIsEmpty!23758 mapRes!23758))

(declare-fun b!822339 () Bool)

(declare-fun res!560888 () Bool)

(assert (=> b!822339 (=> (not res!560888) (not e!457184))))

(assert (=> b!822339 (= res!560888 (and (= (size!22333 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22332 _keys!976) (size!22333 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822340 () Bool)

(declare-fun e!457182 () Bool)

(assert (=> b!822340 (= e!457182 tp_is_empty!14765)))

(declare-fun b!822341 () Bool)

(declare-fun e!457183 () Bool)

(assert (=> b!822341 (= e!457183 (and e!457182 mapRes!23758))))

(declare-fun condMapEmpty!23758 () Bool)

(declare-fun mapDefault!23758 () ValueCell!6967)

