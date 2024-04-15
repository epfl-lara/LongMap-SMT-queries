; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101202 () Bool)

(assert start!101202)

(declare-fun b_free!26131 () Bool)

(declare-fun b_next!26131 () Bool)

(assert (=> start!101202 (= b_free!26131 (not b_next!26131))))

(declare-fun tp!91414 () Bool)

(declare-fun b_and!43361 () Bool)

(assert (=> start!101202 (= tp!91414 b_and!43361)))

(declare-fun b!1215047 () Bool)

(declare-fun e!689938 () Bool)

(declare-fun e!689940 () Bool)

(assert (=> b!1215047 (= e!689938 (not e!689940))))

(declare-fun res!806735 () Bool)

(assert (=> b!1215047 (=> res!806735 e!689940)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215047 (= res!806735 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78368 0))(
  ( (array!78369 (arr!37819 (Array (_ BitVec 32) (_ BitVec 64))) (size!38357 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78368)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215047 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40149 0))(
  ( (Unit!40150) )
))
(declare-fun lt!552356 () Unit!40149)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78368 (_ BitVec 64) (_ BitVec 32)) Unit!40149)

(assert (=> b!1215047 (= lt!552356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215048 () Bool)

(declare-fun e!689944 () Bool)

(declare-fun e!689942 () Bool)

(declare-fun mapRes!48127 () Bool)

(assert (=> b!1215048 (= e!689944 (and e!689942 mapRes!48127))))

(declare-fun condMapEmpty!48127 () Bool)

(declare-datatypes ((V!46241 0))(
  ( (V!46242 (val!15474 Int)) )
))
(declare-datatypes ((ValueCell!14708 0))(
  ( (ValueCellFull!14708 (v!18126 V!46241)) (EmptyCell!14708) )
))
(declare-datatypes ((array!78370 0))(
  ( (array!78371 (arr!37820 (Array (_ BitVec 32) ValueCell!14708)) (size!38358 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78370)

(declare-fun mapDefault!48127 () ValueCell!14708)

(assert (=> b!1215048 (= condMapEmpty!48127 (= (arr!37820 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14708)) mapDefault!48127)))))

(declare-fun b!1215049 () Bool)

(declare-fun tp_is_empty!30835 () Bool)

(assert (=> b!1215049 (= e!689942 tp_is_empty!30835)))

(declare-fun b!1215050 () Bool)

(declare-fun res!806736 () Bool)

(declare-fun e!689939 () Bool)

(assert (=> b!1215050 (=> (not res!806736) (not e!689939))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78368 (_ BitVec 32)) Bool)

(assert (=> b!1215050 (= res!806736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215051 () Bool)

(declare-fun res!806730 () Bool)

(assert (=> b!1215051 (=> (not res!806730) (not e!689939))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1215051 (= res!806730 (and (= (size!38358 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38357 _keys!1208) (size!38358 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48127 () Bool)

(assert (=> mapIsEmpty!48127 mapRes!48127))

(declare-fun b!1215052 () Bool)

(declare-fun res!806737 () Bool)

(assert (=> b!1215052 (=> (not res!806737) (not e!689939))))

(declare-datatypes ((List!26752 0))(
  ( (Nil!26749) (Cons!26748 (h!27957 (_ BitVec 64)) (t!39854 List!26752)) )
))
(declare-fun arrayNoDuplicates!0 (array!78368 (_ BitVec 32) List!26752) Bool)

(assert (=> b!1215052 (= res!806737 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26749))))

(declare-fun b!1215053 () Bool)

(declare-fun res!806734 () Bool)

(assert (=> b!1215053 (=> (not res!806734) (not e!689939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215053 (= res!806734 (validMask!0 mask!1564))))

(declare-fun b!1215054 () Bool)

(declare-fun res!806731 () Bool)

(assert (=> b!1215054 (=> (not res!806731) (not e!689939))))

(assert (=> b!1215054 (= res!806731 (= (select (arr!37819 _keys!1208) i!673) k0!934))))

(declare-fun b!1215055 () Bool)

(assert (=> b!1215055 (= e!689939 e!689938)))

(declare-fun res!806732 () Bool)

(assert (=> b!1215055 (=> (not res!806732) (not e!689938))))

(declare-fun lt!552359 () array!78368)

(assert (=> b!1215055 (= res!806732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552359 mask!1564))))

(assert (=> b!1215055 (= lt!552359 (array!78369 (store (arr!37819 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38357 _keys!1208)))))

(declare-fun b!1215056 () Bool)

(assert (=> b!1215056 (= e!689940 true)))

(declare-fun zeroValue!944 () V!46241)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19972 0))(
  ( (tuple2!19973 (_1!9997 (_ BitVec 64)) (_2!9997 V!46241)) )
))
(declare-datatypes ((List!26753 0))(
  ( (Nil!26750) (Cons!26749 (h!27958 tuple2!19972) (t!39855 List!26753)) )
))
(declare-datatypes ((ListLongMap!17941 0))(
  ( (ListLongMap!17942 (toList!8986 List!26753)) )
))
(declare-fun lt!552358 () ListLongMap!17941)

(declare-fun minValue!944 () V!46241)

(declare-fun getCurrentListMapNoExtraKeys!5425 (array!78368 array!78370 (_ BitVec 32) (_ BitVec 32) V!46241 V!46241 (_ BitVec 32) Int) ListLongMap!17941)

(declare-fun dynLambda!3277 (Int (_ BitVec 64)) V!46241)

(assert (=> b!1215056 (= lt!552358 (getCurrentListMapNoExtraKeys!5425 lt!552359 (array!78371 (store (arr!37820 _values!996) i!673 (ValueCellFull!14708 (dynLambda!3277 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38358 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552357 () ListLongMap!17941)

(assert (=> b!1215056 (= lt!552357 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215058 () Bool)

(declare-fun res!806738 () Bool)

(assert (=> b!1215058 (=> (not res!806738) (not e!689938))))

(assert (=> b!1215058 (= res!806738 (arrayNoDuplicates!0 lt!552359 #b00000000000000000000000000000000 Nil!26749))))

(declare-fun b!1215059 () Bool)

(declare-fun e!689941 () Bool)

(assert (=> b!1215059 (= e!689941 tp_is_empty!30835)))

(declare-fun b!1215060 () Bool)

(declare-fun res!806740 () Bool)

(assert (=> b!1215060 (=> (not res!806740) (not e!689939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215060 (= res!806740 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48127 () Bool)

(declare-fun tp!91415 () Bool)

(assert (=> mapNonEmpty!48127 (= mapRes!48127 (and tp!91415 e!689941))))

(declare-fun mapKey!48127 () (_ BitVec 32))

(declare-fun mapRest!48127 () (Array (_ BitVec 32) ValueCell!14708))

(declare-fun mapValue!48127 () ValueCell!14708)

(assert (=> mapNonEmpty!48127 (= (arr!37820 _values!996) (store mapRest!48127 mapKey!48127 mapValue!48127))))

(declare-fun res!806739 () Bool)

(assert (=> start!101202 (=> (not res!806739) (not e!689939))))

(assert (=> start!101202 (= res!806739 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38357 _keys!1208))))))

(assert (=> start!101202 e!689939))

(assert (=> start!101202 tp_is_empty!30835))

(declare-fun array_inv!28912 (array!78368) Bool)

(assert (=> start!101202 (array_inv!28912 _keys!1208)))

(assert (=> start!101202 true))

(assert (=> start!101202 tp!91414))

(declare-fun array_inv!28913 (array!78370) Bool)

(assert (=> start!101202 (and (array_inv!28913 _values!996) e!689944)))

(declare-fun b!1215057 () Bool)

(declare-fun res!806733 () Bool)

(assert (=> b!1215057 (=> (not res!806733) (not e!689939))))

(assert (=> b!1215057 (= res!806733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38357 _keys!1208))))))

(assert (= (and start!101202 res!806739) b!1215053))

(assert (= (and b!1215053 res!806734) b!1215051))

(assert (= (and b!1215051 res!806730) b!1215050))

(assert (= (and b!1215050 res!806736) b!1215052))

(assert (= (and b!1215052 res!806737) b!1215057))

(assert (= (and b!1215057 res!806733) b!1215060))

(assert (= (and b!1215060 res!806740) b!1215054))

(assert (= (and b!1215054 res!806731) b!1215055))

(assert (= (and b!1215055 res!806732) b!1215058))

(assert (= (and b!1215058 res!806738) b!1215047))

(assert (= (and b!1215047 (not res!806735)) b!1215056))

(assert (= (and b!1215048 condMapEmpty!48127) mapIsEmpty!48127))

(assert (= (and b!1215048 (not condMapEmpty!48127)) mapNonEmpty!48127))

(get-info :version)

(assert (= (and mapNonEmpty!48127 ((_ is ValueCellFull!14708) mapValue!48127)) b!1215059))

(assert (= (and b!1215048 ((_ is ValueCellFull!14708) mapDefault!48127)) b!1215049))

(assert (= start!101202 b!1215048))

(declare-fun b_lambda!21797 () Bool)

(assert (=> (not b_lambda!21797) (not b!1215056)))

(declare-fun t!39853 () Bool)

(declare-fun tb!10923 () Bool)

(assert (=> (and start!101202 (= defaultEntry!1004 defaultEntry!1004) t!39853) tb!10923))

(declare-fun result!22451 () Bool)

(assert (=> tb!10923 (= result!22451 tp_is_empty!30835)))

(assert (=> b!1215056 t!39853))

(declare-fun b_and!43363 () Bool)

(assert (= b_and!43361 (and (=> t!39853 result!22451) b_and!43363)))

(declare-fun m!1119627 () Bool)

(assert (=> b!1215050 m!1119627))

(declare-fun m!1119629 () Bool)

(assert (=> b!1215060 m!1119629))

(declare-fun m!1119631 () Bool)

(assert (=> b!1215058 m!1119631))

(declare-fun m!1119633 () Bool)

(assert (=> b!1215054 m!1119633))

(declare-fun m!1119635 () Bool)

(assert (=> b!1215053 m!1119635))

(declare-fun m!1119637 () Bool)

(assert (=> mapNonEmpty!48127 m!1119637))

(declare-fun m!1119639 () Bool)

(assert (=> b!1215055 m!1119639))

(declare-fun m!1119641 () Bool)

(assert (=> b!1215055 m!1119641))

(declare-fun m!1119643 () Bool)

(assert (=> b!1215056 m!1119643))

(declare-fun m!1119645 () Bool)

(assert (=> b!1215056 m!1119645))

(declare-fun m!1119647 () Bool)

(assert (=> b!1215056 m!1119647))

(declare-fun m!1119649 () Bool)

(assert (=> b!1215056 m!1119649))

(declare-fun m!1119651 () Bool)

(assert (=> b!1215052 m!1119651))

(declare-fun m!1119653 () Bool)

(assert (=> start!101202 m!1119653))

(declare-fun m!1119655 () Bool)

(assert (=> start!101202 m!1119655))

(declare-fun m!1119657 () Bool)

(assert (=> b!1215047 m!1119657))

(declare-fun m!1119659 () Bool)

(assert (=> b!1215047 m!1119659))

(check-sat (not b!1215053) (not b_lambda!21797) tp_is_empty!30835 (not b!1215047) (not start!101202) (not b!1215060) (not b!1215056) (not b!1215055) (not b!1215050) (not b!1215058) (not b!1215052) (not mapNonEmpty!48127) b_and!43363 (not b_next!26131))
(check-sat b_and!43363 (not b_next!26131))
