; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79212 () Bool)

(assert start!79212)

(declare-fun b_free!17425 () Bool)

(declare-fun b_next!17425 () Bool)

(assert (=> start!79212 (= b_free!17425 (not b_next!17425))))

(declare-fun tp!60715 () Bool)

(declare-fun b_and!28491 () Bool)

(assert (=> start!79212 (= tp!60715 b_and!28491)))

(declare-fun mapIsEmpty!31656 () Bool)

(declare-fun mapRes!31656 () Bool)

(assert (=> mapIsEmpty!31656 mapRes!31656))

(declare-fun b!930028 () Bool)

(declare-fun res!626314 () Bool)

(declare-fun e!522248 () Bool)

(assert (=> b!930028 (=> (not res!626314) (not e!522248))))

(declare-datatypes ((array!55814 0))(
  ( (array!55815 (arr!26852 (Array (_ BitVec 32) (_ BitVec 64))) (size!27311 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55814)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31543 0))(
  ( (V!31544 (val!10017 Int)) )
))
(declare-datatypes ((ValueCell!9485 0))(
  ( (ValueCellFull!9485 (v!12535 V!31543)) (EmptyCell!9485) )
))
(declare-datatypes ((array!55816 0))(
  ( (array!55817 (arr!26853 (Array (_ BitVec 32) ValueCell!9485)) (size!27312 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55816)

(assert (=> b!930028 (= res!626314 (and (= (size!27312 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27311 _keys!1487) (size!27312 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930029 () Bool)

(declare-fun e!522251 () Bool)

(assert (=> b!930029 (= e!522251 false)))

(declare-fun lt!419172 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31543)

(declare-fun minValue!1173 () V!31543)

(declare-datatypes ((tuple2!13102 0))(
  ( (tuple2!13103 (_1!6562 (_ BitVec 64)) (_2!6562 V!31543)) )
))
(declare-datatypes ((List!18894 0))(
  ( (Nil!18891) (Cons!18890 (h!20036 tuple2!13102) (t!26951 List!18894)) )
))
(declare-datatypes ((ListLongMap!11799 0))(
  ( (ListLongMap!11800 (toList!5915 List!18894)) )
))
(declare-fun contains!4967 (ListLongMap!11799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3158 (array!55814 array!55816 (_ BitVec 32) (_ BitVec 32) V!31543 V!31543 (_ BitVec 32) Int) ListLongMap!11799)

(assert (=> b!930029 (= lt!419172 (contains!4967 (getCurrentListMap!3158 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!930030 () Bool)

(declare-fun res!626311 () Bool)

(assert (=> b!930030 (=> (not res!626311) (not e!522248))))

(declare-datatypes ((List!18895 0))(
  ( (Nil!18892) (Cons!18891 (h!20037 (_ BitVec 64)) (t!26952 List!18895)) )
))
(declare-fun arrayNoDuplicates!0 (array!55814 (_ BitVec 32) List!18895) Bool)

(assert (=> b!930030 (= res!626311 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18892))))

(declare-fun mapNonEmpty!31656 () Bool)

(declare-fun tp!60716 () Bool)

(declare-fun e!522253 () Bool)

(assert (=> mapNonEmpty!31656 (= mapRes!31656 (and tp!60716 e!522253))))

(declare-fun mapKey!31656 () (_ BitVec 32))

(declare-fun mapRest!31656 () (Array (_ BitVec 32) ValueCell!9485))

(declare-fun mapValue!31656 () ValueCell!9485)

(assert (=> mapNonEmpty!31656 (= (arr!26853 _values!1231) (store mapRest!31656 mapKey!31656 mapValue!31656))))

(declare-fun res!626312 () Bool)

(assert (=> start!79212 (=> (not res!626312) (not e!522248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79212 (= res!626312 (validMask!0 mask!1881))))

(assert (=> start!79212 e!522248))

(assert (=> start!79212 true))

(declare-fun tp_is_empty!19933 () Bool)

(assert (=> start!79212 tp_is_empty!19933))

(declare-fun e!522250 () Bool)

(declare-fun array_inv!20894 (array!55816) Bool)

(assert (=> start!79212 (and (array_inv!20894 _values!1231) e!522250)))

(assert (=> start!79212 tp!60715))

(declare-fun array_inv!20895 (array!55814) Bool)

(assert (=> start!79212 (array_inv!20895 _keys!1487)))

(declare-fun b!930031 () Bool)

(declare-fun res!626315 () Bool)

(assert (=> b!930031 (=> (not res!626315) (not e!522248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55814 (_ BitVec 32)) Bool)

(assert (=> b!930031 (= res!626315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930032 () Bool)

(declare-fun e!522249 () Bool)

(assert (=> b!930032 (= e!522250 (and e!522249 mapRes!31656))))

(declare-fun condMapEmpty!31656 () Bool)

(declare-fun mapDefault!31656 () ValueCell!9485)

