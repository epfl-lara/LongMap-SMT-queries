; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101172 () Bool)

(assert start!101172)

(declare-fun b_free!26101 () Bool)

(declare-fun b_next!26101 () Bool)

(assert (=> start!101172 (= b_free!26101 (not b_next!26101))))

(declare-fun tp!91324 () Bool)

(declare-fun b_and!43301 () Bool)

(assert (=> start!101172 (= tp!91324 b_and!43301)))

(declare-fun b!1214388 () Bool)

(declare-fun e!689629 () Bool)

(declare-fun tp_is_empty!30805 () Bool)

(assert (=> b!1214388 (= e!689629 tp_is_empty!30805)))

(declare-fun mapNonEmpty!48082 () Bool)

(declare-fun mapRes!48082 () Bool)

(declare-fun tp!91325 () Bool)

(declare-fun e!689625 () Bool)

(assert (=> mapNonEmpty!48082 (= mapRes!48082 (and tp!91325 e!689625))))

(declare-datatypes ((V!46201 0))(
  ( (V!46202 (val!15459 Int)) )
))
(declare-datatypes ((ValueCell!14693 0))(
  ( (ValueCellFull!14693 (v!18111 V!46201)) (EmptyCell!14693) )
))
(declare-fun mapValue!48082 () ValueCell!14693)

(declare-datatypes ((array!78312 0))(
  ( (array!78313 (arr!37791 (Array (_ BitVec 32) ValueCell!14693)) (size!38329 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78312)

(declare-fun mapRest!48082 () (Array (_ BitVec 32) ValueCell!14693))

(declare-fun mapKey!48082 () (_ BitVec 32))

(assert (=> mapNonEmpty!48082 (= (arr!37791 _values!996) (store mapRest!48082 mapKey!48082 mapValue!48082))))

(declare-fun b!1214389 () Bool)

(assert (=> b!1214389 (= e!689625 tp_is_empty!30805)))

(declare-fun b!1214390 () Bool)

(declare-fun res!806245 () Bool)

(declare-fun e!689628 () Bool)

(assert (=> b!1214390 (=> (not res!806245) (not e!689628))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214390 (= res!806245 (validKeyInArray!0 k0!934))))

(declare-fun b!1214391 () Bool)

(declare-fun e!689624 () Bool)

(declare-fun e!689623 () Bool)

(assert (=> b!1214391 (= e!689624 (not e!689623))))

(declare-fun res!806239 () Bool)

(assert (=> b!1214391 (=> res!806239 e!689623)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214391 (= res!806239 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78314 0))(
  ( (array!78315 (arr!37792 (Array (_ BitVec 32) (_ BitVec 64))) (size!38330 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78314)

(declare-fun arrayContainsKey!0 (array!78314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214391 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40127 0))(
  ( (Unit!40128) )
))
(declare-fun lt!552177 () Unit!40127)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78314 (_ BitVec 64) (_ BitVec 32)) Unit!40127)

(assert (=> b!1214391 (= lt!552177 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214392 () Bool)

(declare-fun res!806241 () Bool)

(assert (=> b!1214392 (=> (not res!806241) (not e!689628))))

(assert (=> b!1214392 (= res!806241 (= (select (arr!37792 _keys!1208) i!673) k0!934))))

(declare-fun b!1214393 () Bool)

(declare-fun res!806238 () Bool)

(assert (=> b!1214393 (=> (not res!806238) (not e!689628))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214393 (= res!806238 (validMask!0 mask!1564))))

(declare-fun b!1214394 () Bool)

(declare-fun res!806237 () Bool)

(assert (=> b!1214394 (=> (not res!806237) (not e!689628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78314 (_ BitVec 32)) Bool)

(assert (=> b!1214394 (= res!806237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214395 () Bool)

(assert (=> b!1214395 (= e!689623 true)))

(declare-fun zeroValue!944 () V!46201)

(declare-fun lt!552179 () array!78314)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19952 0))(
  ( (tuple2!19953 (_1!9987 (_ BitVec 64)) (_2!9987 V!46201)) )
))
(declare-datatypes ((List!26729 0))(
  ( (Nil!26726) (Cons!26725 (h!27934 tuple2!19952) (t!39801 List!26729)) )
))
(declare-datatypes ((ListLongMap!17921 0))(
  ( (ListLongMap!17922 (toList!8976 List!26729)) )
))
(declare-fun lt!552176 () ListLongMap!17921)

(declare-fun minValue!944 () V!46201)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5415 (array!78314 array!78312 (_ BitVec 32) (_ BitVec 32) V!46201 V!46201 (_ BitVec 32) Int) ListLongMap!17921)

(declare-fun dynLambda!3267 (Int (_ BitVec 64)) V!46201)

(assert (=> b!1214395 (= lt!552176 (getCurrentListMapNoExtraKeys!5415 lt!552179 (array!78313 (store (arr!37791 _values!996) i!673 (ValueCellFull!14693 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38329 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552178 () ListLongMap!17921)

(assert (=> b!1214395 (= lt!552178 (getCurrentListMapNoExtraKeys!5415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214396 () Bool)

(declare-fun res!806244 () Bool)

(assert (=> b!1214396 (=> (not res!806244) (not e!689624))))

(declare-datatypes ((List!26730 0))(
  ( (Nil!26727) (Cons!26726 (h!27935 (_ BitVec 64)) (t!39802 List!26730)) )
))
(declare-fun arrayNoDuplicates!0 (array!78314 (_ BitVec 32) List!26730) Bool)

(assert (=> b!1214396 (= res!806244 (arrayNoDuplicates!0 lt!552179 #b00000000000000000000000000000000 Nil!26727))))

(declare-fun b!1214397 () Bool)

(declare-fun res!806240 () Bool)

(assert (=> b!1214397 (=> (not res!806240) (not e!689628))))

(assert (=> b!1214397 (= res!806240 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26727))))

(declare-fun res!806235 () Bool)

(assert (=> start!101172 (=> (not res!806235) (not e!689628))))

(assert (=> start!101172 (= res!806235 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38330 _keys!1208))))))

(assert (=> start!101172 e!689628))

(assert (=> start!101172 tp_is_empty!30805))

(declare-fun array_inv!28890 (array!78314) Bool)

(assert (=> start!101172 (array_inv!28890 _keys!1208)))

(assert (=> start!101172 true))

(assert (=> start!101172 tp!91324))

(declare-fun e!689627 () Bool)

(declare-fun array_inv!28891 (array!78312) Bool)

(assert (=> start!101172 (and (array_inv!28891 _values!996) e!689627)))

(declare-fun b!1214387 () Bool)

(declare-fun res!806243 () Bool)

(assert (=> b!1214387 (=> (not res!806243) (not e!689628))))

(assert (=> b!1214387 (= res!806243 (and (= (size!38329 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38330 _keys!1208) (size!38329 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214398 () Bool)

(declare-fun res!806236 () Bool)

(assert (=> b!1214398 (=> (not res!806236) (not e!689628))))

(assert (=> b!1214398 (= res!806236 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38330 _keys!1208))))))

(declare-fun b!1214399 () Bool)

(assert (=> b!1214399 (= e!689627 (and e!689629 mapRes!48082))))

(declare-fun condMapEmpty!48082 () Bool)

(declare-fun mapDefault!48082 () ValueCell!14693)

(assert (=> b!1214399 (= condMapEmpty!48082 (= (arr!37791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14693)) mapDefault!48082)))))

(declare-fun mapIsEmpty!48082 () Bool)

(assert (=> mapIsEmpty!48082 mapRes!48082))

(declare-fun b!1214400 () Bool)

(assert (=> b!1214400 (= e!689628 e!689624)))

(declare-fun res!806242 () Bool)

(assert (=> b!1214400 (=> (not res!806242) (not e!689624))))

(assert (=> b!1214400 (= res!806242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552179 mask!1564))))

(assert (=> b!1214400 (= lt!552179 (array!78315 (store (arr!37792 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38330 _keys!1208)))))

(assert (= (and start!101172 res!806235) b!1214393))

(assert (= (and b!1214393 res!806238) b!1214387))

(assert (= (and b!1214387 res!806243) b!1214394))

(assert (= (and b!1214394 res!806237) b!1214397))

(assert (= (and b!1214397 res!806240) b!1214398))

(assert (= (and b!1214398 res!806236) b!1214390))

(assert (= (and b!1214390 res!806245) b!1214392))

(assert (= (and b!1214392 res!806241) b!1214400))

(assert (= (and b!1214400 res!806242) b!1214396))

(assert (= (and b!1214396 res!806244) b!1214391))

(assert (= (and b!1214391 (not res!806239)) b!1214395))

(assert (= (and b!1214399 condMapEmpty!48082) mapIsEmpty!48082))

(assert (= (and b!1214399 (not condMapEmpty!48082)) mapNonEmpty!48082))

(get-info :version)

(assert (= (and mapNonEmpty!48082 ((_ is ValueCellFull!14693) mapValue!48082)) b!1214389))

(assert (= (and b!1214399 ((_ is ValueCellFull!14693) mapDefault!48082)) b!1214388))

(assert (= start!101172 b!1214399))

(declare-fun b_lambda!21767 () Bool)

(assert (=> (not b_lambda!21767) (not b!1214395)))

(declare-fun t!39800 () Bool)

(declare-fun tb!10893 () Bool)

(assert (=> (and start!101172 (= defaultEntry!1004 defaultEntry!1004) t!39800) tb!10893))

(declare-fun result!22391 () Bool)

(assert (=> tb!10893 (= result!22391 tp_is_empty!30805)))

(assert (=> b!1214395 t!39800))

(declare-fun b_and!43303 () Bool)

(assert (= b_and!43301 (and (=> t!39800 result!22391) b_and!43303)))

(declare-fun m!1119117 () Bool)

(assert (=> b!1214392 m!1119117))

(declare-fun m!1119119 () Bool)

(assert (=> b!1214393 m!1119119))

(declare-fun m!1119121 () Bool)

(assert (=> mapNonEmpty!48082 m!1119121))

(declare-fun m!1119123 () Bool)

(assert (=> b!1214394 m!1119123))

(declare-fun m!1119125 () Bool)

(assert (=> b!1214400 m!1119125))

(declare-fun m!1119127 () Bool)

(assert (=> b!1214400 m!1119127))

(declare-fun m!1119129 () Bool)

(assert (=> b!1214396 m!1119129))

(declare-fun m!1119131 () Bool)

(assert (=> b!1214390 m!1119131))

(declare-fun m!1119133 () Bool)

(assert (=> b!1214395 m!1119133))

(declare-fun m!1119135 () Bool)

(assert (=> b!1214395 m!1119135))

(declare-fun m!1119137 () Bool)

(assert (=> b!1214395 m!1119137))

(declare-fun m!1119139 () Bool)

(assert (=> b!1214395 m!1119139))

(declare-fun m!1119141 () Bool)

(assert (=> b!1214391 m!1119141))

(declare-fun m!1119143 () Bool)

(assert (=> b!1214391 m!1119143))

(declare-fun m!1119145 () Bool)

(assert (=> start!101172 m!1119145))

(declare-fun m!1119147 () Bool)

(assert (=> start!101172 m!1119147))

(declare-fun m!1119149 () Bool)

(assert (=> b!1214397 m!1119149))

(check-sat (not b!1214393) (not start!101172) (not b!1214390) (not b!1214397) (not b_next!26101) (not b!1214391) tp_is_empty!30805 (not b!1214395) (not b!1214396) (not b!1214400) (not b_lambda!21767) (not mapNonEmpty!48082) (not b!1214394) b_and!43303)
(check-sat b_and!43303 (not b_next!26101))
