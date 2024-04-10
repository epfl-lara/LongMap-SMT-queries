; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16080 () Bool)

(assert start!16080)

(declare-fun b!159726 () Bool)

(declare-fun b_free!3541 () Bool)

(declare-fun b_next!3541 () Bool)

(assert (=> b!159726 (= b_free!3541 (not b_next!3541))))

(declare-fun tp!13193 () Bool)

(declare-fun b_and!9955 () Bool)

(assert (=> b!159726 (= tp!13193 b_and!9955)))

(declare-fun mapIsEmpty!5702 () Bool)

(declare-fun mapRes!5702 () Bool)

(assert (=> mapIsEmpty!5702 mapRes!5702))

(declare-fun b!159727 () Bool)

(declare-fun e!104520 () Bool)

(assert (=> b!159727 (= e!104520 false)))

(declare-fun lt!82024 () Bool)

(declare-datatypes ((V!4105 0))(
  ( (V!4106 (val!1716 Int)) )
))
(declare-datatypes ((ValueCell!1328 0))(
  ( (ValueCellFull!1328 (v!3581 V!4105)) (EmptyCell!1328) )
))
(declare-datatypes ((array!5765 0))(
  ( (array!5766 (arr!2727 (Array (_ BitVec 32) (_ BitVec 64))) (size!3011 (_ BitVec 32))) )
))
(declare-datatypes ((array!5767 0))(
  ( (array!5768 (arr!2728 (Array (_ BitVec 32) ValueCell!1328)) (size!3012 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1564 0))(
  ( (LongMapFixedSize!1565 (defaultEntry!3224 Int) (mask!7780 (_ BitVec 32)) (extraKeys!2965 (_ BitVec 32)) (zeroValue!3067 V!4105) (minValue!3067 V!4105) (_size!831 (_ BitVec 32)) (_keys!5025 array!5765) (_values!3207 array!5767) (_vacant!831 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1564)

(declare-datatypes ((List!1917 0))(
  ( (Nil!1914) (Cons!1913 (h!2526 (_ BitVec 64)) (t!6719 List!1917)) )
))
(declare-fun arrayNoDuplicates!0 (array!5765 (_ BitVec 32) List!1917) Bool)

(assert (=> b!159727 (= lt!82024 (arrayNoDuplicates!0 (_keys!5025 thiss!1248) #b00000000000000000000000000000000 Nil!1914))))

(declare-fun b!159728 () Bool)

(declare-fun res!75513 () Bool)

(assert (=> b!159728 (=> (not res!75513) (not e!104520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5765 (_ BitVec 32)) Bool)

(assert (=> b!159728 (= res!75513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5025 thiss!1248) (mask!7780 thiss!1248)))))

(declare-fun b!159729 () Bool)

(declare-fun res!75516 () Bool)

(assert (=> b!159729 (=> (not res!75516) (not e!104520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159729 (= res!75516 (validMask!0 (mask!7780 thiss!1248)))))

(declare-fun b!159730 () Bool)

(declare-fun e!104519 () Bool)

(declare-fun e!104518 () Bool)

(assert (=> b!159730 (= e!104519 (and e!104518 mapRes!5702))))

(declare-fun condMapEmpty!5702 () Bool)

(declare-fun mapDefault!5702 () ValueCell!1328)

