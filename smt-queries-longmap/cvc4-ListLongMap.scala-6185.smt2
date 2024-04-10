; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79222 () Bool)

(assert start!79222)

(declare-fun b_free!17435 () Bool)

(declare-fun b_next!17435 () Bool)

(assert (=> start!79222 (= b_free!17435 (not b_next!17435))))

(declare-fun tp!60745 () Bool)

(declare-fun b_and!28501 () Bool)

(assert (=> start!79222 (= tp!60745 b_and!28501)))

(declare-fun b!930201 () Bool)

(declare-fun res!626445 () Bool)

(declare-fun e!522341 () Bool)

(assert (=> b!930201 (=> (not res!626445) (not e!522341))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55834 0))(
  ( (array!55835 (arr!26862 (Array (_ BitVec 32) (_ BitVec 64))) (size!27321 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55834)

(assert (=> b!930201 (= res!626445 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27321 _keys!1487))))))

(declare-fun b!930202 () Bool)

(declare-fun res!626446 () Bool)

(assert (=> b!930202 (=> (not res!626446) (not e!522341))))

(declare-datatypes ((List!18904 0))(
  ( (Nil!18901) (Cons!18900 (h!20046 (_ BitVec 64)) (t!26961 List!18904)) )
))
(declare-fun arrayNoDuplicates!0 (array!55834 (_ BitVec 32) List!18904) Bool)

(assert (=> b!930202 (= res!626446 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18901))))

(declare-fun b!930203 () Bool)

(declare-fun res!626441 () Bool)

(declare-fun e!522339 () Bool)

(assert (=> b!930203 (=> (not res!626441) (not e!522339))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31555 0))(
  ( (V!31556 (val!10022 Int)) )
))
(declare-datatypes ((tuple2!13112 0))(
  ( (tuple2!13113 (_1!6567 (_ BitVec 64)) (_2!6567 V!31555)) )
))
(declare-datatypes ((List!18905 0))(
  ( (Nil!18902) (Cons!18901 (h!20047 tuple2!13112) (t!26962 List!18905)) )
))
(declare-datatypes ((ListLongMap!11809 0))(
  ( (ListLongMap!11810 (toList!5920 List!18905)) )
))
(declare-fun lt!419194 () ListLongMap!11809)

(declare-fun v!791 () V!31555)

(declare-fun apply!742 (ListLongMap!11809 (_ BitVec 64)) V!31555)

(assert (=> b!930203 (= res!626441 (= (apply!742 lt!419194 k!1099) v!791))))

(declare-fun b!930204 () Bool)

(declare-fun e!522343 () Bool)

(declare-fun tp_is_empty!19943 () Bool)

(assert (=> b!930204 (= e!522343 tp_is_empty!19943)))

(declare-fun b!930205 () Bool)

(assert (=> b!930205 (= e!522341 e!522339)))

(declare-fun res!626439 () Bool)

(assert (=> b!930205 (=> (not res!626439) (not e!522339))))

(declare-fun contains!4971 (ListLongMap!11809 (_ BitVec 64)) Bool)

(assert (=> b!930205 (= res!626439 (contains!4971 lt!419194 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9490 0))(
  ( (ValueCellFull!9490 (v!12540 V!31555)) (EmptyCell!9490) )
))
(declare-datatypes ((array!55836 0))(
  ( (array!55837 (arr!26863 (Array (_ BitVec 32) ValueCell!9490)) (size!27322 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55836)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31555)

(declare-fun minValue!1173 () V!31555)

(declare-fun getCurrentListMap!3162 (array!55834 array!55836 (_ BitVec 32) (_ BitVec 32) V!31555 V!31555 (_ BitVec 32) Int) ListLongMap!11809)

(assert (=> b!930205 (= lt!419194 (getCurrentListMap!3162 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31671 () Bool)

(declare-fun mapRes!31671 () Bool)

(declare-fun tp!60746 () Bool)

(assert (=> mapNonEmpty!31671 (= mapRes!31671 (and tp!60746 e!522343))))

(declare-fun mapRest!31671 () (Array (_ BitVec 32) ValueCell!9490))

(declare-fun mapValue!31671 () ValueCell!9490)

(declare-fun mapKey!31671 () (_ BitVec 32))

(assert (=> mapNonEmpty!31671 (= (arr!26863 _values!1231) (store mapRest!31671 mapKey!31671 mapValue!31671))))

(declare-fun b!930206 () Bool)

(declare-fun res!626440 () Bool)

(assert (=> b!930206 (=> (not res!626440) (not e!522339))))

(assert (=> b!930206 (= res!626440 (contains!4971 (getCurrentListMap!3162 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!930207 () Bool)

(assert (=> b!930207 (= e!522339 (bvsgt #b00000000000000000000000000000000 (size!27321 _keys!1487)))))

(declare-fun b!930208 () Bool)

(declare-fun res!626444 () Bool)

(assert (=> b!930208 (=> (not res!626444) (not e!522341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55834 (_ BitVec 32)) Bool)

(assert (=> b!930208 (= res!626444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31671 () Bool)

(assert (=> mapIsEmpty!31671 mapRes!31671))

(declare-fun res!626443 () Bool)

(assert (=> start!79222 (=> (not res!626443) (not e!522341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79222 (= res!626443 (validMask!0 mask!1881))))

(assert (=> start!79222 e!522341))

(assert (=> start!79222 true))

(assert (=> start!79222 tp_is_empty!19943))

(declare-fun e!522342 () Bool)

(declare-fun array_inv!20904 (array!55836) Bool)

(assert (=> start!79222 (and (array_inv!20904 _values!1231) e!522342)))

(assert (=> start!79222 tp!60745))

(declare-fun array_inv!20905 (array!55834) Bool)

(assert (=> start!79222 (array_inv!20905 _keys!1487)))

(declare-fun b!930209 () Bool)

(declare-fun res!626438 () Bool)

(assert (=> b!930209 (=> (not res!626438) (not e!522341))))

(assert (=> b!930209 (= res!626438 (and (= (size!27322 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27321 _keys!1487) (size!27322 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930210 () Bool)

(declare-fun res!626442 () Bool)

(assert (=> b!930210 (=> (not res!626442) (not e!522339))))

(assert (=> b!930210 (= res!626442 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930211 () Bool)

(declare-fun e!522340 () Bool)

(assert (=> b!930211 (= e!522340 tp_is_empty!19943)))

(declare-fun b!930212 () Bool)

(assert (=> b!930212 (= e!522342 (and e!522340 mapRes!31671))))

(declare-fun condMapEmpty!31671 () Bool)

(declare-fun mapDefault!31671 () ValueCell!9490)

