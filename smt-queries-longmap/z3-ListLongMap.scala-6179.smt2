; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79350 () Bool)

(assert start!79350)

(declare-fun b_free!17395 () Bool)

(declare-fun b_next!17395 () Bool)

(assert (=> start!79350 (= b_free!17395 (not b_next!17395))))

(declare-fun tp!60626 () Bool)

(declare-fun b_and!28471 () Bool)

(assert (=> start!79350 (= tp!60626 b_and!28471)))

(declare-fun b!930436 () Bool)

(declare-fun e!522561 () Bool)

(declare-fun e!522562 () Bool)

(declare-fun mapRes!31611 () Bool)

(assert (=> b!930436 (= e!522561 (and e!522562 mapRes!31611))))

(declare-fun condMapEmpty!31611 () Bool)

(declare-datatypes ((V!31503 0))(
  ( (V!31504 (val!10002 Int)) )
))
(declare-datatypes ((ValueCell!9470 0))(
  ( (ValueCellFull!9470 (v!12517 V!31503)) (EmptyCell!9470) )
))
(declare-datatypes ((array!55815 0))(
  ( (array!55816 (arr!26848 (Array (_ BitVec 32) ValueCell!9470)) (size!27308 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55815)

(declare-fun mapDefault!31611 () ValueCell!9470)

(assert (=> b!930436 (= condMapEmpty!31611 (= (arr!26848 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9470)) mapDefault!31611)))))

(declare-fun mapNonEmpty!31611 () Bool)

(declare-fun tp!60627 () Bool)

(declare-fun e!522565 () Bool)

(assert (=> mapNonEmpty!31611 (= mapRes!31611 (and tp!60627 e!522565))))

(declare-fun mapKey!31611 () (_ BitVec 32))

(declare-fun mapValue!31611 () ValueCell!9470)

(declare-fun mapRest!31611 () (Array (_ BitVec 32) ValueCell!9470))

(assert (=> mapNonEmpty!31611 (= (arr!26848 _values!1231) (store mapRest!31611 mapKey!31611 mapValue!31611))))

(declare-fun res!626296 () Bool)

(declare-fun e!522560 () Bool)

(assert (=> start!79350 (=> (not res!626296) (not e!522560))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79350 (= res!626296 (validMask!0 mask!1881))))

(assert (=> start!79350 e!522560))

(assert (=> start!79350 true))

(declare-fun tp_is_empty!19903 () Bool)

(assert (=> start!79350 tp_is_empty!19903))

(declare-fun array_inv!21002 (array!55815) Bool)

(assert (=> start!79350 (and (array_inv!21002 _values!1231) e!522561)))

(assert (=> start!79350 tp!60626))

(declare-datatypes ((array!55817 0))(
  ( (array!55818 (arr!26849 (Array (_ BitVec 32) (_ BitVec 64))) (size!27309 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55817)

(declare-fun array_inv!21003 (array!55817) Bool)

(assert (=> start!79350 (array_inv!21003 _keys!1487)))

(declare-fun b!930437 () Bool)

(declare-fun res!626295 () Bool)

(assert (=> b!930437 (=> (not res!626295) (not e!522560))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930437 (= res!626295 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27309 _keys!1487))))))

(declare-fun b!930438 () Bool)

(declare-fun res!626299 () Bool)

(declare-fun e!522563 () Bool)

(assert (=> b!930438 (=> (not res!626299) (not e!522563))))

(declare-fun v!791 () V!31503)

(declare-datatypes ((tuple2!13070 0))(
  ( (tuple2!13071 (_1!6546 (_ BitVec 64)) (_2!6546 V!31503)) )
))
(declare-datatypes ((List!18868 0))(
  ( (Nil!18865) (Cons!18864 (h!20016 tuple2!13070) (t!26917 List!18868)) )
))
(declare-datatypes ((ListLongMap!11769 0))(
  ( (ListLongMap!11770 (toList!5900 List!18868)) )
))
(declare-fun lt!419444 () ListLongMap!11769)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!743 (ListLongMap!11769 (_ BitVec 64)) V!31503)

(assert (=> b!930438 (= res!626299 (= (apply!743 lt!419444 k0!1099) v!791))))

(declare-fun b!930439 () Bool)

(declare-fun res!626300 () Bool)

(assert (=> b!930439 (=> (not res!626300) (not e!522560))))

(declare-datatypes ((List!18869 0))(
  ( (Nil!18866) (Cons!18865 (h!20017 (_ BitVec 64)) (t!26918 List!18869)) )
))
(declare-fun arrayNoDuplicates!0 (array!55817 (_ BitVec 32) List!18869) Bool)

(assert (=> b!930439 (= res!626300 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18866))))

(declare-fun b!930440 () Bool)

(assert (=> b!930440 (= e!522565 tp_is_empty!19903)))

(declare-fun b!930441 () Bool)

(assert (=> b!930441 (= e!522560 e!522563)))

(declare-fun res!626294 () Bool)

(assert (=> b!930441 (=> (not res!626294) (not e!522563))))

(declare-fun contains!4969 (ListLongMap!11769 (_ BitVec 64)) Bool)

(assert (=> b!930441 (= res!626294 (contains!4969 lt!419444 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31503)

(declare-fun minValue!1173 () V!31503)

(declare-fun getCurrentListMap!3147 (array!55817 array!55815 (_ BitVec 32) (_ BitVec 32) V!31503 V!31503 (_ BitVec 32) Int) ListLongMap!11769)

(assert (=> b!930441 (= lt!419444 (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930442 () Bool)

(assert (=> b!930442 (= e!522563 false)))

(declare-fun lt!419443 () Bool)

(assert (=> b!930442 (= lt!419443 (contains!4969 (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!31611 () Bool)

(assert (=> mapIsEmpty!31611 mapRes!31611))

(declare-fun b!930443 () Bool)

(declare-fun res!626298 () Bool)

(assert (=> b!930443 (=> (not res!626298) (not e!522563))))

(assert (=> b!930443 (= res!626298 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930444 () Bool)

(declare-fun res!626297 () Bool)

(assert (=> b!930444 (=> (not res!626297) (not e!522560))))

(assert (=> b!930444 (= res!626297 (and (= (size!27308 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27309 _keys!1487) (size!27308 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930445 () Bool)

(declare-fun res!626301 () Bool)

(assert (=> b!930445 (=> (not res!626301) (not e!522560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55817 (_ BitVec 32)) Bool)

(assert (=> b!930445 (= res!626301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930446 () Bool)

(assert (=> b!930446 (= e!522562 tp_is_empty!19903)))

(assert (= (and start!79350 res!626296) b!930444))

(assert (= (and b!930444 res!626297) b!930445))

(assert (= (and b!930445 res!626301) b!930439))

(assert (= (and b!930439 res!626300) b!930437))

(assert (= (and b!930437 res!626295) b!930441))

(assert (= (and b!930441 res!626294) b!930438))

(assert (= (and b!930438 res!626299) b!930443))

(assert (= (and b!930443 res!626298) b!930442))

(assert (= (and b!930436 condMapEmpty!31611) mapIsEmpty!31611))

(assert (= (and b!930436 (not condMapEmpty!31611)) mapNonEmpty!31611))

(get-info :version)

(assert (= (and mapNonEmpty!31611 ((_ is ValueCellFull!9470) mapValue!31611)) b!930440))

(assert (= (and b!930436 ((_ is ValueCellFull!9470) mapDefault!31611)) b!930446))

(assert (= start!79350 b!930436))

(declare-fun m!865357 () Bool)

(assert (=> b!930439 m!865357))

(declare-fun m!865359 () Bool)

(assert (=> b!930445 m!865359))

(declare-fun m!865361 () Bool)

(assert (=> b!930442 m!865361))

(assert (=> b!930442 m!865361))

(declare-fun m!865363 () Bool)

(assert (=> b!930442 m!865363))

(declare-fun m!865365 () Bool)

(assert (=> mapNonEmpty!31611 m!865365))

(declare-fun m!865367 () Bool)

(assert (=> b!930441 m!865367))

(declare-fun m!865369 () Bool)

(assert (=> b!930441 m!865369))

(declare-fun m!865371 () Bool)

(assert (=> start!79350 m!865371))

(declare-fun m!865373 () Bool)

(assert (=> start!79350 m!865373))

(declare-fun m!865375 () Bool)

(assert (=> start!79350 m!865375))

(declare-fun m!865377 () Bool)

(assert (=> b!930438 m!865377))

(check-sat b_and!28471 (not mapNonEmpty!31611) (not start!79350) (not b!930445) (not b!930441) tp_is_empty!19903 (not b!930438) (not b!930439) (not b_next!17395) (not b!930442))
(check-sat b_and!28471 (not b_next!17395))
