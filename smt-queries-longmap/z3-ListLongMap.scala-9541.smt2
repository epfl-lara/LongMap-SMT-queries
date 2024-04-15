; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113108 () Bool)

(assert start!113108)

(declare-fun b_free!31159 () Bool)

(declare-fun b_next!31159 () Bool)

(assert (=> start!113108 (= b_free!31159 (not b_next!31159))))

(declare-fun tp!109282 () Bool)

(declare-fun b_and!50207 () Bool)

(assert (=> start!113108 (= tp!109282 b_and!50207)))

(declare-fun b!1340845 () Bool)

(declare-fun e!763640 () Bool)

(declare-fun e!763639 () Bool)

(declare-fun mapRes!57445 () Bool)

(assert (=> b!1340845 (= e!763640 (and e!763639 mapRes!57445))))

(declare-fun condMapEmpty!57445 () Bool)

(declare-datatypes ((V!54649 0))(
  ( (V!54650 (val!18654 Int)) )
))
(declare-datatypes ((ValueCell!17681 0))(
  ( (ValueCellFull!17681 (v!21301 V!54649)) (EmptyCell!17681) )
))
(declare-datatypes ((array!91111 0))(
  ( (array!91112 (arr!44012 (Array (_ BitVec 32) ValueCell!17681)) (size!44564 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91111)

(declare-fun mapDefault!57445 () ValueCell!17681)

(assert (=> b!1340845 (= condMapEmpty!57445 (= (arr!44012 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17681)) mapDefault!57445)))))

(declare-fun b!1340846 () Bool)

(declare-fun res!889515 () Bool)

(declare-fun e!763638 () Bool)

(assert (=> b!1340846 (=> (not res!889515) (not e!763638))))

(declare-datatypes ((array!91113 0))(
  ( (array!91114 (arr!44013 (Array (_ BitVec 32) (_ BitVec 64))) (size!44565 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91113)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340846 (= res!889515 (validKeyInArray!0 (select (arr!44013 _keys!1571) from!1960)))))

(declare-fun b!1340847 () Bool)

(declare-fun res!889519 () Bool)

(assert (=> b!1340847 (=> (not res!889519) (not e!763638))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340847 (= res!889519 (and (= (size!44564 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44565 _keys!1571) (size!44564 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889517 () Bool)

(assert (=> start!113108 (=> (not res!889517) (not e!763638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113108 (= res!889517 (validMask!0 mask!1977))))

(assert (=> start!113108 e!763638))

(declare-fun tp_is_empty!37159 () Bool)

(assert (=> start!113108 tp_is_empty!37159))

(assert (=> start!113108 true))

(declare-fun array_inv!33373 (array!91113) Bool)

(assert (=> start!113108 (array_inv!33373 _keys!1571)))

(declare-fun array_inv!33374 (array!91111) Bool)

(assert (=> start!113108 (and (array_inv!33374 _values!1303) e!763640)))

(assert (=> start!113108 tp!109282))

(declare-fun b!1340848 () Bool)

(declare-fun res!889514 () Bool)

(assert (=> b!1340848 (=> (not res!889514) (not e!763638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91113 (_ BitVec 32)) Bool)

(assert (=> b!1340848 (= res!889514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57445 () Bool)

(assert (=> mapIsEmpty!57445 mapRes!57445))

(declare-fun b!1340849 () Bool)

(assert (=> b!1340849 (= e!763638 (not true))))

(declare-datatypes ((tuple2!24070 0))(
  ( (tuple2!24071 (_1!12046 (_ BitVec 64)) (_2!12046 V!54649)) )
))
(declare-datatypes ((List!31221 0))(
  ( (Nil!31218) (Cons!31217 (h!32426 tuple2!24070) (t!45583 List!31221)) )
))
(declare-datatypes ((ListLongMap!21727 0))(
  ( (ListLongMap!21728 (toList!10879 List!31221)) )
))
(declare-fun lt!593877 () ListLongMap!21727)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!8984 (ListLongMap!21727 (_ BitVec 64)) Bool)

(assert (=> b!1340849 (contains!8984 lt!593877 k0!1142)))

(declare-datatypes ((Unit!43816 0))(
  ( (Unit!43817) )
))
(declare-fun lt!593876 () Unit!43816)

(declare-fun zeroValue!1245 () V!54649)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!326 ((_ BitVec 64) (_ BitVec 64) V!54649 ListLongMap!21727) Unit!43816)

(assert (=> b!1340849 (= lt!593876 (lemmaInListMapAfterAddingDiffThenInBefore!326 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593877))))

(declare-fun minValue!1245 () V!54649)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4787 (ListLongMap!21727 tuple2!24070) ListLongMap!21727)

(declare-fun getCurrentListMapNoExtraKeys!6430 (array!91113 array!91111 (_ BitVec 32) (_ BitVec 32) V!54649 V!54649 (_ BitVec 32) Int) ListLongMap!21727)

(declare-fun get!22213 (ValueCell!17681 V!54649) V!54649)

(declare-fun dynLambda!3717 (Int (_ BitVec 64)) V!54649)

(assert (=> b!1340849 (= lt!593877 (+!4787 (getCurrentListMapNoExtraKeys!6430 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24071 (select (arr!44013 _keys!1571) from!1960) (get!22213 (select (arr!44012 _values!1303) from!1960) (dynLambda!3717 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340850 () Bool)

(assert (=> b!1340850 (= e!763639 tp_is_empty!37159)))

(declare-fun b!1340851 () Bool)

(declare-fun res!889520 () Bool)

(assert (=> b!1340851 (=> (not res!889520) (not e!763638))))

(assert (=> b!1340851 (= res!889520 (not (= (select (arr!44013 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340852 () Bool)

(declare-fun res!889516 () Bool)

(assert (=> b!1340852 (=> (not res!889516) (not e!763638))))

(declare-datatypes ((List!31222 0))(
  ( (Nil!31219) (Cons!31218 (h!32427 (_ BitVec 64)) (t!45584 List!31222)) )
))
(declare-fun arrayNoDuplicates!0 (array!91113 (_ BitVec 32) List!31222) Bool)

(assert (=> b!1340852 (= res!889516 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31219))))

(declare-fun b!1340853 () Bool)

(declare-fun e!763637 () Bool)

(assert (=> b!1340853 (= e!763637 tp_is_empty!37159)))

(declare-fun b!1340854 () Bool)

(declare-fun res!889521 () Bool)

(assert (=> b!1340854 (=> (not res!889521) (not e!763638))))

(assert (=> b!1340854 (= res!889521 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44565 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57445 () Bool)

(declare-fun tp!109283 () Bool)

(assert (=> mapNonEmpty!57445 (= mapRes!57445 (and tp!109283 e!763637))))

(declare-fun mapValue!57445 () ValueCell!17681)

(declare-fun mapKey!57445 () (_ BitVec 32))

(declare-fun mapRest!57445 () (Array (_ BitVec 32) ValueCell!17681))

(assert (=> mapNonEmpty!57445 (= (arr!44012 _values!1303) (store mapRest!57445 mapKey!57445 mapValue!57445))))

(declare-fun b!1340855 () Bool)

(declare-fun res!889518 () Bool)

(assert (=> b!1340855 (=> (not res!889518) (not e!763638))))

(assert (=> b!1340855 (= res!889518 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340856 () Bool)

(declare-fun res!889522 () Bool)

(assert (=> b!1340856 (=> (not res!889522) (not e!763638))))

(declare-fun getCurrentListMap!5732 (array!91113 array!91111 (_ BitVec 32) (_ BitVec 32) V!54649 V!54649 (_ BitVec 32) Int) ListLongMap!21727)

(assert (=> b!1340856 (= res!889522 (contains!8984 (getCurrentListMap!5732 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113108 res!889517) b!1340847))

(assert (= (and b!1340847 res!889519) b!1340848))

(assert (= (and b!1340848 res!889514) b!1340852))

(assert (= (and b!1340852 res!889516) b!1340854))

(assert (= (and b!1340854 res!889521) b!1340856))

(assert (= (and b!1340856 res!889522) b!1340851))

(assert (= (and b!1340851 res!889520) b!1340846))

(assert (= (and b!1340846 res!889515) b!1340855))

(assert (= (and b!1340855 res!889518) b!1340849))

(assert (= (and b!1340845 condMapEmpty!57445) mapIsEmpty!57445))

(assert (= (and b!1340845 (not condMapEmpty!57445)) mapNonEmpty!57445))

(get-info :version)

(assert (= (and mapNonEmpty!57445 ((_ is ValueCellFull!17681) mapValue!57445)) b!1340853))

(assert (= (and b!1340845 ((_ is ValueCellFull!17681) mapDefault!57445)) b!1340850))

(assert (= start!113108 b!1340845))

(declare-fun b_lambda!24325 () Bool)

(assert (=> (not b_lambda!24325) (not b!1340849)))

(declare-fun t!45582 () Bool)

(declare-fun tb!12165 () Bool)

(assert (=> (and start!113108 (= defaultEntry!1306 defaultEntry!1306) t!45582) tb!12165))

(declare-fun result!25429 () Bool)

(assert (=> tb!12165 (= result!25429 tp_is_empty!37159)))

(assert (=> b!1340849 t!45582))

(declare-fun b_and!50209 () Bool)

(assert (= b_and!50207 (and (=> t!45582 result!25429) b_and!50209)))

(declare-fun m!1228105 () Bool)

(assert (=> b!1340856 m!1228105))

(assert (=> b!1340856 m!1228105))

(declare-fun m!1228107 () Bool)

(assert (=> b!1340856 m!1228107))

(declare-fun m!1228109 () Bool)

(assert (=> mapNonEmpty!57445 m!1228109))

(declare-fun m!1228111 () Bool)

(assert (=> start!113108 m!1228111))

(declare-fun m!1228113 () Bool)

(assert (=> start!113108 m!1228113))

(declare-fun m!1228115 () Bool)

(assert (=> start!113108 m!1228115))

(declare-fun m!1228117 () Bool)

(assert (=> b!1340848 m!1228117))

(declare-fun m!1228119 () Bool)

(assert (=> b!1340849 m!1228119))

(declare-fun m!1228121 () Bool)

(assert (=> b!1340849 m!1228121))

(declare-fun m!1228123 () Bool)

(assert (=> b!1340849 m!1228123))

(declare-fun m!1228125 () Bool)

(assert (=> b!1340849 m!1228125))

(declare-fun m!1228127 () Bool)

(assert (=> b!1340849 m!1228127))

(assert (=> b!1340849 m!1228121))

(declare-fun m!1228129 () Bool)

(assert (=> b!1340849 m!1228129))

(assert (=> b!1340849 m!1228123))

(assert (=> b!1340849 m!1228125))

(declare-fun m!1228131 () Bool)

(assert (=> b!1340849 m!1228131))

(declare-fun m!1228133 () Bool)

(assert (=> b!1340849 m!1228133))

(assert (=> b!1340846 m!1228133))

(assert (=> b!1340846 m!1228133))

(declare-fun m!1228135 () Bool)

(assert (=> b!1340846 m!1228135))

(declare-fun m!1228137 () Bool)

(assert (=> b!1340852 m!1228137))

(assert (=> b!1340851 m!1228133))

(check-sat (not start!113108) (not b!1340852) (not mapNonEmpty!57445) b_and!50209 (not b!1340848) (not b!1340856) tp_is_empty!37159 (not b!1340846) (not b!1340849) (not b_next!31159) (not b_lambda!24325))
(check-sat b_and!50209 (not b_next!31159))
