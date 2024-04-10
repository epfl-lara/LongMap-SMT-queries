; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37050 () Bool)

(assert start!37050)

(declare-fun b_free!8177 () Bool)

(declare-fun b_next!8177 () Bool)

(assert (=> start!37050 (= b_free!8177 (not b_next!8177))))

(declare-fun tp!29247 () Bool)

(declare-fun b_and!15419 () Bool)

(assert (=> start!37050 (= tp!29247 b_and!15419)))

(declare-fun b!372491 () Bool)

(declare-fun res!209604 () Bool)

(declare-fun e!227207 () Bool)

(assert (=> b!372491 (=> (not res!209604) (not e!227207))))

(declare-datatypes ((array!21591 0))(
  ( (array!21592 (arr!10264 (Array (_ BitVec 32) (_ BitVec 64))) (size!10616 (_ BitVec 32))) )
))
(declare-fun lt!170783 () array!21591)

(declare-datatypes ((List!5755 0))(
  ( (Nil!5752) (Cons!5751 (h!6607 (_ BitVec 64)) (t!10905 List!5755)) )
))
(declare-fun arrayNoDuplicates!0 (array!21591 (_ BitVec 32) List!5755) Bool)

(assert (=> b!372491 (= res!209604 (arrayNoDuplicates!0 lt!170783 #b00000000000000000000000000000000 Nil!5752))))

(declare-fun b!372492 () Bool)

(declare-fun e!227203 () Bool)

(declare-fun tp_is_empty!8825 () Bool)

(assert (=> b!372492 (= e!227203 tp_is_empty!8825)))

(declare-fun b!372493 () Bool)

(declare-fun res!209603 () Bool)

(declare-fun e!227206 () Bool)

(assert (=> b!372493 (=> (not res!209603) (not e!227206))))

(declare-fun _keys!658 () array!21591)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372493 (= res!209603 (or (= (select (arr!10264 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10264 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372494 () Bool)

(declare-fun e!227204 () Bool)

(declare-fun e!227202 () Bool)

(declare-fun mapRes!14802 () Bool)

(assert (=> b!372494 (= e!227204 (and e!227202 mapRes!14802))))

(declare-fun condMapEmpty!14802 () Bool)

(declare-datatypes ((V!12871 0))(
  ( (V!12872 (val!4457 Int)) )
))
(declare-datatypes ((ValueCell!4069 0))(
  ( (ValueCellFull!4069 (v!6654 V!12871)) (EmptyCell!4069) )
))
(declare-datatypes ((array!21593 0))(
  ( (array!21594 (arr!10265 (Array (_ BitVec 32) ValueCell!4069)) (size!10617 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21593)

(declare-fun mapDefault!14802 () ValueCell!4069)

