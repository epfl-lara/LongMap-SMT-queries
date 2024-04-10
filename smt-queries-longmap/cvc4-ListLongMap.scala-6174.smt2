; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79156 () Bool)

(assert start!79156)

(declare-fun b_free!17369 () Bool)

(declare-fun b_next!17369 () Bool)

(assert (=> start!79156 (= b_free!17369 (not b_next!17369))))

(declare-fun tp!60547 () Bool)

(declare-fun b_and!28435 () Bool)

(assert (=> start!79156 (= tp!60547 b_and!28435)))

(declare-fun res!625671 () Bool)

(declare-fun e!521747 () Bool)

(assert (=> start!79156 (=> (not res!625671) (not e!521747))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79156 (= res!625671 (validMask!0 mask!1881))))

(assert (=> start!79156 e!521747))

(assert (=> start!79156 true))

(declare-datatypes ((V!31467 0))(
  ( (V!31468 (val!9989 Int)) )
))
(declare-datatypes ((ValueCell!9457 0))(
  ( (ValueCellFull!9457 (v!12507 V!31467)) (EmptyCell!9457) )
))
(declare-datatypes ((array!55708 0))(
  ( (array!55709 (arr!26799 (Array (_ BitVec 32) ValueCell!9457)) (size!27258 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55708)

(declare-fun e!521745 () Bool)

(declare-fun array_inv!20858 (array!55708) Bool)

(assert (=> start!79156 (and (array_inv!20858 _values!1231) e!521745)))

(assert (=> start!79156 tp!60547))

(declare-datatypes ((array!55710 0))(
  ( (array!55711 (arr!26800 (Array (_ BitVec 32) (_ BitVec 64))) (size!27259 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55710)

(declare-fun array_inv!20859 (array!55710) Bool)

(assert (=> start!79156 (array_inv!20859 _keys!1487)))

(declare-fun tp_is_empty!19877 () Bool)

(assert (=> start!79156 tp_is_empty!19877))

(declare-fun b!929133 () Bool)

(declare-fun res!625670 () Bool)

(assert (=> b!929133 (=> (not res!625670) (not e!521747))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929133 (= res!625670 (and (= (size!27258 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27259 _keys!1487) (size!27258 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929134 () Bool)

(declare-fun e!521749 () Bool)

(assert (=> b!929134 (= e!521749 tp_is_empty!19877)))

(declare-fun b!929135 () Bool)

(declare-fun res!625672 () Bool)

(assert (=> b!929135 (=> (not res!625672) (not e!521747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55710 (_ BitVec 32)) Bool)

(assert (=> b!929135 (= res!625672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929136 () Bool)

(declare-fun e!521746 () Bool)

(assert (=> b!929136 (= e!521746 false)))

(declare-fun lt!419013 () V!31467)

(declare-datatypes ((tuple2!13058 0))(
  ( (tuple2!13059 (_1!6540 (_ BitVec 64)) (_2!6540 V!31467)) )
))
(declare-datatypes ((List!18853 0))(
  ( (Nil!18850) (Cons!18849 (h!19995 tuple2!13058) (t!26910 List!18853)) )
))
(declare-datatypes ((ListLongMap!11755 0))(
  ( (ListLongMap!11756 (toList!5893 List!18853)) )
))
(declare-fun lt!419014 () ListLongMap!11755)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!720 (ListLongMap!11755 (_ BitVec 64)) V!31467)

(assert (=> b!929136 (= lt!419013 (apply!720 lt!419014 k!1099))))

(declare-fun mapNonEmpty!31572 () Bool)

(declare-fun mapRes!31572 () Bool)

(declare-fun tp!60548 () Bool)

(assert (=> mapNonEmpty!31572 (= mapRes!31572 (and tp!60548 e!521749))))

(declare-fun mapKey!31572 () (_ BitVec 32))

(declare-fun mapRest!31572 () (Array (_ BitVec 32) ValueCell!9457))

(declare-fun mapValue!31572 () ValueCell!9457)

(assert (=> mapNonEmpty!31572 (= (arr!26799 _values!1231) (store mapRest!31572 mapKey!31572 mapValue!31572))))

(declare-fun mapIsEmpty!31572 () Bool)

(assert (=> mapIsEmpty!31572 mapRes!31572))

(declare-fun b!929137 () Bool)

(declare-fun e!521744 () Bool)

(assert (=> b!929137 (= e!521745 (and e!521744 mapRes!31572))))

(declare-fun condMapEmpty!31572 () Bool)

(declare-fun mapDefault!31572 () ValueCell!9457)

