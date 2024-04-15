; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79212 () Bool)

(assert start!79212)

(declare-fun b_free!17443 () Bool)

(declare-fun b_next!17443 () Bool)

(assert (=> start!79212 (= b_free!17443 (not b_next!17443))))

(declare-fun tp!60770 () Bool)

(declare-fun b_and!28483 () Bool)

(assert (=> start!79212 (= tp!60770 b_and!28483)))

(declare-fun b!930091 () Bool)

(declare-fun e!522266 () Bool)

(declare-fun tp_is_empty!19951 () Bool)

(assert (=> b!930091 (= e!522266 tp_is_empty!19951)))

(declare-fun mapIsEmpty!31683 () Bool)

(declare-fun mapRes!31683 () Bool)

(assert (=> mapIsEmpty!31683 mapRes!31683))

(declare-fun b!930092 () Bool)

(declare-fun e!522263 () Bool)

(assert (=> b!930092 (= e!522263 (and e!522266 mapRes!31683))))

(declare-fun condMapEmpty!31683 () Bool)

(declare-datatypes ((V!31567 0))(
  ( (V!31568 (val!10026 Int)) )
))
(declare-datatypes ((ValueCell!9494 0))(
  ( (ValueCellFull!9494 (v!12543 V!31567)) (EmptyCell!9494) )
))
(declare-datatypes ((array!55815 0))(
  ( (array!55816 (arr!26853 (Array (_ BitVec 32) ValueCell!9494)) (size!27314 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55815)

(declare-fun mapDefault!31683 () ValueCell!9494)

(assert (=> b!930092 (= condMapEmpty!31683 (= (arr!26853 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9494)) mapDefault!31683)))))

(declare-fun res!626426 () Bool)

(declare-fun e!522264 () Bool)

(assert (=> start!79212 (=> (not res!626426) (not e!522264))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79212 (= res!626426 (validMask!0 mask!1881))))

(assert (=> start!79212 e!522264))

(assert (=> start!79212 true))

(declare-fun array_inv!20978 (array!55815) Bool)

(assert (=> start!79212 (and (array_inv!20978 _values!1231) e!522263)))

(assert (=> start!79212 tp!60770))

(declare-datatypes ((array!55817 0))(
  ( (array!55818 (arr!26854 (Array (_ BitVec 32) (_ BitVec 64))) (size!27315 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55817)

(declare-fun array_inv!20979 (array!55817) Bool)

(assert (=> start!79212 (array_inv!20979 _keys!1487)))

(assert (=> start!79212 tp_is_empty!19951))

(declare-fun b!930093 () Bool)

(declare-fun res!626425 () Bool)

(assert (=> b!930093 (=> (not res!626425) (not e!522264))))

(declare-datatypes ((List!18925 0))(
  ( (Nil!18922) (Cons!18921 (h!20067 (_ BitVec 64)) (t!26973 List!18925)) )
))
(declare-fun arrayNoDuplicates!0 (array!55817 (_ BitVec 32) List!18925) Bool)

(assert (=> b!930093 (= res!626425 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18922))))

(declare-fun mapNonEmpty!31683 () Bool)

(declare-fun tp!60771 () Bool)

(declare-fun e!522265 () Bool)

(assert (=> mapNonEmpty!31683 (= mapRes!31683 (and tp!60771 e!522265))))

(declare-fun mapKey!31683 () (_ BitVec 32))

(declare-fun mapRest!31683 () (Array (_ BitVec 32) ValueCell!9494))

(declare-fun mapValue!31683 () ValueCell!9494)

(assert (=> mapNonEmpty!31683 (= (arr!26853 _values!1231) (store mapRest!31683 mapKey!31683 mapValue!31683))))

(declare-fun b!930094 () Bool)

(declare-fun e!522267 () Bool)

(assert (=> b!930094 (= e!522264 e!522267)))

(declare-fun res!626421 () Bool)

(assert (=> b!930094 (=> (not res!626421) (not e!522267))))

(declare-datatypes ((tuple2!13168 0))(
  ( (tuple2!13169 (_1!6595 (_ BitVec 64)) (_2!6595 V!31567)) )
))
(declare-datatypes ((List!18926 0))(
  ( (Nil!18923) (Cons!18922 (h!20068 tuple2!13168) (t!26974 List!18926)) )
))
(declare-datatypes ((ListLongMap!11855 0))(
  ( (ListLongMap!11856 (toList!5943 List!18926)) )
))
(declare-fun lt!418982 () ListLongMap!11855)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4948 (ListLongMap!11855 (_ BitVec 64)) Bool)

(assert (=> b!930094 (= res!626421 (contains!4948 lt!418982 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31567)

(declare-fun minValue!1173 () V!31567)

(declare-fun getCurrentListMap!3122 (array!55817 array!55815 (_ BitVec 32) (_ BitVec 32) V!31567 V!31567 (_ BitVec 32) Int) ListLongMap!11855)

(assert (=> b!930094 (= lt!418982 (getCurrentListMap!3122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930095 () Bool)

(assert (=> b!930095 (= e!522265 tp_is_empty!19951)))

(declare-fun b!930096 () Bool)

(assert (=> b!930096 (= e!522267 false)))

(declare-fun lt!418981 () V!31567)

(declare-fun apply!742 (ListLongMap!11855 (_ BitVec 64)) V!31567)

(assert (=> b!930096 (= lt!418981 (apply!742 lt!418982 k0!1099))))

(declare-fun b!930097 () Bool)

(declare-fun res!626423 () Bool)

(assert (=> b!930097 (=> (not res!626423) (not e!522264))))

(assert (=> b!930097 (= res!626423 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27315 _keys!1487))))))

(declare-fun b!930098 () Bool)

(declare-fun res!626424 () Bool)

(assert (=> b!930098 (=> (not res!626424) (not e!522264))))

(assert (=> b!930098 (= res!626424 (and (= (size!27314 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27315 _keys!1487) (size!27314 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930099 () Bool)

(declare-fun res!626422 () Bool)

(assert (=> b!930099 (=> (not res!626422) (not e!522264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55817 (_ BitVec 32)) Bool)

(assert (=> b!930099 (= res!626422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79212 res!626426) b!930098))

(assert (= (and b!930098 res!626424) b!930099))

(assert (= (and b!930099 res!626422) b!930093))

(assert (= (and b!930093 res!626425) b!930097))

(assert (= (and b!930097 res!626423) b!930094))

(assert (= (and b!930094 res!626421) b!930096))

(assert (= (and b!930092 condMapEmpty!31683) mapIsEmpty!31683))

(assert (= (and b!930092 (not condMapEmpty!31683)) mapNonEmpty!31683))

(get-info :version)

(assert (= (and mapNonEmpty!31683 ((_ is ValueCellFull!9494) mapValue!31683)) b!930095))

(assert (= (and b!930092 ((_ is ValueCellFull!9494) mapDefault!31683)) b!930091))

(assert (= start!79212 b!930092))

(declare-fun m!863833 () Bool)

(assert (=> b!930099 m!863833))

(declare-fun m!863835 () Bool)

(assert (=> b!930096 m!863835))

(declare-fun m!863837 () Bool)

(assert (=> b!930094 m!863837))

(declare-fun m!863839 () Bool)

(assert (=> b!930094 m!863839))

(declare-fun m!863841 () Bool)

(assert (=> start!79212 m!863841))

(declare-fun m!863843 () Bool)

(assert (=> start!79212 m!863843))

(declare-fun m!863845 () Bool)

(assert (=> start!79212 m!863845))

(declare-fun m!863847 () Bool)

(assert (=> b!930093 m!863847))

(declare-fun m!863849 () Bool)

(assert (=> mapNonEmpty!31683 m!863849))

(check-sat (not start!79212) tp_is_empty!19951 (not b!930094) (not b!930093) b_and!28483 (not b!930099) (not b_next!17443) (not mapNonEmpty!31683) (not b!930096))
(check-sat b_and!28483 (not b_next!17443))
