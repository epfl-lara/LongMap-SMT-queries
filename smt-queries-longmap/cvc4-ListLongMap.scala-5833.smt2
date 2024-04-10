; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75304 () Bool)

(assert start!75304)

(declare-fun b!887120 () Bool)

(declare-fun b_free!15503 () Bool)

(declare-fun b_next!15503 () Bool)

(assert (=> b!887120 (= b_free!15503 (not b_next!15503))))

(declare-fun tp!54442 () Bool)

(declare-fun b_and!25709 () Bool)

(assert (=> b!887120 (= tp!54442 b_and!25709)))

(declare-fun res!602062 () Bool)

(declare-fun e!493939 () Bool)

(assert (=> start!75304 (=> (not res!602062) (not e!493939))))

(declare-datatypes ((V!28739 0))(
  ( (V!28740 (val!8966 Int)) )
))
(declare-datatypes ((ValueCell!8434 0))(
  ( (ValueCellFull!8434 (v!11412 V!28739)) (EmptyCell!8434) )
))
(declare-datatypes ((array!51622 0))(
  ( (array!51623 (arr!24827 (Array (_ BitVec 32) ValueCell!8434)) (size!25267 (_ BitVec 32))) )
))
(declare-datatypes ((array!51624 0))(
  ( (array!51625 (arr!24828 (Array (_ BitVec 32) (_ BitVec 64))) (size!25268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3884 0))(
  ( (LongMapFixedSize!3885 (defaultEntry!5130 Int) (mask!25521 (_ BitVec 32)) (extraKeys!4823 (_ BitVec 32)) (zeroValue!4927 V!28739) (minValue!4927 V!28739) (_size!1997 (_ BitVec 32)) (_keys!9805 array!51624) (_values!5114 array!51622) (_vacant!1997 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1044 0))(
  ( (Cell!1045 (v!11413 LongMapFixedSize!3884)) )
))
(declare-datatypes ((LongMap!1044 0))(
  ( (LongMap!1045 (underlying!533 Cell!1044)) )
))
(declare-fun thiss!833 () LongMap!1044)

(declare-fun valid!1514 (LongMap!1044) Bool)

(assert (=> start!75304 (= res!602062 (valid!1514 thiss!833))))

(assert (=> start!75304 e!493939))

(declare-fun e!493940 () Bool)

(assert (=> start!75304 e!493940))

(assert (=> start!75304 true))

(declare-fun b!887115 () Bool)

(declare-fun e!493942 () Bool)

(declare-fun e!493938 () Bool)

(declare-fun mapRes!28266 () Bool)

(assert (=> b!887115 (= e!493942 (and e!493938 mapRes!28266))))

(declare-fun condMapEmpty!28266 () Bool)

(declare-fun mapDefault!28266 () ValueCell!8434)

