; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38372 () Bool)

(assert start!38372)

(declare-fun b!395895 () Bool)

(declare-fun res!227044 () Bool)

(declare-fun e!239615 () Bool)

(assert (=> b!395895 (=> (not res!227044) (not e!239615))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395895 (= res!227044 (validMask!0 mask!1025))))

(declare-fun b!395896 () Bool)

(declare-fun res!227038 () Bool)

(assert (=> b!395896 (=> (not res!227038) (not e!239615))))

(declare-datatypes ((array!23585 0))(
  ( (array!23586 (arr!11245 (Array (_ BitVec 32) (_ BitVec 64))) (size!11597 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23585)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395896 (= res!227038 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!395897 () Bool)

(declare-fun e!239616 () Bool)

(declare-fun e!239617 () Bool)

(declare-fun mapRes!16371 () Bool)

(assert (=> b!395897 (= e!239616 (and e!239617 mapRes!16371))))

(declare-fun condMapEmpty!16371 () Bool)

(declare-datatypes ((V!14223 0))(
  ( (V!14224 (val!4964 Int)) )
))
(declare-datatypes ((ValueCell!4576 0))(
  ( (ValueCellFull!4576 (v!7210 V!14223)) (EmptyCell!4576) )
))
(declare-datatypes ((array!23587 0))(
  ( (array!23588 (arr!11246 (Array (_ BitVec 32) ValueCell!4576)) (size!11598 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23587)

(declare-fun mapDefault!16371 () ValueCell!4576)

