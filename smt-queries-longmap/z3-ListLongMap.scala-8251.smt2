; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100690 () Bool)

(assert start!100690)

(declare-fun b_free!25777 () Bool)

(declare-fun b_next!25777 () Bool)

(assert (=> start!100690 (= b_free!25777 (not b_next!25777))))

(declare-fun tp!90320 () Bool)

(declare-fun b_and!42443 () Bool)

(assert (=> start!100690 (= tp!90320 b_and!42443)))

(declare-fun b!1200785 () Bool)

(declare-fun e!682105 () Bool)

(declare-fun e!682108 () Bool)

(assert (=> b!1200785 (= e!682105 (not e!682108))))

(declare-fun res!798916 () Bool)

(assert (=> b!1200785 (=> res!798916 e!682108)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200785 (= res!798916 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77777 0))(
  ( (array!77778 (arr!37527 (Array (_ BitVec 32) (_ BitVec 64))) (size!38064 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77777)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39737 0))(
  ( (Unit!39738) )
))
(declare-fun lt!544270 () Unit!39737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77777 (_ BitVec 64) (_ BitVec 32)) Unit!39737)

(assert (=> b!1200785 (= lt!544270 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200786 () Bool)

(declare-fun res!798908 () Bool)

(declare-fun e!682109 () Bool)

(assert (=> b!1200786 (=> (not res!798908) (not e!682109))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200786 (= res!798908 (validMask!0 mask!1564))))

(declare-fun b!1200787 () Bool)

(declare-fun res!798913 () Bool)

(assert (=> b!1200787 (=> (not res!798913) (not e!682109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77777 (_ BitVec 32)) Bool)

(assert (=> b!1200787 (= res!798913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200788 () Bool)

(declare-fun res!798915 () Bool)

(assert (=> b!1200788 (=> (not res!798915) (not e!682109))))

(declare-datatypes ((List!26416 0))(
  ( (Nil!26413) (Cons!26412 (h!27630 (_ BitVec 64)) (t!39165 List!26416)) )
))
(declare-fun arrayNoDuplicates!0 (array!77777 (_ BitVec 32) List!26416) Bool)

(assert (=> b!1200788 (= res!798915 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26413))))

(declare-fun b!1200789 () Bool)

(declare-fun e!682104 () Bool)

(declare-fun e!682103 () Bool)

(declare-fun mapRes!47564 () Bool)

(assert (=> b!1200789 (= e!682104 (and e!682103 mapRes!47564))))

(declare-fun condMapEmpty!47564 () Bool)

(declare-datatypes ((V!45769 0))(
  ( (V!45770 (val!15297 Int)) )
))
(declare-datatypes ((ValueCell!14531 0))(
  ( (ValueCellFull!14531 (v!17931 V!45769)) (EmptyCell!14531) )
))
(declare-datatypes ((array!77779 0))(
  ( (array!77780 (arr!37528 (Array (_ BitVec 32) ValueCell!14531)) (size!38065 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77779)

(declare-fun mapDefault!47564 () ValueCell!14531)

(assert (=> b!1200789 (= condMapEmpty!47564 (= (arr!37528 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14531)) mapDefault!47564)))))

(declare-fun b!1200791 () Bool)

(assert (=> b!1200791 (= e!682109 e!682105)))

(declare-fun res!798907 () Bool)

(assert (=> b!1200791 (=> (not res!798907) (not e!682105))))

(declare-fun lt!544271 () array!77777)

(assert (=> b!1200791 (= res!798907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544271 mask!1564))))

(assert (=> b!1200791 (= lt!544271 (array!77778 (store (arr!37527 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38064 _keys!1208)))))

(declare-fun b!1200792 () Bool)

(declare-fun e!682106 () Bool)

(declare-fun tp_is_empty!30481 () Bool)

(assert (=> b!1200792 (= e!682106 tp_is_empty!30481)))

(declare-fun mapIsEmpty!47564 () Bool)

(assert (=> mapIsEmpty!47564 mapRes!47564))

(declare-fun b!1200793 () Bool)

(declare-fun res!798914 () Bool)

(assert (=> b!1200793 (=> (not res!798914) (not e!682105))))

(assert (=> b!1200793 (= res!798914 (arrayNoDuplicates!0 lt!544271 #b00000000000000000000000000000000 Nil!26413))))

(declare-fun b!1200794 () Bool)

(declare-fun res!798911 () Bool)

(assert (=> b!1200794 (=> (not res!798911) (not e!682109))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200794 (= res!798911 (and (= (size!38065 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38064 _keys!1208) (size!38065 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47564 () Bool)

(declare-fun tp!90321 () Bool)

(assert (=> mapNonEmpty!47564 (= mapRes!47564 (and tp!90321 e!682106))))

(declare-fun mapValue!47564 () ValueCell!14531)

(declare-fun mapRest!47564 () (Array (_ BitVec 32) ValueCell!14531))

(declare-fun mapKey!47564 () (_ BitVec 32))

(assert (=> mapNonEmpty!47564 (= (arr!37528 _values!996) (store mapRest!47564 mapKey!47564 mapValue!47564))))

(declare-fun b!1200790 () Bool)

(declare-fun res!798906 () Bool)

(assert (=> b!1200790 (=> (not res!798906) (not e!682109))))

(assert (=> b!1200790 (= res!798906 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38064 _keys!1208))))))

(declare-fun res!798912 () Bool)

(assert (=> start!100690 (=> (not res!798912) (not e!682109))))

(assert (=> start!100690 (= res!798912 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38064 _keys!1208))))))

(assert (=> start!100690 e!682109))

(assert (=> start!100690 tp_is_empty!30481))

(declare-fun array_inv!28668 (array!77777) Bool)

(assert (=> start!100690 (array_inv!28668 _keys!1208)))

(assert (=> start!100690 true))

(assert (=> start!100690 tp!90320))

(declare-fun array_inv!28669 (array!77779) Bool)

(assert (=> start!100690 (and (array_inv!28669 _values!996) e!682104)))

(declare-fun b!1200795 () Bool)

(declare-fun res!798909 () Bool)

(assert (=> b!1200795 (=> (not res!798909) (not e!682109))))

(assert (=> b!1200795 (= res!798909 (= (select (arr!37527 _keys!1208) i!673) k0!934))))

(declare-fun b!1200796 () Bool)

(assert (=> b!1200796 (= e!682103 tp_is_empty!30481)))

(declare-fun b!1200797 () Bool)

(assert (=> b!1200797 (= e!682108 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19598 0))(
  ( (tuple2!19599 (_1!9810 (_ BitVec 64)) (_2!9810 V!45769)) )
))
(declare-datatypes ((List!26417 0))(
  ( (Nil!26414) (Cons!26413 (h!27631 tuple2!19598) (t!39166 List!26417)) )
))
(declare-datatypes ((ListLongMap!17575 0))(
  ( (ListLongMap!17576 (toList!8803 List!26417)) )
))
(declare-fun lt!544269 () ListLongMap!17575)

(declare-fun minValue!944 () V!45769)

(declare-fun zeroValue!944 () V!45769)

(declare-fun getCurrentListMapNoExtraKeys!5270 (array!77777 array!77779 (_ BitVec 32) (_ BitVec 32) V!45769 V!45769 (_ BitVec 32) Int) ListLongMap!17575)

(declare-fun dynLambda!3214 (Int (_ BitVec 64)) V!45769)

(assert (=> b!1200797 (= lt!544269 (getCurrentListMapNoExtraKeys!5270 lt!544271 (array!77780 (store (arr!37528 _values!996) i!673 (ValueCellFull!14531 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38065 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544268 () ListLongMap!17575)

(assert (=> b!1200797 (= lt!544268 (getCurrentListMapNoExtraKeys!5270 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200798 () Bool)

(declare-fun res!798910 () Bool)

(assert (=> b!1200798 (=> (not res!798910) (not e!682109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200798 (= res!798910 (validKeyInArray!0 k0!934))))

(assert (= (and start!100690 res!798912) b!1200786))

(assert (= (and b!1200786 res!798908) b!1200794))

(assert (= (and b!1200794 res!798911) b!1200787))

(assert (= (and b!1200787 res!798913) b!1200788))

(assert (= (and b!1200788 res!798915) b!1200790))

(assert (= (and b!1200790 res!798906) b!1200798))

(assert (= (and b!1200798 res!798910) b!1200795))

(assert (= (and b!1200795 res!798909) b!1200791))

(assert (= (and b!1200791 res!798907) b!1200793))

(assert (= (and b!1200793 res!798914) b!1200785))

(assert (= (and b!1200785 (not res!798916)) b!1200797))

(assert (= (and b!1200789 condMapEmpty!47564) mapIsEmpty!47564))

(assert (= (and b!1200789 (not condMapEmpty!47564)) mapNonEmpty!47564))

(get-info :version)

(assert (= (and mapNonEmpty!47564 ((_ is ValueCellFull!14531) mapValue!47564)) b!1200792))

(assert (= (and b!1200789 ((_ is ValueCellFull!14531) mapDefault!47564)) b!1200796))

(assert (= start!100690 b!1200789))

(declare-fun b_lambda!20967 () Bool)

(assert (=> (not b_lambda!20967) (not b!1200797)))

(declare-fun t!39164 () Bool)

(declare-fun tb!10569 () Bool)

(assert (=> (and start!100690 (= defaultEntry!1004 defaultEntry!1004) t!39164) tb!10569))

(declare-fun result!21723 () Bool)

(assert (=> tb!10569 (= result!21723 tp_is_empty!30481)))

(assert (=> b!1200797 t!39164))

(declare-fun b_and!42445 () Bool)

(assert (= b_and!42443 (and (=> t!39164 result!21723) b_and!42445)))

(declare-fun m!1107593 () Bool)

(assert (=> b!1200785 m!1107593))

(declare-fun m!1107595 () Bool)

(assert (=> b!1200785 m!1107595))

(declare-fun m!1107597 () Bool)

(assert (=> b!1200788 m!1107597))

(declare-fun m!1107599 () Bool)

(assert (=> b!1200787 m!1107599))

(declare-fun m!1107601 () Bool)

(assert (=> b!1200798 m!1107601))

(declare-fun m!1107603 () Bool)

(assert (=> start!100690 m!1107603))

(declare-fun m!1107605 () Bool)

(assert (=> start!100690 m!1107605))

(declare-fun m!1107607 () Bool)

(assert (=> b!1200786 m!1107607))

(declare-fun m!1107609 () Bool)

(assert (=> b!1200793 m!1107609))

(declare-fun m!1107611 () Bool)

(assert (=> mapNonEmpty!47564 m!1107611))

(declare-fun m!1107613 () Bool)

(assert (=> b!1200791 m!1107613))

(declare-fun m!1107615 () Bool)

(assert (=> b!1200791 m!1107615))

(declare-fun m!1107617 () Bool)

(assert (=> b!1200797 m!1107617))

(declare-fun m!1107619 () Bool)

(assert (=> b!1200797 m!1107619))

(declare-fun m!1107621 () Bool)

(assert (=> b!1200797 m!1107621))

(declare-fun m!1107623 () Bool)

(assert (=> b!1200797 m!1107623))

(declare-fun m!1107625 () Bool)

(assert (=> b!1200795 m!1107625))

(check-sat (not b_next!25777) (not mapNonEmpty!47564) (not b!1200785) (not start!100690) (not b!1200788) (not b!1200791) b_and!42445 (not b!1200786) (not b!1200793) tp_is_empty!30481 (not b!1200798) (not b!1200797) (not b_lambda!20967) (not b!1200787))
(check-sat b_and!42445 (not b_next!25777))
