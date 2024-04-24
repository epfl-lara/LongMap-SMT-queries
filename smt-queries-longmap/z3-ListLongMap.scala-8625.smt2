; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105262 () Bool)

(assert start!105262)

(declare-fun b_free!26785 () Bool)

(declare-fun b_next!26785 () Bool)

(assert (=> start!105262 (= b_free!26785 (not b_next!26785))))

(declare-fun tp!93853 () Bool)

(declare-fun b_and!44583 () Bool)

(assert (=> start!105262 (= tp!93853 b_and!44583)))

(declare-fun b!1253169 () Bool)

(declare-fun res!835440 () Bool)

(declare-fun e!711782 () Bool)

(assert (=> b!1253169 (=> (not res!835440) (not e!711782))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81087 0))(
  ( (array!81088 (arr!39103 (Array (_ BitVec 32) (_ BitVec 64))) (size!39640 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81087)

(declare-datatypes ((V!47615 0))(
  ( (V!47616 (val!15906 Int)) )
))
(declare-datatypes ((ValueCell!15080 0))(
  ( (ValueCellFull!15080 (v!18600 V!47615)) (EmptyCell!15080) )
))
(declare-datatypes ((array!81089 0))(
  ( (array!81090 (arr!39104 (Array (_ BitVec 32) ValueCell!15080)) (size!39641 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81089)

(assert (=> b!1253169 (= res!835440 (and (= (size!39641 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39640 _keys!1118) (size!39641 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253170 () Bool)

(declare-fun res!835438 () Bool)

(assert (=> b!1253170 (=> (not res!835438) (not e!711782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81087 (_ BitVec 32)) Bool)

(assert (=> b!1253170 (= res!835438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253171 () Bool)

(declare-fun e!711781 () Bool)

(declare-fun e!711779 () Bool)

(declare-fun mapRes!49300 () Bool)

(assert (=> b!1253171 (= e!711781 (and e!711779 mapRes!49300))))

(declare-fun condMapEmpty!49300 () Bool)

(declare-fun mapDefault!49300 () ValueCell!15080)

(assert (=> b!1253171 (= condMapEmpty!49300 (= (arr!39104 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15080)) mapDefault!49300)))))

(declare-fun b!1253172 () Bool)

(declare-fun tp_is_empty!31687 () Bool)

(assert (=> b!1253172 (= e!711779 tp_is_empty!31687)))

(declare-fun mapIsEmpty!49300 () Bool)

(assert (=> mapIsEmpty!49300 mapRes!49300))

(declare-fun res!835439 () Bool)

(assert (=> start!105262 (=> (not res!835439) (not e!711782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105262 (= res!835439 (validMask!0 mask!1466))))

(assert (=> start!105262 e!711782))

(assert (=> start!105262 true))

(assert (=> start!105262 tp!93853))

(assert (=> start!105262 tp_is_empty!31687))

(declare-fun array_inv!29935 (array!81087) Bool)

(assert (=> start!105262 (array_inv!29935 _keys!1118)))

(declare-fun array_inv!29936 (array!81089) Bool)

(assert (=> start!105262 (and (array_inv!29936 _values!914) e!711781)))

(declare-fun b!1253173 () Bool)

(declare-fun res!835441 () Bool)

(assert (=> b!1253173 (=> (not res!835441) (not e!711782))))

(declare-datatypes ((List!27780 0))(
  ( (Nil!27777) (Cons!27776 (h!28994 (_ BitVec 64)) (t!41249 List!27780)) )
))
(declare-fun arrayNoDuplicates!0 (array!81087 (_ BitVec 32) List!27780) Bool)

(assert (=> b!1253173 (= res!835441 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27777))))

(declare-fun b!1253174 () Bool)

(assert (=> b!1253174 (= e!711782 (not true))))

(declare-datatypes ((tuple2!20536 0))(
  ( (tuple2!20537 (_1!10279 (_ BitVec 64)) (_2!10279 V!47615)) )
))
(declare-datatypes ((List!27781 0))(
  ( (Nil!27778) (Cons!27777 (h!28995 tuple2!20536) (t!41250 List!27781)) )
))
(declare-datatypes ((ListLongMap!18417 0))(
  ( (ListLongMap!18418 (toList!9224 List!27781)) )
))
(declare-fun lt!565560 () ListLongMap!18417)

(declare-fun lt!565561 () ListLongMap!18417)

(assert (=> b!1253174 (= lt!565560 lt!565561)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47615)

(declare-datatypes ((Unit!41586 0))(
  ( (Unit!41587) )
))
(declare-fun lt!565562 () Unit!41586)

(declare-fun minValueBefore!43 () V!47615)

(declare-fun zeroValue!871 () V!47615)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!965 (array!81087 array!81089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47615 V!47615 V!47615 V!47615 (_ BitVec 32) Int) Unit!41586)

(assert (=> b!1253174 (= lt!565562 (lemmaNoChangeToArrayThenSameMapNoExtras!965 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5651 (array!81087 array!81089 (_ BitVec 32) (_ BitVec 32) V!47615 V!47615 (_ BitVec 32) Int) ListLongMap!18417)

(assert (=> b!1253174 (= lt!565561 (getCurrentListMapNoExtraKeys!5651 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253174 (= lt!565560 (getCurrentListMapNoExtraKeys!5651 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253175 () Bool)

(declare-fun e!711778 () Bool)

(assert (=> b!1253175 (= e!711778 tp_is_empty!31687)))

(declare-fun mapNonEmpty!49300 () Bool)

(declare-fun tp!93854 () Bool)

(assert (=> mapNonEmpty!49300 (= mapRes!49300 (and tp!93854 e!711778))))

(declare-fun mapValue!49300 () ValueCell!15080)

(declare-fun mapKey!49300 () (_ BitVec 32))

(declare-fun mapRest!49300 () (Array (_ BitVec 32) ValueCell!15080))

(assert (=> mapNonEmpty!49300 (= (arr!39104 _values!914) (store mapRest!49300 mapKey!49300 mapValue!49300))))

(assert (= (and start!105262 res!835439) b!1253169))

(assert (= (and b!1253169 res!835440) b!1253170))

(assert (= (and b!1253170 res!835438) b!1253173))

(assert (= (and b!1253173 res!835441) b!1253174))

(assert (= (and b!1253171 condMapEmpty!49300) mapIsEmpty!49300))

(assert (= (and b!1253171 (not condMapEmpty!49300)) mapNonEmpty!49300))

(get-info :version)

(assert (= (and mapNonEmpty!49300 ((_ is ValueCellFull!15080) mapValue!49300)) b!1253175))

(assert (= (and b!1253171 ((_ is ValueCellFull!15080) mapDefault!49300)) b!1253172))

(assert (= start!105262 b!1253171))

(declare-fun m!1154193 () Bool)

(assert (=> b!1253173 m!1154193))

(declare-fun m!1154195 () Bool)

(assert (=> start!105262 m!1154195))

(declare-fun m!1154197 () Bool)

(assert (=> start!105262 m!1154197))

(declare-fun m!1154199 () Bool)

(assert (=> start!105262 m!1154199))

(declare-fun m!1154201 () Bool)

(assert (=> mapNonEmpty!49300 m!1154201))

(declare-fun m!1154203 () Bool)

(assert (=> b!1253170 m!1154203))

(declare-fun m!1154205 () Bool)

(assert (=> b!1253174 m!1154205))

(declare-fun m!1154207 () Bool)

(assert (=> b!1253174 m!1154207))

(declare-fun m!1154209 () Bool)

(assert (=> b!1253174 m!1154209))

(check-sat (not mapNonEmpty!49300) (not b!1253173) tp_is_empty!31687 (not b!1253170) (not start!105262) (not b!1253174) b_and!44583 (not b_next!26785))
(check-sat b_and!44583 (not b_next!26785))
