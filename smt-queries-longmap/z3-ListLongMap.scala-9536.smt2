; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113302 () Bool)

(assert start!113302)

(declare-fun b_free!31129 () Bool)

(declare-fun b_next!31129 () Bool)

(assert (=> start!113302 (= b_free!31129 (not b_next!31129))))

(declare-fun tp!109192 () Bool)

(declare-fun b_and!50167 () Bool)

(assert (=> start!113302 (= tp!109192 b_and!50167)))

(declare-fun b!1341644 () Bool)

(declare-fun res!889664 () Bool)

(declare-fun e!764288 () Bool)

(assert (=> b!1341644 (=> (not res!889664) (not e!764288))))

(declare-datatypes ((array!91233 0))(
  ( (array!91234 (arr!44068 (Array (_ BitVec 32) (_ BitVec 64))) (size!44619 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91233)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341644 (= res!889664 (validKeyInArray!0 (select (arr!44068 _keys!1571) from!1960)))))

(declare-fun b!1341645 () Bool)

(declare-fun res!889663 () Bool)

(assert (=> b!1341645 (=> (not res!889663) (not e!764288))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1341645 (= res!889663 (not (= (select (arr!44068 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341646 () Bool)

(declare-fun res!889662 () Bool)

(assert (=> b!1341646 (=> (not res!889662) (not e!764288))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341646 (= res!889662 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44619 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341647 () Bool)

(declare-fun res!889657 () Bool)

(assert (=> b!1341647 (=> (not res!889657) (not e!764288))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91233 (_ BitVec 32)) Bool)

(assert (=> b!1341647 (= res!889657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341648 () Bool)

(declare-fun e!764287 () Bool)

(declare-fun tp_is_empty!37129 () Bool)

(assert (=> b!1341648 (= e!764287 tp_is_empty!37129)))

(declare-fun b!1341649 () Bool)

(declare-fun e!764290 () Bool)

(assert (=> b!1341649 (= e!764290 tp_is_empty!37129)))

(declare-fun mapIsEmpty!57400 () Bool)

(declare-fun mapRes!57400 () Bool)

(assert (=> mapIsEmpty!57400 mapRes!57400))

(declare-fun b!1341650 () Bool)

(declare-fun res!889660 () Bool)

(assert (=> b!1341650 (=> (not res!889660) (not e!764288))))

(declare-datatypes ((List!31206 0))(
  ( (Nil!31203) (Cons!31202 (h!32420 (_ BitVec 64)) (t!45538 List!31206)) )
))
(declare-fun arrayNoDuplicates!0 (array!91233 (_ BitVec 32) List!31206) Bool)

(assert (=> b!1341650 (= res!889660 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31203))))

(declare-fun b!1341651 () Bool)

(declare-fun res!889661 () Bool)

(assert (=> b!1341651 (=> (not res!889661) (not e!764288))))

(assert (=> b!1341651 (= res!889661 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57400 () Bool)

(declare-fun tp!109191 () Bool)

(assert (=> mapNonEmpty!57400 (= mapRes!57400 (and tp!109191 e!764287))))

(declare-datatypes ((V!54609 0))(
  ( (V!54610 (val!18639 Int)) )
))
(declare-datatypes ((ValueCell!17666 0))(
  ( (ValueCellFull!17666 (v!21282 V!54609)) (EmptyCell!17666) )
))
(declare-fun mapRest!57400 () (Array (_ BitVec 32) ValueCell!17666))

(declare-fun mapKey!57400 () (_ BitVec 32))

(declare-datatypes ((array!91235 0))(
  ( (array!91236 (arr!44069 (Array (_ BitVec 32) ValueCell!17666)) (size!44620 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91235)

(declare-fun mapValue!57400 () ValueCell!17666)

(assert (=> mapNonEmpty!57400 (= (arr!44069 _values!1303) (store mapRest!57400 mapKey!57400 mapValue!57400))))

(declare-fun res!889656 () Bool)

(assert (=> start!113302 (=> (not res!889656) (not e!764288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113302 (= res!889656 (validMask!0 mask!1977))))

(assert (=> start!113302 e!764288))

(assert (=> start!113302 tp_is_empty!37129))

(assert (=> start!113302 true))

(declare-fun array_inv!33489 (array!91233) Bool)

(assert (=> start!113302 (array_inv!33489 _keys!1571)))

(declare-fun e!764289 () Bool)

(declare-fun array_inv!33490 (array!91235) Bool)

(assert (=> start!113302 (and (array_inv!33490 _values!1303) e!764289)))

(assert (=> start!113302 tp!109192))

(declare-fun b!1341652 () Bool)

(assert (=> b!1341652 (= e!764288 false)))

(declare-fun minValue!1245 () V!54609)

(declare-fun lt!594455 () Bool)

(declare-fun zeroValue!1245 () V!54609)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24046 0))(
  ( (tuple2!24047 (_1!12034 (_ BitVec 64)) (_2!12034 V!54609)) )
))
(declare-datatypes ((List!31207 0))(
  ( (Nil!31204) (Cons!31203 (h!32421 tuple2!24046) (t!45539 List!31207)) )
))
(declare-datatypes ((ListLongMap!21711 0))(
  ( (ListLongMap!21712 (toList!10871 List!31207)) )
))
(declare-fun contains!9059 (ListLongMap!21711 (_ BitVec 64)) Bool)

(declare-fun +!4792 (ListLongMap!21711 tuple2!24046) ListLongMap!21711)

(declare-fun getCurrentListMapNoExtraKeys!6441 (array!91233 array!91235 (_ BitVec 32) (_ BitVec 32) V!54609 V!54609 (_ BitVec 32) Int) ListLongMap!21711)

(declare-fun get!22244 (ValueCell!17666 V!54609) V!54609)

(declare-fun dynLambda!3746 (Int (_ BitVec 64)) V!54609)

(assert (=> b!1341652 (= lt!594455 (contains!9059 (+!4792 (+!4792 (getCurrentListMapNoExtraKeys!6441 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24047 (select (arr!44068 _keys!1571) from!1960) (get!22244 (select (arr!44069 _values!1303) from!1960) (dynLambda!3746 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1341653 () Bool)

(declare-fun res!889659 () Bool)

(assert (=> b!1341653 (=> (not res!889659) (not e!764288))))

(assert (=> b!1341653 (= res!889659 (and (= (size!44620 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44619 _keys!1571) (size!44620 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341654 () Bool)

(assert (=> b!1341654 (= e!764289 (and e!764290 mapRes!57400))))

(declare-fun condMapEmpty!57400 () Bool)

(declare-fun mapDefault!57400 () ValueCell!17666)

(assert (=> b!1341654 (= condMapEmpty!57400 (= (arr!44069 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17666)) mapDefault!57400)))))

(declare-fun b!1341655 () Bool)

(declare-fun res!889658 () Bool)

(assert (=> b!1341655 (=> (not res!889658) (not e!764288))))

(declare-fun getCurrentListMap!5824 (array!91233 array!91235 (_ BitVec 32) (_ BitVec 32) V!54609 V!54609 (_ BitVec 32) Int) ListLongMap!21711)

(assert (=> b!1341655 (= res!889658 (contains!9059 (getCurrentListMap!5824 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113302 res!889656) b!1341653))

(assert (= (and b!1341653 res!889659) b!1341647))

(assert (= (and b!1341647 res!889657) b!1341650))

(assert (= (and b!1341650 res!889660) b!1341646))

(assert (= (and b!1341646 res!889662) b!1341655))

(assert (= (and b!1341655 res!889658) b!1341645))

(assert (= (and b!1341645 res!889663) b!1341644))

(assert (= (and b!1341644 res!889664) b!1341651))

(assert (= (and b!1341651 res!889661) b!1341652))

(assert (= (and b!1341654 condMapEmpty!57400) mapIsEmpty!57400))

(assert (= (and b!1341654 (not condMapEmpty!57400)) mapNonEmpty!57400))

(get-info :version)

(assert (= (and mapNonEmpty!57400 ((_ is ValueCellFull!17666) mapValue!57400)) b!1341648))

(assert (= (and b!1341654 ((_ is ValueCellFull!17666) mapDefault!57400)) b!1341649))

(assert (= start!113302 b!1341654))

(declare-fun b_lambda!24299 () Bool)

(assert (=> (not b_lambda!24299) (not b!1341652)))

(declare-fun t!45537 () Bool)

(declare-fun tb!12135 () Bool)

(assert (=> (and start!113302 (= defaultEntry!1306 defaultEntry!1306) t!45537) tb!12135))

(declare-fun result!25369 () Bool)

(assert (=> tb!12135 (= result!25369 tp_is_empty!37129)))

(assert (=> b!1341652 t!45537))

(declare-fun b_and!50169 () Bool)

(assert (= b_and!50167 (and (=> t!45537 result!25369) b_and!50169)))

(declare-fun m!1229709 () Bool)

(assert (=> b!1341647 m!1229709))

(declare-fun m!1229711 () Bool)

(assert (=> start!113302 m!1229711))

(declare-fun m!1229713 () Bool)

(assert (=> start!113302 m!1229713))

(declare-fun m!1229715 () Bool)

(assert (=> start!113302 m!1229715))

(declare-fun m!1229717 () Bool)

(assert (=> b!1341650 m!1229717))

(declare-fun m!1229719 () Bool)

(assert (=> b!1341655 m!1229719))

(assert (=> b!1341655 m!1229719))

(declare-fun m!1229721 () Bool)

(assert (=> b!1341655 m!1229721))

(declare-fun m!1229723 () Bool)

(assert (=> b!1341644 m!1229723))

(assert (=> b!1341644 m!1229723))

(declare-fun m!1229725 () Bool)

(assert (=> b!1341644 m!1229725))

(assert (=> b!1341645 m!1229723))

(declare-fun m!1229727 () Bool)

(assert (=> b!1341652 m!1229727))

(declare-fun m!1229729 () Bool)

(assert (=> b!1341652 m!1229729))

(declare-fun m!1229731 () Bool)

(assert (=> b!1341652 m!1229731))

(declare-fun m!1229733 () Bool)

(assert (=> b!1341652 m!1229733))

(declare-fun m!1229735 () Bool)

(assert (=> b!1341652 m!1229735))

(declare-fun m!1229737 () Bool)

(assert (=> b!1341652 m!1229737))

(assert (=> b!1341652 m!1229731))

(declare-fun m!1229739 () Bool)

(assert (=> b!1341652 m!1229739))

(assert (=> b!1341652 m!1229733))

(assert (=> b!1341652 m!1229735))

(assert (=> b!1341652 m!1229723))

(assert (=> b!1341652 m!1229739))

(assert (=> b!1341652 m!1229727))

(declare-fun m!1229741 () Bool)

(assert (=> mapNonEmpty!57400 m!1229741))

(check-sat (not b!1341652) (not b_lambda!24299) (not start!113302) (not mapNonEmpty!57400) (not b!1341655) (not b!1341647) (not b_next!31129) tp_is_empty!37129 (not b!1341650) (not b!1341644) b_and!50169)
(check-sat b_and!50169 (not b_next!31129))
