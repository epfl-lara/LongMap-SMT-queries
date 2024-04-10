; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78898 () Bool)

(assert start!78898)

(declare-fun b_free!17111 () Bool)

(declare-fun b_next!17111 () Bool)

(assert (=> start!78898 (= b_free!17111 (not b_next!17111))))

(declare-fun tp!59774 () Bool)

(declare-fun b_and!27959 () Bool)

(assert (=> start!78898 (= tp!59774 b_and!27959)))

(declare-fun b!922330 () Bool)

(declare-fun e!517521 () Bool)

(declare-fun e!517528 () Bool)

(assert (=> b!922330 (= e!517521 e!517528)))

(declare-fun res!621980 () Bool)

(assert (=> b!922330 (=> (not res!621980) (not e!517528))))

(declare-fun lt!414181 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922330 (= res!621980 (validKeyInArray!0 lt!414181))))

(declare-datatypes ((array!55214 0))(
  ( (array!55215 (arr!26552 (Array (_ BitVec 32) (_ BitVec 64))) (size!27011 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55214)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922330 (= lt!414181 (select (arr!26552 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922331 () Bool)

(declare-fun res!621979 () Bool)

(declare-fun e!517524 () Bool)

(assert (=> b!922331 (=> (not res!621979) (not e!517524))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55214 (_ BitVec 32)) Bool)

(assert (=> b!922331 (= res!621979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922332 () Bool)

(declare-fun e!517522 () Bool)

(declare-fun tp_is_empty!19619 () Bool)

(assert (=> b!922332 (= e!517522 tp_is_empty!19619)))

(declare-fun mapNonEmpty!31185 () Bool)

(declare-fun mapRes!31185 () Bool)

(declare-fun tp!59773 () Bool)

(assert (=> mapNonEmpty!31185 (= mapRes!31185 (and tp!59773 e!517522))))

(declare-datatypes ((V!31123 0))(
  ( (V!31124 (val!9860 Int)) )
))
(declare-datatypes ((ValueCell!9328 0))(
  ( (ValueCellFull!9328 (v!12378 V!31123)) (EmptyCell!9328) )
))
(declare-fun mapRest!31185 () (Array (_ BitVec 32) ValueCell!9328))

(declare-fun mapKey!31185 () (_ BitVec 32))

(declare-fun mapValue!31185 () ValueCell!9328)

(declare-datatypes ((array!55216 0))(
  ( (array!55217 (arr!26553 (Array (_ BitVec 32) ValueCell!9328)) (size!27012 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55216)

(assert (=> mapNonEmpty!31185 (= (arr!26553 _values!1231) (store mapRest!31185 mapKey!31185 mapValue!31185))))

(declare-fun res!621982 () Bool)

(assert (=> start!78898 (=> (not res!621982) (not e!517524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78898 (= res!621982 (validMask!0 mask!1881))))

(assert (=> start!78898 e!517524))

(assert (=> start!78898 true))

(assert (=> start!78898 tp_is_empty!19619))

(declare-fun e!517526 () Bool)

(declare-fun array_inv!20684 (array!55216) Bool)

(assert (=> start!78898 (and (array_inv!20684 _values!1231) e!517526)))

(assert (=> start!78898 tp!59774))

(declare-fun array_inv!20685 (array!55214) Bool)

(assert (=> start!78898 (array_inv!20685 _keys!1487)))

(declare-fun mapIsEmpty!31185 () Bool)

(assert (=> mapIsEmpty!31185 mapRes!31185))

(declare-fun e!517523 () Bool)

(declare-fun b!922333 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922333 (= e!517523 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!922334 () Bool)

(assert (=> b!922334 (= e!517524 e!517521)))

(declare-fun res!621975 () Bool)

(assert (=> b!922334 (=> (not res!621975) (not e!517521))))

(declare-datatypes ((tuple2!12828 0))(
  ( (tuple2!12829 (_1!6425 (_ BitVec 64)) (_2!6425 V!31123)) )
))
(declare-datatypes ((List!18632 0))(
  ( (Nil!18629) (Cons!18628 (h!19774 tuple2!12828) (t!26473 List!18632)) )
))
(declare-datatypes ((ListLongMap!11525 0))(
  ( (ListLongMap!11526 (toList!5778 List!18632)) )
))
(declare-fun lt!414177 () ListLongMap!11525)

(declare-fun contains!4841 (ListLongMap!11525 (_ BitVec 64)) Bool)

(assert (=> b!922334 (= res!621975 (contains!4841 lt!414177 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31123)

(declare-fun minValue!1173 () V!31123)

(declare-fun getCurrentListMap!3032 (array!55214 array!55216 (_ BitVec 32) (_ BitVec 32) V!31123 V!31123 (_ BitVec 32) Int) ListLongMap!11525)

(assert (=> b!922334 (= lt!414177 (getCurrentListMap!3032 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922335 () Bool)

(declare-fun e!517525 () Bool)

(assert (=> b!922335 (= e!517526 (and e!517525 mapRes!31185))))

(declare-fun condMapEmpty!31185 () Bool)

(declare-fun mapDefault!31185 () ValueCell!9328)

