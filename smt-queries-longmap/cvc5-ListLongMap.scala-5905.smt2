; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76372 () Bool)

(assert start!76372)

(declare-fun b!895983 () Bool)

(declare-fun b_free!15931 () Bool)

(declare-fun b_next!15931 () Bool)

(assert (=> b!895983 (= b_free!15931 (not b_next!15931))))

(declare-fun tp!55815 () Bool)

(declare-fun b_and!26223 () Bool)

(assert (=> b!895983 (= tp!55815 b_and!26223)))

(declare-fun res!605956 () Bool)

(declare-fun e!500703 () Bool)

(assert (=> start!76372 (=> (not res!605956) (not e!500703))))

(declare-datatypes ((array!52528 0))(
  ( (array!52529 (arr!25255 (Array (_ BitVec 32) (_ BitVec 64))) (size!25705 (_ BitVec 32))) )
))
(declare-datatypes ((V!29311 0))(
  ( (V!29312 (val!9180 Int)) )
))
(declare-datatypes ((ValueCell!8648 0))(
  ( (ValueCellFull!8648 (v!11670 V!29311)) (EmptyCell!8648) )
))
(declare-datatypes ((array!52530 0))(
  ( (array!52531 (arr!25256 (Array (_ BitVec 32) ValueCell!8648)) (size!25706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4312 0))(
  ( (LongMapFixedSize!4313 (defaultEntry!5368 Int) (mask!25987 (_ BitVec 32)) (extraKeys!5065 (_ BitVec 32)) (zeroValue!5169 V!29311) (minValue!5169 V!29311) (_size!2211 (_ BitVec 32)) (_keys!10091 array!52528) (_values!5356 array!52530) (_vacant!2211 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4312)

(declare-fun valid!1663 (LongMapFixedSize!4312) Bool)

(assert (=> start!76372 (= res!605956 (valid!1663 thiss!1181))))

(assert (=> start!76372 e!500703))

(declare-fun e!500707 () Bool)

(assert (=> start!76372 e!500707))

(assert (=> start!76372 true))

(declare-fun b!895980 () Bool)

(declare-fun e!500702 () Bool)

(declare-datatypes ((SeekEntryResult!8889 0))(
  ( (MissingZero!8889 (index!37927 (_ BitVec 32))) (Found!8889 (index!37928 (_ BitVec 32))) (Intermediate!8889 (undefined!9701 Bool) (index!37929 (_ BitVec 32)) (x!76265 (_ BitVec 32))) (Undefined!8889) (MissingVacant!8889 (index!37930 (_ BitVec 32))) )
))
(declare-fun lt!404662 () SeekEntryResult!8889)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!895980 (= e!500702 (inRange!0 (index!37928 lt!404662) (mask!25987 thiss!1181)))))

(declare-fun b!895981 () Bool)

(declare-fun e!500705 () Bool)

(declare-fun tp_is_empty!18259 () Bool)

(assert (=> b!895981 (= e!500705 tp_is_empty!18259)))

(declare-fun b!895982 () Bool)

(assert (=> b!895982 (= e!500703 (not (or (not (is-Found!8889 lt!404662)) (bvslt (index!37928 lt!404662) #b00000000000000000000000000000000) (bvslt (index!37928 lt!404662) (size!25705 (_keys!10091 thiss!1181))))))))

(assert (=> b!895982 e!500702))

(declare-fun res!605955 () Bool)

(assert (=> b!895982 (=> res!605955 e!500702)))

(assert (=> b!895982 (= res!605955 (not (is-Found!8889 lt!404662)))))

(declare-datatypes ((Unit!30470 0))(
  ( (Unit!30471) )
))
(declare-fun lt!404661 () Unit!30470)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!63 (array!52528 array!52530 (_ BitVec 32) (_ BitVec 32) V!29311 V!29311 (_ BitVec 64)) Unit!30470)

(assert (=> b!895982 (= lt!404661 (lemmaSeekEntryGivesInRangeIndex!63 (_keys!10091 thiss!1181) (_values!5356 thiss!1181) (mask!25987 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52528 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!895982 (= lt!404662 (seekEntry!0 key!785 (_keys!10091 thiss!1181) (mask!25987 thiss!1181)))))

(declare-fun e!500708 () Bool)

(declare-fun array_inv!19826 (array!52528) Bool)

(declare-fun array_inv!19827 (array!52530) Bool)

(assert (=> b!895983 (= e!500707 (and tp!55815 tp_is_empty!18259 (array_inv!19826 (_keys!10091 thiss!1181)) (array_inv!19827 (_values!5356 thiss!1181)) e!500708))))

(declare-fun mapIsEmpty!28996 () Bool)

(declare-fun mapRes!28996 () Bool)

(assert (=> mapIsEmpty!28996 mapRes!28996))

(declare-fun mapNonEmpty!28996 () Bool)

(declare-fun tp!55814 () Bool)

(declare-fun e!500706 () Bool)

(assert (=> mapNonEmpty!28996 (= mapRes!28996 (and tp!55814 e!500706))))

(declare-fun mapKey!28996 () (_ BitVec 32))

(declare-fun mapRest!28996 () (Array (_ BitVec 32) ValueCell!8648))

(declare-fun mapValue!28996 () ValueCell!8648)

(assert (=> mapNonEmpty!28996 (= (arr!25256 (_values!5356 thiss!1181)) (store mapRest!28996 mapKey!28996 mapValue!28996))))

(declare-fun b!895984 () Bool)

(assert (=> b!895984 (= e!500708 (and e!500705 mapRes!28996))))

(declare-fun condMapEmpty!28996 () Bool)

(declare-fun mapDefault!28996 () ValueCell!8648)

