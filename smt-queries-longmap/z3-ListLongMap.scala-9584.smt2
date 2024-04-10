; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113368 () Bool)

(assert start!113368)

(declare-fun b_free!31419 () Bool)

(declare-fun b_next!31419 () Bool)

(assert (=> start!113368 (= b_free!31419 (not b_next!31419))))

(declare-fun tp!110062 () Bool)

(declare-fun b_and!50691 () Bool)

(assert (=> start!113368 (= tp!110062 b_and!50691)))

(declare-fun b!1345622 () Bool)

(declare-fun res!892874 () Bool)

(declare-fun e!765680 () Bool)

(assert (=> b!1345622 (=> (not res!892874) (not e!765680))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91678 0))(
  ( (array!91679 (arr!44295 (Array (_ BitVec 32) (_ BitVec 64))) (size!44845 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91678)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345622 (= res!892874 (not (= (select (arr!44295 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345623 () Bool)

(declare-fun e!765681 () Bool)

(assert (=> b!1345623 (= e!765681 (not true))))

(declare-datatypes ((V!54995 0))(
  ( (V!54996 (val!18784 Int)) )
))
(declare-datatypes ((tuple2!24214 0))(
  ( (tuple2!24215 (_1!12118 (_ BitVec 64)) (_2!12118 V!54995)) )
))
(declare-datatypes ((List!31369 0))(
  ( (Nil!31366) (Cons!31365 (h!32574 tuple2!24214) (t!45945 List!31369)) )
))
(declare-datatypes ((ListLongMap!21871 0))(
  ( (ListLongMap!21872 (toList!10951 List!31369)) )
))
(declare-fun lt!595388 () ListLongMap!21871)

(declare-fun contains!9127 (ListLongMap!21871 (_ BitVec 64)) Bool)

(assert (=> b!1345623 (contains!9127 lt!595388 k0!1142)))

(declare-datatypes ((Unit!44135 0))(
  ( (Unit!44136) )
))
(declare-fun lt!595387 () Unit!44135)

(declare-fun lt!595389 () V!54995)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!398 ((_ BitVec 64) (_ BitVec 64) V!54995 ListLongMap!21871) Unit!44135)

(assert (=> b!1345623 (= lt!595387 (lemmaInListMapAfterAddingDiffThenInBefore!398 k0!1142 (select (arr!44295 _keys!1571) from!1960) lt!595389 lt!595388))))

(declare-fun b!1345624 () Bool)

(declare-fun res!892876 () Bool)

(assert (=> b!1345624 (=> (not res!892876) (not e!765680))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345624 (= res!892876 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345625 () Bool)

(declare-fun e!765678 () Bool)

(declare-fun e!765679 () Bool)

(declare-fun mapRes!57835 () Bool)

(assert (=> b!1345625 (= e!765678 (and e!765679 mapRes!57835))))

(declare-fun condMapEmpty!57835 () Bool)

(declare-datatypes ((ValueCell!17811 0))(
  ( (ValueCellFull!17811 (v!21432 V!54995)) (EmptyCell!17811) )
))
(declare-datatypes ((array!91680 0))(
  ( (array!91681 (arr!44296 (Array (_ BitVec 32) ValueCell!17811)) (size!44846 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91680)

(declare-fun mapDefault!57835 () ValueCell!17811)

(assert (=> b!1345625 (= condMapEmpty!57835 (= (arr!44296 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17811)) mapDefault!57835)))))

(declare-fun mapIsEmpty!57835 () Bool)

(assert (=> mapIsEmpty!57835 mapRes!57835))

(declare-fun b!1345627 () Bool)

(declare-fun res!892884 () Bool)

(assert (=> b!1345627 (=> (not res!892884) (not e!765680))))

(declare-datatypes ((List!31370 0))(
  ( (Nil!31367) (Cons!31366 (h!32575 (_ BitVec 64)) (t!45946 List!31370)) )
))
(declare-fun arrayNoDuplicates!0 (array!91678 (_ BitVec 32) List!31370) Bool)

(assert (=> b!1345627 (= res!892884 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31367))))

(declare-fun b!1345628 () Bool)

(declare-fun res!892877 () Bool)

(assert (=> b!1345628 (=> (not res!892877) (not e!765680))))

(assert (=> b!1345628 (= res!892877 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44845 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345629 () Bool)

(declare-fun res!892883 () Bool)

(assert (=> b!1345629 (=> (not res!892883) (not e!765680))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1345629 (= res!892883 (and (= (size!44846 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44845 _keys!1571) (size!44846 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345630 () Bool)

(declare-fun res!892878 () Bool)

(assert (=> b!1345630 (=> (not res!892878) (not e!765680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345630 (= res!892878 (validKeyInArray!0 (select (arr!44295 _keys!1571) from!1960)))))

(declare-fun b!1345631 () Bool)

(declare-fun res!892882 () Bool)

(assert (=> b!1345631 (=> (not res!892882) (not e!765680))))

(declare-fun minValue!1245 () V!54995)

(declare-fun zeroValue!1245 () V!54995)

(declare-fun defaultEntry!1306 () Int)

(declare-fun getCurrentListMap!5904 (array!91678 array!91680 (_ BitVec 32) (_ BitVec 32) V!54995 V!54995 (_ BitVec 32) Int) ListLongMap!21871)

(assert (=> b!1345631 (= res!892882 (contains!9127 (getCurrentListMap!5904 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345632 () Bool)

(declare-fun res!892881 () Bool)

(assert (=> b!1345632 (=> (not res!892881) (not e!765681))))

(assert (=> b!1345632 (= res!892881 (not (= k0!1142 (select (arr!44295 _keys!1571) from!1960))))))

(declare-fun b!1345626 () Bool)

(declare-fun tp_is_empty!37419 () Bool)

(assert (=> b!1345626 (= e!765679 tp_is_empty!37419)))

(declare-fun res!892875 () Bool)

(assert (=> start!113368 (=> (not res!892875) (not e!765680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113368 (= res!892875 (validMask!0 mask!1977))))

(assert (=> start!113368 e!765680))

(assert (=> start!113368 tp_is_empty!37419))

(assert (=> start!113368 true))

(declare-fun array_inv!33377 (array!91678) Bool)

(assert (=> start!113368 (array_inv!33377 _keys!1571)))

(declare-fun array_inv!33378 (array!91680) Bool)

(assert (=> start!113368 (and (array_inv!33378 _values!1303) e!765678)))

(assert (=> start!113368 tp!110062))

(declare-fun b!1345633 () Bool)

(declare-fun e!765682 () Bool)

(assert (=> b!1345633 (= e!765682 tp_is_empty!37419)))

(declare-fun mapNonEmpty!57835 () Bool)

(declare-fun tp!110061 () Bool)

(assert (=> mapNonEmpty!57835 (= mapRes!57835 (and tp!110061 e!765682))))

(declare-fun mapRest!57835 () (Array (_ BitVec 32) ValueCell!17811))

(declare-fun mapKey!57835 () (_ BitVec 32))

(declare-fun mapValue!57835 () ValueCell!17811)

(assert (=> mapNonEmpty!57835 (= (arr!44296 _values!1303) (store mapRest!57835 mapKey!57835 mapValue!57835))))

(declare-fun b!1345634 () Bool)

(declare-fun res!892879 () Bool)

(assert (=> b!1345634 (=> (not res!892879) (not e!765680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91678 (_ BitVec 32)) Bool)

(assert (=> b!1345634 (= res!892879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345635 () Bool)

(assert (=> b!1345635 (= e!765680 e!765681)))

(declare-fun res!892880 () Bool)

(assert (=> b!1345635 (=> (not res!892880) (not e!765681))))

(declare-fun +!4832 (ListLongMap!21871 tuple2!24214) ListLongMap!21871)

(assert (=> b!1345635 (= res!892880 (contains!9127 (+!4832 lt!595388 (tuple2!24215 (select (arr!44295 _keys!1571) from!1960) lt!595389)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6474 (array!91678 array!91680 (_ BitVec 32) (_ BitVec 32) V!54995 V!54995 (_ BitVec 32) Int) ListLongMap!21871)

(assert (=> b!1345635 (= lt!595388 (getCurrentListMapNoExtraKeys!6474 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22377 (ValueCell!17811 V!54995) V!54995)

(declare-fun dynLambda!3771 (Int (_ BitVec 64)) V!54995)

(assert (=> b!1345635 (= lt!595389 (get!22377 (select (arr!44296 _values!1303) from!1960) (dynLambda!3771 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113368 res!892875) b!1345629))

(assert (= (and b!1345629 res!892883) b!1345634))

(assert (= (and b!1345634 res!892879) b!1345627))

(assert (= (and b!1345627 res!892884) b!1345628))

(assert (= (and b!1345628 res!892877) b!1345631))

(assert (= (and b!1345631 res!892882) b!1345622))

(assert (= (and b!1345622 res!892874) b!1345630))

(assert (= (and b!1345630 res!892878) b!1345624))

(assert (= (and b!1345624 res!892876) b!1345635))

(assert (= (and b!1345635 res!892880) b!1345632))

(assert (= (and b!1345632 res!892881) b!1345623))

(assert (= (and b!1345625 condMapEmpty!57835) mapIsEmpty!57835))

(assert (= (and b!1345625 (not condMapEmpty!57835)) mapNonEmpty!57835))

(get-info :version)

(assert (= (and mapNonEmpty!57835 ((_ is ValueCellFull!17811) mapValue!57835)) b!1345633))

(assert (= (and b!1345625 ((_ is ValueCellFull!17811) mapDefault!57835)) b!1345626))

(assert (= start!113368 b!1345625))

(declare-fun b_lambda!24541 () Bool)

(assert (=> (not b_lambda!24541) (not b!1345635)))

(declare-fun t!45944 () Bool)

(declare-fun tb!12379 () Bool)

(assert (=> (and start!113368 (= defaultEntry!1306 defaultEntry!1306) t!45944) tb!12379))

(declare-fun result!25849 () Bool)

(assert (=> tb!12379 (= result!25849 tp_is_empty!37419)))

(assert (=> b!1345635 t!45944))

(declare-fun b_and!50693 () Bool)

(assert (= b_and!50691 (and (=> t!45944 result!25849) b_and!50693)))

(declare-fun m!1232983 () Bool)

(assert (=> b!1345632 m!1232983))

(declare-fun m!1232985 () Bool)

(assert (=> mapNonEmpty!57835 m!1232985))

(declare-fun m!1232987 () Bool)

(assert (=> b!1345635 m!1232987))

(declare-fun m!1232989 () Bool)

(assert (=> b!1345635 m!1232989))

(declare-fun m!1232991 () Bool)

(assert (=> b!1345635 m!1232991))

(declare-fun m!1232993 () Bool)

(assert (=> b!1345635 m!1232993))

(assert (=> b!1345635 m!1232989))

(assert (=> b!1345635 m!1232991))

(declare-fun m!1232995 () Bool)

(assert (=> b!1345635 m!1232995))

(assert (=> b!1345635 m!1232983))

(assert (=> b!1345635 m!1232995))

(declare-fun m!1232997 () Bool)

(assert (=> b!1345635 m!1232997))

(assert (=> b!1345622 m!1232983))

(assert (=> b!1345630 m!1232983))

(assert (=> b!1345630 m!1232983))

(declare-fun m!1232999 () Bool)

(assert (=> b!1345630 m!1232999))

(declare-fun m!1233001 () Bool)

(assert (=> b!1345627 m!1233001))

(declare-fun m!1233003 () Bool)

(assert (=> b!1345631 m!1233003))

(assert (=> b!1345631 m!1233003))

(declare-fun m!1233005 () Bool)

(assert (=> b!1345631 m!1233005))

(declare-fun m!1233007 () Bool)

(assert (=> b!1345623 m!1233007))

(assert (=> b!1345623 m!1232983))

(assert (=> b!1345623 m!1232983))

(declare-fun m!1233009 () Bool)

(assert (=> b!1345623 m!1233009))

(declare-fun m!1233011 () Bool)

(assert (=> start!113368 m!1233011))

(declare-fun m!1233013 () Bool)

(assert (=> start!113368 m!1233013))

(declare-fun m!1233015 () Bool)

(assert (=> start!113368 m!1233015))

(declare-fun m!1233017 () Bool)

(assert (=> b!1345634 m!1233017))

(check-sat (not b!1345630) (not b!1345623) (not b!1345631) (not b!1345627) (not b!1345635) tp_is_empty!37419 b_and!50693 (not mapNonEmpty!57835) (not start!113368) (not b!1345634) (not b_lambda!24541) (not b_next!31419))
(check-sat b_and!50693 (not b_next!31419))
