; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105404 () Bool)

(assert start!105404)

(declare-fun b_free!27063 () Bool)

(declare-fun b_next!27063 () Bool)

(assert (=> start!105404 (= b_free!27063 (not b_next!27063))))

(declare-fun tp!94703 () Bool)

(declare-fun b_and!44909 () Bool)

(assert (=> start!105404 (= tp!94703 b_and!44909)))

(declare-fun b!1255767 () Bool)

(declare-fun e!713756 () Bool)

(declare-fun e!713757 () Bool)

(assert (=> b!1255767 (= e!713756 (not e!713757))))

(declare-fun res!837172 () Bool)

(assert (=> b!1255767 (=> res!837172 e!713757)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255767 (= res!837172 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47985 0))(
  ( (V!47986 (val!16045 Int)) )
))
(declare-datatypes ((tuple2!20718 0))(
  ( (tuple2!20719 (_1!10370 (_ BitVec 64)) (_2!10370 V!47985)) )
))
(declare-datatypes ((List!27939 0))(
  ( (Nil!27936) (Cons!27935 (h!29144 tuple2!20718) (t!41426 List!27939)) )
))
(declare-datatypes ((ListLongMap!18591 0))(
  ( (ListLongMap!18592 (toList!9311 List!27939)) )
))
(declare-fun lt!567745 () ListLongMap!18591)

(declare-fun lt!567746 () ListLongMap!18591)

(assert (=> b!1255767 (= lt!567745 lt!567746)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41808 0))(
  ( (Unit!41809) )
))
(declare-fun lt!567744 () Unit!41808)

(declare-fun minValueAfter!43 () V!47985)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47985)

(declare-datatypes ((array!81572 0))(
  ( (array!81573 (arr!39345 (Array (_ BitVec 32) (_ BitVec 64))) (size!39881 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81572)

(declare-datatypes ((ValueCell!15219 0))(
  ( (ValueCellFull!15219 (v!18745 V!47985)) (EmptyCell!15219) )
))
(declare-datatypes ((array!81574 0))(
  ( (array!81575 (arr!39346 (Array (_ BitVec 32) ValueCell!15219)) (size!39882 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81574)

(declare-fun minValueBefore!43 () V!47985)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1060 (array!81572 array!81574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47985 V!47985 V!47985 V!47985 (_ BitVec 32) Int) Unit!41808)

(assert (=> b!1255767 (= lt!567744 (lemmaNoChangeToArrayThenSameMapNoExtras!1060 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5696 (array!81572 array!81574 (_ BitVec 32) (_ BitVec 32) V!47985 V!47985 (_ BitVec 32) Int) ListLongMap!18591)

(assert (=> b!1255767 (= lt!567746 (getCurrentListMapNoExtraKeys!5696 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255767 (= lt!567745 (getCurrentListMapNoExtraKeys!5696 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255768 () Bool)

(declare-fun e!713760 () Bool)

(declare-fun e!713761 () Bool)

(declare-fun mapRes!49732 () Bool)

(assert (=> b!1255768 (= e!713760 (and e!713761 mapRes!49732))))

(declare-fun condMapEmpty!49732 () Bool)

(declare-fun mapDefault!49732 () ValueCell!15219)

(assert (=> b!1255768 (= condMapEmpty!49732 (= (arr!39346 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15219)) mapDefault!49732)))))

(declare-fun b!1255769 () Bool)

(declare-fun e!713758 () Bool)

(assert (=> b!1255769 (= e!713757 e!713758)))

(declare-fun res!837170 () Bool)

(assert (=> b!1255769 (=> res!837170 e!713758)))

(declare-fun lt!567748 () ListLongMap!18591)

(declare-fun contains!7530 (ListLongMap!18591 (_ BitVec 64)) Bool)

(assert (=> b!1255769 (= res!837170 (contains!7530 lt!567748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4536 (array!81572 array!81574 (_ BitVec 32) (_ BitVec 32) V!47985 V!47985 (_ BitVec 32) Int) ListLongMap!18591)

(assert (=> b!1255769 (= lt!567748 (getCurrentListMap!4536 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49732 () Bool)

(declare-fun tp!94702 () Bool)

(declare-fun e!713762 () Bool)

(assert (=> mapNonEmpty!49732 (= mapRes!49732 (and tp!94702 e!713762))))

(declare-fun mapKey!49732 () (_ BitVec 32))

(declare-fun mapValue!49732 () ValueCell!15219)

(declare-fun mapRest!49732 () (Array (_ BitVec 32) ValueCell!15219))

(assert (=> mapNonEmpty!49732 (= (arr!39346 _values!914) (store mapRest!49732 mapKey!49732 mapValue!49732))))

(declare-fun b!1255770 () Bool)

(declare-fun res!837168 () Bool)

(assert (=> b!1255770 (=> (not res!837168) (not e!713756))))

(assert (=> b!1255770 (= res!837168 (and (= (size!39882 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39881 _keys!1118) (size!39882 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837171 () Bool)

(assert (=> start!105404 (=> (not res!837171) (not e!713756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105404 (= res!837171 (validMask!0 mask!1466))))

(assert (=> start!105404 e!713756))

(assert (=> start!105404 true))

(assert (=> start!105404 tp!94703))

(declare-fun tp_is_empty!31965 () Bool)

(assert (=> start!105404 tp_is_empty!31965))

(declare-fun array_inv!29979 (array!81572) Bool)

(assert (=> start!105404 (array_inv!29979 _keys!1118)))

(declare-fun array_inv!29980 (array!81574) Bool)

(assert (=> start!105404 (and (array_inv!29980 _values!914) e!713760)))

(declare-fun b!1255771 () Bool)

(declare-fun res!837173 () Bool)

(assert (=> b!1255771 (=> (not res!837173) (not e!713756))))

(declare-datatypes ((List!27940 0))(
  ( (Nil!27937) (Cons!27936 (h!29145 (_ BitVec 64)) (t!41427 List!27940)) )
))
(declare-fun arrayNoDuplicates!0 (array!81572 (_ BitVec 32) List!27940) Bool)

(assert (=> b!1255771 (= res!837173 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27937))))

(declare-fun b!1255772 () Bool)

(assert (=> b!1255772 (= e!713761 tp_is_empty!31965)))

(declare-fun b!1255773 () Bool)

(assert (=> b!1255773 (= e!713758 true)))

(declare-fun -!2065 (ListLongMap!18591 (_ BitVec 64)) ListLongMap!18591)

(assert (=> b!1255773 (= (-!2065 lt!567748 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567748)))

(declare-fun lt!567747 () Unit!41808)

(declare-fun removeNotPresentStillSame!118 (ListLongMap!18591 (_ BitVec 64)) Unit!41808)

(assert (=> b!1255773 (= lt!567747 (removeNotPresentStillSame!118 lt!567748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!49732 () Bool)

(assert (=> mapIsEmpty!49732 mapRes!49732))

(declare-fun b!1255774 () Bool)

(declare-fun res!837169 () Bool)

(assert (=> b!1255774 (=> (not res!837169) (not e!713756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81572 (_ BitVec 32)) Bool)

(assert (=> b!1255774 (= res!837169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255775 () Bool)

(assert (=> b!1255775 (= e!713762 tp_is_empty!31965)))

(assert (= (and start!105404 res!837171) b!1255770))

(assert (= (and b!1255770 res!837168) b!1255774))

(assert (= (and b!1255774 res!837169) b!1255771))

(assert (= (and b!1255771 res!837173) b!1255767))

(assert (= (and b!1255767 (not res!837172)) b!1255769))

(assert (= (and b!1255769 (not res!837170)) b!1255773))

(assert (= (and b!1255768 condMapEmpty!49732) mapIsEmpty!49732))

(assert (= (and b!1255768 (not condMapEmpty!49732)) mapNonEmpty!49732))

(get-info :version)

(assert (= (and mapNonEmpty!49732 ((_ is ValueCellFull!15219) mapValue!49732)) b!1255775))

(assert (= (and b!1255768 ((_ is ValueCellFull!15219) mapDefault!49732)) b!1255772))

(assert (= start!105404 b!1255768))

(declare-fun m!1156465 () Bool)

(assert (=> start!105404 m!1156465))

(declare-fun m!1156467 () Bool)

(assert (=> start!105404 m!1156467))

(declare-fun m!1156469 () Bool)

(assert (=> start!105404 m!1156469))

(declare-fun m!1156471 () Bool)

(assert (=> b!1255773 m!1156471))

(declare-fun m!1156473 () Bool)

(assert (=> b!1255773 m!1156473))

(declare-fun m!1156475 () Bool)

(assert (=> b!1255771 m!1156475))

(declare-fun m!1156477 () Bool)

(assert (=> b!1255769 m!1156477))

(declare-fun m!1156479 () Bool)

(assert (=> b!1255769 m!1156479))

(declare-fun m!1156481 () Bool)

(assert (=> b!1255774 m!1156481))

(declare-fun m!1156483 () Bool)

(assert (=> mapNonEmpty!49732 m!1156483))

(declare-fun m!1156485 () Bool)

(assert (=> b!1255767 m!1156485))

(declare-fun m!1156487 () Bool)

(assert (=> b!1255767 m!1156487))

(declare-fun m!1156489 () Bool)

(assert (=> b!1255767 m!1156489))

(check-sat (not b!1255771) (not mapNonEmpty!49732) (not b!1255774) tp_is_empty!31965 (not b!1255769) (not b!1255773) (not b!1255767) (not b_next!27063) (not start!105404) b_and!44909)
(check-sat b_and!44909 (not b_next!27063))
