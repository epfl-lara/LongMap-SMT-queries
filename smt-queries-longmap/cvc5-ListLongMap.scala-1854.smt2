; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33492 () Bool)

(assert start!33492)

(declare-fun b!332419 () Bool)

(declare-fun e!204124 () Bool)

(declare-fun tp_is_empty!6745 () Bool)

(assert (=> b!332419 (= e!204124 tp_is_empty!6745)))

(declare-fun b!332420 () Bool)

(declare-fun e!204126 () Bool)

(declare-datatypes ((array!17085 0))(
  ( (array!17086 (arr!8077 (Array (_ BitVec 32) (_ BitVec 64))) (size!8429 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17085)

(assert (=> b!332420 (= e!204126 (bvsgt #b00000000000000000000000000000000 (size!8429 _keys!1895)))))

(declare-fun b!332421 () Bool)

(declare-fun res!183124 () Bool)

(assert (=> b!332421 (=> (not res!183124) (not e!204126))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17085 (_ BitVec 32)) Bool)

(assert (=> b!332421 (= res!183124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11502 () Bool)

(declare-fun mapRes!11502 () Bool)

(declare-fun tp!23877 () Bool)

(declare-fun e!204125 () Bool)

(assert (=> mapNonEmpty!11502 (= mapRes!11502 (and tp!23877 e!204125))))

(declare-datatypes ((V!9971 0))(
  ( (V!9972 (val!3417 Int)) )
))
(declare-datatypes ((ValueCell!3029 0))(
  ( (ValueCellFull!3029 (v!5576 V!9971)) (EmptyCell!3029) )
))
(declare-fun mapValue!11502 () ValueCell!3029)

(declare-fun mapRest!11502 () (Array (_ BitVec 32) ValueCell!3029))

(declare-fun mapKey!11502 () (_ BitVec 32))

(declare-datatypes ((array!17087 0))(
  ( (array!17088 (arr!8078 (Array (_ BitVec 32) ValueCell!3029)) (size!8430 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17087)

(assert (=> mapNonEmpty!11502 (= (arr!8078 _values!1525) (store mapRest!11502 mapKey!11502 mapValue!11502))))

(declare-fun b!332422 () Bool)

(declare-fun res!183126 () Bool)

(assert (=> b!332422 (=> (not res!183126) (not e!204126))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332422 (= res!183126 (and (= (size!8430 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8429 _keys!1895) (size!8430 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11502 () Bool)

(assert (=> mapIsEmpty!11502 mapRes!11502))

(declare-fun b!332423 () Bool)

(assert (=> b!332423 (= e!204125 tp_is_empty!6745)))

(declare-fun b!332424 () Bool)

(declare-fun res!183128 () Bool)

(assert (=> b!332424 (=> (not res!183128) (not e!204126))))

(declare-datatypes ((List!4593 0))(
  ( (Nil!4590) (Cons!4589 (h!5445 (_ BitVec 64)) (t!9675 List!4593)) )
))
(declare-fun arrayNoDuplicates!0 (array!17085 (_ BitVec 32) List!4593) Bool)

(assert (=> b!332424 (= res!183128 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4590))))

(declare-fun b!332425 () Bool)

(declare-fun res!183127 () Bool)

(assert (=> b!332425 (=> (not res!183127) (not e!204126))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332425 (= res!183127 (validKeyInArray!0 k!1348))))

(declare-fun b!332426 () Bool)

(declare-fun e!204122 () Bool)

(assert (=> b!332426 (= e!204122 (and e!204124 mapRes!11502))))

(declare-fun condMapEmpty!11502 () Bool)

(declare-fun mapDefault!11502 () ValueCell!3029)

