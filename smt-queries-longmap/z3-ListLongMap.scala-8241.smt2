; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100630 () Bool)

(assert start!100630)

(declare-fun b_free!25717 () Bool)

(declare-fun b_next!25717 () Bool)

(assert (=> start!100630 (= b_free!25717 (not b_next!25717))))

(declare-fun tp!90140 () Bool)

(declare-fun b_and!42335 () Bool)

(assert (=> start!100630 (= tp!90140 b_and!42335)))

(declare-fun b!1199477 () Bool)

(declare-fun e!681474 () Bool)

(assert (=> b!1199477 (= e!681474 true)))

(declare-datatypes ((V!45689 0))(
  ( (V!45690 (val!15267 Int)) )
))
(declare-fun zeroValue!944 () V!45689)

(declare-datatypes ((array!77657 0))(
  ( (array!77658 (arr!37467 (Array (_ BitVec 32) (_ BitVec 64))) (size!38004 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19560 0))(
  ( (tuple2!19561 (_1!9791 (_ BitVec 64)) (_2!9791 V!45689)) )
))
(declare-datatypes ((List!26371 0))(
  ( (Nil!26368) (Cons!26367 (h!27585 tuple2!19560) (t!39070 List!26371)) )
))
(declare-datatypes ((ListLongMap!17537 0))(
  ( (ListLongMap!17538 (toList!8784 List!26371)) )
))
(declare-fun lt!543925 () ListLongMap!17537)

(declare-datatypes ((ValueCell!14501 0))(
  ( (ValueCellFull!14501 (v!17901 V!45689)) (EmptyCell!14501) )
))
(declare-datatypes ((array!77659 0))(
  ( (array!77660 (arr!37468 (Array (_ BitVec 32) ValueCell!14501)) (size!38005 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77659)

(declare-fun minValue!944 () V!45689)

(declare-fun getCurrentListMapNoExtraKeys!5251 (array!77657 array!77659 (_ BitVec 32) (_ BitVec 32) V!45689 V!45689 (_ BitVec 32) Int) ListLongMap!17537)

(assert (=> b!1199477 (= lt!543925 (getCurrentListMapNoExtraKeys!5251 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199478 () Bool)

(declare-fun res!797923 () Bool)

(declare-fun e!681479 () Bool)

(assert (=> b!1199478 (=> (not res!797923) (not e!681479))))

(declare-datatypes ((List!26372 0))(
  ( (Nil!26369) (Cons!26368 (h!27586 (_ BitVec 64)) (t!39071 List!26372)) )
))
(declare-fun arrayNoDuplicates!0 (array!77657 (_ BitVec 32) List!26372) Bool)

(assert (=> b!1199478 (= res!797923 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26369))))

(declare-fun b!1199479 () Bool)

(declare-fun res!797916 () Bool)

(assert (=> b!1199479 (=> (not res!797916) (not e!681479))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199479 (= res!797916 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47474 () Bool)

(declare-fun mapRes!47474 () Bool)

(assert (=> mapIsEmpty!47474 mapRes!47474))

(declare-fun b!1199480 () Bool)

(declare-fun res!797926 () Bool)

(declare-fun e!681477 () Bool)

(assert (=> b!1199480 (=> (not res!797926) (not e!681477))))

(declare-fun lt!543926 () array!77657)

(assert (=> b!1199480 (= res!797926 (arrayNoDuplicates!0 lt!543926 #b00000000000000000000000000000000 Nil!26369))))

(declare-fun b!1199481 () Bool)

(declare-fun res!797919 () Bool)

(assert (=> b!1199481 (=> (not res!797919) (not e!681479))))

(assert (=> b!1199481 (= res!797919 (and (= (size!38005 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38004 _keys!1208) (size!38005 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199482 () Bool)

(declare-fun e!681473 () Bool)

(declare-fun tp_is_empty!30421 () Bool)

(assert (=> b!1199482 (= e!681473 tp_is_empty!30421)))

(declare-fun mapNonEmpty!47474 () Bool)

(declare-fun tp!90141 () Bool)

(assert (=> mapNonEmpty!47474 (= mapRes!47474 (and tp!90141 e!681473))))

(declare-fun mapRest!47474 () (Array (_ BitVec 32) ValueCell!14501))

(declare-fun mapValue!47474 () ValueCell!14501)

(declare-fun mapKey!47474 () (_ BitVec 32))

(assert (=> mapNonEmpty!47474 (= (arr!37468 _values!996) (store mapRest!47474 mapKey!47474 mapValue!47474))))

(declare-fun b!1199483 () Bool)

(declare-fun res!797917 () Bool)

(assert (=> b!1199483 (=> (not res!797917) (not e!681479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199483 (= res!797917 (validMask!0 mask!1564))))

(declare-fun b!1199484 () Bool)

(assert (=> b!1199484 (= e!681477 (not e!681474))))

(declare-fun res!797924 () Bool)

(assert (=> b!1199484 (=> res!797924 e!681474)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199484 (= res!797924 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199484 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39695 0))(
  ( (Unit!39696) )
))
(declare-fun lt!543924 () Unit!39695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77657 (_ BitVec 64) (_ BitVec 32)) Unit!39695)

(assert (=> b!1199484 (= lt!543924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199485 () Bool)

(declare-fun res!797918 () Bool)

(assert (=> b!1199485 (=> (not res!797918) (not e!681479))))

(assert (=> b!1199485 (= res!797918 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38004 _keys!1208))))))

(declare-fun res!797922 () Bool)

(assert (=> start!100630 (=> (not res!797922) (not e!681479))))

(assert (=> start!100630 (= res!797922 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38004 _keys!1208))))))

(assert (=> start!100630 e!681479))

(assert (=> start!100630 tp_is_empty!30421))

(declare-fun array_inv!28628 (array!77657) Bool)

(assert (=> start!100630 (array_inv!28628 _keys!1208)))

(assert (=> start!100630 true))

(assert (=> start!100630 tp!90140))

(declare-fun e!681476 () Bool)

(declare-fun array_inv!28629 (array!77659) Bool)

(assert (=> start!100630 (and (array_inv!28629 _values!996) e!681476)))

(declare-fun b!1199486 () Bool)

(declare-fun e!681475 () Bool)

(assert (=> b!1199486 (= e!681476 (and e!681475 mapRes!47474))))

(declare-fun condMapEmpty!47474 () Bool)

(declare-fun mapDefault!47474 () ValueCell!14501)

(assert (=> b!1199486 (= condMapEmpty!47474 (= (arr!37468 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14501)) mapDefault!47474)))))

(declare-fun b!1199487 () Bool)

(declare-fun res!797925 () Bool)

(assert (=> b!1199487 (=> (not res!797925) (not e!681479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77657 (_ BitVec 32)) Bool)

(assert (=> b!1199487 (= res!797925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199488 () Bool)

(declare-fun res!797920 () Bool)

(assert (=> b!1199488 (=> (not res!797920) (not e!681479))))

(assert (=> b!1199488 (= res!797920 (= (select (arr!37467 _keys!1208) i!673) k0!934))))

(declare-fun b!1199489 () Bool)

(assert (=> b!1199489 (= e!681479 e!681477)))

(declare-fun res!797921 () Bool)

(assert (=> b!1199489 (=> (not res!797921) (not e!681477))))

(assert (=> b!1199489 (= res!797921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543926 mask!1564))))

(assert (=> b!1199489 (= lt!543926 (array!77658 (store (arr!37467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38004 _keys!1208)))))

(declare-fun b!1199490 () Bool)

(assert (=> b!1199490 (= e!681475 tp_is_empty!30421)))

(assert (= (and start!100630 res!797922) b!1199483))

(assert (= (and b!1199483 res!797917) b!1199481))

(assert (= (and b!1199481 res!797919) b!1199487))

(assert (= (and b!1199487 res!797925) b!1199478))

(assert (= (and b!1199478 res!797923) b!1199485))

(assert (= (and b!1199485 res!797918) b!1199479))

(assert (= (and b!1199479 res!797916) b!1199488))

(assert (= (and b!1199488 res!797920) b!1199489))

(assert (= (and b!1199489 res!797921) b!1199480))

(assert (= (and b!1199480 res!797926) b!1199484))

(assert (= (and b!1199484 (not res!797924)) b!1199477))

(assert (= (and b!1199486 condMapEmpty!47474) mapIsEmpty!47474))

(assert (= (and b!1199486 (not condMapEmpty!47474)) mapNonEmpty!47474))

(get-info :version)

(assert (= (and mapNonEmpty!47474 ((_ is ValueCellFull!14501) mapValue!47474)) b!1199482))

(assert (= (and b!1199486 ((_ is ValueCellFull!14501) mapDefault!47474)) b!1199490))

(assert (= start!100630 b!1199486))

(declare-fun m!1106609 () Bool)

(assert (=> b!1199483 m!1106609))

(declare-fun m!1106611 () Bool)

(assert (=> b!1199480 m!1106611))

(declare-fun m!1106613 () Bool)

(assert (=> start!100630 m!1106613))

(declare-fun m!1106615 () Bool)

(assert (=> start!100630 m!1106615))

(declare-fun m!1106617 () Bool)

(assert (=> b!1199477 m!1106617))

(declare-fun m!1106619 () Bool)

(assert (=> b!1199478 m!1106619))

(declare-fun m!1106621 () Bool)

(assert (=> b!1199479 m!1106621))

(declare-fun m!1106623 () Bool)

(assert (=> b!1199488 m!1106623))

(declare-fun m!1106625 () Bool)

(assert (=> mapNonEmpty!47474 m!1106625))

(declare-fun m!1106627 () Bool)

(assert (=> b!1199487 m!1106627))

(declare-fun m!1106629 () Bool)

(assert (=> b!1199484 m!1106629))

(declare-fun m!1106631 () Bool)

(assert (=> b!1199484 m!1106631))

(declare-fun m!1106633 () Bool)

(assert (=> b!1199489 m!1106633))

(declare-fun m!1106635 () Bool)

(assert (=> b!1199489 m!1106635))

(check-sat (not b!1199483) (not b_next!25717) (not b!1199478) (not b!1199477) tp_is_empty!30421 (not mapNonEmpty!47474) (not start!100630) b_and!42335 (not b!1199479) (not b!1199487) (not b!1199489) (not b!1199480) (not b!1199484))
(check-sat b_and!42335 (not b_next!25717))
