; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70868 () Bool)

(assert start!70868)

(declare-fun b_free!13105 () Bool)

(declare-fun b_next!13105 () Bool)

(assert (=> start!70868 (= b_free!13105 (not b_next!13105))))

(declare-fun tp!46063 () Bool)

(declare-fun b_and!21989 () Bool)

(assert (=> start!70868 (= tp!46063 b_and!21989)))

(declare-fun res!561341 () Bool)

(declare-fun e!457745 () Bool)

(assert (=> start!70868 (=> (not res!561341) (not e!457745))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70868 (= res!561341 (validMask!0 mask!1312))))

(assert (=> start!70868 e!457745))

(declare-fun tp_is_empty!14815 () Bool)

(assert (=> start!70868 tp_is_empty!14815))

(declare-datatypes ((array!45824 0))(
  ( (array!45825 (arr!21961 (Array (_ BitVec 32) (_ BitVec 64))) (size!22382 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45824)

(declare-fun array_inv!17537 (array!45824) Bool)

(assert (=> start!70868 (array_inv!17537 _keys!976)))

(assert (=> start!70868 true))

(declare-datatypes ((V!24755 0))(
  ( (V!24756 (val!7455 Int)) )
))
(declare-datatypes ((ValueCell!6992 0))(
  ( (ValueCellFull!6992 (v!9887 V!24755)) (EmptyCell!6992) )
))
(declare-datatypes ((array!45826 0))(
  ( (array!45827 (arr!21962 (Array (_ BitVec 32) ValueCell!6992)) (size!22383 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45826)

(declare-fun e!457746 () Bool)

(declare-fun array_inv!17538 (array!45826) Bool)

(assert (=> start!70868 (and (array_inv!17538 _values!788) e!457746)))

(assert (=> start!70868 tp!46063))

(declare-fun b!823115 () Bool)

(declare-fun res!561339 () Bool)

(assert (=> b!823115 (=> (not res!561339) (not e!457745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45824 (_ BitVec 32)) Bool)

(assert (=> b!823115 (= res!561339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823116 () Bool)

(declare-fun res!561340 () Bool)

(assert (=> b!823116 (=> (not res!561340) (not e!457745))))

(declare-datatypes ((List!15669 0))(
  ( (Nil!15666) (Cons!15665 (h!16794 (_ BitVec 64)) (t!22008 List!15669)) )
))
(declare-fun arrayNoDuplicates!0 (array!45824 (_ BitVec 32) List!15669) Bool)

(assert (=> b!823116 (= res!561340 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15666))))

(declare-fun mapNonEmpty!23836 () Bool)

(declare-fun mapRes!23836 () Bool)

(declare-fun tp!46062 () Bool)

(declare-fun e!457747 () Bool)

(assert (=> mapNonEmpty!23836 (= mapRes!23836 (and tp!46062 e!457747))))

(declare-fun mapKey!23836 () (_ BitVec 32))

(declare-fun mapValue!23836 () ValueCell!6992)

(declare-fun mapRest!23836 () (Array (_ BitVec 32) ValueCell!6992))

(assert (=> mapNonEmpty!23836 (= (arr!21962 _values!788) (store mapRest!23836 mapKey!23836 mapValue!23836))))

(declare-fun b!823117 () Bool)

(declare-fun e!457743 () Bool)

(assert (=> b!823117 (= e!457743 true)))

(declare-datatypes ((tuple2!9856 0))(
  ( (tuple2!9857 (_1!4939 (_ BitVec 64)) (_2!4939 V!24755)) )
))
(declare-datatypes ((List!15670 0))(
  ( (Nil!15667) (Cons!15666 (h!16795 tuple2!9856) (t!22009 List!15670)) )
))
(declare-datatypes ((ListLongMap!8679 0))(
  ( (ListLongMap!8680 (toList!4355 List!15670)) )
))
(declare-fun lt!370889 () ListLongMap!8679)

(declare-fun lt!370892 () ListLongMap!8679)

(declare-fun lt!370890 () tuple2!9856)

(declare-fun +!1904 (ListLongMap!8679 tuple2!9856) ListLongMap!8679)

(assert (=> b!823117 (= lt!370889 (+!1904 lt!370892 lt!370890))))

(declare-datatypes ((Unit!28176 0))(
  ( (Unit!28177) )
))
(declare-fun lt!370887 () Unit!28176)

(declare-fun lt!370885 () ListLongMap!8679)

(declare-fun zeroValueAfter!34 () V!24755)

(declare-fun minValue!754 () V!24755)

(declare-fun addCommutativeForDiffKeys!467 (ListLongMap!8679 (_ BitVec 64) V!24755 (_ BitVec 64) V!24755) Unit!28176)

(assert (=> b!823117 (= lt!370887 (addCommutativeForDiffKeys!467 lt!370885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370888 () ListLongMap!8679)

(assert (=> b!823117 (= lt!370888 lt!370889)))

(declare-fun lt!370891 () tuple2!9856)

(assert (=> b!823117 (= lt!370889 (+!1904 (+!1904 lt!370885 lt!370890) lt!370891))))

(assert (=> b!823117 (= lt!370890 (tuple2!9857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370886 () ListLongMap!8679)

(assert (=> b!823117 (= lt!370886 lt!370892)))

(assert (=> b!823117 (= lt!370892 (+!1904 lt!370885 lt!370891))))

(assert (=> b!823117 (= lt!370891 (tuple2!9857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2518 (array!45824 array!45826 (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 (_ BitVec 32) Int) ListLongMap!8679)

(assert (=> b!823117 (= lt!370888 (getCurrentListMap!2518 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24755)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823117 (= lt!370886 (getCurrentListMap!2518 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823118 () Bool)

(declare-fun res!561343 () Bool)

(assert (=> b!823118 (=> (not res!561343) (not e!457745))))

(assert (=> b!823118 (= res!561343 (and (= (size!22383 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22382 _keys!976) (size!22383 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823119 () Bool)

(declare-fun e!457748 () Bool)

(assert (=> b!823119 (= e!457748 tp_is_empty!14815)))

(declare-fun mapIsEmpty!23836 () Bool)

(assert (=> mapIsEmpty!23836 mapRes!23836))

(declare-fun b!823120 () Bool)

(assert (=> b!823120 (= e!457745 (not e!457743))))

(declare-fun res!561342 () Bool)

(assert (=> b!823120 (=> res!561342 e!457743)))

(assert (=> b!823120 (= res!561342 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370883 () ListLongMap!8679)

(assert (=> b!823120 (= lt!370885 lt!370883)))

(declare-fun lt!370884 () Unit!28176)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!480 (array!45824 array!45826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 V!24755 V!24755 (_ BitVec 32) Int) Unit!28176)

(assert (=> b!823120 (= lt!370884 (lemmaNoChangeToArrayThenSameMapNoExtras!480 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2370 (array!45824 array!45826 (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 (_ BitVec 32) Int) ListLongMap!8679)

(assert (=> b!823120 (= lt!370883 (getCurrentListMapNoExtraKeys!2370 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823120 (= lt!370885 (getCurrentListMapNoExtraKeys!2370 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823121 () Bool)

(assert (=> b!823121 (= e!457746 (and e!457748 mapRes!23836))))

(declare-fun condMapEmpty!23836 () Bool)

(declare-fun mapDefault!23836 () ValueCell!6992)

