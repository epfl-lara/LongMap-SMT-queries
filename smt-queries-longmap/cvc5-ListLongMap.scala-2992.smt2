; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42256 () Bool)

(assert start!42256)

(declare-fun b_free!11761 () Bool)

(declare-fun b_next!11761 () Bool)

(assert (=> start!42256 (= b_free!11761 (not b_next!11761))))

(declare-fun tp!41310 () Bool)

(declare-fun b_and!20199 () Bool)

(assert (=> start!42256 (= tp!41310 b_and!20199)))

(declare-fun mapIsEmpty!21490 () Bool)

(declare-fun mapRes!21490 () Bool)

(assert (=> mapIsEmpty!21490 mapRes!21490))

(declare-fun b!471541 () Bool)

(declare-fun res!281693 () Bool)

(declare-fun e!276375 () Bool)

(assert (=> b!471541 (=> (not res!281693) (not e!276375))))

(declare-datatypes ((array!30141 0))(
  ( (array!30142 (arr!14492 (Array (_ BitVec 32) (_ BitVec 64))) (size!14844 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30141)

(declare-datatypes ((List!8822 0))(
  ( (Nil!8819) (Cons!8818 (h!9674 (_ BitVec 64)) (t!14788 List!8822)) )
))
(declare-fun arrayNoDuplicates!0 (array!30141 (_ BitVec 32) List!8822) Bool)

(assert (=> b!471541 (= res!281693 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8819))))

(declare-fun b!471542 () Bool)

(declare-fun e!276371 () Bool)

(declare-fun tp_is_empty!13189 () Bool)

(assert (=> b!471542 (= e!276371 tp_is_empty!13189)))

(declare-fun b!471544 () Bool)

(declare-fun e!276374 () Bool)

(declare-fun e!276373 () Bool)

(assert (=> b!471544 (= e!276374 (and e!276373 mapRes!21490))))

(declare-fun condMapEmpty!21490 () Bool)

(declare-datatypes ((V!18691 0))(
  ( (V!18692 (val!6639 Int)) )
))
(declare-datatypes ((ValueCell!6251 0))(
  ( (ValueCellFull!6251 (v!8930 V!18691)) (EmptyCell!6251) )
))
(declare-datatypes ((array!30143 0))(
  ( (array!30144 (arr!14493 (Array (_ BitVec 32) ValueCell!6251)) (size!14845 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30143)

(declare-fun mapDefault!21490 () ValueCell!6251)

