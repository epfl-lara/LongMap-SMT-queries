; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90104 () Bool)

(assert start!90104)

(declare-fun b!1032233 () Bool)

(declare-fun b_free!20711 () Bool)

(declare-fun b_next!20711 () Bool)

(assert (=> b!1032233 (= b_free!20711 (not b_next!20711))))

(declare-fun tp!73204 () Bool)

(declare-fun b_and!33179 () Bool)

(assert (=> b!1032233 (= tp!73204 b_and!33179)))

(declare-fun b!1032228 () Bool)

(declare-fun e!583180 () Bool)

(declare-fun tp_is_empty!24431 () Bool)

(assert (=> b!1032228 (= e!583180 tp_is_empty!24431)))

(declare-fun res!689963 () Bool)

(declare-fun e!583185 () Bool)

(assert (=> start!90104 (=> (not res!689963) (not e!583185))))

(declare-datatypes ((V!37447 0))(
  ( (V!37448 (val!12266 Int)) )
))
(declare-datatypes ((ValueCell!11512 0))(
  ( (ValueCellFull!11512 (v!14843 V!37447)) (EmptyCell!11512) )
))
(declare-datatypes ((array!64926 0))(
  ( (array!64927 (arr!31265 (Array (_ BitVec 32) (_ BitVec 64))) (size!31782 (_ BitVec 32))) )
))
(declare-datatypes ((array!64928 0))(
  ( (array!64929 (arr!31266 (Array (_ BitVec 32) ValueCell!11512)) (size!31783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5618 0))(
  ( (LongMapFixedSize!5619 (defaultEntry!6183 Int) (mask!29995 (_ BitVec 32)) (extraKeys!5915 (_ BitVec 32)) (zeroValue!6019 V!37447) (minValue!6019 V!37447) (_size!2864 (_ BitVec 32)) (_keys!11356 array!64926) (_values!6206 array!64928) (_vacant!2864 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5618)

(declare-fun valid!2126 (LongMapFixedSize!5618) Bool)

(assert (=> start!90104 (= res!689963 (valid!2126 thiss!1427))))

(assert (=> start!90104 e!583185))

(declare-fun e!583184 () Bool)

(assert (=> start!90104 e!583184))

(assert (=> start!90104 true))

(declare-fun b!1032229 () Bool)

(assert (=> b!1032229 (= e!583185 false)))

(declare-datatypes ((SeekEntryResult!9726 0))(
  ( (MissingZero!9726 (index!41275 (_ BitVec 32))) (Found!9726 (index!41276 (_ BitVec 32))) (Intermediate!9726 (undefined!10538 Bool) (index!41277 (_ BitVec 32)) (x!91966 (_ BitVec 32))) (Undefined!9726) (MissingVacant!9726 (index!41278 (_ BitVec 32))) )
))
(declare-fun lt!456011 () SeekEntryResult!9726)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64926 (_ BitVec 32)) SeekEntryResult!9726)

(assert (=> b!1032229 (= lt!456011 (seekEntry!0 key!909 (_keys!11356 thiss!1427) (mask!29995 thiss!1427)))))

(declare-fun mapIsEmpty!38100 () Bool)

(declare-fun mapRes!38100 () Bool)

(assert (=> mapIsEmpty!38100 mapRes!38100))

(declare-fun mapNonEmpty!38100 () Bool)

(declare-fun tp!73203 () Bool)

(assert (=> mapNonEmpty!38100 (= mapRes!38100 (and tp!73203 e!583180))))

(declare-fun mapKey!38100 () (_ BitVec 32))

(declare-fun mapValue!38100 () ValueCell!11512)

(declare-fun mapRest!38100 () (Array (_ BitVec 32) ValueCell!11512))

(assert (=> mapNonEmpty!38100 (= (arr!31266 (_values!6206 thiss!1427)) (store mapRest!38100 mapKey!38100 mapValue!38100))))

(declare-fun b!1032230 () Bool)

(declare-fun e!583181 () Bool)

(declare-fun e!583183 () Bool)

(assert (=> b!1032230 (= e!583181 (and e!583183 mapRes!38100))))

(declare-fun condMapEmpty!38100 () Bool)

(declare-fun mapDefault!38100 () ValueCell!11512)

