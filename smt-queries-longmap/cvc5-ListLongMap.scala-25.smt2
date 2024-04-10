; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!572 () Bool)

(assert start!572)

(declare-fun res!5203 () Bool)

(declare-fun e!1685 () Bool)

(assert (=> start!572 (=> (not res!5203) (not e!1685))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!572 (= res!5203 (validMask!0 mask!2250))))

(assert (=> start!572 e!1685))

(assert (=> start!572 true))

(declare-datatypes ((V!355 0))(
  ( (V!356 (val!72 Int)) )
))
(declare-datatypes ((ValueCell!50 0))(
  ( (ValueCellFull!50 (v!1159 V!355)) (EmptyCell!50) )
))
(declare-datatypes ((array!205 0))(
  ( (array!206 (arr!96 (Array (_ BitVec 32) ValueCell!50)) (size!158 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!205)

(declare-fun e!1686 () Bool)

(declare-fun array_inv!71 (array!205) Bool)

(assert (=> start!572 (and (array_inv!71 _values!1492) e!1686)))

(declare-datatypes ((array!207 0))(
  ( (array!208 (arr!97 (Array (_ BitVec 32) (_ BitVec 64))) (size!159 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!207)

(declare-fun array_inv!72 (array!207) Bool)

(assert (=> start!572 (array_inv!72 _keys!1806)))

(declare-fun b!3483 () Bool)

(declare-fun e!1688 () Bool)

(declare-fun tp_is_empty!133 () Bool)

(assert (=> b!3483 (= e!1688 tp_is_empty!133)))

(declare-fun b!3484 () Bool)

(declare-fun res!5202 () Bool)

(assert (=> b!3484 (=> (not res!5202) (not e!1685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!207 (_ BitVec 32)) Bool)

(assert (=> b!3484 (= res!5202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3485 () Bool)

(assert (=> b!3485 (= e!1685 false)))

(declare-fun lt!483 () Bool)

(declare-datatypes ((List!60 0))(
  ( (Nil!57) (Cons!56 (h!622 (_ BitVec 64)) (t!2187 List!60)) )
))
(declare-fun arrayNoDuplicates!0 (array!207 (_ BitVec 32) List!60) Bool)

(assert (=> b!3485 (= lt!483 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!57))))

(declare-fun b!3486 () Bool)

(declare-fun e!1684 () Bool)

(assert (=> b!3486 (= e!1684 tp_is_empty!133)))

(declare-fun mapIsEmpty!155 () Bool)

(declare-fun mapRes!155 () Bool)

(assert (=> mapIsEmpty!155 mapRes!155))

(declare-fun b!3487 () Bool)

(assert (=> b!3487 (= e!1686 (and e!1684 mapRes!155))))

(declare-fun condMapEmpty!155 () Bool)

(declare-fun mapDefault!155 () ValueCell!50)

