; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78796 () Bool)

(assert start!78796)

(declare-fun b_free!17009 () Bool)

(declare-fun b_next!17009 () Bool)

(assert (=> start!78796 (= b_free!17009 (not b_next!17009))))

(declare-fun tp!59468 () Bool)

(declare-fun b_and!27755 () Bool)

(assert (=> start!78796 (= tp!59468 b_and!27755)))

(declare-fun b!919764 () Bool)

(declare-fun res!620203 () Bool)

(declare-fun e!516259 () Bool)

(assert (=> b!919764 (=> (not res!620203) (not e!516259))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919764 (= res!620203 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31032 () Bool)

(declare-fun mapRes!31032 () Bool)

(assert (=> mapIsEmpty!31032 mapRes!31032))

(declare-fun b!919765 () Bool)

(declare-fun res!620209 () Bool)

(assert (=> b!919765 (=> (not res!620209) (not e!516259))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919765 (= res!620209 (validKeyInArray!0 k!1099))))

(declare-fun b!919766 () Bool)

(declare-fun res!620205 () Bool)

(declare-fun e!516258 () Bool)

(assert (=> b!919766 (=> (not res!620205) (not e!516258))))

(declare-datatypes ((array!55016 0))(
  ( (array!55017 (arr!26453 (Array (_ BitVec 32) (_ BitVec 64))) (size!26912 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55016)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30987 0))(
  ( (V!30988 (val!9809 Int)) )
))
(declare-datatypes ((ValueCell!9277 0))(
  ( (ValueCellFull!9277 (v!12327 V!30987)) (EmptyCell!9277) )
))
(declare-datatypes ((array!55018 0))(
  ( (array!55019 (arr!26454 (Array (_ BitVec 32) ValueCell!9277)) (size!26913 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55018)

(assert (=> b!919766 (= res!620205 (and (= (size!26913 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26912 _keys!1487) (size!26913 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919767 () Bool)

(declare-fun e!516257 () Bool)

(declare-fun e!516256 () Bool)

(assert (=> b!919767 (= e!516257 (and e!516256 mapRes!31032))))

(declare-fun condMapEmpty!31032 () Bool)

(declare-fun mapDefault!31032 () ValueCell!9277)

