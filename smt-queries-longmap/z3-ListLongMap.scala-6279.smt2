; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80278 () Bool)

(assert start!80278)

(declare-fun b!943070 () Bool)

(declare-fun b_free!17995 () Bool)

(declare-fun b_next!17995 () Bool)

(assert (=> b!943070 (= b_free!17995 (not b_next!17995))))

(declare-fun tp!62492 () Bool)

(declare-fun b_and!29381 () Bool)

(assert (=> b!943070 (= tp!62492 b_and!29381)))

(declare-fun b!943061 () Bool)

(declare-fun e!530217 () Bool)

(declare-fun e!530221 () Bool)

(declare-fun mapRes!32576 () Bool)

(assert (=> b!943061 (= e!530217 (and e!530221 mapRes!32576))))

(declare-fun condMapEmpty!32576 () Bool)

(declare-datatypes ((V!32303 0))(
  ( (V!32304 (val!10302 Int)) )
))
(declare-datatypes ((ValueCell!9770 0))(
  ( (ValueCellFull!9770 (v!12832 V!32303)) (EmptyCell!9770) )
))
(declare-datatypes ((array!56937 0))(
  ( (array!56938 (arr!27395 (Array (_ BitVec 32) ValueCell!9770)) (size!27862 (_ BitVec 32))) )
))
(declare-datatypes ((array!56939 0))(
  ( (array!56940 (arr!27396 (Array (_ BitVec 32) (_ BitVec 64))) (size!27863 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4690 0))(
  ( (LongMapFixedSize!4691 (defaultEntry!5636 Int) (mask!27255 (_ BitVec 32)) (extraKeys!5368 (_ BitVec 32)) (zeroValue!5472 V!32303) (minValue!5472 V!32303) (_size!2400 (_ BitVec 32)) (_keys!10505 array!56939) (_values!5659 array!56937) (_vacant!2400 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4690)

(declare-fun mapDefault!32576 () ValueCell!9770)

(assert (=> b!943061 (= condMapEmpty!32576 (= (arr!27395 (_values!5659 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9770)) mapDefault!32576)))))

(declare-fun b!943062 () Bool)

(declare-fun res!633732 () Bool)

(declare-fun e!530220 () Bool)

(assert (=> b!943062 (=> (not res!633732) (not e!530220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943062 (= res!633732 (validMask!0 (mask!27255 thiss!1141)))))

(declare-fun b!943063 () Bool)

(declare-fun res!633729 () Bool)

(assert (=> b!943063 (=> (not res!633729) (not e!530220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56939 (_ BitVec 32)) Bool)

(assert (=> b!943063 (= res!633729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10505 thiss!1141) (mask!27255 thiss!1141)))))

(declare-fun b!943064 () Bool)

(declare-fun tp_is_empty!20503 () Bool)

(assert (=> b!943064 (= e!530221 tp_is_empty!20503)))

(declare-fun mapIsEmpty!32576 () Bool)

(assert (=> mapIsEmpty!32576 mapRes!32576))

(declare-fun b!943065 () Bool)

(declare-fun res!633727 () Bool)

(assert (=> b!943065 (=> (not res!633727) (not e!530220))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13490 0))(
  ( (tuple2!13491 (_1!6756 (_ BitVec 64)) (_2!6756 V!32303)) )
))
(declare-datatypes ((List!19257 0))(
  ( (Nil!19254) (Cons!19253 (h!20403 tuple2!13490) (t!27563 List!19257)) )
))
(declare-datatypes ((ListLongMap!12177 0))(
  ( (ListLongMap!12178 (toList!6104 List!19257)) )
))
(declare-fun contains!5117 (ListLongMap!12177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3267 (array!56939 array!56937 (_ BitVec 32) (_ BitVec 32) V!32303 V!32303 (_ BitVec 32) Int) ListLongMap!12177)

(assert (=> b!943065 (= res!633727 (contains!5117 (getCurrentListMap!3267 (_keys!10505 thiss!1141) (_values!5659 thiss!1141) (mask!27255 thiss!1141) (extraKeys!5368 thiss!1141) (zeroValue!5472 thiss!1141) (minValue!5472 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5636 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32576 () Bool)

(declare-fun tp!62491 () Bool)

(declare-fun e!530218 () Bool)

(assert (=> mapNonEmpty!32576 (= mapRes!32576 (and tp!62491 e!530218))))

(declare-fun mapRest!32576 () (Array (_ BitVec 32) ValueCell!9770))

(declare-fun mapKey!32576 () (_ BitVec 32))

(declare-fun mapValue!32576 () ValueCell!9770)

(assert (=> mapNonEmpty!32576 (= (arr!27395 (_values!5659 thiss!1141)) (store mapRest!32576 mapKey!32576 mapValue!32576))))

(declare-fun res!633730 () Bool)

(assert (=> start!80278 (=> (not res!633730) (not e!530220))))

(declare-fun valid!1801 (LongMapFixedSize!4690) Bool)

(assert (=> start!80278 (= res!633730 (valid!1801 thiss!1141))))

(assert (=> start!80278 e!530220))

(declare-fun e!530219 () Bool)

(assert (=> start!80278 e!530219))

(assert (=> start!80278 true))

(declare-fun b!943066 () Bool)

(declare-fun res!633731 () Bool)

(assert (=> b!943066 (=> (not res!633731) (not e!530220))))

(assert (=> b!943066 (= res!633731 (and (= (size!27862 (_values!5659 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27255 thiss!1141))) (= (size!27863 (_keys!10505 thiss!1141)) (size!27862 (_values!5659 thiss!1141))) (bvsge (mask!27255 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5368 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5368 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943067 () Bool)

(assert (=> b!943067 (= e!530220 false)))

(declare-fun lt!425006 () Bool)

(declare-datatypes ((List!19258 0))(
  ( (Nil!19255) (Cons!19254 (h!20404 (_ BitVec 64)) (t!27564 List!19258)) )
))
(declare-fun arrayNoDuplicates!0 (array!56939 (_ BitVec 32) List!19258) Bool)

(assert (=> b!943067 (= lt!425006 (arrayNoDuplicates!0 (_keys!10505 thiss!1141) #b00000000000000000000000000000000 Nil!19255))))

(declare-fun b!943068 () Bool)

(assert (=> b!943068 (= e!530218 tp_is_empty!20503)))

(declare-fun b!943069 () Bool)

(declare-fun res!633728 () Bool)

(assert (=> b!943069 (=> (not res!633728) (not e!530220))))

(assert (=> b!943069 (= res!633728 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21348 (array!56939) Bool)

(declare-fun array_inv!21349 (array!56937) Bool)

(assert (=> b!943070 (= e!530219 (and tp!62492 tp_is_empty!20503 (array_inv!21348 (_keys!10505 thiss!1141)) (array_inv!21349 (_values!5659 thiss!1141)) e!530217))))

(declare-fun b!943071 () Bool)

(declare-fun res!633726 () Bool)

(assert (=> b!943071 (=> (not res!633726) (not e!530220))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9049 0))(
  ( (MissingZero!9049 (index!38567 (_ BitVec 32))) (Found!9049 (index!38568 (_ BitVec 32))) (Intermediate!9049 (undefined!9861 Bool) (index!38569 (_ BitVec 32)) (x!81005 (_ BitVec 32))) (Undefined!9049) (MissingVacant!9049 (index!38570 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56939 (_ BitVec 32)) SeekEntryResult!9049)

(assert (=> b!943071 (= res!633726 (not ((_ is Found!9049) (seekEntry!0 key!756 (_keys!10505 thiss!1141) (mask!27255 thiss!1141)))))))

(assert (= (and start!80278 res!633730) b!943069))

(assert (= (and b!943069 res!633728) b!943071))

(assert (= (and b!943071 res!633726) b!943065))

(assert (= (and b!943065 res!633727) b!943062))

(assert (= (and b!943062 res!633732) b!943066))

(assert (= (and b!943066 res!633731) b!943063))

(assert (= (and b!943063 res!633729) b!943067))

(assert (= (and b!943061 condMapEmpty!32576) mapIsEmpty!32576))

(assert (= (and b!943061 (not condMapEmpty!32576)) mapNonEmpty!32576))

(assert (= (and mapNonEmpty!32576 ((_ is ValueCellFull!9770) mapValue!32576)) b!943068))

(assert (= (and b!943061 ((_ is ValueCellFull!9770) mapDefault!32576)) b!943064))

(assert (= b!943070 b!943061))

(assert (= start!80278 b!943070))

(declare-fun m!876761 () Bool)

(assert (=> b!943065 m!876761))

(assert (=> b!943065 m!876761))

(declare-fun m!876763 () Bool)

(assert (=> b!943065 m!876763))

(declare-fun m!876765 () Bool)

(assert (=> b!943063 m!876765))

(declare-fun m!876767 () Bool)

(assert (=> mapNonEmpty!32576 m!876767))

(declare-fun m!876769 () Bool)

(assert (=> b!943067 m!876769))

(declare-fun m!876771 () Bool)

(assert (=> b!943071 m!876771))

(declare-fun m!876773 () Bool)

(assert (=> b!943062 m!876773))

(declare-fun m!876775 () Bool)

(assert (=> start!80278 m!876775))

(declare-fun m!876777 () Bool)

(assert (=> b!943070 m!876777))

(declare-fun m!876779 () Bool)

(assert (=> b!943070 m!876779))

(check-sat (not start!80278) (not b!943065) (not b!943063) (not mapNonEmpty!32576) tp_is_empty!20503 (not b!943070) b_and!29381 (not b!943062) (not b!943071) (not b_next!17995) (not b!943067))
(check-sat b_and!29381 (not b_next!17995))
