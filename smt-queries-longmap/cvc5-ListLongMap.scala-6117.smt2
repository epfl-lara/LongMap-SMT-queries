; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78810 () Bool)

(assert start!78810)

(declare-fun b_free!17023 () Bool)

(declare-fun b_next!17023 () Bool)

(assert (=> start!78810 (= b_free!17023 (not b_next!17023))))

(declare-fun tp!59510 () Bool)

(declare-fun b_and!27783 () Bool)

(assert (=> start!78810 (= tp!59510 b_and!27783)))

(declare-fun b!920051 () Bool)

(declare-fun res!620412 () Bool)

(declare-fun e!516404 () Bool)

(assert (=> b!920051 (=> (not res!620412) (not e!516404))))

(declare-datatypes ((array!55042 0))(
  ( (array!55043 (arr!26466 (Array (_ BitVec 32) (_ BitVec 64))) (size!26925 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55042)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55042 (_ BitVec 32)) Bool)

(assert (=> b!920051 (= res!620412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31053 () Bool)

(declare-fun mapRes!31053 () Bool)

(assert (=> mapIsEmpty!31053 mapRes!31053))

(declare-fun b!920052 () Bool)

(declare-fun res!620414 () Bool)

(assert (=> b!920052 (=> (not res!620414) (not e!516404))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31007 0))(
  ( (V!31008 (val!9816 Int)) )
))
(declare-datatypes ((ValueCell!9284 0))(
  ( (ValueCellFull!9284 (v!12334 V!31007)) (EmptyCell!9284) )
))
(declare-datatypes ((array!55044 0))(
  ( (array!55045 (arr!26467 (Array (_ BitVec 32) ValueCell!9284)) (size!26926 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55044)

(assert (=> b!920052 (= res!620414 (and (= (size!26926 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26925 _keys!1487) (size!26926 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!620419 () Bool)

(assert (=> start!78810 (=> (not res!620419) (not e!516404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78810 (= res!620419 (validMask!0 mask!1881))))

(assert (=> start!78810 e!516404))

(assert (=> start!78810 true))

(declare-fun tp_is_empty!19531 () Bool)

(assert (=> start!78810 tp_is_empty!19531))

(declare-fun e!516402 () Bool)

(declare-fun array_inv!20626 (array!55044) Bool)

(assert (=> start!78810 (and (array_inv!20626 _values!1231) e!516402)))

(assert (=> start!78810 tp!59510))

(declare-fun array_inv!20627 (array!55042) Bool)

(assert (=> start!78810 (array_inv!20627 _keys!1487)))

(declare-fun b!920053 () Bool)

(declare-fun e!516406 () Bool)

(declare-fun e!516401 () Bool)

(assert (=> b!920053 (= e!516406 e!516401)))

(declare-fun res!620417 () Bool)

(assert (=> b!920053 (=> (not res!620417) (not e!516401))))

(declare-fun lt!413018 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920053 (= res!620417 (validKeyInArray!0 lt!413018))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920053 (= lt!413018 (select (arr!26466 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920054 () Bool)

(declare-fun res!620416 () Bool)

(assert (=> b!920054 (=> (not res!620416) (not e!516406))))

(assert (=> b!920054 (= res!620416 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920055 () Bool)

(declare-fun res!620411 () Bool)

(assert (=> b!920055 (=> (not res!620411) (not e!516406))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!920055 (= res!620411 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31053 () Bool)

(declare-fun tp!59509 () Bool)

(declare-fun e!516405 () Bool)

(assert (=> mapNonEmpty!31053 (= mapRes!31053 (and tp!59509 e!516405))))

(declare-fun mapRest!31053 () (Array (_ BitVec 32) ValueCell!9284))

(declare-fun mapKey!31053 () (_ BitVec 32))

(declare-fun mapValue!31053 () ValueCell!9284)

(assert (=> mapNonEmpty!31053 (= (arr!26467 _values!1231) (store mapRest!31053 mapKey!31053 mapValue!31053))))

(declare-fun b!920056 () Bool)

(declare-fun res!620413 () Bool)

(assert (=> b!920056 (=> (not res!620413) (not e!516404))))

(assert (=> b!920056 (= res!620413 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26925 _keys!1487))))))

(declare-fun b!920057 () Bool)

(declare-fun e!516400 () Bool)

(assert (=> b!920057 (= e!516402 (and e!516400 mapRes!31053))))

(declare-fun condMapEmpty!31053 () Bool)

(declare-fun mapDefault!31053 () ValueCell!9284)

