; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76218 () Bool)

(assert start!76218)

(declare-fun b!894975 () Bool)

(declare-fun b_free!15889 () Bool)

(declare-fun b_next!15889 () Bool)

(assert (=> b!894975 (= b_free!15889 (not b_next!15889))))

(declare-fun tp!55666 () Bool)

(declare-fun b_and!26181 () Bool)

(assert (=> b!894975 (= tp!55666 b_and!26181)))

(declare-fun res!605536 () Bool)

(declare-fun e!499970 () Bool)

(assert (=> start!76218 (=> (not res!605536) (not e!499970))))

(declare-datatypes ((array!52430 0))(
  ( (array!52431 (arr!25213 (Array (_ BitVec 32) (_ BitVec 64))) (size!25661 (_ BitVec 32))) )
))
(declare-datatypes ((V!29255 0))(
  ( (V!29256 (val!9159 Int)) )
))
(declare-datatypes ((ValueCell!8627 0))(
  ( (ValueCellFull!8627 (v!11649 V!29255)) (EmptyCell!8627) )
))
(declare-datatypes ((array!52432 0))(
  ( (array!52433 (arr!25214 (Array (_ BitVec 32) ValueCell!8627)) (size!25662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4270 0))(
  ( (LongMapFixedSize!4271 (defaultEntry!5347 Int) (mask!25926 (_ BitVec 32)) (extraKeys!5043 (_ BitVec 32)) (zeroValue!5147 V!29255) (minValue!5147 V!29255) (_size!2190 (_ BitVec 32)) (_keys!10053 array!52430) (_values!5334 array!52432) (_vacant!2190 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4270)

(declare-fun valid!1647 (LongMapFixedSize!4270) Bool)

(assert (=> start!76218 (= res!605536 (valid!1647 thiss!1181))))

(assert (=> start!76218 e!499970))

(declare-fun e!499971 () Bool)

(assert (=> start!76218 e!499971))

(assert (=> start!76218 true))

(declare-fun e!499974 () Bool)

(declare-fun tp_is_empty!18217 () Bool)

(declare-fun array_inv!19796 (array!52430) Bool)

(declare-fun array_inv!19797 (array!52432) Bool)

(assert (=> b!894975 (= e!499971 (and tp!55666 tp_is_empty!18217 (array_inv!19796 (_keys!10053 thiss!1181)) (array_inv!19797 (_values!5334 thiss!1181)) e!499974))))

(declare-fun b!894976 () Bool)

(declare-fun e!499973 () Bool)

(assert (=> b!894976 (= e!499973 tp_is_empty!18217)))

(declare-fun b!894977 () Bool)

(declare-fun mapRes!28910 () Bool)

(assert (=> b!894977 (= e!499974 (and e!499973 mapRes!28910))))

(declare-fun condMapEmpty!28910 () Bool)

(declare-fun mapDefault!28910 () ValueCell!8627)

