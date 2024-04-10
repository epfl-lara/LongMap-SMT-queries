; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105490 () Bool)

(assert start!105490)

(declare-fun b_free!27127 () Bool)

(declare-fun b_next!27127 () Bool)

(assert (=> start!105490 (= b_free!27127 (not b_next!27127))))

(declare-fun tp!94897 () Bool)

(declare-fun b_and!44983 () Bool)

(assert (=> start!105490 (= tp!94897 b_and!44983)))

(declare-fun b!1256788 () Bool)

(declare-fun e!714532 () Bool)

(declare-fun e!714529 () Bool)

(assert (=> b!1256788 (= e!714532 e!714529)))

(declare-fun res!837805 () Bool)

(assert (=> b!1256788 (=> res!837805 e!714529)))

(declare-datatypes ((V!48071 0))(
  ( (V!48072 (val!16077 Int)) )
))
(declare-datatypes ((tuple2!20770 0))(
  ( (tuple2!20771 (_1!10396 (_ BitVec 64)) (_2!10396 V!48071)) )
))
(declare-datatypes ((List!27986 0))(
  ( (Nil!27983) (Cons!27982 (h!29191 tuple2!20770) (t!41475 List!27986)) )
))
(declare-datatypes ((ListLongMap!18643 0))(
  ( (ListLongMap!18644 (toList!9337 List!27986)) )
))
(declare-fun lt!568351 () ListLongMap!18643)

(declare-fun contains!7554 (ListLongMap!18643 (_ BitVec 64)) Bool)

(assert (=> b!1256788 (= res!837805 (contains!7554 lt!568351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48071)

(declare-datatypes ((array!81696 0))(
  ( (array!81697 (arr!39406 (Array (_ BitVec 32) (_ BitVec 64))) (size!39942 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81696)

(declare-datatypes ((ValueCell!15251 0))(
  ( (ValueCellFull!15251 (v!18778 V!48071)) (EmptyCell!15251) )
))
(declare-datatypes ((array!81698 0))(
  ( (array!81699 (arr!39407 (Array (_ BitVec 32) ValueCell!15251)) (size!39943 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81698)

(declare-fun minValueBefore!43 () V!48071)

(declare-fun getCurrentListMap!4559 (array!81696 array!81698 (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 (_ BitVec 32) Int) ListLongMap!18643)

(assert (=> b!1256788 (= lt!568351 (getCurrentListMap!4559 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256789 () Bool)

(declare-fun res!837808 () Bool)

(declare-fun e!714528 () Bool)

(assert (=> b!1256789 (=> (not res!837808) (not e!714528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81696 (_ BitVec 32)) Bool)

(assert (=> b!1256789 (= res!837808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256790 () Bool)

(declare-fun e!714534 () Bool)

(declare-fun tp_is_empty!32029 () Bool)

(assert (=> b!1256790 (= e!714534 tp_is_empty!32029)))

(declare-fun b!1256791 () Bool)

(assert (=> b!1256791 (= e!714528 (not e!714532))))

(declare-fun res!837806 () Bool)

(assert (=> b!1256791 (=> res!837806 e!714532)))

(assert (=> b!1256791 (= res!837806 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568349 () ListLongMap!18643)

(declare-fun lt!568348 () ListLongMap!18643)

(assert (=> b!1256791 (= lt!568349 lt!568348)))

(declare-datatypes ((Unit!41858 0))(
  ( (Unit!41859) )
))
(declare-fun lt!568350 () Unit!41858)

(declare-fun minValueAfter!43 () V!48071)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1083 (array!81696 array!81698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 V!48071 V!48071 (_ BitVec 32) Int) Unit!41858)

(assert (=> b!1256791 (= lt!568350 (lemmaNoChangeToArrayThenSameMapNoExtras!1083 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5719 (array!81696 array!81698 (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 (_ BitVec 32) Int) ListLongMap!18643)

(assert (=> b!1256791 (= lt!568348 (getCurrentListMapNoExtraKeys!5719 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256791 (= lt!568349 (getCurrentListMapNoExtraKeys!5719 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256792 () Bool)

(declare-fun res!837807 () Bool)

(assert (=> b!1256792 (=> (not res!837807) (not e!714528))))

(assert (=> b!1256792 (= res!837807 (and (= (size!39943 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39942 _keys!1118) (size!39943 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49831 () Bool)

(declare-fun mapRes!49831 () Bool)

(declare-fun tp!94898 () Bool)

(assert (=> mapNonEmpty!49831 (= mapRes!49831 (and tp!94898 e!714534))))

(declare-fun mapValue!49831 () ValueCell!15251)

(declare-fun mapKey!49831 () (_ BitVec 32))

(declare-fun mapRest!49831 () (Array (_ BitVec 32) ValueCell!15251))

(assert (=> mapNonEmpty!49831 (= (arr!39407 _values!914) (store mapRest!49831 mapKey!49831 mapValue!49831))))

(declare-fun b!1256793 () Bool)

(declare-fun res!837809 () Bool)

(assert (=> b!1256793 (=> (not res!837809) (not e!714528))))

(declare-datatypes ((List!27987 0))(
  ( (Nil!27984) (Cons!27983 (h!29192 (_ BitVec 64)) (t!41476 List!27987)) )
))
(declare-fun arrayNoDuplicates!0 (array!81696 (_ BitVec 32) List!27987) Bool)

(assert (=> b!1256793 (= res!837809 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27984))))

(declare-fun mapIsEmpty!49831 () Bool)

(assert (=> mapIsEmpty!49831 mapRes!49831))

(declare-fun res!837810 () Bool)

(assert (=> start!105490 (=> (not res!837810) (not e!714528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105490 (= res!837810 (validMask!0 mask!1466))))

(assert (=> start!105490 e!714528))

(assert (=> start!105490 true))

(assert (=> start!105490 tp!94897))

(assert (=> start!105490 tp_is_empty!32029))

(declare-fun array_inv!30019 (array!81696) Bool)

(assert (=> start!105490 (array_inv!30019 _keys!1118)))

(declare-fun e!714533 () Bool)

(declare-fun array_inv!30020 (array!81698) Bool)

(assert (=> start!105490 (and (array_inv!30020 _values!914) e!714533)))

(declare-fun b!1256794 () Bool)

(declare-fun e!714531 () Bool)

(assert (=> b!1256794 (= e!714533 (and e!714531 mapRes!49831))))

(declare-fun condMapEmpty!49831 () Bool)

(declare-fun mapDefault!49831 () ValueCell!15251)

