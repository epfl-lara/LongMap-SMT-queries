; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37620 () Bool)

(assert start!37620)

(declare-fun b_free!8747 () Bool)

(declare-fun b_next!8747 () Bool)

(assert (=> start!37620 (= b_free!8747 (not b_next!8747))))

(declare-fun tp!30957 () Bool)

(declare-fun b_and!15989 () Bool)

(assert (=> start!37620 (= tp!30957 b_and!15989)))

(declare-fun b!384973 () Bool)

(declare-fun res!219526 () Bool)

(declare-fun e!233678 () Bool)

(assert (=> b!384973 (=> (not res!219526) (not e!233678))))

(declare-datatypes ((array!22691 0))(
  ( (array!22692 (arr!10814 (Array (_ BitVec 32) (_ BitVec 64))) (size!11166 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22691)

(declare-datatypes ((List!6223 0))(
  ( (Nil!6220) (Cons!6219 (h!7075 (_ BitVec 64)) (t!11373 List!6223)) )
))
(declare-fun arrayNoDuplicates!0 (array!22691 (_ BitVec 32) List!6223) Bool)

(assert (=> b!384973 (= res!219526 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6220))))

(declare-fun b!384974 () Bool)

(declare-fun res!219525 () Bool)

(assert (=> b!384974 (=> (not res!219525) (not e!233678))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22691 (_ BitVec 32)) Bool)

(assert (=> b!384974 (= res!219525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384975 () Bool)

(declare-fun e!233675 () Bool)

(declare-fun e!233674 () Bool)

(declare-fun mapRes!15657 () Bool)

(assert (=> b!384975 (= e!233675 (and e!233674 mapRes!15657))))

(declare-fun condMapEmpty!15657 () Bool)

(declare-datatypes ((V!13631 0))(
  ( (V!13632 (val!4742 Int)) )
))
(declare-datatypes ((ValueCell!4354 0))(
  ( (ValueCellFull!4354 (v!6939 V!13631)) (EmptyCell!4354) )
))
(declare-datatypes ((array!22693 0))(
  ( (array!22694 (arr!10815 (Array (_ BitVec 32) ValueCell!4354)) (size!11167 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22693)

(declare-fun mapDefault!15657 () ValueCell!4354)

