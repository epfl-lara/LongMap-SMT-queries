; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113540 () Bool)

(assert start!113540)

(declare-fun b_free!31533 () Bool)

(declare-fun b_next!31533 () Bool)

(assert (=> start!113540 (= b_free!31533 (not b_next!31533))))

(declare-fun tp!110407 () Bool)

(declare-fun b_and!50855 () Bool)

(assert (=> start!113540 (= tp!110407 b_and!50855)))

(declare-fun mapIsEmpty!58010 () Bool)

(declare-fun mapRes!58010 () Bool)

(assert (=> mapIsEmpty!58010 mapRes!58010))

(declare-fun b!1347769 () Bool)

(declare-fun e!766802 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((V!55147 0))(
  ( (V!55148 (val!18841 Int)) )
))
(declare-datatypes ((ValueCell!17868 0))(
  ( (ValueCellFull!17868 (v!21492 V!55147)) (EmptyCell!17868) )
))
(declare-datatypes ((array!91898 0))(
  ( (array!91899 (arr!44404 (Array (_ BitVec 32) ValueCell!17868)) (size!44954 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91898)

(assert (=> b!1347769 (= e!766802 (not (bvslt from!1960 (size!44954 _values!1303))))))

(declare-datatypes ((tuple2!24290 0))(
  ( (tuple2!24291 (_1!12156 (_ BitVec 64)) (_2!12156 V!55147)) )
))
(declare-datatypes ((List!31444 0))(
  ( (Nil!31441) (Cons!31440 (h!32649 tuple2!24290) (t!46056 List!31444)) )
))
(declare-datatypes ((ListLongMap!21947 0))(
  ( (ListLongMap!21948 (toList!10989 List!31444)) )
))
(declare-fun lt!595858 () ListLongMap!21947)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9167 (ListLongMap!21947 (_ BitVec 64)) Bool)

(assert (=> b!1347769 (contains!9167 lt!595858 k0!1142)))

(declare-fun zeroValue!1245 () V!55147)

(declare-datatypes ((Unit!44160 0))(
  ( (Unit!44161) )
))
(declare-fun lt!595857 () Unit!44160)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!403 ((_ BitVec 64) (_ BitVec 64) V!55147 ListLongMap!21947) Unit!44160)

(assert (=> b!1347769 (= lt!595857 (lemmaInListMapAfterAddingDiffThenInBefore!403 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595858))))

(declare-fun minValue!1245 () V!55147)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91900 0))(
  ( (array!91901 (arr!44405 (Array (_ BitVec 32) (_ BitVec 64))) (size!44955 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91900)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun +!4842 (ListLongMap!21947 tuple2!24290) ListLongMap!21947)

(declare-fun getCurrentListMapNoExtraKeys!6488 (array!91900 array!91898 (_ BitVec 32) (_ BitVec 32) V!55147 V!55147 (_ BitVec 32) Int) ListLongMap!21947)

(declare-fun get!22428 (ValueCell!17868 V!55147) V!55147)

(declare-fun dynLambda!3781 (Int (_ BitVec 64)) V!55147)

(assert (=> b!1347769 (= lt!595858 (+!4842 (getCurrentListMapNoExtraKeys!6488 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24291 (select (arr!44405 _keys!1571) from!1960) (get!22428 (select (arr!44404 _values!1303) from!1960) (dynLambda!3781 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347770 () Bool)

(declare-fun res!894250 () Bool)

(assert (=> b!1347770 (=> (not res!894250) (not e!766802))))

(assert (=> b!1347770 (= res!894250 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44955 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347771 () Bool)

(declare-fun res!894252 () Bool)

(assert (=> b!1347771 (=> (not res!894252) (not e!766802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91900 (_ BitVec 32)) Bool)

(assert (=> b!1347771 (= res!894252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347772 () Bool)

(declare-fun res!894257 () Bool)

(assert (=> b!1347772 (=> (not res!894257) (not e!766802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347772 (= res!894257 (validKeyInArray!0 (select (arr!44405 _keys!1571) from!1960)))))

(declare-fun b!1347773 () Bool)

(declare-fun e!766799 () Bool)

(declare-fun e!766800 () Bool)

(assert (=> b!1347773 (= e!766799 (and e!766800 mapRes!58010))))

(declare-fun condMapEmpty!58010 () Bool)

(declare-fun mapDefault!58010 () ValueCell!17868)

(assert (=> b!1347773 (= condMapEmpty!58010 (= (arr!44404 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17868)) mapDefault!58010)))))

(declare-fun b!1347774 () Bool)

(declare-fun res!894253 () Bool)

(assert (=> b!1347774 (=> (not res!894253) (not e!766802))))

(assert (=> b!1347774 (= res!894253 (not (= (select (arr!44405 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347775 () Bool)

(declare-fun tp_is_empty!37533 () Bool)

(assert (=> b!1347775 (= e!766800 tp_is_empty!37533)))

(declare-fun res!894255 () Bool)

(assert (=> start!113540 (=> (not res!894255) (not e!766802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113540 (= res!894255 (validMask!0 mask!1977))))

(assert (=> start!113540 e!766802))

(assert (=> start!113540 tp_is_empty!37533))

(assert (=> start!113540 true))

(declare-fun array_inv!33453 (array!91900) Bool)

(assert (=> start!113540 (array_inv!33453 _keys!1571)))

(declare-fun array_inv!33454 (array!91898) Bool)

(assert (=> start!113540 (and (array_inv!33454 _values!1303) e!766799)))

(assert (=> start!113540 tp!110407))

(declare-fun b!1347776 () Bool)

(declare-fun e!766798 () Bool)

(assert (=> b!1347776 (= e!766798 tp_is_empty!37533)))

(declare-fun mapNonEmpty!58010 () Bool)

(declare-fun tp!110408 () Bool)

(assert (=> mapNonEmpty!58010 (= mapRes!58010 (and tp!110408 e!766798))))

(declare-fun mapValue!58010 () ValueCell!17868)

(declare-fun mapRest!58010 () (Array (_ BitVec 32) ValueCell!17868))

(declare-fun mapKey!58010 () (_ BitVec 32))

(assert (=> mapNonEmpty!58010 (= (arr!44404 _values!1303) (store mapRest!58010 mapKey!58010 mapValue!58010))))

(declare-fun b!1347777 () Bool)

(declare-fun res!894254 () Bool)

(assert (=> b!1347777 (=> (not res!894254) (not e!766802))))

(declare-fun getCurrentListMap!5940 (array!91900 array!91898 (_ BitVec 32) (_ BitVec 32) V!55147 V!55147 (_ BitVec 32) Int) ListLongMap!21947)

(assert (=> b!1347777 (= res!894254 (contains!9167 (getCurrentListMap!5940 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347778 () Bool)

(declare-fun res!894251 () Bool)

(assert (=> b!1347778 (=> (not res!894251) (not e!766802))))

(assert (=> b!1347778 (= res!894251 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347779 () Bool)

(declare-fun res!894256 () Bool)

(assert (=> b!1347779 (=> (not res!894256) (not e!766802))))

(declare-datatypes ((List!31445 0))(
  ( (Nil!31442) (Cons!31441 (h!32650 (_ BitVec 64)) (t!46057 List!31445)) )
))
(declare-fun arrayNoDuplicates!0 (array!91900 (_ BitVec 32) List!31445) Bool)

(assert (=> b!1347779 (= res!894256 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31442))))

(declare-fun b!1347780 () Bool)

(declare-fun res!894249 () Bool)

(assert (=> b!1347780 (=> (not res!894249) (not e!766802))))

(assert (=> b!1347780 (= res!894249 (and (= (size!44954 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44955 _keys!1571) (size!44954 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113540 res!894255) b!1347780))

(assert (= (and b!1347780 res!894249) b!1347771))

(assert (= (and b!1347771 res!894252) b!1347779))

(assert (= (and b!1347779 res!894256) b!1347770))

(assert (= (and b!1347770 res!894250) b!1347777))

(assert (= (and b!1347777 res!894254) b!1347774))

(assert (= (and b!1347774 res!894253) b!1347772))

(assert (= (and b!1347772 res!894257) b!1347778))

(assert (= (and b!1347778 res!894251) b!1347769))

(assert (= (and b!1347773 condMapEmpty!58010) mapIsEmpty!58010))

(assert (= (and b!1347773 (not condMapEmpty!58010)) mapNonEmpty!58010))

(get-info :version)

(assert (= (and mapNonEmpty!58010 ((_ is ValueCellFull!17868) mapValue!58010)) b!1347776))

(assert (= (and b!1347773 ((_ is ValueCellFull!17868) mapDefault!58010)) b!1347775))

(assert (= start!113540 b!1347773))

(declare-fun b_lambda!24607 () Bool)

(assert (=> (not b_lambda!24607) (not b!1347769)))

(declare-fun t!46055 () Bool)

(declare-fun tb!12415 () Bool)

(assert (=> (and start!113540 (= defaultEntry!1306 defaultEntry!1306) t!46055) tb!12415))

(declare-fun result!25923 () Bool)

(assert (=> tb!12415 (= result!25923 tp_is_empty!37533)))

(assert (=> b!1347769 t!46055))

(declare-fun b_and!50857 () Bool)

(assert (= b_and!50855 (and (=> t!46055 result!25923) b_and!50857)))

(declare-fun m!1234821 () Bool)

(assert (=> b!1347777 m!1234821))

(assert (=> b!1347777 m!1234821))

(declare-fun m!1234823 () Bool)

(assert (=> b!1347777 m!1234823))

(declare-fun m!1234825 () Bool)

(assert (=> b!1347779 m!1234825))

(declare-fun m!1234827 () Bool)

(assert (=> b!1347769 m!1234827))

(declare-fun m!1234829 () Bool)

(assert (=> b!1347769 m!1234829))

(assert (=> b!1347769 m!1234829))

(declare-fun m!1234831 () Bool)

(assert (=> b!1347769 m!1234831))

(declare-fun m!1234833 () Bool)

(assert (=> b!1347769 m!1234833))

(declare-fun m!1234835 () Bool)

(assert (=> b!1347769 m!1234835))

(declare-fun m!1234837 () Bool)

(assert (=> b!1347769 m!1234837))

(assert (=> b!1347769 m!1234833))

(assert (=> b!1347769 m!1234835))

(declare-fun m!1234839 () Bool)

(assert (=> b!1347769 m!1234839))

(declare-fun m!1234841 () Bool)

(assert (=> b!1347769 m!1234841))

(declare-fun m!1234843 () Bool)

(assert (=> b!1347771 m!1234843))

(declare-fun m!1234845 () Bool)

(assert (=> start!113540 m!1234845))

(declare-fun m!1234847 () Bool)

(assert (=> start!113540 m!1234847))

(declare-fun m!1234849 () Bool)

(assert (=> start!113540 m!1234849))

(assert (=> b!1347774 m!1234837))

(assert (=> b!1347772 m!1234837))

(assert (=> b!1347772 m!1234837))

(declare-fun m!1234851 () Bool)

(assert (=> b!1347772 m!1234851))

(declare-fun m!1234853 () Bool)

(assert (=> mapNonEmpty!58010 m!1234853))

(check-sat (not start!113540) (not b_next!31533) (not b!1347777) (not b!1347772) b_and!50857 (not b!1347779) tp_is_empty!37533 (not mapNonEmpty!58010) (not b!1347771) (not b_lambda!24607) (not b!1347769))
(check-sat b_and!50857 (not b_next!31533))
