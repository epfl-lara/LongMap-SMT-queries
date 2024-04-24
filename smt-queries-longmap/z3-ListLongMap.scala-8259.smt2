; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100738 () Bool)

(assert start!100738)

(declare-fun b_free!25825 () Bool)

(declare-fun b_next!25825 () Bool)

(assert (=> start!100738 (= b_free!25825 (not b_next!25825))))

(declare-fun tp!90465 () Bool)

(declare-fun b_and!42539 () Bool)

(assert (=> start!100738 (= tp!90465 b_and!42539)))

(declare-fun res!799717 () Bool)

(declare-fun e!682636 () Bool)

(assert (=> start!100738 (=> (not res!799717) (not e!682636))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77869 0))(
  ( (array!77870 (arr!37573 (Array (_ BitVec 32) (_ BitVec 64))) (size!38110 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77869)

(assert (=> start!100738 (= res!799717 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38110 _keys!1208))))))

(assert (=> start!100738 e!682636))

(declare-fun tp_is_empty!30529 () Bool)

(assert (=> start!100738 tp_is_empty!30529))

(declare-fun array_inv!28700 (array!77869) Bool)

(assert (=> start!100738 (array_inv!28700 _keys!1208)))

(assert (=> start!100738 true))

(assert (=> start!100738 tp!90465))

(declare-datatypes ((V!45833 0))(
  ( (V!45834 (val!15321 Int)) )
))
(declare-datatypes ((ValueCell!14555 0))(
  ( (ValueCellFull!14555 (v!17955 V!45833)) (EmptyCell!14555) )
))
(declare-datatypes ((array!77871 0))(
  ( (array!77872 (arr!37574 (Array (_ BitVec 32) ValueCell!14555)) (size!38111 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77871)

(declare-fun e!682640 () Bool)

(declare-fun array_inv!28701 (array!77871) Bool)

(assert (=> start!100738 (and (array_inv!28701 _values!996) e!682640)))

(declare-fun b!1201876 () Bool)

(declare-fun e!682639 () Bool)

(declare-datatypes ((tuple2!19632 0))(
  ( (tuple2!19633 (_1!9827 (_ BitVec 64)) (_2!9827 V!45833)) )
))
(declare-datatypes ((List!26447 0))(
  ( (Nil!26444) (Cons!26443 (h!27661 tuple2!19632) (t!39244 List!26447)) )
))
(declare-datatypes ((ListLongMap!17609 0))(
  ( (ListLongMap!17610 (toList!8820 List!26447)) )
))
(declare-fun call!57369 () ListLongMap!17609)

(declare-fun call!57370 () ListLongMap!17609)

(assert (=> b!1201876 (= e!682639 (= call!57369 call!57370))))

(declare-fun b!1201877 () Bool)

(declare-fun res!799719 () Bool)

(assert (=> b!1201877 (=> (not res!799719) (not e!682636))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201877 (= res!799719 (validMask!0 mask!1564))))

(declare-fun b!1201878 () Bool)

(declare-fun res!799714 () Bool)

(assert (=> b!1201878 (=> (not res!799714) (not e!682636))))

(declare-datatypes ((List!26448 0))(
  ( (Nil!26445) (Cons!26444 (h!27662 (_ BitVec 64)) (t!39245 List!26448)) )
))
(declare-fun arrayNoDuplicates!0 (array!77869 (_ BitVec 32) List!26448) Bool)

(assert (=> b!1201878 (= res!799714 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26445))))

(declare-fun b!1201879 () Bool)

(declare-fun res!799713 () Bool)

(declare-fun e!682632 () Bool)

(assert (=> b!1201879 (=> (not res!799713) (not e!682632))))

(declare-fun lt!544586 () array!77869)

(assert (=> b!1201879 (= res!799713 (arrayNoDuplicates!0 lt!544586 #b00000000000000000000000000000000 Nil!26445))))

(declare-fun mapNonEmpty!47636 () Bool)

(declare-fun mapRes!47636 () Bool)

(declare-fun tp!90464 () Bool)

(declare-fun e!682634 () Bool)

(assert (=> mapNonEmpty!47636 (= mapRes!47636 (and tp!90464 e!682634))))

(declare-fun mapRest!47636 () (Array (_ BitVec 32) ValueCell!14555))

(declare-fun mapKey!47636 () (_ BitVec 32))

(declare-fun mapValue!47636 () ValueCell!14555)

(assert (=> mapNonEmpty!47636 (= (arr!37574 _values!996) (store mapRest!47636 mapKey!47636 mapValue!47636))))

(declare-fun b!1201880 () Bool)

(assert (=> b!1201880 (= e!682636 e!682632)))

(declare-fun res!799716 () Bool)

(assert (=> b!1201880 (=> (not res!799716) (not e!682632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77869 (_ BitVec 32)) Bool)

(assert (=> b!1201880 (= res!799716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544586 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201880 (= lt!544586 (array!77870 (store (arr!37573 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38110 _keys!1208)))))

(declare-fun b!1201881 () Bool)

(assert (=> b!1201881 (= e!682634 tp_is_empty!30529)))

(declare-fun b!1201882 () Bool)

(declare-fun e!682631 () Bool)

(declare-fun e!682637 () Bool)

(assert (=> b!1201882 (= e!682631 e!682637)))

(declare-fun res!799718 () Bool)

(assert (=> b!1201882 (=> res!799718 e!682637)))

(assert (=> b!1201882 (= res!799718 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!544584 () array!77871)

(declare-fun minValue!944 () V!45833)

(declare-fun zeroValue!944 () V!45833)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!544585 () ListLongMap!17609)

(declare-fun getCurrentListMapNoExtraKeys!5287 (array!77869 array!77871 (_ BitVec 32) (_ BitVec 32) V!45833 V!45833 (_ BitVec 32) Int) ListLongMap!17609)

(assert (=> b!1201882 (= lt!544585 (getCurrentListMapNoExtraKeys!5287 lt!544586 lt!544584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3230 (Int (_ BitVec 64)) V!45833)

(assert (=> b!1201882 (= lt!544584 (array!77872 (store (arr!37574 _values!996) i!673 (ValueCellFull!14555 (dynLambda!3230 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38111 _values!996)))))

(declare-fun lt!544582 () ListLongMap!17609)

(assert (=> b!1201882 (= lt!544582 (getCurrentListMapNoExtraKeys!5287 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201883 () Bool)

(declare-fun res!799723 () Bool)

(assert (=> b!1201883 (=> (not res!799723) (not e!682636))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1201883 (= res!799723 (= (select (arr!37573 _keys!1208) i!673) k0!934))))

(declare-fun b!1201884 () Bool)

(declare-fun e!682633 () Bool)

(assert (=> b!1201884 (= e!682633 tp_is_empty!30529)))

(declare-fun b!1201885 () Bool)

(assert (=> b!1201885 (= e!682640 (and e!682633 mapRes!47636))))

(declare-fun condMapEmpty!47636 () Bool)

(declare-fun mapDefault!47636 () ValueCell!14555)

(assert (=> b!1201885 (= condMapEmpty!47636 (= (arr!37574 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14555)) mapDefault!47636)))))

(declare-fun b!1201886 () Bool)

(declare-fun e!682635 () Bool)

(assert (=> b!1201886 (= e!682635 true)))

(declare-fun lt!544583 () Bool)

(declare-fun contains!6900 (ListLongMap!17609 (_ BitVec 64)) Bool)

(assert (=> b!1201886 (= lt!544583 (contains!6900 (getCurrentListMapNoExtraKeys!5287 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1201887 () Bool)

(declare-fun -!1782 (ListLongMap!17609 (_ BitVec 64)) ListLongMap!17609)

(assert (=> b!1201887 (= e!682639 (= call!57369 (-!1782 call!57370 k0!934)))))

(declare-fun b!1201888 () Bool)

(assert (=> b!1201888 (= e!682632 (not e!682631))))

(declare-fun res!799720 () Bool)

(assert (=> b!1201888 (=> res!799720 e!682631)))

(assert (=> b!1201888 (= res!799720 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201888 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39767 0))(
  ( (Unit!39768) )
))
(declare-fun lt!544581 () Unit!39767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77869 (_ BitVec 64) (_ BitVec 32)) Unit!39767)

(assert (=> b!1201888 (= lt!544581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201889 () Bool)

(assert (=> b!1201889 (= e!682637 e!682635)))

(declare-fun res!799715 () Bool)

(assert (=> b!1201889 (=> res!799715 e!682635)))

(assert (=> b!1201889 (= res!799715 (not (= (select (arr!37573 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201889 e!682639))

(declare-fun c!117847 () Bool)

(assert (=> b!1201889 (= c!117847 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544580 () Unit!39767)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!999 (array!77869 array!77871 (_ BitVec 32) (_ BitVec 32) V!45833 V!45833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39767)

(assert (=> b!1201889 (= lt!544580 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201890 () Bool)

(declare-fun res!799722 () Bool)

(assert (=> b!1201890 (=> (not res!799722) (not e!682636))))

(assert (=> b!1201890 (= res!799722 (and (= (size!38111 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38110 _keys!1208) (size!38111 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57366 () Bool)

(assert (=> bm!57366 (= call!57370 (getCurrentListMapNoExtraKeys!5287 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57367 () Bool)

(assert (=> bm!57367 (= call!57369 (getCurrentListMapNoExtraKeys!5287 lt!544586 lt!544584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201891 () Bool)

(declare-fun res!799712 () Bool)

(assert (=> b!1201891 (=> (not res!799712) (not e!682636))))

(assert (=> b!1201891 (= res!799712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201892 () Bool)

(declare-fun res!799711 () Bool)

(assert (=> b!1201892 (=> (not res!799711) (not e!682636))))

(assert (=> b!1201892 (= res!799711 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38110 _keys!1208))))))

(declare-fun b!1201893 () Bool)

(declare-fun res!799721 () Bool)

(assert (=> b!1201893 (=> (not res!799721) (not e!682636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201893 (= res!799721 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47636 () Bool)

(assert (=> mapIsEmpty!47636 mapRes!47636))

(assert (= (and start!100738 res!799717) b!1201877))

(assert (= (and b!1201877 res!799719) b!1201890))

(assert (= (and b!1201890 res!799722) b!1201891))

(assert (= (and b!1201891 res!799712) b!1201878))

(assert (= (and b!1201878 res!799714) b!1201892))

(assert (= (and b!1201892 res!799711) b!1201893))

(assert (= (and b!1201893 res!799721) b!1201883))

(assert (= (and b!1201883 res!799723) b!1201880))

(assert (= (and b!1201880 res!799716) b!1201879))

(assert (= (and b!1201879 res!799713) b!1201888))

(assert (= (and b!1201888 (not res!799720)) b!1201882))

(assert (= (and b!1201882 (not res!799718)) b!1201889))

(assert (= (and b!1201889 c!117847) b!1201887))

(assert (= (and b!1201889 (not c!117847)) b!1201876))

(assert (= (or b!1201887 b!1201876) bm!57367))

(assert (= (or b!1201887 b!1201876) bm!57366))

(assert (= (and b!1201889 (not res!799715)) b!1201886))

(assert (= (and b!1201885 condMapEmpty!47636) mapIsEmpty!47636))

(assert (= (and b!1201885 (not condMapEmpty!47636)) mapNonEmpty!47636))

(get-info :version)

(assert (= (and mapNonEmpty!47636 ((_ is ValueCellFull!14555) mapValue!47636)) b!1201881))

(assert (= (and b!1201885 ((_ is ValueCellFull!14555) mapDefault!47636)) b!1201884))

(assert (= start!100738 b!1201885))

(declare-fun b_lambda!21015 () Bool)

(assert (=> (not b_lambda!21015) (not b!1201882)))

(declare-fun t!39243 () Bool)

(declare-fun tb!10617 () Bool)

(assert (=> (and start!100738 (= defaultEntry!1004 defaultEntry!1004) t!39243) tb!10617))

(declare-fun result!21819 () Bool)

(assert (=> tb!10617 (= result!21819 tp_is_empty!30529)))

(assert (=> b!1201882 t!39243))

(declare-fun b_and!42541 () Bool)

(assert (= b_and!42539 (and (=> t!39243 result!21819) b_and!42541)))

(declare-fun m!1108433 () Bool)

(assert (=> b!1201893 m!1108433))

(declare-fun m!1108435 () Bool)

(assert (=> b!1201886 m!1108435))

(assert (=> b!1201886 m!1108435))

(declare-fun m!1108437 () Bool)

(assert (=> b!1201886 m!1108437))

(declare-fun m!1108439 () Bool)

(assert (=> b!1201878 m!1108439))

(assert (=> bm!57366 m!1108435))

(declare-fun m!1108441 () Bool)

(assert (=> b!1201887 m!1108441))

(declare-fun m!1108443 () Bool)

(assert (=> b!1201882 m!1108443))

(declare-fun m!1108445 () Bool)

(assert (=> b!1201882 m!1108445))

(declare-fun m!1108447 () Bool)

(assert (=> b!1201882 m!1108447))

(declare-fun m!1108449 () Bool)

(assert (=> b!1201882 m!1108449))

(declare-fun m!1108451 () Bool)

(assert (=> b!1201879 m!1108451))

(declare-fun m!1108453 () Bool)

(assert (=> b!1201891 m!1108453))

(declare-fun m!1108455 () Bool)

(assert (=> b!1201877 m!1108455))

(declare-fun m!1108457 () Bool)

(assert (=> bm!57367 m!1108457))

(declare-fun m!1108459 () Bool)

(assert (=> b!1201888 m!1108459))

(declare-fun m!1108461 () Bool)

(assert (=> b!1201888 m!1108461))

(declare-fun m!1108463 () Bool)

(assert (=> b!1201880 m!1108463))

(declare-fun m!1108465 () Bool)

(assert (=> b!1201880 m!1108465))

(declare-fun m!1108467 () Bool)

(assert (=> start!100738 m!1108467))

(declare-fun m!1108469 () Bool)

(assert (=> start!100738 m!1108469))

(declare-fun m!1108471 () Bool)

(assert (=> b!1201889 m!1108471))

(declare-fun m!1108473 () Bool)

(assert (=> b!1201889 m!1108473))

(declare-fun m!1108475 () Bool)

(assert (=> b!1201883 m!1108475))

(declare-fun m!1108477 () Bool)

(assert (=> mapNonEmpty!47636 m!1108477))

(check-sat (not bm!57366) (not b!1201888) (not b!1201887) (not b!1201880) (not b!1201879) (not b!1201878) (not b!1201889) (not b!1201886) tp_is_empty!30529 (not b_next!25825) (not b!1201877) (not start!100738) (not mapNonEmpty!47636) (not b_lambda!21015) (not b!1201891) (not b!1201882) (not bm!57367) b_and!42541 (not b!1201893))
(check-sat b_and!42541 (not b_next!25825))
