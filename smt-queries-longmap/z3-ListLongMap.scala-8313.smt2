; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101228 () Bool)

(assert start!101228)

(declare-fun b_free!26151 () Bool)

(declare-fun b_next!26151 () Bool)

(assert (=> start!101228 (= b_free!26151 (not b_next!26151))))

(declare-fun tp!91474 () Bool)

(declare-fun b_and!43419 () Bool)

(assert (=> start!101228 (= tp!91474 b_and!43419)))

(declare-fun b!1215596 () Bool)

(declare-fun e!690223 () Bool)

(declare-fun e!690220 () Bool)

(assert (=> b!1215596 (= e!690223 e!690220)))

(declare-fun res!807125 () Bool)

(assert (=> b!1215596 (=> (not res!807125) (not e!690220))))

(declare-datatypes ((array!78483 0))(
  ( (array!78484 (arr!37876 (Array (_ BitVec 32) (_ BitVec 64))) (size!38412 (_ BitVec 32))) )
))
(declare-fun lt!552660 () array!78483)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78483 (_ BitVec 32)) Bool)

(assert (=> b!1215596 (= res!807125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552660 mask!1564))))

(declare-fun _keys!1208 () array!78483)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215596 (= lt!552660 (array!78484 (store (arr!37876 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38412 _keys!1208)))))

(declare-fun b!1215597 () Bool)

(declare-fun e!690221 () Bool)

(assert (=> b!1215597 (= e!690221 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!46267 0))(
  ( (V!46268 (val!15484 Int)) )
))
(declare-datatypes ((tuple2!19902 0))(
  ( (tuple2!19903 (_1!9962 (_ BitVec 64)) (_2!9962 V!46267)) )
))
(declare-datatypes ((List!26702 0))(
  ( (Nil!26699) (Cons!26698 (h!27907 tuple2!19902) (t!39833 List!26702)) )
))
(declare-datatypes ((ListLongMap!17871 0))(
  ( (ListLongMap!17872 (toList!8951 List!26702)) )
))
(declare-fun lt!552657 () ListLongMap!17871)

(declare-datatypes ((ValueCell!14718 0))(
  ( (ValueCellFull!14718 (v!18137 V!46267)) (EmptyCell!14718) )
))
(declare-datatypes ((array!78485 0))(
  ( (array!78486 (arr!37877 (Array (_ BitVec 32) ValueCell!14718)) (size!38413 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78485)

(declare-fun minValue!944 () V!46267)

(declare-fun zeroValue!944 () V!46267)

(declare-fun getCurrentListMapNoExtraKeys!5378 (array!78483 array!78485 (_ BitVec 32) (_ BitVec 32) V!46267 V!46267 (_ BitVec 32) Int) ListLongMap!17871)

(declare-fun dynLambda!3267 (Int (_ BitVec 64)) V!46267)

(assert (=> b!1215597 (= lt!552657 (getCurrentListMapNoExtraKeys!5378 lt!552660 (array!78486 (store (arr!37877 _values!996) i!673 (ValueCellFull!14718 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38413 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552658 () ListLongMap!17871)

(assert (=> b!1215597 (= lt!552658 (getCurrentListMapNoExtraKeys!5378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48157 () Bool)

(declare-fun mapRes!48157 () Bool)

(assert (=> mapIsEmpty!48157 mapRes!48157))

(declare-fun b!1215598 () Bool)

(declare-fun res!807126 () Bool)

(assert (=> b!1215598 (=> (not res!807126) (not e!690223))))

(assert (=> b!1215598 (= res!807126 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38412 _keys!1208))))))

(declare-fun b!1215599 () Bool)

(declare-fun res!807121 () Bool)

(assert (=> b!1215599 (=> (not res!807121) (not e!690223))))

(assert (=> b!1215599 (= res!807121 (and (= (size!38413 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38412 _keys!1208) (size!38413 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215600 () Bool)

(declare-fun e!690219 () Bool)

(declare-fun tp_is_empty!30855 () Bool)

(assert (=> b!1215600 (= e!690219 tp_is_empty!30855)))

(declare-fun b!1215601 () Bool)

(declare-fun res!807130 () Bool)

(assert (=> b!1215601 (=> (not res!807130) (not e!690220))))

(declare-datatypes ((List!26703 0))(
  ( (Nil!26700) (Cons!26699 (h!27908 (_ BitVec 64)) (t!39834 List!26703)) )
))
(declare-fun arrayNoDuplicates!0 (array!78483 (_ BitVec 32) List!26703) Bool)

(assert (=> b!1215601 (= res!807130 (arrayNoDuplicates!0 lt!552660 #b00000000000000000000000000000000 Nil!26700))))

(declare-fun b!1215602 () Bool)

(declare-fun res!807128 () Bool)

(assert (=> b!1215602 (=> (not res!807128) (not e!690223))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215602 (= res!807128 (= (select (arr!37876 _keys!1208) i!673) k0!934))))

(declare-fun b!1215603 () Bool)

(declare-fun res!807131 () Bool)

(assert (=> b!1215603 (=> (not res!807131) (not e!690223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215603 (= res!807131 (validMask!0 mask!1564))))

(declare-fun b!1215604 () Bool)

(declare-fun res!807129 () Bool)

(assert (=> b!1215604 (=> (not res!807129) (not e!690223))))

(assert (=> b!1215604 (= res!807129 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26700))))

(declare-fun b!1215605 () Bool)

(assert (=> b!1215605 (= e!690220 (not e!690221))))

(declare-fun res!807124 () Bool)

(assert (=> b!1215605 (=> res!807124 e!690221)))

(assert (=> b!1215605 (= res!807124 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215605 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40304 0))(
  ( (Unit!40305) )
))
(declare-fun lt!552659 () Unit!40304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78483 (_ BitVec 64) (_ BitVec 32)) Unit!40304)

(assert (=> b!1215605 (= lt!552659 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215606 () Bool)

(declare-fun res!807122 () Bool)

(assert (=> b!1215606 (=> (not res!807122) (not e!690223))))

(assert (=> b!1215606 (= res!807122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215607 () Bool)

(declare-fun e!690218 () Bool)

(assert (=> b!1215607 (= e!690218 (and e!690219 mapRes!48157))))

(declare-fun condMapEmpty!48157 () Bool)

(declare-fun mapDefault!48157 () ValueCell!14718)

(assert (=> b!1215607 (= condMapEmpty!48157 (= (arr!37877 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14718)) mapDefault!48157)))))

(declare-fun mapNonEmpty!48157 () Bool)

(declare-fun tp!91475 () Bool)

(declare-fun e!690217 () Bool)

(assert (=> mapNonEmpty!48157 (= mapRes!48157 (and tp!91475 e!690217))))

(declare-fun mapKey!48157 () (_ BitVec 32))

(declare-fun mapRest!48157 () (Array (_ BitVec 32) ValueCell!14718))

(declare-fun mapValue!48157 () ValueCell!14718)

(assert (=> mapNonEmpty!48157 (= (arr!37877 _values!996) (store mapRest!48157 mapKey!48157 mapValue!48157))))

(declare-fun b!1215608 () Bool)

(assert (=> b!1215608 (= e!690217 tp_is_empty!30855)))

(declare-fun res!807127 () Bool)

(assert (=> start!101228 (=> (not res!807127) (not e!690223))))

(assert (=> start!101228 (= res!807127 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38412 _keys!1208))))))

(assert (=> start!101228 e!690223))

(assert (=> start!101228 tp_is_empty!30855))

(declare-fun array_inv!28840 (array!78483) Bool)

(assert (=> start!101228 (array_inv!28840 _keys!1208)))

(assert (=> start!101228 true))

(assert (=> start!101228 tp!91474))

(declare-fun array_inv!28841 (array!78485) Bool)

(assert (=> start!101228 (and (array_inv!28841 _values!996) e!690218)))

(declare-fun b!1215609 () Bool)

(declare-fun res!807123 () Bool)

(assert (=> b!1215609 (=> (not res!807123) (not e!690223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215609 (= res!807123 (validKeyInArray!0 k0!934))))

(assert (= (and start!101228 res!807127) b!1215603))

(assert (= (and b!1215603 res!807131) b!1215599))

(assert (= (and b!1215599 res!807121) b!1215606))

(assert (= (and b!1215606 res!807122) b!1215604))

(assert (= (and b!1215604 res!807129) b!1215598))

(assert (= (and b!1215598 res!807126) b!1215609))

(assert (= (and b!1215609 res!807123) b!1215602))

(assert (= (and b!1215602 res!807128) b!1215596))

(assert (= (and b!1215596 res!807125) b!1215601))

(assert (= (and b!1215601 res!807130) b!1215605))

(assert (= (and b!1215605 (not res!807124)) b!1215597))

(assert (= (and b!1215607 condMapEmpty!48157) mapIsEmpty!48157))

(assert (= (and b!1215607 (not condMapEmpty!48157)) mapNonEmpty!48157))

(get-info :version)

(assert (= (and mapNonEmpty!48157 ((_ is ValueCellFull!14718) mapValue!48157)) b!1215608))

(assert (= (and b!1215607 ((_ is ValueCellFull!14718) mapDefault!48157)) b!1215600))

(assert (= start!101228 b!1215607))

(declare-fun b_lambda!21827 () Bool)

(assert (=> (not b_lambda!21827) (not b!1215597)))

(declare-fun t!39832 () Bool)

(declare-fun tb!10951 () Bool)

(assert (=> (and start!101228 (= defaultEntry!1004 defaultEntry!1004) t!39832) tb!10951))

(declare-fun result!22499 () Bool)

(assert (=> tb!10951 (= result!22499 tp_is_empty!30855)))

(assert (=> b!1215597 t!39832))

(declare-fun b_and!43421 () Bool)

(assert (= b_and!43419 (and (=> t!39832 result!22499) b_and!43421)))

(declare-fun m!1120531 () Bool)

(assert (=> b!1215597 m!1120531))

(declare-fun m!1120533 () Bool)

(assert (=> b!1215597 m!1120533))

(declare-fun m!1120535 () Bool)

(assert (=> b!1215597 m!1120535))

(declare-fun m!1120537 () Bool)

(assert (=> b!1215597 m!1120537))

(declare-fun m!1120539 () Bool)

(assert (=> b!1215609 m!1120539))

(declare-fun m!1120541 () Bool)

(assert (=> b!1215604 m!1120541))

(declare-fun m!1120543 () Bool)

(assert (=> start!101228 m!1120543))

(declare-fun m!1120545 () Bool)

(assert (=> start!101228 m!1120545))

(declare-fun m!1120547 () Bool)

(assert (=> b!1215606 m!1120547))

(declare-fun m!1120549 () Bool)

(assert (=> mapNonEmpty!48157 m!1120549))

(declare-fun m!1120551 () Bool)

(assert (=> b!1215602 m!1120551))

(declare-fun m!1120553 () Bool)

(assert (=> b!1215603 m!1120553))

(declare-fun m!1120555 () Bool)

(assert (=> b!1215605 m!1120555))

(declare-fun m!1120557 () Bool)

(assert (=> b!1215605 m!1120557))

(declare-fun m!1120559 () Bool)

(assert (=> b!1215596 m!1120559))

(declare-fun m!1120561 () Bool)

(assert (=> b!1215596 m!1120561))

(declare-fun m!1120563 () Bool)

(assert (=> b!1215601 m!1120563))

(check-sat tp_is_empty!30855 (not b!1215596) (not b!1215605) b_and!43421 (not b!1215606) (not b!1215597) (not b!1215601) (not b_next!26151) (not b!1215603) (not b_lambda!21827) (not b!1215609) (not b!1215604) (not start!101228) (not mapNonEmpty!48157))
(check-sat b_and!43421 (not b_next!26151))
