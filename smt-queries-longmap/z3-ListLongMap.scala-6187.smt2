; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79398 () Bool)

(assert start!79398)

(declare-fun b_free!17443 () Bool)

(declare-fun b_next!17443 () Bool)

(assert (=> start!79398 (= b_free!17443 (not b_next!17443))))

(declare-fun tp!60771 () Bool)

(declare-fun b_and!28519 () Bool)

(assert (=> start!79398 (= tp!60771 b_and!28519)))

(declare-fun res!626876 () Bool)

(declare-fun e!522997 () Bool)

(assert (=> start!79398 (=> (not res!626876) (not e!522997))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79398 (= res!626876 (validMask!0 mask!1881))))

(assert (=> start!79398 e!522997))

(assert (=> start!79398 true))

(declare-datatypes ((V!31567 0))(
  ( (V!31568 (val!10026 Int)) )
))
(declare-datatypes ((ValueCell!9494 0))(
  ( (ValueCellFull!9494 (v!12541 V!31567)) (EmptyCell!9494) )
))
(declare-datatypes ((array!55907 0))(
  ( (array!55908 (arr!26894 (Array (_ BitVec 32) ValueCell!9494)) (size!27354 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55907)

(declare-fun e!522992 () Bool)

(declare-fun array_inv!21032 (array!55907) Bool)

(assert (=> start!79398 (and (array_inv!21032 _values!1231) e!522992)))

(assert (=> start!79398 tp!60771))

(declare-datatypes ((array!55909 0))(
  ( (array!55910 (arr!26895 (Array (_ BitVec 32) (_ BitVec 64))) (size!27355 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55909)

(declare-fun array_inv!21033 (array!55909) Bool)

(assert (=> start!79398 (array_inv!21033 _keys!1487)))

(declare-fun tp_is_empty!19951 () Bool)

(assert (=> start!79398 tp_is_empty!19951))

(declare-fun mapIsEmpty!31683 () Bool)

(declare-fun mapRes!31683 () Bool)

(assert (=> mapIsEmpty!31683 mapRes!31683))

(declare-fun b!931233 () Bool)

(declare-fun res!626877 () Bool)

(assert (=> b!931233 (=> (not res!626877) (not e!522997))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931233 (= res!626877 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27355 _keys!1487))))))

(declare-fun mapNonEmpty!31683 () Bool)

(declare-fun tp!60770 () Bool)

(declare-fun e!522994 () Bool)

(assert (=> mapNonEmpty!31683 (= mapRes!31683 (and tp!60770 e!522994))))

(declare-fun mapKey!31683 () (_ BitVec 32))

(declare-fun mapValue!31683 () ValueCell!9494)

(declare-fun mapRest!31683 () (Array (_ BitVec 32) ValueCell!9494))

(assert (=> mapNonEmpty!31683 (= (arr!26894 _values!1231) (store mapRest!31683 mapKey!31683 mapValue!31683))))

(declare-fun b!931234 () Bool)

(declare-fun e!522995 () Bool)

(assert (=> b!931234 (= e!522995 false)))

(declare-fun lt!419579 () V!31567)

(declare-datatypes ((tuple2!13114 0))(
  ( (tuple2!13115 (_1!6568 (_ BitVec 64)) (_2!6568 V!31567)) )
))
(declare-datatypes ((List!18903 0))(
  ( (Nil!18900) (Cons!18899 (h!20051 tuple2!13114) (t!26952 List!18903)) )
))
(declare-datatypes ((ListLongMap!11813 0))(
  ( (ListLongMap!11814 (toList!5922 List!18903)) )
))
(declare-fun lt!419578 () ListLongMap!11813)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!759 (ListLongMap!11813 (_ BitVec 64)) V!31567)

(assert (=> b!931234 (= lt!419579 (apply!759 lt!419578 k0!1099))))

(declare-fun b!931235 () Bool)

(declare-fun res!626879 () Bool)

(assert (=> b!931235 (=> (not res!626879) (not e!522997))))

(declare-datatypes ((List!18904 0))(
  ( (Nil!18901) (Cons!18900 (h!20052 (_ BitVec 64)) (t!26953 List!18904)) )
))
(declare-fun arrayNoDuplicates!0 (array!55909 (_ BitVec 32) List!18904) Bool)

(assert (=> b!931235 (= res!626879 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18901))))

(declare-fun b!931236 () Bool)

(declare-fun res!626878 () Bool)

(assert (=> b!931236 (=> (not res!626878) (not e!522997))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931236 (= res!626878 (and (= (size!27354 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27355 _keys!1487) (size!27354 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931237 () Bool)

(assert (=> b!931237 (= e!522994 tp_is_empty!19951)))

(declare-fun b!931238 () Bool)

(declare-fun e!522993 () Bool)

(assert (=> b!931238 (= e!522993 tp_is_empty!19951)))

(declare-fun b!931239 () Bool)

(declare-fun res!626875 () Bool)

(assert (=> b!931239 (=> (not res!626875) (not e!522997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55909 (_ BitVec 32)) Bool)

(assert (=> b!931239 (= res!626875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931240 () Bool)

(assert (=> b!931240 (= e!522997 e!522995)))

(declare-fun res!626880 () Bool)

(assert (=> b!931240 (=> (not res!626880) (not e!522995))))

(declare-fun contains!4989 (ListLongMap!11813 (_ BitVec 64)) Bool)

(assert (=> b!931240 (= res!626880 (contains!4989 lt!419578 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31567)

(declare-fun minValue!1173 () V!31567)

(declare-fun getCurrentListMap!3167 (array!55909 array!55907 (_ BitVec 32) (_ BitVec 32) V!31567 V!31567 (_ BitVec 32) Int) ListLongMap!11813)

(assert (=> b!931240 (= lt!419578 (getCurrentListMap!3167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931241 () Bool)

(assert (=> b!931241 (= e!522992 (and e!522993 mapRes!31683))))

(declare-fun condMapEmpty!31683 () Bool)

(declare-fun mapDefault!31683 () ValueCell!9494)

(assert (=> b!931241 (= condMapEmpty!31683 (= (arr!26894 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9494)) mapDefault!31683)))))

(assert (= (and start!79398 res!626876) b!931236))

(assert (= (and b!931236 res!626878) b!931239))

(assert (= (and b!931239 res!626875) b!931235))

(assert (= (and b!931235 res!626879) b!931233))

(assert (= (and b!931233 res!626877) b!931240))

(assert (= (and b!931240 res!626880) b!931234))

(assert (= (and b!931241 condMapEmpty!31683) mapIsEmpty!31683))

(assert (= (and b!931241 (not condMapEmpty!31683)) mapNonEmpty!31683))

(get-info :version)

(assert (= (and mapNonEmpty!31683 ((_ is ValueCellFull!9494) mapValue!31683)) b!931237))

(assert (= (and b!931241 ((_ is ValueCellFull!9494) mapDefault!31683)) b!931238))

(assert (= start!79398 b!931241))

(declare-fun m!865885 () Bool)

(assert (=> mapNonEmpty!31683 m!865885))

(declare-fun m!865887 () Bool)

(assert (=> start!79398 m!865887))

(declare-fun m!865889 () Bool)

(assert (=> start!79398 m!865889))

(declare-fun m!865891 () Bool)

(assert (=> start!79398 m!865891))

(declare-fun m!865893 () Bool)

(assert (=> b!931239 m!865893))

(declare-fun m!865895 () Bool)

(assert (=> b!931240 m!865895))

(declare-fun m!865897 () Bool)

(assert (=> b!931240 m!865897))

(declare-fun m!865899 () Bool)

(assert (=> b!931235 m!865899))

(declare-fun m!865901 () Bool)

(assert (=> b!931234 m!865901))

(check-sat b_and!28519 (not b!931234) (not b!931235) tp_is_empty!19951 (not b_next!17443) (not b!931240) (not start!79398) (not mapNonEmpty!31683) (not b!931239))
(check-sat b_and!28519 (not b_next!17443))
