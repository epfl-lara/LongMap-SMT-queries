; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79368 () Bool)

(assert start!79368)

(declare-fun b_free!17413 () Bool)

(declare-fun b_next!17413 () Bool)

(assert (=> start!79368 (= b_free!17413 (not b_next!17413))))

(declare-fun tp!60681 () Bool)

(declare-fun b_and!28489 () Bool)

(assert (=> start!79368 (= tp!60681 b_and!28489)))

(declare-fun b!930733 () Bool)

(declare-fun e!522722 () Bool)

(declare-fun tp_is_empty!19921 () Bool)

(assert (=> b!930733 (= e!522722 tp_is_empty!19921)))

(declare-fun b!930734 () Bool)

(declare-fun res!626515 () Bool)

(declare-fun e!522726 () Bool)

(assert (=> b!930734 (=> (not res!626515) (not e!522726))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55849 0))(
  ( (array!55850 (arr!26865 (Array (_ BitVec 32) (_ BitVec 64))) (size!27325 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55849)

(assert (=> b!930734 (= res!626515 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27325 _keys!1487))))))

(declare-fun b!930735 () Bool)

(declare-fun e!522727 () Bool)

(assert (=> b!930735 (= e!522727 false)))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31527 0))(
  ( (V!31528 (val!10011 Int)) )
))
(declare-datatypes ((ValueCell!9479 0))(
  ( (ValueCellFull!9479 (v!12526 V!31527)) (EmptyCell!9479) )
))
(declare-datatypes ((array!55851 0))(
  ( (array!55852 (arr!26866 (Array (_ BitVec 32) ValueCell!9479)) (size!27326 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55851)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31527)

(declare-fun minValue!1173 () V!31527)

(declare-fun lt!419497 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((tuple2!13086 0))(
  ( (tuple2!13087 (_1!6554 (_ BitVec 64)) (_2!6554 V!31527)) )
))
(declare-datatypes ((List!18880 0))(
  ( (Nil!18877) (Cons!18876 (h!20028 tuple2!13086) (t!26929 List!18880)) )
))
(declare-datatypes ((ListLongMap!11785 0))(
  ( (ListLongMap!11786 (toList!5908 List!18880)) )
))
(declare-fun contains!4977 (ListLongMap!11785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3155 (array!55849 array!55851 (_ BitVec 32) (_ BitVec 32) V!31527 V!31527 (_ BitVec 32) Int) ListLongMap!11785)

(assert (=> b!930735 (= lt!419497 (contains!4977 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930736 () Bool)

(declare-fun res!626512 () Bool)

(assert (=> b!930736 (=> (not res!626512) (not e!522726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55849 (_ BitVec 32)) Bool)

(assert (=> b!930736 (= res!626512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930737 () Bool)

(declare-fun res!626511 () Bool)

(assert (=> b!930737 (=> (not res!626511) (not e!522727))))

(assert (=> b!930737 (= res!626511 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930738 () Bool)

(declare-fun e!522724 () Bool)

(assert (=> b!930738 (= e!522724 tp_is_empty!19921)))

(declare-fun res!626510 () Bool)

(assert (=> start!79368 (=> (not res!626510) (not e!522726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79368 (= res!626510 (validMask!0 mask!1881))))

(assert (=> start!79368 e!522726))

(assert (=> start!79368 true))

(assert (=> start!79368 tp_is_empty!19921))

(declare-fun e!522723 () Bool)

(declare-fun array_inv!21012 (array!55851) Bool)

(assert (=> start!79368 (and (array_inv!21012 _values!1231) e!522723)))

(assert (=> start!79368 tp!60681))

(declare-fun array_inv!21013 (array!55849) Bool)

(assert (=> start!79368 (array_inv!21013 _keys!1487)))

(declare-fun b!930739 () Bool)

(declare-fun mapRes!31638 () Bool)

(assert (=> b!930739 (= e!522723 (and e!522722 mapRes!31638))))

(declare-fun condMapEmpty!31638 () Bool)

(declare-fun mapDefault!31638 () ValueCell!9479)

(assert (=> b!930739 (= condMapEmpty!31638 (= (arr!26866 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9479)) mapDefault!31638)))))

(declare-fun mapIsEmpty!31638 () Bool)

(assert (=> mapIsEmpty!31638 mapRes!31638))

(declare-fun b!930740 () Bool)

(assert (=> b!930740 (= e!522726 e!522727)))

(declare-fun res!626513 () Bool)

(assert (=> b!930740 (=> (not res!626513) (not e!522727))))

(declare-fun lt!419498 () ListLongMap!11785)

(assert (=> b!930740 (= res!626513 (contains!4977 lt!419498 k0!1099))))

(assert (=> b!930740 (= lt!419498 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31638 () Bool)

(declare-fun tp!60680 () Bool)

(assert (=> mapNonEmpty!31638 (= mapRes!31638 (and tp!60680 e!522724))))

(declare-fun mapKey!31638 () (_ BitVec 32))

(declare-fun mapRest!31638 () (Array (_ BitVec 32) ValueCell!9479))

(declare-fun mapValue!31638 () ValueCell!9479)

(assert (=> mapNonEmpty!31638 (= (arr!26866 _values!1231) (store mapRest!31638 mapKey!31638 mapValue!31638))))

(declare-fun b!930741 () Bool)

(declare-fun res!626517 () Bool)

(assert (=> b!930741 (=> (not res!626517) (not e!522727))))

(declare-fun v!791 () V!31527)

(declare-fun apply!750 (ListLongMap!11785 (_ BitVec 64)) V!31527)

(assert (=> b!930741 (= res!626517 (= (apply!750 lt!419498 k0!1099) v!791))))

(declare-fun b!930742 () Bool)

(declare-fun res!626516 () Bool)

(assert (=> b!930742 (=> (not res!626516) (not e!522726))))

(declare-datatypes ((List!18881 0))(
  ( (Nil!18878) (Cons!18877 (h!20029 (_ BitVec 64)) (t!26930 List!18881)) )
))
(declare-fun arrayNoDuplicates!0 (array!55849 (_ BitVec 32) List!18881) Bool)

(assert (=> b!930742 (= res!626516 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18878))))

(declare-fun b!930743 () Bool)

(declare-fun res!626514 () Bool)

(assert (=> b!930743 (=> (not res!626514) (not e!522726))))

(assert (=> b!930743 (= res!626514 (and (= (size!27326 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27325 _keys!1487) (size!27326 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79368 res!626510) b!930743))

(assert (= (and b!930743 res!626514) b!930736))

(assert (= (and b!930736 res!626512) b!930742))

(assert (= (and b!930742 res!626516) b!930734))

(assert (= (and b!930734 res!626515) b!930740))

(assert (= (and b!930740 res!626513) b!930741))

(assert (= (and b!930741 res!626517) b!930737))

(assert (= (and b!930737 res!626511) b!930735))

(assert (= (and b!930739 condMapEmpty!31638) mapIsEmpty!31638))

(assert (= (and b!930739 (not condMapEmpty!31638)) mapNonEmpty!31638))

(get-info :version)

(assert (= (and mapNonEmpty!31638 ((_ is ValueCellFull!9479) mapValue!31638)) b!930738))

(assert (= (and b!930739 ((_ is ValueCellFull!9479) mapDefault!31638)) b!930733))

(assert (= start!79368 b!930739))

(declare-fun m!865555 () Bool)

(assert (=> b!930742 m!865555))

(declare-fun m!865557 () Bool)

(assert (=> b!930740 m!865557))

(declare-fun m!865559 () Bool)

(assert (=> b!930740 m!865559))

(declare-fun m!865561 () Bool)

(assert (=> b!930741 m!865561))

(declare-fun m!865563 () Bool)

(assert (=> start!79368 m!865563))

(declare-fun m!865565 () Bool)

(assert (=> start!79368 m!865565))

(declare-fun m!865567 () Bool)

(assert (=> start!79368 m!865567))

(declare-fun m!865569 () Bool)

(assert (=> b!930735 m!865569))

(assert (=> b!930735 m!865569))

(declare-fun m!865571 () Bool)

(assert (=> b!930735 m!865571))

(declare-fun m!865573 () Bool)

(assert (=> mapNonEmpty!31638 m!865573))

(declare-fun m!865575 () Bool)

(assert (=> b!930736 m!865575))

(check-sat tp_is_empty!19921 b_and!28489 (not b!930736) (not mapNonEmpty!31638) (not b!930740) (not b!930742) (not b!930735) (not b_next!17413) (not start!79368) (not b!930741))
(check-sat b_and!28489 (not b_next!17413))
