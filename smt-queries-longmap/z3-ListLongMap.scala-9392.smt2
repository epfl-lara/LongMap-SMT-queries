; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112012 () Bool)

(assert start!112012)

(declare-fun b_free!30445 () Bool)

(declare-fun b_next!30445 () Bool)

(assert (=> start!112012 (= b_free!30445 (not b_next!30445))))

(declare-fun tp!106810 () Bool)

(declare-fun b_and!48985 () Bool)

(assert (=> start!112012 (= tp!106810 b_and!48985)))

(declare-fun b!1325968 () Bool)

(declare-fun e!756018 () Bool)

(declare-fun tp_is_empty!36265 () Bool)

(assert (=> b!1325968 (= e!756018 tp_is_empty!36265)))

(declare-fun b!1325969 () Bool)

(declare-fun e!756022 () Bool)

(assert (=> b!1325969 (= e!756022 tp_is_empty!36265)))

(declare-fun b!1325970 () Bool)

(declare-fun e!756019 () Bool)

(declare-fun mapRes!56045 () Bool)

(assert (=> b!1325970 (= e!756019 (and e!756018 mapRes!56045))))

(declare-fun condMapEmpty!56045 () Bool)

(declare-datatypes ((V!53457 0))(
  ( (V!53458 (val!18207 Int)) )
))
(declare-datatypes ((ValueCell!17234 0))(
  ( (ValueCellFull!17234 (v!20832 V!53457)) (EmptyCell!17234) )
))
(declare-datatypes ((array!89529 0))(
  ( (array!89530 (arr!43234 (Array (_ BitVec 32) ValueCell!17234)) (size!43785 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89529)

(declare-fun mapDefault!56045 () ValueCell!17234)

(assert (=> b!1325970 (= condMapEmpty!56045 (= (arr!43234 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17234)) mapDefault!56045)))))

(declare-fun mapIsEmpty!56045 () Bool)

(assert (=> mapIsEmpty!56045 mapRes!56045))

(declare-fun b!1325971 () Bool)

(declare-fun res!879772 () Bool)

(declare-fun e!756021 () Bool)

(assert (=> b!1325971 (=> (not res!879772) (not e!756021))))

(declare-datatypes ((array!89531 0))(
  ( (array!89532 (arr!43235 (Array (_ BitVec 32) (_ BitVec 64))) (size!43786 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89531)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325971 (= res!879772 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43786 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325973 () Bool)

(declare-fun res!879770 () Bool)

(assert (=> b!1325973 (=> (not res!879770) (not e!756021))))

(declare-datatypes ((List!30664 0))(
  ( (Nil!30661) (Cons!30660 (h!31878 (_ BitVec 64)) (t!44582 List!30664)) )
))
(declare-fun arrayNoDuplicates!0 (array!89531 (_ BitVec 32) List!30664) Bool)

(assert (=> b!1325973 (= res!879770 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30661))))

(declare-fun mapNonEmpty!56045 () Bool)

(declare-fun tp!106811 () Bool)

(assert (=> mapNonEmpty!56045 (= mapRes!56045 (and tp!106811 e!756022))))

(declare-fun mapRest!56045 () (Array (_ BitVec 32) ValueCell!17234))

(declare-fun mapKey!56045 () (_ BitVec 32))

(declare-fun mapValue!56045 () ValueCell!17234)

(assert (=> mapNonEmpty!56045 (= (arr!43234 _values!1337) (store mapRest!56045 mapKey!56045 mapValue!56045))))

(declare-fun b!1325974 () Bool)

(declare-fun res!879767 () Bool)

(assert (=> b!1325974 (=> (not res!879767) (not e!756021))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325974 (= res!879767 (and (= (size!43785 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43786 _keys!1609) (size!43785 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325975 () Bool)

(declare-fun res!879771 () Bool)

(assert (=> b!1325975 (=> (not res!879771) (not e!756021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325975 (= res!879771 (validKeyInArray!0 (select (arr!43235 _keys!1609) from!2000)))))

(declare-fun b!1325976 () Bool)

(declare-fun res!879765 () Bool)

(assert (=> b!1325976 (=> (not res!879765) (not e!756021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89531 (_ BitVec 32)) Bool)

(assert (=> b!1325976 (= res!879765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!879769 () Bool)

(assert (=> start!112012 (=> (not res!879769) (not e!756021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112012 (= res!879769 (validMask!0 mask!2019))))

(assert (=> start!112012 e!756021))

(declare-fun array_inv!32905 (array!89531) Bool)

(assert (=> start!112012 (array_inv!32905 _keys!1609)))

(assert (=> start!112012 true))

(assert (=> start!112012 tp_is_empty!36265))

(declare-fun array_inv!32906 (array!89529) Bool)

(assert (=> start!112012 (and (array_inv!32906 _values!1337) e!756019)))

(assert (=> start!112012 tp!106810))

(declare-fun b!1325972 () Bool)

(assert (=> b!1325972 (= e!756021 false)))

(declare-datatypes ((tuple2!23510 0))(
  ( (tuple2!23511 (_1!11766 (_ BitVec 64)) (_2!11766 V!53457)) )
))
(declare-datatypes ((List!30665 0))(
  ( (Nil!30662) (Cons!30661 (h!31879 tuple2!23510) (t!44583 List!30665)) )
))
(declare-datatypes ((ListLongMap!21175 0))(
  ( (ListLongMap!21176 (toList!10603 List!30665)) )
))
(declare-fun lt!589967 () ListLongMap!21175)

(declare-fun zeroValue!1279 () V!53457)

(declare-fun minValue!1279 () V!53457)

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6294 (array!89531 array!89529 (_ BitVec 32) (_ BitVec 32) V!53457 V!53457 (_ BitVec 32) Int) ListLongMap!21175)

(assert (=> b!1325972 (= lt!589967 (getCurrentListMapNoExtraKeys!6294 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1325977 () Bool)

(declare-fun res!879766 () Bool)

(assert (=> b!1325977 (=> (not res!879766) (not e!756021))))

(assert (=> b!1325977 (= res!879766 (not (= (select (arr!43235 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325978 () Bool)

(declare-fun res!879768 () Bool)

(assert (=> b!1325978 (=> (not res!879768) (not e!756021))))

(declare-fun contains!8770 (ListLongMap!21175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5586 (array!89531 array!89529 (_ BitVec 32) (_ BitVec 32) V!53457 V!53457 (_ BitVec 32) Int) ListLongMap!21175)

(assert (=> b!1325978 (= res!879768 (contains!8770 (getCurrentListMap!5586 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!112012 res!879769) b!1325974))

(assert (= (and b!1325974 res!879767) b!1325976))

(assert (= (and b!1325976 res!879765) b!1325973))

(assert (= (and b!1325973 res!879770) b!1325971))

(assert (= (and b!1325971 res!879772) b!1325978))

(assert (= (and b!1325978 res!879768) b!1325977))

(assert (= (and b!1325977 res!879766) b!1325975))

(assert (= (and b!1325975 res!879771) b!1325972))

(assert (= (and b!1325970 condMapEmpty!56045) mapIsEmpty!56045))

(assert (= (and b!1325970 (not condMapEmpty!56045)) mapNonEmpty!56045))

(get-info :version)

(assert (= (and mapNonEmpty!56045 ((_ is ValueCellFull!17234) mapValue!56045)) b!1325969))

(assert (= (and b!1325970 ((_ is ValueCellFull!17234) mapDefault!56045)) b!1325968))

(assert (= start!112012 b!1325970))

(declare-fun m!1215041 () Bool)

(assert (=> b!1325973 m!1215041))

(declare-fun m!1215043 () Bool)

(assert (=> b!1325977 m!1215043))

(declare-fun m!1215045 () Bool)

(assert (=> b!1325976 m!1215045))

(declare-fun m!1215047 () Bool)

(assert (=> mapNonEmpty!56045 m!1215047))

(declare-fun m!1215049 () Bool)

(assert (=> b!1325978 m!1215049))

(assert (=> b!1325978 m!1215049))

(declare-fun m!1215051 () Bool)

(assert (=> b!1325978 m!1215051))

(assert (=> b!1325975 m!1215043))

(assert (=> b!1325975 m!1215043))

(declare-fun m!1215053 () Bool)

(assert (=> b!1325975 m!1215053))

(declare-fun m!1215055 () Bool)

(assert (=> start!112012 m!1215055))

(declare-fun m!1215057 () Bool)

(assert (=> start!112012 m!1215057))

(declare-fun m!1215059 () Bool)

(assert (=> start!112012 m!1215059))

(declare-fun m!1215061 () Bool)

(assert (=> b!1325972 m!1215061))

(check-sat (not mapNonEmpty!56045) tp_is_empty!36265 (not b!1325973) (not start!112012) (not b!1325975) (not b!1325972) (not b_next!30445) b_and!48985 (not b!1325976) (not b!1325978))
(check-sat b_and!48985 (not b_next!30445))
