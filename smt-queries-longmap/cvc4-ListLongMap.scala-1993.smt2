; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34846 () Bool)

(assert start!34846)

(declare-fun b_free!7631 () Bool)

(declare-fun b_next!7631 () Bool)

(assert (=> start!34846 (= b_free!7631 (not b_next!7631))))

(declare-fun tp!26459 () Bool)

(declare-fun b_and!14853 () Bool)

(assert (=> start!34846 (= tp!26459 b_and!14853)))

(declare-fun res!193401 () Bool)

(declare-fun e!213774 () Bool)

(assert (=> start!34846 (=> (not res!193401) (not e!213774))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34846 (= res!193401 (validMask!0 mask!2385))))

(assert (=> start!34846 e!213774))

(assert (=> start!34846 true))

(declare-fun tp_is_empty!7583 () Bool)

(assert (=> start!34846 tp_is_empty!7583))

(assert (=> start!34846 tp!26459))

(declare-datatypes ((V!11087 0))(
  ( (V!11088 (val!3836 Int)) )
))
(declare-datatypes ((ValueCell!3448 0))(
  ( (ValueCellFull!3448 (v!6019 V!11087)) (EmptyCell!3448) )
))
(declare-datatypes ((array!18751 0))(
  ( (array!18752 (arr!8885 (Array (_ BitVec 32) ValueCell!3448)) (size!9237 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18751)

(declare-fun e!213771 () Bool)

(declare-fun array_inv!6572 (array!18751) Bool)

(assert (=> start!34846 (and (array_inv!6572 _values!1525) e!213771)))

(declare-datatypes ((array!18753 0))(
  ( (array!18754 (arr!8886 (Array (_ BitVec 32) (_ BitVec 64))) (size!9238 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18753)

(declare-fun array_inv!6573 (array!18753) Bool)

(assert (=> start!34846 (array_inv!6573 _keys!1895)))

(declare-fun b!348971 () Bool)

(declare-fun e!213775 () Bool)

(assert (=> b!348971 (= e!213775 tp_is_empty!7583)))

(declare-fun b!348972 () Bool)

(declare-fun e!213772 () Bool)

(assert (=> b!348972 (= e!213772 false)))

(declare-fun lt!163974 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18753 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348972 (= lt!163974 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348973 () Bool)

(declare-fun mapRes!12834 () Bool)

(assert (=> b!348973 (= e!213771 (and e!213775 mapRes!12834))))

(declare-fun condMapEmpty!12834 () Bool)

(declare-fun mapDefault!12834 () ValueCell!3448)

