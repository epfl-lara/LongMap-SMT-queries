; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70884 () Bool)

(assert start!70884)

(declare-fun b_free!13121 () Bool)

(declare-fun b_next!13121 () Bool)

(assert (=> start!70884 (= b_free!13121 (not b_next!13121))))

(declare-fun tp!46111 () Bool)

(declare-fun b_and!22005 () Bool)

(assert (=> start!70884 (= tp!46111 b_and!22005)))

(declare-fun b!823307 () Bool)

(declare-fun res!561459 () Bool)

(declare-fun e!457887 () Bool)

(assert (=> b!823307 (=> (not res!561459) (not e!457887))))

(declare-datatypes ((array!45854 0))(
  ( (array!45855 (arr!21976 (Array (_ BitVec 32) (_ BitVec 64))) (size!22397 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45854)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24775 0))(
  ( (V!24776 (val!7463 Int)) )
))
(declare-datatypes ((ValueCell!7000 0))(
  ( (ValueCellFull!7000 (v!9895 V!24775)) (EmptyCell!7000) )
))
(declare-datatypes ((array!45856 0))(
  ( (array!45857 (arr!21977 (Array (_ BitVec 32) ValueCell!7000)) (size!22398 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45856)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823307 (= res!561459 (and (= (size!22398 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22397 _keys!976) (size!22398 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23860 () Bool)

(declare-fun mapRes!23860 () Bool)

(assert (=> mapIsEmpty!23860 mapRes!23860))

(declare-fun b!823308 () Bool)

(declare-fun e!457889 () Bool)

(assert (=> b!823308 (= e!457887 (not e!457889))))

(declare-fun res!561462 () Bool)

(assert (=> b!823308 (=> res!561462 e!457889)))

(assert (=> b!823308 (= res!561462 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9870 0))(
  ( (tuple2!9871 (_1!4946 (_ BitVec 64)) (_2!4946 V!24775)) )
))
(declare-datatypes ((List!15682 0))(
  ( (Nil!15679) (Cons!15678 (h!16807 tuple2!9870) (t!22021 List!15682)) )
))
(declare-datatypes ((ListLongMap!8693 0))(
  ( (ListLongMap!8694 (toList!4362 List!15682)) )
))
(declare-fun lt!371131 () ListLongMap!8693)

(declare-fun lt!371130 () ListLongMap!8693)

(assert (=> b!823308 (= lt!371131 lt!371130)))

(declare-fun zeroValueBefore!34 () V!24775)

(declare-fun zeroValueAfter!34 () V!24775)

(declare-fun minValue!754 () V!24775)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28190 0))(
  ( (Unit!28191) )
))
(declare-fun lt!371125 () Unit!28190)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!487 (array!45854 array!45856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24775 V!24775 V!24775 V!24775 (_ BitVec 32) Int) Unit!28190)

(assert (=> b!823308 (= lt!371125 (lemmaNoChangeToArrayThenSameMapNoExtras!487 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2377 (array!45854 array!45856 (_ BitVec 32) (_ BitVec 32) V!24775 V!24775 (_ BitVec 32) Int) ListLongMap!8693)

(assert (=> b!823308 (= lt!371130 (getCurrentListMapNoExtraKeys!2377 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823308 (= lt!371131 (getCurrentListMapNoExtraKeys!2377 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823309 () Bool)

(declare-fun e!457892 () Bool)

(declare-fun tp_is_empty!14831 () Bool)

(assert (=> b!823309 (= e!457892 tp_is_empty!14831)))

(declare-fun b!823310 () Bool)

(declare-fun e!457891 () Bool)

(assert (=> b!823310 (= e!457891 tp_is_empty!14831)))

(declare-fun b!823311 () Bool)

(assert (=> b!823311 (= e!457889 true)))

(declare-fun lt!371126 () ListLongMap!8693)

(declare-fun lt!371129 () ListLongMap!8693)

(declare-fun lt!371132 () tuple2!9870)

(declare-fun +!1911 (ListLongMap!8693 tuple2!9870) ListLongMap!8693)

(assert (=> b!823311 (= lt!371126 (+!1911 lt!371129 lt!371132))))

(declare-fun lt!371124 () Unit!28190)

(declare-fun addCommutativeForDiffKeys!474 (ListLongMap!8693 (_ BitVec 64) V!24775 (_ BitVec 64) V!24775) Unit!28190)

(assert (=> b!823311 (= lt!371124 (addCommutativeForDiffKeys!474 lt!371131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371123 () ListLongMap!8693)

(assert (=> b!823311 (= lt!371123 lt!371126)))

(declare-fun lt!371127 () tuple2!9870)

(assert (=> b!823311 (= lt!371126 (+!1911 (+!1911 lt!371131 lt!371132) lt!371127))))

(assert (=> b!823311 (= lt!371132 (tuple2!9871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371128 () ListLongMap!8693)

(assert (=> b!823311 (= lt!371128 lt!371129)))

(assert (=> b!823311 (= lt!371129 (+!1911 lt!371131 lt!371127))))

(assert (=> b!823311 (= lt!371127 (tuple2!9871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2525 (array!45854 array!45856 (_ BitVec 32) (_ BitVec 32) V!24775 V!24775 (_ BitVec 32) Int) ListLongMap!8693)

(assert (=> b!823311 (= lt!371123 (getCurrentListMap!2525 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823311 (= lt!371128 (getCurrentListMap!2525 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823312 () Bool)

(declare-fun res!561461 () Bool)

(assert (=> b!823312 (=> (not res!561461) (not e!457887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45854 (_ BitVec 32)) Bool)

(assert (=> b!823312 (= res!561461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823313 () Bool)

(declare-fun res!561463 () Bool)

(assert (=> b!823313 (=> (not res!561463) (not e!457887))))

(declare-datatypes ((List!15683 0))(
  ( (Nil!15680) (Cons!15679 (h!16808 (_ BitVec 64)) (t!22022 List!15683)) )
))
(declare-fun arrayNoDuplicates!0 (array!45854 (_ BitVec 32) List!15683) Bool)

(assert (=> b!823313 (= res!561463 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15680))))

(declare-fun b!823314 () Bool)

(declare-fun e!457890 () Bool)

(assert (=> b!823314 (= e!457890 (and e!457891 mapRes!23860))))

(declare-fun condMapEmpty!23860 () Bool)

(declare-fun mapDefault!23860 () ValueCell!7000)

