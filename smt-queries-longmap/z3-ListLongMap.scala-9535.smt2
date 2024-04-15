; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113072 () Bool)

(assert start!113072)

(declare-fun b_free!31123 () Bool)

(declare-fun b_next!31123 () Bool)

(assert (=> start!113072 (= b_free!31123 (not b_next!31123))))

(declare-fun tp!109174 () Bool)

(declare-fun b_and!50135 () Bool)

(assert (=> start!113072 (= tp!109174 b_and!50135)))

(declare-fun mapIsEmpty!57391 () Bool)

(declare-fun mapRes!57391 () Bool)

(assert (=> mapIsEmpty!57391 mapRes!57391))

(declare-fun b!1340162 () Bool)

(declare-fun e!763367 () Bool)

(declare-fun tp_is_empty!37123 () Bool)

(assert (=> b!1340162 (= e!763367 tp_is_empty!37123)))

(declare-fun b!1340163 () Bool)

(declare-fun res!889035 () Bool)

(declare-fun e!763368 () Bool)

(assert (=> b!1340163 (=> (not res!889035) (not e!763368))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91041 0))(
  ( (array!91042 (arr!43977 (Array (_ BitVec 32) (_ BitVec 64))) (size!44529 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91041)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340163 (= res!889035 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44529 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340164 () Bool)

(declare-fun res!889033 () Bool)

(assert (=> b!1340164 (=> (not res!889033) (not e!763368))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54601 0))(
  ( (V!54602 (val!18636 Int)) )
))
(declare-datatypes ((ValueCell!17663 0))(
  ( (ValueCellFull!17663 (v!21283 V!54601)) (EmptyCell!17663) )
))
(declare-datatypes ((array!91043 0))(
  ( (array!91044 (arr!43978 (Array (_ BitVec 32) ValueCell!17663)) (size!44530 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91043)

(assert (=> b!1340164 (= res!889033 (and (= (size!44530 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44529 _keys!1571) (size!44530 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340165 () Bool)

(declare-fun res!889034 () Bool)

(assert (=> b!1340165 (=> (not res!889034) (not e!763368))))

(assert (=> b!1340165 (= res!889034 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!889028 () Bool)

(assert (=> start!113072 (=> (not res!889028) (not e!763368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113072 (= res!889028 (validMask!0 mask!1977))))

(assert (=> start!113072 e!763368))

(assert (=> start!113072 tp_is_empty!37123))

(assert (=> start!113072 true))

(declare-fun array_inv!33351 (array!91041) Bool)

(assert (=> start!113072 (array_inv!33351 _keys!1571)))

(declare-fun e!763366 () Bool)

(declare-fun array_inv!33352 (array!91043) Bool)

(assert (=> start!113072 (and (array_inv!33352 _values!1303) e!763366)))

(assert (=> start!113072 tp!109174))

(declare-fun b!1340161 () Bool)

(declare-fun res!889030 () Bool)

(assert (=> b!1340161 (=> (not res!889030) (not e!763368))))

(assert (=> b!1340161 (= res!889030 (not (= (select (arr!43977 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340166 () Bool)

(declare-fun e!763369 () Bool)

(assert (=> b!1340166 (= e!763369 tp_is_empty!37123)))

(declare-fun b!1340167 () Bool)

(declare-fun res!889036 () Bool)

(assert (=> b!1340167 (=> (not res!889036) (not e!763368))))

(declare-datatypes ((List!31195 0))(
  ( (Nil!31192) (Cons!31191 (h!32400 (_ BitVec 64)) (t!45521 List!31195)) )
))
(declare-fun arrayNoDuplicates!0 (array!91041 (_ BitVec 32) List!31195) Bool)

(assert (=> b!1340167 (= res!889036 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31192))))

(declare-fun b!1340168 () Bool)

(declare-fun res!889032 () Bool)

(assert (=> b!1340168 (=> (not res!889032) (not e!763368))))

(declare-fun minValue!1245 () V!54601)

(declare-fun zeroValue!1245 () V!54601)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24044 0))(
  ( (tuple2!24045 (_1!12033 (_ BitVec 64)) (_2!12033 V!54601)) )
))
(declare-datatypes ((List!31196 0))(
  ( (Nil!31193) (Cons!31192 (h!32401 tuple2!24044) (t!45522 List!31196)) )
))
(declare-datatypes ((ListLongMap!21701 0))(
  ( (ListLongMap!21702 (toList!10866 List!31196)) )
))
(declare-fun contains!8971 (ListLongMap!21701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5719 (array!91041 array!91043 (_ BitVec 32) (_ BitVec 32) V!54601 V!54601 (_ BitVec 32) Int) ListLongMap!21701)

(assert (=> b!1340168 (= res!889032 (contains!8971 (getCurrentListMap!5719 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340169 () Bool)

(assert (=> b!1340169 (= e!763366 (and e!763369 mapRes!57391))))

(declare-fun condMapEmpty!57391 () Bool)

(declare-fun mapDefault!57391 () ValueCell!17663)

(assert (=> b!1340169 (= condMapEmpty!57391 (= (arr!43978 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17663)) mapDefault!57391)))))

(declare-fun mapNonEmpty!57391 () Bool)

(declare-fun tp!109175 () Bool)

(assert (=> mapNonEmpty!57391 (= mapRes!57391 (and tp!109175 e!763367))))

(declare-fun mapRest!57391 () (Array (_ BitVec 32) ValueCell!17663))

(declare-fun mapKey!57391 () (_ BitVec 32))

(declare-fun mapValue!57391 () ValueCell!17663)

(assert (=> mapNonEmpty!57391 (= (arr!43978 _values!1303) (store mapRest!57391 mapKey!57391 mapValue!57391))))

(declare-fun b!1340170 () Bool)

(assert (=> b!1340170 (= e!763368 false)))

(declare-fun lt!593784 () Bool)

(declare-fun +!4775 (ListLongMap!21701 tuple2!24044) ListLongMap!21701)

(declare-fun getCurrentListMapNoExtraKeys!6418 (array!91041 array!91043 (_ BitVec 32) (_ BitVec 32) V!54601 V!54601 (_ BitVec 32) Int) ListLongMap!21701)

(declare-fun get!22189 (ValueCell!17663 V!54601) V!54601)

(declare-fun dynLambda!3705 (Int (_ BitVec 64)) V!54601)

(assert (=> b!1340170 (= lt!593784 (contains!8971 (+!4775 (+!4775 (getCurrentListMapNoExtraKeys!6418 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24045 (select (arr!43977 _keys!1571) from!1960) (get!22189 (select (arr!43978 _values!1303) from!1960) (dynLambda!3705 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1340171 () Bool)

(declare-fun res!889029 () Bool)

(assert (=> b!1340171 (=> (not res!889029) (not e!763368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340171 (= res!889029 (validKeyInArray!0 (select (arr!43977 _keys!1571) from!1960)))))

(declare-fun b!1340172 () Bool)

(declare-fun res!889031 () Bool)

(assert (=> b!1340172 (=> (not res!889031) (not e!763368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91041 (_ BitVec 32)) Bool)

(assert (=> b!1340172 (= res!889031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113072 res!889028) b!1340164))

(assert (= (and b!1340164 res!889033) b!1340172))

(assert (= (and b!1340172 res!889031) b!1340167))

(assert (= (and b!1340167 res!889036) b!1340163))

(assert (= (and b!1340163 res!889035) b!1340168))

(assert (= (and b!1340168 res!889032) b!1340161))

(assert (= (and b!1340161 res!889030) b!1340171))

(assert (= (and b!1340171 res!889029) b!1340165))

(assert (= (and b!1340165 res!889034) b!1340170))

(assert (= (and b!1340169 condMapEmpty!57391) mapIsEmpty!57391))

(assert (= (and b!1340169 (not condMapEmpty!57391)) mapNonEmpty!57391))

(get-info :version)

(assert (= (and mapNonEmpty!57391 ((_ is ValueCellFull!17663) mapValue!57391)) b!1340162))

(assert (= (and b!1340169 ((_ is ValueCellFull!17663) mapDefault!57391)) b!1340166))

(assert (= start!113072 b!1340169))

(declare-fun b_lambda!24289 () Bool)

(assert (=> (not b_lambda!24289) (not b!1340170)))

(declare-fun t!45520 () Bool)

(declare-fun tb!12129 () Bool)

(assert (=> (and start!113072 (= defaultEntry!1306 defaultEntry!1306) t!45520) tb!12129))

(declare-fun result!25357 () Bool)

(assert (=> tb!12129 (= result!25357 tp_is_empty!37123)))

(assert (=> b!1340170 t!45520))

(declare-fun b_and!50137 () Bool)

(assert (= b_and!50135 (and (=> t!45520 result!25357) b_and!50137)))

(declare-fun m!1227493 () Bool)

(assert (=> b!1340167 m!1227493))

(declare-fun m!1227495 () Bool)

(assert (=> mapNonEmpty!57391 m!1227495))

(declare-fun m!1227497 () Bool)

(assert (=> start!113072 m!1227497))

(declare-fun m!1227499 () Bool)

(assert (=> start!113072 m!1227499))

(declare-fun m!1227501 () Bool)

(assert (=> start!113072 m!1227501))

(declare-fun m!1227503 () Bool)

(assert (=> b!1340168 m!1227503))

(assert (=> b!1340168 m!1227503))

(declare-fun m!1227505 () Bool)

(assert (=> b!1340168 m!1227505))

(declare-fun m!1227507 () Bool)

(assert (=> b!1340171 m!1227507))

(assert (=> b!1340171 m!1227507))

(declare-fun m!1227509 () Bool)

(assert (=> b!1340171 m!1227509))

(assert (=> b!1340161 m!1227507))

(declare-fun m!1227511 () Bool)

(assert (=> b!1340170 m!1227511))

(declare-fun m!1227513 () Bool)

(assert (=> b!1340170 m!1227513))

(declare-fun m!1227515 () Bool)

(assert (=> b!1340170 m!1227515))

(declare-fun m!1227517 () Bool)

(assert (=> b!1340170 m!1227517))

(declare-fun m!1227519 () Bool)

(assert (=> b!1340170 m!1227519))

(declare-fun m!1227521 () Bool)

(assert (=> b!1340170 m!1227521))

(assert (=> b!1340170 m!1227515))

(declare-fun m!1227523 () Bool)

(assert (=> b!1340170 m!1227523))

(assert (=> b!1340170 m!1227517))

(assert (=> b!1340170 m!1227519))

(assert (=> b!1340170 m!1227507))

(assert (=> b!1340170 m!1227523))

(assert (=> b!1340170 m!1227511))

(declare-fun m!1227525 () Bool)

(assert (=> b!1340172 m!1227525))

(check-sat (not b_next!31123) (not b!1340170) (not b!1340171) b_and!50137 (not mapNonEmpty!57391) (not b!1340168) (not b!1340167) (not b_lambda!24289) tp_is_empty!37123 (not b!1340172) (not start!113072))
(check-sat b_and!50137 (not b_next!31123))
