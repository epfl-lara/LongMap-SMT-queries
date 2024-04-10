; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70878 () Bool)

(assert start!70878)

(declare-fun b_free!13115 () Bool)

(declare-fun b_next!13115 () Bool)

(assert (=> start!70878 (= b_free!13115 (not b_next!13115))))

(declare-fun tp!46092 () Bool)

(declare-fun b_and!21999 () Bool)

(assert (=> start!70878 (= tp!46092 b_and!21999)))

(declare-fun b!823235 () Bool)

(declare-fun e!457836 () Bool)

(assert (=> b!823235 (= e!457836 true)))

(declare-datatypes ((V!24767 0))(
  ( (V!24768 (val!7460 Int)) )
))
(declare-datatypes ((tuple2!9864 0))(
  ( (tuple2!9865 (_1!4943 (_ BitVec 64)) (_2!4943 V!24767)) )
))
(declare-datatypes ((List!15677 0))(
  ( (Nil!15674) (Cons!15673 (h!16802 tuple2!9864) (t!22016 List!15677)) )
))
(declare-datatypes ((ListLongMap!8687 0))(
  ( (ListLongMap!8688 (toList!4359 List!15677)) )
))
(declare-fun lt!371040 () ListLongMap!8687)

(declare-fun lt!371035 () ListLongMap!8687)

(declare-fun lt!371036 () tuple2!9864)

(declare-fun +!1908 (ListLongMap!8687 tuple2!9864) ListLongMap!8687)

(assert (=> b!823235 (= lt!371040 (+!1908 lt!371035 lt!371036))))

(declare-datatypes ((Unit!28184 0))(
  ( (Unit!28185) )
))
(declare-fun lt!371038 () Unit!28184)

(declare-fun zeroValueAfter!34 () V!24767)

(declare-fun lt!371037 () ListLongMap!8687)

(declare-fun minValue!754 () V!24767)

(declare-fun addCommutativeForDiffKeys!471 (ListLongMap!8687 (_ BitVec 64) V!24767 (_ BitVec 64) V!24767) Unit!28184)

(assert (=> b!823235 (= lt!371038 (addCommutativeForDiffKeys!471 lt!371037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371033 () ListLongMap!8687)

(assert (=> b!823235 (= lt!371033 lt!371040)))

(declare-fun lt!371041 () tuple2!9864)

(assert (=> b!823235 (= lt!371040 (+!1908 (+!1908 lt!371037 lt!371036) lt!371041))))

(assert (=> b!823235 (= lt!371036 (tuple2!9865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371034 () ListLongMap!8687)

(assert (=> b!823235 (= lt!371034 lt!371035)))

(assert (=> b!823235 (= lt!371035 (+!1908 lt!371037 lt!371041))))

(assert (=> b!823235 (= lt!371041 (tuple2!9865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45842 0))(
  ( (array!45843 (arr!21970 (Array (_ BitVec 32) (_ BitVec 64))) (size!22391 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45842)

(declare-datatypes ((ValueCell!6997 0))(
  ( (ValueCellFull!6997 (v!9892 V!24767)) (EmptyCell!6997) )
))
(declare-datatypes ((array!45844 0))(
  ( (array!45845 (arr!21971 (Array (_ BitVec 32) ValueCell!6997)) (size!22392 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45844)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2522 (array!45842 array!45844 (_ BitVec 32) (_ BitVec 32) V!24767 V!24767 (_ BitVec 32) Int) ListLongMap!8687)

(assert (=> b!823235 (= lt!371033 (getCurrentListMap!2522 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24767)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823235 (= lt!371034 (getCurrentListMap!2522 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823236 () Bool)

(declare-fun e!457833 () Bool)

(assert (=> b!823236 (= e!457833 (not e!457836))))

(declare-fun res!561416 () Bool)

(assert (=> b!823236 (=> res!561416 e!457836)))

(assert (=> b!823236 (= res!561416 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371039 () ListLongMap!8687)

(assert (=> b!823236 (= lt!371037 lt!371039)))

(declare-fun lt!371042 () Unit!28184)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!484 (array!45842 array!45844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24767 V!24767 V!24767 V!24767 (_ BitVec 32) Int) Unit!28184)

(assert (=> b!823236 (= lt!371042 (lemmaNoChangeToArrayThenSameMapNoExtras!484 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2374 (array!45842 array!45844 (_ BitVec 32) (_ BitVec 32) V!24767 V!24767 (_ BitVec 32) Int) ListLongMap!8687)

(assert (=> b!823236 (= lt!371039 (getCurrentListMapNoExtraKeys!2374 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823236 (= lt!371037 (getCurrentListMapNoExtraKeys!2374 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561417 () Bool)

(assert (=> start!70878 (=> (not res!561417) (not e!457833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70878 (= res!561417 (validMask!0 mask!1312))))

(assert (=> start!70878 e!457833))

(declare-fun tp_is_empty!14825 () Bool)

(assert (=> start!70878 tp_is_empty!14825))

(declare-fun array_inv!17545 (array!45842) Bool)

(assert (=> start!70878 (array_inv!17545 _keys!976)))

(assert (=> start!70878 true))

(declare-fun e!457838 () Bool)

(declare-fun array_inv!17546 (array!45844) Bool)

(assert (=> start!70878 (and (array_inv!17546 _values!788) e!457838)))

(assert (=> start!70878 tp!46092))

(declare-fun b!823237 () Bool)

(declare-fun res!561418 () Bool)

(assert (=> b!823237 (=> (not res!561418) (not e!457833))))

(assert (=> b!823237 (= res!561418 (and (= (size!22392 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22391 _keys!976) (size!22392 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23851 () Bool)

(declare-fun mapRes!23851 () Bool)

(assert (=> mapIsEmpty!23851 mapRes!23851))

(declare-fun b!823238 () Bool)

(declare-fun e!457835 () Bool)

(assert (=> b!823238 (= e!457835 tp_is_empty!14825)))

(declare-fun mapNonEmpty!23851 () Bool)

(declare-fun tp!46093 () Bool)

(declare-fun e!457834 () Bool)

(assert (=> mapNonEmpty!23851 (= mapRes!23851 (and tp!46093 e!457834))))

(declare-fun mapKey!23851 () (_ BitVec 32))

(declare-fun mapRest!23851 () (Array (_ BitVec 32) ValueCell!6997))

(declare-fun mapValue!23851 () ValueCell!6997)

(assert (=> mapNonEmpty!23851 (= (arr!21971 _values!788) (store mapRest!23851 mapKey!23851 mapValue!23851))))

(declare-fun b!823239 () Bool)

(assert (=> b!823239 (= e!457834 tp_is_empty!14825)))

(declare-fun b!823240 () Bool)

(declare-fun res!561414 () Bool)

(assert (=> b!823240 (=> (not res!561414) (not e!457833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45842 (_ BitVec 32)) Bool)

(assert (=> b!823240 (= res!561414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823241 () Bool)

(declare-fun res!561415 () Bool)

(assert (=> b!823241 (=> (not res!561415) (not e!457833))))

(declare-datatypes ((List!15678 0))(
  ( (Nil!15675) (Cons!15674 (h!16803 (_ BitVec 64)) (t!22017 List!15678)) )
))
(declare-fun arrayNoDuplicates!0 (array!45842 (_ BitVec 32) List!15678) Bool)

(assert (=> b!823241 (= res!561415 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15675))))

(declare-fun b!823242 () Bool)

(assert (=> b!823242 (= e!457838 (and e!457835 mapRes!23851))))

(declare-fun condMapEmpty!23851 () Bool)

(declare-fun mapDefault!23851 () ValueCell!6997)

