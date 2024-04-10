; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101204 () Bool)

(assert start!101204)

(declare-fun b_free!26127 () Bool)

(declare-fun b_next!26127 () Bool)

(assert (=> start!101204 (= b_free!26127 (not b_next!26127))))

(declare-fun tp!91403 () Bool)

(declare-fun b_and!43371 () Bool)

(assert (=> start!101204 (= tp!91403 b_and!43371)))

(declare-fun mapIsEmpty!48121 () Bool)

(declare-fun mapRes!48121 () Bool)

(assert (=> mapIsEmpty!48121 mapRes!48121))

(declare-fun b!1215068 () Bool)

(declare-fun e!689969 () Bool)

(declare-fun tp_is_empty!30831 () Bool)

(assert (=> b!1215068 (= e!689969 tp_is_empty!30831)))

(declare-fun b!1215069 () Bool)

(declare-fun e!689971 () Bool)

(assert (=> b!1215069 (= e!689971 tp_is_empty!30831)))

(declare-fun b!1215070 () Bool)

(declare-fun e!689968 () Bool)

(declare-fun e!689966 () Bool)

(assert (=> b!1215070 (= e!689968 e!689966)))

(declare-fun res!806732 () Bool)

(assert (=> b!1215070 (=> (not res!806732) (not e!689966))))

(declare-datatypes ((array!78441 0))(
  ( (array!78442 (arr!37855 (Array (_ BitVec 32) (_ BitVec 64))) (size!38391 (_ BitVec 32))) )
))
(declare-fun lt!552516 () array!78441)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78441 (_ BitVec 32)) Bool)

(assert (=> b!1215070 (= res!806732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552516 mask!1564))))

(declare-fun _keys!1208 () array!78441)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215070 (= lt!552516 (array!78442 (store (arr!37855 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38391 _keys!1208)))))

(declare-fun b!1215071 () Bool)

(declare-fun res!806729 () Bool)

(assert (=> b!1215071 (=> (not res!806729) (not e!689968))))

(declare-datatypes ((List!26687 0))(
  ( (Nil!26684) (Cons!26683 (h!27892 (_ BitVec 64)) (t!39794 List!26687)) )
))
(declare-fun arrayNoDuplicates!0 (array!78441 (_ BitVec 32) List!26687) Bool)

(assert (=> b!1215071 (= res!806729 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26684))))

(declare-fun b!1215072 () Bool)

(declare-fun res!806734 () Bool)

(assert (=> b!1215072 (=> (not res!806734) (not e!689968))))

(assert (=> b!1215072 (= res!806734 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38391 _keys!1208))))))

(declare-fun b!1215073 () Bool)

(declare-fun res!806728 () Bool)

(assert (=> b!1215073 (=> (not res!806728) (not e!689968))))

(assert (=> b!1215073 (= res!806728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215074 () Bool)

(declare-fun e!689967 () Bool)

(assert (=> b!1215074 (= e!689967 (and e!689971 mapRes!48121))))

(declare-fun condMapEmpty!48121 () Bool)

(declare-datatypes ((V!46235 0))(
  ( (V!46236 (val!15472 Int)) )
))
(declare-datatypes ((ValueCell!14706 0))(
  ( (ValueCellFull!14706 (v!18125 V!46235)) (EmptyCell!14706) )
))
(declare-datatypes ((array!78443 0))(
  ( (array!78444 (arr!37856 (Array (_ BitVec 32) ValueCell!14706)) (size!38392 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78443)

(declare-fun mapDefault!48121 () ValueCell!14706)

(assert (=> b!1215074 (= condMapEmpty!48121 (= (arr!37856 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14706)) mapDefault!48121)))))

(declare-fun b!1215075 () Bool)

(declare-fun res!806731 () Bool)

(assert (=> b!1215075 (=> (not res!806731) (not e!689966))))

(assert (=> b!1215075 (= res!806731 (arrayNoDuplicates!0 lt!552516 #b00000000000000000000000000000000 Nil!26684))))

(declare-fun b!1215076 () Bool)

(declare-fun res!806727 () Bool)

(assert (=> b!1215076 (=> (not res!806727) (not e!689968))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215076 (= res!806727 (= (select (arr!37855 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48121 () Bool)

(declare-fun tp!91402 () Bool)

(assert (=> mapNonEmpty!48121 (= mapRes!48121 (and tp!91402 e!689969))))

(declare-fun mapValue!48121 () ValueCell!14706)

(declare-fun mapKey!48121 () (_ BitVec 32))

(declare-fun mapRest!48121 () (Array (_ BitVec 32) ValueCell!14706))

(assert (=> mapNonEmpty!48121 (= (arr!37856 _values!996) (store mapRest!48121 mapKey!48121 mapValue!48121))))

(declare-fun res!806735 () Bool)

(assert (=> start!101204 (=> (not res!806735) (not e!689968))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101204 (= res!806735 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38391 _keys!1208))))))

(assert (=> start!101204 e!689968))

(assert (=> start!101204 tp_is_empty!30831))

(declare-fun array_inv!28826 (array!78441) Bool)

(assert (=> start!101204 (array_inv!28826 _keys!1208)))

(assert (=> start!101204 true))

(assert (=> start!101204 tp!91403))

(declare-fun array_inv!28827 (array!78443) Bool)

(assert (=> start!101204 (and (array_inv!28827 _values!996) e!689967)))

(declare-fun b!1215077 () Bool)

(declare-fun res!806730 () Bool)

(assert (=> b!1215077 (=> (not res!806730) (not e!689968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215077 (= res!806730 (validKeyInArray!0 k0!934))))

(declare-fun b!1215078 () Bool)

(declare-fun e!689970 () Bool)

(assert (=> b!1215078 (= e!689966 (not e!689970))))

(declare-fun res!806725 () Bool)

(assert (=> b!1215078 (=> res!806725 e!689970)))

(assert (=> b!1215078 (= res!806725 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215078 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40290 0))(
  ( (Unit!40291) )
))
(declare-fun lt!552514 () Unit!40290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78441 (_ BitVec 64) (_ BitVec 32)) Unit!40290)

(assert (=> b!1215078 (= lt!552514 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215079 () Bool)

(declare-fun res!806726 () Bool)

(assert (=> b!1215079 (=> (not res!806726) (not e!689968))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1215079 (= res!806726 (and (= (size!38392 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38391 _keys!1208) (size!38392 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215080 () Bool)

(declare-fun res!806733 () Bool)

(assert (=> b!1215080 (=> (not res!806733) (not e!689968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215080 (= res!806733 (validMask!0 mask!1564))))

(declare-fun b!1215081 () Bool)

(assert (=> b!1215081 (= e!689970 true)))

(declare-fun zeroValue!944 () V!46235)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19888 0))(
  ( (tuple2!19889 (_1!9955 (_ BitVec 64)) (_2!9955 V!46235)) )
))
(declare-datatypes ((List!26688 0))(
  ( (Nil!26685) (Cons!26684 (h!27893 tuple2!19888) (t!39795 List!26688)) )
))
(declare-datatypes ((ListLongMap!17857 0))(
  ( (ListLongMap!17858 (toList!8944 List!26688)) )
))
(declare-fun lt!552513 () ListLongMap!17857)

(declare-fun minValue!944 () V!46235)

(declare-fun getCurrentListMapNoExtraKeys!5371 (array!78441 array!78443 (_ BitVec 32) (_ BitVec 32) V!46235 V!46235 (_ BitVec 32) Int) ListLongMap!17857)

(declare-fun dynLambda!3260 (Int (_ BitVec 64)) V!46235)

(assert (=> b!1215081 (= lt!552513 (getCurrentListMapNoExtraKeys!5371 lt!552516 (array!78444 (store (arr!37856 _values!996) i!673 (ValueCellFull!14706 (dynLambda!3260 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38392 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552515 () ListLongMap!17857)

(assert (=> b!1215081 (= lt!552515 (getCurrentListMapNoExtraKeys!5371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101204 res!806735) b!1215080))

(assert (= (and b!1215080 res!806733) b!1215079))

(assert (= (and b!1215079 res!806726) b!1215073))

(assert (= (and b!1215073 res!806728) b!1215071))

(assert (= (and b!1215071 res!806729) b!1215072))

(assert (= (and b!1215072 res!806734) b!1215077))

(assert (= (and b!1215077 res!806730) b!1215076))

(assert (= (and b!1215076 res!806727) b!1215070))

(assert (= (and b!1215070 res!806732) b!1215075))

(assert (= (and b!1215075 res!806731) b!1215078))

(assert (= (and b!1215078 (not res!806725)) b!1215081))

(assert (= (and b!1215074 condMapEmpty!48121) mapIsEmpty!48121))

(assert (= (and b!1215074 (not condMapEmpty!48121)) mapNonEmpty!48121))

(get-info :version)

(assert (= (and mapNonEmpty!48121 ((_ is ValueCellFull!14706) mapValue!48121)) b!1215068))

(assert (= (and b!1215074 ((_ is ValueCellFull!14706) mapDefault!48121)) b!1215069))

(assert (= start!101204 b!1215074))

(declare-fun b_lambda!21803 () Bool)

(assert (=> (not b_lambda!21803) (not b!1215081)))

(declare-fun t!39793 () Bool)

(declare-fun tb!10927 () Bool)

(assert (=> (and start!101204 (= defaultEntry!1004 defaultEntry!1004) t!39793) tb!10927))

(declare-fun result!22451 () Bool)

(assert (=> tb!10927 (= result!22451 tp_is_empty!30831)))

(assert (=> b!1215081 t!39793))

(declare-fun b_and!43373 () Bool)

(assert (= b_and!43371 (and (=> t!39793 result!22451) b_and!43373)))

(declare-fun m!1120123 () Bool)

(assert (=> b!1215077 m!1120123))

(declare-fun m!1120125 () Bool)

(assert (=> b!1215078 m!1120125))

(declare-fun m!1120127 () Bool)

(assert (=> b!1215078 m!1120127))

(declare-fun m!1120129 () Bool)

(assert (=> b!1215081 m!1120129))

(declare-fun m!1120131 () Bool)

(assert (=> b!1215081 m!1120131))

(declare-fun m!1120133 () Bool)

(assert (=> b!1215081 m!1120133))

(declare-fun m!1120135 () Bool)

(assert (=> b!1215081 m!1120135))

(declare-fun m!1120137 () Bool)

(assert (=> mapNonEmpty!48121 m!1120137))

(declare-fun m!1120139 () Bool)

(assert (=> b!1215076 m!1120139))

(declare-fun m!1120141 () Bool)

(assert (=> start!101204 m!1120141))

(declare-fun m!1120143 () Bool)

(assert (=> start!101204 m!1120143))

(declare-fun m!1120145 () Bool)

(assert (=> b!1215073 m!1120145))

(declare-fun m!1120147 () Bool)

(assert (=> b!1215075 m!1120147))

(declare-fun m!1120149 () Bool)

(assert (=> b!1215071 m!1120149))

(declare-fun m!1120151 () Bool)

(assert (=> b!1215080 m!1120151))

(declare-fun m!1120153 () Bool)

(assert (=> b!1215070 m!1120153))

(declare-fun m!1120155 () Bool)

(assert (=> b!1215070 m!1120155))

(check-sat (not b!1215070) (not b_lambda!21803) b_and!43373 (not b!1215078) (not b!1215077) (not mapNonEmpty!48121) (not b!1215080) (not b!1215081) (not b!1215075) (not start!101204) (not b!1215073) (not b!1215071) (not b_next!26127) tp_is_empty!30831)
(check-sat b_and!43373 (not b_next!26127))
