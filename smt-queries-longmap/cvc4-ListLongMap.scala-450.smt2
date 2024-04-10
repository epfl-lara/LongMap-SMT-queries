; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8316 () Bool)

(assert start!8316)

(declare-fun b!54610 () Bool)

(declare-fun b_free!1797 () Bool)

(declare-fun b_next!1797 () Bool)

(assert (=> b!54610 (= b_free!1797 (not b_next!1797))))

(declare-fun tp!7493 () Bool)

(declare-fun b_and!3135 () Bool)

(assert (=> b!54610 (= tp!7493 b_and!3135)))

(declare-fun b!54623 () Bool)

(declare-fun b_free!1799 () Bool)

(declare-fun b_next!1799 () Bool)

(assert (=> b!54623 (= b_free!1799 (not b_next!1799))))

(declare-fun tp!7494 () Bool)

(declare-fun b_and!3137 () Bool)

(assert (=> b!54623 (= tp!7494 b_and!3137)))

(declare-fun mapIsEmpty!2615 () Bool)

(declare-fun mapRes!2615 () Bool)

(assert (=> mapIsEmpty!2615 mapRes!2615))

(declare-fun b!54608 () Bool)

(declare-fun e!35703 () Bool)

(declare-fun e!35698 () Bool)

(declare-fun mapRes!2616 () Bool)

(assert (=> b!54608 (= e!35703 (and e!35698 mapRes!2616))))

(declare-fun condMapEmpty!2616 () Bool)

(declare-datatypes ((V!2733 0))(
  ( (V!2734 (val!1202 Int)) )
))
(declare-datatypes ((array!3553 0))(
  ( (array!3554 (arr!1699 (Array (_ BitVec 32) (_ BitVec 64))) (size!1928 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!814 0))(
  ( (ValueCellFull!814 (v!2290 V!2733)) (EmptyCell!814) )
))
(declare-datatypes ((array!3555 0))(
  ( (array!3556 (arr!1700 (Array (_ BitVec 32) ValueCell!814)) (size!1929 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!536 0))(
  ( (LongMapFixedSize!537 (defaultEntry!1982 Int) (mask!5829 (_ BitVec 32)) (extraKeys!1873 (_ BitVec 32)) (zeroValue!1900 V!2733) (minValue!1900 V!2733) (_size!317 (_ BitVec 32)) (_keys!3602 array!3553) (_values!1965 array!3555) (_vacant!317 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!352 0))(
  ( (Cell!353 (v!2291 LongMapFixedSize!536)) )
))
(declare-datatypes ((LongMap!352 0))(
  ( (LongMap!353 (underlying!187 Cell!352)) )
))
(declare-fun thiss!992 () LongMap!352)

(declare-fun mapDefault!2616 () ValueCell!814)

