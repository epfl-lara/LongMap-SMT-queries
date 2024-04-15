; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79236 () Bool)

(assert start!79236)

(declare-fun b_free!17467 () Bool)

(declare-fun b_next!17467 () Bool)

(assert (=> start!79236 (= b_free!17467 (not b_next!17467))))

(declare-fun tp!60842 () Bool)

(declare-fun b_and!28507 () Bool)

(assert (=> start!79236 (= tp!60842 b_and!28507)))

(declare-fun b!930442 () Bool)

(declare-fun res!626668 () Bool)

(declare-fun e!522481 () Bool)

(assert (=> b!930442 (=> (not res!626668) (not e!522481))))

(declare-datatypes ((array!55863 0))(
  ( (array!55864 (arr!26877 (Array (_ BitVec 32) (_ BitVec 64))) (size!27338 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55863)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31599 0))(
  ( (V!31600 (val!10038 Int)) )
))
(declare-datatypes ((ValueCell!9506 0))(
  ( (ValueCellFull!9506 (v!12555 V!31599)) (EmptyCell!9506) )
))
(declare-datatypes ((array!55865 0))(
  ( (array!55866 (arr!26878 (Array (_ BitVec 32) ValueCell!9506)) (size!27339 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55865)

(assert (=> b!930442 (= res!626668 (and (= (size!27339 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27338 _keys!1487) (size!27339 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930443 () Bool)

(declare-fun res!626666 () Bool)

(assert (=> b!930443 (=> (not res!626666) (not e!522481))))

(declare-datatypes ((List!18945 0))(
  ( (Nil!18942) (Cons!18941 (h!20087 (_ BitVec 64)) (t!26993 List!18945)) )
))
(declare-fun arrayNoDuplicates!0 (array!55863 (_ BitVec 32) List!18945) Bool)

(assert (=> b!930443 (= res!626666 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18942))))

(declare-fun b!930444 () Bool)

(declare-fun e!522480 () Bool)

(declare-fun tp_is_empty!19975 () Bool)

(assert (=> b!930444 (= e!522480 tp_is_empty!19975)))

(declare-fun b!930446 () Bool)

(declare-fun res!626669 () Bool)

(assert (=> b!930446 (=> (not res!626669) (not e!522481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55863 (_ BitVec 32)) Bool)

(assert (=> b!930446 (= res!626669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930447 () Bool)

(declare-fun e!522479 () Bool)

(assert (=> b!930447 (= e!522481 e!522479)))

(declare-fun res!626664 () Bool)

(assert (=> b!930447 (=> (not res!626664) (not e!522479))))

(declare-datatypes ((tuple2!13190 0))(
  ( (tuple2!13191 (_1!6606 (_ BitVec 64)) (_2!6606 V!31599)) )
))
(declare-datatypes ((List!18946 0))(
  ( (Nil!18943) (Cons!18942 (h!20088 tuple2!13190) (t!26994 List!18946)) )
))
(declare-datatypes ((ListLongMap!11877 0))(
  ( (ListLongMap!11878 (toList!5954 List!18946)) )
))
(declare-fun lt!419044 () ListLongMap!11877)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4956 (ListLongMap!11877 (_ BitVec 64)) Bool)

(assert (=> b!930447 (= res!626664 (contains!4956 lt!419044 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31599)

(declare-fun minValue!1173 () V!31599)

(declare-fun getCurrentListMap!3130 (array!55863 array!55865 (_ BitVec 32) (_ BitVec 32) V!31599 V!31599 (_ BitVec 32) Int) ListLongMap!11877)

(assert (=> b!930447 (= lt!419044 (getCurrentListMap!3130 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930448 () Bool)

(assert (=> b!930448 (= e!522479 false)))

(declare-fun lt!419045 () V!31599)

(declare-fun apply!751 (ListLongMap!11877 (_ BitVec 64)) V!31599)

(assert (=> b!930448 (= lt!419045 (apply!751 lt!419044 k0!1099))))

(declare-fun mapNonEmpty!31719 () Bool)

(declare-fun mapRes!31719 () Bool)

(declare-fun tp!60843 () Bool)

(declare-fun e!522483 () Bool)

(assert (=> mapNonEmpty!31719 (= mapRes!31719 (and tp!60843 e!522483))))

(declare-fun mapKey!31719 () (_ BitVec 32))

(declare-fun mapRest!31719 () (Array (_ BitVec 32) ValueCell!9506))

(declare-fun mapValue!31719 () ValueCell!9506)

(assert (=> mapNonEmpty!31719 (= (arr!26878 _values!1231) (store mapRest!31719 mapKey!31719 mapValue!31719))))

(declare-fun b!930449 () Bool)

(declare-fun res!626665 () Bool)

(assert (=> b!930449 (=> (not res!626665) (not e!522481))))

(assert (=> b!930449 (= res!626665 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27338 _keys!1487))))))

(declare-fun res!626667 () Bool)

(assert (=> start!79236 (=> (not res!626667) (not e!522481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79236 (= res!626667 (validMask!0 mask!1881))))

(assert (=> start!79236 e!522481))

(assert (=> start!79236 true))

(declare-fun e!522482 () Bool)

(declare-fun array_inv!20992 (array!55865) Bool)

(assert (=> start!79236 (and (array_inv!20992 _values!1231) e!522482)))

(assert (=> start!79236 tp!60842))

(declare-fun array_inv!20993 (array!55863) Bool)

(assert (=> start!79236 (array_inv!20993 _keys!1487)))

(assert (=> start!79236 tp_is_empty!19975))

(declare-fun b!930445 () Bool)

(assert (=> b!930445 (= e!522482 (and e!522480 mapRes!31719))))

(declare-fun condMapEmpty!31719 () Bool)

(declare-fun mapDefault!31719 () ValueCell!9506)

(assert (=> b!930445 (= condMapEmpty!31719 (= (arr!26878 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9506)) mapDefault!31719)))))

(declare-fun mapIsEmpty!31719 () Bool)

(assert (=> mapIsEmpty!31719 mapRes!31719))

(declare-fun b!930450 () Bool)

(assert (=> b!930450 (= e!522483 tp_is_empty!19975)))

(assert (= (and start!79236 res!626667) b!930442))

(assert (= (and b!930442 res!626668) b!930446))

(assert (= (and b!930446 res!626669) b!930443))

(assert (= (and b!930443 res!626666) b!930449))

(assert (= (and b!930449 res!626665) b!930447))

(assert (= (and b!930447 res!626664) b!930448))

(assert (= (and b!930445 condMapEmpty!31719) mapIsEmpty!31719))

(assert (= (and b!930445 (not condMapEmpty!31719)) mapNonEmpty!31719))

(get-info :version)

(assert (= (and mapNonEmpty!31719 ((_ is ValueCellFull!9506) mapValue!31719)) b!930450))

(assert (= (and b!930445 ((_ is ValueCellFull!9506) mapDefault!31719)) b!930444))

(assert (= start!79236 b!930445))

(declare-fun m!864055 () Bool)

(assert (=> b!930448 m!864055))

(declare-fun m!864057 () Bool)

(assert (=> start!79236 m!864057))

(declare-fun m!864059 () Bool)

(assert (=> start!79236 m!864059))

(declare-fun m!864061 () Bool)

(assert (=> start!79236 m!864061))

(declare-fun m!864063 () Bool)

(assert (=> b!930446 m!864063))

(declare-fun m!864065 () Bool)

(assert (=> b!930447 m!864065))

(declare-fun m!864067 () Bool)

(assert (=> b!930447 m!864067))

(declare-fun m!864069 () Bool)

(assert (=> b!930443 m!864069))

(declare-fun m!864071 () Bool)

(assert (=> mapNonEmpty!31719 m!864071))

(check-sat (not mapNonEmpty!31719) (not start!79236) b_and!28507 tp_is_empty!19975 (not b!930448) (not b!930447) (not b!930446) (not b_next!17467) (not b!930443))
(check-sat b_and!28507 (not b_next!17467))
