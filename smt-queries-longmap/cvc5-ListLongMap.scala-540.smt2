; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13824 () Bool)

(assert start!13824)

(declare-fun b!127605 () Bool)

(declare-fun b_free!2869 () Bool)

(declare-fun b_next!2869 () Bool)

(assert (=> b!127605 (= b_free!2869 (not b_next!2869))))

(declare-fun tp!11023 () Bool)

(declare-fun b_and!7875 () Bool)

(assert (=> b!127605 (= tp!11023 b_and!7875)))

(declare-fun b!127593 () Bool)

(declare-fun b_free!2871 () Bool)

(declare-fun b_next!2871 () Bool)

(assert (=> b!127593 (= b_free!2871 (not b_next!2871))))

(declare-fun tp!11021 () Bool)

(declare-fun b_and!7877 () Bool)

(assert (=> b!127593 (= tp!11021 b_and!7877)))

(declare-fun b!127591 () Bool)

(declare-fun res!61673 () Bool)

(declare-fun e!83342 () Bool)

(assert (=> b!127591 (=> (not res!61673) (not e!83342))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3449 0))(
  ( (V!3450 (val!1470 Int)) )
))
(declare-datatypes ((array!4721 0))(
  ( (array!4722 (arr!2235 (Array (_ BitVec 32) (_ BitVec 64))) (size!2500 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1082 0))(
  ( (ValueCellFull!1082 (v!3143 V!3449)) (EmptyCell!1082) )
))
(declare-datatypes ((array!4723 0))(
  ( (array!4724 (arr!2236 (Array (_ BitVec 32) ValueCell!1082)) (size!2501 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1072 0))(
  ( (LongMapFixedSize!1073 (defaultEntry!2804 Int) (mask!7072 (_ BitVec 32)) (extraKeys!2581 (_ BitVec 32)) (zeroValue!2665 V!3449) (minValue!2665 V!3449) (_size!585 (_ BitVec 32)) (_keys!4541 array!4721) (_values!2787 array!4723) (_vacant!585 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!866 0))(
  ( (Cell!867 (v!3144 LongMapFixedSize!1072)) )
))
(declare-datatypes ((LongMap!866 0))(
  ( (LongMap!867 (underlying!444 Cell!866)) )
))
(declare-fun thiss!992 () LongMap!866)

(assert (=> b!127591 (= res!61673 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2500 (_keys!4541 (v!3144 (underlying!444 thiss!992)))))))))

(declare-fun b!127592 () Bool)

(declare-fun e!83340 () Bool)

(declare-fun e!83337 () Bool)

(declare-fun mapRes!4538 () Bool)

(assert (=> b!127592 (= e!83340 (and e!83337 mapRes!4538))))

(declare-fun condMapEmpty!4538 () Bool)

(declare-fun mapDefault!4537 () ValueCell!1082)

