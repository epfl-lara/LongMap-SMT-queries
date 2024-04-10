; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42218 () Bool)

(assert start!42218)

(declare-fun b_free!11737 () Bool)

(declare-fun b_next!11737 () Bool)

(assert (=> start!42218 (= b_free!11737 (not b_next!11737))))

(declare-fun tp!41236 () Bool)

(declare-fun b_and!20167 () Bool)

(assert (=> start!42218 (= tp!41236 b_and!20167)))

(declare-fun b!471204 () Bool)

(declare-fun res!281518 () Bool)

(declare-fun e!276136 () Bool)

(assert (=> b!471204 (=> (not res!281518) (not e!276136))))

(declare-datatypes ((array!30095 0))(
  ( (array!30096 (arr!14470 (Array (_ BitVec 32) (_ BitVec 64))) (size!14822 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30095)

(declare-datatypes ((List!8808 0))(
  ( (Nil!8805) (Cons!8804 (h!9660 (_ BitVec 64)) (t!14772 List!8808)) )
))
(declare-fun arrayNoDuplicates!0 (array!30095 (_ BitVec 32) List!8808) Bool)

(assert (=> b!471204 (= res!281518 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8805))))

(declare-fun b!471205 () Bool)

(declare-fun e!276138 () Bool)

(declare-fun tp_is_empty!13165 () Bool)

(assert (=> b!471205 (= e!276138 tp_is_empty!13165)))

(declare-fun mapNonEmpty!21451 () Bool)

(declare-fun mapRes!21451 () Bool)

(declare-fun tp!41235 () Bool)

(declare-fun e!276140 () Bool)

(assert (=> mapNonEmpty!21451 (= mapRes!21451 (and tp!41235 e!276140))))

(declare-datatypes ((V!18659 0))(
  ( (V!18660 (val!6627 Int)) )
))
(declare-datatypes ((ValueCell!6239 0))(
  ( (ValueCellFull!6239 (v!8918 V!18659)) (EmptyCell!6239) )
))
(declare-datatypes ((array!30097 0))(
  ( (array!30098 (arr!14471 (Array (_ BitVec 32) ValueCell!6239)) (size!14823 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30097)

(declare-fun mapValue!21451 () ValueCell!6239)

(declare-fun mapRest!21451 () (Array (_ BitVec 32) ValueCell!6239))

(declare-fun mapKey!21451 () (_ BitVec 32))

(assert (=> mapNonEmpty!21451 (= (arr!14471 _values!833) (store mapRest!21451 mapKey!21451 mapValue!21451))))

(declare-fun b!471206 () Bool)

(assert (=> b!471206 (= e!276140 tp_is_empty!13165)))

(declare-fun b!471207 () Bool)

(declare-fun e!276137 () Bool)

(assert (=> b!471207 (= e!276137 (and e!276138 mapRes!21451))))

(declare-fun condMapEmpty!21451 () Bool)

(declare-fun mapDefault!21451 () ValueCell!6239)

