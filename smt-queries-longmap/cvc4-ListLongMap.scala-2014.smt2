; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35112 () Bool)

(assert start!35112)

(declare-fun b_free!7757 () Bool)

(declare-fun b_next!7757 () Bool)

(assert (=> start!35112 (= b_free!7757 (not b_next!7757))))

(declare-fun tp!26856 () Bool)

(declare-fun b_and!14991 () Bool)

(assert (=> start!35112 (= tp!26856 b_and!14991)))

(declare-fun b!352040 () Bool)

(declare-datatypes ((Unit!10886 0))(
  ( (Unit!10887) )
))
(declare-fun e!215575 () Unit!10886)

(declare-fun Unit!10888 () Unit!10886)

(assert (=> b!352040 (= e!215575 Unit!10888)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lt!165042 () Unit!10886)

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11255 0))(
  ( (V!11256 (val!3899 Int)) )
))
(declare-fun zeroValue!1467 () V!11255)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3511 0))(
  ( (ValueCellFull!3511 (v!6088 V!11255)) (EmptyCell!3511) )
))
(declare-datatypes ((array!19007 0))(
  ( (array!19008 (arr!9007 (Array (_ BitVec 32) ValueCell!3511)) (size!9359 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19007)

(declare-datatypes ((array!19009 0))(
  ( (array!19010 (arr!9008 (Array (_ BitVec 32) (_ BitVec 64))) (size!9360 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19009)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11255)

(declare-fun lemmaArrayContainsKeyThenInListMap!332 (array!19009 array!19007 (_ BitVec 32) (_ BitVec 32) V!11255 V!11255 (_ BitVec 64) (_ BitVec 32) Int) Unit!10886)

(declare-fun arrayScanForKey!0 (array!19009 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352040 (= lt!165042 (lemmaArrayContainsKeyThenInListMap!332 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352040 false))

(declare-fun b!352041 () Bool)

(declare-fun res!195233 () Bool)

(declare-fun e!215576 () Bool)

(assert (=> b!352041 (=> (not res!195233) (not e!215576))))

(declare-datatypes ((List!5243 0))(
  ( (Nil!5240) (Cons!5239 (h!6095 (_ BitVec 64)) (t!10385 List!5243)) )
))
(declare-fun arrayNoDuplicates!0 (array!19009 (_ BitVec 32) List!5243) Bool)

(assert (=> b!352041 (= res!195233 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5240))))

(declare-fun res!195237 () Bool)

(assert (=> start!35112 (=> (not res!195237) (not e!215576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35112 (= res!195237 (validMask!0 mask!2385))))

(assert (=> start!35112 e!215576))

(assert (=> start!35112 true))

(declare-fun tp_is_empty!7709 () Bool)

(assert (=> start!35112 tp_is_empty!7709))

(assert (=> start!35112 tp!26856))

(declare-fun e!215578 () Bool)

(declare-fun array_inv!6642 (array!19007) Bool)

(assert (=> start!35112 (and (array_inv!6642 _values!1525) e!215578)))

(declare-fun array_inv!6643 (array!19009) Bool)

(assert (=> start!35112 (array_inv!6643 _keys!1895)))

(declare-fun b!352042 () Bool)

(declare-fun e!215579 () Bool)

(declare-fun mapRes!13041 () Bool)

(assert (=> b!352042 (= e!215578 (and e!215579 mapRes!13041))))

(declare-fun condMapEmpty!13041 () Bool)

(declare-fun mapDefault!13041 () ValueCell!3511)

