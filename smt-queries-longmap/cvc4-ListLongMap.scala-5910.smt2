; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76516 () Bool)

(assert start!76516)

(declare-fun b!896805 () Bool)

(declare-fun b_free!15965 () Bool)

(declare-fun b_next!15965 () Bool)

(assert (=> b!896805 (= b_free!15965 (not b_next!15965))))

(declare-fun tp!55934 () Bool)

(declare-fun b_and!26257 () Bool)

(assert (=> b!896805 (= tp!55934 b_and!26257)))

(declare-fun b!896801 () Bool)

(declare-fun e!501361 () Bool)

(declare-fun e!501362 () Bool)

(declare-fun mapRes!29064 () Bool)

(assert (=> b!896801 (= e!501361 (and e!501362 mapRes!29064))))

(declare-fun condMapEmpty!29064 () Bool)

(declare-datatypes ((array!52606 0))(
  ( (array!52607 (arr!25289 (Array (_ BitVec 32) (_ BitVec 64))) (size!25741 (_ BitVec 32))) )
))
(declare-datatypes ((V!29355 0))(
  ( (V!29356 (val!9197 Int)) )
))
(declare-datatypes ((ValueCell!8665 0))(
  ( (ValueCellFull!8665 (v!11687 V!29355)) (EmptyCell!8665) )
))
(declare-datatypes ((array!52608 0))(
  ( (array!52609 (arr!25290 (Array (_ BitVec 32) ValueCell!8665)) (size!25742 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4346 0))(
  ( (LongMapFixedSize!4347 (defaultEntry!5385 Int) (mask!26042 (_ BitVec 32)) (extraKeys!5089 (_ BitVec 32)) (zeroValue!5193 V!29355) (minValue!5193 V!29355) (_size!2228 (_ BitVec 32)) (_keys!10126 array!52606) (_values!5380 array!52608) (_vacant!2228 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4346)

(declare-fun mapDefault!29064 () ValueCell!8665)

