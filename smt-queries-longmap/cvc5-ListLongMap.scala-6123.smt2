; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78846 () Bool)

(assert start!78846)

(declare-fun b_free!17059 () Bool)

(declare-fun b_next!17059 () Bool)

(assert (=> start!78846 (= b_free!17059 (not b_next!17059))))

(declare-fun tp!59618 () Bool)

(declare-fun b_and!27855 () Bool)

(assert (=> start!78846 (= tp!59618 b_and!27855)))

(declare-fun b!920979 () Bool)

(declare-fun res!621072 () Bool)

(declare-fun e!516857 () Bool)

(assert (=> b!920979 (=> (not res!621072) (not e!516857))))

(declare-datatypes ((array!55114 0))(
  ( (array!55115 (arr!26502 (Array (_ BitVec 32) (_ BitVec 64))) (size!26961 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55114)

(declare-datatypes ((List!18589 0))(
  ( (Nil!18586) (Cons!18585 (h!19731 (_ BitVec 64)) (t!26378 List!18589)) )
))
(declare-fun arrayNoDuplicates!0 (array!55114 (_ BitVec 32) List!18589) Bool)

(assert (=> b!920979 (= res!621072 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18586))))

(declare-fun b!920980 () Bool)

(declare-fun e!516859 () Bool)

(declare-fun tp_is_empty!19567 () Bool)

(assert (=> b!920980 (= e!516859 tp_is_empty!19567)))

(declare-fun b!920981 () Bool)

(declare-fun e!516858 () Bool)

(declare-fun e!516854 () Bool)

(assert (=> b!920981 (= e!516858 e!516854)))

(declare-fun res!621076 () Bool)

(assert (=> b!920981 (=> (not res!621076) (not e!516854))))

(declare-fun lt!413472 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920981 (= res!621076 (validKeyInArray!0 lt!413472))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920981 (= lt!413472 (select (arr!26502 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920982 () Bool)

(declare-fun res!621065 () Bool)

(assert (=> b!920982 (=> (not res!621065) (not e!516858))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31055 0))(
  ( (V!31056 (val!9834 Int)) )
))
(declare-fun v!791 () V!31055)

(declare-datatypes ((tuple2!12786 0))(
  ( (tuple2!12787 (_1!6404 (_ BitVec 64)) (_2!6404 V!31055)) )
))
(declare-datatypes ((List!18590 0))(
  ( (Nil!18587) (Cons!18586 (h!19732 tuple2!12786) (t!26379 List!18590)) )
))
(declare-datatypes ((ListLongMap!11483 0))(
  ( (ListLongMap!11484 (toList!5757 List!18590)) )
))
(declare-fun lt!413471 () ListLongMap!11483)

(declare-fun apply!598 (ListLongMap!11483 (_ BitVec 64)) V!31055)

(assert (=> b!920982 (= res!621065 (= (apply!598 lt!413471 k!1099) v!791))))

(declare-fun b!920983 () Bool)

(declare-fun res!621064 () Bool)

(declare-fun e!516856 () Bool)

(assert (=> b!920983 (=> res!621064 e!516856)))

(declare-fun noDuplicate!1338 (List!18589) Bool)

(assert (=> b!920983 (= res!621064 (not (noDuplicate!1338 Nil!18586)))))

(declare-fun b!920984 () Bool)

(declare-fun e!516861 () Bool)

(assert (=> b!920984 (= e!516861 tp_is_empty!19567)))

(declare-fun res!621075 () Bool)

(assert (=> start!78846 (=> (not res!621075) (not e!516857))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78846 (= res!621075 (validMask!0 mask!1881))))

(assert (=> start!78846 e!516857))

(assert (=> start!78846 true))

(assert (=> start!78846 tp_is_empty!19567))

(declare-datatypes ((ValueCell!9302 0))(
  ( (ValueCellFull!9302 (v!12352 V!31055)) (EmptyCell!9302) )
))
(declare-datatypes ((array!55116 0))(
  ( (array!55117 (arr!26503 (Array (_ BitVec 32) ValueCell!9302)) (size!26962 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55116)

(declare-fun e!516862 () Bool)

(declare-fun array_inv!20652 (array!55116) Bool)

(assert (=> start!78846 (and (array_inv!20652 _values!1231) e!516862)))

(assert (=> start!78846 tp!59618))

(declare-fun array_inv!20653 (array!55114) Bool)

(assert (=> start!78846 (array_inv!20653 _keys!1487)))

(declare-fun b!920985 () Bool)

(declare-fun e!516860 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920985 (= e!516860 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31107 () Bool)

(declare-fun mapRes!31107 () Bool)

(declare-fun tp!59617 () Bool)

(assert (=> mapNonEmpty!31107 (= mapRes!31107 (and tp!59617 e!516859))))

(declare-fun mapValue!31107 () ValueCell!9302)

(declare-fun mapRest!31107 () (Array (_ BitVec 32) ValueCell!9302))

(declare-fun mapKey!31107 () (_ BitVec 32))

(assert (=> mapNonEmpty!31107 (= (arr!26503 _values!1231) (store mapRest!31107 mapKey!31107 mapValue!31107))))

(declare-fun b!920986 () Bool)

(declare-fun res!621069 () Bool)

(assert (=> b!920986 (=> (not res!621069) (not e!516857))))

(assert (=> b!920986 (= res!621069 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26961 _keys!1487))))))

(declare-fun b!920987 () Bool)

(assert (=> b!920987 (= e!516856 true)))

(declare-fun lt!413477 () Bool)

(declare-fun contains!4810 (List!18589 (_ BitVec 64)) Bool)

(assert (=> b!920987 (= lt!413477 (contains!4810 Nil!18586 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920988 () Bool)

(declare-fun res!621073 () Bool)

(assert (=> b!920988 (=> (not res!621073) (not e!516858))))

(assert (=> b!920988 (= res!621073 (validKeyInArray!0 k!1099))))

(declare-fun b!920989 () Bool)

(declare-fun res!621074 () Bool)

(assert (=> b!920989 (=> res!621074 e!516856)))

(assert (=> b!920989 (= res!621074 (contains!4810 Nil!18586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920990 () Bool)

(assert (=> b!920990 (= e!516862 (and e!516861 mapRes!31107))))

(declare-fun condMapEmpty!31107 () Bool)

(declare-fun mapDefault!31107 () ValueCell!9302)

