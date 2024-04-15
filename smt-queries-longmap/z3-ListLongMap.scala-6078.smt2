; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78558 () Bool)

(assert start!78558)

(declare-fun b_free!16789 () Bool)

(declare-fun b_next!16789 () Bool)

(assert (=> start!78558 (= b_free!16789 (not b_next!16789))))

(declare-fun tp!58808 () Bool)

(declare-fun b_and!27385 () Bool)

(assert (=> start!78558 (= tp!58808 b_and!27385)))

(declare-fun mapNonEmpty!30702 () Bool)

(declare-fun mapRes!30702 () Bool)

(declare-fun tp!58809 () Bool)

(declare-fun e!513992 () Bool)

(assert (=> mapNonEmpty!30702 (= mapRes!30702 (and tp!58809 e!513992))))

(declare-datatypes ((V!30695 0))(
  ( (V!30696 (val!9699 Int)) )
))
(declare-datatypes ((ValueCell!9167 0))(
  ( (ValueCellFull!9167 (v!12216 V!30695)) (EmptyCell!9167) )
))
(declare-fun mapValue!30702 () ValueCell!9167)

(declare-fun mapRest!30702 () (Array (_ BitVec 32) ValueCell!9167))

(declare-datatypes ((array!54575 0))(
  ( (array!54576 (arr!26233 (Array (_ BitVec 32) ValueCell!9167)) (size!26694 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54575)

(declare-fun mapKey!30702 () (_ BitVec 32))

(assert (=> mapNonEmpty!30702 (= (arr!26233 _values!1231) (store mapRest!30702 mapKey!30702 mapValue!30702))))

(declare-fun b!915723 () Bool)

(declare-fun res!617401 () Bool)

(declare-fun e!513990 () Bool)

(assert (=> b!915723 (=> (not res!617401) (not e!513990))))

(declare-datatypes ((array!54577 0))(
  ( (array!54578 (arr!26234 (Array (_ BitVec 32) (_ BitVec 64))) (size!26695 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54577)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54577 (_ BitVec 32)) Bool)

(assert (=> b!915723 (= res!617401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30702 () Bool)

(assert (=> mapIsEmpty!30702 mapRes!30702))

(declare-fun b!915724 () Bool)

(declare-fun e!513991 () Bool)

(declare-fun tp_is_empty!19297 () Bool)

(assert (=> b!915724 (= e!513991 tp_is_empty!19297)))

(declare-fun b!915725 () Bool)

(assert (=> b!915725 (= e!513990 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411500 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30695)

(declare-fun minValue!1173 () V!30695)

(declare-datatypes ((tuple2!12634 0))(
  ( (tuple2!12635 (_1!6328 (_ BitVec 64)) (_2!6328 V!30695)) )
))
(declare-datatypes ((List!18431 0))(
  ( (Nil!18428) (Cons!18427 (h!19573 tuple2!12634) (t!26035 List!18431)) )
))
(declare-datatypes ((ListLongMap!11321 0))(
  ( (ListLongMap!11322 (toList!5676 List!18431)) )
))
(declare-fun contains!4686 (ListLongMap!11321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2875 (array!54577 array!54575 (_ BitVec 32) (_ BitVec 32) V!30695 V!30695 (_ BitVec 32) Int) ListLongMap!11321)

(assert (=> b!915725 (= lt!411500 (contains!4686 (getCurrentListMap!2875 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915726 () Bool)

(declare-fun res!617403 () Bool)

(assert (=> b!915726 (=> (not res!617403) (not e!513990))))

(declare-datatypes ((List!18432 0))(
  ( (Nil!18429) (Cons!18428 (h!19574 (_ BitVec 64)) (t!26036 List!18432)) )
))
(declare-fun arrayNoDuplicates!0 (array!54577 (_ BitVec 32) List!18432) Bool)

(assert (=> b!915726 (= res!617403 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18429))))

(declare-fun b!915727 () Bool)

(assert (=> b!915727 (= e!513992 tp_is_empty!19297)))

(declare-fun b!915722 () Bool)

(declare-fun e!513989 () Bool)

(assert (=> b!915722 (= e!513989 (and e!513991 mapRes!30702))))

(declare-fun condMapEmpty!30702 () Bool)

(declare-fun mapDefault!30702 () ValueCell!9167)

(assert (=> b!915722 (= condMapEmpty!30702 (= (arr!26233 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9167)) mapDefault!30702)))))

(declare-fun res!617402 () Bool)

(assert (=> start!78558 (=> (not res!617402) (not e!513990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78558 (= res!617402 (validMask!0 mask!1881))))

(assert (=> start!78558 e!513990))

(assert (=> start!78558 true))

(declare-fun array_inv!20552 (array!54575) Bool)

(assert (=> start!78558 (and (array_inv!20552 _values!1231) e!513989)))

(assert (=> start!78558 tp!58808))

(declare-fun array_inv!20553 (array!54577) Bool)

(assert (=> start!78558 (array_inv!20553 _keys!1487)))

(assert (=> start!78558 tp_is_empty!19297))

(declare-fun b!915728 () Bool)

(declare-fun res!617404 () Bool)

(assert (=> b!915728 (=> (not res!617404) (not e!513990))))

(assert (=> b!915728 (= res!617404 (and (= (size!26694 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26695 _keys!1487) (size!26694 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915729 () Bool)

(declare-fun res!617405 () Bool)

(assert (=> b!915729 (=> (not res!617405) (not e!513990))))

(assert (=> b!915729 (= res!617405 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26695 _keys!1487))))))

(assert (= (and start!78558 res!617402) b!915728))

(assert (= (and b!915728 res!617404) b!915723))

(assert (= (and b!915723 res!617401) b!915726))

(assert (= (and b!915726 res!617403) b!915729))

(assert (= (and b!915729 res!617405) b!915725))

(assert (= (and b!915722 condMapEmpty!30702) mapIsEmpty!30702))

(assert (= (and b!915722 (not condMapEmpty!30702)) mapNonEmpty!30702))

(get-info :version)

(assert (= (and mapNonEmpty!30702 ((_ is ValueCellFull!9167) mapValue!30702)) b!915727))

(assert (= (and b!915722 ((_ is ValueCellFull!9167) mapDefault!30702)) b!915724))

(assert (= start!78558 b!915722))

(declare-fun m!849397 () Bool)

(assert (=> b!915726 m!849397))

(declare-fun m!849399 () Bool)

(assert (=> mapNonEmpty!30702 m!849399))

(declare-fun m!849401 () Bool)

(assert (=> b!915723 m!849401))

(declare-fun m!849403 () Bool)

(assert (=> b!915725 m!849403))

(assert (=> b!915725 m!849403))

(declare-fun m!849405 () Bool)

(assert (=> b!915725 m!849405))

(declare-fun m!849407 () Bool)

(assert (=> start!78558 m!849407))

(declare-fun m!849409 () Bool)

(assert (=> start!78558 m!849409))

(declare-fun m!849411 () Bool)

(assert (=> start!78558 m!849411))

(check-sat (not start!78558) (not mapNonEmpty!30702) tp_is_empty!19297 (not b!915723) (not b!915726) b_and!27385 (not b_next!16789) (not b!915725))
(check-sat b_and!27385 (not b_next!16789))
