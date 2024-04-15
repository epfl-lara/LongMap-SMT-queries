; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113252 () Bool)

(assert start!113252)

(declare-fun b_free!31303 () Bool)

(declare-fun b_next!31303 () Bool)

(assert (=> start!113252 (= b_free!31303 (not b_next!31303))))

(declare-fun tp!109714 () Bool)

(declare-fun b_and!50495 () Bool)

(assert (=> start!113252 (= tp!109714 b_and!50495)))

(declare-fun b!1343581 () Bool)

(declare-fun res!891459 () Bool)

(declare-fun e!764717 () Bool)

(assert (=> b!1343581 (=> (not res!891459) (not e!764717))))

(declare-datatypes ((array!91393 0))(
  ( (array!91394 (arr!44153 (Array (_ BitVec 32) (_ BitVec 64))) (size!44705 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91393)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91393 (_ BitVec 32)) Bool)

(assert (=> b!1343581 (= res!891459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343582 () Bool)

(declare-fun e!764719 () Bool)

(declare-fun tp_is_empty!37303 () Bool)

(assert (=> b!1343582 (= e!764719 tp_is_empty!37303)))

(declare-fun b!1343583 () Bool)

(declare-fun e!764718 () Bool)

(declare-fun mapRes!57661 () Bool)

(assert (=> b!1343583 (= e!764718 (and e!764719 mapRes!57661))))

(declare-fun condMapEmpty!57661 () Bool)

(declare-datatypes ((V!54841 0))(
  ( (V!54842 (val!18726 Int)) )
))
(declare-datatypes ((ValueCell!17753 0))(
  ( (ValueCellFull!17753 (v!21373 V!54841)) (EmptyCell!17753) )
))
(declare-datatypes ((array!91395 0))(
  ( (array!91396 (arr!44154 (Array (_ BitVec 32) ValueCell!17753)) (size!44706 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91395)

(declare-fun mapDefault!57661 () ValueCell!17753)

(assert (=> b!1343583 (= condMapEmpty!57661 (= (arr!44154 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17753)) mapDefault!57661)))))

(declare-fun b!1343584 () Bool)

(declare-fun res!891460 () Bool)

(assert (=> b!1343584 (=> (not res!891460) (not e!764717))))

(declare-fun minValue!1245 () V!54841)

(declare-fun zeroValue!1245 () V!54841)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24188 0))(
  ( (tuple2!24189 (_1!12105 (_ BitVec 64)) (_2!12105 V!54841)) )
))
(declare-datatypes ((List!31329 0))(
  ( (Nil!31326) (Cons!31325 (h!32534 tuple2!24188) (t!45835 List!31329)) )
))
(declare-datatypes ((ListLongMap!21845 0))(
  ( (ListLongMap!21846 (toList!10938 List!31329)) )
))
(declare-fun contains!9043 (ListLongMap!21845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5785 (array!91393 array!91395 (_ BitVec 32) (_ BitVec 32) V!54841 V!54841 (_ BitVec 32) Int) ListLongMap!21845)

(assert (=> b!1343584 (= res!891460 (contains!9043 (getCurrentListMap!5785 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343585 () Bool)

(declare-fun res!891463 () Bool)

(assert (=> b!1343585 (=> (not res!891463) (not e!764717))))

(assert (=> b!1343585 (= res!891463 (and (= (size!44706 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44705 _keys!1571) (size!44706 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!891465 () Bool)

(assert (=> start!113252 (=> (not res!891465) (not e!764717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113252 (= res!891465 (validMask!0 mask!1977))))

(assert (=> start!113252 e!764717))

(assert (=> start!113252 tp_is_empty!37303))

(assert (=> start!113252 true))

(declare-fun array_inv!33469 (array!91393) Bool)

(assert (=> start!113252 (array_inv!33469 _keys!1571)))

(declare-fun array_inv!33470 (array!91395) Bool)

(assert (=> start!113252 (and (array_inv!33470 _values!1303) e!764718)))

(assert (=> start!113252 tp!109714))

(declare-fun b!1343586 () Bool)

(declare-fun res!891466 () Bool)

(assert (=> b!1343586 (=> (not res!891466) (not e!764717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343586 (= res!891466 (validKeyInArray!0 (select (arr!44153 _keys!1571) from!1960)))))

(declare-fun b!1343587 () Bool)

(declare-fun res!891464 () Bool)

(assert (=> b!1343587 (=> (not res!891464) (not e!764717))))

(declare-datatypes ((List!31330 0))(
  ( (Nil!31327) (Cons!31326 (h!32535 (_ BitVec 64)) (t!45836 List!31330)) )
))
(declare-fun arrayNoDuplicates!0 (array!91393 (_ BitVec 32) List!31330) Bool)

(assert (=> b!1343587 (= res!891464 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31327))))

(declare-fun mapIsEmpty!57661 () Bool)

(assert (=> mapIsEmpty!57661 mapRes!57661))

(declare-fun b!1343588 () Bool)

(declare-fun e!764720 () Bool)

(assert (=> b!1343588 (= e!764720 tp_is_empty!37303)))

(declare-fun b!1343589 () Bool)

(declare-fun res!891458 () Bool)

(assert (=> b!1343589 (=> (not res!891458) (not e!764717))))

(assert (=> b!1343589 (= res!891458 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57661 () Bool)

(declare-fun tp!109715 () Bool)

(assert (=> mapNonEmpty!57661 (= mapRes!57661 (and tp!109715 e!764720))))

(declare-fun mapKey!57661 () (_ BitVec 32))

(declare-fun mapValue!57661 () ValueCell!17753)

(declare-fun mapRest!57661 () (Array (_ BitVec 32) ValueCell!17753))

(assert (=> mapNonEmpty!57661 (= (arr!44154 _values!1303) (store mapRest!57661 mapKey!57661 mapValue!57661))))

(declare-fun b!1343590 () Bool)

(assert (=> b!1343590 (= e!764717 (not true))))

(declare-fun lt!594843 () ListLongMap!21845)

(declare-fun +!4838 (ListLongMap!21845 tuple2!24188) ListLongMap!21845)

(assert (=> b!1343590 (contains!9043 (+!4838 lt!594843 (tuple2!24189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43918 0))(
  ( (Unit!43919) )
))
(declare-fun lt!594840 () Unit!43918)

(declare-fun addStillContains!1202 (ListLongMap!21845 (_ BitVec 64) V!54841 (_ BitVec 64)) Unit!43918)

(assert (=> b!1343590 (= lt!594840 (addStillContains!1202 lt!594843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343590 (contains!9043 lt!594843 k0!1142)))

(declare-fun lt!594841 () V!54841)

(declare-fun lt!594842 () Unit!43918)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!377 ((_ BitVec 64) (_ BitVec 64) V!54841 ListLongMap!21845) Unit!43918)

(assert (=> b!1343590 (= lt!594842 (lemmaInListMapAfterAddingDiffThenInBefore!377 k0!1142 (select (arr!44153 _keys!1571) from!1960) lt!594841 lt!594843))))

(declare-fun lt!594838 () ListLongMap!21845)

(assert (=> b!1343590 (contains!9043 lt!594838 k0!1142)))

(declare-fun lt!594839 () Unit!43918)

(assert (=> b!1343590 (= lt!594839 (lemmaInListMapAfterAddingDiffThenInBefore!377 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594838))))

(assert (=> b!1343590 (= lt!594838 (+!4838 lt!594843 (tuple2!24189 (select (arr!44153 _keys!1571) from!1960) lt!594841)))))

(declare-fun get!22312 (ValueCell!17753 V!54841) V!54841)

(declare-fun dynLambda!3768 (Int (_ BitVec 64)) V!54841)

(assert (=> b!1343590 (= lt!594841 (get!22312 (select (arr!44154 _values!1303) from!1960) (dynLambda!3768 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6481 (array!91393 array!91395 (_ BitVec 32) (_ BitVec 32) V!54841 V!54841 (_ BitVec 32) Int) ListLongMap!21845)

(assert (=> b!1343590 (= lt!594843 (getCurrentListMapNoExtraKeys!6481 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343591 () Bool)

(declare-fun res!891462 () Bool)

(assert (=> b!1343591 (=> (not res!891462) (not e!764717))))

(assert (=> b!1343591 (= res!891462 (not (= (select (arr!44153 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343592 () Bool)

(declare-fun res!891461 () Bool)

(assert (=> b!1343592 (=> (not res!891461) (not e!764717))))

(assert (=> b!1343592 (= res!891461 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44705 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113252 res!891465) b!1343585))

(assert (= (and b!1343585 res!891463) b!1343581))

(assert (= (and b!1343581 res!891459) b!1343587))

(assert (= (and b!1343587 res!891464) b!1343592))

(assert (= (and b!1343592 res!891461) b!1343584))

(assert (= (and b!1343584 res!891460) b!1343591))

(assert (= (and b!1343591 res!891462) b!1343586))

(assert (= (and b!1343586 res!891466) b!1343589))

(assert (= (and b!1343589 res!891458) b!1343590))

(assert (= (and b!1343583 condMapEmpty!57661) mapIsEmpty!57661))

(assert (= (and b!1343583 (not condMapEmpty!57661)) mapNonEmpty!57661))

(get-info :version)

(assert (= (and mapNonEmpty!57661 ((_ is ValueCellFull!17753) mapValue!57661)) b!1343588))

(assert (= (and b!1343583 ((_ is ValueCellFull!17753) mapDefault!57661)) b!1343582))

(assert (= start!113252 b!1343583))

(declare-fun b_lambda!24469 () Bool)

(assert (=> (not b_lambda!24469) (not b!1343590)))

(declare-fun t!45834 () Bool)

(declare-fun tb!12309 () Bool)

(assert (=> (and start!113252 (= defaultEntry!1306 defaultEntry!1306) t!45834) tb!12309))

(declare-fun result!25717 () Bool)

(assert (=> tb!12309 (= result!25717 tp_is_empty!37303)))

(assert (=> b!1343590 t!45834))

(declare-fun b_and!50497 () Bool)

(assert (= b_and!50495 (and (=> t!45834 result!25717) b_and!50497)))

(declare-fun m!1230883 () Bool)

(assert (=> b!1343586 m!1230883))

(assert (=> b!1343586 m!1230883))

(declare-fun m!1230885 () Bool)

(assert (=> b!1343586 m!1230885))

(declare-fun m!1230887 () Bool)

(assert (=> start!113252 m!1230887))

(declare-fun m!1230889 () Bool)

(assert (=> start!113252 m!1230889))

(declare-fun m!1230891 () Bool)

(assert (=> start!113252 m!1230891))

(declare-fun m!1230893 () Bool)

(assert (=> b!1343584 m!1230893))

(assert (=> b!1343584 m!1230893))

(declare-fun m!1230895 () Bool)

(assert (=> b!1343584 m!1230895))

(declare-fun m!1230897 () Bool)

(assert (=> b!1343587 m!1230897))

(declare-fun m!1230899 () Bool)

(assert (=> b!1343581 m!1230899))

(declare-fun m!1230901 () Bool)

(assert (=> mapNonEmpty!57661 m!1230901))

(assert (=> b!1343590 m!1230883))

(declare-fun m!1230903 () Bool)

(assert (=> b!1343590 m!1230903))

(declare-fun m!1230905 () Bool)

(assert (=> b!1343590 m!1230905))

(declare-fun m!1230907 () Bool)

(assert (=> b!1343590 m!1230907))

(declare-fun m!1230909 () Bool)

(assert (=> b!1343590 m!1230909))

(declare-fun m!1230911 () Bool)

(assert (=> b!1343590 m!1230911))

(declare-fun m!1230913 () Bool)

(assert (=> b!1343590 m!1230913))

(declare-fun m!1230915 () Bool)

(assert (=> b!1343590 m!1230915))

(assert (=> b!1343590 m!1230907))

(assert (=> b!1343590 m!1230913))

(declare-fun m!1230917 () Bool)

(assert (=> b!1343590 m!1230917))

(assert (=> b!1343590 m!1230909))

(declare-fun m!1230919 () Bool)

(assert (=> b!1343590 m!1230919))

(declare-fun m!1230921 () Bool)

(assert (=> b!1343590 m!1230921))

(declare-fun m!1230923 () Bool)

(assert (=> b!1343590 m!1230923))

(declare-fun m!1230925 () Bool)

(assert (=> b!1343590 m!1230925))

(assert (=> b!1343590 m!1230883))

(assert (=> b!1343591 m!1230883))

(check-sat (not b!1343586) (not b_lambda!24469) (not b!1343590) (not b!1343584) (not start!113252) tp_is_empty!37303 (not b!1343581) (not b!1343587) b_and!50497 (not mapNonEmpty!57661) (not b_next!31303))
(check-sat b_and!50497 (not b_next!31303))
