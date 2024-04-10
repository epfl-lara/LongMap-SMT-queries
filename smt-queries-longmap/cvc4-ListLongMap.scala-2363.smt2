; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37644 () Bool)

(assert start!37644)

(declare-fun b!385422 () Bool)

(declare-fun e!233918 () Bool)

(assert (=> b!385422 (= e!233918 false)))

(declare-fun lt!181611 () Bool)

(declare-datatypes ((array!22739 0))(
  ( (array!22740 (arr!10838 (Array (_ BitVec 32) (_ BitVec 64))) (size!11190 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22739)

(declare-datatypes ((List!6241 0))(
  ( (Nil!6238) (Cons!6237 (h!7093 (_ BitVec 64)) (t!11391 List!6241)) )
))
(declare-fun arrayNoDuplicates!0 (array!22739 (_ BitVec 32) List!6241) Bool)

(assert (=> b!385422 (= lt!181611 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6238))))

(declare-fun b!385423 () Bool)

(declare-fun e!233920 () Bool)

(declare-fun e!233917 () Bool)

(declare-fun mapRes!15693 () Bool)

(assert (=> b!385423 (= e!233920 (and e!233917 mapRes!15693))))

(declare-fun condMapEmpty!15693 () Bool)

(declare-datatypes ((V!13663 0))(
  ( (V!13664 (val!4754 Int)) )
))
(declare-datatypes ((ValueCell!4366 0))(
  ( (ValueCellFull!4366 (v!6951 V!13663)) (EmptyCell!4366) )
))
(declare-datatypes ((array!22741 0))(
  ( (array!22742 (arr!10839 (Array (_ BitVec 32) ValueCell!4366)) (size!11191 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22741)

(declare-fun mapDefault!15693 () ValueCell!4366)

