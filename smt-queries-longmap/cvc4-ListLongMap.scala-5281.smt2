; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70860 () Bool)

(assert start!70860)

(declare-fun b_free!13097 () Bool)

(declare-fun b_next!13097 () Bool)

(assert (=> start!70860 (= b_free!13097 (not b_next!13097))))

(declare-fun tp!46039 () Bool)

(declare-fun b_and!21981 () Bool)

(assert (=> start!70860 (= tp!46039 b_and!21981)))

(declare-fun b!823019 () Bool)

(declare-fun e!457676 () Bool)

(declare-fun e!457673 () Bool)

(assert (=> b!823019 (= e!457676 (not e!457673))))

(declare-fun res!561280 () Bool)

(assert (=> b!823019 (=> res!561280 e!457673)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823019 (= res!561280 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24743 0))(
  ( (V!24744 (val!7451 Int)) )
))
(declare-datatypes ((tuple2!9848 0))(
  ( (tuple2!9849 (_1!4935 (_ BitVec 64)) (_2!4935 V!24743)) )
))
(declare-datatypes ((List!15661 0))(
  ( (Nil!15658) (Cons!15657 (h!16786 tuple2!9848) (t!22000 List!15661)) )
))
(declare-datatypes ((ListLongMap!8671 0))(
  ( (ListLongMap!8672 (toList!4351 List!15661)) )
))
(declare-fun lt!370771 () ListLongMap!8671)

(declare-fun lt!370764 () ListLongMap!8671)

(assert (=> b!823019 (= lt!370771 lt!370764)))

(declare-fun zeroValueBefore!34 () V!24743)

(declare-datatypes ((array!45808 0))(
  ( (array!45809 (arr!21953 (Array (_ BitVec 32) (_ BitVec 64))) (size!22374 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45808)

(declare-fun zeroValueAfter!34 () V!24743)

(declare-fun minValue!754 () V!24743)

(declare-datatypes ((ValueCell!6988 0))(
  ( (ValueCellFull!6988 (v!9883 V!24743)) (EmptyCell!6988) )
))
(declare-datatypes ((array!45810 0))(
  ( (array!45811 (arr!21954 (Array (_ BitVec 32) ValueCell!6988)) (size!22375 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45810)

(declare-datatypes ((Unit!28168 0))(
  ( (Unit!28169) )
))
(declare-fun lt!370766 () Unit!28168)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!478 (array!45808 array!45810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24743 V!24743 V!24743 V!24743 (_ BitVec 32) Int) Unit!28168)

(assert (=> b!823019 (= lt!370766 (lemmaNoChangeToArrayThenSameMapNoExtras!478 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2368 (array!45808 array!45810 (_ BitVec 32) (_ BitVec 32) V!24743 V!24743 (_ BitVec 32) Int) ListLongMap!8671)

(assert (=> b!823019 (= lt!370764 (getCurrentListMapNoExtraKeys!2368 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823019 (= lt!370771 (getCurrentListMapNoExtraKeys!2368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823020 () Bool)

(declare-fun res!561282 () Bool)

(assert (=> b!823020 (=> (not res!561282) (not e!457676))))

(declare-datatypes ((List!15662 0))(
  ( (Nil!15659) (Cons!15658 (h!16787 (_ BitVec 64)) (t!22001 List!15662)) )
))
(declare-fun arrayNoDuplicates!0 (array!45808 (_ BitVec 32) List!15662) Bool)

(assert (=> b!823020 (= res!561282 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15659))))

(declare-fun b!823021 () Bool)

(declare-fun e!457675 () Bool)

(declare-fun tp_is_empty!14807 () Bool)

(assert (=> b!823021 (= e!457675 tp_is_empty!14807)))

(declare-fun b!823022 () Bool)

(declare-fun res!561281 () Bool)

(assert (=> b!823022 (=> (not res!561281) (not e!457676))))

(assert (=> b!823022 (= res!561281 (and (= (size!22375 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22374 _keys!976) (size!22375 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823023 () Bool)

(declare-fun e!457672 () Bool)

(assert (=> b!823023 (= e!457672 tp_is_empty!14807)))

(declare-fun b!823024 () Bool)

(declare-fun res!561279 () Bool)

(assert (=> b!823024 (=> (not res!561279) (not e!457676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45808 (_ BitVec 32)) Bool)

(assert (=> b!823024 (= res!561279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823025 () Bool)

(assert (=> b!823025 (= e!457673 true)))

(declare-fun lt!370763 () ListLongMap!8671)

(declare-fun lt!370770 () ListLongMap!8671)

(declare-fun lt!370769 () tuple2!9848)

(declare-fun +!1900 (ListLongMap!8671 tuple2!9848) ListLongMap!8671)

(assert (=> b!823025 (= lt!370763 (+!1900 lt!370770 lt!370769))))

(declare-fun lt!370768 () Unit!28168)

(declare-fun addCommutativeForDiffKeys!463 (ListLongMap!8671 (_ BitVec 64) V!24743 (_ BitVec 64) V!24743) Unit!28168)

(assert (=> b!823025 (= lt!370768 (addCommutativeForDiffKeys!463 lt!370771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370772 () ListLongMap!8671)

(assert (=> b!823025 (= lt!370772 lt!370763)))

(declare-fun lt!370765 () tuple2!9848)

(assert (=> b!823025 (= lt!370763 (+!1900 (+!1900 lt!370771 lt!370769) lt!370765))))

(assert (=> b!823025 (= lt!370769 (tuple2!9849 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370767 () ListLongMap!8671)

(assert (=> b!823025 (= lt!370767 lt!370770)))

(assert (=> b!823025 (= lt!370770 (+!1900 lt!370771 lt!370765))))

(assert (=> b!823025 (= lt!370765 (tuple2!9849 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2514 (array!45808 array!45810 (_ BitVec 32) (_ BitVec 32) V!24743 V!24743 (_ BitVec 32) Int) ListLongMap!8671)

(assert (=> b!823025 (= lt!370772 (getCurrentListMap!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823025 (= lt!370767 (getCurrentListMap!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823026 () Bool)

(declare-fun e!457671 () Bool)

(declare-fun mapRes!23824 () Bool)

(assert (=> b!823026 (= e!457671 (and e!457672 mapRes!23824))))

(declare-fun condMapEmpty!23824 () Bool)

(declare-fun mapDefault!23824 () ValueCell!6988)

