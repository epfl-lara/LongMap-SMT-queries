; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113626 () Bool)

(assert start!113626)

(declare-fun b_free!31453 () Bool)

(declare-fun b_next!31453 () Bool)

(assert (=> start!113626 (= b_free!31453 (not b_next!31453))))

(declare-fun tp!110163 () Bool)

(declare-fun b_and!50743 () Bool)

(assert (=> start!113626 (= tp!110163 b_and!50743)))

(declare-fun b!1347477 () Bool)

(declare-fun res!893782 () Bool)

(declare-fun e!766802 () Bool)

(assert (=> b!1347477 (=> (not res!893782) (not e!766802))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55041 0))(
  ( (V!55042 (val!18801 Int)) )
))
(declare-datatypes ((ValueCell!17828 0))(
  ( (ValueCellFull!17828 (v!21444 V!55041)) (EmptyCell!17828) )
))
(declare-datatypes ((array!91851 0))(
  ( (array!91852 (arr!44377 (Array (_ BitVec 32) ValueCell!17828)) (size!44928 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91851)

(declare-datatypes ((array!91853 0))(
  ( (array!91854 (arr!44378 (Array (_ BitVec 32) (_ BitVec 64))) (size!44929 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91853)

(assert (=> b!1347477 (= res!893782 (and (= (size!44928 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44929 _keys!1571) (size!44928 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347478 () Bool)

(declare-fun e!766801 () Bool)

(declare-fun tp_is_empty!37453 () Bool)

(assert (=> b!1347478 (= e!766801 tp_is_empty!37453)))

(declare-fun b!1347479 () Bool)

(assert (=> b!1347479 (= e!766802 false)))

(declare-fun minValue!1245 () V!55041)

(declare-fun zeroValue!1245 () V!55041)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595958 () Bool)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24278 0))(
  ( (tuple2!24279 (_1!12150 (_ BitVec 64)) (_2!12150 V!55041)) )
))
(declare-datatypes ((List!31420 0))(
  ( (Nil!31417) (Cons!31416 (h!32634 tuple2!24278) (t!46002 List!31420)) )
))
(declare-datatypes ((ListLongMap!21943 0))(
  ( (ListLongMap!21944 (toList!10987 List!31420)) )
))
(declare-fun contains!9175 (ListLongMap!21943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5927 (array!91853 array!91851 (_ BitVec 32) (_ BitVec 32) V!55041 V!55041 (_ BitVec 32) Int) ListLongMap!21943)

(assert (=> b!1347479 (= lt!595958 (contains!9175 (getCurrentListMap!5927 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347480 () Bool)

(declare-fun res!893779 () Bool)

(assert (=> b!1347480 (=> (not res!893779) (not e!766802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91853 (_ BitVec 32)) Bool)

(assert (=> b!1347480 (= res!893779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57886 () Bool)

(declare-fun mapRes!57886 () Bool)

(assert (=> mapIsEmpty!57886 mapRes!57886))

(declare-fun b!1347481 () Bool)

(declare-fun res!893781 () Bool)

(assert (=> b!1347481 (=> (not res!893781) (not e!766802))))

(assert (=> b!1347481 (= res!893781 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44929 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347482 () Bool)

(declare-fun res!893780 () Bool)

(assert (=> b!1347482 (=> (not res!893780) (not e!766802))))

(declare-datatypes ((List!31421 0))(
  ( (Nil!31418) (Cons!31417 (h!32635 (_ BitVec 64)) (t!46003 List!31421)) )
))
(declare-fun arrayNoDuplicates!0 (array!91853 (_ BitVec 32) List!31421) Bool)

(assert (=> b!1347482 (= res!893780 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31418))))

(declare-fun res!893783 () Bool)

(assert (=> start!113626 (=> (not res!893783) (not e!766802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113626 (= res!893783 (validMask!0 mask!1977))))

(assert (=> start!113626 e!766802))

(assert (=> start!113626 tp_is_empty!37453))

(assert (=> start!113626 true))

(declare-fun array_inv!33699 (array!91853) Bool)

(assert (=> start!113626 (array_inv!33699 _keys!1571)))

(declare-fun e!766800 () Bool)

(declare-fun array_inv!33700 (array!91851) Bool)

(assert (=> start!113626 (and (array_inv!33700 _values!1303) e!766800)))

(assert (=> start!113626 tp!110163))

(declare-fun b!1347483 () Bool)

(declare-fun e!766798 () Bool)

(assert (=> b!1347483 (= e!766798 tp_is_empty!37453)))

(declare-fun b!1347484 () Bool)

(assert (=> b!1347484 (= e!766800 (and e!766798 mapRes!57886))))

(declare-fun condMapEmpty!57886 () Bool)

(declare-fun mapDefault!57886 () ValueCell!17828)

(assert (=> b!1347484 (= condMapEmpty!57886 (= (arr!44377 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17828)) mapDefault!57886)))))

(declare-fun mapNonEmpty!57886 () Bool)

(declare-fun tp!110164 () Bool)

(assert (=> mapNonEmpty!57886 (= mapRes!57886 (and tp!110164 e!766801))))

(declare-fun mapValue!57886 () ValueCell!17828)

(declare-fun mapKey!57886 () (_ BitVec 32))

(declare-fun mapRest!57886 () (Array (_ BitVec 32) ValueCell!17828))

(assert (=> mapNonEmpty!57886 (= (arr!44377 _values!1303) (store mapRest!57886 mapKey!57886 mapValue!57886))))

(assert (= (and start!113626 res!893783) b!1347477))

(assert (= (and b!1347477 res!893782) b!1347480))

(assert (= (and b!1347480 res!893779) b!1347482))

(assert (= (and b!1347482 res!893780) b!1347481))

(assert (= (and b!1347481 res!893781) b!1347479))

(assert (= (and b!1347484 condMapEmpty!57886) mapIsEmpty!57886))

(assert (= (and b!1347484 (not condMapEmpty!57886)) mapNonEmpty!57886))

(get-info :version)

(assert (= (and mapNonEmpty!57886 ((_ is ValueCellFull!17828) mapValue!57886)) b!1347478))

(assert (= (and b!1347484 ((_ is ValueCellFull!17828) mapDefault!57886)) b!1347483))

(assert (= start!113626 b!1347484))

(declare-fun m!1235013 () Bool)

(assert (=> start!113626 m!1235013))

(declare-fun m!1235015 () Bool)

(assert (=> start!113626 m!1235015))

(declare-fun m!1235017 () Bool)

(assert (=> start!113626 m!1235017))

(declare-fun m!1235019 () Bool)

(assert (=> b!1347480 m!1235019))

(declare-fun m!1235021 () Bool)

(assert (=> mapNonEmpty!57886 m!1235021))

(declare-fun m!1235023 () Bool)

(assert (=> b!1347482 m!1235023))

(declare-fun m!1235025 () Bool)

(assert (=> b!1347479 m!1235025))

(assert (=> b!1347479 m!1235025))

(declare-fun m!1235027 () Bool)

(assert (=> b!1347479 m!1235027))

(check-sat (not b!1347480) b_and!50743 tp_is_empty!37453 (not mapNonEmpty!57886) (not start!113626) (not b_next!31453) (not b!1347479) (not b!1347482))
(check-sat b_and!50743 (not b_next!31453))
