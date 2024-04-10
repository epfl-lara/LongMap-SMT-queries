; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79236 () Bool)

(assert start!79236)

(declare-fun b_free!17449 () Bool)

(declare-fun b_next!17449 () Bool)

(assert (=> start!79236 (= b_free!17449 (not b_next!17449))))

(declare-fun tp!60788 () Bool)

(declare-fun b_and!28515 () Bool)

(assert (=> start!79236 (= tp!60788 b_and!28515)))

(declare-fun b!930417 () Bool)

(declare-fun res!626595 () Bool)

(declare-fun e!522466 () Bool)

(assert (=> b!930417 (=> (not res!626595) (not e!522466))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!930417 (= res!626595 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!31692 () Bool)

(declare-fun mapRes!31692 () Bool)

(assert (=> mapIsEmpty!31692 mapRes!31692))

(declare-fun b!930418 () Bool)

(declare-fun res!626591 () Bool)

(declare-fun e!522468 () Bool)

(assert (=> b!930418 (=> (not res!626591) (not e!522468))))

(declare-datatypes ((array!55860 0))(
  ( (array!55861 (arr!26875 (Array (_ BitVec 32) (_ BitVec 64))) (size!27334 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55860)

(declare-datatypes ((List!18914 0))(
  ( (Nil!18911) (Cons!18910 (h!20056 (_ BitVec 64)) (t!26971 List!18914)) )
))
(declare-fun arrayNoDuplicates!0 (array!55860 (_ BitVec 32) List!18914) Bool)

(assert (=> b!930418 (= res!626591 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18911))))

(declare-fun mapNonEmpty!31692 () Bool)

(declare-fun tp!60787 () Bool)

(declare-fun e!522467 () Bool)

(assert (=> mapNonEmpty!31692 (= mapRes!31692 (and tp!60787 e!522467))))

(declare-fun mapKey!31692 () (_ BitVec 32))

(declare-datatypes ((V!31575 0))(
  ( (V!31576 (val!10029 Int)) )
))
(declare-datatypes ((ValueCell!9497 0))(
  ( (ValueCellFull!9497 (v!12547 V!31575)) (EmptyCell!9497) )
))
(declare-fun mapValue!31692 () ValueCell!9497)

(declare-datatypes ((array!55862 0))(
  ( (array!55863 (arr!26876 (Array (_ BitVec 32) ValueCell!9497)) (size!27335 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55862)

(declare-fun mapRest!31692 () (Array (_ BitVec 32) ValueCell!9497))

(assert (=> mapNonEmpty!31692 (= (arr!26876 _values!1231) (store mapRest!31692 mapKey!31692 mapValue!31692))))

(declare-fun b!930419 () Bool)

(declare-fun e!522464 () Bool)

(declare-fun tp_is_empty!19957 () Bool)

(assert (=> b!930419 (= e!522464 tp_is_empty!19957)))

(declare-fun b!930420 () Bool)

(declare-fun res!626598 () Bool)

(assert (=> b!930420 (=> (not res!626598) (not e!522466))))

(declare-fun v!791 () V!31575)

(declare-datatypes ((tuple2!13122 0))(
  ( (tuple2!13123 (_1!6572 (_ BitVec 64)) (_2!6572 V!31575)) )
))
(declare-datatypes ((List!18915 0))(
  ( (Nil!18912) (Cons!18911 (h!20057 tuple2!13122) (t!26972 List!18915)) )
))
(declare-datatypes ((ListLongMap!11819 0))(
  ( (ListLongMap!11820 (toList!5925 List!18915)) )
))
(declare-fun lt!419233 () ListLongMap!11819)

(declare-fun apply!747 (ListLongMap!11819 (_ BitVec 64)) V!31575)

(assert (=> b!930420 (= res!626598 (= (apply!747 lt!419233 k!1099) v!791))))

(declare-fun b!930422 () Bool)

(declare-fun res!626593 () Bool)

(assert (=> b!930422 (=> (not res!626593) (not e!522468))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930422 (= res!626593 (and (= (size!27335 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27334 _keys!1487) (size!27335 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930423 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930423 (= e!522466 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27334 _keys!1487)))))

(declare-fun b!930424 () Bool)

(declare-fun res!626596 () Bool)

(assert (=> b!930424 (=> (not res!626596) (not e!522466))))

(assert (=> b!930424 (= res!626596 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930425 () Bool)

(assert (=> b!930425 (= e!522468 e!522466)))

(declare-fun res!626597 () Bool)

(assert (=> b!930425 (=> (not res!626597) (not e!522466))))

(declare-fun contains!4976 (ListLongMap!11819 (_ BitVec 64)) Bool)

(assert (=> b!930425 (= res!626597 (contains!4976 lt!419233 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31575)

(declare-fun minValue!1173 () V!31575)

(declare-fun getCurrentListMap!3167 (array!55860 array!55862 (_ BitVec 32) (_ BitVec 32) V!31575 V!31575 (_ BitVec 32) Int) ListLongMap!11819)

(assert (=> b!930425 (= lt!419233 (getCurrentListMap!3167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930426 () Bool)

(declare-fun res!626592 () Bool)

(assert (=> b!930426 (=> (not res!626592) (not e!522468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55860 (_ BitVec 32)) Bool)

(assert (=> b!930426 (= res!626592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930421 () Bool)

(assert (=> b!930421 (= e!522467 tp_is_empty!19957)))

(declare-fun res!626594 () Bool)

(assert (=> start!79236 (=> (not res!626594) (not e!522468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79236 (= res!626594 (validMask!0 mask!1881))))

(assert (=> start!79236 e!522468))

(assert (=> start!79236 true))

(assert (=> start!79236 tp_is_empty!19957))

(declare-fun e!522465 () Bool)

(declare-fun array_inv!20916 (array!55862) Bool)

(assert (=> start!79236 (and (array_inv!20916 _values!1231) e!522465)))

(assert (=> start!79236 tp!60788))

(declare-fun array_inv!20917 (array!55860) Bool)

(assert (=> start!79236 (array_inv!20917 _keys!1487)))

(declare-fun b!930427 () Bool)

(declare-fun res!626599 () Bool)

(assert (=> b!930427 (=> (not res!626599) (not e!522468))))

(assert (=> b!930427 (= res!626599 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27334 _keys!1487))))))

(declare-fun b!930428 () Bool)

(assert (=> b!930428 (= e!522465 (and e!522464 mapRes!31692))))

(declare-fun condMapEmpty!31692 () Bool)

(declare-fun mapDefault!31692 () ValueCell!9497)

