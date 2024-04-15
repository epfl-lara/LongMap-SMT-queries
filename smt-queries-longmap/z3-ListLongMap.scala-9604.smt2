; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113544 () Bool)

(assert start!113544)

(declare-fun b_free!31537 () Bool)

(declare-fun b_next!31537 () Bool)

(assert (=> start!113544 (= b_free!31537 (not b_next!31537))))

(declare-fun tp!110420 () Bool)

(declare-fun b_and!50845 () Bool)

(assert (=> start!113544 (= tp!110420 b_and!50845)))

(declare-fun b!1347775 () Bool)

(declare-fun e!766798 () Bool)

(assert (=> b!1347775 (= e!766798 (not true))))

(declare-datatypes ((V!55153 0))(
  ( (V!55154 (val!18843 Int)) )
))
(declare-datatypes ((tuple2!24368 0))(
  ( (tuple2!24369 (_1!12195 (_ BitVec 64)) (_2!12195 V!55153)) )
))
(declare-datatypes ((List!31501 0))(
  ( (Nil!31498) (Cons!31497 (h!32706 tuple2!24368) (t!46109 List!31501)) )
))
(declare-datatypes ((ListLongMap!22025 0))(
  ( (ListLongMap!22026 (toList!11028 List!31501)) )
))
(declare-fun lt!595683 () ListLongMap!22025)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9133 (ListLongMap!22025 (_ BitVec 64)) Bool)

(assert (=> b!1347775 (contains!9133 lt!595683 k0!1142)))

(declare-datatypes ((Unit!43995 0))(
  ( (Unit!43996) )
))
(declare-fun lt!595684 () Unit!43995)

(declare-fun zeroValue!1245 () V!55153)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!408 ((_ BitVec 64) (_ BitVec 64) V!55153 ListLongMap!22025) Unit!43995)

(assert (=> b!1347775 (= lt!595684 (lemmaInListMapAfterAddingDiffThenInBefore!408 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595683))))

(declare-fun minValue!1245 () V!55153)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91851 0))(
  ( (array!91852 (arr!44381 (Array (_ BitVec 32) (_ BitVec 64))) (size!44933 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91851)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17870 0))(
  ( (ValueCellFull!17870 (v!21493 V!55153)) (EmptyCell!17870) )
))
(declare-datatypes ((array!91853 0))(
  ( (array!91854 (arr!44382 (Array (_ BitVec 32) ValueCell!17870)) (size!44934 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91853)

(declare-fun +!4875 (ListLongMap!22025 tuple2!24368) ListLongMap!22025)

(declare-fun getCurrentListMapNoExtraKeys!6523 (array!91851 array!91853 (_ BitVec 32) (_ BitVec 32) V!55153 V!55153 (_ BitVec 32) Int) ListLongMap!22025)

(declare-fun get!22430 (ValueCell!17870 V!55153) V!55153)

(declare-fun dynLambda!3805 (Int (_ BitVec 64)) V!55153)

(assert (=> b!1347775 (= lt!595683 (+!4875 (getCurrentListMapNoExtraKeys!6523 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24369 (select (arr!44381 _keys!1571) from!1960) (get!22430 (select (arr!44382 _values!1303) from!1960) (dynLambda!3805 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347776 () Bool)

(declare-fun res!894275 () Bool)

(assert (=> b!1347776 (=> (not res!894275) (not e!766798))))

(declare-datatypes ((List!31502 0))(
  ( (Nil!31499) (Cons!31498 (h!32707 (_ BitVec 64)) (t!46110 List!31502)) )
))
(declare-fun arrayNoDuplicates!0 (array!91851 (_ BitVec 32) List!31502) Bool)

(assert (=> b!1347776 (= res!894275 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31499))))

(declare-fun mapNonEmpty!58016 () Bool)

(declare-fun mapRes!58016 () Bool)

(declare-fun tp!110421 () Bool)

(declare-fun e!766797 () Bool)

(assert (=> mapNonEmpty!58016 (= mapRes!58016 (and tp!110421 e!766797))))

(declare-fun mapRest!58016 () (Array (_ BitVec 32) ValueCell!17870))

(declare-fun mapKey!58016 () (_ BitVec 32))

(declare-fun mapValue!58016 () ValueCell!17870)

(assert (=> mapNonEmpty!58016 (= (arr!44382 _values!1303) (store mapRest!58016 mapKey!58016 mapValue!58016))))

(declare-fun b!1347777 () Bool)

(declare-fun res!894281 () Bool)

(assert (=> b!1347777 (=> (not res!894281) (not e!766798))))

(assert (=> b!1347777 (= res!894281 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44933 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347778 () Bool)

(declare-fun res!894280 () Bool)

(assert (=> b!1347778 (=> (not res!894280) (not e!766798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347778 (= res!894280 (validKeyInArray!0 (select (arr!44381 _keys!1571) from!1960)))))

(declare-fun b!1347779 () Bool)

(declare-fun res!894274 () Bool)

(assert (=> b!1347779 (=> (not res!894274) (not e!766798))))

(assert (=> b!1347779 (= res!894274 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347780 () Bool)

(declare-fun e!766796 () Bool)

(declare-fun tp_is_empty!37537 () Bool)

(assert (=> b!1347780 (= e!766796 tp_is_empty!37537)))

(declare-fun b!1347781 () Bool)

(assert (=> b!1347781 (= e!766797 tp_is_empty!37537)))

(declare-fun b!1347782 () Bool)

(declare-fun res!894276 () Bool)

(assert (=> b!1347782 (=> (not res!894276) (not e!766798))))

(declare-fun getCurrentListMap!5861 (array!91851 array!91853 (_ BitVec 32) (_ BitVec 32) V!55153 V!55153 (_ BitVec 32) Int) ListLongMap!22025)

(assert (=> b!1347782 (= res!894276 (contains!9133 (getCurrentListMap!5861 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347783 () Bool)

(declare-fun res!894277 () Bool)

(assert (=> b!1347783 (=> (not res!894277) (not e!766798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91851 (_ BitVec 32)) Bool)

(assert (=> b!1347783 (= res!894277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894278 () Bool)

(assert (=> start!113544 (=> (not res!894278) (not e!766798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113544 (= res!894278 (validMask!0 mask!1977))))

(assert (=> start!113544 e!766798))

(assert (=> start!113544 tp_is_empty!37537))

(assert (=> start!113544 true))

(declare-fun array_inv!33629 (array!91851) Bool)

(assert (=> start!113544 (array_inv!33629 _keys!1571)))

(declare-fun e!766795 () Bool)

(declare-fun array_inv!33630 (array!91853) Bool)

(assert (=> start!113544 (and (array_inv!33630 _values!1303) e!766795)))

(assert (=> start!113544 tp!110420))

(declare-fun b!1347784 () Bool)

(declare-fun res!894279 () Bool)

(assert (=> b!1347784 (=> (not res!894279) (not e!766798))))

(assert (=> b!1347784 (= res!894279 (not (= (select (arr!44381 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347785 () Bool)

(assert (=> b!1347785 (= e!766795 (and e!766796 mapRes!58016))))

(declare-fun condMapEmpty!58016 () Bool)

(declare-fun mapDefault!58016 () ValueCell!17870)

(assert (=> b!1347785 (= condMapEmpty!58016 (= (arr!44382 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17870)) mapDefault!58016)))))

(declare-fun mapIsEmpty!58016 () Bool)

(assert (=> mapIsEmpty!58016 mapRes!58016))

(declare-fun b!1347786 () Bool)

(declare-fun res!894282 () Bool)

(assert (=> b!1347786 (=> (not res!894282) (not e!766798))))

(assert (=> b!1347786 (= res!894282 (and (= (size!44934 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44933 _keys!1571) (size!44934 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113544 res!894278) b!1347786))

(assert (= (and b!1347786 res!894282) b!1347783))

(assert (= (and b!1347783 res!894277) b!1347776))

(assert (= (and b!1347776 res!894275) b!1347777))

(assert (= (and b!1347777 res!894281) b!1347782))

(assert (= (and b!1347782 res!894276) b!1347784))

(assert (= (and b!1347784 res!894279) b!1347778))

(assert (= (and b!1347778 res!894280) b!1347779))

(assert (= (and b!1347779 res!894274) b!1347775))

(assert (= (and b!1347785 condMapEmpty!58016) mapIsEmpty!58016))

(assert (= (and b!1347785 (not condMapEmpty!58016)) mapNonEmpty!58016))

(get-info :version)

(assert (= (and mapNonEmpty!58016 ((_ is ValueCellFull!17870) mapValue!58016)) b!1347781))

(assert (= (and b!1347785 ((_ is ValueCellFull!17870) mapDefault!58016)) b!1347780))

(assert (= start!113544 b!1347785))

(declare-fun b_lambda!24601 () Bool)

(assert (=> (not b_lambda!24601) (not b!1347775)))

(declare-fun t!46108 () Bool)

(declare-fun tb!12411 () Bool)

(assert (=> (and start!113544 (= defaultEntry!1306 defaultEntry!1306) t!46108) tb!12411))

(declare-fun result!25923 () Bool)

(assert (=> tb!12411 (= result!25923 tp_is_empty!37537)))

(assert (=> b!1347775 t!46108))

(declare-fun b_and!50847 () Bool)

(assert (= b_and!50845 (and (=> t!46108 result!25923) b_and!50847)))

(declare-fun m!1234373 () Bool)

(assert (=> mapNonEmpty!58016 m!1234373))

(declare-fun m!1234375 () Bool)

(assert (=> b!1347775 m!1234375))

(declare-fun m!1234377 () Bool)

(assert (=> b!1347775 m!1234377))

(declare-fun m!1234379 () Bool)

(assert (=> b!1347775 m!1234379))

(declare-fun m!1234381 () Bool)

(assert (=> b!1347775 m!1234381))

(assert (=> b!1347775 m!1234375))

(declare-fun m!1234383 () Bool)

(assert (=> b!1347775 m!1234383))

(assert (=> b!1347775 m!1234377))

(declare-fun m!1234385 () Bool)

(assert (=> b!1347775 m!1234385))

(assert (=> b!1347775 m!1234379))

(declare-fun m!1234387 () Bool)

(assert (=> b!1347775 m!1234387))

(declare-fun m!1234389 () Bool)

(assert (=> b!1347775 m!1234389))

(declare-fun m!1234391 () Bool)

(assert (=> b!1347782 m!1234391))

(assert (=> b!1347782 m!1234391))

(declare-fun m!1234393 () Bool)

(assert (=> b!1347782 m!1234393))

(declare-fun m!1234395 () Bool)

(assert (=> b!1347776 m!1234395))

(declare-fun m!1234397 () Bool)

(assert (=> start!113544 m!1234397))

(declare-fun m!1234399 () Bool)

(assert (=> start!113544 m!1234399))

(declare-fun m!1234401 () Bool)

(assert (=> start!113544 m!1234401))

(declare-fun m!1234403 () Bool)

(assert (=> b!1347783 m!1234403))

(assert (=> b!1347784 m!1234389))

(assert (=> b!1347778 m!1234389))

(assert (=> b!1347778 m!1234389))

(declare-fun m!1234405 () Bool)

(assert (=> b!1347778 m!1234405))

(check-sat tp_is_empty!37537 (not b!1347782) (not b_next!31537) (not b_lambda!24601) b_and!50847 (not b!1347783) (not b!1347778) (not b!1347776) (not start!113544) (not mapNonEmpty!58016) (not b!1347775))
(check-sat b_and!50847 (not b_next!31537))
