; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111434 () Bool)

(assert start!111434)

(declare-fun b_free!30091 () Bool)

(declare-fun b_next!30091 () Bool)

(assert (=> start!111434 (= b_free!30091 (not b_next!30091))))

(declare-fun tp!105750 () Bool)

(declare-fun b_and!48323 () Bool)

(assert (=> start!111434 (= tp!105750 b_and!48323)))

(declare-fun b!1318740 () Bool)

(declare-fun e!752490 () Bool)

(declare-fun e!752487 () Bool)

(declare-fun mapRes!55514 () Bool)

(assert (=> b!1318740 (= e!752490 (and e!752487 mapRes!55514))))

(declare-fun condMapEmpty!55514 () Bool)

(declare-datatypes ((V!52985 0))(
  ( (V!52986 (val!18030 Int)) )
))
(declare-datatypes ((ValueCell!17057 0))(
  ( (ValueCellFull!17057 (v!20659 V!52985)) (EmptyCell!17057) )
))
(declare-datatypes ((array!88689 0))(
  ( (array!88690 (arr!42819 (Array (_ BitVec 32) ValueCell!17057)) (size!43371 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88689)

(declare-fun mapDefault!55514 () ValueCell!17057)

(assert (=> b!1318740 (= condMapEmpty!55514 (= (arr!42819 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17057)) mapDefault!55514)))))

(declare-fun mapNonEmpty!55514 () Bool)

(declare-fun tp!105749 () Bool)

(declare-fun e!752491 () Bool)

(assert (=> mapNonEmpty!55514 (= mapRes!55514 (and tp!105749 e!752491))))

(declare-fun mapKey!55514 () (_ BitVec 32))

(declare-fun mapRest!55514 () (Array (_ BitVec 32) ValueCell!17057))

(declare-fun mapValue!55514 () ValueCell!17057)

(assert (=> mapNonEmpty!55514 (= (arr!42819 _values!1337) (store mapRest!55514 mapKey!55514 mapValue!55514))))

(declare-fun mapIsEmpty!55514 () Bool)

(assert (=> mapIsEmpty!55514 mapRes!55514))

(declare-fun res!875243 () Bool)

(declare-fun e!752488 () Bool)

(assert (=> start!111434 (=> (not res!875243) (not e!752488))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111434 (= res!875243 (validMask!0 mask!2019))))

(assert (=> start!111434 e!752488))

(declare-datatypes ((array!88691 0))(
  ( (array!88692 (arr!42820 (Array (_ BitVec 32) (_ BitVec 64))) (size!43372 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88691)

(declare-fun array_inv!32517 (array!88691) Bool)

(assert (=> start!111434 (array_inv!32517 _keys!1609)))

(assert (=> start!111434 true))

(declare-fun tp_is_empty!35911 () Bool)

(assert (=> start!111434 tp_is_empty!35911))

(declare-fun array_inv!32518 (array!88689) Bool)

(assert (=> start!111434 (and (array_inv!32518 _values!1337) e!752490)))

(assert (=> start!111434 tp!105750))

(declare-fun b!1318741 () Bool)

(declare-fun res!875240 () Bool)

(assert (=> b!1318741 (=> (not res!875240) (not e!752488))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318741 (= res!875240 (validKeyInArray!0 (select (arr!42820 _keys!1609) from!2000)))))

(declare-fun b!1318742 () Bool)

(declare-fun res!875244 () Bool)

(assert (=> b!1318742 (=> (not res!875244) (not e!752488))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318742 (= res!875244 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43372 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318743 () Bool)

(declare-fun res!875241 () Bool)

(assert (=> b!1318743 (=> (not res!875241) (not e!752488))))

(declare-datatypes ((List!30428 0))(
  ( (Nil!30425) (Cons!30424 (h!31633 (_ BitVec 64)) (t!44060 List!30428)) )
))
(declare-fun arrayNoDuplicates!0 (array!88691 (_ BitVec 32) List!30428) Bool)

(assert (=> b!1318743 (= res!875241 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30425))))

(declare-fun b!1318744 () Bool)

(declare-fun res!875245 () Bool)

(assert (=> b!1318744 (=> (not res!875245) (not e!752488))))

(declare-fun zeroValue!1279 () V!52985)

(declare-fun minValue!1279 () V!52985)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23290 0))(
  ( (tuple2!23291 (_1!11656 (_ BitVec 64)) (_2!11656 V!52985)) )
))
(declare-datatypes ((List!30429 0))(
  ( (Nil!30426) (Cons!30425 (h!31634 tuple2!23290) (t!44061 List!30429)) )
))
(declare-datatypes ((ListLongMap!20947 0))(
  ( (ListLongMap!20948 (toList!10489 List!30429)) )
))
(declare-fun contains!8572 (ListLongMap!20947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5382 (array!88691 array!88689 (_ BitVec 32) (_ BitVec 32) V!52985 V!52985 (_ BitVec 32) Int) ListLongMap!20947)

(assert (=> b!1318744 (= res!875245 (contains!8572 (getCurrentListMap!5382 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318745 () Bool)

(declare-fun res!875242 () Bool)

(assert (=> b!1318745 (=> (not res!875242) (not e!752488))))

(assert (=> b!1318745 (= res!875242 (and (= (size!43371 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43372 _keys!1609) (size!43371 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318746 () Bool)

(assert (=> b!1318746 (= e!752488 (not true))))

(declare-fun lt!586346 () ListLongMap!20947)

(assert (=> b!1318746 (contains!8572 lt!586346 k0!1164)))

(declare-datatypes ((Unit!43259 0))(
  ( (Unit!43260) )
))
(declare-fun lt!586347 () Unit!43259)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!103 ((_ BitVec 64) (_ BitVec 64) V!52985 ListLongMap!20947) Unit!43259)

(assert (=> b!1318746 (= lt!586347 (lemmaInListMapAfterAddingDiffThenInBefore!103 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586346))))

(declare-fun +!4538 (ListLongMap!20947 tuple2!23290) ListLongMap!20947)

(declare-fun getCurrentListMapNoExtraKeys!6171 (array!88691 array!88689 (_ BitVec 32) (_ BitVec 32) V!52985 V!52985 (_ BitVec 32) Int) ListLongMap!20947)

(declare-fun get!21527 (ValueCell!17057 V!52985) V!52985)

(declare-fun dynLambda!3468 (Int (_ BitVec 64)) V!52985)

(assert (=> b!1318746 (= lt!586346 (+!4538 (+!4538 (getCurrentListMapNoExtraKeys!6171 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23291 (select (arr!42820 _keys!1609) from!2000) (get!21527 (select (arr!42819 _values!1337) from!2000) (dynLambda!3468 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318747 () Bool)

(assert (=> b!1318747 (= e!752491 tp_is_empty!35911)))

(declare-fun b!1318748 () Bool)

(declare-fun res!875246 () Bool)

(assert (=> b!1318748 (=> (not res!875246) (not e!752488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88691 (_ BitVec 32)) Bool)

(assert (=> b!1318748 (= res!875246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318749 () Bool)

(assert (=> b!1318749 (= e!752487 tp_is_empty!35911)))

(declare-fun b!1318750 () Bool)

(declare-fun res!875247 () Bool)

(assert (=> b!1318750 (=> (not res!875247) (not e!752488))))

(assert (=> b!1318750 (= res!875247 (not (= (select (arr!42820 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111434 res!875243) b!1318745))

(assert (= (and b!1318745 res!875242) b!1318748))

(assert (= (and b!1318748 res!875246) b!1318743))

(assert (= (and b!1318743 res!875241) b!1318742))

(assert (= (and b!1318742 res!875244) b!1318744))

(assert (= (and b!1318744 res!875245) b!1318750))

(assert (= (and b!1318750 res!875247) b!1318741))

(assert (= (and b!1318741 res!875240) b!1318746))

(assert (= (and b!1318740 condMapEmpty!55514) mapIsEmpty!55514))

(assert (= (and b!1318740 (not condMapEmpty!55514)) mapNonEmpty!55514))

(get-info :version)

(assert (= (and mapNonEmpty!55514 ((_ is ValueCellFull!17057) mapValue!55514)) b!1318747))

(assert (= (and b!1318740 ((_ is ValueCellFull!17057) mapDefault!55514)) b!1318749))

(assert (= start!111434 b!1318740))

(declare-fun b_lambda!23407 () Bool)

(assert (=> (not b_lambda!23407) (not b!1318746)))

(declare-fun t!44059 () Bool)

(declare-fun tb!11435 () Bool)

(assert (=> (and start!111434 (= defaultEntry!1340 defaultEntry!1340) t!44059) tb!11435))

(declare-fun result!23933 () Bool)

(assert (=> tb!11435 (= result!23933 tp_is_empty!35911)))

(assert (=> b!1318746 t!44059))

(declare-fun b_and!48325 () Bool)

(assert (= b_and!48323 (and (=> t!44059 result!23933) b_and!48325)))

(declare-fun m!1205871 () Bool)

(assert (=> mapNonEmpty!55514 m!1205871))

(declare-fun m!1205873 () Bool)

(assert (=> start!111434 m!1205873))

(declare-fun m!1205875 () Bool)

(assert (=> start!111434 m!1205875))

(declare-fun m!1205877 () Bool)

(assert (=> start!111434 m!1205877))

(declare-fun m!1205879 () Bool)

(assert (=> b!1318750 m!1205879))

(declare-fun m!1205881 () Bool)

(assert (=> b!1318746 m!1205881))

(declare-fun m!1205883 () Bool)

(assert (=> b!1318746 m!1205883))

(assert (=> b!1318746 m!1205881))

(declare-fun m!1205885 () Bool)

(assert (=> b!1318746 m!1205885))

(declare-fun m!1205887 () Bool)

(assert (=> b!1318746 m!1205887))

(declare-fun m!1205889 () Bool)

(assert (=> b!1318746 m!1205889))

(assert (=> b!1318746 m!1205885))

(declare-fun m!1205891 () Bool)

(assert (=> b!1318746 m!1205891))

(assert (=> b!1318746 m!1205889))

(assert (=> b!1318746 m!1205883))

(declare-fun m!1205893 () Bool)

(assert (=> b!1318746 m!1205893))

(declare-fun m!1205895 () Bool)

(assert (=> b!1318746 m!1205895))

(assert (=> b!1318746 m!1205879))

(declare-fun m!1205897 () Bool)

(assert (=> b!1318743 m!1205897))

(assert (=> b!1318741 m!1205879))

(assert (=> b!1318741 m!1205879))

(declare-fun m!1205899 () Bool)

(assert (=> b!1318741 m!1205899))

(declare-fun m!1205901 () Bool)

(assert (=> b!1318748 m!1205901))

(declare-fun m!1205903 () Bool)

(assert (=> b!1318744 m!1205903))

(assert (=> b!1318744 m!1205903))

(declare-fun m!1205905 () Bool)

(assert (=> b!1318744 m!1205905))

(check-sat (not b_lambda!23407) (not b_next!30091) (not mapNonEmpty!55514) (not b!1318746) (not b!1318741) (not b!1318744) (not start!111434) (not b!1318748) tp_is_empty!35911 b_and!48325 (not b!1318743))
(check-sat b_and!48325 (not b_next!30091))
