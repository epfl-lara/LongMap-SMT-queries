; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101252 () Bool)

(assert start!101252)

(declare-fun b_free!26175 () Bool)

(declare-fun b_next!26175 () Bool)

(assert (=> start!101252 (= b_free!26175 (not b_next!26175))))

(declare-fun tp!91547 () Bool)

(declare-fun b_and!43467 () Bool)

(assert (=> start!101252 (= tp!91547 b_and!43467)))

(declare-fun mapNonEmpty!48193 () Bool)

(declare-fun mapRes!48193 () Bool)

(declare-fun tp!91546 () Bool)

(declare-fun e!690474 () Bool)

(assert (=> mapNonEmpty!48193 (= mapRes!48193 (and tp!91546 e!690474))))

(declare-datatypes ((V!46299 0))(
  ( (V!46300 (val!15496 Int)) )
))
(declare-datatypes ((ValueCell!14730 0))(
  ( (ValueCellFull!14730 (v!18149 V!46299)) (EmptyCell!14730) )
))
(declare-fun mapValue!48193 () ValueCell!14730)

(declare-fun mapRest!48193 () (Array (_ BitVec 32) ValueCell!14730))

(declare-fun mapKey!48193 () (_ BitVec 32))

(declare-datatypes ((array!78531 0))(
  ( (array!78532 (arr!37900 (Array (_ BitVec 32) ValueCell!14730)) (size!38436 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78531)

(assert (=> mapNonEmpty!48193 (= (arr!37900 _values!996) (store mapRest!48193 mapKey!48193 mapValue!48193))))

(declare-fun b!1216124 () Bool)

(declare-fun res!807519 () Bool)

(declare-fun e!690475 () Bool)

(assert (=> b!1216124 (=> (not res!807519) (not e!690475))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216124 (= res!807519 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48193 () Bool)

(assert (=> mapIsEmpty!48193 mapRes!48193))

(declare-fun b!1216125 () Bool)

(declare-fun e!690473 () Bool)

(assert (=> b!1216125 (= e!690473 true)))

(declare-fun zeroValue!944 () V!46299)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19914 0))(
  ( (tuple2!19915 (_1!9968 (_ BitVec 64)) (_2!9968 V!46299)) )
))
(declare-datatypes ((List!26718 0))(
  ( (Nil!26715) (Cons!26714 (h!27923 tuple2!19914) (t!39873 List!26718)) )
))
(declare-datatypes ((ListLongMap!17883 0))(
  ( (ListLongMap!17884 (toList!8957 List!26718)) )
))
(declare-fun lt!552804 () ListLongMap!17883)

(declare-fun minValue!944 () V!46299)

(declare-datatypes ((array!78533 0))(
  ( (array!78534 (arr!37901 (Array (_ BitVec 32) (_ BitVec 64))) (size!38437 (_ BitVec 32))) )
))
(declare-fun lt!552802 () array!78533)

(declare-fun getCurrentListMapNoExtraKeys!5384 (array!78533 array!78531 (_ BitVec 32) (_ BitVec 32) V!46299 V!46299 (_ BitVec 32) Int) ListLongMap!17883)

(declare-fun dynLambda!3273 (Int (_ BitVec 64)) V!46299)

(assert (=> b!1216125 (= lt!552804 (getCurrentListMapNoExtraKeys!5384 lt!552802 (array!78532 (store (arr!37900 _values!996) i!673 (ValueCellFull!14730 (dynLambda!3273 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38436 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!78533)

(declare-fun lt!552803 () ListLongMap!17883)

(assert (=> b!1216125 (= lt!552803 (getCurrentListMapNoExtraKeys!5384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216126 () Bool)

(declare-fun e!690472 () Bool)

(declare-fun tp_is_empty!30879 () Bool)

(assert (=> b!1216126 (= e!690472 tp_is_empty!30879)))

(declare-fun b!1216127 () Bool)

(declare-fun res!807518 () Bool)

(assert (=> b!1216127 (=> (not res!807518) (not e!690475))))

(declare-datatypes ((List!26719 0))(
  ( (Nil!26716) (Cons!26715 (h!27924 (_ BitVec 64)) (t!39874 List!26719)) )
))
(declare-fun arrayNoDuplicates!0 (array!78533 (_ BitVec 32) List!26719) Bool)

(assert (=> b!1216127 (= res!807518 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26716))))

(declare-fun b!1216128 () Bool)

(assert (=> b!1216128 (= e!690474 tp_is_empty!30879)))

(declare-fun b!1216129 () Bool)

(declare-fun e!690469 () Bool)

(assert (=> b!1216129 (= e!690475 e!690469)))

(declare-fun res!807526 () Bool)

(assert (=> b!1216129 (=> (not res!807526) (not e!690469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78533 (_ BitVec 32)) Bool)

(assert (=> b!1216129 (= res!807526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552802 mask!1564))))

(assert (=> b!1216129 (= lt!552802 (array!78534 (store (arr!37901 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38437 _keys!1208)))))

(declare-fun b!1216130 () Bool)

(declare-fun res!807524 () Bool)

(assert (=> b!1216130 (=> (not res!807524) (not e!690469))))

(assert (=> b!1216130 (= res!807524 (arrayNoDuplicates!0 lt!552802 #b00000000000000000000000000000000 Nil!26716))))

(declare-fun b!1216131 () Bool)

(declare-fun res!807520 () Bool)

(assert (=> b!1216131 (=> (not res!807520) (not e!690475))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216131 (= res!807520 (validKeyInArray!0 k0!934))))

(declare-fun res!807521 () Bool)

(assert (=> start!101252 (=> (not res!807521) (not e!690475))))

(assert (=> start!101252 (= res!807521 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38437 _keys!1208))))))

(assert (=> start!101252 e!690475))

(assert (=> start!101252 tp_is_empty!30879))

(declare-fun array_inv!28854 (array!78533) Bool)

(assert (=> start!101252 (array_inv!28854 _keys!1208)))

(assert (=> start!101252 true))

(assert (=> start!101252 tp!91547))

(declare-fun e!690470 () Bool)

(declare-fun array_inv!28855 (array!78531) Bool)

(assert (=> start!101252 (and (array_inv!28855 _values!996) e!690470)))

(declare-fun b!1216132 () Bool)

(assert (=> b!1216132 (= e!690470 (and e!690472 mapRes!48193))))

(declare-fun condMapEmpty!48193 () Bool)

(declare-fun mapDefault!48193 () ValueCell!14730)

(assert (=> b!1216132 (= condMapEmpty!48193 (= (arr!37900 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14730)) mapDefault!48193)))))

(declare-fun b!1216133 () Bool)

(declare-fun res!807527 () Bool)

(assert (=> b!1216133 (=> (not res!807527) (not e!690475))))

(assert (=> b!1216133 (= res!807527 (= (select (arr!37901 _keys!1208) i!673) k0!934))))

(declare-fun b!1216134 () Bool)

(declare-fun res!807522 () Bool)

(assert (=> b!1216134 (=> (not res!807522) (not e!690475))))

(assert (=> b!1216134 (= res!807522 (and (= (size!38436 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38437 _keys!1208) (size!38436 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216135 () Bool)

(declare-fun res!807523 () Bool)

(assert (=> b!1216135 (=> (not res!807523) (not e!690475))))

(assert (=> b!1216135 (= res!807523 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38437 _keys!1208))))))

(declare-fun b!1216136 () Bool)

(declare-fun res!807517 () Bool)

(assert (=> b!1216136 (=> (not res!807517) (not e!690475))))

(assert (=> b!1216136 (= res!807517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216137 () Bool)

(assert (=> b!1216137 (= e!690469 (not e!690473))))

(declare-fun res!807525 () Bool)

(assert (=> b!1216137 (=> res!807525 e!690473)))

(assert (=> b!1216137 (= res!807525 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216137 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40318 0))(
  ( (Unit!40319) )
))
(declare-fun lt!552801 () Unit!40318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78533 (_ BitVec 64) (_ BitVec 32)) Unit!40318)

(assert (=> b!1216137 (= lt!552801 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101252 res!807521) b!1216124))

(assert (= (and b!1216124 res!807519) b!1216134))

(assert (= (and b!1216134 res!807522) b!1216136))

(assert (= (and b!1216136 res!807517) b!1216127))

(assert (= (and b!1216127 res!807518) b!1216135))

(assert (= (and b!1216135 res!807523) b!1216131))

(assert (= (and b!1216131 res!807520) b!1216133))

(assert (= (and b!1216133 res!807527) b!1216129))

(assert (= (and b!1216129 res!807526) b!1216130))

(assert (= (and b!1216130 res!807524) b!1216137))

(assert (= (and b!1216137 (not res!807525)) b!1216125))

(assert (= (and b!1216132 condMapEmpty!48193) mapIsEmpty!48193))

(assert (= (and b!1216132 (not condMapEmpty!48193)) mapNonEmpty!48193))

(get-info :version)

(assert (= (and mapNonEmpty!48193 ((_ is ValueCellFull!14730) mapValue!48193)) b!1216128))

(assert (= (and b!1216132 ((_ is ValueCellFull!14730) mapDefault!48193)) b!1216126))

(assert (= start!101252 b!1216132))

(declare-fun b_lambda!21851 () Bool)

(assert (=> (not b_lambda!21851) (not b!1216125)))

(declare-fun t!39872 () Bool)

(declare-fun tb!10975 () Bool)

(assert (=> (and start!101252 (= defaultEntry!1004 defaultEntry!1004) t!39872) tb!10975))

(declare-fun result!22547 () Bool)

(assert (=> tb!10975 (= result!22547 tp_is_empty!30879)))

(assert (=> b!1216125 t!39872))

(declare-fun b_and!43469 () Bool)

(assert (= b_and!43467 (and (=> t!39872 result!22547) b_and!43469)))

(declare-fun m!1120939 () Bool)

(assert (=> b!1216124 m!1120939))

(declare-fun m!1120941 () Bool)

(assert (=> b!1216125 m!1120941))

(declare-fun m!1120943 () Bool)

(assert (=> b!1216125 m!1120943))

(declare-fun m!1120945 () Bool)

(assert (=> b!1216125 m!1120945))

(declare-fun m!1120947 () Bool)

(assert (=> b!1216125 m!1120947))

(declare-fun m!1120949 () Bool)

(assert (=> b!1216127 m!1120949))

(declare-fun m!1120951 () Bool)

(assert (=> mapNonEmpty!48193 m!1120951))

(declare-fun m!1120953 () Bool)

(assert (=> b!1216133 m!1120953))

(declare-fun m!1120955 () Bool)

(assert (=> b!1216129 m!1120955))

(declare-fun m!1120957 () Bool)

(assert (=> b!1216129 m!1120957))

(declare-fun m!1120959 () Bool)

(assert (=> b!1216131 m!1120959))

(declare-fun m!1120961 () Bool)

(assert (=> b!1216136 m!1120961))

(declare-fun m!1120963 () Bool)

(assert (=> start!101252 m!1120963))

(declare-fun m!1120965 () Bool)

(assert (=> start!101252 m!1120965))

(declare-fun m!1120967 () Bool)

(assert (=> b!1216130 m!1120967))

(declare-fun m!1120969 () Bool)

(assert (=> b!1216137 m!1120969))

(declare-fun m!1120971 () Bool)

(assert (=> b!1216137 m!1120971))

(check-sat (not b!1216124) (not start!101252) (not b!1216136) (not b!1216137) (not mapNonEmpty!48193) (not b_lambda!21851) (not b!1216131) tp_is_empty!30879 b_and!43469 (not b!1216129) (not b!1216127) (not b!1216125) (not b_next!26175) (not b!1216130))
(check-sat b_and!43469 (not b_next!26175))
