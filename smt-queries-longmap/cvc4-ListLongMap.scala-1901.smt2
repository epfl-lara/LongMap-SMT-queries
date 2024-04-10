; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33900 () Bool)

(assert start!33900)

(declare-fun b_free!7079 () Bool)

(declare-fun b_next!7079 () Bool)

(assert (=> start!33900 (= b_free!7079 (not b_next!7079))))

(declare-fun tp!24750 () Bool)

(declare-fun b_and!14265 () Bool)

(assert (=> start!33900 (= tp!24750 b_and!14265)))

(declare-fun b!337624 () Bool)

(declare-fun res!186531 () Bool)

(declare-fun e!207168 () Bool)

(assert (=> b!337624 (=> (not res!186531) (not e!207168))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10351 0))(
  ( (V!10352 (val!3560 Int)) )
))
(declare-datatypes ((ValueCell!3172 0))(
  ( (ValueCellFull!3172 (v!5725 V!10351)) (EmptyCell!3172) )
))
(declare-datatypes ((array!17657 0))(
  ( (array!17658 (arr!8356 (Array (_ BitVec 32) ValueCell!3172)) (size!8708 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17657)

(declare-datatypes ((array!17659 0))(
  ( (array!17660 (arr!8357 (Array (_ BitVec 32) (_ BitVec 64))) (size!8709 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17659)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10351)

(declare-fun zeroValue!1467 () V!10351)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5170 0))(
  ( (tuple2!5171 (_1!2596 (_ BitVec 64)) (_2!2596 V!10351)) )
))
(declare-datatypes ((List!4786 0))(
  ( (Nil!4783) (Cons!4782 (h!5638 tuple2!5170) (t!9880 List!4786)) )
))
(declare-datatypes ((ListLongMap!4083 0))(
  ( (ListLongMap!4084 (toList!2057 List!4786)) )
))
(declare-fun contains!2104 (ListLongMap!4083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1578 (array!17659 array!17657 (_ BitVec 32) (_ BitVec 32) V!10351 V!10351 (_ BitVec 32) Int) ListLongMap!4083)

(assert (=> b!337624 (= res!186531 (not (contains!2104 (getCurrentListMap!1578 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337625 () Bool)

(declare-fun res!186532 () Bool)

(assert (=> b!337625 (=> (not res!186532) (not e!207168))))

(declare-datatypes ((List!4787 0))(
  ( (Nil!4784) (Cons!4783 (h!5639 (_ BitVec 64)) (t!9881 List!4787)) )
))
(declare-fun arrayNoDuplicates!0 (array!17659 (_ BitVec 32) List!4787) Bool)

(assert (=> b!337625 (= res!186532 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4784))))

(declare-fun b!337626 () Bool)

(declare-fun res!186536 () Bool)

(assert (=> b!337626 (=> (not res!186536) (not e!207168))))

(assert (=> b!337626 (= res!186536 (and (= (size!8708 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8709 _keys!1895) (size!8708 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337627 () Bool)

(declare-fun res!186530 () Bool)

(assert (=> b!337627 (=> (not res!186530) (not e!207168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337627 (= res!186530 (validKeyInArray!0 k!1348))))

(declare-fun b!337628 () Bool)

(declare-fun res!186533 () Bool)

(assert (=> b!337628 (=> (not res!186533) (not e!207168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17659 (_ BitVec 32)) Bool)

(assert (=> b!337628 (= res!186533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11952 () Bool)

(declare-fun mapRes!11952 () Bool)

(assert (=> mapIsEmpty!11952 mapRes!11952))

(declare-fun b!337629 () Bool)

(declare-fun e!207165 () Bool)

(declare-fun tp_is_empty!7031 () Bool)

(assert (=> b!337629 (= e!207165 tp_is_empty!7031)))

(declare-fun b!337630 () Bool)

(declare-fun e!207167 () Bool)

(assert (=> b!337630 (= e!207167 false)))

(declare-fun lt!160468 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17659 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337630 (= lt!160468 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun res!186534 () Bool)

(assert (=> start!33900 (=> (not res!186534) (not e!207168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33900 (= res!186534 (validMask!0 mask!2385))))

(assert (=> start!33900 e!207168))

(assert (=> start!33900 true))

(assert (=> start!33900 tp_is_empty!7031))

(assert (=> start!33900 tp!24750))

(declare-fun e!207166 () Bool)

(declare-fun array_inv!6204 (array!17657) Bool)

(assert (=> start!33900 (and (array_inv!6204 _values!1525) e!207166)))

(declare-fun array_inv!6205 (array!17659) Bool)

(assert (=> start!33900 (array_inv!6205 _keys!1895)))

(declare-fun b!337623 () Bool)

(assert (=> b!337623 (= e!207166 (and e!207165 mapRes!11952))))

(declare-fun condMapEmpty!11952 () Bool)

(declare-fun mapDefault!11952 () ValueCell!3172)

