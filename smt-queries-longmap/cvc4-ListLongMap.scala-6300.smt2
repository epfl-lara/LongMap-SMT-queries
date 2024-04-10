; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80588 () Bool)

(assert start!80588)

(declare-fun b!945983 () Bool)

(declare-fun b_free!18125 () Bool)

(declare-fun b_next!18125 () Bool)

(assert (=> b!945983 (= b_free!18125 (not b_next!18125))))

(declare-fun tp!62906 () Bool)

(declare-fun b_and!29547 () Bool)

(assert (=> b!945983 (= tp!62906 b_and!29547)))

(declare-fun b!945979 () Bool)

(declare-fun e!532184 () Bool)

(declare-fun tp_is_empty!20633 () Bool)

(assert (=> b!945979 (= e!532184 tp_is_empty!20633)))

(declare-fun mapNonEmpty!32796 () Bool)

(declare-fun mapRes!32796 () Bool)

(declare-fun tp!62905 () Bool)

(declare-fun e!532185 () Bool)

(assert (=> mapNonEmpty!32796 (= mapRes!32796 (and tp!62905 e!532185))))

(declare-fun mapKey!32796 () (_ BitVec 32))

(declare-datatypes ((V!32475 0))(
  ( (V!32476 (val!10367 Int)) )
))
(declare-datatypes ((ValueCell!9835 0))(
  ( (ValueCellFull!9835 (v!12901 V!32475)) (EmptyCell!9835) )
))
(declare-fun mapValue!32796 () ValueCell!9835)

(declare-datatypes ((array!57246 0))(
  ( (array!57247 (arr!27542 (Array (_ BitVec 32) ValueCell!9835)) (size!28011 (_ BitVec 32))) )
))
(declare-datatypes ((array!57248 0))(
  ( (array!57249 (arr!27543 (Array (_ BitVec 32) (_ BitVec 64))) (size!28012 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4820 0))(
  ( (LongMapFixedSize!4821 (defaultEntry!5707 Int) (mask!27392 (_ BitVec 32)) (extraKeys!5439 (_ BitVec 32)) (zeroValue!5543 V!32475) (minValue!5543 V!32475) (_size!2465 (_ BitVec 32)) (_keys!10594 array!57248) (_values!5730 array!57246) (_vacant!2465 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4820)

(declare-fun mapRest!32796 () (Array (_ BitVec 32) ValueCell!9835))

(assert (=> mapNonEmpty!32796 (= (arr!27542 (_values!5730 thiss!1141)) (store mapRest!32796 mapKey!32796 mapValue!32796))))

(declare-fun mapIsEmpty!32796 () Bool)

(assert (=> mapIsEmpty!32796 mapRes!32796))

(declare-fun b!945980 () Bool)

(assert (=> b!945980 (= e!532185 tp_is_empty!20633)))

(declare-fun b!945981 () Bool)

(declare-fun e!532183 () Bool)

(declare-fun e!532182 () Bool)

(assert (=> b!945981 (= e!532183 e!532182)))

(declare-fun res!635178 () Bool)

(assert (=> b!945981 (=> (not res!635178) (not e!532182))))

(declare-datatypes ((SeekEntryResult!9096 0))(
  ( (MissingZero!9096 (index!38755 (_ BitVec 32))) (Found!9096 (index!38756 (_ BitVec 32))) (Intermediate!9096 (undefined!9908 Bool) (index!38757 (_ BitVec 32)) (x!81316 (_ BitVec 32))) (Undefined!9096) (MissingVacant!9096 (index!38758 (_ BitVec 32))) )
))
(declare-fun lt!426155 () SeekEntryResult!9096)

(assert (=> b!945981 (= res!635178 (is-Found!9096 lt!426155))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57248 (_ BitVec 32)) SeekEntryResult!9096)

(assert (=> b!945981 (= lt!426155 (seekEntry!0 key!756 (_keys!10594 thiss!1141) (mask!27392 thiss!1141)))))

(declare-fun b!945982 () Bool)

(declare-fun res!635179 () Bool)

(assert (=> b!945982 (=> (not res!635179) (not e!532183))))

(assert (=> b!945982 (= res!635179 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!532181 () Bool)

(declare-fun e!532180 () Bool)

(declare-fun array_inv!21392 (array!57248) Bool)

(declare-fun array_inv!21393 (array!57246) Bool)

(assert (=> b!945983 (= e!532180 (and tp!62906 tp_is_empty!20633 (array_inv!21392 (_keys!10594 thiss!1141)) (array_inv!21393 (_values!5730 thiss!1141)) e!532181))))

(declare-fun b!945984 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945984 (= e!532182 (not (validMask!0 (mask!27392 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945984 (arrayContainsKey!0 (_keys!10594 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31894 0))(
  ( (Unit!31895) )
))
(declare-fun lt!426156 () Unit!31894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57248 (_ BitVec 64) (_ BitVec 32)) Unit!31894)

(assert (=> b!945984 (= lt!426156 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10594 thiss!1141) key!756 (index!38756 lt!426155)))))

(declare-fun b!945985 () Bool)

(assert (=> b!945985 (= e!532181 (and e!532184 mapRes!32796))))

(declare-fun condMapEmpty!32796 () Bool)

(declare-fun mapDefault!32796 () ValueCell!9835)

