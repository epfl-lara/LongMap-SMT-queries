; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113538 () Bool)

(assert start!113538)

(declare-fun b_free!31531 () Bool)

(declare-fun b_next!31531 () Bool)

(assert (=> start!113538 (= b_free!31531 (not b_next!31531))))

(declare-fun tp!110403 () Bool)

(declare-fun b_and!50833 () Bool)

(assert (=> start!113538 (= tp!110403 b_and!50833)))

(declare-fun b!1347661 () Bool)

(declare-fun res!894200 () Bool)

(declare-fun e!766753 () Bool)

(assert (=> b!1347661 (=> (not res!894200) (not e!766753))))

(declare-datatypes ((array!91839 0))(
  ( (array!91840 (arr!44375 (Array (_ BitVec 32) (_ BitVec 64))) (size!44927 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91839)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347661 (= res!894200 (validKeyInArray!0 (select (arr!44375 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!58007 () Bool)

(declare-fun mapRes!58007 () Bool)

(declare-fun tp!110402 () Bool)

(declare-fun e!766754 () Bool)

(assert (=> mapNonEmpty!58007 (= mapRes!58007 (and tp!110402 e!766754))))

(declare-datatypes ((V!55145 0))(
  ( (V!55146 (val!18840 Int)) )
))
(declare-datatypes ((ValueCell!17867 0))(
  ( (ValueCellFull!17867 (v!21490 V!55145)) (EmptyCell!17867) )
))
(declare-fun mapRest!58007 () (Array (_ BitVec 32) ValueCell!17867))

(declare-fun mapKey!58007 () (_ BitVec 32))

(declare-fun mapValue!58007 () ValueCell!17867)

(declare-datatypes ((array!91841 0))(
  ( (array!91842 (arr!44376 (Array (_ BitVec 32) ValueCell!17867)) (size!44928 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91841)

(assert (=> mapNonEmpty!58007 (= (arr!44376 _values!1303) (store mapRest!58007 mapKey!58007 mapValue!58007))))

(declare-fun b!1347662 () Bool)

(declare-fun res!894199 () Bool)

(assert (=> b!1347662 (=> (not res!894199) (not e!766753))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347662 (= res!894199 (and (= (size!44928 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44927 _keys!1571) (size!44928 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347663 () Bool)

(declare-fun res!894201 () Bool)

(assert (=> b!1347663 (=> (not res!894201) (not e!766753))))

(assert (=> b!1347663 (= res!894201 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!894198 () Bool)

(assert (=> start!113538 (=> (not res!894198) (not e!766753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113538 (= res!894198 (validMask!0 mask!1977))))

(assert (=> start!113538 e!766753))

(declare-fun tp_is_empty!37531 () Bool)

(assert (=> start!113538 tp_is_empty!37531))

(assert (=> start!113538 true))

(declare-fun array_inv!33627 (array!91839) Bool)

(assert (=> start!113538 (array_inv!33627 _keys!1571)))

(declare-fun e!766750 () Bool)

(declare-fun array_inv!33628 (array!91841) Bool)

(assert (=> start!113538 (and (array_inv!33628 _values!1303) e!766750)))

(assert (=> start!113538 tp!110403))

(declare-fun b!1347664 () Bool)

(declare-fun res!894194 () Bool)

(assert (=> b!1347664 (=> (not res!894194) (not e!766753))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1347664 (= res!894194 (not (= (select (arr!44375 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347665 () Bool)

(declare-fun res!894193 () Bool)

(assert (=> b!1347665 (=> (not res!894193) (not e!766753))))

(declare-fun minValue!1245 () V!55145)

(declare-fun zeroValue!1245 () V!55145)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24362 0))(
  ( (tuple2!24363 (_1!12192 (_ BitVec 64)) (_2!12192 V!55145)) )
))
(declare-datatypes ((List!31495 0))(
  ( (Nil!31492) (Cons!31491 (h!32700 tuple2!24362) (t!46097 List!31495)) )
))
(declare-datatypes ((ListLongMap!22019 0))(
  ( (ListLongMap!22020 (toList!11025 List!31495)) )
))
(declare-fun contains!9130 (ListLongMap!22019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5860 (array!91839 array!91841 (_ BitVec 32) (_ BitVec 32) V!55145 V!55145 (_ BitVec 32) Int) ListLongMap!22019)

(assert (=> b!1347665 (= res!894193 (contains!9130 (getCurrentListMap!5860 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!58007 () Bool)

(assert (=> mapIsEmpty!58007 mapRes!58007))

(declare-fun b!1347666 () Bool)

(assert (=> b!1347666 (= e!766753 (not (bvslt from!1960 (size!44928 _values!1303))))))

(declare-fun lt!595666 () ListLongMap!22019)

(assert (=> b!1347666 (contains!9130 lt!595666 k0!1142)))

(declare-datatypes ((Unit!43989 0))(
  ( (Unit!43990) )
))
(declare-fun lt!595665 () Unit!43989)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!405 ((_ BitVec 64) (_ BitVec 64) V!55145 ListLongMap!22019) Unit!43989)

(assert (=> b!1347666 (= lt!595665 (lemmaInListMapAfterAddingDiffThenInBefore!405 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595666))))

(declare-fun +!4872 (ListLongMap!22019 tuple2!24362) ListLongMap!22019)

(declare-fun getCurrentListMapNoExtraKeys!6520 (array!91839 array!91841 (_ BitVec 32) (_ BitVec 32) V!55145 V!55145 (_ BitVec 32) Int) ListLongMap!22019)

(declare-fun get!22425 (ValueCell!17867 V!55145) V!55145)

(declare-fun dynLambda!3802 (Int (_ BitVec 64)) V!55145)

(assert (=> b!1347666 (= lt!595666 (+!4872 (getCurrentListMapNoExtraKeys!6520 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24363 (select (arr!44375 _keys!1571) from!1960) (get!22425 (select (arr!44376 _values!1303) from!1960) (dynLambda!3802 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347667 () Bool)

(declare-fun res!894197 () Bool)

(assert (=> b!1347667 (=> (not res!894197) (not e!766753))))

(declare-datatypes ((List!31496 0))(
  ( (Nil!31493) (Cons!31492 (h!32701 (_ BitVec 64)) (t!46098 List!31496)) )
))
(declare-fun arrayNoDuplicates!0 (array!91839 (_ BitVec 32) List!31496) Bool)

(assert (=> b!1347667 (= res!894197 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31493))))

(declare-fun b!1347668 () Bool)

(assert (=> b!1347668 (= e!766754 tp_is_empty!37531)))

(declare-fun b!1347669 () Bool)

(declare-fun res!894195 () Bool)

(assert (=> b!1347669 (=> (not res!894195) (not e!766753))))

(assert (=> b!1347669 (= res!894195 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44927 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347670 () Bool)

(declare-fun e!766752 () Bool)

(assert (=> b!1347670 (= e!766750 (and e!766752 mapRes!58007))))

(declare-fun condMapEmpty!58007 () Bool)

(declare-fun mapDefault!58007 () ValueCell!17867)

(assert (=> b!1347670 (= condMapEmpty!58007 (= (arr!44376 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17867)) mapDefault!58007)))))

(declare-fun b!1347671 () Bool)

(declare-fun res!894196 () Bool)

(assert (=> b!1347671 (=> (not res!894196) (not e!766753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91839 (_ BitVec 32)) Bool)

(assert (=> b!1347671 (= res!894196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347672 () Bool)

(assert (=> b!1347672 (= e!766752 tp_is_empty!37531)))

(assert (= (and start!113538 res!894198) b!1347662))

(assert (= (and b!1347662 res!894199) b!1347671))

(assert (= (and b!1347671 res!894196) b!1347667))

(assert (= (and b!1347667 res!894197) b!1347669))

(assert (= (and b!1347669 res!894195) b!1347665))

(assert (= (and b!1347665 res!894193) b!1347664))

(assert (= (and b!1347664 res!894194) b!1347661))

(assert (= (and b!1347661 res!894200) b!1347663))

(assert (= (and b!1347663 res!894201) b!1347666))

(assert (= (and b!1347670 condMapEmpty!58007) mapIsEmpty!58007))

(assert (= (and b!1347670 (not condMapEmpty!58007)) mapNonEmpty!58007))

(get-info :version)

(assert (= (and mapNonEmpty!58007 ((_ is ValueCellFull!17867) mapValue!58007)) b!1347668))

(assert (= (and b!1347670 ((_ is ValueCellFull!17867) mapDefault!58007)) b!1347672))

(assert (= start!113538 b!1347670))

(declare-fun b_lambda!24595 () Bool)

(assert (=> (not b_lambda!24595) (not b!1347666)))

(declare-fun t!46096 () Bool)

(declare-fun tb!12405 () Bool)

(assert (=> (and start!113538 (= defaultEntry!1306 defaultEntry!1306) t!46096) tb!12405))

(declare-fun result!25911 () Bool)

(assert (=> tb!12405 (= result!25911 tp_is_empty!37531)))

(assert (=> b!1347666 t!46096))

(declare-fun b_and!50835 () Bool)

(assert (= b_and!50833 (and (=> t!46096 result!25911) b_and!50835)))

(declare-fun m!1234271 () Bool)

(assert (=> b!1347664 m!1234271))

(declare-fun m!1234273 () Bool)

(assert (=> b!1347667 m!1234273))

(declare-fun m!1234275 () Bool)

(assert (=> b!1347665 m!1234275))

(assert (=> b!1347665 m!1234275))

(declare-fun m!1234277 () Bool)

(assert (=> b!1347665 m!1234277))

(declare-fun m!1234279 () Bool)

(assert (=> b!1347666 m!1234279))

(declare-fun m!1234281 () Bool)

(assert (=> b!1347666 m!1234281))

(declare-fun m!1234283 () Bool)

(assert (=> b!1347666 m!1234283))

(declare-fun m!1234285 () Bool)

(assert (=> b!1347666 m!1234285))

(assert (=> b!1347666 m!1234279))

(declare-fun m!1234287 () Bool)

(assert (=> b!1347666 m!1234287))

(assert (=> b!1347666 m!1234281))

(declare-fun m!1234289 () Bool)

(assert (=> b!1347666 m!1234289))

(assert (=> b!1347666 m!1234283))

(assert (=> b!1347666 m!1234271))

(declare-fun m!1234291 () Bool)

(assert (=> b!1347666 m!1234291))

(assert (=> b!1347661 m!1234271))

(assert (=> b!1347661 m!1234271))

(declare-fun m!1234293 () Bool)

(assert (=> b!1347661 m!1234293))

(declare-fun m!1234295 () Bool)

(assert (=> start!113538 m!1234295))

(declare-fun m!1234297 () Bool)

(assert (=> start!113538 m!1234297))

(declare-fun m!1234299 () Bool)

(assert (=> start!113538 m!1234299))

(declare-fun m!1234301 () Bool)

(assert (=> b!1347671 m!1234301))

(declare-fun m!1234303 () Bool)

(assert (=> mapNonEmpty!58007 m!1234303))

(check-sat (not b_next!31531) tp_is_empty!37531 b_and!50835 (not start!113538) (not b_lambda!24595) (not b!1347666) (not b!1347667) (not b!1347671) (not b!1347665) (not b!1347661) (not mapNonEmpty!58007))
(check-sat b_and!50835 (not b_next!31531))
