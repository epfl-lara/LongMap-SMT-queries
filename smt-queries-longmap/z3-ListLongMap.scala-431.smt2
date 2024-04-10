; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8086 () Bool)

(assert start!8086)

(declare-fun b!50853 () Bool)

(declare-fun b_free!1565 () Bool)

(declare-fun b_next!1565 () Bool)

(assert (=> b!50853 (= b_free!1565 (not b_next!1565))))

(declare-fun tp!6767 () Bool)

(declare-fun b_and!2775 () Bool)

(assert (=> b!50853 (= tp!6767 b_and!2775)))

(declare-fun b!50860 () Bool)

(declare-fun b_free!1567 () Bool)

(declare-fun b_next!1567 () Bool)

(assert (=> b!50860 (= b_free!1567 (not b_next!1567))))

(declare-fun tp!6769 () Bool)

(declare-fun b_and!2777 () Bool)

(assert (=> b!50860 (= tp!6769 b_and!2777)))

(declare-fun e!32913 () Bool)

(declare-fun tp_is_empty!2199 () Bool)

(declare-fun e!32908 () Bool)

(declare-datatypes ((V!2579 0))(
  ( (V!2580 (val!1144 Int)) )
))
(declare-datatypes ((array!3313 0))(
  ( (array!3314 (arr!1583 (Array (_ BitVec 32) (_ BitVec 64))) (size!1808 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!756 0))(
  ( (ValueCellFull!756 (v!2176 V!2579)) (EmptyCell!756) )
))
(declare-datatypes ((array!3315 0))(
  ( (array!3316 (arr!1584 (Array (_ BitVec 32) ValueCell!756)) (size!1809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!420 0))(
  ( (LongMapFixedSize!421 (defaultEntry!1924 Int) (mask!5721 (_ BitVec 32)) (extraKeys!1815 (_ BitVec 32)) (zeroValue!1842 V!2579) (minValue!1842 V!2579) (_size!259 (_ BitVec 32)) (_keys!3536 array!3313) (_values!1907 array!3315) (_vacant!259 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!246 0))(
  ( (Cell!247 (v!2177 LongMapFixedSize!420)) )
))
(declare-datatypes ((LongMap!246 0))(
  ( (LongMap!247 (underlying!134 Cell!246)) )
))
(declare-fun thiss!992 () LongMap!246)

(declare-fun array_inv!971 (array!3313) Bool)

(declare-fun array_inv!972 (array!3315) Bool)

(assert (=> b!50853 (= e!32913 (and tp!6767 tp_is_empty!2199 (array_inv!971 (_keys!3536 (v!2177 (underlying!134 thiss!992)))) (array_inv!972 (_values!1907 (v!2177 (underlying!134 thiss!992)))) e!32908))))

(declare-fun b!50854 () Bool)

(declare-fun e!32905 () Bool)

(declare-fun mapRes!2240 () Bool)

(assert (=> b!50854 (= e!32908 (and e!32905 mapRes!2240))))

(declare-fun condMapEmpty!2239 () Bool)

(declare-fun mapDefault!2239 () ValueCell!756)

(assert (=> b!50854 (= condMapEmpty!2239 (= (arr!1584 (_values!1907 (v!2177 (underlying!134 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!756)) mapDefault!2239)))))

(declare-fun b!50855 () Bool)

(declare-fun e!32904 () Bool)

(declare-fun e!32909 () Bool)

(assert (=> b!50855 (= e!32904 e!32909)))

(declare-fun res!29201 () Bool)

(declare-fun e!32914 () Bool)

(assert (=> start!8086 (=> (not res!29201) (not e!32914))))

(declare-fun valid!140 (LongMap!246) Bool)

(assert (=> start!8086 (= res!29201 (valid!140 thiss!992))))

(assert (=> start!8086 e!32914))

(assert (=> start!8086 e!32904))

(assert (=> start!8086 true))

(declare-fun e!32906 () Bool)

(assert (=> start!8086 e!32906))

(declare-fun b!50856 () Bool)

(declare-fun res!29203 () Bool)

(assert (=> b!50856 (=> (not res!29203) (not e!32914))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50856 (= res!29203 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1808 (_keys!3536 (v!2177 (underlying!134 thiss!992)))))))))

(declare-fun b!50857 () Bool)

(assert (=> b!50857 (= e!32905 tp_is_empty!2199)))

(declare-fun b!50858 () Bool)

(assert (=> b!50858 (= e!32914 (and (= (size!1809 (_values!1907 (v!2177 (underlying!134 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5721 (v!2177 (underlying!134 thiss!992))))) (= (size!1808 (_keys!3536 (v!2177 (underlying!134 thiss!992)))) (size!1809 (_values!1907 (v!2177 (underlying!134 thiss!992))))) (bvslt (mask!5721 (v!2177 (underlying!134 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50859 () Bool)

(declare-fun res!29204 () Bool)

(assert (=> b!50859 (=> (not res!29204) (not e!32914))))

(declare-fun newMap!16 () LongMapFixedSize!420)

(declare-fun valid!141 (LongMapFixedSize!420) Bool)

(assert (=> b!50859 (= res!29204 (valid!141 newMap!16))))

(declare-fun e!32910 () Bool)

(assert (=> b!50860 (= e!32906 (and tp!6769 tp_is_empty!2199 (array_inv!971 (_keys!3536 newMap!16)) (array_inv!972 (_values!1907 newMap!16)) e!32910))))

(declare-fun mapIsEmpty!2239 () Bool)

(assert (=> mapIsEmpty!2239 mapRes!2240))

(declare-fun mapNonEmpty!2239 () Bool)

(declare-fun mapRes!2239 () Bool)

(declare-fun tp!6770 () Bool)

(declare-fun e!32903 () Bool)

(assert (=> mapNonEmpty!2239 (= mapRes!2239 (and tp!6770 e!32903))))

(declare-fun mapKey!2240 () (_ BitVec 32))

(declare-fun mapValue!2240 () ValueCell!756)

(declare-fun mapRest!2239 () (Array (_ BitVec 32) ValueCell!756))

(assert (=> mapNonEmpty!2239 (= (arr!1584 (_values!1907 newMap!16)) (store mapRest!2239 mapKey!2240 mapValue!2240))))

(declare-fun b!50861 () Bool)

(declare-fun e!32902 () Bool)

(assert (=> b!50861 (= e!32902 tp_is_empty!2199)))

(declare-fun b!50862 () Bool)

(assert (=> b!50862 (= e!32909 e!32913)))

(declare-fun mapNonEmpty!2240 () Bool)

(declare-fun tp!6768 () Bool)

(declare-fun e!32911 () Bool)

(assert (=> mapNonEmpty!2240 (= mapRes!2240 (and tp!6768 e!32911))))

(declare-fun mapKey!2239 () (_ BitVec 32))

(declare-fun mapRest!2240 () (Array (_ BitVec 32) ValueCell!756))

(declare-fun mapValue!2239 () ValueCell!756)

(assert (=> mapNonEmpty!2240 (= (arr!1584 (_values!1907 (v!2177 (underlying!134 thiss!992)))) (store mapRest!2240 mapKey!2239 mapValue!2239))))

(declare-fun b!50863 () Bool)

(assert (=> b!50863 (= e!32911 tp_is_empty!2199)))

(declare-fun b!50864 () Bool)

(assert (=> b!50864 (= e!32903 tp_is_empty!2199)))

(declare-fun b!50865 () Bool)

(assert (=> b!50865 (= e!32910 (and e!32902 mapRes!2239))))

(declare-fun condMapEmpty!2240 () Bool)

(declare-fun mapDefault!2240 () ValueCell!756)

(assert (=> b!50865 (= condMapEmpty!2240 (= (arr!1584 (_values!1907 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!756)) mapDefault!2240)))))

(declare-fun mapIsEmpty!2240 () Bool)

(assert (=> mapIsEmpty!2240 mapRes!2239))

(declare-fun b!50866 () Bool)

(declare-fun res!29200 () Bool)

(assert (=> b!50866 (=> (not res!29200) (not e!32914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50866 (= res!29200 (validMask!0 (mask!5721 (v!2177 (underlying!134 thiss!992)))))))

(declare-fun b!50867 () Bool)

(declare-fun res!29202 () Bool)

(assert (=> b!50867 (=> (not res!29202) (not e!32914))))

(assert (=> b!50867 (= res!29202 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5721 newMap!16)) (_size!259 (v!2177 (underlying!134 thiss!992)))))))

(assert (= (and start!8086 res!29201) b!50856))

(assert (= (and b!50856 res!29203) b!50859))

(assert (= (and b!50859 res!29204) b!50867))

(assert (= (and b!50867 res!29202) b!50866))

(assert (= (and b!50866 res!29200) b!50858))

(assert (= (and b!50854 condMapEmpty!2239) mapIsEmpty!2239))

(assert (= (and b!50854 (not condMapEmpty!2239)) mapNonEmpty!2240))

(get-info :version)

(assert (= (and mapNonEmpty!2240 ((_ is ValueCellFull!756) mapValue!2239)) b!50863))

(assert (= (and b!50854 ((_ is ValueCellFull!756) mapDefault!2239)) b!50857))

(assert (= b!50853 b!50854))

(assert (= b!50862 b!50853))

(assert (= b!50855 b!50862))

(assert (= start!8086 b!50855))

(assert (= (and b!50865 condMapEmpty!2240) mapIsEmpty!2240))

(assert (= (and b!50865 (not condMapEmpty!2240)) mapNonEmpty!2239))

(assert (= (and mapNonEmpty!2239 ((_ is ValueCellFull!756) mapValue!2240)) b!50864))

(assert (= (and b!50865 ((_ is ValueCellFull!756) mapDefault!2240)) b!50861))

(assert (= b!50860 b!50865))

(assert (= start!8086 b!50860))

(declare-fun m!43965 () Bool)

(assert (=> mapNonEmpty!2240 m!43965))

(declare-fun m!43967 () Bool)

(assert (=> mapNonEmpty!2239 m!43967))

(declare-fun m!43969 () Bool)

(assert (=> b!50859 m!43969))

(declare-fun m!43971 () Bool)

(assert (=> b!50853 m!43971))

(declare-fun m!43973 () Bool)

(assert (=> b!50853 m!43973))

(declare-fun m!43975 () Bool)

(assert (=> start!8086 m!43975))

(declare-fun m!43977 () Bool)

(assert (=> b!50860 m!43977))

(declare-fun m!43979 () Bool)

(assert (=> b!50860 m!43979))

(declare-fun m!43981 () Bool)

(assert (=> b!50866 m!43981))

(check-sat (not b!50853) tp_is_empty!2199 b_and!2775 (not b!50860) (not b_next!1565) (not b!50859) (not mapNonEmpty!2240) b_and!2777 (not mapNonEmpty!2239) (not b!50866) (not b_next!1567) (not start!8086))
(check-sat b_and!2775 b_and!2777 (not b_next!1565) (not b_next!1567))
