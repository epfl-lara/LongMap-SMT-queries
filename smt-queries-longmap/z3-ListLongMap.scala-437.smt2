; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8236 () Bool)

(assert start!8236)

(declare-fun b!52222 () Bool)

(declare-fun b_free!1637 () Bool)

(declare-fun b_next!1637 () Bool)

(assert (=> b!52222 (= b_free!1637 (not b_next!1637))))

(declare-fun tp!7011 () Bool)

(declare-fun b_and!2847 () Bool)

(assert (=> b!52222 (= tp!7011 b_and!2847)))

(declare-fun b!52227 () Bool)

(declare-fun b_free!1639 () Bool)

(declare-fun b_next!1639 () Bool)

(assert (=> b!52227 (= b_free!1639 (not b_next!1639))))

(declare-fun tp!7013 () Bool)

(declare-fun b_and!2849 () Bool)

(assert (=> b!52227 (= tp!7013 b_and!2849)))

(declare-fun b!52218 () Bool)

(declare-fun e!33935 () Bool)

(declare-fun e!33940 () Bool)

(declare-fun mapRes!2375 () Bool)

(assert (=> b!52218 (= e!33935 (and e!33940 mapRes!2375))))

(declare-fun condMapEmpty!2376 () Bool)

(declare-datatypes ((V!2627 0))(
  ( (V!2628 (val!1162 Int)) )
))
(declare-datatypes ((array!3393 0))(
  ( (array!3394 (arr!1619 (Array (_ BitVec 32) (_ BitVec 64))) (size!1848 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!774 0))(
  ( (ValueCellFull!774 (v!2214 V!2627)) (EmptyCell!774) )
))
(declare-datatypes ((array!3395 0))(
  ( (array!3396 (arr!1620 (Array (_ BitVec 32) ValueCell!774)) (size!1849 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!456 0))(
  ( (LongMapFixedSize!457 (defaultEntry!1942 Int) (mask!5763 (_ BitVec 32)) (extraKeys!1833 (_ BitVec 32)) (zeroValue!1860 V!2627) (minValue!1860 V!2627) (_size!277 (_ BitVec 32)) (_keys!3562 array!3393) (_values!1925 array!3395) (_vacant!277 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!280 0))(
  ( (Cell!281 (v!2215 LongMapFixedSize!456)) )
))
(declare-datatypes ((LongMap!280 0))(
  ( (LongMap!281 (underlying!151 Cell!280)) )
))
(declare-fun thiss!992 () LongMap!280)

(declare-fun mapDefault!2375 () ValueCell!774)

(assert (=> b!52218 (= condMapEmpty!2376 (= (arr!1620 (_values!1925 (v!2215 (underlying!151 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!774)) mapDefault!2375)))))

(declare-fun b!52219 () Bool)

(declare-fun e!33934 () Bool)

(declare-fun e!33932 () Bool)

(assert (=> b!52219 (= e!33934 e!33932)))

(declare-fun mapIsEmpty!2375 () Bool)

(declare-fun mapRes!2376 () Bool)

(assert (=> mapIsEmpty!2375 mapRes!2376))

(declare-fun b!52221 () Bool)

(declare-fun e!33936 () Bool)

(assert (=> b!52221 (= e!33936 false)))

(declare-fun lt!21255 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!456)

(declare-fun valid!163 (LongMapFixedSize!456) Bool)

(assert (=> b!52221 (= lt!21255 (valid!163 newMap!16))))

(declare-fun mapIsEmpty!2376 () Bool)

(assert (=> mapIsEmpty!2376 mapRes!2375))

(declare-fun mapNonEmpty!2375 () Bool)

(declare-fun tp!7014 () Bool)

(declare-fun e!33942 () Bool)

(assert (=> mapNonEmpty!2375 (= mapRes!2375 (and tp!7014 e!33942))))

(declare-fun mapKey!2375 () (_ BitVec 32))

(declare-fun mapValue!2376 () ValueCell!774)

(declare-fun mapRest!2376 () (Array (_ BitVec 32) ValueCell!774))

(assert (=> mapNonEmpty!2375 (= (arr!1620 (_values!1925 (v!2215 (underlying!151 thiss!992)))) (store mapRest!2376 mapKey!2375 mapValue!2376))))

(declare-fun tp_is_empty!2235 () Bool)

(declare-fun array_inv!997 (array!3393) Bool)

(declare-fun array_inv!998 (array!3395) Bool)

(assert (=> b!52222 (= e!33932 (and tp!7011 tp_is_empty!2235 (array_inv!997 (_keys!3562 (v!2215 (underlying!151 thiss!992)))) (array_inv!998 (_values!1925 (v!2215 (underlying!151 thiss!992)))) e!33935))))

(declare-fun b!52220 () Bool)

(declare-fun e!33941 () Bool)

(declare-fun e!33944 () Bool)

(assert (=> b!52220 (= e!33941 (and e!33944 mapRes!2376))))

(declare-fun condMapEmpty!2375 () Bool)

(declare-fun mapDefault!2376 () ValueCell!774)

(assert (=> b!52220 (= condMapEmpty!2375 (= (arr!1620 (_values!1925 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!774)) mapDefault!2376)))))

(declare-fun res!29750 () Bool)

(assert (=> start!8236 (=> (not res!29750) (not e!33936))))

(declare-fun valid!164 (LongMap!280) Bool)

(assert (=> start!8236 (= res!29750 (valid!164 thiss!992))))

(assert (=> start!8236 e!33936))

(declare-fun e!33933 () Bool)

(assert (=> start!8236 e!33933))

(assert (=> start!8236 true))

(declare-fun e!33938 () Bool)

(assert (=> start!8236 e!33938))

(declare-fun b!52223 () Bool)

(declare-fun res!29749 () Bool)

(assert (=> b!52223 (=> (not res!29749) (not e!33936))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52223 (= res!29749 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1848 (_keys!3562 (v!2215 (underlying!151 thiss!992)))))))))

(declare-fun b!52224 () Bool)

(assert (=> b!52224 (= e!33944 tp_is_empty!2235)))

(declare-fun b!52225 () Bool)

(assert (=> b!52225 (= e!33940 tp_is_empty!2235)))

(declare-fun b!52226 () Bool)

(declare-fun e!33943 () Bool)

(assert (=> b!52226 (= e!33943 tp_is_empty!2235)))

(assert (=> b!52227 (= e!33938 (and tp!7013 tp_is_empty!2235 (array_inv!997 (_keys!3562 newMap!16)) (array_inv!998 (_values!1925 newMap!16)) e!33941))))

(declare-fun mapNonEmpty!2376 () Bool)

(declare-fun tp!7012 () Bool)

(assert (=> mapNonEmpty!2376 (= mapRes!2376 (and tp!7012 e!33943))))

(declare-fun mapRest!2375 () (Array (_ BitVec 32) ValueCell!774))

(declare-fun mapValue!2375 () ValueCell!774)

(declare-fun mapKey!2376 () (_ BitVec 32))

(assert (=> mapNonEmpty!2376 (= (arr!1620 (_values!1925 newMap!16)) (store mapRest!2375 mapKey!2376 mapValue!2375))))

(declare-fun b!52228 () Bool)

(assert (=> b!52228 (= e!33942 tp_is_empty!2235)))

(declare-fun b!52229 () Bool)

(assert (=> b!52229 (= e!33933 e!33934)))

(assert (= (and start!8236 res!29750) b!52223))

(assert (= (and b!52223 res!29749) b!52221))

(assert (= (and b!52218 condMapEmpty!2376) mapIsEmpty!2376))

(assert (= (and b!52218 (not condMapEmpty!2376)) mapNonEmpty!2375))

(get-info :version)

(assert (= (and mapNonEmpty!2375 ((_ is ValueCellFull!774) mapValue!2376)) b!52228))

(assert (= (and b!52218 ((_ is ValueCellFull!774) mapDefault!2375)) b!52225))

(assert (= b!52222 b!52218))

(assert (= b!52219 b!52222))

(assert (= b!52229 b!52219))

(assert (= start!8236 b!52229))

(assert (= (and b!52220 condMapEmpty!2375) mapIsEmpty!2375))

(assert (= (and b!52220 (not condMapEmpty!2375)) mapNonEmpty!2376))

(assert (= (and mapNonEmpty!2376 ((_ is ValueCellFull!774) mapValue!2375)) b!52226))

(assert (= (and b!52220 ((_ is ValueCellFull!774) mapDefault!2376)) b!52224))

(assert (= b!52227 b!52220))

(assert (= start!8236 b!52227))

(declare-fun m!44733 () Bool)

(assert (=> mapNonEmpty!2375 m!44733))

(declare-fun m!44735 () Bool)

(assert (=> b!52221 m!44735))

(declare-fun m!44737 () Bool)

(assert (=> b!52222 m!44737))

(declare-fun m!44739 () Bool)

(assert (=> b!52222 m!44739))

(declare-fun m!44741 () Bool)

(assert (=> mapNonEmpty!2376 m!44741))

(declare-fun m!44743 () Bool)

(assert (=> start!8236 m!44743))

(declare-fun m!44745 () Bool)

(assert (=> b!52227 m!44745))

(declare-fun m!44747 () Bool)

(assert (=> b!52227 m!44747))

(check-sat b_and!2847 (not b_next!1639) (not b!52222) (not mapNonEmpty!2376) tp_is_empty!2235 (not mapNonEmpty!2375) (not start!8236) (not b!52227) b_and!2849 (not b_next!1637) (not b!52221))
(check-sat b_and!2847 b_and!2849 (not b_next!1637) (not b_next!1639))
