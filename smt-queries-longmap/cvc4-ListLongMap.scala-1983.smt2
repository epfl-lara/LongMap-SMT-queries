; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34786 () Bool)

(assert start!34786)

(declare-fun b_free!7571 () Bool)

(declare-fun b_next!7571 () Bool)

(assert (=> start!34786 (= b_free!7571 (not b_next!7571))))

(declare-fun tp!26280 () Bool)

(declare-fun b_and!14793 () Bool)

(assert (=> start!34786 (= tp!26280 b_and!14793)))

(declare-fun b!347981 () Bool)

(declare-fun res!192688 () Bool)

(declare-fun e!213226 () Bool)

(assert (=> b!347981 (=> (not res!192688) (not e!213226))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347981 (= res!192688 (validKeyInArray!0 k!1348))))

(declare-fun res!192686 () Bool)

(assert (=> start!34786 (=> (not res!192686) (not e!213226))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34786 (= res!192686 (validMask!0 mask!2385))))

(assert (=> start!34786 e!213226))

(assert (=> start!34786 true))

(declare-fun tp_is_empty!7523 () Bool)

(assert (=> start!34786 tp_is_empty!7523))

(assert (=> start!34786 tp!26280))

(declare-datatypes ((V!11007 0))(
  ( (V!11008 (val!3806 Int)) )
))
(declare-datatypes ((ValueCell!3418 0))(
  ( (ValueCellFull!3418 (v!5989 V!11007)) (EmptyCell!3418) )
))
(declare-datatypes ((array!18633 0))(
  ( (array!18634 (arr!8826 (Array (_ BitVec 32) ValueCell!3418)) (size!9178 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18633)

(declare-fun e!213225 () Bool)

(declare-fun array_inv!6536 (array!18633) Bool)

(assert (=> start!34786 (and (array_inv!6536 _values!1525) e!213225)))

(declare-datatypes ((array!18635 0))(
  ( (array!18636 (arr!8827 (Array (_ BitVec 32) (_ BitVec 64))) (size!9179 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18635)

(declare-fun array_inv!6537 (array!18635) Bool)

(assert (=> start!34786 (array_inv!6537 _keys!1895)))

(declare-fun b!347982 () Bool)

(declare-fun res!192682 () Bool)

(assert (=> b!347982 (=> (not res!192682) (not e!213226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18635 (_ BitVec 32)) Bool)

(assert (=> b!347982 (= res!192682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347983 () Bool)

(declare-fun e!213227 () Bool)

(declare-fun mapRes!12744 () Bool)

(assert (=> b!347983 (= e!213225 (and e!213227 mapRes!12744))))

(declare-fun condMapEmpty!12744 () Bool)

(declare-fun mapDefault!12744 () ValueCell!3418)

