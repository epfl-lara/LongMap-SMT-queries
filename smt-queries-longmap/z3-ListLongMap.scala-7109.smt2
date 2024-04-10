; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90102 () Bool)

(assert start!90102)

(declare-fun b!1032214 () Bool)

(declare-fun b_free!20709 () Bool)

(declare-fun b_next!20709 () Bool)

(assert (=> b!1032214 (= b_free!20709 (not b_next!20709))))

(declare-fun tp!73198 () Bool)

(declare-fun b_and!33177 () Bool)

(assert (=> b!1032214 (= tp!73198 b_and!33177)))

(declare-fun b!1032210 () Bool)

(declare-fun e!583162 () Bool)

(declare-fun tp_is_empty!24429 () Bool)

(assert (=> b!1032210 (= e!583162 tp_is_empty!24429)))

(declare-fun b!1032211 () Bool)

(declare-fun e!583167 () Bool)

(assert (=> b!1032211 (= e!583167 tp_is_empty!24429)))

(declare-fun b!1032213 () Bool)

(declare-fun e!583165 () Bool)

(assert (=> b!1032213 (= e!583165 false)))

(declare-datatypes ((SeekEntryResult!9725 0))(
  ( (MissingZero!9725 (index!41271 (_ BitVec 32))) (Found!9725 (index!41272 (_ BitVec 32))) (Intermediate!9725 (undefined!10537 Bool) (index!41273 (_ BitVec 32)) (x!91965 (_ BitVec 32))) (Undefined!9725) (MissingVacant!9725 (index!41274 (_ BitVec 32))) )
))
(declare-fun lt!456008 () SeekEntryResult!9725)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37445 0))(
  ( (V!37446 (val!12265 Int)) )
))
(declare-datatypes ((ValueCell!11511 0))(
  ( (ValueCellFull!11511 (v!14842 V!37445)) (EmptyCell!11511) )
))
(declare-datatypes ((array!64922 0))(
  ( (array!64923 (arr!31263 (Array (_ BitVec 32) (_ BitVec 64))) (size!31780 (_ BitVec 32))) )
))
(declare-datatypes ((array!64924 0))(
  ( (array!64925 (arr!31264 (Array (_ BitVec 32) ValueCell!11511)) (size!31781 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5616 0))(
  ( (LongMapFixedSize!5617 (defaultEntry!6182 Int) (mask!29994 (_ BitVec 32)) (extraKeys!5914 (_ BitVec 32)) (zeroValue!6018 V!37445) (minValue!6018 V!37445) (_size!2863 (_ BitVec 32)) (_keys!11355 array!64922) (_values!6205 array!64924) (_vacant!2863 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5616)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64922 (_ BitVec 32)) SeekEntryResult!9725)

(assert (=> b!1032213 (= lt!456008 (seekEntry!0 key!909 (_keys!11355 thiss!1427) (mask!29994 thiss!1427)))))

(declare-fun e!583166 () Bool)

(declare-fun e!583163 () Bool)

(declare-fun array_inv!24199 (array!64922) Bool)

(declare-fun array_inv!24200 (array!64924) Bool)

(assert (=> b!1032214 (= e!583163 (and tp!73198 tp_is_empty!24429 (array_inv!24199 (_keys!11355 thiss!1427)) (array_inv!24200 (_values!6205 thiss!1427)) e!583166))))

(declare-fun mapNonEmpty!38097 () Bool)

(declare-fun mapRes!38097 () Bool)

(declare-fun tp!73197 () Bool)

(assert (=> mapNonEmpty!38097 (= mapRes!38097 (and tp!73197 e!583162))))

(declare-fun mapValue!38097 () ValueCell!11511)

(declare-fun mapRest!38097 () (Array (_ BitVec 32) ValueCell!11511))

(declare-fun mapKey!38097 () (_ BitVec 32))

(assert (=> mapNonEmpty!38097 (= (arr!31264 (_values!6205 thiss!1427)) (store mapRest!38097 mapKey!38097 mapValue!38097))))

(declare-fun res!689957 () Bool)

(assert (=> start!90102 (=> (not res!689957) (not e!583165))))

(declare-fun valid!2125 (LongMapFixedSize!5616) Bool)

(assert (=> start!90102 (= res!689957 (valid!2125 thiss!1427))))

(assert (=> start!90102 e!583165))

(assert (=> start!90102 e!583163))

(assert (=> start!90102 true))

(declare-fun b!1032212 () Bool)

(assert (=> b!1032212 (= e!583166 (and e!583167 mapRes!38097))))

(declare-fun condMapEmpty!38097 () Bool)

(declare-fun mapDefault!38097 () ValueCell!11511)

(assert (=> b!1032212 (= condMapEmpty!38097 (= (arr!31264 (_values!6205 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11511)) mapDefault!38097)))))

(declare-fun mapIsEmpty!38097 () Bool)

(assert (=> mapIsEmpty!38097 mapRes!38097))

(declare-fun b!1032215 () Bool)

(declare-fun res!689956 () Bool)

(assert (=> b!1032215 (=> (not res!689956) (not e!583165))))

(assert (=> b!1032215 (= res!689956 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90102 res!689957) b!1032215))

(assert (= (and b!1032215 res!689956) b!1032213))

(assert (= (and b!1032212 condMapEmpty!38097) mapIsEmpty!38097))

(assert (= (and b!1032212 (not condMapEmpty!38097)) mapNonEmpty!38097))

(get-info :version)

(assert (= (and mapNonEmpty!38097 ((_ is ValueCellFull!11511) mapValue!38097)) b!1032210))

(assert (= (and b!1032212 ((_ is ValueCellFull!11511) mapDefault!38097)) b!1032211))

(assert (= b!1032214 b!1032212))

(assert (= start!90102 b!1032214))

(declare-fun m!952597 () Bool)

(assert (=> b!1032213 m!952597))

(declare-fun m!952599 () Bool)

(assert (=> b!1032214 m!952599))

(declare-fun m!952601 () Bool)

(assert (=> b!1032214 m!952601))

(declare-fun m!952603 () Bool)

(assert (=> mapNonEmpty!38097 m!952603))

(declare-fun m!952605 () Bool)

(assert (=> start!90102 m!952605))

(check-sat (not start!90102) (not mapNonEmpty!38097) (not b_next!20709) (not b!1032214) b_and!33177 tp_is_empty!24429 (not b!1032213))
(check-sat b_and!33177 (not b_next!20709))
