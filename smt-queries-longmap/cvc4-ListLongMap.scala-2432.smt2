; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38366 () Bool)

(assert start!38366)

(declare-fun mapNonEmpty!16362 () Bool)

(declare-fun mapRes!16362 () Bool)

(declare-fun tp!32157 () Bool)

(declare-fun e!239570 () Bool)

(assert (=> mapNonEmpty!16362 (= mapRes!16362 (and tp!32157 e!239570))))

(declare-fun mapKey!16362 () (_ BitVec 32))

(declare-datatypes ((V!14215 0))(
  ( (V!14216 (val!4961 Int)) )
))
(declare-datatypes ((ValueCell!4573 0))(
  ( (ValueCellFull!4573 (v!7207 V!14215)) (EmptyCell!4573) )
))
(declare-datatypes ((array!23573 0))(
  ( (array!23574 (arr!11239 (Array (_ BitVec 32) ValueCell!4573)) (size!11591 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23573)

(declare-fun mapRest!16362 () (Array (_ BitVec 32) ValueCell!4573))

(declare-fun mapValue!16362 () ValueCell!4573)

(assert (=> mapNonEmpty!16362 (= (arr!11239 _values!549) (store mapRest!16362 mapKey!16362 mapValue!16362))))

(declare-fun b!395778 () Bool)

(declare-fun res!226948 () Bool)

(declare-fun e!239572 () Bool)

(assert (=> b!395778 (=> (not res!226948) (not e!239572))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395778 (= res!226948 (validKeyInArray!0 k!794))))

(declare-fun b!395779 () Bool)

(declare-datatypes ((array!23575 0))(
  ( (array!23576 (arr!11240 (Array (_ BitVec 32) (_ BitVec 64))) (size!11592 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23575)

(assert (=> b!395779 (= e!239572 (bvsgt #b00000000000000000000000000000000 (size!11592 _keys!709)))))

(declare-fun b!395780 () Bool)

(declare-fun tp_is_empty!9833 () Bool)

(assert (=> b!395780 (= e!239570 tp_is_empty!9833)))

(declare-fun b!395781 () Bool)

(declare-fun res!226953 () Bool)

(assert (=> b!395781 (=> (not res!226953) (not e!239572))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23575 (_ BitVec 32)) Bool)

(assert (=> b!395781 (= res!226953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23576 (store (arr!11240 _keys!709) i!563 k!794) (size!11592 _keys!709)) mask!1025))))

(declare-fun b!395782 () Bool)

(declare-fun res!226946 () Bool)

(assert (=> b!395782 (=> (not res!226946) (not e!239572))))

(assert (=> b!395782 (= res!226946 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11592 _keys!709))))))

(declare-fun b!395783 () Bool)

(declare-fun res!226947 () Bool)

(assert (=> b!395783 (=> (not res!226947) (not e!239572))))

(declare-fun arrayContainsKey!0 (array!23575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395783 (= res!226947 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!395784 () Bool)

(declare-fun e!239569 () Bool)

(declare-fun e!239571 () Bool)

(assert (=> b!395784 (= e!239569 (and e!239571 mapRes!16362))))

(declare-fun condMapEmpty!16362 () Bool)

(declare-fun mapDefault!16362 () ValueCell!4573)

