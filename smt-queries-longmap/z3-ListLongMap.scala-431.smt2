; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8088 () Bool)

(assert start!8088)

(declare-fun b!50760 () Bool)

(declare-fun b_free!1561 () Bool)

(declare-fun b_next!1561 () Bool)

(assert (=> b!50760 (= b_free!1561 (not b_next!1561))))

(declare-fun tp!6758 () Bool)

(declare-fun b_and!2769 () Bool)

(assert (=> b!50760 (= tp!6758 b_and!2769)))

(declare-fun b!50756 () Bool)

(declare-fun b_free!1563 () Bool)

(declare-fun b_next!1563 () Bool)

(assert (=> b!50756 (= b_free!1563 (not b_next!1563))))

(declare-fun tp!6756 () Bool)

(declare-fun b_and!2771 () Bool)

(assert (=> b!50756 (= tp!6756 b_and!2771)))

(declare-fun b!50751 () Bool)

(declare-fun res!29160 () Bool)

(declare-fun e!32829 () Bool)

(assert (=> b!50751 (=> (not res!29160) (not e!32829))))

(declare-datatypes ((V!2577 0))(
  ( (V!2578 (val!1143 Int)) )
))
(declare-datatypes ((array!3295 0))(
  ( (array!3296 (arr!1574 (Array (_ BitVec 32) (_ BitVec 64))) (size!1799 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!755 0))(
  ( (ValueCellFull!755 (v!2174 V!2577)) (EmptyCell!755) )
))
(declare-datatypes ((array!3297 0))(
  ( (array!3298 (arr!1575 (Array (_ BitVec 32) ValueCell!755)) (size!1800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!418 0))(
  ( (LongMapFixedSize!419 (defaultEntry!1923 Int) (mask!5720 (_ BitVec 32)) (extraKeys!1814 (_ BitVec 32)) (zeroValue!1841 V!2577) (minValue!1841 V!2577) (_size!258 (_ BitVec 32)) (_keys!3535 array!3295) (_values!1906 array!3297) (_vacant!258 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!418)

(declare-datatypes ((Cell!242 0))(
  ( (Cell!243 (v!2175 LongMapFixedSize!418)) )
))
(declare-datatypes ((LongMap!242 0))(
  ( (LongMap!243 (underlying!132 Cell!242)) )
))
(declare-fun thiss!992 () LongMap!242)

(assert (=> b!50751 (= res!29160 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5720 newMap!16)) (_size!258 (v!2175 (underlying!132 thiss!992)))))))

(declare-fun b!50752 () Bool)

(declare-fun e!32838 () Bool)

(declare-fun e!32831 () Bool)

(assert (=> b!50752 (= e!32838 e!32831)))

(declare-fun b!50753 () Bool)

(declare-fun e!32828 () Bool)

(declare-fun tp_is_empty!2197 () Bool)

(assert (=> b!50753 (= e!32828 tp_is_empty!2197)))

(declare-fun b!50755 () Bool)

(declare-fun res!29164 () Bool)

(assert (=> b!50755 (=> (not res!29164) (not e!32829))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50755 (= res!29164 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1799 (_keys!3535 (v!2175 (underlying!132 thiss!992)))))))))

(declare-fun e!32837 () Bool)

(declare-fun e!32830 () Bool)

(declare-fun array_inv!945 (array!3295) Bool)

(declare-fun array_inv!946 (array!3297) Bool)

(assert (=> b!50756 (= e!32837 (and tp!6756 tp_is_empty!2197 (array_inv!945 (_keys!3535 newMap!16)) (array_inv!946 (_values!1906 newMap!16)) e!32830))))

(declare-fun b!50757 () Bool)

(declare-fun e!32832 () Bool)

(declare-fun mapRes!2233 () Bool)

(assert (=> b!50757 (= e!32830 (and e!32832 mapRes!2233))))

(declare-fun condMapEmpty!2234 () Bool)

(declare-fun mapDefault!2234 () ValueCell!755)

(assert (=> b!50757 (= condMapEmpty!2234 (= (arr!1575 (_values!1906 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!755)) mapDefault!2234)))))

(declare-fun b!50758 () Bool)

(declare-fun e!32833 () Bool)

(assert (=> b!50758 (= e!32831 e!32833)))

(declare-fun b!50759 () Bool)

(declare-fun res!29162 () Bool)

(assert (=> b!50759 (=> (not res!29162) (not e!32829))))

(declare-fun valid!153 (LongMapFixedSize!418) Bool)

(assert (=> b!50759 (= res!29162 (valid!153 newMap!16))))

(declare-fun mapNonEmpty!2233 () Bool)

(declare-fun mapRes!2234 () Bool)

(declare-fun tp!6755 () Bool)

(declare-fun e!32827 () Bool)

(assert (=> mapNonEmpty!2233 (= mapRes!2234 (and tp!6755 e!32827))))

(declare-fun mapKey!2233 () (_ BitVec 32))

(declare-fun mapValue!2233 () ValueCell!755)

(declare-fun mapRest!2234 () (Array (_ BitVec 32) ValueCell!755))

(assert (=> mapNonEmpty!2233 (= (arr!1575 (_values!1906 (v!2175 (underlying!132 thiss!992)))) (store mapRest!2234 mapKey!2233 mapValue!2233))))

(declare-fun e!32835 () Bool)

(assert (=> b!50760 (= e!32833 (and tp!6758 tp_is_empty!2197 (array_inv!945 (_keys!3535 (v!2175 (underlying!132 thiss!992)))) (array_inv!946 (_values!1906 (v!2175 (underlying!132 thiss!992)))) e!32835))))

(declare-fun mapNonEmpty!2234 () Bool)

(declare-fun tp!6757 () Bool)

(declare-fun e!32826 () Bool)

(assert (=> mapNonEmpty!2234 (= mapRes!2233 (and tp!6757 e!32826))))

(declare-fun mapKey!2234 () (_ BitVec 32))

(declare-fun mapRest!2233 () (Array (_ BitVec 32) ValueCell!755))

(declare-fun mapValue!2234 () ValueCell!755)

(assert (=> mapNonEmpty!2234 (= (arr!1575 (_values!1906 newMap!16)) (store mapRest!2233 mapKey!2234 mapValue!2234))))

(declare-fun b!50761 () Bool)

(assert (=> b!50761 (= e!32827 tp_is_empty!2197)))

(declare-fun b!50762 () Bool)

(assert (=> b!50762 (= e!32832 tp_is_empty!2197)))

(declare-fun b!50763 () Bool)

(assert (=> b!50763 (= e!32829 (and (= (size!1800 (_values!1906 (v!2175 (underlying!132 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5720 (v!2175 (underlying!132 thiss!992))))) (= (size!1799 (_keys!3535 (v!2175 (underlying!132 thiss!992)))) (size!1800 (_values!1906 (v!2175 (underlying!132 thiss!992))))) (bvslt (mask!5720 (v!2175 (underlying!132 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50764 () Bool)

(assert (=> b!50764 (= e!32835 (and e!32828 mapRes!2234))))

(declare-fun condMapEmpty!2233 () Bool)

(declare-fun mapDefault!2233 () ValueCell!755)

(assert (=> b!50764 (= condMapEmpty!2233 (= (arr!1575 (_values!1906 (v!2175 (underlying!132 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!755)) mapDefault!2233)))))

(declare-fun mapIsEmpty!2233 () Bool)

(assert (=> mapIsEmpty!2233 mapRes!2234))

(declare-fun res!29161 () Bool)

(assert (=> start!8088 (=> (not res!29161) (not e!32829))))

(declare-fun valid!154 (LongMap!242) Bool)

(assert (=> start!8088 (= res!29161 (valid!154 thiss!992))))

(assert (=> start!8088 e!32829))

(assert (=> start!8088 e!32838))

(assert (=> start!8088 true))

(assert (=> start!8088 e!32837))

(declare-fun b!50754 () Bool)

(assert (=> b!50754 (= e!32826 tp_is_empty!2197)))

(declare-fun b!50765 () Bool)

(declare-fun res!29163 () Bool)

(assert (=> b!50765 (=> (not res!29163) (not e!32829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50765 (= res!29163 (validMask!0 (mask!5720 (v!2175 (underlying!132 thiss!992)))))))

(declare-fun mapIsEmpty!2234 () Bool)

(assert (=> mapIsEmpty!2234 mapRes!2233))

(assert (= (and start!8088 res!29161) b!50755))

(assert (= (and b!50755 res!29164) b!50759))

(assert (= (and b!50759 res!29162) b!50751))

(assert (= (and b!50751 res!29160) b!50765))

(assert (= (and b!50765 res!29163) b!50763))

(assert (= (and b!50764 condMapEmpty!2233) mapIsEmpty!2233))

(assert (= (and b!50764 (not condMapEmpty!2233)) mapNonEmpty!2233))

(get-info :version)

(assert (= (and mapNonEmpty!2233 ((_ is ValueCellFull!755) mapValue!2233)) b!50761))

(assert (= (and b!50764 ((_ is ValueCellFull!755) mapDefault!2233)) b!50753))

(assert (= b!50760 b!50764))

(assert (= b!50758 b!50760))

(assert (= b!50752 b!50758))

(assert (= start!8088 b!50752))

(assert (= (and b!50757 condMapEmpty!2234) mapIsEmpty!2234))

(assert (= (and b!50757 (not condMapEmpty!2234)) mapNonEmpty!2234))

(assert (= (and mapNonEmpty!2234 ((_ is ValueCellFull!755) mapValue!2234)) b!50754))

(assert (= (and b!50757 ((_ is ValueCellFull!755) mapDefault!2234)) b!50762))

(assert (= b!50756 b!50757))

(assert (= start!8088 b!50756))

(declare-fun m!43823 () Bool)

(assert (=> mapNonEmpty!2234 m!43823))

(declare-fun m!43825 () Bool)

(assert (=> b!50765 m!43825))

(declare-fun m!43827 () Bool)

(assert (=> mapNonEmpty!2233 m!43827))

(declare-fun m!43829 () Bool)

(assert (=> start!8088 m!43829))

(declare-fun m!43831 () Bool)

(assert (=> b!50759 m!43831))

(declare-fun m!43833 () Bool)

(assert (=> b!50756 m!43833))

(declare-fun m!43835 () Bool)

(assert (=> b!50756 m!43835))

(declare-fun m!43837 () Bool)

(assert (=> b!50760 m!43837))

(declare-fun m!43839 () Bool)

(assert (=> b!50760 m!43839))

(check-sat (not b!50756) (not b!50759) (not b!50765) (not mapNonEmpty!2234) (not b_next!1563) (not mapNonEmpty!2233) (not b!50760) b_and!2769 (not b_next!1561) tp_is_empty!2197 (not start!8088) b_and!2771)
(check-sat b_and!2769 b_and!2771 (not b_next!1561) (not b_next!1563))
