; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105852 () Bool)

(assert start!105852)

(declare-fun b_free!27397 () Bool)

(declare-fun b_next!27397 () Bool)

(assert (=> start!105852 (= b_free!27397 (not b_next!27397))))

(declare-fun tp!95723 () Bool)

(declare-fun b_and!45287 () Bool)

(assert (=> start!105852 (= tp!95723 b_and!45287)))

(declare-fun mapIsEmpty!50251 () Bool)

(declare-fun mapRes!50251 () Bool)

(assert (=> mapIsEmpty!50251 mapRes!50251))

(declare-fun b!1260834 () Bool)

(declare-fun res!840236 () Bool)

(declare-fun e!717529 () Bool)

(assert (=> b!1260834 (=> (not res!840236) (not e!717529))))

(declare-datatypes ((array!82141 0))(
  ( (array!82142 (arr!39624 (Array (_ BitVec 32) (_ BitVec 64))) (size!40162 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82141)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82141 (_ BitVec 32)) Bool)

(assert (=> b!1260834 (= res!840236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260835 () Bool)

(assert (=> b!1260835 (= e!717529 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48431 0))(
  ( (V!48432 (val!16212 Int)) )
))
(declare-fun minValueAfter!43 () V!48431)

(declare-datatypes ((tuple2!21052 0))(
  ( (tuple2!21053 (_1!10537 (_ BitVec 64)) (_2!10537 V!48431)) )
))
(declare-datatypes ((List!28252 0))(
  ( (Nil!28249) (Cons!28248 (h!29457 tuple2!21052) (t!41742 List!28252)) )
))
(declare-datatypes ((ListLongMap!18925 0))(
  ( (ListLongMap!18926 (toList!9478 List!28252)) )
))
(declare-fun lt!571300 () ListLongMap!18925)

(declare-fun zeroValue!871 () V!48431)

(declare-datatypes ((ValueCell!15386 0))(
  ( (ValueCellFull!15386 (v!18915 V!48431)) (EmptyCell!15386) )
))
(declare-datatypes ((array!82143 0))(
  ( (array!82144 (arr!39625 (Array (_ BitVec 32) ValueCell!15386)) (size!40163 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82143)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5847 (array!82141 array!82143 (_ BitVec 32) (_ BitVec 32) V!48431 V!48431 (_ BitVec 32) Int) ListLongMap!18925)

(assert (=> b!1260835 (= lt!571300 (getCurrentListMapNoExtraKeys!5847 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48431)

(declare-fun lt!571299 () ListLongMap!18925)

(assert (=> b!1260835 (= lt!571299 (getCurrentListMapNoExtraKeys!5847 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260836 () Bool)

(declare-fun res!840235 () Bool)

(assert (=> b!1260836 (=> (not res!840235) (not e!717529))))

(declare-datatypes ((List!28253 0))(
  ( (Nil!28250) (Cons!28249 (h!29458 (_ BitVec 64)) (t!41743 List!28253)) )
))
(declare-fun arrayNoDuplicates!0 (array!82141 (_ BitVec 32) List!28253) Bool)

(assert (=> b!1260836 (= res!840235 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28250))))

(declare-fun b!1260837 () Bool)

(declare-fun e!717530 () Bool)

(declare-fun tp_is_empty!32299 () Bool)

(assert (=> b!1260837 (= e!717530 tp_is_empty!32299)))

(declare-fun res!840237 () Bool)

(assert (=> start!105852 (=> (not res!840237) (not e!717529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105852 (= res!840237 (validMask!0 mask!1466))))

(assert (=> start!105852 e!717529))

(assert (=> start!105852 true))

(assert (=> start!105852 tp!95723))

(assert (=> start!105852 tp_is_empty!32299))

(declare-fun array_inv!30315 (array!82141) Bool)

(assert (=> start!105852 (array_inv!30315 _keys!1118)))

(declare-fun e!717526 () Bool)

(declare-fun array_inv!30316 (array!82143) Bool)

(assert (=> start!105852 (and (array_inv!30316 _values!914) e!717526)))

(declare-fun b!1260838 () Bool)

(declare-fun res!840234 () Bool)

(assert (=> b!1260838 (=> (not res!840234) (not e!717529))))

(assert (=> b!1260838 (= res!840234 (and (= (size!40163 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40162 _keys!1118) (size!40163 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260839 () Bool)

(declare-fun e!717528 () Bool)

(assert (=> b!1260839 (= e!717526 (and e!717528 mapRes!50251))))

(declare-fun condMapEmpty!50251 () Bool)

(declare-fun mapDefault!50251 () ValueCell!15386)

(assert (=> b!1260839 (= condMapEmpty!50251 (= (arr!39625 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15386)) mapDefault!50251)))))

(declare-fun mapNonEmpty!50251 () Bool)

(declare-fun tp!95722 () Bool)

(assert (=> mapNonEmpty!50251 (= mapRes!50251 (and tp!95722 e!717530))))

(declare-fun mapRest!50251 () (Array (_ BitVec 32) ValueCell!15386))

(declare-fun mapKey!50251 () (_ BitVec 32))

(declare-fun mapValue!50251 () ValueCell!15386)

(assert (=> mapNonEmpty!50251 (= (arr!39625 _values!914) (store mapRest!50251 mapKey!50251 mapValue!50251))))

(declare-fun b!1260840 () Bool)

(assert (=> b!1260840 (= e!717528 tp_is_empty!32299)))

(assert (= (and start!105852 res!840237) b!1260838))

(assert (= (and b!1260838 res!840234) b!1260834))

(assert (= (and b!1260834 res!840236) b!1260836))

(assert (= (and b!1260836 res!840235) b!1260835))

(assert (= (and b!1260839 condMapEmpty!50251) mapIsEmpty!50251))

(assert (= (and b!1260839 (not condMapEmpty!50251)) mapNonEmpty!50251))

(get-info :version)

(assert (= (and mapNonEmpty!50251 ((_ is ValueCellFull!15386) mapValue!50251)) b!1260837))

(assert (= (and b!1260839 ((_ is ValueCellFull!15386) mapDefault!50251)) b!1260840))

(assert (= start!105852 b!1260839))

(declare-fun m!1161145 () Bool)

(assert (=> b!1260834 m!1161145))

(declare-fun m!1161147 () Bool)

(assert (=> start!105852 m!1161147))

(declare-fun m!1161149 () Bool)

(assert (=> start!105852 m!1161149))

(declare-fun m!1161151 () Bool)

(assert (=> start!105852 m!1161151))

(declare-fun m!1161153 () Bool)

(assert (=> mapNonEmpty!50251 m!1161153))

(declare-fun m!1161155 () Bool)

(assert (=> b!1260836 m!1161155))

(declare-fun m!1161157 () Bool)

(assert (=> b!1260835 m!1161157))

(declare-fun m!1161159 () Bool)

(assert (=> b!1260835 m!1161159))

(check-sat tp_is_empty!32299 (not b_next!27397) (not b!1260836) (not start!105852) b_and!45287 (not b!1260834) (not mapNonEmpty!50251) (not b!1260835))
(check-sat b_and!45287 (not b_next!27397))
