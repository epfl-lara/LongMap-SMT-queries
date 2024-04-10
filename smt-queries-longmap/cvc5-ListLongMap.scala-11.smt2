; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!444 () Bool)

(assert start!444)

(declare-fun b!2614 () Bool)

(declare-fun b_free!61 () Bool)

(declare-fun b_next!61 () Bool)

(assert (=> b!2614 (= b_free!61 (not b_next!61))))

(declare-fun tp!247 () Bool)

(declare-fun b_and!199 () Bool)

(assert (=> b!2614 (= tp!247 b_and!199)))

(declare-fun b!2612 () Bool)

(declare-fun e!940 () Bool)

(declare-fun tp_is_empty!49 () Bool)

(assert (=> b!2612 (= e!940 tp_is_empty!49)))

(declare-fun mapNonEmpty!14 () Bool)

(declare-fun mapRes!14 () Bool)

(declare-fun tp!248 () Bool)

(declare-fun e!938 () Bool)

(assert (=> mapNonEmpty!14 (= mapRes!14 (and tp!248 e!938))))

(declare-datatypes ((V!243 0))(
  ( (V!244 (val!30 Int)) )
))
(declare-datatypes ((ValueCell!8 0))(
  ( (ValueCellFull!8 (v!1113 V!243)) (EmptyCell!8) )
))
(declare-datatypes ((array!29 0))(
  ( (array!30 (arr!13 (Array (_ BitVec 32) ValueCell!8)) (size!75 (_ BitVec 32))) )
))
(declare-datatypes ((array!31 0))(
  ( (array!32 (arr!14 (Array (_ BitVec 32) (_ BitVec 64))) (size!76 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!16 0))(
  ( (LongMapFixedSize!17 (defaultEntry!1592 Int) (mask!4170 (_ BitVec 32)) (extraKeys!1509 (_ BitVec 32)) (zeroValue!1532 V!243) (minValue!1532 V!243) (_size!39 (_ BitVec 32)) (_keys!2994 array!31) (_values!1593 array!29) (_vacant!39 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!16 0))(
  ( (Cell!17 (v!1114 LongMapFixedSize!16)) )
))
(declare-datatypes ((LongMap!16 0))(
  ( (LongMap!17 (underlying!19 Cell!16)) )
))
(declare-fun thiss!814 () LongMap!16)

(declare-fun mapRest!14 () (Array (_ BitVec 32) ValueCell!8))

(declare-fun mapValue!14 () ValueCell!8)

(declare-fun mapKey!14 () (_ BitVec 32))

(assert (=> mapNonEmpty!14 (= (arr!13 (_values!1593 (v!1114 (underlying!19 thiss!814)))) (store mapRest!14 mapKey!14 mapValue!14))))

(declare-fun b!2613 () Bool)

(declare-fun e!945 () Bool)

(declare-fun e!941 () Bool)

(assert (=> b!2613 (= e!945 e!941)))

(declare-fun mapIsEmpty!14 () Bool)

(assert (=> mapIsEmpty!14 mapRes!14))

(declare-fun b!2615 () Bool)

(declare-fun e!943 () Bool)

(assert (=> b!2615 (= e!943 false)))

(declare-fun lt!371 () Bool)

(declare-fun isEmpty!43 (LongMapFixedSize!16) Bool)

(assert (=> b!2615 (= lt!371 (isEmpty!43 (v!1114 (underlying!19 thiss!814))))))

(declare-fun b!2616 () Bool)

(declare-fun e!942 () Bool)

(assert (=> b!2616 (= e!942 (and e!940 mapRes!14))))

(declare-fun condMapEmpty!14 () Bool)

(declare-fun mapDefault!14 () ValueCell!8)
