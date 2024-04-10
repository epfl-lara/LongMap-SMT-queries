; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8230 () Bool)

(assert start!8230)

(declare-fun b!52092 () Bool)

(declare-fun b_free!1625 () Bool)

(declare-fun b_next!1625 () Bool)

(assert (=> b!52092 (= b_free!1625 (not b_next!1625))))

(declare-fun tp!6976 () Bool)

(declare-fun b_and!2835 () Bool)

(assert (=> b!52092 (= tp!6976 b_and!2835)))

(declare-fun b!52086 () Bool)

(declare-fun b_free!1627 () Bool)

(declare-fun b_next!1627 () Bool)

(assert (=> b!52086 (= b_free!1627 (not b_next!1627))))

(declare-fun tp!6975 () Bool)

(declare-fun b_and!2837 () Bool)

(assert (=> b!52086 (= tp!6975 b_and!2837)))

(declare-fun mapNonEmpty!2357 () Bool)

(declare-fun mapRes!2358 () Bool)

(declare-fun tp!6977 () Bool)

(declare-fun e!33818 () Bool)

(assert (=> mapNonEmpty!2357 (= mapRes!2358 (and tp!6977 e!33818))))

(declare-fun mapKey!2357 () (_ BitVec 32))

(declare-datatypes ((V!2619 0))(
  ( (V!2620 (val!1159 Int)) )
))
(declare-datatypes ((array!3381 0))(
  ( (array!3382 (arr!1613 (Array (_ BitVec 32) (_ BitVec 64))) (size!1842 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!771 0))(
  ( (ValueCellFull!771 (v!2208 V!2619)) (EmptyCell!771) )
))
(declare-datatypes ((array!3383 0))(
  ( (array!3384 (arr!1614 (Array (_ BitVec 32) ValueCell!771)) (size!1843 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!450 0))(
  ( (LongMapFixedSize!451 (defaultEntry!1939 Int) (mask!5758 (_ BitVec 32)) (extraKeys!1830 (_ BitVec 32)) (zeroValue!1857 V!2619) (minValue!1857 V!2619) (_size!274 (_ BitVec 32)) (_keys!3559 array!3381) (_values!1922 array!3383) (_vacant!274 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!450)

(declare-fun mapRest!2357 () (Array (_ BitVec 32) ValueCell!771))

(declare-fun mapValue!2358 () ValueCell!771)

(assert (=> mapNonEmpty!2357 (= (arr!1614 (_values!1922 newMap!16)) (store mapRest!2357 mapKey!2357 mapValue!2358))))

(declare-fun e!33822 () Bool)

(declare-fun e!33815 () Bool)

(declare-fun tp_is_empty!2229 () Bool)

(declare-fun array_inv!991 (array!3381) Bool)

(declare-fun array_inv!992 (array!3383) Bool)

(assert (=> b!52086 (= e!33822 (and tp!6975 tp_is_empty!2229 (array_inv!991 (_keys!3559 newMap!16)) (array_inv!992 (_values!1922 newMap!16)) e!33815))))

(declare-fun b!52087 () Bool)

(declare-fun e!33827 () Bool)

(declare-fun e!33820 () Bool)

(assert (=> b!52087 (= e!33827 e!33820)))

(declare-fun b!52088 () Bool)

(declare-fun res!29708 () Bool)

(declare-fun e!33823 () Bool)

(assert (=> b!52088 (=> (not res!29708) (not e!33823))))

(declare-datatypes ((Cell!274 0))(
  ( (Cell!275 (v!2209 LongMapFixedSize!450)) )
))
(declare-datatypes ((LongMap!274 0))(
  ( (LongMap!275 (underlying!148 Cell!274)) )
))
(declare-fun thiss!992 () LongMap!274)

(assert (=> b!52088 (= res!29708 (and (= (size!1843 (_values!1922 (v!2209 (underlying!148 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5758 (v!2209 (underlying!148 thiss!992))))) (= (size!1842 (_keys!3559 (v!2209 (underlying!148 thiss!992)))) (size!1843 (_values!1922 (v!2209 (underlying!148 thiss!992))))) (bvsge (mask!5758 (v!2209 (underlying!148 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1830 (v!2209 (underlying!148 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1830 (v!2209 (underlying!148 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2357 () Bool)

(declare-fun mapRes!2357 () Bool)

(assert (=> mapIsEmpty!2357 mapRes!2357))

(declare-fun b!52089 () Bool)

(assert (=> b!52089 (= e!33818 tp_is_empty!2229)))

(declare-fun b!52090 () Bool)

(declare-fun e!33816 () Bool)

(assert (=> b!52090 (= e!33816 tp_is_empty!2229)))

(declare-fun b!52091 () Bool)

(declare-fun e!33819 () Bool)

(assert (=> b!52091 (= e!33820 e!33819)))

(declare-fun res!29711 () Bool)

(assert (=> start!8230 (=> (not res!29711) (not e!33823))))

(declare-fun valid!158 (LongMap!274) Bool)

(assert (=> start!8230 (= res!29711 (valid!158 thiss!992))))

(assert (=> start!8230 e!33823))

(assert (=> start!8230 e!33827))

(assert (=> start!8230 true))

(assert (=> start!8230 e!33822))

(declare-fun e!33825 () Bool)

(assert (=> b!52092 (= e!33819 (and tp!6976 tp_is_empty!2229 (array_inv!991 (_keys!3559 (v!2209 (underlying!148 thiss!992)))) (array_inv!992 (_values!1922 (v!2209 (underlying!148 thiss!992)))) e!33825))))

(declare-fun b!52093 () Bool)

(declare-fun res!29712 () Bool)

(assert (=> b!52093 (=> (not res!29712) (not e!33823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3381 (_ BitVec 32)) Bool)

(assert (=> b!52093 (= res!29712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3559 (v!2209 (underlying!148 thiss!992))) (mask!5758 (v!2209 (underlying!148 thiss!992)))))))

(declare-fun b!52094 () Bool)

(declare-fun e!33826 () Bool)

(assert (=> b!52094 (= e!33815 (and e!33826 mapRes!2358))))

(declare-fun condMapEmpty!2358 () Bool)

(declare-fun mapDefault!2358 () ValueCell!771)

(assert (=> b!52094 (= condMapEmpty!2358 (= (arr!1614 (_values!1922 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!771)) mapDefault!2358)))))

(declare-fun mapIsEmpty!2358 () Bool)

(assert (=> mapIsEmpty!2358 mapRes!2358))

(declare-fun b!52095 () Bool)

(declare-fun res!29713 () Bool)

(assert (=> b!52095 (=> (not res!29713) (not e!33823))))

(declare-datatypes ((List!1337 0))(
  ( (Nil!1334) (Cons!1333 (h!1913 (_ BitVec 64)) (t!4371 List!1337)) )
))
(declare-fun arrayNoDuplicates!0 (array!3381 (_ BitVec 32) List!1337) Bool)

(assert (=> b!52095 (= res!29713 (arrayNoDuplicates!0 (_keys!3559 (v!2209 (underlying!148 thiss!992))) #b00000000000000000000000000000000 Nil!1334))))

(declare-fun b!52096 () Bool)

(declare-fun e!33824 () Bool)

(assert (=> b!52096 (= e!33825 (and e!33824 mapRes!2357))))

(declare-fun condMapEmpty!2357 () Bool)

(declare-fun mapDefault!2357 () ValueCell!771)

(assert (=> b!52096 (= condMapEmpty!2357 (= (arr!1614 (_values!1922 (v!2209 (underlying!148 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!771)) mapDefault!2357)))))

(declare-fun b!52097 () Bool)

(declare-fun res!29709 () Bool)

(assert (=> b!52097 (=> (not res!29709) (not e!33823))))

(declare-fun valid!159 (LongMapFixedSize!450) Bool)

(assert (=> b!52097 (= res!29709 (valid!159 newMap!16))))

(declare-fun b!52098 () Bool)

(declare-fun res!29707 () Bool)

(assert (=> b!52098 (=> (not res!29707) (not e!33823))))

(assert (=> b!52098 (= res!29707 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5758 newMap!16)) (_size!274 (v!2209 (underlying!148 thiss!992)))))))

(declare-fun b!52099 () Bool)

(assert (=> b!52099 (= e!33824 tp_is_empty!2229)))

(declare-fun b!52100 () Bool)

(declare-fun res!29714 () Bool)

(assert (=> b!52100 (=> (not res!29714) (not e!33823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52100 (= res!29714 (validMask!0 (mask!5758 (v!2209 (underlying!148 thiss!992)))))))

(declare-fun mapNonEmpty!2358 () Bool)

(declare-fun tp!6978 () Bool)

(assert (=> mapNonEmpty!2358 (= mapRes!2357 (and tp!6978 e!33816))))

(declare-fun mapValue!2357 () ValueCell!771)

(declare-fun mapKey!2358 () (_ BitVec 32))

(declare-fun mapRest!2358 () (Array (_ BitVec 32) ValueCell!771))

(assert (=> mapNonEmpty!2358 (= (arr!1614 (_values!1922 (v!2209 (underlying!148 thiss!992)))) (store mapRest!2358 mapKey!2358 mapValue!2357))))

(declare-fun b!52101 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52101 (= e!33823 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!52102 () Bool)

(assert (=> b!52102 (= e!33826 tp_is_empty!2229)))

(declare-fun b!52103 () Bool)

(declare-fun res!29710 () Bool)

(assert (=> b!52103 (=> (not res!29710) (not e!33823))))

(assert (=> b!52103 (= res!29710 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1842 (_keys!3559 (v!2209 (underlying!148 thiss!992)))))))))

(assert (= (and start!8230 res!29711) b!52103))

(assert (= (and b!52103 res!29710) b!52097))

(assert (= (and b!52097 res!29709) b!52098))

(assert (= (and b!52098 res!29707) b!52100))

(assert (= (and b!52100 res!29714) b!52088))

(assert (= (and b!52088 res!29708) b!52093))

(assert (= (and b!52093 res!29712) b!52095))

(assert (= (and b!52095 res!29713) b!52101))

(assert (= (and b!52096 condMapEmpty!2357) mapIsEmpty!2357))

(assert (= (and b!52096 (not condMapEmpty!2357)) mapNonEmpty!2358))

(get-info :version)

(assert (= (and mapNonEmpty!2358 ((_ is ValueCellFull!771) mapValue!2357)) b!52090))

(assert (= (and b!52096 ((_ is ValueCellFull!771) mapDefault!2357)) b!52099))

(assert (= b!52092 b!52096))

(assert (= b!52091 b!52092))

(assert (= b!52087 b!52091))

(assert (= start!8230 b!52087))

(assert (= (and b!52094 condMapEmpty!2358) mapIsEmpty!2358))

(assert (= (and b!52094 (not condMapEmpty!2358)) mapNonEmpty!2357))

(assert (= (and mapNonEmpty!2357 ((_ is ValueCellFull!771) mapValue!2358)) b!52089))

(assert (= (and b!52094 ((_ is ValueCellFull!771) mapDefault!2358)) b!52102))

(assert (= b!52086 b!52094))

(assert (= start!8230 b!52086))

(declare-fun m!44673 () Bool)

(assert (=> b!52097 m!44673))

(declare-fun m!44675 () Bool)

(assert (=> b!52092 m!44675))

(declare-fun m!44677 () Bool)

(assert (=> b!52092 m!44677))

(declare-fun m!44679 () Bool)

(assert (=> b!52093 m!44679))

(declare-fun m!44681 () Bool)

(assert (=> start!8230 m!44681))

(declare-fun m!44683 () Bool)

(assert (=> mapNonEmpty!2357 m!44683))

(declare-fun m!44685 () Bool)

(assert (=> b!52100 m!44685))

(declare-fun m!44687 () Bool)

(assert (=> b!52086 m!44687))

(declare-fun m!44689 () Bool)

(assert (=> b!52086 m!44689))

(declare-fun m!44691 () Bool)

(assert (=> mapNonEmpty!2358 m!44691))

(declare-fun m!44693 () Bool)

(assert (=> b!52095 m!44693))

(check-sat b_and!2837 (not b_next!1627) b_and!2835 (not mapNonEmpty!2358) (not b!52100) (not b!52095) (not b!52093) (not mapNonEmpty!2357) tp_is_empty!2229 (not start!8230) (not b!52097) (not b!52092) (not b!52086) (not b_next!1625))
(check-sat b_and!2835 b_and!2837 (not b_next!1625) (not b_next!1627))
