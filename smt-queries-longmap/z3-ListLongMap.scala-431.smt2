; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8088 () Bool)

(assert start!8088)

(declare-fun b!50747 () Bool)

(declare-fun b_free!1561 () Bool)

(declare-fun b_next!1561 () Bool)

(assert (=> b!50747 (= b_free!1561 (not b_next!1561))))

(declare-fun tp!6755 () Bool)

(declare-fun b_and!2773 () Bool)

(assert (=> b!50747 (= tp!6755 b_and!2773)))

(declare-fun b!50742 () Bool)

(declare-fun b_free!1563 () Bool)

(declare-fun b_next!1563 () Bool)

(assert (=> b!50742 (= b_free!1563 (not b_next!1563))))

(declare-fun tp!6757 () Bool)

(declare-fun b_and!2775 () Bool)

(assert (=> b!50742 (= tp!6757 b_and!2775)))

(declare-fun tp_is_empty!2197 () Bool)

(declare-fun e!32830 () Bool)

(declare-fun e!32826 () Bool)

(declare-datatypes ((V!2577 0))(
  ( (V!2578 (val!1143 Int)) )
))
(declare-datatypes ((array!3289 0))(
  ( (array!3290 (arr!1570 (Array (_ BitVec 32) (_ BitVec 64))) (size!1796 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!755 0))(
  ( (ValueCellFull!755 (v!2171 V!2577)) (EmptyCell!755) )
))
(declare-datatypes ((array!3291 0))(
  ( (array!3292 (arr!1571 (Array (_ BitVec 32) ValueCell!755)) (size!1797 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!418 0))(
  ( (LongMapFixedSize!419 (defaultEntry!1923 Int) (mask!5719 (_ BitVec 32)) (extraKeys!1814 (_ BitVec 32)) (zeroValue!1841 V!2577) (minValue!1841 V!2577) (_size!258 (_ BitVec 32)) (_keys!3534 array!3289) (_values!1906 array!3291) (_vacant!258 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!418)

(declare-fun array_inv!959 (array!3289) Bool)

(declare-fun array_inv!960 (array!3291) Bool)

(assert (=> b!50742 (= e!32830 (and tp!6757 tp_is_empty!2197 (array_inv!959 (_keys!3534 newMap!16)) (array_inv!960 (_values!1906 newMap!16)) e!32826))))

(declare-fun b!50743 () Bool)

(declare-fun e!32823 () Bool)

(declare-fun e!32832 () Bool)

(assert (=> b!50743 (= e!32823 e!32832)))

(declare-fun b!50744 () Bool)

(declare-fun e!32821 () Bool)

(assert (=> b!50744 (= e!32821 e!32823)))

(declare-fun res!29165 () Bool)

(declare-fun e!32824 () Bool)

(assert (=> start!8088 (=> (not res!29165) (not e!32824))))

(declare-datatypes ((Cell!242 0))(
  ( (Cell!243 (v!2172 LongMapFixedSize!418)) )
))
(declare-datatypes ((LongMap!242 0))(
  ( (LongMap!243 (underlying!132 Cell!242)) )
))
(declare-fun thiss!992 () LongMap!242)

(declare-fun valid!150 (LongMap!242) Bool)

(assert (=> start!8088 (= res!29165 (valid!150 thiss!992))))

(assert (=> start!8088 e!32824))

(assert (=> start!8088 e!32821))

(assert (=> start!8088 true))

(assert (=> start!8088 e!32830))

(declare-fun b!50745 () Bool)

(declare-fun res!29168 () Bool)

(assert (=> b!50745 (=> (not res!29168) (not e!32824))))

(assert (=> b!50745 (= res!29168 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5719 newMap!16)) (_size!258 (v!2172 (underlying!132 thiss!992)))))))

(declare-fun b!50746 () Bool)

(assert (=> b!50746 (= e!32824 (and (= (size!1797 (_values!1906 (v!2172 (underlying!132 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5719 (v!2172 (underlying!132 thiss!992))))) (= (size!1796 (_keys!3534 (v!2172 (underlying!132 thiss!992)))) (size!1797 (_values!1906 (v!2172 (underlying!132 thiss!992))))) (bvslt (mask!5719 (v!2172 (underlying!132 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!2233 () Bool)

(declare-fun mapRes!2233 () Bool)

(assert (=> mapIsEmpty!2233 mapRes!2233))

(declare-fun mapIsEmpty!2234 () Bool)

(declare-fun mapRes!2234 () Bool)

(assert (=> mapIsEmpty!2234 mapRes!2234))

(declare-fun e!32828 () Bool)

(assert (=> b!50747 (= e!32832 (and tp!6755 tp_is_empty!2197 (array_inv!959 (_keys!3534 (v!2172 (underlying!132 thiss!992)))) (array_inv!960 (_values!1906 (v!2172 (underlying!132 thiss!992)))) e!32828))))

(declare-fun b!50748 () Bool)

(declare-fun e!32831 () Bool)

(assert (=> b!50748 (= e!32831 tp_is_empty!2197)))

(declare-fun b!50749 () Bool)

(declare-fun e!32827 () Bool)

(assert (=> b!50749 (= e!32827 tp_is_empty!2197)))

(declare-fun b!50750 () Bool)

(declare-fun e!32822 () Bool)

(assert (=> b!50750 (= e!32826 (and e!32822 mapRes!2234))))

(declare-fun condMapEmpty!2233 () Bool)

(declare-fun mapDefault!2233 () ValueCell!755)

(assert (=> b!50750 (= condMapEmpty!2233 (= (arr!1571 (_values!1906 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!755)) mapDefault!2233)))))

(declare-fun b!50751 () Bool)

(declare-fun res!29169 () Bool)

(assert (=> b!50751 (=> (not res!29169) (not e!32824))))

(declare-fun valid!151 (LongMapFixedSize!418) Bool)

(assert (=> b!50751 (= res!29169 (valid!151 newMap!16))))

(declare-fun b!50752 () Bool)

(declare-fun e!32829 () Bool)

(assert (=> b!50752 (= e!32829 tp_is_empty!2197)))

(declare-fun mapNonEmpty!2233 () Bool)

(declare-fun tp!6758 () Bool)

(assert (=> mapNonEmpty!2233 (= mapRes!2234 (and tp!6758 e!32829))))

(declare-fun mapValue!2234 () ValueCell!755)

(declare-fun mapKey!2234 () (_ BitVec 32))

(declare-fun mapRest!2233 () (Array (_ BitVec 32) ValueCell!755))

(assert (=> mapNonEmpty!2233 (= (arr!1571 (_values!1906 newMap!16)) (store mapRest!2233 mapKey!2234 mapValue!2234))))

(declare-fun b!50753 () Bool)

(assert (=> b!50753 (= e!32828 (and e!32827 mapRes!2233))))

(declare-fun condMapEmpty!2234 () Bool)

(declare-fun mapDefault!2234 () ValueCell!755)

(assert (=> b!50753 (= condMapEmpty!2234 (= (arr!1571 (_values!1906 (v!2172 (underlying!132 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!755)) mapDefault!2234)))))

(declare-fun b!50754 () Bool)

(assert (=> b!50754 (= e!32822 tp_is_empty!2197)))

(declare-fun b!50755 () Bool)

(declare-fun res!29166 () Bool)

(assert (=> b!50755 (=> (not res!29166) (not e!32824))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50755 (= res!29166 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1796 (_keys!3534 (v!2172 (underlying!132 thiss!992)))))))))

(declare-fun mapNonEmpty!2234 () Bool)

(declare-fun tp!6756 () Bool)

(assert (=> mapNonEmpty!2234 (= mapRes!2233 (and tp!6756 e!32831))))

(declare-fun mapValue!2233 () ValueCell!755)

(declare-fun mapRest!2234 () (Array (_ BitVec 32) ValueCell!755))

(declare-fun mapKey!2233 () (_ BitVec 32))

(assert (=> mapNonEmpty!2234 (= (arr!1571 (_values!1906 (v!2172 (underlying!132 thiss!992)))) (store mapRest!2234 mapKey!2233 mapValue!2233))))

(declare-fun b!50756 () Bool)

(declare-fun res!29167 () Bool)

(assert (=> b!50756 (=> (not res!29167) (not e!32824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50756 (= res!29167 (validMask!0 (mask!5719 (v!2172 (underlying!132 thiss!992)))))))

(assert (= (and start!8088 res!29165) b!50755))

(assert (= (and b!50755 res!29166) b!50751))

(assert (= (and b!50751 res!29169) b!50745))

(assert (= (and b!50745 res!29168) b!50756))

(assert (= (and b!50756 res!29167) b!50746))

(assert (= (and b!50753 condMapEmpty!2234) mapIsEmpty!2233))

(assert (= (and b!50753 (not condMapEmpty!2234)) mapNonEmpty!2234))

(get-info :version)

(assert (= (and mapNonEmpty!2234 ((_ is ValueCellFull!755) mapValue!2233)) b!50748))

(assert (= (and b!50753 ((_ is ValueCellFull!755) mapDefault!2234)) b!50749))

(assert (= b!50747 b!50753))

(assert (= b!50743 b!50747))

(assert (= b!50744 b!50743))

(assert (= start!8088 b!50744))

(assert (= (and b!50750 condMapEmpty!2233) mapIsEmpty!2234))

(assert (= (and b!50750 (not condMapEmpty!2233)) mapNonEmpty!2233))

(assert (= (and mapNonEmpty!2233 ((_ is ValueCellFull!755) mapValue!2234)) b!50752))

(assert (= (and b!50750 ((_ is ValueCellFull!755) mapDefault!2233)) b!50754))

(assert (= b!50742 b!50750))

(assert (= start!8088 b!50742))

(declare-fun m!43865 () Bool)

(assert (=> mapNonEmpty!2234 m!43865))

(declare-fun m!43867 () Bool)

(assert (=> b!50747 m!43867))

(declare-fun m!43869 () Bool)

(assert (=> b!50747 m!43869))

(declare-fun m!43871 () Bool)

(assert (=> mapNonEmpty!2233 m!43871))

(declare-fun m!43873 () Bool)

(assert (=> b!50756 m!43873))

(declare-fun m!43875 () Bool)

(assert (=> start!8088 m!43875))

(declare-fun m!43877 () Bool)

(assert (=> b!50751 m!43877))

(declare-fun m!43879 () Bool)

(assert (=> b!50742 m!43879))

(declare-fun m!43881 () Bool)

(assert (=> b!50742 m!43881))

(check-sat (not mapNonEmpty!2234) tp_is_empty!2197 b_and!2773 (not b!50742) b_and!2775 (not mapNonEmpty!2233) (not start!8088) (not b!50756) (not b_next!1561) (not b!50751) (not b_next!1563) (not b!50747))
(check-sat b_and!2773 b_and!2775 (not b_next!1561) (not b_next!1563))
