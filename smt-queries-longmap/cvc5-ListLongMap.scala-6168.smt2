; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79116 () Bool)

(assert start!79116)

(declare-fun b_free!17329 () Bool)

(declare-fun b_next!17329 () Bool)

(assert (=> start!79116 (= b_free!17329 (not b_next!17329))))

(declare-fun tp!60428 () Bool)

(declare-fun b_and!28395 () Bool)

(assert (=> start!79116 (= tp!60428 b_and!28395)))

(declare-fun b!928593 () Bool)

(declare-fun e!521385 () Bool)

(declare-fun e!521387 () Bool)

(assert (=> b!928593 (= e!521385 e!521387)))

(declare-fun res!625309 () Bool)

(assert (=> b!928593 (=> (not res!625309) (not e!521387))))

(declare-datatypes ((V!31415 0))(
  ( (V!31416 (val!9969 Int)) )
))
(declare-datatypes ((tuple2!13026 0))(
  ( (tuple2!13027 (_1!6524 (_ BitVec 64)) (_2!6524 V!31415)) )
))
(declare-datatypes ((List!18824 0))(
  ( (Nil!18821) (Cons!18820 (h!19966 tuple2!13026) (t!26881 List!18824)) )
))
(declare-datatypes ((ListLongMap!11723 0))(
  ( (ListLongMap!11724 (toList!5877 List!18824)) )
))
(declare-fun lt!418893 () ListLongMap!11723)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4934 (ListLongMap!11723 (_ BitVec 64)) Bool)

(assert (=> b!928593 (= res!625309 (contains!4934 lt!418893 k!1099))))

(declare-datatypes ((array!55634 0))(
  ( (array!55635 (arr!26762 (Array (_ BitVec 32) (_ BitVec 64))) (size!27221 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55634)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9437 0))(
  ( (ValueCellFull!9437 (v!12487 V!31415)) (EmptyCell!9437) )
))
(declare-datatypes ((array!55636 0))(
  ( (array!55637 (arr!26763 (Array (_ BitVec 32) ValueCell!9437)) (size!27222 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55636)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31415)

(declare-fun minValue!1173 () V!31415)

(declare-fun getCurrentListMap!3125 (array!55634 array!55636 (_ BitVec 32) (_ BitVec 32) V!31415 V!31415 (_ BitVec 32) Int) ListLongMap!11723)

(assert (=> b!928593 (= lt!418893 (getCurrentListMap!3125 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928594 () Bool)

(declare-fun res!625308 () Bool)

(assert (=> b!928594 (=> (not res!625308) (not e!521385))))

(assert (=> b!928594 (= res!625308 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27221 _keys!1487))))))

(declare-fun res!625312 () Bool)

(assert (=> start!79116 (=> (not res!625312) (not e!521385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79116 (= res!625312 (validMask!0 mask!1881))))

(assert (=> start!79116 e!521385))

(assert (=> start!79116 true))

(declare-fun e!521388 () Bool)

(declare-fun array_inv!20834 (array!55636) Bool)

(assert (=> start!79116 (and (array_inv!20834 _values!1231) e!521388)))

(assert (=> start!79116 tp!60428))

(declare-fun array_inv!20835 (array!55634) Bool)

(assert (=> start!79116 (array_inv!20835 _keys!1487)))

(declare-fun tp_is_empty!19837 () Bool)

(assert (=> start!79116 tp_is_empty!19837))

(declare-fun mapIsEmpty!31512 () Bool)

(declare-fun mapRes!31512 () Bool)

(assert (=> mapIsEmpty!31512 mapRes!31512))

(declare-fun b!928595 () Bool)

(declare-fun e!521389 () Bool)

(assert (=> b!928595 (= e!521389 tp_is_empty!19837)))

(declare-fun mapNonEmpty!31512 () Bool)

(declare-fun tp!60427 () Bool)

(assert (=> mapNonEmpty!31512 (= mapRes!31512 (and tp!60427 e!521389))))

(declare-fun mapKey!31512 () (_ BitVec 32))

(declare-fun mapRest!31512 () (Array (_ BitVec 32) ValueCell!9437))

(declare-fun mapValue!31512 () ValueCell!9437)

(assert (=> mapNonEmpty!31512 (= (arr!26763 _values!1231) (store mapRest!31512 mapKey!31512 mapValue!31512))))

(declare-fun b!928596 () Bool)

(declare-fun e!521384 () Bool)

(assert (=> b!928596 (= e!521384 tp_is_empty!19837)))

(declare-fun b!928597 () Bool)

(declare-fun res!625311 () Bool)

(assert (=> b!928597 (=> (not res!625311) (not e!521385))))

(declare-datatypes ((List!18825 0))(
  ( (Nil!18822) (Cons!18821 (h!19967 (_ BitVec 64)) (t!26882 List!18825)) )
))
(declare-fun arrayNoDuplicates!0 (array!55634 (_ BitVec 32) List!18825) Bool)

(assert (=> b!928597 (= res!625311 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18822))))

(declare-fun b!928598 () Bool)

(declare-fun res!625310 () Bool)

(assert (=> b!928598 (=> (not res!625310) (not e!521385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55634 (_ BitVec 32)) Bool)

(assert (=> b!928598 (= res!625310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928599 () Bool)

(assert (=> b!928599 (= e!521388 (and e!521384 mapRes!31512))))

(declare-fun condMapEmpty!31512 () Bool)

(declare-fun mapDefault!31512 () ValueCell!9437)

