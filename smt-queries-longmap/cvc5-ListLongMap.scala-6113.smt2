; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78786 () Bool)

(assert start!78786)

(declare-fun b_free!16999 () Bool)

(declare-fun b_next!16999 () Bool)

(assert (=> start!78786 (= b_free!16999 (not b_next!16999))))

(declare-fun tp!59437 () Bool)

(declare-fun b_and!27735 () Bool)

(assert (=> start!78786 (= tp!59437 b_and!27735)))

(declare-fun res!620057 () Bool)

(declare-fun e!516154 () Bool)

(assert (=> start!78786 (=> (not res!620057) (not e!516154))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78786 (= res!620057 (validMask!0 mask!1881))))

(assert (=> start!78786 e!516154))

(assert (=> start!78786 true))

(declare-fun tp_is_empty!19507 () Bool)

(assert (=> start!78786 tp_is_empty!19507))

(declare-datatypes ((V!30975 0))(
  ( (V!30976 (val!9804 Int)) )
))
(declare-datatypes ((ValueCell!9272 0))(
  ( (ValueCellFull!9272 (v!12322 V!30975)) (EmptyCell!9272) )
))
(declare-datatypes ((array!54998 0))(
  ( (array!54999 (arr!26444 (Array (_ BitVec 32) ValueCell!9272)) (size!26903 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54998)

(declare-fun e!516153 () Bool)

(declare-fun array_inv!20612 (array!54998) Bool)

(assert (=> start!78786 (and (array_inv!20612 _values!1231) e!516153)))

(assert (=> start!78786 tp!59437))

(declare-datatypes ((array!55000 0))(
  ( (array!55001 (arr!26445 (Array (_ BitVec 32) (_ BitVec 64))) (size!26904 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55000)

(declare-fun array_inv!20613 (array!55000) Bool)

(assert (=> start!78786 (array_inv!20613 _keys!1487)))

(declare-fun b!919559 () Bool)

(declare-fun e!516150 () Bool)

(declare-fun e!516148 () Bool)

(assert (=> b!919559 (= e!516150 e!516148)))

(declare-fun res!620054 () Bool)

(assert (=> b!919559 (=> (not res!620054) (not e!516148))))

(declare-fun lt!412765 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919559 (= res!620054 (validKeyInArray!0 lt!412765))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919559 (= lt!412765 (select (arr!26445 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919560 () Bool)

(declare-fun res!620059 () Bool)

(assert (=> b!919560 (=> (not res!620059) (not e!516154))))

(assert (=> b!919560 (= res!620059 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26904 _keys!1487))))))

(declare-fun b!919561 () Bool)

(declare-fun e!516152 () Bool)

(declare-fun mapRes!31017 () Bool)

(assert (=> b!919561 (= e!516153 (and e!516152 mapRes!31017))))

(declare-fun condMapEmpty!31017 () Bool)

(declare-fun mapDefault!31017 () ValueCell!9272)

