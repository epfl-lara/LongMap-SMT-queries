; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41060 () Bool)

(assert start!41060)

(declare-fun b_free!10973 () Bool)

(declare-fun b_next!10973 () Bool)

(assert (=> start!41060 (= b_free!10973 (not b_next!10973))))

(declare-fun tp!38749 () Bool)

(declare-fun b_and!19153 () Bool)

(assert (=> start!41060 (= tp!38749 b_and!19153)))

(declare-fun b!457826 () Bool)

(declare-fun e!267349 () Bool)

(declare-fun tp_is_empty!12311 () Bool)

(assert (=> b!457826 (= e!267349 tp_is_empty!12311)))

(declare-fun b!457827 () Bool)

(declare-fun res!273442 () Bool)

(declare-fun e!267351 () Bool)

(assert (=> b!457827 (=> (not res!273442) (not e!267351))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457827 (= res!273442 (bvsle from!863 i!563))))

(declare-fun b!457828 () Bool)

(declare-fun res!273444 () Bool)

(declare-fun e!267352 () Bool)

(assert (=> b!457828 (=> (not res!273444) (not e!267352))))

(declare-datatypes ((array!28423 0))(
  ( (array!28424 (arr!13654 (Array (_ BitVec 32) (_ BitVec 64))) (size!14006 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28423)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457828 (= res!273444 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!457829 () Bool)

(declare-fun res!273435 () Bool)

(assert (=> b!457829 (=> (not res!273435) (not e!267352))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457829 (= res!273435 (validMask!0 mask!1025))))

(declare-fun b!457830 () Bool)

(declare-fun e!267350 () Bool)

(declare-fun mapRes!20110 () Bool)

(assert (=> b!457830 (= e!267350 (and e!267349 mapRes!20110))))

(declare-fun condMapEmpty!20110 () Bool)

(declare-datatypes ((V!17519 0))(
  ( (V!17520 (val!6200 Int)) )
))
(declare-datatypes ((ValueCell!5812 0))(
  ( (ValueCellFull!5812 (v!8470 V!17519)) (EmptyCell!5812) )
))
(declare-datatypes ((array!28425 0))(
  ( (array!28426 (arr!13655 (Array (_ BitVec 32) ValueCell!5812)) (size!14007 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28425)

(declare-fun mapDefault!20110 () ValueCell!5812)

