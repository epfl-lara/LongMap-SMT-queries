; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13226 () Bool)

(assert start!13226)

(declare-fun b!116586 () Bool)

(declare-fun b_free!2757 () Bool)

(declare-fun b_next!2757 () Bool)

(assert (=> b!116586 (= b_free!2757 (not b_next!2757))))

(declare-fun tp!10643 () Bool)

(declare-fun b_and!7263 () Bool)

(assert (=> b!116586 (= tp!10643 b_and!7263)))

(declare-fun b!116583 () Bool)

(declare-fun b_free!2759 () Bool)

(declare-fun b_next!2759 () Bool)

(assert (=> b!116583 (= b_free!2759 (not b_next!2759))))

(declare-fun tp!10646 () Bool)

(declare-fun b_and!7265 () Bool)

(assert (=> b!116583 (= tp!10646 b_and!7265)))

(declare-fun b!116580 () Bool)

(declare-fun res!57096 () Bool)

(declare-fun e!76153 () Bool)

(assert (=> b!116580 (=> (not res!57096) (not e!76153))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3373 0))(
  ( (V!3374 (val!1442 Int)) )
))
(declare-datatypes ((array!4597 0))(
  ( (array!4598 (arr!2179 (Array (_ BitVec 32) (_ BitVec 64))) (size!2440 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1054 0))(
  ( (ValueCellFull!1054 (v!3053 V!3373)) (EmptyCell!1054) )
))
(declare-datatypes ((array!4599 0))(
  ( (array!4600 (arr!2180 (Array (_ BitVec 32) ValueCell!1054)) (size!2441 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1016 0))(
  ( (LongMapFixedSize!1017 (defaultEntry!2720 Int) (mask!6938 (_ BitVec 32)) (extraKeys!2509 (_ BitVec 32)) (zeroValue!2587 V!3373) (minValue!2587 V!3373) (_size!557 (_ BitVec 32)) (_keys!4443 array!4597) (_values!2703 array!4599) (_vacant!557 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!814 0))(
  ( (Cell!815 (v!3054 LongMapFixedSize!1016)) )
))
(declare-datatypes ((LongMap!814 0))(
  ( (LongMap!815 (underlying!418 Cell!814)) )
))
(declare-fun thiss!992 () LongMap!814)

(assert (=> b!116580 (= res!57096 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2440 (_keys!4443 (v!3054 (underlying!418 thiss!992)))))))))

(declare-fun b!116581 () Bool)

(declare-fun e!76152 () Bool)

(declare-fun e!76159 () Bool)

(assert (=> b!116581 (= e!76152 e!76159)))

(declare-fun b!116582 () Bool)

(declare-fun res!57098 () Bool)

(assert (=> b!116582 (=> (not res!57098) (not e!76153))))

(declare-fun newMap!16 () LongMapFixedSize!1016)

(assert (=> b!116582 (= res!57098 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6938 newMap!16)) (_size!557 (v!3054 (underlying!418 thiss!992)))))))

(declare-fun b!116584 () Bool)

(declare-fun e!76149 () Bool)

(declare-fun tp_is_empty!2795 () Bool)

(assert (=> b!116584 (= e!76149 tp_is_empty!2795)))

(declare-fun b!116585 () Bool)

(declare-fun e!76156 () Bool)

(declare-fun e!76157 () Bool)

(declare-fun mapRes!4327 () Bool)

(assert (=> b!116585 (= e!76156 (and e!76157 mapRes!4327))))

(declare-fun condMapEmpty!4328 () Bool)

(declare-fun mapDefault!4328 () ValueCell!1054)

