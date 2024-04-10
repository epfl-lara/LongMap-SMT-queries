; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79132 () Bool)

(assert start!79132)

(declare-fun b_free!17345 () Bool)

(declare-fun b_next!17345 () Bool)

(assert (=> start!79132 (= b_free!17345 (not b_next!17345))))

(declare-fun tp!60475 () Bool)

(declare-fun b_and!28411 () Bool)

(assert (=> start!79132 (= tp!60475 b_and!28411)))

(declare-fun b!928809 () Bool)

(declare-fun e!521530 () Bool)

(declare-fun e!521532 () Bool)

(assert (=> b!928809 (= e!521530 e!521532)))

(declare-fun res!625456 () Bool)

(assert (=> b!928809 (=> (not res!625456) (not e!521532))))

(declare-datatypes ((V!31435 0))(
  ( (V!31436 (val!9977 Int)) )
))
(declare-datatypes ((tuple2!13036 0))(
  ( (tuple2!13037 (_1!6529 (_ BitVec 64)) (_2!6529 V!31435)) )
))
(declare-datatypes ((List!18834 0))(
  ( (Nil!18831) (Cons!18830 (h!19976 tuple2!13036) (t!26891 List!18834)) )
))
(declare-datatypes ((ListLongMap!11733 0))(
  ( (ListLongMap!11734 (toList!5882 List!18834)) )
))
(declare-fun lt!418941 () ListLongMap!11733)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4939 (ListLongMap!11733 (_ BitVec 64)) Bool)

(assert (=> b!928809 (= res!625456 (contains!4939 lt!418941 k!1099))))

(declare-datatypes ((array!55660 0))(
  ( (array!55661 (arr!26775 (Array (_ BitVec 32) (_ BitVec 64))) (size!27234 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55660)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9445 0))(
  ( (ValueCellFull!9445 (v!12495 V!31435)) (EmptyCell!9445) )
))
(declare-datatypes ((array!55662 0))(
  ( (array!55663 (arr!26776 (Array (_ BitVec 32) ValueCell!9445)) (size!27235 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55662)

(declare-fun zeroValue!1173 () V!31435)

(declare-fun minValue!1173 () V!31435)

(declare-fun getCurrentListMap!3130 (array!55660 array!55662 (_ BitVec 32) (_ BitVec 32) V!31435 V!31435 (_ BitVec 32) Int) ListLongMap!11733)

(assert (=> b!928809 (= lt!418941 (getCurrentListMap!3130 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928810 () Bool)

(declare-fun e!521533 () Bool)

(declare-fun tp_is_empty!19853 () Bool)

(assert (=> b!928810 (= e!521533 tp_is_empty!19853)))

(declare-fun mapIsEmpty!31536 () Bool)

(declare-fun mapRes!31536 () Bool)

(assert (=> mapIsEmpty!31536 mapRes!31536))

(declare-fun b!928811 () Bool)

(declare-fun res!625454 () Bool)

(assert (=> b!928811 (=> (not res!625454) (not e!521530))))

(assert (=> b!928811 (= res!625454 (and (= (size!27235 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27234 _keys!1487) (size!27235 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928812 () Bool)

(assert (=> b!928812 (= e!521532 false)))

(declare-fun lt!418942 () V!31435)

(declare-fun apply!711 (ListLongMap!11733 (_ BitVec 64)) V!31435)

(assert (=> b!928812 (= lt!418942 (apply!711 lt!418941 k!1099))))

(declare-fun mapNonEmpty!31536 () Bool)

(declare-fun tp!60476 () Bool)

(assert (=> mapNonEmpty!31536 (= mapRes!31536 (and tp!60476 e!521533))))

(declare-fun mapKey!31536 () (_ BitVec 32))

(declare-fun mapValue!31536 () ValueCell!9445)

(declare-fun mapRest!31536 () (Array (_ BitVec 32) ValueCell!9445))

(assert (=> mapNonEmpty!31536 (= (arr!26776 _values!1231) (store mapRest!31536 mapKey!31536 mapValue!31536))))

(declare-fun b!928814 () Bool)

(declare-fun res!625451 () Bool)

(assert (=> b!928814 (=> (not res!625451) (not e!521530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55660 (_ BitVec 32)) Bool)

(assert (=> b!928814 (= res!625451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928815 () Bool)

(declare-fun res!625452 () Bool)

(assert (=> b!928815 (=> (not res!625452) (not e!521530))))

(declare-datatypes ((List!18835 0))(
  ( (Nil!18832) (Cons!18831 (h!19977 (_ BitVec 64)) (t!26892 List!18835)) )
))
(declare-fun arrayNoDuplicates!0 (array!55660 (_ BitVec 32) List!18835) Bool)

(assert (=> b!928815 (= res!625452 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18832))))

(declare-fun b!928816 () Bool)

(declare-fun res!625455 () Bool)

(assert (=> b!928816 (=> (not res!625455) (not e!521530))))

(assert (=> b!928816 (= res!625455 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27234 _keys!1487))))))

(declare-fun b!928817 () Bool)

(declare-fun e!521528 () Bool)

(assert (=> b!928817 (= e!521528 tp_is_empty!19853)))

(declare-fun b!928813 () Bool)

(declare-fun e!521531 () Bool)

(assert (=> b!928813 (= e!521531 (and e!521528 mapRes!31536))))

(declare-fun condMapEmpty!31536 () Bool)

(declare-fun mapDefault!31536 () ValueCell!9445)

