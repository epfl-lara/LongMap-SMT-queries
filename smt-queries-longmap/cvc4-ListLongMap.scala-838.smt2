; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20128 () Bool)

(assert start!20128)

(declare-fun b_free!4787 () Bool)

(declare-fun b_next!4787 () Bool)

(assert (=> start!20128 (= b_free!4787 (not b_next!4787))))

(declare-fun tp!17393 () Bool)

(declare-fun b_and!11533 () Bool)

(assert (=> start!20128 (= tp!17393 b_and!11533)))

(declare-fun b!197354 () Bool)

(declare-fun res!93332 () Bool)

(declare-fun e!129880 () Bool)

(assert (=> b!197354 (=> (not res!93332) (not e!129880))))

(declare-datatypes ((array!8539 0))(
  ( (array!8540 (arr!4020 (Array (_ BitVec 32) (_ BitVec 64))) (size!4345 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8539)

(declare-datatypes ((List!2509 0))(
  ( (Nil!2506) (Cons!2505 (h!3147 (_ BitVec 64)) (t!7440 List!2509)) )
))
(declare-fun arrayNoDuplicates!0 (array!8539 (_ BitVec 32) List!2509) Bool)

(assert (=> b!197354 (= res!93332 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2506))))

(declare-fun b!197355 () Bool)

(declare-fun res!93330 () Bool)

(assert (=> b!197355 (=> (not res!93330) (not e!129880))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197355 (= res!93330 (= (select (arr!4020 _keys!825) i!601) k!843))))

(declare-fun b!197356 () Bool)

(declare-fun res!93333 () Bool)

(assert (=> b!197356 (=> (not res!93333) (not e!129880))))

(assert (=> b!197356 (= res!93333 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4345 _keys!825))))))

(declare-fun b!197357 () Bool)

(declare-fun e!129883 () Bool)

(declare-fun tp_is_empty!4643 () Bool)

(assert (=> b!197357 (= e!129883 tp_is_empty!4643)))

(declare-fun mapIsEmpty!8033 () Bool)

(declare-fun mapRes!8033 () Bool)

(assert (=> mapIsEmpty!8033 mapRes!8033))

(declare-fun b!197358 () Bool)

(declare-fun res!93328 () Bool)

(assert (=> b!197358 (=> (not res!93328) (not e!129880))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5837 0))(
  ( (V!5838 (val!2366 Int)) )
))
(declare-datatypes ((ValueCell!1978 0))(
  ( (ValueCellFull!1978 (v!4336 V!5837)) (EmptyCell!1978) )
))
(declare-datatypes ((array!8541 0))(
  ( (array!8542 (arr!4021 (Array (_ BitVec 32) ValueCell!1978)) (size!4346 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8541)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197358 (= res!93328 (and (= (size!4346 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4345 _keys!825) (size!4346 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197359 () Bool)

(declare-fun e!129881 () Bool)

(assert (=> b!197359 (= e!129881 (and e!129883 mapRes!8033))))

(declare-fun condMapEmpty!8033 () Bool)

(declare-fun mapDefault!8033 () ValueCell!1978)

