; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14258 () Bool)

(assert start!14258)

(declare-fun b!132238 () Bool)

(declare-fun b_free!2917 () Bool)

(declare-fun b_next!2917 () Bool)

(assert (=> b!132238 (= b_free!2917 (not b_next!2917))))

(declare-fun tp!11196 () Bool)

(declare-fun b_and!8187 () Bool)

(assert (=> b!132238 (= tp!11196 b_and!8187)))

(declare-fun b!132253 () Bool)

(declare-fun b_free!2919 () Bool)

(declare-fun b_next!2919 () Bool)

(assert (=> b!132253 (= b_free!2919 (not b_next!2919))))

(declare-fun tp!11195 () Bool)

(declare-fun b_and!8189 () Bool)

(assert (=> b!132253 (= tp!11195 b_and!8189)))

(declare-fun res!63712 () Bool)

(declare-fun e!86233 () Bool)

(assert (=> start!14258 (=> (not res!63712) (not e!86233))))

(declare-datatypes ((V!3481 0))(
  ( (V!3482 (val!1482 Int)) )
))
(declare-datatypes ((array!4777 0))(
  ( (array!4778 (arr!2259 (Array (_ BitVec 32) (_ BitVec 64))) (size!2528 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1094 0))(
  ( (ValueCellFull!1094 (v!3196 V!3481)) (EmptyCell!1094) )
))
(declare-datatypes ((array!4779 0))(
  ( (array!4780 (arr!2260 (Array (_ BitVec 32) ValueCell!1094)) (size!2529 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1096 0))(
  ( (LongMapFixedSize!1097 (defaultEntry!2864 Int) (mask!7164 (_ BitVec 32)) (extraKeys!2629 (_ BitVec 32)) (zeroValue!2719 V!3481) (minValue!2719 V!3481) (_size!597 (_ BitVec 32)) (_keys!4613 array!4777) (_values!2847 array!4779) (_vacant!597 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!886 0))(
  ( (Cell!887 (v!3197 LongMapFixedSize!1096)) )
))
(declare-datatypes ((LongMap!886 0))(
  ( (LongMap!887 (underlying!454 Cell!886)) )
))
(declare-fun thiss!992 () LongMap!886)

(declare-fun valid!522 (LongMap!886) Bool)

(assert (=> start!14258 (= res!63712 (valid!522 thiss!992))))

(assert (=> start!14258 e!86233))

(declare-fun e!86230 () Bool)

(assert (=> start!14258 e!86230))

(assert (=> start!14258 true))

(declare-fun e!86231 () Bool)

(assert (=> start!14258 e!86231))

(declare-fun tp_is_empty!2875 () Bool)

(declare-fun e!86226 () Bool)

(declare-fun e!86225 () Bool)

(declare-fun array_inv!1421 (array!4777) Bool)

(declare-fun array_inv!1422 (array!4779) Bool)

(assert (=> b!132238 (= e!86226 (and tp!11196 tp_is_empty!2875 (array_inv!1421 (_keys!4613 (v!3197 (underlying!454 thiss!992)))) (array_inv!1422 (_values!2847 (v!3197 (underlying!454 thiss!992)))) e!86225))))

(declare-fun mapIsEmpty!4637 () Bool)

(declare-fun mapRes!4638 () Bool)

(assert (=> mapIsEmpty!4637 mapRes!4638))

(declare-fun b!132239 () Bool)

(declare-fun e!86224 () Bool)

(assert (=> b!132239 (= e!86224 e!86226)))

(declare-fun b!132240 () Bool)

(declare-fun res!63707 () Bool)

(assert (=> b!132240 (=> (not res!63707) (not e!86233))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!132240 (= res!63707 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2528 (_keys!4613 (v!3197 (underlying!454 thiss!992)))))))))

(declare-fun b!132241 () Bool)

(declare-fun e!86234 () Bool)

(assert (=> b!132241 (= e!86225 (and e!86234 mapRes!4638))))

(declare-fun condMapEmpty!4638 () Bool)

(declare-fun mapDefault!4637 () ValueCell!1094)

