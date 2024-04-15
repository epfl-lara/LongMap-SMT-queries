; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113450 () Bool)

(assert start!113450)

(declare-fun b_free!31501 () Bool)

(declare-fun b_next!31501 () Bool)

(assert (=> start!113450 (= b_free!31501 (not b_next!31501))))

(declare-fun tp!110308 () Bool)

(declare-fun b_and!50771 () Bool)

(assert (=> start!113450 (= tp!110308 b_and!50771)))

(declare-fun b!1346719 () Bool)

(declare-fun res!893635 () Bool)

(declare-fun e!766283 () Bool)

(assert (=> b!1346719 (=> (not res!893635) (not e!766283))))

(declare-datatypes ((array!91781 0))(
  ( (array!91782 (arr!44347 (Array (_ BitVec 32) (_ BitVec 64))) (size!44899 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91781)

(declare-datatypes ((List!31471 0))(
  ( (Nil!31468) (Cons!31467 (h!32676 (_ BitVec 64)) (t!46053 List!31471)) )
))
(declare-fun arrayNoDuplicates!0 (array!91781 (_ BitVec 32) List!31471) Bool)

(assert (=> b!1346719 (= res!893635 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31468))))

(declare-fun mapNonEmpty!57958 () Bool)

(declare-fun mapRes!57958 () Bool)

(declare-fun tp!110309 () Bool)

(declare-fun e!766285 () Bool)

(assert (=> mapNonEmpty!57958 (= mapRes!57958 (and tp!110309 e!766285))))

(declare-fun mapKey!57958 () (_ BitVec 32))

(declare-datatypes ((V!55105 0))(
  ( (V!55106 (val!18825 Int)) )
))
(declare-datatypes ((ValueCell!17852 0))(
  ( (ValueCellFull!17852 (v!21472 V!55105)) (EmptyCell!17852) )
))
(declare-fun mapValue!57958 () ValueCell!17852)

(declare-fun mapRest!57958 () (Array (_ BitVec 32) ValueCell!17852))

(declare-datatypes ((array!91783 0))(
  ( (array!91784 (arr!44348 (Array (_ BitVec 32) ValueCell!17852)) (size!44900 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91783)

(assert (=> mapNonEmpty!57958 (= (arr!44348 _values!1303) (store mapRest!57958 mapKey!57958 mapValue!57958))))

(declare-fun mapIsEmpty!57958 () Bool)

(assert (=> mapIsEmpty!57958 mapRes!57958))

(declare-fun b!1346720 () Bool)

(declare-fun tp_is_empty!37501 () Bool)

(assert (=> b!1346720 (= e!766285 tp_is_empty!37501)))

(declare-fun b!1346721 () Bool)

(declare-fun e!766284 () Bool)

(declare-fun e!766282 () Bool)

(assert (=> b!1346721 (= e!766284 (and e!766282 mapRes!57958))))

(declare-fun condMapEmpty!57958 () Bool)

(declare-fun mapDefault!57958 () ValueCell!17852)

(assert (=> b!1346721 (= condMapEmpty!57958 (= (arr!44348 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17852)) mapDefault!57958)))))

(declare-fun b!1346722 () Bool)

(declare-fun res!893627 () Bool)

(assert (=> b!1346722 (=> (not res!893627) (not e!766283))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346722 (= res!893627 (not (= (select (arr!44347 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346723 () Bool)

(declare-fun res!893629 () Bool)

(assert (=> b!1346723 (=> (not res!893629) (not e!766283))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91781 (_ BitVec 32)) Bool)

(assert (=> b!1346723 (= res!893629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!893631 () Bool)

(assert (=> start!113450 (=> (not res!893631) (not e!766283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113450 (= res!893631 (validMask!0 mask!1977))))

(assert (=> start!113450 e!766283))

(assert (=> start!113450 tp_is_empty!37501))

(assert (=> start!113450 true))

(declare-fun array_inv!33607 (array!91781) Bool)

(assert (=> start!113450 (array_inv!33607 _keys!1571)))

(declare-fun array_inv!33608 (array!91783) Bool)

(assert (=> start!113450 (and (array_inv!33608 _values!1303) e!766284)))

(assert (=> start!113450 tp!110308))

(declare-fun b!1346724 () Bool)

(declare-fun res!893633 () Bool)

(assert (=> b!1346724 (=> (not res!893633) (not e!766283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346724 (= res!893633 (validKeyInArray!0 (select (arr!44347 _keys!1571) from!1960)))))

(declare-fun b!1346725 () Bool)

(declare-fun res!893632 () Bool)

(assert (=> b!1346725 (=> (not res!893632) (not e!766283))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346725 (= res!893632 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1346726 () Bool)

(declare-fun res!893634 () Bool)

(assert (=> b!1346726 (=> (not res!893634) (not e!766283))))

(assert (=> b!1346726 (= res!893634 (and (= (size!44900 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44899 _keys!1571) (size!44900 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346727 () Bool)

(assert (=> b!1346727 (= e!766283 false)))

(declare-fun minValue!1245 () V!55105)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55105)

(declare-datatypes ((tuple2!24336 0))(
  ( (tuple2!24337 (_1!12179 (_ BitVec 64)) (_2!12179 V!55105)) )
))
(declare-datatypes ((List!31472 0))(
  ( (Nil!31469) (Cons!31468 (h!32677 tuple2!24336) (t!46054 List!31472)) )
))
(declare-datatypes ((ListLongMap!21993 0))(
  ( (ListLongMap!21994 (toList!11012 List!31472)) )
))
(declare-fun lt!595359 () ListLongMap!21993)

(declare-fun getCurrentListMapNoExtraKeys!6508 (array!91781 array!91783 (_ BitVec 32) (_ BitVec 32) V!55105 V!55105 (_ BitVec 32) Int) ListLongMap!21993)

(assert (=> b!1346727 (= lt!595359 (getCurrentListMapNoExtraKeys!6508 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1346728 () Bool)

(declare-fun res!893630 () Bool)

(assert (=> b!1346728 (=> (not res!893630) (not e!766283))))

(assert (=> b!1346728 (= res!893630 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44899 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346729 () Bool)

(declare-fun res!893628 () Bool)

(assert (=> b!1346729 (=> (not res!893628) (not e!766283))))

(declare-fun contains!9117 (ListLongMap!21993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5851 (array!91781 array!91783 (_ BitVec 32) (_ BitVec 32) V!55105 V!55105 (_ BitVec 32) Int) ListLongMap!21993)

(assert (=> b!1346729 (= res!893628 (contains!9117 (getCurrentListMap!5851 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346730 () Bool)

(assert (=> b!1346730 (= e!766282 tp_is_empty!37501)))

(assert (= (and start!113450 res!893631) b!1346726))

(assert (= (and b!1346726 res!893634) b!1346723))

(assert (= (and b!1346723 res!893629) b!1346719))

(assert (= (and b!1346719 res!893635) b!1346728))

(assert (= (and b!1346728 res!893630) b!1346729))

(assert (= (and b!1346729 res!893628) b!1346722))

(assert (= (and b!1346722 res!893627) b!1346724))

(assert (= (and b!1346724 res!893633) b!1346725))

(assert (= (and b!1346725 res!893632) b!1346727))

(assert (= (and b!1346721 condMapEmpty!57958) mapIsEmpty!57958))

(assert (= (and b!1346721 (not condMapEmpty!57958)) mapNonEmpty!57958))

(get-info :version)

(assert (= (and mapNonEmpty!57958 ((_ is ValueCellFull!17852) mapValue!57958)) b!1346720))

(assert (= (and b!1346721 ((_ is ValueCellFull!17852) mapDefault!57958)) b!1346730))

(assert (= start!113450 b!1346721))

(declare-fun m!1233295 () Bool)

(assert (=> b!1346724 m!1233295))

(assert (=> b!1346724 m!1233295))

(declare-fun m!1233297 () Bool)

(assert (=> b!1346724 m!1233297))

(assert (=> b!1346722 m!1233295))

(declare-fun m!1233299 () Bool)

(assert (=> start!113450 m!1233299))

(declare-fun m!1233301 () Bool)

(assert (=> start!113450 m!1233301))

(declare-fun m!1233303 () Bool)

(assert (=> start!113450 m!1233303))

(declare-fun m!1233305 () Bool)

(assert (=> b!1346727 m!1233305))

(declare-fun m!1233307 () Bool)

(assert (=> b!1346723 m!1233307))

(declare-fun m!1233309 () Bool)

(assert (=> mapNonEmpty!57958 m!1233309))

(declare-fun m!1233311 () Bool)

(assert (=> b!1346729 m!1233311))

(assert (=> b!1346729 m!1233311))

(declare-fun m!1233313 () Bool)

(assert (=> b!1346729 m!1233313))

(declare-fun m!1233315 () Bool)

(assert (=> b!1346719 m!1233315))

(check-sat (not mapNonEmpty!57958) b_and!50771 (not b!1346723) (not b!1346727) (not b_next!31501) (not b!1346724) tp_is_empty!37501 (not b!1346729) (not b!1346719) (not start!113450))
(check-sat b_and!50771 (not b_next!31501))
