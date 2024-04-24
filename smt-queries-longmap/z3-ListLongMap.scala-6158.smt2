; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79224 () Bool)

(assert start!79224)

(declare-fun b_free!17269 () Bool)

(declare-fun b_next!17269 () Bool)

(assert (=> start!79224 (= b_free!17269 (not b_next!17269))))

(declare-fun tp!60249 () Bool)

(declare-fun b_and!28285 () Bool)

(assert (=> start!79224 (= tp!60249 b_and!28285)))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31335 0))(
  ( (V!31336 (val!9939 Int)) )
))
(declare-datatypes ((tuple2!12956 0))(
  ( (tuple2!12957 (_1!6489 (_ BitVec 64)) (_2!6489 V!31335)) )
))
(declare-datatypes ((List!18765 0))(
  ( (Nil!18762) (Cons!18761 (h!19913 tuple2!12956) (t!26756 List!18765)) )
))
(declare-datatypes ((ListLongMap!11655 0))(
  ( (ListLongMap!11656 (toList!5843 List!18765)) )
))
(declare-fun lt!417843 () ListLongMap!11655)

(declare-fun v!791 () V!31335)

(declare-fun e!520811 () Bool)

(declare-fun b!927658 () Bool)

(declare-fun apply!694 (ListLongMap!11655 (_ BitVec 64)) V!31335)

(assert (=> b!927658 (= e!520811 (= (apply!694 lt!417843 k0!1099) v!791))))

(declare-fun mapIsEmpty!31422 () Bool)

(declare-fun mapRes!31422 () Bool)

(assert (=> mapIsEmpty!31422 mapRes!31422))

(declare-fun b!927659 () Bool)

(declare-fun res!624673 () Bool)

(declare-fun e!520814 () Bool)

(assert (=> b!927659 (=> (not res!624673) (not e!520814))))

(declare-datatypes ((array!55569 0))(
  ( (array!55570 (arr!26725 (Array (_ BitVec 32) (_ BitVec 64))) (size!27185 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55569)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55569 (_ BitVec 32)) Bool)

(assert (=> b!927659 (= res!624673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927660 () Bool)

(declare-fun res!624679 () Bool)

(declare-fun e!520812 () Bool)

(assert (=> b!927660 (=> (not res!624679) (not e!520812))))

(declare-fun lt!417853 () ListLongMap!11655)

(assert (=> b!927660 (= res!624679 (= (apply!694 lt!417853 k0!1099) v!791))))

(declare-fun b!927661 () Bool)

(declare-fun res!624674 () Bool)

(assert (=> b!927661 (=> (not res!624674) (not e!520814))))

(declare-datatypes ((List!18766 0))(
  ( (Nil!18763) (Cons!18762 (h!19914 (_ BitVec 64)) (t!26757 List!18766)) )
))
(declare-fun arrayNoDuplicates!0 (array!55569 (_ BitVec 32) List!18766) Bool)

(assert (=> b!927661 (= res!624674 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18763))))

(declare-fun b!927662 () Bool)

(declare-fun e!520818 () Bool)

(assert (=> b!927662 (= e!520814 e!520818)))

(declare-fun res!624672 () Bool)

(assert (=> b!927662 (=> (not res!624672) (not e!520818))))

(declare-fun lt!417854 () ListLongMap!11655)

(declare-fun contains!4915 (ListLongMap!11655 (_ BitVec 64)) Bool)

(assert (=> b!927662 (= res!624672 (contains!4915 lt!417854 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9407 0))(
  ( (ValueCellFull!9407 (v!12454 V!31335)) (EmptyCell!9407) )
))
(declare-datatypes ((array!55571 0))(
  ( (array!55572 (arr!26726 (Array (_ BitVec 32) ValueCell!9407)) (size!27186 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55571)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31335)

(declare-fun minValue!1173 () V!31335)

(declare-fun getCurrentListMap!3093 (array!55569 array!55571 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 32) Int) ListLongMap!11655)

(assert (=> b!927662 (= lt!417854 (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927663 () Bool)

(declare-fun e!520817 () Bool)

(declare-fun e!520821 () Bool)

(assert (=> b!927663 (= e!520817 e!520821)))

(declare-fun res!624675 () Bool)

(assert (=> b!927663 (=> (not res!624675) (not e!520821))))

(assert (=> b!927663 (= res!624675 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27185 _keys!1487)))))

(declare-datatypes ((Unit!31326 0))(
  ( (Unit!31327) )
))
(declare-fun lt!417847 () Unit!31326)

(declare-fun e!520813 () Unit!31326)

(assert (=> b!927663 (= lt!417847 e!520813)))

(declare-fun c!97052 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927663 (= c!97052 (validKeyInArray!0 k0!1099))))

(declare-fun e!520815 () Bool)

(declare-fun b!927664 () Bool)

(declare-fun arrayContainsKey!0 (array!55569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927664 (= e!520815 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927665 () Bool)

(assert (=> b!927665 (= e!520818 e!520817)))

(declare-fun res!624681 () Bool)

(assert (=> b!927665 (=> (not res!624681) (not e!520817))))

(declare-fun lt!417856 () V!31335)

(assert (=> b!927665 (= res!624681 (and (= lt!417856 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927665 (= lt!417856 (apply!694 lt!417854 k0!1099))))

(declare-fun b!927666 () Bool)

(declare-fun e!520819 () Bool)

(declare-fun e!520816 () Bool)

(assert (=> b!927666 (= e!520819 (and e!520816 mapRes!31422))))

(declare-fun condMapEmpty!31422 () Bool)

(declare-fun mapDefault!31422 () ValueCell!9407)

(assert (=> b!927666 (= condMapEmpty!31422 (= (arr!26726 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9407)) mapDefault!31422)))))

(declare-fun b!927667 () Bool)

(declare-fun e!520810 () Unit!31326)

(assert (=> b!927667 (= e!520813 e!520810)))

(declare-fun lt!417846 () (_ BitVec 64))

(assert (=> b!927667 (= lt!417846 (select (arr!26725 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97051 () Bool)

(assert (=> b!927667 (= c!97051 (validKeyInArray!0 lt!417846))))

(declare-fun b!927668 () Bool)

(declare-fun res!624677 () Bool)

(assert (=> b!927668 (=> (not res!624677) (not e!520814))))

(assert (=> b!927668 (= res!624677 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27185 _keys!1487))))))

(declare-fun res!624678 () Bool)

(assert (=> start!79224 (=> (not res!624678) (not e!520814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79224 (= res!624678 (validMask!0 mask!1881))))

(assert (=> start!79224 e!520814))

(assert (=> start!79224 true))

(declare-fun tp_is_empty!19777 () Bool)

(assert (=> start!79224 tp_is_empty!19777))

(declare-fun array_inv!20910 (array!55571) Bool)

(assert (=> start!79224 (and (array_inv!20910 _values!1231) e!520819)))

(assert (=> start!79224 tp!60249))

(declare-fun array_inv!20911 (array!55569) Bool)

(assert (=> start!79224 (array_inv!20911 _keys!1487)))

(declare-fun b!927669 () Bool)

(declare-fun lt!417844 () ListLongMap!11655)

(assert (=> b!927669 (= (apply!694 lt!417844 k0!1099) lt!417856)))

(declare-fun lt!417857 () V!31335)

(declare-fun lt!417848 () Unit!31326)

(declare-fun addApplyDifferent!391 (ListLongMap!11655 (_ BitVec 64) V!31335 (_ BitVec 64)) Unit!31326)

(assert (=> b!927669 (= lt!417848 (addApplyDifferent!391 lt!417854 lt!417846 lt!417857 k0!1099))))

(assert (=> b!927669 (not (= lt!417846 k0!1099))))

(declare-fun lt!417850 () Unit!31326)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55569 (_ BitVec 64) (_ BitVec 32) List!18766) Unit!31326)

(assert (=> b!927669 (= lt!417850 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18763))))

(assert (=> b!927669 e!520815))

(declare-fun c!97053 () Bool)

(assert (=> b!927669 (= c!97053 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417851 () Unit!31326)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!246 (array!55569 array!55571 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 64) (_ BitVec 32) Int) Unit!31326)

(assert (=> b!927669 (= lt!417851 (lemmaListMapContainsThenArrayContainsFrom!246 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927669 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18763)))

(declare-fun lt!417845 () Unit!31326)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55569 (_ BitVec 32) (_ BitVec 32)) Unit!31326)

(assert (=> b!927669 (= lt!417845 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927669 (contains!4915 lt!417844 k0!1099)))

(declare-fun lt!417852 () tuple2!12956)

(declare-fun +!2755 (ListLongMap!11655 tuple2!12956) ListLongMap!11655)

(assert (=> b!927669 (= lt!417844 (+!2755 lt!417854 lt!417852))))

(declare-fun lt!417842 () Unit!31326)

(declare-fun addStillContains!464 (ListLongMap!11655 (_ BitVec 64) V!31335 (_ BitVec 64)) Unit!31326)

(assert (=> b!927669 (= lt!417842 (addStillContains!464 lt!417854 lt!417846 lt!417857 k0!1099))))

(assert (=> b!927669 (= (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2755 (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417852))))

(assert (=> b!927669 (= lt!417852 (tuple2!12957 lt!417846 lt!417857))))

(declare-fun get!14080 (ValueCell!9407 V!31335) V!31335)

(declare-fun dynLambda!1552 (Int (_ BitVec 64)) V!31335)

(assert (=> b!927669 (= lt!417857 (get!14080 (select (arr!26726 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1552 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417855 () Unit!31326)

(declare-fun lemmaListMapRecursiveValidKeyArray!135 (array!55569 array!55571 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 32) Int) Unit!31326)

(assert (=> b!927669 (= lt!417855 (lemmaListMapRecursiveValidKeyArray!135 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927669 (= e!520810 lt!417848)))

(declare-fun b!927670 () Bool)

(assert (=> b!927670 (= e!520816 tp_is_empty!19777)))

(declare-fun b!927671 () Bool)

(declare-fun Unit!31328 () Unit!31326)

(assert (=> b!927671 (= e!520813 Unit!31328)))

(declare-fun b!927672 () Bool)

(assert (=> b!927672 (= e!520815 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927673 () Bool)

(declare-fun e!520822 () Bool)

(assert (=> b!927673 (= e!520822 tp_is_empty!19777)))

(declare-fun mapNonEmpty!31422 () Bool)

(declare-fun tp!60248 () Bool)

(assert (=> mapNonEmpty!31422 (= mapRes!31422 (and tp!60248 e!520822))))

(declare-fun mapRest!31422 () (Array (_ BitVec 32) ValueCell!9407))

(declare-fun mapValue!31422 () ValueCell!9407)

(declare-fun mapKey!31422 () (_ BitVec 32))

(assert (=> mapNonEmpty!31422 (= (arr!26726 _values!1231) (store mapRest!31422 mapKey!31422 mapValue!31422))))

(declare-fun b!927674 () Bool)

(assert (=> b!927674 (= e!520821 e!520812)))

(declare-fun res!624676 () Bool)

(assert (=> b!927674 (=> (not res!624676) (not e!520812))))

(assert (=> b!927674 (= res!624676 (contains!4915 lt!417853 k0!1099))))

(assert (=> b!927674 (= lt!417853 (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927675 () Bool)

(assert (=> b!927675 (= e!520812 (not true))))

(assert (=> b!927675 e!520811))

(declare-fun res!624680 () Bool)

(assert (=> b!927675 (=> (not res!624680) (not e!520811))))

(assert (=> b!927675 (= res!624680 (contains!4915 lt!417843 k0!1099))))

(assert (=> b!927675 (= lt!417843 (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417849 () Unit!31326)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!85 (array!55569 array!55571 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 64) V!31335 (_ BitVec 32) Int) Unit!31326)

(assert (=> b!927675 (= lt!417849 (lemmaListMapApplyFromThenApplyFromZero!85 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927676 () Bool)

(declare-fun res!624671 () Bool)

(assert (=> b!927676 (=> (not res!624671) (not e!520814))))

(assert (=> b!927676 (= res!624671 (and (= (size!27186 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27185 _keys!1487) (size!27186 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927677 () Bool)

(declare-fun Unit!31329 () Unit!31326)

(assert (=> b!927677 (= e!520810 Unit!31329)))

(assert (= (and start!79224 res!624678) b!927676))

(assert (= (and b!927676 res!624671) b!927659))

(assert (= (and b!927659 res!624673) b!927661))

(assert (= (and b!927661 res!624674) b!927668))

(assert (= (and b!927668 res!624677) b!927662))

(assert (= (and b!927662 res!624672) b!927665))

(assert (= (and b!927665 res!624681) b!927663))

(assert (= (and b!927663 c!97052) b!927667))

(assert (= (and b!927663 (not c!97052)) b!927671))

(assert (= (and b!927667 c!97051) b!927669))

(assert (= (and b!927667 (not c!97051)) b!927677))

(assert (= (and b!927669 c!97053) b!927664))

(assert (= (and b!927669 (not c!97053)) b!927672))

(assert (= (and b!927663 res!624675) b!927674))

(assert (= (and b!927674 res!624676) b!927660))

(assert (= (and b!927660 res!624679) b!927675))

(assert (= (and b!927675 res!624680) b!927658))

(assert (= (and b!927666 condMapEmpty!31422) mapIsEmpty!31422))

(assert (= (and b!927666 (not condMapEmpty!31422)) mapNonEmpty!31422))

(get-info :version)

(assert (= (and mapNonEmpty!31422 ((_ is ValueCellFull!9407) mapValue!31422)) b!927673))

(assert (= (and b!927666 ((_ is ValueCellFull!9407) mapDefault!31422)) b!927670))

(assert (= start!79224 b!927666))

(declare-fun b_lambda!13785 () Bool)

(assert (=> (not b_lambda!13785) (not b!927669)))

(declare-fun t!26755 () Bool)

(declare-fun tb!5841 () Bool)

(assert (=> (and start!79224 (= defaultEntry!1235 defaultEntry!1235) t!26755) tb!5841))

(declare-fun result!11513 () Bool)

(assert (=> tb!5841 (= result!11513 tp_is_empty!19777)))

(assert (=> b!927669 t!26755))

(declare-fun b_and!28287 () Bool)

(assert (= b_and!28285 (and (=> t!26755 result!11513) b_and!28287)))

(declare-fun m!862639 () Bool)

(assert (=> b!927667 m!862639))

(declare-fun m!862641 () Bool)

(assert (=> b!927667 m!862641))

(declare-fun m!862643 () Bool)

(assert (=> b!927662 m!862643))

(declare-fun m!862645 () Bool)

(assert (=> b!927662 m!862645))

(declare-fun m!862647 () Bool)

(assert (=> b!927675 m!862647))

(declare-fun m!862649 () Bool)

(assert (=> b!927675 m!862649))

(declare-fun m!862651 () Bool)

(assert (=> b!927675 m!862651))

(declare-fun m!862653 () Bool)

(assert (=> b!927674 m!862653))

(declare-fun m!862655 () Bool)

(assert (=> b!927674 m!862655))

(declare-fun m!862657 () Bool)

(assert (=> b!927658 m!862657))

(declare-fun m!862659 () Bool)

(assert (=> b!927660 m!862659))

(declare-fun m!862661 () Bool)

(assert (=> b!927663 m!862661))

(declare-fun m!862663 () Bool)

(assert (=> b!927659 m!862663))

(declare-fun m!862665 () Bool)

(assert (=> b!927665 m!862665))

(declare-fun m!862667 () Bool)

(assert (=> b!927664 m!862667))

(declare-fun m!862669 () Bool)

(assert (=> b!927669 m!862669))

(declare-fun m!862671 () Bool)

(assert (=> b!927669 m!862671))

(declare-fun m!862673 () Bool)

(assert (=> b!927669 m!862673))

(declare-fun m!862675 () Bool)

(assert (=> b!927669 m!862675))

(declare-fun m!862677 () Bool)

(assert (=> b!927669 m!862677))

(declare-fun m!862679 () Bool)

(assert (=> b!927669 m!862679))

(assert (=> b!927669 m!862671))

(assert (=> b!927669 m!862675))

(declare-fun m!862681 () Bool)

(assert (=> b!927669 m!862681))

(assert (=> b!927669 m!862655))

(declare-fun m!862683 () Bool)

(assert (=> b!927669 m!862683))

(declare-fun m!862685 () Bool)

(assert (=> b!927669 m!862685))

(declare-fun m!862687 () Bool)

(assert (=> b!927669 m!862687))

(declare-fun m!862689 () Bool)

(assert (=> b!927669 m!862689))

(assert (=> b!927669 m!862677))

(declare-fun m!862691 () Bool)

(assert (=> b!927669 m!862691))

(declare-fun m!862693 () Bool)

(assert (=> b!927669 m!862693))

(declare-fun m!862695 () Bool)

(assert (=> b!927669 m!862695))

(declare-fun m!862697 () Bool)

(assert (=> b!927669 m!862697))

(declare-fun m!862699 () Bool)

(assert (=> mapNonEmpty!31422 m!862699))

(declare-fun m!862701 () Bool)

(assert (=> start!79224 m!862701))

(declare-fun m!862703 () Bool)

(assert (=> start!79224 m!862703))

(declare-fun m!862705 () Bool)

(assert (=> start!79224 m!862705))

(declare-fun m!862707 () Bool)

(assert (=> b!927661 m!862707))

(check-sat (not b!927660) (not b!927667) (not b!927675) (not b_lambda!13785) (not b!927663) (not b!927664) (not b!927665) (not b!927659) (not b!927658) (not b!927674) tp_is_empty!19777 (not b_next!17269) (not b!927661) (not start!79224) b_and!28287 (not mapNonEmpty!31422) (not b!927669) (not b!927662))
(check-sat b_and!28287 (not b_next!17269))
