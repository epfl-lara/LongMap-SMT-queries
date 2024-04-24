; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79260 () Bool)

(assert start!79260)

(declare-fun b_free!17305 () Bool)

(declare-fun b_next!17305 () Bool)

(assert (=> start!79260 (= b_free!17305 (not b_next!17305))))

(declare-fun tp!60356 () Bool)

(declare-fun b_and!28357 () Bool)

(assert (=> start!79260 (= tp!60356 b_and!28357)))

(declare-fun b!928774 () Bool)

(declare-fun res!625275 () Bool)

(declare-fun e!521518 () Bool)

(assert (=> b!928774 (=> (not res!625275) (not e!521518))))

(declare-datatypes ((array!55641 0))(
  ( (array!55642 (arr!26761 (Array (_ BitVec 32) (_ BitVec 64))) (size!27221 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55641)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55641 (_ BitVec 32)) Bool)

(assert (=> b!928774 (= res!625275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928775 () Bool)

(declare-fun res!625273 () Bool)

(assert (=> b!928775 (=> (not res!625273) (not e!521518))))

(declare-datatypes ((List!18798 0))(
  ( (Nil!18795) (Cons!18794 (h!19946 (_ BitVec 64)) (t!26825 List!18798)) )
))
(declare-fun arrayNoDuplicates!0 (array!55641 (_ BitVec 32) List!18798) Bool)

(assert (=> b!928775 (= res!625273 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18795))))

(declare-fun b!928776 () Bool)

(declare-fun res!625265 () Bool)

(assert (=> b!928776 (=> (not res!625265) (not e!521518))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31383 0))(
  ( (V!31384 (val!9957 Int)) )
))
(declare-datatypes ((ValueCell!9425 0))(
  ( (ValueCellFull!9425 (v!12472 V!31383)) (EmptyCell!9425) )
))
(declare-datatypes ((array!55643 0))(
  ( (array!55644 (arr!26762 (Array (_ BitVec 32) ValueCell!9425)) (size!27222 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55643)

(assert (=> b!928776 (= res!625265 (and (= (size!27222 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27221 _keys!1487) (size!27222 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31476 () Bool)

(declare-fun mapRes!31476 () Bool)

(assert (=> mapIsEmpty!31476 mapRes!31476))

(declare-fun b!928777 () Bool)

(declare-fun e!521522 () Bool)

(declare-fun e!521521 () Bool)

(assert (=> b!928777 (= e!521522 e!521521)))

(declare-fun res!625270 () Bool)

(assert (=> b!928777 (=> (not res!625270) (not e!521521))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31383)

(declare-fun lt!418717 () V!31383)

(assert (=> b!928777 (= res!625270 (and (= lt!418717 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12992 0))(
  ( (tuple2!12993 (_1!6507 (_ BitVec 64)) (_2!6507 V!31383)) )
))
(declare-datatypes ((List!18799 0))(
  ( (Nil!18796) (Cons!18795 (h!19947 tuple2!12992) (t!26826 List!18799)) )
))
(declare-datatypes ((ListLongMap!11691 0))(
  ( (ListLongMap!11692 (toList!5861 List!18799)) )
))
(declare-fun lt!418714 () ListLongMap!11691)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!711 (ListLongMap!11691 (_ BitVec 64)) V!31383)

(assert (=> b!928777 (= lt!418717 (apply!711 lt!418714 k0!1099))))

(declare-fun b!928778 () Bool)

(assert (=> b!928778 (= e!521518 e!521522)))

(declare-fun res!625269 () Bool)

(assert (=> b!928778 (=> (not res!625269) (not e!521522))))

(declare-fun contains!4933 (ListLongMap!11691 (_ BitVec 64)) Bool)

(assert (=> b!928778 (= res!625269 (contains!4933 lt!418714 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31383)

(declare-fun minValue!1173 () V!31383)

(declare-fun getCurrentListMap!3111 (array!55641 array!55643 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 32) Int) ListLongMap!11691)

(assert (=> b!928778 (= lt!418714 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928779 () Bool)

(declare-fun e!521515 () Bool)

(assert (=> b!928779 (= e!521515 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928780 () Bool)

(declare-fun e!521513 () Bool)

(declare-fun tp_is_empty!19813 () Bool)

(assert (=> b!928780 (= e!521513 tp_is_empty!19813)))

(declare-fun b!928781 () Bool)

(declare-fun e!521523 () Bool)

(assert (=> b!928781 (= e!521523 (not true))))

(declare-fun e!521514 () Bool)

(assert (=> b!928781 e!521514))

(declare-fun res!625271 () Bool)

(assert (=> b!928781 (=> (not res!625271) (not e!521514))))

(declare-fun lt!418709 () ListLongMap!11691)

(assert (=> b!928781 (= res!625271 (contains!4933 lt!418709 k0!1099))))

(assert (=> b!928781 (= lt!418709 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31385 0))(
  ( (Unit!31386) )
))
(declare-fun lt!418713 () Unit!31385)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!100 (array!55641 array!55643 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 64) V!31383 (_ BitVec 32) Int) Unit!31385)

(assert (=> b!928781 (= lt!418713 (lemmaListMapApplyFromThenApplyFromZero!100 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928782 () Bool)

(declare-fun e!521517 () Bool)

(assert (=> b!928782 (= e!521517 e!521523)))

(declare-fun res!625266 () Bool)

(assert (=> b!928782 (=> (not res!625266) (not e!521523))))

(declare-fun lt!418706 () ListLongMap!11691)

(assert (=> b!928782 (= res!625266 (contains!4933 lt!418706 k0!1099))))

(assert (=> b!928782 (= lt!418706 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928783 () Bool)

(declare-fun e!521524 () Bool)

(declare-fun e!521520 () Bool)

(assert (=> b!928783 (= e!521524 (and e!521520 mapRes!31476))))

(declare-fun condMapEmpty!31476 () Bool)

(declare-fun mapDefault!31476 () ValueCell!9425)

(assert (=> b!928783 (= condMapEmpty!31476 (= (arr!26762 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9425)) mapDefault!31476)))))

(declare-fun b!928785 () Bool)

(declare-fun e!521512 () Unit!31385)

(declare-fun e!521516 () Unit!31385)

(assert (=> b!928785 (= e!521512 e!521516)))

(declare-fun lt!418715 () (_ BitVec 64))

(assert (=> b!928785 (= lt!418715 (select (arr!26761 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97213 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928785 (= c!97213 (validKeyInArray!0 lt!418715))))

(declare-fun b!928786 () Bool)

(assert (=> b!928786 (= e!521521 e!521517)))

(declare-fun res!625268 () Bool)

(assert (=> b!928786 (=> (not res!625268) (not e!521517))))

(assert (=> b!928786 (= res!625268 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27221 _keys!1487)))))

(declare-fun lt!418711 () Unit!31385)

(assert (=> b!928786 (= lt!418711 e!521512)))

(declare-fun c!97215 () Bool)

(assert (=> b!928786 (= c!97215 (validKeyInArray!0 k0!1099))))

(declare-fun b!928787 () Bool)

(declare-fun Unit!31387 () Unit!31385)

(assert (=> b!928787 (= e!521512 Unit!31387)))

(declare-fun b!928788 () Bool)

(declare-fun arrayContainsKey!0 (array!55641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928788 (= e!521515 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928789 () Bool)

(assert (=> b!928789 (= e!521514 (= (apply!711 lt!418709 k0!1099) v!791))))

(declare-fun b!928790 () Bool)

(declare-fun lt!418707 () ListLongMap!11691)

(assert (=> b!928790 (= (apply!711 lt!418707 k0!1099) lt!418717)))

(declare-fun lt!418712 () Unit!31385)

(declare-fun lt!418721 () V!31383)

(declare-fun addApplyDifferent!406 (ListLongMap!11691 (_ BitVec 64) V!31383 (_ BitVec 64)) Unit!31385)

(assert (=> b!928790 (= lt!418712 (addApplyDifferent!406 lt!418714 lt!418715 lt!418721 k0!1099))))

(assert (=> b!928790 (not (= lt!418715 k0!1099))))

(declare-fun lt!418710 () Unit!31385)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55641 (_ BitVec 64) (_ BitVec 32) List!18798) Unit!31385)

(assert (=> b!928790 (= lt!418710 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18795))))

(assert (=> b!928790 e!521515))

(declare-fun c!97214 () Bool)

(assert (=> b!928790 (= c!97214 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418720 () Unit!31385)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!261 (array!55641 array!55643 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 64) (_ BitVec 32) Int) Unit!31385)

(assert (=> b!928790 (= lt!418720 (lemmaListMapContainsThenArrayContainsFrom!261 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!928790 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18795)))

(declare-fun lt!418719 () Unit!31385)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55641 (_ BitVec 32) (_ BitVec 32)) Unit!31385)

(assert (=> b!928790 (= lt!418719 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928790 (contains!4933 lt!418707 k0!1099)))

(declare-fun lt!418716 () tuple2!12992)

(declare-fun +!2770 (ListLongMap!11691 tuple2!12992) ListLongMap!11691)

(assert (=> b!928790 (= lt!418707 (+!2770 lt!418714 lt!418716))))

(declare-fun lt!418708 () Unit!31385)

(declare-fun addStillContains!479 (ListLongMap!11691 (_ BitVec 64) V!31383 (_ BitVec 64)) Unit!31385)

(assert (=> b!928790 (= lt!418708 (addStillContains!479 lt!418714 lt!418715 lt!418721 k0!1099))))

(assert (=> b!928790 (= (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2770 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418716))))

(assert (=> b!928790 (= lt!418716 (tuple2!12993 lt!418715 lt!418721))))

(declare-fun get!14107 (ValueCell!9425 V!31383) V!31383)

(declare-fun dynLambda!1567 (Int (_ BitVec 64)) V!31383)

(assert (=> b!928790 (= lt!418721 (get!14107 (select (arr!26762 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1567 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418718 () Unit!31385)

(declare-fun lemmaListMapRecursiveValidKeyArray!150 (array!55641 array!55643 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 32) Int) Unit!31385)

(assert (=> b!928790 (= lt!418718 (lemmaListMapRecursiveValidKeyArray!150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928790 (= e!521516 lt!418712)))

(declare-fun mapNonEmpty!31476 () Bool)

(declare-fun tp!60357 () Bool)

(assert (=> mapNonEmpty!31476 (= mapRes!31476 (and tp!60357 e!521513))))

(declare-fun mapValue!31476 () ValueCell!9425)

(declare-fun mapKey!31476 () (_ BitVec 32))

(declare-fun mapRest!31476 () (Array (_ BitVec 32) ValueCell!9425))

(assert (=> mapNonEmpty!31476 (= (arr!26762 _values!1231) (store mapRest!31476 mapKey!31476 mapValue!31476))))

(declare-fun b!928784 () Bool)

(declare-fun res!625272 () Bool)

(assert (=> b!928784 (=> (not res!625272) (not e!521518))))

(assert (=> b!928784 (= res!625272 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27221 _keys!1487))))))

(declare-fun res!625274 () Bool)

(assert (=> start!79260 (=> (not res!625274) (not e!521518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79260 (= res!625274 (validMask!0 mask!1881))))

(assert (=> start!79260 e!521518))

(assert (=> start!79260 true))

(assert (=> start!79260 tp_is_empty!19813))

(declare-fun array_inv!20940 (array!55643) Bool)

(assert (=> start!79260 (and (array_inv!20940 _values!1231) e!521524)))

(assert (=> start!79260 tp!60356))

(declare-fun array_inv!20941 (array!55641) Bool)

(assert (=> start!79260 (array_inv!20941 _keys!1487)))

(declare-fun b!928791 () Bool)

(declare-fun Unit!31388 () Unit!31385)

(assert (=> b!928791 (= e!521516 Unit!31388)))

(declare-fun b!928792 () Bool)

(assert (=> b!928792 (= e!521520 tp_is_empty!19813)))

(declare-fun b!928793 () Bool)

(declare-fun res!625267 () Bool)

(assert (=> b!928793 (=> (not res!625267) (not e!521523))))

(assert (=> b!928793 (= res!625267 (= (apply!711 lt!418706 k0!1099) v!791))))

(assert (= (and start!79260 res!625274) b!928776))

(assert (= (and b!928776 res!625265) b!928774))

(assert (= (and b!928774 res!625275) b!928775))

(assert (= (and b!928775 res!625273) b!928784))

(assert (= (and b!928784 res!625272) b!928778))

(assert (= (and b!928778 res!625269) b!928777))

(assert (= (and b!928777 res!625270) b!928786))

(assert (= (and b!928786 c!97215) b!928785))

(assert (= (and b!928786 (not c!97215)) b!928787))

(assert (= (and b!928785 c!97213) b!928790))

(assert (= (and b!928785 (not c!97213)) b!928791))

(assert (= (and b!928790 c!97214) b!928788))

(assert (= (and b!928790 (not c!97214)) b!928779))

(assert (= (and b!928786 res!625268) b!928782))

(assert (= (and b!928782 res!625266) b!928793))

(assert (= (and b!928793 res!625267) b!928781))

(assert (= (and b!928781 res!625271) b!928789))

(assert (= (and b!928783 condMapEmpty!31476) mapIsEmpty!31476))

(assert (= (and b!928783 (not condMapEmpty!31476)) mapNonEmpty!31476))

(get-info :version)

(assert (= (and mapNonEmpty!31476 ((_ is ValueCellFull!9425) mapValue!31476)) b!928780))

(assert (= (and b!928783 ((_ is ValueCellFull!9425) mapDefault!31476)) b!928792))

(assert (= start!79260 b!928783))

(declare-fun b_lambda!13821 () Bool)

(assert (=> (not b_lambda!13821) (not b!928790)))

(declare-fun t!26824 () Bool)

(declare-fun tb!5877 () Bool)

(assert (=> (and start!79260 (= defaultEntry!1235 defaultEntry!1235) t!26824) tb!5877))

(declare-fun result!11585 () Bool)

(assert (=> tb!5877 (= result!11585 tp_is_empty!19813)))

(assert (=> b!928790 t!26824))

(declare-fun b_and!28359 () Bool)

(assert (= b_and!28357 (and (=> t!26824 result!11585) b_and!28359)))

(declare-fun m!863899 () Bool)

(assert (=> b!928774 m!863899))

(declare-fun m!863901 () Bool)

(assert (=> b!928778 m!863901))

(declare-fun m!863903 () Bool)

(assert (=> b!928778 m!863903))

(declare-fun m!863905 () Bool)

(assert (=> b!928789 m!863905))

(declare-fun m!863907 () Bool)

(assert (=> b!928777 m!863907))

(declare-fun m!863909 () Bool)

(assert (=> b!928775 m!863909))

(declare-fun m!863911 () Bool)

(assert (=> b!928782 m!863911))

(declare-fun m!863913 () Bool)

(assert (=> b!928782 m!863913))

(declare-fun m!863915 () Bool)

(assert (=> b!928786 m!863915))

(declare-fun m!863917 () Bool)

(assert (=> b!928793 m!863917))

(declare-fun m!863919 () Bool)

(assert (=> b!928785 m!863919))

(declare-fun m!863921 () Bool)

(assert (=> b!928785 m!863921))

(declare-fun m!863923 () Bool)

(assert (=> mapNonEmpty!31476 m!863923))

(declare-fun m!863925 () Bool)

(assert (=> b!928788 m!863925))

(declare-fun m!863927 () Bool)

(assert (=> b!928790 m!863927))

(declare-fun m!863929 () Bool)

(assert (=> b!928790 m!863929))

(declare-fun m!863931 () Bool)

(assert (=> b!928790 m!863931))

(declare-fun m!863933 () Bool)

(assert (=> b!928790 m!863933))

(declare-fun m!863935 () Bool)

(assert (=> b!928790 m!863935))

(assert (=> b!928790 m!863929))

(assert (=> b!928790 m!863933))

(declare-fun m!863937 () Bool)

(assert (=> b!928790 m!863937))

(assert (=> b!928790 m!863913))

(declare-fun m!863939 () Bool)

(assert (=> b!928790 m!863939))

(declare-fun m!863941 () Bool)

(assert (=> b!928790 m!863941))

(declare-fun m!863943 () Bool)

(assert (=> b!928790 m!863943))

(declare-fun m!863945 () Bool)

(assert (=> b!928790 m!863945))

(declare-fun m!863947 () Bool)

(assert (=> b!928790 m!863947))

(declare-fun m!863949 () Bool)

(assert (=> b!928790 m!863949))

(declare-fun m!863951 () Bool)

(assert (=> b!928790 m!863951))

(declare-fun m!863953 () Bool)

(assert (=> b!928790 m!863953))

(assert (=> b!928790 m!863951))

(declare-fun m!863955 () Bool)

(assert (=> b!928790 m!863955))

(declare-fun m!863957 () Bool)

(assert (=> b!928781 m!863957))

(declare-fun m!863959 () Bool)

(assert (=> b!928781 m!863959))

(declare-fun m!863961 () Bool)

(assert (=> b!928781 m!863961))

(declare-fun m!863963 () Bool)

(assert (=> start!79260 m!863963))

(declare-fun m!863965 () Bool)

(assert (=> start!79260 m!863965))

(declare-fun m!863967 () Bool)

(assert (=> start!79260 m!863967))

(check-sat (not b!928793) (not b!928786) (not b!928789) (not mapNonEmpty!31476) (not b_next!17305) (not b_lambda!13821) (not b!928790) (not b!928777) (not b!928775) tp_is_empty!19813 (not b!928774) b_and!28359 (not b!928782) (not b!928781) (not b!928778) (not b!928788) (not start!79260) (not b!928785))
(check-sat b_and!28359 (not b_next!17305))
