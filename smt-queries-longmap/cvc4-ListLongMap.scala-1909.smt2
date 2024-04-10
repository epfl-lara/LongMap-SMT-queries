; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33996 () Bool)

(assert start!33996)

(declare-fun b_free!7127 () Bool)

(declare-fun b_next!7127 () Bool)

(assert (=> start!33996 (= b_free!7127 (not b_next!7127))))

(declare-fun tp!24900 () Bool)

(declare-fun b_and!14317 () Bool)

(assert (=> start!33996 (= tp!24900 b_and!14317)))

(declare-fun b!338764 () Bool)

(declare-datatypes ((Unit!10535 0))(
  ( (Unit!10536) )
))
(declare-fun e!207851 () Unit!10535)

(declare-fun Unit!10537 () Unit!10535)

(assert (=> b!338764 (= e!207851 Unit!10537)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10415 0))(
  ( (V!10416 (val!3584 Int)) )
))
(declare-fun zeroValue!1467 () V!10415)

(declare-fun lt!160896 () Unit!10535)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3196 0))(
  ( (ValueCellFull!3196 (v!5751 V!10415)) (EmptyCell!3196) )
))
(declare-datatypes ((array!17753 0))(
  ( (array!17754 (arr!8402 (Array (_ BitVec 32) ValueCell!3196)) (size!8754 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17753)

(declare-datatypes ((array!17755 0))(
  ( (array!17756 (arr!8403 (Array (_ BitVec 32) (_ BitVec 64))) (size!8755 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17755)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10415)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!277 (array!17755 array!17753 (_ BitVec 32) (_ BitVec 32) V!10415 V!10415 (_ BitVec 64) (_ BitVec 32) Int) Unit!10535)

(declare-fun arrayScanForKey!0 (array!17755 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338764 (= lt!160896 (lemmaArrayContainsKeyThenInListMap!277 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338764 false))

(declare-fun b!338765 () Bool)

(declare-fun e!207852 () Bool)

(assert (=> b!338765 (= e!207852 false)))

(declare-fun lt!160895 () Unit!10535)

(assert (=> b!338765 (= lt!160895 e!207851)))

(declare-fun c!52452 () Bool)

(declare-fun arrayContainsKey!0 (array!17755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338765 (= c!52452 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12030 () Bool)

(declare-fun mapRes!12030 () Bool)

(assert (=> mapIsEmpty!12030 mapRes!12030))

(declare-fun b!338766 () Bool)

(declare-fun res!187138 () Bool)

(declare-fun e!207849 () Bool)

(assert (=> b!338766 (=> (not res!187138) (not e!207849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17755 (_ BitVec 32)) Bool)

(assert (=> b!338766 (= res!187138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338767 () Bool)

(declare-fun res!187140 () Bool)

(assert (=> b!338767 (=> (not res!187140) (not e!207849))))

(declare-datatypes ((List!4821 0))(
  ( (Nil!4818) (Cons!4817 (h!5673 (_ BitVec 64)) (t!9919 List!4821)) )
))
(declare-fun arrayNoDuplicates!0 (array!17755 (_ BitVec 32) List!4821) Bool)

(assert (=> b!338767 (= res!187140 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4818))))

(declare-fun b!338768 () Bool)

(declare-fun e!207848 () Bool)

(declare-fun e!207846 () Bool)

(assert (=> b!338768 (= e!207848 (and e!207846 mapRes!12030))))

(declare-fun condMapEmpty!12030 () Bool)

(declare-fun mapDefault!12030 () ValueCell!3196)

