; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90026 () Bool)

(assert start!90026)

(declare-fun b!1030924 () Bool)

(declare-fun b_free!20633 () Bool)

(declare-fun b_next!20633 () Bool)

(assert (=> b!1030924 (= b_free!20633 (not b_next!20633))))

(declare-fun tp!72969 () Bool)

(declare-fun b_and!33033 () Bool)

(assert (=> b!1030924 (= tp!72969 b_and!33033)))

(declare-fun b!1030922 () Bool)

(declare-fun res!689342 () Bool)

(declare-fun e!582211 () Bool)

(assert (=> b!1030922 (=> res!689342 e!582211)))

(declare-datatypes ((V!37343 0))(
  ( (V!37344 (val!12227 Int)) )
))
(declare-datatypes ((ValueCell!11473 0))(
  ( (ValueCellFull!11473 (v!14804 V!37343)) (EmptyCell!11473) )
))
(declare-datatypes ((Unit!33685 0))(
  ( (Unit!33686) )
))
(declare-datatypes ((array!64770 0))(
  ( (array!64771 (arr!31187 (Array (_ BitVec 32) (_ BitVec 64))) (size!31704 (_ BitVec 32))) )
))
(declare-datatypes ((array!64772 0))(
  ( (array!64773 (arr!31188 (Array (_ BitVec 32) ValueCell!11473)) (size!31705 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5540 0))(
  ( (LongMapFixedSize!5541 (defaultEntry!6144 Int) (mask!29930 (_ BitVec 32)) (extraKeys!5876 (_ BitVec 32)) (zeroValue!5980 V!37343) (minValue!5980 V!37343) (_size!2825 (_ BitVec 32)) (_keys!11317 array!64770) (_values!6167 array!64772) (_vacant!2825 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15612 0))(
  ( (tuple2!15613 (_1!7817 Unit!33685) (_2!7817 LongMapFixedSize!5540)) )
))
(declare-fun lt!454930 () tuple2!15612)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64770 (_ BitVec 32)) Bool)

(assert (=> b!1030922 (= res!689342 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11317 (_2!7817 lt!454930)) (mask!29930 (_2!7817 lt!454930)))))))

(declare-fun b!1030923 () Bool)

(declare-fun e!582207 () Bool)

(declare-fun e!582208 () Bool)

(declare-fun mapRes!37983 () Bool)

(assert (=> b!1030923 (= e!582207 (and e!582208 mapRes!37983))))

(declare-fun condMapEmpty!37983 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5540)

(declare-fun mapDefault!37983 () ValueCell!11473)

