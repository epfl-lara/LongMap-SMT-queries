; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75286 () Bool)

(assert start!75286)

(declare-fun b!886998 () Bool)

(declare-fun b_free!15493 () Bool)

(declare-fun b_next!15493 () Bool)

(assert (=> b!886998 (= b_free!15493 (not b_next!15493))))

(declare-fun tp!54410 () Bool)

(declare-fun b_and!25699 () Bool)

(assert (=> b!886998 (= tp!54410 b_and!25699)))

(declare-fun b!886993 () Bool)

(declare-fun e!493815 () Bool)

(declare-fun tp_is_empty!17821 () Bool)

(assert (=> b!886993 (= e!493815 tp_is_empty!17821)))

(declare-fun mapNonEmpty!28248 () Bool)

(declare-fun mapRes!28248 () Bool)

(declare-fun tp!54409 () Bool)

(declare-fun e!493813 () Bool)

(assert (=> mapNonEmpty!28248 (= mapRes!28248 (and tp!54409 e!493813))))

(declare-datatypes ((V!28727 0))(
  ( (V!28728 (val!8961 Int)) )
))
(declare-datatypes ((ValueCell!8429 0))(
  ( (ValueCellFull!8429 (v!11402 V!28727)) (EmptyCell!8429) )
))
(declare-fun mapRest!28248 () (Array (_ BitVec 32) ValueCell!8429))

(declare-fun mapValue!28248 () ValueCell!8429)

(declare-fun mapKey!28248 () (_ BitVec 32))

(declare-datatypes ((array!51600 0))(
  ( (array!51601 (arr!24817 (Array (_ BitVec 32) ValueCell!8429)) (size!25257 (_ BitVec 32))) )
))
(declare-datatypes ((array!51602 0))(
  ( (array!51603 (arr!24818 (Array (_ BitVec 32) (_ BitVec 64))) (size!25258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3874 0))(
  ( (LongMapFixedSize!3875 (defaultEntry!5125 Int) (mask!25514 (_ BitVec 32)) (extraKeys!4818 (_ BitVec 32)) (zeroValue!4922 V!28727) (minValue!4922 V!28727) (_size!1992 (_ BitVec 32)) (_keys!9800 array!51602) (_values!5109 array!51600) (_vacant!1992 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1034 0))(
  ( (Cell!1035 (v!11403 LongMapFixedSize!3874)) )
))
(declare-datatypes ((LongMap!1034 0))(
  ( (LongMap!1035 (underlying!528 Cell!1034)) )
))
(declare-fun thiss!833 () LongMap!1034)

(assert (=> mapNonEmpty!28248 (= (arr!24817 (_values!5109 (v!11403 (underlying!528 thiss!833)))) (store mapRest!28248 mapKey!28248 mapValue!28248))))

(declare-fun b!886994 () Bool)

(declare-fun e!493808 () Bool)

(assert (=> b!886994 (= e!493808 (and e!493815 mapRes!28248))))

(declare-fun condMapEmpty!28248 () Bool)

(declare-fun mapDefault!28248 () ValueCell!8429)

