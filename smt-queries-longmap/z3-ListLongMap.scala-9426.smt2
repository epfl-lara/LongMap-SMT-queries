; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112164 () Bool)

(assert start!112164)

(declare-fun b_free!30559 () Bool)

(declare-fun b_next!30559 () Bool)

(assert (=> start!112164 (= b_free!30559 (not b_next!30559))))

(declare-fun tp!107314 () Bool)

(declare-fun b_and!49191 () Bool)

(assert (=> start!112164 (= tp!107314 b_and!49191)))

(declare-fun b!1328330 () Bool)

(declare-fun res!881358 () Bool)

(declare-fun e!757359 () Bool)

(assert (=> b!1328330 (=> (not res!881358) (not e!757359))))

(declare-datatypes ((array!89767 0))(
  ( (array!89768 (arr!43350 (Array (_ BitVec 32) (_ BitVec 64))) (size!43902 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89767)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89767 (_ BitVec 32)) Bool)

(assert (=> b!1328330 (= res!881358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328331 () Bool)

(declare-fun e!757360 () Bool)

(declare-fun tp_is_empty!36469 () Bool)

(assert (=> b!1328331 (= e!757360 tp_is_empty!36469)))

(declare-fun b!1328332 () Bool)

(declare-fun res!881356 () Bool)

(assert (=> b!1328332 (=> (not res!881356) (not e!757359))))

(declare-datatypes ((V!53729 0))(
  ( (V!53730 (val!18309 Int)) )
))
(declare-datatypes ((ValueCell!17336 0))(
  ( (ValueCellFull!17336 (v!20945 V!53729)) (EmptyCell!17336) )
))
(declare-datatypes ((array!89769 0))(
  ( (array!89770 (arr!43351 (Array (_ BitVec 32) ValueCell!17336)) (size!43903 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89769)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328332 (= res!881356 (and (= (size!43903 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43902 _keys!1590) (size!43903 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328333 () Bool)

(declare-fun res!881355 () Bool)

(assert (=> b!1328333 (=> (not res!881355) (not e!757359))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328333 (= res!881355 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43902 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328334 () Bool)

(declare-fun res!881357 () Bool)

(assert (=> b!1328334 (=> (not res!881357) (not e!757359))))

(declare-datatypes ((List!30774 0))(
  ( (Nil!30771) (Cons!30770 (h!31979 (_ BitVec 64)) (t!44772 List!30774)) )
))
(declare-fun arrayNoDuplicates!0 (array!89767 (_ BitVec 32) List!30774) Bool)

(assert (=> b!1328334 (= res!881357 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30771))))

(declare-fun b!1328335 () Bool)

(assert (=> b!1328335 (= e!757359 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53729)

(declare-fun zeroValue!1262 () V!53729)

(declare-fun lt!590650 () Bool)

(declare-datatypes ((tuple2!23626 0))(
  ( (tuple2!23627 (_1!11824 (_ BitVec 64)) (_2!11824 V!53729)) )
))
(declare-datatypes ((List!30775 0))(
  ( (Nil!30772) (Cons!30771 (h!31980 tuple2!23626) (t!44773 List!30775)) )
))
(declare-datatypes ((ListLongMap!21283 0))(
  ( (ListLongMap!21284 (toList!10657 List!30775)) )
))
(declare-fun contains!8749 (ListLongMap!21283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5529 (array!89767 array!89769 (_ BitVec 32) (_ BitVec 32) V!53729 V!53729 (_ BitVec 32) Int) ListLongMap!21283)

(assert (=> b!1328335 (= lt!590650 (contains!8749 (getCurrentListMap!5529 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56377 () Bool)

(declare-fun mapRes!56377 () Bool)

(declare-fun tp!107315 () Bool)

(assert (=> mapNonEmpty!56377 (= mapRes!56377 (and tp!107315 e!757360))))

(declare-fun mapRest!56377 () (Array (_ BitVec 32) ValueCell!17336))

(declare-fun mapKey!56377 () (_ BitVec 32))

(declare-fun mapValue!56377 () ValueCell!17336)

(assert (=> mapNonEmpty!56377 (= (arr!43351 _values!1320) (store mapRest!56377 mapKey!56377 mapValue!56377))))

(declare-fun res!881359 () Bool)

(assert (=> start!112164 (=> (not res!881359) (not e!757359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112164 (= res!881359 (validMask!0 mask!1998))))

(assert (=> start!112164 e!757359))

(declare-fun e!757362 () Bool)

(declare-fun array_inv!32881 (array!89769) Bool)

(assert (=> start!112164 (and (array_inv!32881 _values!1320) e!757362)))

(assert (=> start!112164 true))

(declare-fun array_inv!32882 (array!89767) Bool)

(assert (=> start!112164 (array_inv!32882 _keys!1590)))

(assert (=> start!112164 tp!107314))

(assert (=> start!112164 tp_is_empty!36469))

(declare-fun b!1328336 () Bool)

(declare-fun e!757361 () Bool)

(assert (=> b!1328336 (= e!757361 tp_is_empty!36469)))

(declare-fun mapIsEmpty!56377 () Bool)

(assert (=> mapIsEmpty!56377 mapRes!56377))

(declare-fun b!1328337 () Bool)

(assert (=> b!1328337 (= e!757362 (and e!757361 mapRes!56377))))

(declare-fun condMapEmpty!56377 () Bool)

(declare-fun mapDefault!56377 () ValueCell!17336)

(assert (=> b!1328337 (= condMapEmpty!56377 (= (arr!43351 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17336)) mapDefault!56377)))))

(assert (= (and start!112164 res!881359) b!1328332))

(assert (= (and b!1328332 res!881356) b!1328330))

(assert (= (and b!1328330 res!881358) b!1328334))

(assert (= (and b!1328334 res!881357) b!1328333))

(assert (= (and b!1328333 res!881355) b!1328335))

(assert (= (and b!1328337 condMapEmpty!56377) mapIsEmpty!56377))

(assert (= (and b!1328337 (not condMapEmpty!56377)) mapNonEmpty!56377))

(get-info :version)

(assert (= (and mapNonEmpty!56377 ((_ is ValueCellFull!17336) mapValue!56377)) b!1328331))

(assert (= (and b!1328337 ((_ is ValueCellFull!17336) mapDefault!56377)) b!1328336))

(assert (= start!112164 b!1328337))

(declare-fun m!1216869 () Bool)

(assert (=> b!1328335 m!1216869))

(assert (=> b!1328335 m!1216869))

(declare-fun m!1216871 () Bool)

(assert (=> b!1328335 m!1216871))

(declare-fun m!1216873 () Bool)

(assert (=> b!1328330 m!1216873))

(declare-fun m!1216875 () Bool)

(assert (=> b!1328334 m!1216875))

(declare-fun m!1216877 () Bool)

(assert (=> start!112164 m!1216877))

(declare-fun m!1216879 () Bool)

(assert (=> start!112164 m!1216879))

(declare-fun m!1216881 () Bool)

(assert (=> start!112164 m!1216881))

(declare-fun m!1216883 () Bool)

(assert (=> mapNonEmpty!56377 m!1216883))

(check-sat b_and!49191 (not b!1328330) (not b!1328334) (not b_next!30559) (not b!1328335) (not mapNonEmpty!56377) tp_is_empty!36469 (not start!112164))
(check-sat b_and!49191 (not b_next!30559))
