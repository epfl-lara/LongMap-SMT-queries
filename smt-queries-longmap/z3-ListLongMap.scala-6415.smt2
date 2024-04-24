; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82454 () Bool)

(assert start!82454)

(declare-fun b_free!18559 () Bool)

(declare-fun b_next!18559 () Bool)

(assert (=> start!82454 (= b_free!18559 (not b_next!18559))))

(declare-fun tp!64638 () Bool)

(declare-fun b_and!30057 () Bool)

(assert (=> start!82454 (= tp!64638 b_and!30057)))

(declare-fun b!960175 () Bool)

(declare-fun res!642465 () Bool)

(declare-fun e!541347 () Bool)

(assert (=> b!960175 (=> (not res!642465) (not e!541347))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((array!58658 0))(
  ( (array!58659 (arr!28198 (Array (_ BitVec 32) (_ BitVec 64))) (size!28678 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58658)

(assert (=> b!960175 (= res!642465 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28678 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28678 _keys!1668))))))

(declare-fun b!960176 () Bool)

(declare-fun e!541343 () Bool)

(declare-fun tp_is_empty!21265 () Bool)

(assert (=> b!960176 (= e!541343 tp_is_empty!21265)))

(declare-fun b!960177 () Bool)

(assert (=> b!960177 (= e!541347 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33337 0))(
  ( (V!33338 (val!10683 Int)) )
))
(declare-fun minValue!1328 () V!33337)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10151 0))(
  ( (ValueCellFull!10151 (v!13237 V!33337)) (EmptyCell!10151) )
))
(declare-datatypes ((array!58660 0))(
  ( (array!58661 (arr!28199 (Array (_ BitVec 32) ValueCell!10151)) (size!28679 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58660)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33337)

(declare-datatypes ((tuple2!13764 0))(
  ( (tuple2!13765 (_1!6893 (_ BitVec 64)) (_2!6893 V!33337)) )
))
(declare-datatypes ((List!19594 0))(
  ( (Nil!19591) (Cons!19590 (h!20758 tuple2!13764) (t!27949 List!19594)) )
))
(declare-datatypes ((ListLongMap!12463 0))(
  ( (ListLongMap!12464 (toList!6247 List!19594)) )
))
(declare-fun contains!5361 (ListLongMap!12463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3480 (array!58658 array!58660 (_ BitVec 32) (_ BitVec 32) V!33337 V!33337 (_ BitVec 32) Int) ListLongMap!12463)

(assert (=> b!960177 (contains!5361 (getCurrentListMap!3480 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28198 _keys!1668) i!793))))

(declare-datatypes ((Unit!32146 0))(
  ( (Unit!32147) )
))
(declare-fun lt!430891 () Unit!32146)

(declare-fun lemmaInListMapFromThenInFromSmaller!11 (array!58658 array!58660 (_ BitVec 32) (_ BitVec 32) V!33337 V!33337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32146)

(assert (=> b!960177 (= lt!430891 (lemmaInListMapFromThenInFromSmaller!11 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960178 () Bool)

(declare-fun e!541345 () Bool)

(assert (=> b!960178 (= e!541345 tp_is_empty!21265)))

(declare-fun mapIsEmpty!33877 () Bool)

(declare-fun mapRes!33877 () Bool)

(assert (=> mapIsEmpty!33877 mapRes!33877))

(declare-fun b!960179 () Bool)

(declare-fun e!541344 () Bool)

(assert (=> b!960179 (= e!541344 (and e!541345 mapRes!33877))))

(declare-fun condMapEmpty!33877 () Bool)

(declare-fun mapDefault!33877 () ValueCell!10151)

(assert (=> b!960179 (= condMapEmpty!33877 (= (arr!28199 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10151)) mapDefault!33877)))))

(declare-fun b!960180 () Bool)

(declare-fun res!642466 () Bool)

(assert (=> b!960180 (=> (not res!642466) (not e!541347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960180 (= res!642466 (validKeyInArray!0 (select (arr!28198 _keys!1668) i!793)))))

(declare-fun b!960181 () Bool)

(declare-fun res!642462 () Bool)

(assert (=> b!960181 (=> (not res!642462) (not e!541347))))

(declare-datatypes ((List!19595 0))(
  ( (Nil!19592) (Cons!19591 (h!20759 (_ BitVec 64)) (t!27950 List!19595)) )
))
(declare-fun arrayNoDuplicates!0 (array!58658 (_ BitVec 32) List!19595) Bool)

(assert (=> b!960181 (= res!642462 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19592))))

(declare-fun res!642460 () Bool)

(assert (=> start!82454 (=> (not res!642460) (not e!541347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82454 (= res!642460 (validMask!0 mask!2088))))

(assert (=> start!82454 e!541347))

(assert (=> start!82454 true))

(assert (=> start!82454 tp_is_empty!21265))

(declare-fun array_inv!21937 (array!58658) Bool)

(assert (=> start!82454 (array_inv!21937 _keys!1668)))

(declare-fun array_inv!21938 (array!58660) Bool)

(assert (=> start!82454 (and (array_inv!21938 _values!1386) e!541344)))

(assert (=> start!82454 tp!64638))

(declare-fun mapNonEmpty!33877 () Bool)

(declare-fun tp!64639 () Bool)

(assert (=> mapNonEmpty!33877 (= mapRes!33877 (and tp!64639 e!541343))))

(declare-fun mapValue!33877 () ValueCell!10151)

(declare-fun mapRest!33877 () (Array (_ BitVec 32) ValueCell!10151))

(declare-fun mapKey!33877 () (_ BitVec 32))

(assert (=> mapNonEmpty!33877 (= (arr!28199 _values!1386) (store mapRest!33877 mapKey!33877 mapValue!33877))))

(declare-fun b!960182 () Bool)

(declare-fun res!642463 () Bool)

(assert (=> b!960182 (=> (not res!642463) (not e!541347))))

(assert (=> b!960182 (= res!642463 (and (= (size!28679 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28678 _keys!1668) (size!28679 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960183 () Bool)

(declare-fun res!642464 () Bool)

(assert (=> b!960183 (=> (not res!642464) (not e!541347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58658 (_ BitVec 32)) Bool)

(assert (=> b!960183 (= res!642464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960184 () Bool)

(declare-fun res!642461 () Bool)

(assert (=> b!960184 (=> (not res!642461) (not e!541347))))

(assert (=> b!960184 (= res!642461 (contains!5361 (getCurrentListMap!3480 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28198 _keys!1668) i!793)))))

(assert (= (and start!82454 res!642460) b!960182))

(assert (= (and b!960182 res!642463) b!960183))

(assert (= (and b!960183 res!642464) b!960181))

(assert (= (and b!960181 res!642462) b!960175))

(assert (= (and b!960175 res!642465) b!960180))

(assert (= (and b!960180 res!642466) b!960184))

(assert (= (and b!960184 res!642461) b!960177))

(assert (= (and b!960179 condMapEmpty!33877) mapIsEmpty!33877))

(assert (= (and b!960179 (not condMapEmpty!33877)) mapNonEmpty!33877))

(get-info :version)

(assert (= (and mapNonEmpty!33877 ((_ is ValueCellFull!10151) mapValue!33877)) b!960176))

(assert (= (and b!960179 ((_ is ValueCellFull!10151) mapDefault!33877)) b!960178))

(assert (= start!82454 b!960179))

(declare-fun m!891081 () Bool)

(assert (=> mapNonEmpty!33877 m!891081))

(declare-fun m!891083 () Bool)

(assert (=> b!960183 m!891083))

(declare-fun m!891085 () Bool)

(assert (=> b!960184 m!891085))

(declare-fun m!891087 () Bool)

(assert (=> b!960184 m!891087))

(assert (=> b!960184 m!891085))

(assert (=> b!960184 m!891087))

(declare-fun m!891089 () Bool)

(assert (=> b!960184 m!891089))

(assert (=> b!960180 m!891087))

(assert (=> b!960180 m!891087))

(declare-fun m!891091 () Bool)

(assert (=> b!960180 m!891091))

(declare-fun m!891093 () Bool)

(assert (=> start!82454 m!891093))

(declare-fun m!891095 () Bool)

(assert (=> start!82454 m!891095))

(declare-fun m!891097 () Bool)

(assert (=> start!82454 m!891097))

(declare-fun m!891099 () Bool)

(assert (=> b!960181 m!891099))

(declare-fun m!891101 () Bool)

(assert (=> b!960177 m!891101))

(assert (=> b!960177 m!891087))

(assert (=> b!960177 m!891101))

(assert (=> b!960177 m!891087))

(declare-fun m!891103 () Bool)

(assert (=> b!960177 m!891103))

(declare-fun m!891105 () Bool)

(assert (=> b!960177 m!891105))

(check-sat (not b!960184) tp_is_empty!21265 (not b!960183) (not b_next!18559) (not b!960181) (not start!82454) (not b!960180) b_and!30057 (not mapNonEmpty!33877) (not b!960177))
(check-sat b_and!30057 (not b_next!18559))
