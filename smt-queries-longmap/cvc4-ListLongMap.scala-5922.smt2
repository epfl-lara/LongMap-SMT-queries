; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76982 () Bool)

(assert start!76982)

(declare-fun b!899501 () Bool)

(declare-fun b_free!16037 () Bool)

(declare-fun b_next!16037 () Bool)

(assert (=> b!899501 (= b_free!16037 (not b_next!16037))))

(declare-fun tp!56191 () Bool)

(declare-fun b_and!26345 () Bool)

(assert (=> b!899501 (= tp!56191 b_and!26345)))

(declare-fun res!607643 () Bool)

(declare-fun e!503337 () Bool)

(assert (=> start!76982 (=> (not res!607643) (not e!503337))))

(declare-datatypes ((array!52774 0))(
  ( (array!52775 (arr!25361 (Array (_ BitVec 32) (_ BitVec 64))) (size!25818 (_ BitVec 32))) )
))
(declare-datatypes ((V!29451 0))(
  ( (V!29452 (val!9233 Int)) )
))
(declare-datatypes ((ValueCell!8701 0))(
  ( (ValueCellFull!8701 (v!11727 V!29451)) (EmptyCell!8701) )
))
(declare-datatypes ((array!52776 0))(
  ( (array!52777 (arr!25362 (Array (_ BitVec 32) ValueCell!8701)) (size!25819 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4418 0))(
  ( (LongMapFixedSize!4419 (defaultEntry!5433 Int) (mask!26191 (_ BitVec 32)) (extraKeys!5154 (_ BitVec 32)) (zeroValue!5258 V!29451) (minValue!5258 V!29451) (_size!2264 (_ BitVec 32)) (_keys!10222 array!52774) (_values!5445 array!52776) (_vacant!2264 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4418)

(declare-fun valid!1697 (LongMapFixedSize!4418) Bool)

(assert (=> start!76982 (= res!607643 (valid!1697 thiss!1181))))

(assert (=> start!76982 e!503337))

(declare-fun e!503335 () Bool)

(assert (=> start!76982 e!503335))

(assert (=> start!76982 true))

(declare-fun mapNonEmpty!29213 () Bool)

(declare-fun mapRes!29213 () Bool)

(declare-fun tp!56190 () Bool)

(declare-fun e!503332 () Bool)

(assert (=> mapNonEmpty!29213 (= mapRes!29213 (and tp!56190 e!503332))))

(declare-fun mapValue!29213 () ValueCell!8701)

(declare-fun mapKey!29213 () (_ BitVec 32))

(declare-fun mapRest!29213 () (Array (_ BitVec 32) ValueCell!8701))

(assert (=> mapNonEmpty!29213 (= (arr!25362 (_values!5445 thiss!1181)) (store mapRest!29213 mapKey!29213 mapValue!29213))))

(declare-fun b!899494 () Bool)

(declare-fun res!607645 () Bool)

(assert (=> b!899494 (=> (not res!607645) (not e!503337))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!899494 (= res!607645 (not (= key!785 (bvneg key!785))))))

(declare-fun b!899495 () Bool)

(declare-fun e!503338 () Bool)

(declare-fun e!503333 () Bool)

(assert (=> b!899495 (= e!503338 (and e!503333 mapRes!29213))))

(declare-fun condMapEmpty!29213 () Bool)

(declare-fun mapDefault!29213 () ValueCell!8701)

