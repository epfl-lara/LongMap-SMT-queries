; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75766 () Bool)

(assert start!75766)

(declare-fun b!891027 () Bool)

(declare-fun b_free!15737 () Bool)

(declare-fun b_next!15737 () Bool)

(assert (=> b!891027 (= b_free!15737 (not b_next!15737))))

(declare-fun tp!55179 () Bool)

(declare-fun b_and!25977 () Bool)

(assert (=> b!891027 (= tp!55179 b_and!25977)))

(declare-fun b!891026 () Bool)

(declare-fun e!497112 () Bool)

(declare-fun tp_is_empty!18065 () Bool)

(assert (=> b!891026 (= e!497112 tp_is_empty!18065)))

(declare-datatypes ((array!52110 0))(
  ( (array!52111 (arr!25061 (Array (_ BitVec 32) (_ BitVec 64))) (size!25505 (_ BitVec 32))) )
))
(declare-datatypes ((V!29051 0))(
  ( (V!29052 (val!9083 Int)) )
))
(declare-datatypes ((ValueCell!8551 0))(
  ( (ValueCellFull!8551 (v!11561 V!29051)) (EmptyCell!8551) )
))
(declare-datatypes ((array!52112 0))(
  ( (array!52113 (arr!25062 (Array (_ BitVec 32) ValueCell!8551)) (size!25506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4118 0))(
  ( (LongMapFixedSize!4119 (defaultEntry!5256 Int) (mask!25741 (_ BitVec 32)) (extraKeys!4950 (_ BitVec 32)) (zeroValue!5054 V!29051) (minValue!5054 V!29051) (_size!2114 (_ BitVec 32)) (_keys!9939 array!52110) (_values!5241 array!52112) (_vacant!2114 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4118)

(declare-fun e!497115 () Bool)

(declare-fun e!497111 () Bool)

(declare-fun array_inv!19698 (array!52110) Bool)

(declare-fun array_inv!19699 (array!52112) Bool)

(assert (=> b!891027 (= e!497111 (and tp!55179 tp_is_empty!18065 (array_inv!19698 (_keys!9939 thiss!1181)) (array_inv!19699 (_values!5241 thiss!1181)) e!497115))))

(declare-fun b!891028 () Bool)

(declare-fun e!497108 () Bool)

(declare-datatypes ((SeekEntryResult!8814 0))(
  ( (MissingZero!8814 (index!37627 (_ BitVec 32))) (Found!8814 (index!37628 (_ BitVec 32))) (Intermediate!8814 (undefined!9626 Bool) (index!37629 (_ BitVec 32)) (x!75702 (_ BitVec 32))) (Undefined!8814) (MissingVacant!8814 (index!37630 (_ BitVec 32))) )
))
(declare-fun lt!402513 () SeekEntryResult!8814)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891028 (= e!497108 (inRange!0 (index!37628 lt!402513) (mask!25741 thiss!1181)))))

(declare-fun b!891029 () Bool)

(declare-fun res!603699 () Bool)

(declare-fun e!497109 () Bool)

(assert (=> b!891029 (=> (not res!603699) (not e!497109))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891029 (= res!603699 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891030 () Bool)

(declare-fun res!603696 () Bool)

(declare-fun e!497113 () Bool)

(assert (=> b!891030 (=> res!603696 e!497113)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52110 (_ BitVec 32)) Bool)

(assert (=> b!891030 (= res!603696 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9939 thiss!1181) (mask!25741 thiss!1181))))))

(declare-fun b!891031 () Bool)

(assert (=> b!891031 (= e!497113 true)))

(declare-fun lt!402511 () Bool)

(declare-datatypes ((List!17732 0))(
  ( (Nil!17729) (Cons!17728 (h!18859 (_ BitVec 64)) (t!25031 List!17732)) )
))
(declare-fun arrayNoDuplicates!0 (array!52110 (_ BitVec 32) List!17732) Bool)

(assert (=> b!891031 (= lt!402511 (arrayNoDuplicates!0 (_keys!9939 thiss!1181) #b00000000000000000000000000000000 Nil!17729))))

(declare-fun mapIsEmpty!28652 () Bool)

(declare-fun mapRes!28652 () Bool)

(assert (=> mapIsEmpty!28652 mapRes!28652))

(declare-fun res!603695 () Bool)

(assert (=> start!75766 (=> (not res!603695) (not e!497109))))

(declare-fun valid!1599 (LongMapFixedSize!4118) Bool)

(assert (=> start!75766 (= res!603695 (valid!1599 thiss!1181))))

(assert (=> start!75766 e!497109))

(assert (=> start!75766 e!497111))

(assert (=> start!75766 true))

(declare-fun mapNonEmpty!28652 () Bool)

(declare-fun tp!55180 () Bool)

(declare-fun e!497110 () Bool)

(assert (=> mapNonEmpty!28652 (= mapRes!28652 (and tp!55180 e!497110))))

(declare-fun mapValue!28652 () ValueCell!8551)

(declare-fun mapKey!28652 () (_ BitVec 32))

(declare-fun mapRest!28652 () (Array (_ BitVec 32) ValueCell!8551))

(assert (=> mapNonEmpty!28652 (= (arr!25062 (_values!5241 thiss!1181)) (store mapRest!28652 mapKey!28652 mapValue!28652))))

(declare-fun b!891032 () Bool)

(assert (=> b!891032 (= e!497115 (and e!497112 mapRes!28652))))

(declare-fun condMapEmpty!28652 () Bool)

(declare-fun mapDefault!28652 () ValueCell!8551)

