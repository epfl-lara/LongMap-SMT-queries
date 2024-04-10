; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78730 () Bool)

(assert start!78730)

(declare-fun b_free!16943 () Bool)

(declare-fun b_next!16943 () Bool)

(assert (=> start!78730 (= b_free!16943 (not b_next!16943))))

(declare-fun tp!59270 () Bool)

(declare-fun b_and!27623 () Bool)

(assert (=> start!78730 (= tp!59270 b_and!27623)))

(declare-fun b!918411 () Bool)

(declare-fun res!619213 () Bool)

(declare-fun e!515561 () Bool)

(assert (=> b!918411 (=> (not res!619213) (not e!515561))))

(declare-datatypes ((array!54886 0))(
  ( (array!54887 (arr!26388 (Array (_ BitVec 32) (_ BitVec 64))) (size!26847 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54886)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30899 0))(
  ( (V!30900 (val!9776 Int)) )
))
(declare-datatypes ((ValueCell!9244 0))(
  ( (ValueCellFull!9244 (v!12294 V!30899)) (EmptyCell!9244) )
))
(declare-datatypes ((array!54888 0))(
  ( (array!54889 (arr!26389 (Array (_ BitVec 32) ValueCell!9244)) (size!26848 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54888)

(assert (=> b!918411 (= res!619213 (and (= (size!26848 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26847 _keys!1487) (size!26848 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918412 () Bool)

(declare-fun e!515565 () Bool)

(declare-fun e!515564 () Bool)

(assert (=> b!918412 (= e!515565 e!515564)))

(declare-fun res!619214 () Bool)

(assert (=> b!918412 (=> (not res!619214) (not e!515564))))

(declare-fun lt!412227 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918412 (= res!619214 (validKeyInArray!0 lt!412227))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918412 (= lt!412227 (select (arr!26388 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!30933 () Bool)

(declare-fun mapRes!30933 () Bool)

(assert (=> mapIsEmpty!30933 mapRes!30933))

(declare-fun b!918413 () Bool)

(declare-fun e!515563 () Bool)

(declare-fun tp_is_empty!19451 () Bool)

(assert (=> b!918413 (= e!515563 tp_is_empty!19451)))

(declare-fun b!918414 () Bool)

(declare-fun e!515562 () Bool)

(declare-fun e!515566 () Bool)

(assert (=> b!918414 (= e!515562 (and e!515566 mapRes!30933))))

(declare-fun condMapEmpty!30933 () Bool)

(declare-fun mapDefault!30933 () ValueCell!9244)

