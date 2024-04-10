; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79974 () Bool)

(assert start!79974)

(declare-fun b!940132 () Bool)

(declare-fun b_free!17829 () Bool)

(declare-fun b_next!17829 () Bool)

(assert (=> b!940132 (= b_free!17829 (not b_next!17829))))

(declare-fun tp!61962 () Bool)

(declare-fun b_and!29241 () Bool)

(assert (=> b!940132 (= tp!61962 b_and!29241)))

(declare-fun mapNonEmpty!32296 () Bool)

(declare-fun mapRes!32296 () Bool)

(declare-fun tp!61961 () Bool)

(declare-fun e!528248 () Bool)

(assert (=> mapNonEmpty!32296 (= mapRes!32296 (and tp!61961 e!528248))))

(declare-datatypes ((V!32081 0))(
  ( (V!32082 (val!10219 Int)) )
))
(declare-datatypes ((ValueCell!9687 0))(
  ( (ValueCellFull!9687 (v!12750 V!32081)) (EmptyCell!9687) )
))
(declare-datatypes ((array!56622 0))(
  ( (array!56623 (arr!27246 (Array (_ BitVec 32) ValueCell!9687)) (size!27707 (_ BitVec 32))) )
))
(declare-datatypes ((array!56624 0))(
  ( (array!56625 (arr!27247 (Array (_ BitVec 32) (_ BitVec 64))) (size!27708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4524 0))(
  ( (LongMapFixedSize!4525 (defaultEntry!5553 Int) (mask!27086 (_ BitVec 32)) (extraKeys!5285 (_ BitVec 32)) (zeroValue!5389 V!32081) (minValue!5389 V!32081) (_size!2317 (_ BitVec 32)) (_keys!10403 array!56624) (_values!5576 array!56622) (_vacant!2317 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4524)

(declare-fun mapValue!32296 () ValueCell!9687)

(declare-fun mapKey!32296 () (_ BitVec 32))

(declare-fun mapRest!32296 () (Array (_ BitVec 32) ValueCell!9687))

(assert (=> mapNonEmpty!32296 (= (arr!27246 (_values!5576 thiss!1141)) (store mapRest!32296 mapKey!32296 mapValue!32296))))

(declare-fun tp_is_empty!20337 () Bool)

(declare-fun e!528246 () Bool)

(declare-fun e!528250 () Bool)

(declare-fun array_inv!21184 (array!56624) Bool)

(declare-fun array_inv!21185 (array!56622) Bool)

(assert (=> b!940132 (= e!528246 (and tp!61962 tp_is_empty!20337 (array_inv!21184 (_keys!10403 thiss!1141)) (array_inv!21185 (_values!5576 thiss!1141)) e!528250))))

(declare-fun b!940134 () Bool)

(declare-fun e!528249 () Bool)

(assert (=> b!940134 (= e!528250 (and e!528249 mapRes!32296))))

(declare-fun condMapEmpty!32296 () Bool)

(declare-fun mapDefault!32296 () ValueCell!9687)

(assert (=> b!940134 (= condMapEmpty!32296 (= (arr!27246 (_values!5576 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9687)) mapDefault!32296)))))

(declare-fun b!940135 () Bool)

(declare-fun e!528247 () Bool)

(assert (=> b!940135 (= e!528247 false)))

(declare-datatypes ((SeekEntryResult!8991 0))(
  ( (MissingZero!8991 (index!38335 (_ BitVec 32))) (Found!8991 (index!38336 (_ BitVec 32))) (Intermediate!8991 (undefined!9803 Bool) (index!38337 (_ BitVec 32)) (x!80620 (_ BitVec 32))) (Undefined!8991) (MissingVacant!8991 (index!38338 (_ BitVec 32))) )
))
(declare-fun lt!424621 () SeekEntryResult!8991)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56624 (_ BitVec 32)) SeekEntryResult!8991)

(assert (=> b!940135 (= lt!424621 (seekEntry!0 key!756 (_keys!10403 thiss!1141) (mask!27086 thiss!1141)))))

(declare-fun b!940136 () Bool)

(declare-fun res!632173 () Bool)

(assert (=> b!940136 (=> (not res!632173) (not e!528247))))

(assert (=> b!940136 (= res!632173 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32296 () Bool)

(assert (=> mapIsEmpty!32296 mapRes!32296))

(declare-fun b!940137 () Bool)

(assert (=> b!940137 (= e!528249 tp_is_empty!20337)))

(declare-fun b!940133 () Bool)

(assert (=> b!940133 (= e!528248 tp_is_empty!20337)))

(declare-fun res!632172 () Bool)

(assert (=> start!79974 (=> (not res!632172) (not e!528247))))

(declare-fun valid!1737 (LongMapFixedSize!4524) Bool)

(assert (=> start!79974 (= res!632172 (valid!1737 thiss!1141))))

(assert (=> start!79974 e!528247))

(assert (=> start!79974 e!528246))

(assert (=> start!79974 true))

(assert (= (and start!79974 res!632172) b!940136))

(assert (= (and b!940136 res!632173) b!940135))

(assert (= (and b!940134 condMapEmpty!32296) mapIsEmpty!32296))

(assert (= (and b!940134 (not condMapEmpty!32296)) mapNonEmpty!32296))

(get-info :version)

(assert (= (and mapNonEmpty!32296 ((_ is ValueCellFull!9687) mapValue!32296)) b!940133))

(assert (= (and b!940134 ((_ is ValueCellFull!9687) mapDefault!32296)) b!940137))

(assert (= b!940132 b!940134))

(assert (= start!79974 b!940132))

(declare-fun m!875693 () Bool)

(assert (=> mapNonEmpty!32296 m!875693))

(declare-fun m!875695 () Bool)

(assert (=> b!940132 m!875695))

(declare-fun m!875697 () Bool)

(assert (=> b!940132 m!875697))

(declare-fun m!875699 () Bool)

(assert (=> b!940135 m!875699))

(declare-fun m!875701 () Bool)

(assert (=> start!79974 m!875701))

(check-sat (not mapNonEmpty!32296) tp_is_empty!20337 (not b_next!17829) (not start!79974) (not b!940135) (not b!940132) b_and!29241)
(check-sat b_and!29241 (not b_next!17829))
