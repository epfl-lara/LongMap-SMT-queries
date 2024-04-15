; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78978 () Bool)

(assert start!78978)

(declare-fun b_free!17209 () Bool)

(declare-fun b_next!17209 () Bool)

(assert (=> start!78978 (= b_free!17209 (not b_next!17209))))

(declare-fun tp!60069 () Bool)

(declare-fun b_and!28129 () Bool)

(assert (=> start!78978 (= tp!60069 b_and!28129)))

(declare-fun b!924670 () Bool)

(declare-fun res!623245 () Bool)

(declare-fun e!518926 () Bool)

(assert (=> b!924670 (=> (not res!623245) (not e!518926))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55379 0))(
  ( (array!55380 (arr!26635 (Array (_ BitVec 32) (_ BitVec 64))) (size!27096 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55379)

(assert (=> b!924670 (= res!623245 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27096 _keys!1487))))))

(declare-fun b!924671 () Bool)

(declare-datatypes ((Unit!31153 0))(
  ( (Unit!31154) )
))
(declare-fun e!518924 () Unit!31153)

(declare-fun Unit!31155 () Unit!31153)

(assert (=> b!924671 (= e!518924 Unit!31155)))

(declare-fun b!924672 () Bool)

(declare-fun e!518923 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!924672 (= e!518923 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924673 () Bool)

(declare-datatypes ((V!31255 0))(
  ( (V!31256 (val!9909 Int)) )
))
(declare-datatypes ((tuple2!12978 0))(
  ( (tuple2!12979 (_1!6500 (_ BitVec 64)) (_2!6500 V!31255)) )
))
(declare-datatypes ((List!18754 0))(
  ( (Nil!18751) (Cons!18750 (h!19896 tuple2!12978) (t!26684 List!18754)) )
))
(declare-datatypes ((ListLongMap!11665 0))(
  ( (ListLongMap!11666 (toList!5848 List!18754)) )
))
(declare-fun lt!415816 () ListLongMap!11665)

(declare-fun lt!415819 () V!31255)

(declare-fun apply!659 (ListLongMap!11665 (_ BitVec 64)) V!31255)

(assert (=> b!924673 (= (apply!659 lt!415816 k0!1099) lt!415819)))

(declare-fun lt!415815 () V!31255)

(declare-fun lt!415825 () ListLongMap!11665)

(declare-fun lt!415822 () Unit!31153)

(declare-fun lt!415814 () (_ BitVec 64))

(declare-fun addApplyDifferent!373 (ListLongMap!11665 (_ BitVec 64) V!31255 (_ BitVec 64)) Unit!31153)

(assert (=> b!924673 (= lt!415822 (addApplyDifferent!373 lt!415825 lt!415814 lt!415815 k0!1099))))

(assert (=> b!924673 (not (= lt!415814 k0!1099))))

(declare-fun lt!415812 () Unit!31153)

(declare-datatypes ((List!18755 0))(
  ( (Nil!18752) (Cons!18751 (h!19897 (_ BitVec 64)) (t!26685 List!18755)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55379 (_ BitVec 64) (_ BitVec 32) List!18755) Unit!31153)

(assert (=> b!924673 (= lt!415812 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18752))))

(assert (=> b!924673 e!518923))

(declare-fun c!96435 () Bool)

(assert (=> b!924673 (= c!96435 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9377 0))(
  ( (ValueCellFull!9377 (v!12426 V!31255)) (EmptyCell!9377) )
))
(declare-datatypes ((array!55381 0))(
  ( (array!55382 (arr!26636 (Array (_ BitVec 32) ValueCell!9377)) (size!27097 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55381)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!415818 () Unit!31153)

(declare-fun zeroValue!1173 () V!31255)

(declare-fun minValue!1173 () V!31255)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!233 (array!55379 array!55381 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 64) (_ BitVec 32) Int) Unit!31153)

(assert (=> b!924673 (= lt!415818 (lemmaListMapContainsThenArrayContainsFrom!233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55379 (_ BitVec 32) List!18755) Bool)

(assert (=> b!924673 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18752)))

(declare-fun lt!415824 () Unit!31153)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55379 (_ BitVec 32) (_ BitVec 32)) Unit!31153)

(assert (=> b!924673 (= lt!415824 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4860 (ListLongMap!11665 (_ BitVec 64)) Bool)

(assert (=> b!924673 (contains!4860 lt!415816 k0!1099)))

(declare-fun lt!415823 () tuple2!12978)

(declare-fun +!2745 (ListLongMap!11665 tuple2!12978) ListLongMap!11665)

(assert (=> b!924673 (= lt!415816 (+!2745 lt!415825 lt!415823))))

(declare-fun lt!415821 () Unit!31153)

(declare-fun addStillContains!442 (ListLongMap!11665 (_ BitVec 64) V!31255 (_ BitVec 64)) Unit!31153)

(assert (=> b!924673 (= lt!415821 (addStillContains!442 lt!415825 lt!415814 lt!415815 k0!1099))))

(declare-fun getCurrentListMap!3034 (array!55379 array!55381 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 32) Int) ListLongMap!11665)

(assert (=> b!924673 (= (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2745 (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415823))))

(assert (=> b!924673 (= lt!415823 (tuple2!12979 lt!415814 lt!415815))))

(declare-fun get!14010 (ValueCell!9377 V!31255) V!31255)

(declare-fun dynLambda!1501 (Int (_ BitVec 64)) V!31255)

(assert (=> b!924673 (= lt!415815 (get!14010 (select (arr!26636 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1501 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415820 () Unit!31153)

(declare-fun lemmaListMapRecursiveValidKeyArray!109 (array!55379 array!55381 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 32) Int) Unit!31153)

(assert (=> b!924673 (= lt!415820 (lemmaListMapRecursiveValidKeyArray!109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518920 () Unit!31153)

(assert (=> b!924673 (= e!518920 lt!415822)))

(declare-fun b!924674 () Bool)

(declare-fun e!518917 () Bool)

(assert (=> b!924674 (= e!518917 false)))

(declare-fun lt!415817 () V!31255)

(declare-fun lt!415813 () ListLongMap!11665)

(assert (=> b!924674 (= lt!415817 (apply!659 lt!415813 k0!1099))))

(declare-fun mapNonEmpty!31332 () Bool)

(declare-fun mapRes!31332 () Bool)

(declare-fun tp!60068 () Bool)

(declare-fun e!518928 () Bool)

(assert (=> mapNonEmpty!31332 (= mapRes!31332 (and tp!60068 e!518928))))

(declare-fun mapKey!31332 () (_ BitVec 32))

(declare-fun mapRest!31332 () (Array (_ BitVec 32) ValueCell!9377))

(declare-fun mapValue!31332 () ValueCell!9377)

(assert (=> mapNonEmpty!31332 (= (arr!26636 _values!1231) (store mapRest!31332 mapKey!31332 mapValue!31332))))

(declare-fun b!924675 () Bool)

(declare-fun e!518919 () Bool)

(assert (=> b!924675 (= e!518919 e!518917)))

(declare-fun res!623244 () Bool)

(assert (=> b!924675 (=> (not res!623244) (not e!518917))))

(assert (=> b!924675 (= res!623244 (contains!4860 lt!415813 k0!1099))))

(assert (=> b!924675 (= lt!415813 (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924676 () Bool)

(declare-fun e!518918 () Bool)

(declare-fun e!518922 () Bool)

(assert (=> b!924676 (= e!518918 (and e!518922 mapRes!31332))))

(declare-fun condMapEmpty!31332 () Bool)

(declare-fun mapDefault!31332 () ValueCell!9377)

(assert (=> b!924676 (= condMapEmpty!31332 (= (arr!26636 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9377)) mapDefault!31332)))))

(declare-fun res!623241 () Bool)

(assert (=> start!78978 (=> (not res!623241) (not e!518926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78978 (= res!623241 (validMask!0 mask!1881))))

(assert (=> start!78978 e!518926))

(assert (=> start!78978 true))

(declare-fun tp_is_empty!19717 () Bool)

(assert (=> start!78978 tp_is_empty!19717))

(declare-fun array_inv!20828 (array!55381) Bool)

(assert (=> start!78978 (and (array_inv!20828 _values!1231) e!518918)))

(assert (=> start!78978 tp!60069))

(declare-fun array_inv!20829 (array!55379) Bool)

(assert (=> start!78978 (array_inv!20829 _keys!1487)))

(declare-fun b!924677 () Bool)

(assert (=> b!924677 (= e!518922 tp_is_empty!19717)))

(declare-fun b!924678 () Bool)

(declare-fun e!518927 () Bool)

(assert (=> b!924678 (= e!518926 e!518927)))

(declare-fun res!623249 () Bool)

(assert (=> b!924678 (=> (not res!623249) (not e!518927))))

(assert (=> b!924678 (= res!623249 (contains!4860 lt!415825 k0!1099))))

(assert (=> b!924678 (= lt!415825 (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924679 () Bool)

(assert (=> b!924679 (= e!518928 tp_is_empty!19717)))

(declare-fun b!924680 () Bool)

(assert (=> b!924680 (= e!518924 e!518920)))

(assert (=> b!924680 (= lt!415814 (select (arr!26635 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96434 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924680 (= c!96434 (validKeyInArray!0 lt!415814))))

(declare-fun b!924681 () Bool)

(declare-fun res!623242 () Bool)

(assert (=> b!924681 (=> (not res!623242) (not e!518926))))

(assert (=> b!924681 (= res!623242 (and (= (size!27097 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27096 _keys!1487) (size!27097 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31332 () Bool)

(assert (=> mapIsEmpty!31332 mapRes!31332))

(declare-fun b!924682 () Bool)

(declare-fun e!518921 () Bool)

(assert (=> b!924682 (= e!518927 e!518921)))

(declare-fun res!623247 () Bool)

(assert (=> b!924682 (=> (not res!623247) (not e!518921))))

(declare-fun v!791 () V!31255)

(assert (=> b!924682 (= res!623247 (and (= lt!415819 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924682 (= lt!415819 (apply!659 lt!415825 k0!1099))))

(declare-fun b!924683 () Bool)

(declare-fun arrayContainsKey!0 (array!55379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924683 (= e!518923 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924684 () Bool)

(declare-fun res!623246 () Bool)

(assert (=> b!924684 (=> (not res!623246) (not e!518926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55379 (_ BitVec 32)) Bool)

(assert (=> b!924684 (= res!623246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924685 () Bool)

(assert (=> b!924685 (= e!518921 e!518919)))

(declare-fun res!623243 () Bool)

(assert (=> b!924685 (=> (not res!623243) (not e!518919))))

(assert (=> b!924685 (= res!623243 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27096 _keys!1487)))))

(declare-fun lt!415826 () Unit!31153)

(assert (=> b!924685 (= lt!415826 e!518924)))

(declare-fun c!96436 () Bool)

(assert (=> b!924685 (= c!96436 (validKeyInArray!0 k0!1099))))

(declare-fun b!924686 () Bool)

(declare-fun res!623248 () Bool)

(assert (=> b!924686 (=> (not res!623248) (not e!518926))))

(assert (=> b!924686 (= res!623248 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18752))))

(declare-fun b!924687 () Bool)

(declare-fun Unit!31156 () Unit!31153)

(assert (=> b!924687 (= e!518920 Unit!31156)))

(assert (= (and start!78978 res!623241) b!924681))

(assert (= (and b!924681 res!623242) b!924684))

(assert (= (and b!924684 res!623246) b!924686))

(assert (= (and b!924686 res!623248) b!924670))

(assert (= (and b!924670 res!623245) b!924678))

(assert (= (and b!924678 res!623249) b!924682))

(assert (= (and b!924682 res!623247) b!924685))

(assert (= (and b!924685 c!96436) b!924680))

(assert (= (and b!924685 (not c!96436)) b!924671))

(assert (= (and b!924680 c!96434) b!924673))

(assert (= (and b!924680 (not c!96434)) b!924687))

(assert (= (and b!924673 c!96435) b!924683))

(assert (= (and b!924673 (not c!96435)) b!924672))

(assert (= (and b!924685 res!623243) b!924675))

(assert (= (and b!924675 res!623244) b!924674))

(assert (= (and b!924676 condMapEmpty!31332) mapIsEmpty!31332))

(assert (= (and b!924676 (not condMapEmpty!31332)) mapNonEmpty!31332))

(get-info :version)

(assert (= (and mapNonEmpty!31332 ((_ is ValueCellFull!9377) mapValue!31332)) b!924679))

(assert (= (and b!924676 ((_ is ValueCellFull!9377) mapDefault!31332)) b!924677))

(assert (= start!78978 b!924676))

(declare-fun b_lambda!13693 () Bool)

(assert (=> (not b_lambda!13693) (not b!924673)))

(declare-fun t!26683 () Bool)

(declare-fun tb!5781 () Bool)

(assert (=> (and start!78978 (= defaultEntry!1235 defaultEntry!1235) t!26683) tb!5781))

(declare-fun result!11393 () Bool)

(assert (=> tb!5781 (= result!11393 tp_is_empty!19717)))

(assert (=> b!924673 t!26683))

(declare-fun b_and!28131 () Bool)

(assert (= b_and!28129 (and (=> t!26683 result!11393) b_and!28131)))

(declare-fun m!858511 () Bool)

(assert (=> b!924686 m!858511))

(declare-fun m!858513 () Bool)

(assert (=> b!924685 m!858513))

(declare-fun m!858515 () Bool)

(assert (=> b!924684 m!858515))

(declare-fun m!858517 () Bool)

(assert (=> b!924674 m!858517))

(declare-fun m!858519 () Bool)

(assert (=> b!924678 m!858519))

(declare-fun m!858521 () Bool)

(assert (=> b!924678 m!858521))

(declare-fun m!858523 () Bool)

(assert (=> b!924675 m!858523))

(declare-fun m!858525 () Bool)

(assert (=> b!924675 m!858525))

(declare-fun m!858527 () Bool)

(assert (=> start!78978 m!858527))

(declare-fun m!858529 () Bool)

(assert (=> start!78978 m!858529))

(declare-fun m!858531 () Bool)

(assert (=> start!78978 m!858531))

(declare-fun m!858533 () Bool)

(assert (=> b!924673 m!858533))

(declare-fun m!858535 () Bool)

(assert (=> b!924673 m!858535))

(declare-fun m!858537 () Bool)

(assert (=> b!924673 m!858537))

(declare-fun m!858539 () Bool)

(assert (=> b!924673 m!858539))

(declare-fun m!858541 () Bool)

(assert (=> b!924673 m!858541))

(declare-fun m!858543 () Bool)

(assert (=> b!924673 m!858543))

(assert (=> b!924673 m!858525))

(declare-fun m!858545 () Bool)

(assert (=> b!924673 m!858545))

(declare-fun m!858547 () Bool)

(assert (=> b!924673 m!858547))

(declare-fun m!858549 () Bool)

(assert (=> b!924673 m!858549))

(declare-fun m!858551 () Bool)

(assert (=> b!924673 m!858551))

(declare-fun m!858553 () Bool)

(assert (=> b!924673 m!858553))

(declare-fun m!858555 () Bool)

(assert (=> b!924673 m!858555))

(declare-fun m!858557 () Bool)

(assert (=> b!924673 m!858557))

(assert (=> b!924673 m!858553))

(assert (=> b!924673 m!858539))

(declare-fun m!858559 () Bool)

(assert (=> b!924673 m!858559))

(assert (=> b!924673 m!858555))

(declare-fun m!858561 () Bool)

(assert (=> b!924673 m!858561))

(declare-fun m!858563 () Bool)

(assert (=> b!924682 m!858563))

(declare-fun m!858565 () Bool)

(assert (=> b!924683 m!858565))

(declare-fun m!858567 () Bool)

(assert (=> mapNonEmpty!31332 m!858567))

(declare-fun m!858569 () Bool)

(assert (=> b!924680 m!858569))

(declare-fun m!858571 () Bool)

(assert (=> b!924680 m!858571))

(check-sat (not b!924675) (not b!924678) (not b!924682) (not b!924673) (not b_next!17209) (not start!78978) (not b!924684) tp_is_empty!19717 (not b!924674) (not b!924686) (not b!924683) (not b!924685) b_and!28131 (not b!924680) (not mapNonEmpty!31332) (not b_lambda!13693))
(check-sat b_and!28131 (not b_next!17209))
