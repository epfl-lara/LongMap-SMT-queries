; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79306 () Bool)

(assert start!79306)

(declare-fun b_free!17519 () Bool)

(declare-fun b_next!17519 () Bool)

(assert (=> start!79306 (= b_free!17519 (not b_next!17519))))

(declare-fun tp!60997 () Bool)

(declare-fun b_and!28589 () Bool)

(assert (=> start!79306 (= tp!60997 b_and!28589)))

(declare-fun b!931455 () Bool)

(declare-fun res!627318 () Bool)

(declare-fun e!523103 () Bool)

(assert (=> b!931455 (=> (not res!627318) (not e!523103))))

(declare-datatypes ((array!55994 0))(
  ( (array!55995 (arr!26942 (Array (_ BitVec 32) (_ BitVec 64))) (size!27401 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55994)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55994 (_ BitVec 32)) Bool)

(assert (=> b!931455 (= res!627318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931456 () Bool)

(declare-fun res!627310 () Bool)

(assert (=> b!931456 (=> (not res!627310) (not e!523103))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31667 0))(
  ( (V!31668 (val!10064 Int)) )
))
(declare-datatypes ((ValueCell!9532 0))(
  ( (ValueCellFull!9532 (v!12582 V!31667)) (EmptyCell!9532) )
))
(declare-datatypes ((array!55996 0))(
  ( (array!55997 (arr!26943 (Array (_ BitVec 32) ValueCell!9532)) (size!27402 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55996)

(assert (=> b!931456 (= res!627310 (and (= (size!27402 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27401 _keys!1487) (size!27402 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31797 () Bool)

(declare-fun mapRes!31797 () Bool)

(assert (=> mapIsEmpty!31797 mapRes!31797))

(declare-fun b!931457 () Bool)

(declare-fun res!627312 () Bool)

(declare-fun e!523108 () Bool)

(assert (=> b!931457 (=> (not res!627312) (not e!523108))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931457 (= res!627312 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931458 () Bool)

(declare-fun e!523107 () Bool)

(assert (=> b!931458 (= e!523108 e!523107)))

(declare-fun res!627315 () Bool)

(assert (=> b!931458 (=> (not res!627315) (not e!523107))))

(declare-fun lt!419437 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931458 (= res!627315 (validKeyInArray!0 lt!419437))))

(assert (=> b!931458 (= lt!419437 (select (arr!26942 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931459 () Bool)

(declare-fun e!523105 () Bool)

(declare-fun e!523102 () Bool)

(assert (=> b!931459 (= e!523105 (and e!523102 mapRes!31797))))

(declare-fun condMapEmpty!31797 () Bool)

(declare-fun mapDefault!31797 () ValueCell!9532)

