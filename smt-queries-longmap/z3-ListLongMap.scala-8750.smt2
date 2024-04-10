; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106200 () Bool)

(assert start!106200)

(declare-fun b_free!27537 () Bool)

(declare-fun b_next!27537 () Bool)

(assert (=> start!106200 (= b_free!27537 (not b_next!27537))))

(declare-fun tp!96175 () Bool)

(declare-fun b_and!45569 () Bool)

(assert (=> start!106200 (= tp!96175 b_and!45569)))

(declare-fun mapNonEmpty!50494 () Bool)

(declare-fun mapRes!50494 () Bool)

(declare-fun tp!96176 () Bool)

(declare-fun e!719992 () Bool)

(assert (=> mapNonEmpty!50494 (= mapRes!50494 (and tp!96176 e!719992))))

(declare-datatypes ((V!48617 0))(
  ( (V!48618 (val!16282 Int)) )
))
(declare-datatypes ((ValueCell!15456 0))(
  ( (ValueCellFull!15456 (v!18996 V!48617)) (EmptyCell!15456) )
))
(declare-fun mapRest!50494 () (Array (_ BitVec 32) ValueCell!15456))

(declare-fun mapValue!50494 () ValueCell!15456)

(declare-fun mapKey!50494 () (_ BitVec 32))

(declare-datatypes ((array!82506 0))(
  ( (array!82507 (arr!39795 (Array (_ BitVec 32) ValueCell!15456)) (size!40331 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82506)

(assert (=> mapNonEmpty!50494 (= (arr!39795 _values!914) (store mapRest!50494 mapKey!50494 mapValue!50494))))

(declare-fun b!1264427 () Bool)

(declare-fun e!719988 () Bool)

(declare-fun e!719989 () Bool)

(assert (=> b!1264427 (= e!719988 (and e!719989 mapRes!50494))))

(declare-fun condMapEmpty!50494 () Bool)

(declare-fun mapDefault!50494 () ValueCell!15456)

(assert (=> b!1264427 (= condMapEmpty!50494 (= (arr!39795 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15456)) mapDefault!50494)))))

(declare-fun b!1264428 () Bool)

(declare-fun tp_is_empty!32439 () Bool)

(assert (=> b!1264428 (= e!719992 tp_is_empty!32439)))

(declare-datatypes ((tuple2!21082 0))(
  ( (tuple2!21083 (_1!10552 (_ BitVec 64)) (_2!10552 V!48617)) )
))
(declare-datatypes ((List!28272 0))(
  ( (Nil!28269) (Cons!28268 (h!29477 tuple2!21082) (t!41793 List!28272)) )
))
(declare-datatypes ((ListLongMap!18955 0))(
  ( (ListLongMap!18956 (toList!9493 List!28272)) )
))
(declare-fun lt!573771 () ListLongMap!18955)

(declare-fun e!719993 () Bool)

(declare-fun lt!573774 () ListLongMap!18955)

(declare-fun lt!573767 () tuple2!21082)

(declare-fun b!1264429 () Bool)

(declare-fun +!4263 (ListLongMap!18955 tuple2!21082) ListLongMap!18955)

(assert (=> b!1264429 (= e!719993 (= lt!573774 (+!4263 lt!573771 lt!573767)))))

(declare-fun b!1264430 () Bool)

(declare-fun res!842070 () Bool)

(declare-fun e!719990 () Bool)

(assert (=> b!1264430 (=> (not res!842070) (not e!719990))))

(declare-datatypes ((array!82508 0))(
  ( (array!82509 (arr!39796 (Array (_ BitVec 32) (_ BitVec 64))) (size!40332 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82508)

(declare-datatypes ((List!28273 0))(
  ( (Nil!28270) (Cons!28269 (h!29478 (_ BitVec 64)) (t!41794 List!28273)) )
))
(declare-fun arrayNoDuplicates!0 (array!82508 (_ BitVec 32) List!28273) Bool)

(assert (=> b!1264430 (= res!842070 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28270))))

(declare-fun b!1264431 () Bool)

(declare-fun e!719991 () Bool)

(assert (=> b!1264431 (= e!719991 true)))

(declare-fun lt!573772 () ListLongMap!18955)

(declare-fun lt!573765 () ListLongMap!18955)

(declare-fun -!2151 (ListLongMap!18955 (_ BitVec 64)) ListLongMap!18955)

(assert (=> b!1264431 (= lt!573772 (-!2151 lt!573765 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!573766 () ListLongMap!18955)

(declare-fun lt!573770 () ListLongMap!18955)

(assert (=> b!1264431 (= (-!2151 lt!573766 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573770)))

(declare-datatypes ((Unit!42141 0))(
  ( (Unit!42142) )
))
(declare-fun lt!573769 () Unit!42141)

(declare-fun minValueBefore!43 () V!48617)

(declare-fun addThenRemoveForNewKeyIsSame!383 (ListLongMap!18955 (_ BitVec 64) V!48617) Unit!42141)

(assert (=> b!1264431 (= lt!573769 (addThenRemoveForNewKeyIsSame!383 lt!573770 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1264431 e!719993))

(declare-fun res!842071 () Bool)

(assert (=> b!1264431 (=> (not res!842071) (not e!719993))))

(assert (=> b!1264431 (= res!842071 (= lt!573765 lt!573766))))

(assert (=> b!1264431 (= lt!573766 (+!4263 lt!573770 (tuple2!21083 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!573773 () ListLongMap!18955)

(assert (=> b!1264431 (= lt!573770 (+!4263 lt!573773 lt!573767))))

(declare-fun zeroValue!871 () V!48617)

(assert (=> b!1264431 (= lt!573767 (tuple2!21083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48617)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4660 (array!82508 array!82506 (_ BitVec 32) (_ BitVec 32) V!48617 V!48617 (_ BitVec 32) Int) ListLongMap!18955)

(assert (=> b!1264431 (= lt!573774 (getCurrentListMap!4660 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264431 (= lt!573765 (getCurrentListMap!4660 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264432 () Bool)

(declare-fun res!842072 () Bool)

(assert (=> b!1264432 (=> (not res!842072) (not e!719990))))

(assert (=> b!1264432 (= res!842072 (and (= (size!40331 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40332 _keys!1118) (size!40331 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!842074 () Bool)

(assert (=> start!106200 (=> (not res!842074) (not e!719990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106200 (= res!842074 (validMask!0 mask!1466))))

(assert (=> start!106200 e!719990))

(assert (=> start!106200 true))

(assert (=> start!106200 tp!96175))

(assert (=> start!106200 tp_is_empty!32439))

(declare-fun array_inv!30287 (array!82508) Bool)

(assert (=> start!106200 (array_inv!30287 _keys!1118)))

(declare-fun array_inv!30288 (array!82506) Bool)

(assert (=> start!106200 (and (array_inv!30288 _values!914) e!719988)))

(declare-fun b!1264433 () Bool)

(assert (=> b!1264433 (= e!719989 tp_is_empty!32439)))

(declare-fun mapIsEmpty!50494 () Bool)

(assert (=> mapIsEmpty!50494 mapRes!50494))

(declare-fun b!1264434 () Bool)

(assert (=> b!1264434 (= e!719990 (not e!719991))))

(declare-fun res!842073 () Bool)

(assert (=> b!1264434 (=> res!842073 e!719991)))

(assert (=> b!1264434 (= res!842073 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1264434 (= lt!573773 lt!573771)))

(declare-fun lt!573768 () Unit!42141)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1197 (array!82508 array!82506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48617 V!48617 V!48617 V!48617 (_ BitVec 32) Int) Unit!42141)

(assert (=> b!1264434 (= lt!573768 (lemmaNoChangeToArrayThenSameMapNoExtras!1197 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5855 (array!82508 array!82506 (_ BitVec 32) (_ BitVec 32) V!48617 V!48617 (_ BitVec 32) Int) ListLongMap!18955)

(assert (=> b!1264434 (= lt!573771 (getCurrentListMapNoExtraKeys!5855 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264434 (= lt!573773 (getCurrentListMapNoExtraKeys!5855 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264435 () Bool)

(declare-fun res!842069 () Bool)

(assert (=> b!1264435 (=> (not res!842069) (not e!719990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82508 (_ BitVec 32)) Bool)

(assert (=> b!1264435 (= res!842069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!106200 res!842074) b!1264432))

(assert (= (and b!1264432 res!842072) b!1264435))

(assert (= (and b!1264435 res!842069) b!1264430))

(assert (= (and b!1264430 res!842070) b!1264434))

(assert (= (and b!1264434 (not res!842073)) b!1264431))

(assert (= (and b!1264431 res!842071) b!1264429))

(assert (= (and b!1264427 condMapEmpty!50494) mapIsEmpty!50494))

(assert (= (and b!1264427 (not condMapEmpty!50494)) mapNonEmpty!50494))

(get-info :version)

(assert (= (and mapNonEmpty!50494 ((_ is ValueCellFull!15456) mapValue!50494)) b!1264428))

(assert (= (and b!1264427 ((_ is ValueCellFull!15456) mapDefault!50494)) b!1264433))

(assert (= start!106200 b!1264427))

(declare-fun m!1164979 () Bool)

(assert (=> mapNonEmpty!50494 m!1164979))

(declare-fun m!1164981 () Bool)

(assert (=> b!1264431 m!1164981))

(declare-fun m!1164983 () Bool)

(assert (=> b!1264431 m!1164983))

(declare-fun m!1164985 () Bool)

(assert (=> b!1264431 m!1164985))

(declare-fun m!1164987 () Bool)

(assert (=> b!1264431 m!1164987))

(declare-fun m!1164989 () Bool)

(assert (=> b!1264431 m!1164989))

(declare-fun m!1164991 () Bool)

(assert (=> b!1264431 m!1164991))

(declare-fun m!1164993 () Bool)

(assert (=> b!1264431 m!1164993))

(declare-fun m!1164995 () Bool)

(assert (=> b!1264435 m!1164995))

(declare-fun m!1164997 () Bool)

(assert (=> b!1264434 m!1164997))

(declare-fun m!1164999 () Bool)

(assert (=> b!1264434 m!1164999))

(declare-fun m!1165001 () Bool)

(assert (=> b!1264434 m!1165001))

(declare-fun m!1165003 () Bool)

(assert (=> start!106200 m!1165003))

(declare-fun m!1165005 () Bool)

(assert (=> start!106200 m!1165005))

(declare-fun m!1165007 () Bool)

(assert (=> start!106200 m!1165007))

(declare-fun m!1165009 () Bool)

(assert (=> b!1264429 m!1165009))

(declare-fun m!1165011 () Bool)

(assert (=> b!1264430 m!1165011))

(check-sat (not start!106200) (not b!1264435) (not mapNonEmpty!50494) (not b!1264431) (not b_next!27537) tp_is_empty!32439 (not b!1264429) (not b!1264434) (not b!1264430) b_and!45569)
(check-sat b_and!45569 (not b_next!27537))
