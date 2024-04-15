; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105648 () Bool)

(assert start!105648)

(declare-fun b_free!27253 () Bool)

(declare-fun b_next!27253 () Bool)

(assert (=> start!105648 (= b_free!27253 (not b_next!27253))))

(declare-fun tp!95282 () Bool)

(declare-fun b_and!45109 () Bool)

(assert (=> start!105648 (= tp!95282 b_and!45109)))

(declare-fun mapNonEmpty!50026 () Bool)

(declare-fun mapRes!50026 () Bool)

(declare-fun tp!95281 () Bool)

(declare-fun e!715744 () Bool)

(assert (=> mapNonEmpty!50026 (= mapRes!50026 (and tp!95281 e!715744))))

(declare-datatypes ((V!48239 0))(
  ( (V!48240 (val!16140 Int)) )
))
(declare-datatypes ((ValueCell!15314 0))(
  ( (ValueCellFull!15314 (v!18841 V!48239)) (EmptyCell!15314) )
))
(declare-fun mapRest!50026 () (Array (_ BitVec 32) ValueCell!15314))

(declare-fun mapValue!50026 () ValueCell!15314)

(declare-fun mapKey!50026 () (_ BitVec 32))

(declare-datatypes ((array!81857 0))(
  ( (array!81858 (arr!39485 (Array (_ BitVec 32) ValueCell!15314)) (size!40023 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81857)

(assert (=> mapNonEmpty!50026 (= (arr!39485 _values!914) (store mapRest!50026 mapKey!50026 mapValue!50026))))

(declare-fun b!1258431 () Bool)

(declare-fun e!715743 () Bool)

(declare-fun tp_is_empty!32155 () Bool)

(assert (=> b!1258431 (= e!715743 tp_is_empty!32155)))

(declare-fun res!838773 () Bool)

(declare-fun e!715748 () Bool)

(assert (=> start!105648 (=> (not res!838773) (not e!715748))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105648 (= res!838773 (validMask!0 mask!1466))))

(assert (=> start!105648 e!715748))

(assert (=> start!105648 true))

(assert (=> start!105648 tp!95282))

(assert (=> start!105648 tp_is_empty!32155))

(declare-datatypes ((array!81859 0))(
  ( (array!81860 (arr!39486 (Array (_ BitVec 32) (_ BitVec 64))) (size!40024 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81859)

(declare-fun array_inv!30207 (array!81859) Bool)

(assert (=> start!105648 (array_inv!30207 _keys!1118)))

(declare-fun e!715747 () Bool)

(declare-fun array_inv!30208 (array!81857) Bool)

(assert (=> start!105648 (and (array_inv!30208 _values!914) e!715747)))

(declare-fun b!1258432 () Bool)

(assert (=> b!1258432 (= e!715744 tp_is_empty!32155)))

(declare-fun b!1258433 () Bool)

(declare-fun res!838777 () Bool)

(assert (=> b!1258433 (=> (not res!838777) (not e!715748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81859 (_ BitVec 32)) Bool)

(assert (=> b!1258433 (= res!838777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258434 () Bool)

(declare-fun res!838774 () Bool)

(assert (=> b!1258434 (=> (not res!838774) (not e!715748))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258434 (= res!838774 (and (= (size!40023 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40024 _keys!1118) (size!40023 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258435 () Bool)

(declare-fun e!715746 () Bool)

(assert (=> b!1258435 (= e!715746 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48239)

(declare-datatypes ((tuple2!20938 0))(
  ( (tuple2!20939 (_1!10480 (_ BitVec 64)) (_2!10480 V!48239)) )
))
(declare-datatypes ((List!28145 0))(
  ( (Nil!28142) (Cons!28141 (h!29350 tuple2!20938) (t!41629 List!28145)) )
))
(declare-datatypes ((ListLongMap!18811 0))(
  ( (ListLongMap!18812 (toList!9421 List!28145)) )
))
(declare-fun lt!569063 () ListLongMap!18811)

(declare-fun minValueBefore!43 () V!48239)

(declare-fun getCurrentListMap!4512 (array!81859 array!81857 (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 (_ BitVec 32) Int) ListLongMap!18811)

(assert (=> b!1258435 (= lt!569063 (getCurrentListMap!4512 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258436 () Bool)

(assert (=> b!1258436 (= e!715748 (not e!715746))))

(declare-fun res!838776 () Bool)

(assert (=> b!1258436 (=> res!838776 e!715746)))

(assert (=> b!1258436 (= res!838776 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569060 () ListLongMap!18811)

(declare-fun lt!569061 () ListLongMap!18811)

(assert (=> b!1258436 (= lt!569060 lt!569061)))

(declare-fun minValueAfter!43 () V!48239)

(declare-datatypes ((Unit!41793 0))(
  ( (Unit!41794) )
))
(declare-fun lt!569062 () Unit!41793)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1121 (array!81859 array!81857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 V!48239 V!48239 (_ BitVec 32) Int) Unit!41793)

(assert (=> b!1258436 (= lt!569062 (lemmaNoChangeToArrayThenSameMapNoExtras!1121 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5799 (array!81859 array!81857 (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 (_ BitVec 32) Int) ListLongMap!18811)

(assert (=> b!1258436 (= lt!569061 (getCurrentListMapNoExtraKeys!5799 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258436 (= lt!569060 (getCurrentListMapNoExtraKeys!5799 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50026 () Bool)

(assert (=> mapIsEmpty!50026 mapRes!50026))

(declare-fun b!1258437 () Bool)

(declare-fun res!838775 () Bool)

(assert (=> b!1258437 (=> (not res!838775) (not e!715748))))

(declare-datatypes ((List!28146 0))(
  ( (Nil!28143) (Cons!28142 (h!29351 (_ BitVec 64)) (t!41630 List!28146)) )
))
(declare-fun arrayNoDuplicates!0 (array!81859 (_ BitVec 32) List!28146) Bool)

(assert (=> b!1258437 (= res!838775 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28143))))

(declare-fun b!1258438 () Bool)

(assert (=> b!1258438 (= e!715747 (and e!715743 mapRes!50026))))

(declare-fun condMapEmpty!50026 () Bool)

(declare-fun mapDefault!50026 () ValueCell!15314)

(assert (=> b!1258438 (= condMapEmpty!50026 (= (arr!39485 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15314)) mapDefault!50026)))))

(assert (= (and start!105648 res!838773) b!1258434))

(assert (= (and b!1258434 res!838774) b!1258433))

(assert (= (and b!1258433 res!838777) b!1258437))

(assert (= (and b!1258437 res!838775) b!1258436))

(assert (= (and b!1258436 (not res!838776)) b!1258435))

(assert (= (and b!1258438 condMapEmpty!50026) mapIsEmpty!50026))

(assert (= (and b!1258438 (not condMapEmpty!50026)) mapNonEmpty!50026))

(get-info :version)

(assert (= (and mapNonEmpty!50026 ((_ is ValueCellFull!15314) mapValue!50026)) b!1258432))

(assert (= (and b!1258438 ((_ is ValueCellFull!15314) mapDefault!50026)) b!1258431))

(assert (= start!105648 b!1258438))

(declare-fun m!1158409 () Bool)

(assert (=> b!1258435 m!1158409))

(declare-fun m!1158411 () Bool)

(assert (=> b!1258437 m!1158411))

(declare-fun m!1158413 () Bool)

(assert (=> mapNonEmpty!50026 m!1158413))

(declare-fun m!1158415 () Bool)

(assert (=> b!1258433 m!1158415))

(declare-fun m!1158417 () Bool)

(assert (=> start!105648 m!1158417))

(declare-fun m!1158419 () Bool)

(assert (=> start!105648 m!1158419))

(declare-fun m!1158421 () Bool)

(assert (=> start!105648 m!1158421))

(declare-fun m!1158423 () Bool)

(assert (=> b!1258436 m!1158423))

(declare-fun m!1158425 () Bool)

(assert (=> b!1258436 m!1158425))

(declare-fun m!1158427 () Bool)

(assert (=> b!1258436 m!1158427))

(check-sat (not b!1258433) (not b!1258435) (not b!1258437) (not b!1258436) (not start!105648) (not b_next!27253) (not mapNonEmpty!50026) b_and!45109 tp_is_empty!32155)
(check-sat b_and!45109 (not b_next!27253))
