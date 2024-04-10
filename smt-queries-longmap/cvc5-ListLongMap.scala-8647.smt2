; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105200 () Bool)

(assert start!105200)

(declare-fun b_free!26917 () Bool)

(declare-fun b_next!26917 () Bool)

(assert (=> start!105200 (= b_free!26917 (not b_next!26917))))

(declare-fun tp!94256 () Bool)

(declare-fun b_and!44731 () Bool)

(assert (=> start!105200 (= tp!94256 b_and!44731)))

(declare-fun b!1253629 () Bool)

(declare-fun e!712220 () Bool)

(declare-fun tp_is_empty!31819 () Bool)

(assert (=> b!1253629 (= e!712220 tp_is_empty!31819)))

(declare-fun b!1253630 () Bool)

(declare-fun e!712219 () Bool)

(assert (=> b!1253630 (= e!712219 true)))

(declare-datatypes ((V!47791 0))(
  ( (V!47792 (val!15972 Int)) )
))
(declare-datatypes ((tuple2!20612 0))(
  ( (tuple2!20613 (_1!10317 (_ BitVec 64)) (_2!10317 V!47791)) )
))
(declare-datatypes ((List!27842 0))(
  ( (Nil!27839) (Cons!27838 (h!29047 tuple2!20612) (t!41323 List!27842)) )
))
(declare-datatypes ((ListLongMap!18485 0))(
  ( (ListLongMap!18486 (toList!9258 List!27842)) )
))
(declare-fun lt!566164 () ListLongMap!18485)

(declare-fun lt!566159 () ListLongMap!18485)

(declare-fun -!2031 (ListLongMap!18485 (_ BitVec 64)) ListLongMap!18485)

(assert (=> b!1253630 (= lt!566164 (-!2031 lt!566159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566161 () ListLongMap!18485)

(declare-fun lt!566166 () ListLongMap!18485)

(assert (=> b!1253630 (= (-!2031 lt!566161 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566166)))

(declare-datatypes ((Unit!41698 0))(
  ( (Unit!41699) )
))
(declare-fun lt!566165 () Unit!41698)

(declare-fun minValueBefore!43 () V!47791)

(declare-fun addThenRemoveForNewKeyIsSame!301 (ListLongMap!18485 (_ BitVec 64) V!47791) Unit!41698)

(assert (=> b!1253630 (= lt!566165 (addThenRemoveForNewKeyIsSame!301 lt!566166 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566162 () ListLongMap!18485)

(declare-fun lt!566160 () ListLongMap!18485)

(assert (=> b!1253630 (and (= lt!566159 lt!566161) (= lt!566162 lt!566160))))

(declare-fun +!4154 (ListLongMap!18485 tuple2!20612) ListLongMap!18485)

(assert (=> b!1253630 (= lt!566161 (+!4154 lt!566166 (tuple2!20613 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47791)

(declare-fun zeroValue!871 () V!47791)

(declare-datatypes ((array!81296 0))(
  ( (array!81297 (arr!39210 (Array (_ BitVec 32) (_ BitVec 64))) (size!39746 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81296)

(declare-datatypes ((ValueCell!15146 0))(
  ( (ValueCellFull!15146 (v!18670 V!47791)) (EmptyCell!15146) )
))
(declare-datatypes ((array!81298 0))(
  ( (array!81299 (arr!39211 (Array (_ BitVec 32) ValueCell!15146)) (size!39747 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81298)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4502 (array!81296 array!81298 (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 (_ BitVec 32) Int) ListLongMap!18485)

(assert (=> b!1253630 (= lt!566162 (getCurrentListMap!4502 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253630 (= lt!566159 (getCurrentListMap!4502 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49504 () Bool)

(declare-fun mapRes!49504 () Bool)

(assert (=> mapIsEmpty!49504 mapRes!49504))

(declare-fun b!1253631 () Bool)

(declare-fun e!712217 () Bool)

(assert (=> b!1253631 (= e!712217 (not e!712219))))

(declare-fun res!835945 () Bool)

(assert (=> b!1253631 (=> res!835945 e!712219)))

(assert (=> b!1253631 (= res!835945 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253631 (= lt!566166 lt!566160)))

(declare-fun lt!566163 () Unit!41698)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1013 (array!81296 array!81298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 V!47791 V!47791 (_ BitVec 32) Int) Unit!41698)

(assert (=> b!1253631 (= lt!566163 (lemmaNoChangeToArrayThenSameMapNoExtras!1013 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5649 (array!81296 array!81298 (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 (_ BitVec 32) Int) ListLongMap!18485)

(assert (=> b!1253631 (= lt!566160 (getCurrentListMapNoExtraKeys!5649 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253631 (= lt!566166 (getCurrentListMapNoExtraKeys!5649 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253632 () Bool)

(declare-fun e!712221 () Bool)

(assert (=> b!1253632 (= e!712221 tp_is_empty!31819)))

(declare-fun mapNonEmpty!49504 () Bool)

(declare-fun tp!94255 () Bool)

(assert (=> mapNonEmpty!49504 (= mapRes!49504 (and tp!94255 e!712220))))

(declare-fun mapValue!49504 () ValueCell!15146)

(declare-fun mapKey!49504 () (_ BitVec 32))

(declare-fun mapRest!49504 () (Array (_ BitVec 32) ValueCell!15146))

(assert (=> mapNonEmpty!49504 (= (arr!39211 _values!914) (store mapRest!49504 mapKey!49504 mapValue!49504))))

(declare-fun b!1253633 () Bool)

(declare-fun res!835947 () Bool)

(assert (=> b!1253633 (=> (not res!835947) (not e!712217))))

(assert (=> b!1253633 (= res!835947 (and (= (size!39747 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39746 _keys!1118) (size!39747 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253634 () Bool)

(declare-fun res!835946 () Bool)

(assert (=> b!1253634 (=> (not res!835946) (not e!712217))))

(declare-datatypes ((List!27843 0))(
  ( (Nil!27840) (Cons!27839 (h!29048 (_ BitVec 64)) (t!41324 List!27843)) )
))
(declare-fun arrayNoDuplicates!0 (array!81296 (_ BitVec 32) List!27843) Bool)

(assert (=> b!1253634 (= res!835946 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27840))))

(declare-fun b!1253635 () Bool)

(declare-fun res!835949 () Bool)

(assert (=> b!1253635 (=> (not res!835949) (not e!712217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81296 (_ BitVec 32)) Bool)

(assert (=> b!1253635 (= res!835949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835948 () Bool)

(assert (=> start!105200 (=> (not res!835948) (not e!712217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105200 (= res!835948 (validMask!0 mask!1466))))

(assert (=> start!105200 e!712217))

(assert (=> start!105200 true))

(assert (=> start!105200 tp!94256))

(assert (=> start!105200 tp_is_empty!31819))

(declare-fun array_inv!29891 (array!81296) Bool)

(assert (=> start!105200 (array_inv!29891 _keys!1118)))

(declare-fun e!712216 () Bool)

(declare-fun array_inv!29892 (array!81298) Bool)

(assert (=> start!105200 (and (array_inv!29892 _values!914) e!712216)))

(declare-fun b!1253636 () Bool)

(assert (=> b!1253636 (= e!712216 (and e!712221 mapRes!49504))))

(declare-fun condMapEmpty!49504 () Bool)

(declare-fun mapDefault!49504 () ValueCell!15146)

