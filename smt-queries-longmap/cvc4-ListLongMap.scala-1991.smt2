; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34834 () Bool)

(assert start!34834)

(declare-fun b_free!7619 () Bool)

(declare-fun b_next!7619 () Bool)

(assert (=> start!34834 (= b_free!7619 (not b_next!7619))))

(declare-fun tp!26424 () Bool)

(declare-fun b_and!14841 () Bool)

(assert (=> start!34834 (= tp!26424 b_and!14841)))

(declare-fun b!348773 () Bool)

(declare-fun res!193264 () Bool)

(declare-fun e!213666 () Bool)

(assert (=> b!348773 (=> (not res!193264) (not e!213666))))

(declare-datatypes ((array!18729 0))(
  ( (array!18730 (arr!8874 (Array (_ BitVec 32) (_ BitVec 64))) (size!9226 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18729)

(declare-datatypes ((List!5158 0))(
  ( (Nil!5155) (Cons!5154 (h!6010 (_ BitVec 64)) (t!10288 List!5158)) )
))
(declare-fun arrayNoDuplicates!0 (array!18729 (_ BitVec 32) List!5158) Bool)

(assert (=> b!348773 (= res!193264 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5155))))

(declare-fun b!348774 () Bool)

(declare-fun e!213664 () Bool)

(assert (=> b!348774 (= e!213664 false)))

(declare-fun lt!163938 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18729 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348774 (= lt!163938 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348775 () Bool)

(declare-fun e!213667 () Bool)

(declare-fun e!213668 () Bool)

(declare-fun mapRes!12816 () Bool)

(assert (=> b!348775 (= e!213667 (and e!213668 mapRes!12816))))

(declare-fun condMapEmpty!12816 () Bool)

(declare-datatypes ((V!11071 0))(
  ( (V!11072 (val!3830 Int)) )
))
(declare-datatypes ((ValueCell!3442 0))(
  ( (ValueCellFull!3442 (v!6013 V!11071)) (EmptyCell!3442) )
))
(declare-datatypes ((array!18731 0))(
  ( (array!18732 (arr!8875 (Array (_ BitVec 32) ValueCell!3442)) (size!9227 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18731)

(declare-fun mapDefault!12816 () ValueCell!3442)

