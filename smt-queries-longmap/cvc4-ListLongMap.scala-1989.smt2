; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34822 () Bool)

(assert start!34822)

(declare-fun b_free!7607 () Bool)

(declare-fun b_next!7607 () Bool)

(assert (=> start!34822 (= b_free!7607 (not b_next!7607))))

(declare-fun tp!26388 () Bool)

(declare-fun b_and!14829 () Bool)

(assert (=> start!34822 (= tp!26388 b_and!14829)))

(declare-fun b!348575 () Bool)

(declare-fun res!193115 () Bool)

(declare-fun e!213558 () Bool)

(assert (=> b!348575 (=> (not res!193115) (not e!213558))))

(declare-datatypes ((array!18705 0))(
  ( (array!18706 (arr!8862 (Array (_ BitVec 32) (_ BitVec 64))) (size!9214 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18705)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348575 (= res!193115 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348576 () Bool)

(assert (=> b!348576 (= e!213558 false)))

(declare-fun lt!163902 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18705 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348576 (= lt!163902 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348577 () Bool)

(declare-fun res!193119 () Bool)

(declare-fun e!213556 () Bool)

(assert (=> b!348577 (=> (not res!193119) (not e!213556))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11055 0))(
  ( (V!11056 (val!3824 Int)) )
))
(declare-datatypes ((ValueCell!3436 0))(
  ( (ValueCellFull!3436 (v!6007 V!11055)) (EmptyCell!3436) )
))
(declare-datatypes ((array!18707 0))(
  ( (array!18708 (arr!8863 (Array (_ BitVec 32) ValueCell!3436)) (size!9215 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18707)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348577 (= res!193119 (and (= (size!9215 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9214 _keys!1895) (size!9215 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348578 () Bool)

(declare-fun res!193114 () Bool)

(assert (=> b!348578 (=> (not res!193114) (not e!213556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348578 (= res!193114 (validKeyInArray!0 k!1348))))

(declare-fun b!348579 () Bool)

(declare-fun res!193120 () Bool)

(assert (=> b!348579 (=> (not res!193120) (not e!213556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18705 (_ BitVec 32)) Bool)

(assert (=> b!348579 (= res!193120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!193117 () Bool)

(assert (=> start!34822 (=> (not res!193117) (not e!213556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34822 (= res!193117 (validMask!0 mask!2385))))

(assert (=> start!34822 e!213556))

(assert (=> start!34822 true))

(declare-fun tp_is_empty!7559 () Bool)

(assert (=> start!34822 tp_is_empty!7559))

(assert (=> start!34822 tp!26388))

(declare-fun e!213560 () Bool)

(declare-fun array_inv!6560 (array!18707) Bool)

(assert (=> start!34822 (and (array_inv!6560 _values!1525) e!213560)))

(declare-fun array_inv!6561 (array!18705) Bool)

(assert (=> start!34822 (array_inv!6561 _keys!1895)))

(declare-fun b!348580 () Bool)

(declare-fun e!213555 () Bool)

(declare-fun mapRes!12798 () Bool)

(assert (=> b!348580 (= e!213560 (and e!213555 mapRes!12798))))

(declare-fun condMapEmpty!12798 () Bool)

(declare-fun mapDefault!12798 () ValueCell!3436)

