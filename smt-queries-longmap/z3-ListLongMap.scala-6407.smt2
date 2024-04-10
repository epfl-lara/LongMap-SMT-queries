; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82240 () Bool)

(assert start!82240)

(declare-fun b_free!18513 () Bool)

(declare-fun b_next!18513 () Bool)

(assert (=> start!82240 (= b_free!18513 (not b_next!18513))))

(declare-fun tp!64500 () Bool)

(declare-fun b_and!30001 () Bool)

(assert (=> start!82240 (= tp!64500 b_and!30001)))

(declare-fun b!958604 () Bool)

(declare-fun e!540416 () Bool)

(assert (=> b!958604 (= e!540416 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33275 0))(
  ( (V!33276 (val!10660 Int)) )
))
(declare-fun minValue!1328 () V!33275)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58537 0))(
  ( (array!58538 (arr!28142 (Array (_ BitVec 32) (_ BitVec 64))) (size!28621 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58537)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33275)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430461 () Bool)

(declare-datatypes ((ValueCell!10128 0))(
  ( (ValueCellFull!10128 (v!13217 V!33275)) (EmptyCell!10128) )
))
(declare-datatypes ((array!58539 0))(
  ( (array!58540 (arr!28143 (Array (_ BitVec 32) ValueCell!10128)) (size!28622 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58539)

(declare-datatypes ((tuple2!13742 0))(
  ( (tuple2!13743 (_1!6882 (_ BitVec 64)) (_2!6882 V!33275)) )
))
(declare-datatypes ((List!19564 0))(
  ( (Nil!19561) (Cons!19560 (h!20722 tuple2!13742) (t!27927 List!19564)) )
))
(declare-datatypes ((ListLongMap!12439 0))(
  ( (ListLongMap!12440 (toList!6235 List!19564)) )
))
(declare-fun contains!5336 (ListLongMap!12439 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3468 (array!58537 array!58539 (_ BitVec 32) (_ BitVec 32) V!33275 V!33275 (_ BitVec 32) Int) ListLongMap!12439)

(assert (=> b!958604 (= lt!430461 (contains!5336 (getCurrentListMap!3468 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28142 _keys!1668) i!793)))))

(declare-fun b!958605 () Bool)

(declare-fun res!641659 () Bool)

(assert (=> b!958605 (=> (not res!641659) (not e!540416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58537 (_ BitVec 32)) Bool)

(assert (=> b!958605 (= res!641659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958606 () Bool)

(declare-fun res!641657 () Bool)

(assert (=> b!958606 (=> (not res!641657) (not e!540416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958606 (= res!641657 (validKeyInArray!0 (select (arr!28142 _keys!1668) i!793)))))

(declare-fun b!958607 () Bool)

(declare-fun e!540419 () Bool)

(declare-fun e!540420 () Bool)

(declare-fun mapRes!33808 () Bool)

(assert (=> b!958607 (= e!540419 (and e!540420 mapRes!33808))))

(declare-fun condMapEmpty!33808 () Bool)

(declare-fun mapDefault!33808 () ValueCell!10128)

(assert (=> b!958607 (= condMapEmpty!33808 (= (arr!28143 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10128)) mapDefault!33808)))))

(declare-fun b!958608 () Bool)

(declare-fun e!540417 () Bool)

(declare-fun tp_is_empty!21219 () Bool)

(assert (=> b!958608 (= e!540417 tp_is_empty!21219)))

(declare-fun b!958609 () Bool)

(declare-fun res!641658 () Bool)

(assert (=> b!958609 (=> (not res!641658) (not e!540416))))

(assert (=> b!958609 (= res!641658 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28621 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28621 _keys!1668))))))

(declare-fun res!641656 () Bool)

(assert (=> start!82240 (=> (not res!641656) (not e!540416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82240 (= res!641656 (validMask!0 mask!2088))))

(assert (=> start!82240 e!540416))

(assert (=> start!82240 true))

(assert (=> start!82240 tp_is_empty!21219))

(declare-fun array_inv!21825 (array!58537) Bool)

(assert (=> start!82240 (array_inv!21825 _keys!1668)))

(declare-fun array_inv!21826 (array!58539) Bool)

(assert (=> start!82240 (and (array_inv!21826 _values!1386) e!540419)))

(assert (=> start!82240 tp!64500))

(declare-fun b!958610 () Bool)

(assert (=> b!958610 (= e!540420 tp_is_empty!21219)))

(declare-fun b!958611 () Bool)

(declare-fun res!641660 () Bool)

(assert (=> b!958611 (=> (not res!641660) (not e!540416))))

(declare-datatypes ((List!19565 0))(
  ( (Nil!19562) (Cons!19561 (h!20723 (_ BitVec 64)) (t!27928 List!19565)) )
))
(declare-fun arrayNoDuplicates!0 (array!58537 (_ BitVec 32) List!19565) Bool)

(assert (=> b!958611 (= res!641660 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19562))))

(declare-fun mapIsEmpty!33808 () Bool)

(assert (=> mapIsEmpty!33808 mapRes!33808))

(declare-fun mapNonEmpty!33808 () Bool)

(declare-fun tp!64499 () Bool)

(assert (=> mapNonEmpty!33808 (= mapRes!33808 (and tp!64499 e!540417))))

(declare-fun mapKey!33808 () (_ BitVec 32))

(declare-fun mapRest!33808 () (Array (_ BitVec 32) ValueCell!10128))

(declare-fun mapValue!33808 () ValueCell!10128)

(assert (=> mapNonEmpty!33808 (= (arr!28143 _values!1386) (store mapRest!33808 mapKey!33808 mapValue!33808))))

(declare-fun b!958612 () Bool)

(declare-fun res!641655 () Bool)

(assert (=> b!958612 (=> (not res!641655) (not e!540416))))

(assert (=> b!958612 (= res!641655 (and (= (size!28622 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28621 _keys!1668) (size!28622 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82240 res!641656) b!958612))

(assert (= (and b!958612 res!641655) b!958605))

(assert (= (and b!958605 res!641659) b!958611))

(assert (= (and b!958611 res!641660) b!958609))

(assert (= (and b!958609 res!641658) b!958606))

(assert (= (and b!958606 res!641657) b!958604))

(assert (= (and b!958607 condMapEmpty!33808) mapIsEmpty!33808))

(assert (= (and b!958607 (not condMapEmpty!33808)) mapNonEmpty!33808))

(get-info :version)

(assert (= (and mapNonEmpty!33808 ((_ is ValueCellFull!10128) mapValue!33808)) b!958608))

(assert (= (and b!958607 ((_ is ValueCellFull!10128) mapDefault!33808)) b!958610))

(assert (= start!82240 b!958607))

(declare-fun m!889237 () Bool)

(assert (=> b!958611 m!889237))

(declare-fun m!889239 () Bool)

(assert (=> mapNonEmpty!33808 m!889239))

(declare-fun m!889241 () Bool)

(assert (=> b!958605 m!889241))

(declare-fun m!889243 () Bool)

(assert (=> start!82240 m!889243))

(declare-fun m!889245 () Bool)

(assert (=> start!82240 m!889245))

(declare-fun m!889247 () Bool)

(assert (=> start!82240 m!889247))

(declare-fun m!889249 () Bool)

(assert (=> b!958606 m!889249))

(assert (=> b!958606 m!889249))

(declare-fun m!889251 () Bool)

(assert (=> b!958606 m!889251))

(declare-fun m!889253 () Bool)

(assert (=> b!958604 m!889253))

(assert (=> b!958604 m!889249))

(assert (=> b!958604 m!889253))

(assert (=> b!958604 m!889249))

(declare-fun m!889255 () Bool)

(assert (=> b!958604 m!889255))

(check-sat (not b!958605) b_and!30001 (not b!958611) (not b_next!18513) tp_is_empty!21219 (not start!82240) (not b!958604) (not b!958606) (not mapNonEmpty!33808))
(check-sat b_and!30001 (not b_next!18513))
