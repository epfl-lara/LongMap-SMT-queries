; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78948 () Bool)

(assert start!78948)

(declare-fun b_free!17179 () Bool)

(declare-fun b_next!17179 () Bool)

(assert (=> start!78948 (= b_free!17179 (not b_next!17179))))

(declare-fun tp!59978 () Bool)

(declare-fun b_and!28069 () Bool)

(assert (=> start!78948 (= tp!59978 b_and!28069)))

(declare-fun b!923830 () Bool)

(declare-fun e!518388 () Bool)

(declare-fun tp_is_empty!19687 () Bool)

(assert (=> b!923830 (= e!518388 tp_is_empty!19687)))

(declare-fun b!923831 () Bool)

(declare-fun res!622840 () Bool)

(declare-fun e!518386 () Bool)

(assert (=> b!923831 (=> (not res!622840) (not e!518386))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55319 0))(
  ( (array!55320 (arr!26605 (Array (_ BitVec 32) (_ BitVec 64))) (size!27066 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55319)

(assert (=> b!923831 (= res!622840 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27066 _keys!1487))))))

(declare-fun b!923833 () Bool)

(declare-fun e!518378 () Bool)

(assert (=> b!923833 (= e!518378 false)))

(declare-datatypes ((V!31215 0))(
  ( (V!31216 (val!9894 Int)) )
))
(declare-fun lt!415145 () V!31215)

(declare-datatypes ((tuple2!12950 0))(
  ( (tuple2!12951 (_1!6486 (_ BitVec 64)) (_2!6486 V!31215)) )
))
(declare-datatypes ((List!18729 0))(
  ( (Nil!18726) (Cons!18725 (h!19871 tuple2!12950) (t!26629 List!18729)) )
))
(declare-datatypes ((ListLongMap!11637 0))(
  ( (ListLongMap!11638 (toList!5834 List!18729)) )
))
(declare-fun lt!415141 () ListLongMap!11637)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!645 (ListLongMap!11637 (_ BitVec 64)) V!31215)

(assert (=> b!923833 (= lt!415145 (apply!645 lt!415141 k0!1099))))

(declare-fun mapIsEmpty!31287 () Bool)

(declare-fun mapRes!31287 () Bool)

(assert (=> mapIsEmpty!31287 mapRes!31287))

(declare-fun b!923834 () Bool)

(declare-fun res!622837 () Bool)

(assert (=> b!923834 (=> (not res!622837) (not e!518386))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55319 (_ BitVec 32)) Bool)

(assert (=> b!923834 (= res!622837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923835 () Bool)

(declare-fun e!518377 () Bool)

(assert (=> b!923835 (= e!518386 e!518377)))

(declare-fun res!622836 () Bool)

(assert (=> b!923835 (=> (not res!622836) (not e!518377))))

(declare-fun lt!415144 () ListLongMap!11637)

(declare-fun contains!4847 (ListLongMap!11637 (_ BitVec 64)) Bool)

(assert (=> b!923835 (= res!622836 (contains!4847 lt!415144 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9362 0))(
  ( (ValueCellFull!9362 (v!12411 V!31215)) (EmptyCell!9362) )
))
(declare-datatypes ((array!55321 0))(
  ( (array!55322 (arr!26606 (Array (_ BitVec 32) ValueCell!9362)) (size!27067 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55321)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31215)

(declare-fun minValue!1173 () V!31215)

(declare-fun getCurrentListMap!3021 (array!55319 array!55321 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 32) Int) ListLongMap!11637)

(assert (=> b!923835 (= lt!415144 (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923836 () Bool)

(declare-fun lt!415138 () ListLongMap!11637)

(declare-fun lt!415151 () V!31215)

(assert (=> b!923836 (= (apply!645 lt!415138 k0!1099) lt!415151)))

(declare-fun lt!415143 () V!31215)

(declare-datatypes ((Unit!31104 0))(
  ( (Unit!31105) )
))
(declare-fun lt!415137 () Unit!31104)

(declare-fun lt!415146 () (_ BitVec 64))

(declare-fun addApplyDifferent!362 (ListLongMap!11637 (_ BitVec 64) V!31215 (_ BitVec 64)) Unit!31104)

(assert (=> b!923836 (= lt!415137 (addApplyDifferent!362 lt!415144 lt!415146 lt!415143 k0!1099))))

(assert (=> b!923836 (not (= lt!415146 k0!1099))))

(declare-fun lt!415139 () Unit!31104)

(declare-datatypes ((List!18730 0))(
  ( (Nil!18727) (Cons!18726 (h!19872 (_ BitVec 64)) (t!26630 List!18730)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55319 (_ BitVec 64) (_ BitVec 32) List!18730) Unit!31104)

(assert (=> b!923836 (= lt!415139 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18727))))

(declare-fun e!518379 () Bool)

(assert (=> b!923836 e!518379))

(declare-fun c!96300 () Bool)

(assert (=> b!923836 (= c!96300 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415148 () Unit!31104)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!222 (array!55319 array!55321 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 64) (_ BitVec 32) Int) Unit!31104)

(assert (=> b!923836 (= lt!415148 (lemmaListMapContainsThenArrayContainsFrom!222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55319 (_ BitVec 32) List!18730) Bool)

(assert (=> b!923836 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18727)))

(declare-fun lt!415150 () Unit!31104)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55319 (_ BitVec 32) (_ BitVec 32)) Unit!31104)

(assert (=> b!923836 (= lt!415150 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923836 (contains!4847 lt!415138 k0!1099)))

(declare-fun lt!415140 () tuple2!12950)

(declare-fun +!2734 (ListLongMap!11637 tuple2!12950) ListLongMap!11637)

(assert (=> b!923836 (= lt!415138 (+!2734 lt!415144 lt!415140))))

(declare-fun lt!415149 () Unit!31104)

(declare-fun addStillContains!431 (ListLongMap!11637 (_ BitVec 64) V!31215 (_ BitVec 64)) Unit!31104)

(assert (=> b!923836 (= lt!415149 (addStillContains!431 lt!415144 lt!415146 lt!415143 k0!1099))))

(assert (=> b!923836 (= (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2734 (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415140))))

(assert (=> b!923836 (= lt!415140 (tuple2!12951 lt!415146 lt!415143))))

(declare-fun get!13989 (ValueCell!9362 V!31215) V!31215)

(declare-fun dynLambda!1490 (Int (_ BitVec 64)) V!31215)

(assert (=> b!923836 (= lt!415143 (get!13989 (select (arr!26606 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1490 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415142 () Unit!31104)

(declare-fun lemmaListMapRecursiveValidKeyArray!98 (array!55319 array!55321 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 32) Int) Unit!31104)

(assert (=> b!923836 (= lt!415142 (lemmaListMapRecursiveValidKeyArray!98 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518387 () Unit!31104)

(assert (=> b!923836 (= e!518387 lt!415137)))

(declare-fun b!923837 () Bool)

(declare-fun e!518385 () Bool)

(assert (=> b!923837 (= e!518377 e!518385)))

(declare-fun res!622843 () Bool)

(assert (=> b!923837 (=> (not res!622843) (not e!518385))))

(declare-fun v!791 () V!31215)

(assert (=> b!923837 (= res!622843 (and (= lt!415151 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923837 (= lt!415151 (apply!645 lt!415144 k0!1099))))

(declare-fun b!923838 () Bool)

(declare-fun e!518381 () Bool)

(assert (=> b!923838 (= e!518381 tp_is_empty!19687)))

(declare-fun mapNonEmpty!31287 () Bool)

(declare-fun tp!59979 () Bool)

(assert (=> mapNonEmpty!31287 (= mapRes!31287 (and tp!59979 e!518388))))

(declare-fun mapRest!31287 () (Array (_ BitVec 32) ValueCell!9362))

(declare-fun mapValue!31287 () ValueCell!9362)

(declare-fun mapKey!31287 () (_ BitVec 32))

(assert (=> mapNonEmpty!31287 (= (arr!26606 _values!1231) (store mapRest!31287 mapKey!31287 mapValue!31287))))

(declare-fun b!923839 () Bool)

(declare-fun Unit!31106 () Unit!31104)

(assert (=> b!923839 (= e!518387 Unit!31106)))

(declare-fun b!923840 () Bool)

(declare-fun e!518380 () Unit!31104)

(assert (=> b!923840 (= e!518380 e!518387)))

(assert (=> b!923840 (= lt!415146 (select (arr!26605 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96299 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923840 (= c!96299 (validKeyInArray!0 lt!415146))))

(declare-fun b!923832 () Bool)

(declare-fun arrayContainsKey!0 (array!55319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923832 (= e!518379 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!622842 () Bool)

(assert (=> start!78948 (=> (not res!622842) (not e!518386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78948 (= res!622842 (validMask!0 mask!1881))))

(assert (=> start!78948 e!518386))

(assert (=> start!78948 true))

(assert (=> start!78948 tp_is_empty!19687))

(declare-fun e!518382 () Bool)

(declare-fun array_inv!20804 (array!55321) Bool)

(assert (=> start!78948 (and (array_inv!20804 _values!1231) e!518382)))

(assert (=> start!78948 tp!59978))

(declare-fun array_inv!20805 (array!55319) Bool)

(assert (=> start!78948 (array_inv!20805 _keys!1487)))

(declare-fun b!923841 () Bool)

(declare-fun res!622841 () Bool)

(assert (=> b!923841 (=> (not res!622841) (not e!518386))))

(assert (=> b!923841 (= res!622841 (and (= (size!27067 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27066 _keys!1487) (size!27067 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923842 () Bool)

(assert (=> b!923842 (= e!518382 (and e!518381 mapRes!31287))))

(declare-fun condMapEmpty!31287 () Bool)

(declare-fun mapDefault!31287 () ValueCell!9362)

(assert (=> b!923842 (= condMapEmpty!31287 (= (arr!26606 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9362)) mapDefault!31287)))))

(declare-fun b!923843 () Bool)

(declare-fun Unit!31107 () Unit!31104)

(assert (=> b!923843 (= e!518380 Unit!31107)))

(declare-fun b!923844 () Bool)

(declare-fun res!622839 () Bool)

(assert (=> b!923844 (=> (not res!622839) (not e!518386))))

(assert (=> b!923844 (= res!622839 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18727))))

(declare-fun b!923845 () Bool)

(declare-fun e!518384 () Bool)

(assert (=> b!923845 (= e!518384 e!518378)))

(declare-fun res!622844 () Bool)

(assert (=> b!923845 (=> (not res!622844) (not e!518378))))

(assert (=> b!923845 (= res!622844 (contains!4847 lt!415141 k0!1099))))

(assert (=> b!923845 (= lt!415141 (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923846 () Bool)

(assert (=> b!923846 (= e!518385 e!518384)))

(declare-fun res!622838 () Bool)

(assert (=> b!923846 (=> (not res!622838) (not e!518384))))

(assert (=> b!923846 (= res!622838 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27066 _keys!1487)))))

(declare-fun lt!415147 () Unit!31104)

(assert (=> b!923846 (= lt!415147 e!518380)))

(declare-fun c!96301 () Bool)

(assert (=> b!923846 (= c!96301 (validKeyInArray!0 k0!1099))))

(declare-fun b!923847 () Bool)

(assert (=> b!923847 (= e!518379 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78948 res!622842) b!923841))

(assert (= (and b!923841 res!622841) b!923834))

(assert (= (and b!923834 res!622837) b!923844))

(assert (= (and b!923844 res!622839) b!923831))

(assert (= (and b!923831 res!622840) b!923835))

(assert (= (and b!923835 res!622836) b!923837))

(assert (= (and b!923837 res!622843) b!923846))

(assert (= (and b!923846 c!96301) b!923840))

(assert (= (and b!923846 (not c!96301)) b!923843))

(assert (= (and b!923840 c!96299) b!923836))

(assert (= (and b!923840 (not c!96299)) b!923839))

(assert (= (and b!923836 c!96300) b!923832))

(assert (= (and b!923836 (not c!96300)) b!923847))

(assert (= (and b!923846 res!622838) b!923845))

(assert (= (and b!923845 res!622844) b!923833))

(assert (= (and b!923842 condMapEmpty!31287) mapIsEmpty!31287))

(assert (= (and b!923842 (not condMapEmpty!31287)) mapNonEmpty!31287))

(get-info :version)

(assert (= (and mapNonEmpty!31287 ((_ is ValueCellFull!9362) mapValue!31287)) b!923830))

(assert (= (and b!923842 ((_ is ValueCellFull!9362) mapDefault!31287)) b!923838))

(assert (= start!78948 b!923842))

(declare-fun b_lambda!13663 () Bool)

(assert (=> (not b_lambda!13663) (not b!923836)))

(declare-fun t!26628 () Bool)

(declare-fun tb!5751 () Bool)

(assert (=> (and start!78948 (= defaultEntry!1235 defaultEntry!1235) t!26628) tb!5751))

(declare-fun result!11333 () Bool)

(assert (=> tb!5751 (= result!11333 tp_is_empty!19687)))

(assert (=> b!923836 t!26628))

(declare-fun b_and!28071 () Bool)

(assert (= b_and!28069 (and (=> t!26628 result!11333) b_and!28071)))

(declare-fun m!857581 () Bool)

(assert (=> b!923835 m!857581))

(declare-fun m!857583 () Bool)

(assert (=> b!923835 m!857583))

(declare-fun m!857585 () Bool)

(assert (=> b!923846 m!857585))

(declare-fun m!857587 () Bool)

(assert (=> b!923840 m!857587))

(declare-fun m!857589 () Bool)

(assert (=> b!923840 m!857589))

(declare-fun m!857591 () Bool)

(assert (=> start!78948 m!857591))

(declare-fun m!857593 () Bool)

(assert (=> start!78948 m!857593))

(declare-fun m!857595 () Bool)

(assert (=> start!78948 m!857595))

(declare-fun m!857597 () Bool)

(assert (=> b!923836 m!857597))

(declare-fun m!857599 () Bool)

(assert (=> b!923836 m!857599))

(declare-fun m!857601 () Bool)

(assert (=> b!923836 m!857601))

(declare-fun m!857603 () Bool)

(assert (=> b!923836 m!857603))

(declare-fun m!857605 () Bool)

(assert (=> b!923836 m!857605))

(declare-fun m!857607 () Bool)

(assert (=> b!923836 m!857607))

(assert (=> b!923836 m!857605))

(declare-fun m!857609 () Bool)

(assert (=> b!923836 m!857609))

(declare-fun m!857611 () Bool)

(assert (=> b!923836 m!857611))

(declare-fun m!857613 () Bool)

(assert (=> b!923836 m!857613))

(declare-fun m!857615 () Bool)

(assert (=> b!923836 m!857615))

(declare-fun m!857617 () Bool)

(assert (=> b!923836 m!857617))

(declare-fun m!857619 () Bool)

(assert (=> b!923836 m!857619))

(declare-fun m!857621 () Bool)

(assert (=> b!923836 m!857621))

(declare-fun m!857623 () Bool)

(assert (=> b!923836 m!857623))

(assert (=> b!923836 m!857609))

(declare-fun m!857625 () Bool)

(assert (=> b!923836 m!857625))

(assert (=> b!923836 m!857617))

(declare-fun m!857627 () Bool)

(assert (=> b!923836 m!857627))

(declare-fun m!857629 () Bool)

(assert (=> b!923845 m!857629))

(assert (=> b!923845 m!857613))

(declare-fun m!857631 () Bool)

(assert (=> b!923837 m!857631))

(declare-fun m!857633 () Bool)

(assert (=> b!923844 m!857633))

(declare-fun m!857635 () Bool)

(assert (=> b!923832 m!857635))

(declare-fun m!857637 () Bool)

(assert (=> b!923833 m!857637))

(declare-fun m!857639 () Bool)

(assert (=> mapNonEmpty!31287 m!857639))

(declare-fun m!857641 () Bool)

(assert (=> b!923834 m!857641))

(check-sat (not start!78948) (not b!923840) (not b!923835) (not b!923834) (not b_lambda!13663) (not b_next!17179) (not mapNonEmpty!31287) (not b!923844) (not b!923845) tp_is_empty!19687 (not b!923846) (not b!923836) b_and!28071 (not b!923832) (not b!923833) (not b!923837))
(check-sat b_and!28071 (not b_next!17179))
