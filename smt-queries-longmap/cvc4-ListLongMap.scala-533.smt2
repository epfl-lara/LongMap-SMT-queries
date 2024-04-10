; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13430 () Bool)

(assert start!13430)

(declare-fun b!123002 () Bool)

(declare-fun b_free!2793 () Bool)

(declare-fun b_next!2793 () Bool)

(assert (=> b!123002 (= b_free!2793 (not b_next!2793))))

(declare-fun tp!10766 () Bool)

(declare-fun b_and!7547 () Bool)

(assert (=> b!123002 (= tp!10766 b_and!7547)))

(declare-fun b!122997 () Bool)

(declare-fun b_free!2795 () Bool)

(declare-fun b_next!2795 () Bool)

(assert (=> b!122997 (= b_free!2795 (not b_next!2795))))

(declare-fun tp!10765 () Bool)

(declare-fun b_and!7549 () Bool)

(assert (=> b!122997 (= tp!10765 b_and!7549)))

(declare-fun b!122991 () Bool)

(declare-fun e!80345 () Bool)

(declare-fun e!80341 () Bool)

(declare-fun mapRes!4396 () Bool)

(assert (=> b!122991 (= e!80345 (and e!80341 mapRes!4396))))

(declare-fun condMapEmpty!4395 () Bool)

(declare-datatypes ((V!3397 0))(
  ( (V!3398 (val!1451 Int)) )
))
(declare-datatypes ((array!4637 0))(
  ( (array!4638 (arr!2197 (Array (_ BitVec 32) (_ BitVec 64))) (size!2459 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1063 0))(
  ( (ValueCellFull!1063 (v!3081 V!3397)) (EmptyCell!1063) )
))
(declare-datatypes ((array!4639 0))(
  ( (array!4640 (arr!2198 (Array (_ BitVec 32) ValueCell!1063)) (size!2460 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1034 0))(
  ( (LongMapFixedSize!1035 (defaultEntry!2750 Int) (mask!6984 (_ BitVec 32)) (extraKeys!2535 (_ BitVec 32)) (zeroValue!2615 V!3397) (minValue!2615 V!3397) (_size!566 (_ BitVec 32)) (_keys!4477 array!4637) (_values!2733 array!4639) (_vacant!566 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!830 0))(
  ( (Cell!831 (v!3082 LongMapFixedSize!1034)) )
))
(declare-datatypes ((LongMap!830 0))(
  ( (LongMap!831 (underlying!426 Cell!830)) )
))
(declare-fun thiss!992 () LongMap!830)

(declare-fun mapDefault!4396 () ValueCell!1063)

