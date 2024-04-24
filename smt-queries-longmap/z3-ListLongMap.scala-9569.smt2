; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113500 () Bool)

(assert start!113500)

(declare-fun b_free!31327 () Bool)

(declare-fun b_next!31327 () Bool)

(assert (=> start!113500 (= b_free!31327 (not b_next!31327))))

(declare-fun tp!109786 () Bool)

(declare-fun b_and!50551 () Bool)

(assert (=> start!113500 (= tp!109786 b_and!50551)))

(declare-fun b!1345314 () Bool)

(declare-fun e!765775 () Bool)

(assert (=> b!1345314 (= e!765775 false)))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91607 0))(
  ( (array!91608 (arr!44255 (Array (_ BitVec 32) (_ BitVec 64))) (size!44806 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91607)

(declare-fun lt!595616 () Bool)

(declare-datatypes ((V!54873 0))(
  ( (V!54874 (val!18738 Int)) )
))
(declare-fun zeroValue!1245 () V!54873)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17765 0))(
  ( (ValueCellFull!17765 (v!21381 V!54873)) (EmptyCell!17765) )
))
(declare-datatypes ((array!91609 0))(
  ( (array!91610 (arr!44256 (Array (_ BitVec 32) ValueCell!17765)) (size!44807 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91609)

(declare-fun minValue!1245 () V!54873)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24190 0))(
  ( (tuple2!24191 (_1!12106 (_ BitVec 64)) (_2!12106 V!54873)) )
))
(declare-datatypes ((List!31333 0))(
  ( (Nil!31330) (Cons!31329 (h!32547 tuple2!24190) (t!45849 List!31333)) )
))
(declare-datatypes ((ListLongMap!21855 0))(
  ( (ListLongMap!21856 (toList!10943 List!31333)) )
))
(declare-fun contains!9131 (ListLongMap!21855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5887 (array!91607 array!91609 (_ BitVec 32) (_ BitVec 32) V!54873 V!54873 (_ BitVec 32) Int) ListLongMap!21855)

(assert (=> b!1345314 (= lt!595616 (contains!9131 (getCurrentListMap!5887 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345315 () Bool)

(declare-fun e!765772 () Bool)

(declare-fun e!765773 () Bool)

(declare-fun mapRes!57697 () Bool)

(assert (=> b!1345315 (= e!765772 (and e!765773 mapRes!57697))))

(declare-fun condMapEmpty!57697 () Bool)

(declare-fun mapDefault!57697 () ValueCell!17765)

(assert (=> b!1345315 (= condMapEmpty!57697 (= (arr!44256 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17765)) mapDefault!57697)))))

(declare-fun b!1345316 () Bool)

(declare-fun res!892252 () Bool)

(assert (=> b!1345316 (=> (not res!892252) (not e!765775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91607 (_ BitVec 32)) Bool)

(assert (=> b!1345316 (= res!892252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345317 () Bool)

(declare-fun res!892249 () Bool)

(assert (=> b!1345317 (=> (not res!892249) (not e!765775))))

(declare-datatypes ((List!31334 0))(
  ( (Nil!31331) (Cons!31330 (h!32548 (_ BitVec 64)) (t!45850 List!31334)) )
))
(declare-fun arrayNoDuplicates!0 (array!91607 (_ BitVec 32) List!31334) Bool)

(assert (=> b!1345317 (= res!892249 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31331))))

(declare-fun res!892251 () Bool)

(assert (=> start!113500 (=> (not res!892251) (not e!765775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113500 (= res!892251 (validMask!0 mask!1977))))

(assert (=> start!113500 e!765775))

(declare-fun tp_is_empty!37327 () Bool)

(assert (=> start!113500 tp_is_empty!37327))

(assert (=> start!113500 true))

(declare-fun array_inv!33625 (array!91607) Bool)

(assert (=> start!113500 (array_inv!33625 _keys!1571)))

(declare-fun array_inv!33626 (array!91609) Bool)

(assert (=> start!113500 (and (array_inv!33626 _values!1303) e!765772)))

(assert (=> start!113500 tp!109786))

(declare-fun mapNonEmpty!57697 () Bool)

(declare-fun tp!109785 () Bool)

(declare-fun e!765776 () Bool)

(assert (=> mapNonEmpty!57697 (= mapRes!57697 (and tp!109785 e!765776))))

(declare-fun mapRest!57697 () (Array (_ BitVec 32) ValueCell!17765))

(declare-fun mapValue!57697 () ValueCell!17765)

(declare-fun mapKey!57697 () (_ BitVec 32))

(assert (=> mapNonEmpty!57697 (= (arr!44256 _values!1303) (store mapRest!57697 mapKey!57697 mapValue!57697))))

(declare-fun b!1345318 () Bool)

(declare-fun res!892250 () Bool)

(assert (=> b!1345318 (=> (not res!892250) (not e!765775))))

(assert (=> b!1345318 (= res!892250 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44806 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345319 () Bool)

(assert (=> b!1345319 (= e!765773 tp_is_empty!37327)))

(declare-fun b!1345320 () Bool)

(assert (=> b!1345320 (= e!765776 tp_is_empty!37327)))

(declare-fun mapIsEmpty!57697 () Bool)

(assert (=> mapIsEmpty!57697 mapRes!57697))

(declare-fun b!1345321 () Bool)

(declare-fun res!892253 () Bool)

(assert (=> b!1345321 (=> (not res!892253) (not e!765775))))

(assert (=> b!1345321 (= res!892253 (and (= (size!44807 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44806 _keys!1571) (size!44807 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113500 res!892251) b!1345321))

(assert (= (and b!1345321 res!892253) b!1345316))

(assert (= (and b!1345316 res!892252) b!1345317))

(assert (= (and b!1345317 res!892249) b!1345318))

(assert (= (and b!1345318 res!892250) b!1345314))

(assert (= (and b!1345315 condMapEmpty!57697) mapIsEmpty!57697))

(assert (= (and b!1345315 (not condMapEmpty!57697)) mapNonEmpty!57697))

(get-info :version)

(assert (= (and mapNonEmpty!57697 ((_ is ValueCellFull!17765) mapValue!57697)) b!1345320))

(assert (= (and b!1345315 ((_ is ValueCellFull!17765) mapDefault!57697)) b!1345319))

(assert (= start!113500 b!1345315))

(declare-fun m!1233357 () Bool)

(assert (=> b!1345314 m!1233357))

(assert (=> b!1345314 m!1233357))

(declare-fun m!1233359 () Bool)

(assert (=> b!1345314 m!1233359))

(declare-fun m!1233361 () Bool)

(assert (=> start!113500 m!1233361))

(declare-fun m!1233363 () Bool)

(assert (=> start!113500 m!1233363))

(declare-fun m!1233365 () Bool)

(assert (=> start!113500 m!1233365))

(declare-fun m!1233367 () Bool)

(assert (=> b!1345317 m!1233367))

(declare-fun m!1233369 () Bool)

(assert (=> b!1345316 m!1233369))

(declare-fun m!1233371 () Bool)

(assert (=> mapNonEmpty!57697 m!1233371))

(check-sat (not mapNonEmpty!57697) (not b_next!31327) (not b!1345317) (not b!1345314) b_and!50551 (not start!113500) tp_is_empty!37327 (not b!1345316))
(check-sat b_and!50551 (not b_next!31327))
