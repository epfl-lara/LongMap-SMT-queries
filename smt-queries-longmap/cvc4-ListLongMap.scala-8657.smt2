; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105286 () Bool)

(assert start!105286)

(declare-fun b_free!26981 () Bool)

(declare-fun b_next!26981 () Bool)

(assert (=> start!105286 (= b_free!26981 (not b_next!26981))))

(declare-fun tp!94450 () Bool)

(declare-fun b_and!44807 () Bool)

(assert (=> start!105286 (= tp!94450 b_and!44807)))

(declare-fun b!1254581 () Bool)

(declare-fun e!712913 () Bool)

(declare-fun tp_is_empty!31883 () Bool)

(assert (=> b!1254581 (= e!712913 tp_is_empty!31883)))

(declare-fun b!1254583 () Bool)

(declare-fun res!836507 () Bool)

(declare-fun e!712915 () Bool)

(assert (=> b!1254583 (=> (not res!836507) (not e!712915))))

(declare-datatypes ((array!81420 0))(
  ( (array!81421 (arr!39271 (Array (_ BitVec 32) (_ BitVec 64))) (size!39807 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81420)

(declare-datatypes ((List!27893 0))(
  ( (Nil!27890) (Cons!27889 (h!29098 (_ BitVec 64)) (t!41376 List!27893)) )
))
(declare-fun arrayNoDuplicates!0 (array!81420 (_ BitVec 32) List!27893) Bool)

(assert (=> b!1254583 (= res!836507 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27890))))

(declare-fun b!1254584 () Bool)

(declare-fun e!712916 () Bool)

(assert (=> b!1254584 (= e!712916 true)))

(declare-datatypes ((V!47875 0))(
  ( (V!47876 (val!16004 Int)) )
))
(declare-datatypes ((tuple2!20668 0))(
  ( (tuple2!20669 (_1!10345 (_ BitVec 64)) (_2!10345 V!47875)) )
))
(declare-datatypes ((List!27894 0))(
  ( (Nil!27891) (Cons!27890 (h!29099 tuple2!20668) (t!41377 List!27894)) )
))
(declare-datatypes ((ListLongMap!18541 0))(
  ( (ListLongMap!18542 (toList!9286 List!27894)) )
))
(declare-fun lt!567072 () ListLongMap!18541)

(declare-fun lt!567067 () ListLongMap!18541)

(declare-fun -!2057 (ListLongMap!18541 (_ BitVec 64)) ListLongMap!18541)

(assert (=> b!1254584 (= lt!567072 (-!2057 lt!567067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567065 () ListLongMap!18541)

(declare-fun lt!567071 () ListLongMap!18541)

(assert (=> b!1254584 (= (-!2057 lt!567065 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567071)))

(declare-datatypes ((Unit!41756 0))(
  ( (Unit!41757) )
))
(declare-fun lt!567069 () Unit!41756)

(declare-fun minValueBefore!43 () V!47875)

(declare-fun addThenRemoveForNewKeyIsSame!327 (ListLongMap!18541 (_ BitVec 64) V!47875) Unit!41756)

(assert (=> b!1254584 (= lt!567069 (addThenRemoveForNewKeyIsSame!327 lt!567071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567066 () ListLongMap!18541)

(declare-fun lt!567070 () ListLongMap!18541)

(assert (=> b!1254584 (and (= lt!567067 lt!567065) (= lt!567066 lt!567070))))

(declare-fun +!4180 (ListLongMap!18541 tuple2!20668) ListLongMap!18541)

(assert (=> b!1254584 (= lt!567065 (+!4180 lt!567071 (tuple2!20669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47875)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47875)

(declare-datatypes ((ValueCell!15178 0))(
  ( (ValueCellFull!15178 (v!18703 V!47875)) (EmptyCell!15178) )
))
(declare-datatypes ((array!81422 0))(
  ( (array!81423 (arr!39272 (Array (_ BitVec 32) ValueCell!15178)) (size!39808 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81422)

(declare-fun getCurrentListMap!4528 (array!81420 array!81422 (_ BitVec 32) (_ BitVec 32) V!47875 V!47875 (_ BitVec 32) Int) ListLongMap!18541)

(assert (=> b!1254584 (= lt!567066 (getCurrentListMap!4528 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254584 (= lt!567067 (getCurrentListMap!4528 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49603 () Bool)

(declare-fun mapRes!49603 () Bool)

(declare-fun tp!94451 () Bool)

(assert (=> mapNonEmpty!49603 (= mapRes!49603 (and tp!94451 e!712913))))

(declare-fun mapValue!49603 () ValueCell!15178)

(declare-fun mapRest!49603 () (Array (_ BitVec 32) ValueCell!15178))

(declare-fun mapKey!49603 () (_ BitVec 32))

(assert (=> mapNonEmpty!49603 (= (arr!39272 _values!914) (store mapRest!49603 mapKey!49603 mapValue!49603))))

(declare-fun mapIsEmpty!49603 () Bool)

(assert (=> mapIsEmpty!49603 mapRes!49603))

(declare-fun b!1254585 () Bool)

(declare-fun res!836509 () Bool)

(assert (=> b!1254585 (=> (not res!836509) (not e!712915))))

(assert (=> b!1254585 (= res!836509 (and (= (size!39808 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39807 _keys!1118) (size!39808 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254586 () Bool)

(declare-fun e!712911 () Bool)

(assert (=> b!1254586 (= e!712911 tp_is_empty!31883)))

(declare-fun res!836510 () Bool)

(assert (=> start!105286 (=> (not res!836510) (not e!712915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105286 (= res!836510 (validMask!0 mask!1466))))

(assert (=> start!105286 e!712915))

(assert (=> start!105286 true))

(assert (=> start!105286 tp!94450))

(assert (=> start!105286 tp_is_empty!31883))

(declare-fun array_inv!29939 (array!81420) Bool)

(assert (=> start!105286 (array_inv!29939 _keys!1118)))

(declare-fun e!712914 () Bool)

(declare-fun array_inv!29940 (array!81422) Bool)

(assert (=> start!105286 (and (array_inv!29940 _values!914) e!712914)))

(declare-fun b!1254582 () Bool)

(assert (=> b!1254582 (= e!712915 (not e!712916))))

(declare-fun res!836508 () Bool)

(assert (=> b!1254582 (=> res!836508 e!712916)))

(assert (=> b!1254582 (= res!836508 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254582 (= lt!567071 lt!567070)))

(declare-fun lt!567068 () Unit!41756)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1037 (array!81420 array!81422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47875 V!47875 V!47875 V!47875 (_ BitVec 32) Int) Unit!41756)

(assert (=> b!1254582 (= lt!567068 (lemmaNoChangeToArrayThenSameMapNoExtras!1037 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5673 (array!81420 array!81422 (_ BitVec 32) (_ BitVec 32) V!47875 V!47875 (_ BitVec 32) Int) ListLongMap!18541)

(assert (=> b!1254582 (= lt!567070 (getCurrentListMapNoExtraKeys!5673 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254582 (= lt!567071 (getCurrentListMapNoExtraKeys!5673 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254587 () Bool)

(declare-fun res!836511 () Bool)

(assert (=> b!1254587 (=> (not res!836511) (not e!712915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81420 (_ BitVec 32)) Bool)

(assert (=> b!1254587 (= res!836511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254588 () Bool)

(assert (=> b!1254588 (= e!712914 (and e!712911 mapRes!49603))))

(declare-fun condMapEmpty!49603 () Bool)

(declare-fun mapDefault!49603 () ValueCell!15178)

