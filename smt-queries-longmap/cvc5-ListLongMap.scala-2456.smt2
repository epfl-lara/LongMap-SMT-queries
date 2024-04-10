; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38554 () Bool)

(assert start!38554)

(declare-fun b_free!9091 () Bool)

(declare-fun b_next!9091 () Bool)

(assert (=> start!38554 (= b_free!9091 (not b_next!9091))))

(declare-fun tp!32396 () Bool)

(declare-fun b_and!16477 () Bool)

(assert (=> start!38554 (= tp!32396 b_and!16477)))

(declare-fun b!398779 () Bool)

(declare-fun res!229215 () Bool)

(declare-fun e!240960 () Bool)

(assert (=> b!398779 (=> (not res!229215) (not e!240960))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23857 0))(
  ( (array!23858 (arr!11378 (Array (_ BitVec 32) (_ BitVec 64))) (size!11730 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23857)

(assert (=> b!398779 (= res!229215 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11730 _keys!709))))))

(declare-fun b!398780 () Bool)

(declare-fun res!229218 () Bool)

(assert (=> b!398780 (=> (not res!229218) (not e!240960))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23857 (_ BitVec 32)) Bool)

(assert (=> b!398780 (= res!229218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398781 () Bool)

(declare-fun e!240961 () Bool)

(declare-fun e!240963 () Bool)

(declare-fun mapRes!16581 () Bool)

(assert (=> b!398781 (= e!240961 (and e!240963 mapRes!16581))))

(declare-fun condMapEmpty!16581 () Bool)

(declare-datatypes ((V!14403 0))(
  ( (V!14404 (val!5031 Int)) )
))
(declare-datatypes ((ValueCell!4643 0))(
  ( (ValueCellFull!4643 (v!7278 V!14403)) (EmptyCell!4643) )
))
(declare-datatypes ((array!23859 0))(
  ( (array!23860 (arr!11379 (Array (_ BitVec 32) ValueCell!4643)) (size!11731 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23859)

(declare-fun mapDefault!16581 () ValueCell!4643)

