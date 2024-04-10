; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76188 () Bool)

(assert start!76188)

(declare-fun b!894783 () Bool)

(declare-fun b_free!15883 () Bool)

(declare-fun b_next!15883 () Bool)

(assert (=> b!894783 (= b_free!15883 (not b_next!15883))))

(declare-fun tp!55644 () Bool)

(declare-fun b_and!26175 () Bool)

(assert (=> b!894783 (= tp!55644 b_and!26175)))

(declare-fun b!894779 () Bool)

(declare-fun res!605463 () Bool)

(declare-fun e!499838 () Bool)

(assert (=> b!894779 (=> (not res!605463) (not e!499838))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894779 (= res!605463 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894780 () Bool)

(declare-fun e!499836 () Bool)

(declare-datatypes ((array!52416 0))(
  ( (array!52417 (arr!25207 (Array (_ BitVec 32) (_ BitVec 64))) (size!25654 (_ BitVec 32))) )
))
(declare-datatypes ((V!29247 0))(
  ( (V!29248 (val!9156 Int)) )
))
(declare-datatypes ((ValueCell!8624 0))(
  ( (ValueCellFull!8624 (v!11646 V!29247)) (EmptyCell!8624) )
))
(declare-datatypes ((array!52418 0))(
  ( (array!52419 (arr!25208 (Array (_ BitVec 32) ValueCell!8624)) (size!25655 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4264 0))(
  ( (LongMapFixedSize!4265 (defaultEntry!5344 Int) (mask!25915 (_ BitVec 32)) (extraKeys!5040 (_ BitVec 32)) (zeroValue!5144 V!29247) (minValue!5144 V!29247) (_size!2187 (_ BitVec 32)) (_keys!10046 array!52416) (_values!5331 array!52418) (_vacant!2187 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4264)

(assert (=> b!894780 (= e!499836 (and (= (size!25655 (_values!5331 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25915 thiss!1181))) (not (= (size!25654 (_keys!10046 thiss!1181)) (size!25655 (_values!5331 thiss!1181))))))))

(declare-fun b!894781 () Bool)

(assert (=> b!894781 (= e!499838 e!499836)))

(declare-fun res!605464 () Bool)

(assert (=> b!894781 (=> (not res!605464) (not e!499836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894781 (= res!605464 (validMask!0 (mask!25915 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8870 0))(
  ( (MissingZero!8870 (index!37851 (_ BitVec 32))) (Found!8870 (index!37852 (_ BitVec 32))) (Intermediate!8870 (undefined!9682 Bool) (index!37853 (_ BitVec 32)) (x!76091 (_ BitVec 32))) (Undefined!8870) (MissingVacant!8870 (index!37854 (_ BitVec 32))) )
))
(declare-fun lt!404359 () SeekEntryResult!8870)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52416 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!894781 (= lt!404359 (seekEntry!0 key!785 (_keys!10046 thiss!1181) (mask!25915 thiss!1181)))))

(declare-fun b!894782 () Bool)

(declare-fun e!499833 () Bool)

(declare-fun tp_is_empty!18211 () Bool)

(assert (=> b!894782 (= e!499833 tp_is_empty!18211)))

(declare-fun e!499837 () Bool)

(declare-fun e!499834 () Bool)

(declare-fun array_inv!19790 (array!52416) Bool)

(declare-fun array_inv!19791 (array!52418) Bool)

(assert (=> b!894783 (= e!499834 (and tp!55644 tp_is_empty!18211 (array_inv!19790 (_keys!10046 thiss!1181)) (array_inv!19791 (_values!5331 thiss!1181)) e!499837))))

(declare-fun b!894784 () Bool)

(declare-fun e!499835 () Bool)

(assert (=> b!894784 (= e!499835 tp_is_empty!18211)))

(declare-fun b!894785 () Bool)

(declare-fun mapRes!28897 () Bool)

(assert (=> b!894785 (= e!499837 (and e!499835 mapRes!28897))))

(declare-fun condMapEmpty!28897 () Bool)

(declare-fun mapDefault!28897 () ValueCell!8624)

