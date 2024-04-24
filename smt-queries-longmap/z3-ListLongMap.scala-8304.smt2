; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101408 () Bool)

(assert start!101408)

(declare-fun b_free!26095 () Bool)

(declare-fun b_next!26095 () Bool)

(assert (=> start!101408 (= b_free!26095 (not b_next!26095))))

(declare-fun tp!91306 () Bool)

(declare-fun b_and!43309 () Bool)

(assert (=> start!101408 (= tp!91306 b_and!43309)))

(declare-fun b!1215651 () Bool)

(declare-fun res!806712 () Bool)

(declare-fun e!690463 () Bool)

(assert (=> b!1215651 (=> (not res!806712) (not e!690463))))

(declare-datatypes ((array!78419 0))(
  ( (array!78420 (arr!37838 (Array (_ BitVec 32) (_ BitVec 64))) (size!38375 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78419)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215651 (= res!806712 (= (select (arr!37838 _keys!1208) i!673) k0!934))))

(declare-fun b!1215652 () Bool)

(declare-fun res!806707 () Bool)

(assert (=> b!1215652 (=> (not res!806707) (not e!690463))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46193 0))(
  ( (V!46194 (val!15456 Int)) )
))
(declare-datatypes ((ValueCell!14690 0))(
  ( (ValueCellFull!14690 (v!18105 V!46193)) (EmptyCell!14690) )
))
(declare-datatypes ((array!78421 0))(
  ( (array!78422 (arr!37839 (Array (_ BitVec 32) ValueCell!14690)) (size!38376 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78421)

(assert (=> b!1215652 (= res!806707 (and (= (size!38376 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38375 _keys!1208) (size!38376 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!806713 () Bool)

(assert (=> start!101408 (=> (not res!806713) (not e!690463))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101408 (= res!806713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38375 _keys!1208))))))

(assert (=> start!101408 e!690463))

(declare-fun tp_is_empty!30799 () Bool)

(assert (=> start!101408 tp_is_empty!30799))

(declare-fun array_inv!28876 (array!78419) Bool)

(assert (=> start!101408 (array_inv!28876 _keys!1208)))

(assert (=> start!101408 true))

(assert (=> start!101408 tp!91306))

(declare-fun e!690460 () Bool)

(declare-fun array_inv!28877 (array!78421) Bool)

(assert (=> start!101408 (and (array_inv!28877 _values!996) e!690460)))

(declare-fun b!1215653 () Bool)

(declare-fun e!690461 () Bool)

(assert (=> b!1215653 (= e!690463 e!690461)))

(declare-fun res!806709 () Bool)

(assert (=> b!1215653 (=> (not res!806709) (not e!690461))))

(declare-fun lt!552804 () array!78419)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78419 (_ BitVec 32)) Bool)

(assert (=> b!1215653 (= res!806709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552804 mask!1564))))

(assert (=> b!1215653 (= lt!552804 (array!78420 (store (arr!37838 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38375 _keys!1208)))))

(declare-fun b!1215654 () Bool)

(declare-fun res!806708 () Bool)

(assert (=> b!1215654 (=> (not res!806708) (not e!690463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215654 (= res!806708 (validMask!0 mask!1564))))

(declare-fun b!1215655 () Bool)

(declare-fun res!806703 () Bool)

(assert (=> b!1215655 (=> (not res!806703) (not e!690463))))

(assert (=> b!1215655 (= res!806703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48073 () Bool)

(declare-fun mapRes!48073 () Bool)

(declare-fun tp!91307 () Bool)

(declare-fun e!690466 () Bool)

(assert (=> mapNonEmpty!48073 (= mapRes!48073 (and tp!91307 e!690466))))

(declare-fun mapKey!48073 () (_ BitVec 32))

(declare-fun mapRest!48073 () (Array (_ BitVec 32) ValueCell!14690))

(declare-fun mapValue!48073 () ValueCell!14690)

(assert (=> mapNonEmpty!48073 (= (arr!37839 _values!996) (store mapRest!48073 mapKey!48073 mapValue!48073))))

(declare-fun b!1215656 () Bool)

(declare-fun res!806710 () Bool)

(assert (=> b!1215656 (=> (not res!806710) (not e!690463))))

(declare-datatypes ((List!26688 0))(
  ( (Nil!26685) (Cons!26684 (h!27902 (_ BitVec 64)) (t!39755 List!26688)) )
))
(declare-fun arrayNoDuplicates!0 (array!78419 (_ BitVec 32) List!26688) Bool)

(assert (=> b!1215656 (= res!806710 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26685))))

(declare-fun b!1215657 () Bool)

(assert (=> b!1215657 (= e!690466 tp_is_empty!30799)))

(declare-fun b!1215658 () Bool)

(declare-fun res!806706 () Bool)

(assert (=> b!1215658 (=> (not res!806706) (not e!690461))))

(assert (=> b!1215658 (= res!806706 (arrayNoDuplicates!0 lt!552804 #b00000000000000000000000000000000 Nil!26685))))

(declare-fun b!1215659 () Bool)

(declare-fun e!690464 () Bool)

(assert (=> b!1215659 (= e!690461 (not e!690464))))

(declare-fun res!806705 () Bool)

(assert (=> b!1215659 (=> res!806705 e!690464)))

(assert (=> b!1215659 (= res!806705 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215659 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40244 0))(
  ( (Unit!40245) )
))
(declare-fun lt!552802 () Unit!40244)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78419 (_ BitVec 64) (_ BitVec 32)) Unit!40244)

(assert (=> b!1215659 (= lt!552802 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48073 () Bool)

(assert (=> mapIsEmpty!48073 mapRes!48073))

(declare-fun b!1215660 () Bool)

(declare-fun e!690462 () Bool)

(assert (=> b!1215660 (= e!690460 (and e!690462 mapRes!48073))))

(declare-fun condMapEmpty!48073 () Bool)

(declare-fun mapDefault!48073 () ValueCell!14690)

(assert (=> b!1215660 (= condMapEmpty!48073 (= (arr!37839 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14690)) mapDefault!48073)))))

(declare-fun b!1215661 () Bool)

(assert (=> b!1215661 (= e!690462 tp_is_empty!30799)))

(declare-fun b!1215662 () Bool)

(declare-fun res!806711 () Bool)

(assert (=> b!1215662 (=> (not res!806711) (not e!690463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215662 (= res!806711 (validKeyInArray!0 k0!934))))

(declare-fun b!1215663 () Bool)

(declare-fun res!806704 () Bool)

(assert (=> b!1215663 (=> (not res!806704) (not e!690463))))

(assert (=> b!1215663 (= res!806704 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38375 _keys!1208))))))

(declare-fun b!1215664 () Bool)

(assert (=> b!1215664 (= e!690464 (or (= from!1455 i!673) (bvsge from!1455 i!673) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38375 _keys!1208)))))))

(declare-fun zeroValue!944 () V!46193)

(declare-datatypes ((tuple2!19886 0))(
  ( (tuple2!19887 (_1!9954 (_ BitVec 64)) (_2!9954 V!46193)) )
))
(declare-datatypes ((List!26689 0))(
  ( (Nil!26686) (Cons!26685 (h!27903 tuple2!19886) (t!39756 List!26689)) )
))
(declare-datatypes ((ListLongMap!17863 0))(
  ( (ListLongMap!17864 (toList!8947 List!26689)) )
))
(declare-fun lt!552803 () ListLongMap!17863)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46193)

(declare-fun getCurrentListMapNoExtraKeys!5404 (array!78419 array!78421 (_ BitVec 32) (_ BitVec 32) V!46193 V!46193 (_ BitVec 32) Int) ListLongMap!17863)

(declare-fun dynLambda!3316 (Int (_ BitVec 64)) V!46193)

(assert (=> b!1215664 (= lt!552803 (getCurrentListMapNoExtraKeys!5404 lt!552804 (array!78422 (store (arr!37839 _values!996) i!673 (ValueCellFull!14690 (dynLambda!3316 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38376 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552801 () ListLongMap!17863)

(assert (=> b!1215664 (= lt!552801 (getCurrentListMapNoExtraKeys!5404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101408 res!806713) b!1215654))

(assert (= (and b!1215654 res!806708) b!1215652))

(assert (= (and b!1215652 res!806707) b!1215655))

(assert (= (and b!1215655 res!806703) b!1215656))

(assert (= (and b!1215656 res!806710) b!1215663))

(assert (= (and b!1215663 res!806704) b!1215662))

(assert (= (and b!1215662 res!806711) b!1215651))

(assert (= (and b!1215651 res!806712) b!1215653))

(assert (= (and b!1215653 res!806709) b!1215658))

(assert (= (and b!1215658 res!806706) b!1215659))

(assert (= (and b!1215659 (not res!806705)) b!1215664))

(assert (= (and b!1215660 condMapEmpty!48073) mapIsEmpty!48073))

(assert (= (and b!1215660 (not condMapEmpty!48073)) mapNonEmpty!48073))

(get-info :version)

(assert (= (and mapNonEmpty!48073 ((_ is ValueCellFull!14690) mapValue!48073)) b!1215657))

(assert (= (and b!1215660 ((_ is ValueCellFull!14690) mapDefault!48073)) b!1215661))

(assert (= start!101408 b!1215660))

(declare-fun b_lambda!21765 () Bool)

(assert (=> (not b_lambda!21765) (not b!1215664)))

(declare-fun t!39754 () Bool)

(declare-fun tb!10887 () Bool)

(assert (=> (and start!101408 (= defaultEntry!1004 defaultEntry!1004) t!39754) tb!10887))

(declare-fun result!22379 () Bool)

(assert (=> tb!10887 (= result!22379 tp_is_empty!30799)))

(assert (=> b!1215664 t!39754))

(declare-fun b_and!43311 () Bool)

(assert (= b_and!43309 (and (=> t!39754 result!22379) b_and!43311)))

(declare-fun m!1121169 () Bool)

(assert (=> b!1215651 m!1121169))

(declare-fun m!1121171 () Bool)

(assert (=> b!1215659 m!1121171))

(declare-fun m!1121173 () Bool)

(assert (=> b!1215659 m!1121173))

(declare-fun m!1121175 () Bool)

(assert (=> b!1215653 m!1121175))

(declare-fun m!1121177 () Bool)

(assert (=> b!1215653 m!1121177))

(declare-fun m!1121179 () Bool)

(assert (=> b!1215664 m!1121179))

(declare-fun m!1121181 () Bool)

(assert (=> b!1215664 m!1121181))

(declare-fun m!1121183 () Bool)

(assert (=> b!1215664 m!1121183))

(declare-fun m!1121185 () Bool)

(assert (=> b!1215664 m!1121185))

(declare-fun m!1121187 () Bool)

(assert (=> b!1215655 m!1121187))

(declare-fun m!1121189 () Bool)

(assert (=> b!1215656 m!1121189))

(declare-fun m!1121191 () Bool)

(assert (=> b!1215654 m!1121191))

(declare-fun m!1121193 () Bool)

(assert (=> start!101408 m!1121193))

(declare-fun m!1121195 () Bool)

(assert (=> start!101408 m!1121195))

(declare-fun m!1121197 () Bool)

(assert (=> b!1215662 m!1121197))

(declare-fun m!1121199 () Bool)

(assert (=> mapNonEmpty!48073 m!1121199))

(declare-fun m!1121201 () Bool)

(assert (=> b!1215658 m!1121201))

(check-sat (not b!1215658) (not b!1215664) (not b!1215655) (not b!1215656) (not b!1215659) (not b_lambda!21765) (not start!101408) (not b_next!26095) b_and!43311 (not b!1215654) (not b!1215662) tp_is_empty!30799 (not mapNonEmpty!48073) (not b!1215653))
(check-sat b_and!43311 (not b_next!26095))
