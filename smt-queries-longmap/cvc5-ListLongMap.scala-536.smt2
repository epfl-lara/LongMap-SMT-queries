; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13520 () Bool)

(assert start!13520)

(declare-fun b!123942 () Bool)

(declare-fun b_free!2821 () Bool)

(declare-fun b_next!2821 () Bool)

(assert (=> b!123942 (= b_free!2821 (not b_next!2821))))

(declare-fun tp!10859 () Bool)

(declare-fun b_and!7607 () Bool)

(assert (=> b!123942 (= tp!10859 b_and!7607)))

(declare-fun b!123954 () Bool)

(declare-fun b_free!2823 () Bool)

(declare-fun b_next!2823 () Bool)

(assert (=> b!123954 (= b_free!2823 (not b_next!2823))))

(declare-fun tp!10858 () Bool)

(declare-fun b_and!7609 () Bool)

(assert (=> b!123954 (= tp!10858 b_and!7609)))

(declare-fun mapNonEmpty!4445 () Bool)

(declare-fun mapRes!4445 () Bool)

(declare-fun tp!10860 () Bool)

(declare-fun e!81010 () Bool)

(assert (=> mapNonEmpty!4445 (= mapRes!4445 (and tp!10860 e!81010))))

(declare-fun mapKey!4446 () (_ BitVec 32))

(declare-datatypes ((V!3417 0))(
  ( (V!3418 (val!1458 Int)) )
))
(declare-datatypes ((ValueCell!1070 0))(
  ( (ValueCellFull!1070 (v!3097 V!3417)) (EmptyCell!1070) )
))
(declare-fun mapRest!4445 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapValue!4446 () ValueCell!1070)

(declare-datatypes ((array!4667 0))(
  ( (array!4668 (arr!2211 (Array (_ BitVec 32) (_ BitVec 64))) (size!2474 (_ BitVec 32))) )
))
(declare-datatypes ((array!4669 0))(
  ( (array!4670 (arr!2212 (Array (_ BitVec 32) ValueCell!1070)) (size!2475 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1048 0))(
  ( (LongMapFixedSize!1049 (defaultEntry!2759 Int) (mask!7002 (_ BitVec 32)) (extraKeys!2544 (_ BitVec 32)) (zeroValue!2624 V!3417) (minValue!2624 V!3417) (_size!573 (_ BitVec 32)) (_keys!4488 array!4667) (_values!2742 array!4669) (_vacant!573 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1048)

(assert (=> mapNonEmpty!4445 (= (arr!2212 (_values!2742 newMap!16)) (store mapRest!4445 mapKey!4446 mapValue!4446))))

(declare-fun b!123939 () Bool)

(declare-fun e!81011 () Bool)

(declare-fun e!81001 () Bool)

(declare-fun mapRes!4446 () Bool)

(assert (=> b!123939 (= e!81011 (and e!81001 mapRes!4446))))

(declare-fun condMapEmpty!4446 () Bool)

(declare-datatypes ((Cell!842 0))(
  ( (Cell!843 (v!3098 LongMapFixedSize!1048)) )
))
(declare-datatypes ((LongMap!842 0))(
  ( (LongMap!843 (underlying!432 Cell!842)) )
))
(declare-fun thiss!992 () LongMap!842)

(declare-fun mapDefault!4446 () ValueCell!1070)

