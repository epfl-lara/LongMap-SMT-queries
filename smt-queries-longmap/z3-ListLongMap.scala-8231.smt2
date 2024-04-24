; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100530 () Bool)

(assert start!100530)

(declare-fun b_free!25681 () Bool)

(declare-fun b_next!25681 () Bool)

(assert (=> start!100530 (= b_free!25681 (not b_next!25681))))

(declare-fun tp!89991 () Bool)

(declare-fun b_and!42231 () Bool)

(assert (=> start!100530 (= tp!89991 b_and!42231)))

(declare-fun b!1197902 () Bool)

(declare-fun e!680681 () Bool)

(declare-fun e!680686 () Bool)

(declare-fun mapRes!47378 () Bool)

(assert (=> b!1197902 (= e!680681 (and e!680686 mapRes!47378))))

(declare-fun condMapEmpty!47378 () Bool)

(declare-datatypes ((V!45609 0))(
  ( (V!45610 (val!15237 Int)) )
))
(declare-datatypes ((ValueCell!14471 0))(
  ( (ValueCellFull!14471 (v!17871 V!45609)) (EmptyCell!14471) )
))
(declare-datatypes ((array!77539 0))(
  ( (array!77540 (arr!37410 (Array (_ BitVec 32) ValueCell!14471)) (size!37947 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77539)

(declare-fun mapDefault!47378 () ValueCell!14471)

(assert (=> b!1197902 (= condMapEmpty!47378 (= (arr!37410 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14471)) mapDefault!47378)))))

(declare-fun b!1197903 () Bool)

(declare-fun res!796868 () Bool)

(declare-fun e!680685 () Bool)

(assert (=> b!1197903 (=> (not res!796868) (not e!680685))))

(declare-datatypes ((array!77541 0))(
  ( (array!77542 (arr!37411 (Array (_ BitVec 32) (_ BitVec 64))) (size!37948 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77541)

(declare-datatypes ((List!26334 0))(
  ( (Nil!26331) (Cons!26330 (h!27548 (_ BitVec 64)) (t!38999 List!26334)) )
))
(declare-fun arrayNoDuplicates!0 (array!77541 (_ BitVec 32) List!26334) Bool)

(assert (=> b!1197903 (= res!796868 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26331))))

(declare-fun b!1197904 () Bool)

(declare-fun tp_is_empty!30361 () Bool)

(assert (=> b!1197904 (= e!680686 tp_is_empty!30361)))

(declare-fun mapIsEmpty!47378 () Bool)

(assert (=> mapIsEmpty!47378 mapRes!47378))

(declare-fun zeroValue!944 () V!45609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19534 0))(
  ( (tuple2!19535 (_1!9778 (_ BitVec 64)) (_2!9778 V!45609)) )
))
(declare-datatypes ((List!26335 0))(
  ( (Nil!26332) (Cons!26331 (h!27549 tuple2!19534) (t!39000 List!26335)) )
))
(declare-datatypes ((ListLongMap!17511 0))(
  ( (ListLongMap!17512 (toList!8771 List!26335)) )
))
(declare-fun call!57230 () ListLongMap!17511)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!543594 () array!77541)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57226 () Bool)

(declare-fun minValue!944 () V!45609)

(declare-fun getCurrentListMapNoExtraKeys!5238 (array!77541 array!77539 (_ BitVec 32) (_ BitVec 32) V!45609 V!45609 (_ BitVec 32) Int) ListLongMap!17511)

(declare-fun dynLambda!3186 (Int (_ BitVec 64)) V!45609)

(assert (=> bm!57226 (= call!57230 (getCurrentListMapNoExtraKeys!5238 lt!543594 (array!77540 (store (arr!37410 _values!996) i!673 (ValueCellFull!14471 (dynLambda!3186 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37947 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47378 () Bool)

(declare-fun tp!89990 () Bool)

(declare-fun e!680682 () Bool)

(assert (=> mapNonEmpty!47378 (= mapRes!47378 (and tp!89990 e!680682))))

(declare-fun mapRest!47378 () (Array (_ BitVec 32) ValueCell!14471))

(declare-fun mapValue!47378 () ValueCell!14471)

(declare-fun mapKey!47378 () (_ BitVec 32))

(assert (=> mapNonEmpty!47378 (= (arr!37410 _values!996) (store mapRest!47378 mapKey!47378 mapValue!47378))))

(declare-fun res!796877 () Bool)

(assert (=> start!100530 (=> (not res!796877) (not e!680685))))

(assert (=> start!100530 (= res!796877 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37948 _keys!1208))))))

(assert (=> start!100530 e!680685))

(assert (=> start!100530 tp_is_empty!30361))

(declare-fun array_inv!28582 (array!77541) Bool)

(assert (=> start!100530 (array_inv!28582 _keys!1208)))

(assert (=> start!100530 true))

(assert (=> start!100530 tp!89991))

(declare-fun array_inv!28583 (array!77539) Bool)

(assert (=> start!100530 (and (array_inv!28583 _values!996) e!680681)))

(declare-fun b!1197905 () Bool)

(declare-fun res!796874 () Bool)

(assert (=> b!1197905 (=> (not res!796874) (not e!680685))))

(assert (=> b!1197905 (= res!796874 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37948 _keys!1208))))))

(declare-fun b!1197906 () Bool)

(declare-fun res!796867 () Bool)

(assert (=> b!1197906 (=> (not res!796867) (not e!680685))))

(assert (=> b!1197906 (= res!796867 (and (= (size!37947 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37948 _keys!1208) (size!37947 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197907 () Bool)

(declare-fun res!796872 () Bool)

(assert (=> b!1197907 (=> (not res!796872) (not e!680685))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197907 (= res!796872 (validKeyInArray!0 k0!934))))

(declare-fun b!1197908 () Bool)

(assert (=> b!1197908 (= e!680682 tp_is_empty!30361)))

(declare-fun b!1197909 () Bool)

(declare-fun e!680680 () Bool)

(assert (=> b!1197909 (= e!680680 true)))

(declare-fun e!680687 () Bool)

(assert (=> b!1197909 e!680687))

(declare-fun c!117734 () Bool)

(assert (=> b!1197909 (= c!117734 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39647 0))(
  ( (Unit!39648) )
))
(declare-fun lt!543595 () Unit!39647)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!985 (array!77541 array!77539 (_ BitVec 32) (_ BitVec 32) V!45609 V!45609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39647)

(assert (=> b!1197909 (= lt!543595 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!985 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197910 () Bool)

(declare-fun res!796870 () Bool)

(assert (=> b!1197910 (=> (not res!796870) (not e!680685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197910 (= res!796870 (validMask!0 mask!1564))))

(declare-fun b!1197911 () Bool)

(declare-fun call!57229 () ListLongMap!17511)

(declare-fun -!1771 (ListLongMap!17511 (_ BitVec 64)) ListLongMap!17511)

(assert (=> b!1197911 (= e!680687 (= call!57230 (-!1771 call!57229 k0!934)))))

(declare-fun b!1197912 () Bool)

(declare-fun res!796869 () Bool)

(assert (=> b!1197912 (=> (not res!796869) (not e!680685))))

(assert (=> b!1197912 (= res!796869 (= (select (arr!37411 _keys!1208) i!673) k0!934))))

(declare-fun b!1197913 () Bool)

(declare-fun e!680683 () Bool)

(assert (=> b!1197913 (= e!680685 e!680683)))

(declare-fun res!796875 () Bool)

(assert (=> b!1197913 (=> (not res!796875) (not e!680683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77541 (_ BitVec 32)) Bool)

(assert (=> b!1197913 (= res!796875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543594 mask!1564))))

(assert (=> b!1197913 (= lt!543594 (array!77542 (store (arr!37411 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37948 _keys!1208)))))

(declare-fun b!1197914 () Bool)

(assert (=> b!1197914 (= e!680687 (= call!57230 call!57229))))

(declare-fun b!1197915 () Bool)

(declare-fun res!796871 () Bool)

(assert (=> b!1197915 (=> (not res!796871) (not e!680683))))

(assert (=> b!1197915 (= res!796871 (arrayNoDuplicates!0 lt!543594 #b00000000000000000000000000000000 Nil!26331))))

(declare-fun bm!57227 () Bool)

(assert (=> bm!57227 (= call!57229 (getCurrentListMapNoExtraKeys!5238 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197916 () Bool)

(declare-fun res!796873 () Bool)

(assert (=> b!1197916 (=> (not res!796873) (not e!680685))))

(assert (=> b!1197916 (= res!796873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197917 () Bool)

(assert (=> b!1197917 (= e!680683 (not e!680680))))

(declare-fun res!796876 () Bool)

(assert (=> b!1197917 (=> res!796876 e!680680)))

(assert (=> b!1197917 (= res!796876 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37948 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197917 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543593 () Unit!39647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77541 (_ BitVec 64) (_ BitVec 32)) Unit!39647)

(assert (=> b!1197917 (= lt!543593 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100530 res!796877) b!1197910))

(assert (= (and b!1197910 res!796870) b!1197906))

(assert (= (and b!1197906 res!796867) b!1197916))

(assert (= (and b!1197916 res!796873) b!1197903))

(assert (= (and b!1197903 res!796868) b!1197905))

(assert (= (and b!1197905 res!796874) b!1197907))

(assert (= (and b!1197907 res!796872) b!1197912))

(assert (= (and b!1197912 res!796869) b!1197913))

(assert (= (and b!1197913 res!796875) b!1197915))

(assert (= (and b!1197915 res!796871) b!1197917))

(assert (= (and b!1197917 (not res!796876)) b!1197909))

(assert (= (and b!1197909 c!117734) b!1197911))

(assert (= (and b!1197909 (not c!117734)) b!1197914))

(assert (= (or b!1197911 b!1197914) bm!57226))

(assert (= (or b!1197911 b!1197914) bm!57227))

(assert (= (and b!1197902 condMapEmpty!47378) mapIsEmpty!47378))

(assert (= (and b!1197902 (not condMapEmpty!47378)) mapNonEmpty!47378))

(get-info :version)

(assert (= (and mapNonEmpty!47378 ((_ is ValueCellFull!14471) mapValue!47378)) b!1197908))

(assert (= (and b!1197902 ((_ is ValueCellFull!14471) mapDefault!47378)) b!1197904))

(assert (= start!100530 b!1197902))

(declare-fun b_lambda!20819 () Bool)

(assert (=> (not b_lambda!20819) (not bm!57226)))

(declare-fun t!38998 () Bool)

(declare-fun tb!10485 () Bool)

(assert (=> (and start!100530 (= defaultEntry!1004 defaultEntry!1004) t!38998) tb!10485))

(declare-fun result!21551 () Bool)

(assert (=> tb!10485 (= result!21551 tp_is_empty!30361)))

(assert (=> bm!57226 t!38998))

(declare-fun b_and!42233 () Bool)

(assert (= b_and!42231 (and (=> t!38998 result!21551) b_and!42233)))

(declare-fun m!1105359 () Bool)

(assert (=> b!1197912 m!1105359))

(declare-fun m!1105361 () Bool)

(assert (=> bm!57227 m!1105361))

(declare-fun m!1105363 () Bool)

(assert (=> b!1197913 m!1105363))

(declare-fun m!1105365 () Bool)

(assert (=> b!1197913 m!1105365))

(declare-fun m!1105367 () Bool)

(assert (=> b!1197911 m!1105367))

(declare-fun m!1105369 () Bool)

(assert (=> bm!57226 m!1105369))

(declare-fun m!1105371 () Bool)

(assert (=> bm!57226 m!1105371))

(declare-fun m!1105373 () Bool)

(assert (=> bm!57226 m!1105373))

(declare-fun m!1105375 () Bool)

(assert (=> b!1197915 m!1105375))

(declare-fun m!1105377 () Bool)

(assert (=> b!1197910 m!1105377))

(declare-fun m!1105379 () Bool)

(assert (=> start!100530 m!1105379))

(declare-fun m!1105381 () Bool)

(assert (=> start!100530 m!1105381))

(declare-fun m!1105383 () Bool)

(assert (=> b!1197917 m!1105383))

(declare-fun m!1105385 () Bool)

(assert (=> b!1197917 m!1105385))

(declare-fun m!1105387 () Bool)

(assert (=> b!1197907 m!1105387))

(declare-fun m!1105389 () Bool)

(assert (=> b!1197903 m!1105389))

(declare-fun m!1105391 () Bool)

(assert (=> b!1197909 m!1105391))

(declare-fun m!1105393 () Bool)

(assert (=> mapNonEmpty!47378 m!1105393))

(declare-fun m!1105395 () Bool)

(assert (=> b!1197916 m!1105395))

(check-sat (not b!1197917) tp_is_empty!30361 (not b!1197909) (not b!1197916) (not start!100530) (not b!1197913) (not b!1197910) (not bm!57226) b_and!42233 (not b!1197915) (not b!1197907) (not b_next!25681) (not b!1197911) (not b!1197903) (not mapNonEmpty!47378) (not bm!57227) (not b_lambda!20819))
(check-sat b_and!42233 (not b_next!25681))
