; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105588 () Bool)

(assert start!105588)

(declare-fun b_free!27037 () Bool)

(declare-fun b_next!27037 () Bool)

(assert (=> start!105588 (= b_free!27037 (not b_next!27037))))

(declare-fun tp!94621 () Bool)

(declare-fun b_and!44877 () Bool)

(assert (=> start!105588 (= tp!94621 b_and!44877)))

(declare-fun b!1256677 () Bool)

(declare-fun res!837465 () Bool)

(declare-fun e!714316 () Bool)

(assert (=> b!1256677 (=> (not res!837465) (not e!714316))))

(declare-datatypes ((array!81569 0))(
  ( (array!81570 (arr!39340 (Array (_ BitVec 32) (_ BitVec 64))) (size!39877 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81569)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81569 (_ BitVec 32)) Bool)

(assert (=> b!1256677 (= res!837465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49690 () Bool)

(declare-fun mapRes!49690 () Bool)

(assert (=> mapIsEmpty!49690 mapRes!49690))

(declare-fun b!1256678 () Bool)

(declare-fun e!714318 () Bool)

(declare-fun tp_is_empty!31939 () Bool)

(assert (=> b!1256678 (= e!714318 tp_is_empty!31939)))

(declare-fun mapNonEmpty!49690 () Bool)

(declare-fun tp!94622 () Bool)

(assert (=> mapNonEmpty!49690 (= mapRes!49690 (and tp!94622 e!714318))))

(declare-datatypes ((V!47951 0))(
  ( (V!47952 (val!16032 Int)) )
))
(declare-datatypes ((ValueCell!15206 0))(
  ( (ValueCellFull!15206 (v!18728 V!47951)) (EmptyCell!15206) )
))
(declare-fun mapRest!49690 () (Array (_ BitVec 32) ValueCell!15206))

(declare-fun mapKey!49690 () (_ BitVec 32))

(declare-datatypes ((array!81571 0))(
  ( (array!81572 (arr!39341 (Array (_ BitVec 32) ValueCell!15206)) (size!39878 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81571)

(declare-fun mapValue!49690 () ValueCell!15206)

(assert (=> mapNonEmpty!49690 (= (arr!39341 _values!914) (store mapRest!49690 mapKey!49690 mapValue!49690))))

(declare-fun res!837464 () Bool)

(assert (=> start!105588 (=> (not res!837464) (not e!714316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105588 (= res!837464 (validMask!0 mask!1466))))

(assert (=> start!105588 e!714316))

(assert (=> start!105588 true))

(assert (=> start!105588 tp!94621))

(assert (=> start!105588 tp_is_empty!31939))

(declare-fun array_inv!30107 (array!81569) Bool)

(assert (=> start!105588 (array_inv!30107 _keys!1118)))

(declare-fun e!714320 () Bool)

(declare-fun array_inv!30108 (array!81571) Bool)

(assert (=> start!105588 (and (array_inv!30108 _values!914) e!714320)))

(declare-fun b!1256679 () Bool)

(assert (=> b!1256679 (= e!714316 (not true))))

(declare-datatypes ((tuple2!20724 0))(
  ( (tuple2!20725 (_1!10373 (_ BitVec 64)) (_2!10373 V!47951)) )
))
(declare-datatypes ((List!27958 0))(
  ( (Nil!27955) (Cons!27954 (h!29172 tuple2!20724) (t!41435 List!27958)) )
))
(declare-datatypes ((ListLongMap!18605 0))(
  ( (ListLongMap!18606 (toList!9318 List!27958)) )
))
(declare-fun lt!568035 () ListLongMap!18605)

(declare-fun lt!568036 () ListLongMap!18605)

(assert (=> b!1256679 (= lt!568035 lt!568036)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47951)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47951)

(declare-datatypes ((Unit!41777 0))(
  ( (Unit!41778) )
))
(declare-fun lt!568034 () Unit!41777)

(declare-fun minValueBefore!43 () V!47951)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1054 (array!81569 array!81571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47951 V!47951 V!47951 V!47951 (_ BitVec 32) Int) Unit!41777)

(assert (=> b!1256679 (= lt!568034 (lemmaNoChangeToArrayThenSameMapNoExtras!1054 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5740 (array!81569 array!81571 (_ BitVec 32) (_ BitVec 32) V!47951 V!47951 (_ BitVec 32) Int) ListLongMap!18605)

(assert (=> b!1256679 (= lt!568036 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256679 (= lt!568035 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256680 () Bool)

(declare-fun e!714317 () Bool)

(assert (=> b!1256680 (= e!714320 (and e!714317 mapRes!49690))))

(declare-fun condMapEmpty!49690 () Bool)

(declare-fun mapDefault!49690 () ValueCell!15206)

(assert (=> b!1256680 (= condMapEmpty!49690 (= (arr!39341 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15206)) mapDefault!49690)))))

(declare-fun b!1256681 () Bool)

(declare-fun res!837467 () Bool)

(assert (=> b!1256681 (=> (not res!837467) (not e!714316))))

(assert (=> b!1256681 (= res!837467 (and (= (size!39878 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39877 _keys!1118) (size!39878 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256682 () Bool)

(declare-fun res!837466 () Bool)

(assert (=> b!1256682 (=> (not res!837466) (not e!714316))))

(declare-datatypes ((List!27959 0))(
  ( (Nil!27956) (Cons!27955 (h!29173 (_ BitVec 64)) (t!41436 List!27959)) )
))
(declare-fun arrayNoDuplicates!0 (array!81569 (_ BitVec 32) List!27959) Bool)

(assert (=> b!1256682 (= res!837466 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27956))))

(declare-fun b!1256683 () Bool)

(assert (=> b!1256683 (= e!714317 tp_is_empty!31939)))

(assert (= (and start!105588 res!837464) b!1256681))

(assert (= (and b!1256681 res!837467) b!1256677))

(assert (= (and b!1256677 res!837465) b!1256682))

(assert (= (and b!1256682 res!837466) b!1256679))

(assert (= (and b!1256680 condMapEmpty!49690) mapIsEmpty!49690))

(assert (= (and b!1256680 (not condMapEmpty!49690)) mapNonEmpty!49690))

(get-info :version)

(assert (= (and mapNonEmpty!49690 ((_ is ValueCellFull!15206) mapValue!49690)) b!1256678))

(assert (= (and b!1256680 ((_ is ValueCellFull!15206) mapDefault!49690)) b!1256683))

(assert (= start!105588 b!1256680))

(declare-fun m!1157733 () Bool)

(assert (=> b!1256679 m!1157733))

(declare-fun m!1157735 () Bool)

(assert (=> b!1256679 m!1157735))

(declare-fun m!1157737 () Bool)

(assert (=> b!1256679 m!1157737))

(declare-fun m!1157739 () Bool)

(assert (=> mapNonEmpty!49690 m!1157739))

(declare-fun m!1157741 () Bool)

(assert (=> start!105588 m!1157741))

(declare-fun m!1157743 () Bool)

(assert (=> start!105588 m!1157743))

(declare-fun m!1157745 () Bool)

(assert (=> start!105588 m!1157745))

(declare-fun m!1157747 () Bool)

(assert (=> b!1256677 m!1157747))

(declare-fun m!1157749 () Bool)

(assert (=> b!1256682 m!1157749))

(check-sat (not b!1256677) b_and!44877 tp_is_empty!31939 (not b!1256682) (not mapNonEmpty!49690) (not start!105588) (not b_next!27037) (not b!1256679))
(check-sat b_and!44877 (not b_next!27037))
