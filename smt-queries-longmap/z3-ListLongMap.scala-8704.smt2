; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105654 () Bool)

(assert start!105654)

(declare-fun b_free!27259 () Bool)

(declare-fun b_next!27259 () Bool)

(assert (=> start!105654 (= b_free!27259 (not b_next!27259))))

(declare-fun tp!95299 () Bool)

(declare-fun b_and!45115 () Bool)

(assert (=> start!105654 (= tp!95299 b_and!45115)))

(declare-fun b!1258503 () Bool)

(declare-fun res!838819 () Bool)

(declare-fun e!715801 () Bool)

(assert (=> b!1258503 (=> (not res!838819) (not e!715801))))

(declare-datatypes ((array!81869 0))(
  ( (array!81870 (arr!39491 (Array (_ BitVec 32) (_ BitVec 64))) (size!40029 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81869)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81869 (_ BitVec 32)) Bool)

(assert (=> b!1258503 (= res!838819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258504 () Bool)

(declare-fun e!715799 () Bool)

(declare-fun e!715802 () Bool)

(declare-fun mapRes!50035 () Bool)

(assert (=> b!1258504 (= e!715799 (and e!715802 mapRes!50035))))

(declare-fun condMapEmpty!50035 () Bool)

(declare-datatypes ((V!48247 0))(
  ( (V!48248 (val!16143 Int)) )
))
(declare-datatypes ((ValueCell!15317 0))(
  ( (ValueCellFull!15317 (v!18844 V!48247)) (EmptyCell!15317) )
))
(declare-datatypes ((array!81871 0))(
  ( (array!81872 (arr!39492 (Array (_ BitVec 32) ValueCell!15317)) (size!40030 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81871)

(declare-fun mapDefault!50035 () ValueCell!15317)

(assert (=> b!1258504 (= condMapEmpty!50035 (= (arr!39492 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15317)) mapDefault!50035)))))

(declare-fun b!1258505 () Bool)

(declare-fun res!838822 () Bool)

(assert (=> b!1258505 (=> (not res!838822) (not e!715801))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258505 (= res!838822 (and (= (size!40030 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40029 _keys!1118) (size!40030 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50035 () Bool)

(assert (=> mapIsEmpty!50035 mapRes!50035))

(declare-fun b!1258506 () Bool)

(declare-fun e!715800 () Bool)

(assert (=> b!1258506 (= e!715800 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48247)

(declare-datatypes ((tuple2!20944 0))(
  ( (tuple2!20945 (_1!10483 (_ BitVec 64)) (_2!10483 V!48247)) )
))
(declare-datatypes ((List!28150 0))(
  ( (Nil!28147) (Cons!28146 (h!29355 tuple2!20944) (t!41634 List!28150)) )
))
(declare-datatypes ((ListLongMap!18817 0))(
  ( (ListLongMap!18818 (toList!9424 List!28150)) )
))
(declare-fun lt!569096 () ListLongMap!18817)

(declare-fun minValueBefore!43 () V!48247)

(declare-fun getCurrentListMap!4515 (array!81869 array!81871 (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 (_ BitVec 32) Int) ListLongMap!18817)

(assert (=> b!1258506 (= lt!569096 (getCurrentListMap!4515 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258507 () Bool)

(declare-fun res!838821 () Bool)

(assert (=> b!1258507 (=> (not res!838821) (not e!715801))))

(declare-datatypes ((List!28151 0))(
  ( (Nil!28148) (Cons!28147 (h!29356 (_ BitVec 64)) (t!41635 List!28151)) )
))
(declare-fun arrayNoDuplicates!0 (array!81869 (_ BitVec 32) List!28151) Bool)

(assert (=> b!1258507 (= res!838821 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28148))))

(declare-fun b!1258508 () Bool)

(declare-fun e!715798 () Bool)

(declare-fun tp_is_empty!32161 () Bool)

(assert (=> b!1258508 (= e!715798 tp_is_empty!32161)))

(declare-fun b!1258509 () Bool)

(assert (=> b!1258509 (= e!715802 tp_is_empty!32161)))

(declare-fun b!1258510 () Bool)

(assert (=> b!1258510 (= e!715801 (not e!715800))))

(declare-fun res!838820 () Bool)

(assert (=> b!1258510 (=> res!838820 e!715800)))

(assert (=> b!1258510 (= res!838820 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569097 () ListLongMap!18817)

(declare-fun lt!569098 () ListLongMap!18817)

(assert (=> b!1258510 (= lt!569097 lt!569098)))

(declare-fun minValueAfter!43 () V!48247)

(declare-datatypes ((Unit!41797 0))(
  ( (Unit!41798) )
))
(declare-fun lt!569099 () Unit!41797)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1123 (array!81869 array!81871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 V!48247 V!48247 (_ BitVec 32) Int) Unit!41797)

(assert (=> b!1258510 (= lt!569099 (lemmaNoChangeToArrayThenSameMapNoExtras!1123 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5801 (array!81869 array!81871 (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 (_ BitVec 32) Int) ListLongMap!18817)

(assert (=> b!1258510 (= lt!569098 (getCurrentListMapNoExtraKeys!5801 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258510 (= lt!569097 (getCurrentListMapNoExtraKeys!5801 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838818 () Bool)

(assert (=> start!105654 (=> (not res!838818) (not e!715801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105654 (= res!838818 (validMask!0 mask!1466))))

(assert (=> start!105654 e!715801))

(assert (=> start!105654 true))

(assert (=> start!105654 tp!95299))

(assert (=> start!105654 tp_is_empty!32161))

(declare-fun array_inv!30213 (array!81869) Bool)

(assert (=> start!105654 (array_inv!30213 _keys!1118)))

(declare-fun array_inv!30214 (array!81871) Bool)

(assert (=> start!105654 (and (array_inv!30214 _values!914) e!715799)))

(declare-fun mapNonEmpty!50035 () Bool)

(declare-fun tp!95300 () Bool)

(assert (=> mapNonEmpty!50035 (= mapRes!50035 (and tp!95300 e!715798))))

(declare-fun mapRest!50035 () (Array (_ BitVec 32) ValueCell!15317))

(declare-fun mapKey!50035 () (_ BitVec 32))

(declare-fun mapValue!50035 () ValueCell!15317)

(assert (=> mapNonEmpty!50035 (= (arr!39492 _values!914) (store mapRest!50035 mapKey!50035 mapValue!50035))))

(assert (= (and start!105654 res!838818) b!1258505))

(assert (= (and b!1258505 res!838822) b!1258503))

(assert (= (and b!1258503 res!838819) b!1258507))

(assert (= (and b!1258507 res!838821) b!1258510))

(assert (= (and b!1258510 (not res!838820)) b!1258506))

(assert (= (and b!1258504 condMapEmpty!50035) mapIsEmpty!50035))

(assert (= (and b!1258504 (not condMapEmpty!50035)) mapNonEmpty!50035))

(get-info :version)

(assert (= (and mapNonEmpty!50035 ((_ is ValueCellFull!15317) mapValue!50035)) b!1258508))

(assert (= (and b!1258504 ((_ is ValueCellFull!15317) mapDefault!50035)) b!1258509))

(assert (= start!105654 b!1258504))

(declare-fun m!1158469 () Bool)

(assert (=> b!1258510 m!1158469))

(declare-fun m!1158471 () Bool)

(assert (=> b!1258510 m!1158471))

(declare-fun m!1158473 () Bool)

(assert (=> b!1258510 m!1158473))

(declare-fun m!1158475 () Bool)

(assert (=> b!1258503 m!1158475))

(declare-fun m!1158477 () Bool)

(assert (=> mapNonEmpty!50035 m!1158477))

(declare-fun m!1158479 () Bool)

(assert (=> b!1258506 m!1158479))

(declare-fun m!1158481 () Bool)

(assert (=> start!105654 m!1158481))

(declare-fun m!1158483 () Bool)

(assert (=> start!105654 m!1158483))

(declare-fun m!1158485 () Bool)

(assert (=> start!105654 m!1158485))

(declare-fun m!1158487 () Bool)

(assert (=> b!1258507 m!1158487))

(check-sat tp_is_empty!32161 b_and!45115 (not b!1258503) (not b!1258510) (not mapNonEmpty!50035) (not b!1258506) (not start!105654) (not b_next!27259) (not b!1258507))
(check-sat b_and!45115 (not b_next!27259))
