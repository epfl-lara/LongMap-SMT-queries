; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15458 () Bool)

(assert start!15458)

(declare-fun b!153421 () Bool)

(declare-fun b_free!3193 () Bool)

(declare-fun b_next!3193 () Bool)

(assert (=> b!153421 (= b_free!3193 (not b_next!3193))))

(declare-fun tp!12097 () Bool)

(declare-fun b_and!9529 () Bool)

(assert (=> b!153421 (= tp!12097 b_and!9529)))

(declare-fun b!153423 () Bool)

(declare-fun b_free!3195 () Bool)

(declare-fun b_next!3195 () Bool)

(assert (=> b!153423 (= b_free!3195 (not b_next!3195))))

(declare-fun tp!12095 () Bool)

(declare-fun b_and!9531 () Bool)

(assert (=> b!153423 (= tp!12095 b_and!9531)))

(declare-fun b!153416 () Bool)

(declare-fun e!100173 () Bool)

(declare-fun tp_is_empty!3013 () Bool)

(assert (=> b!153416 (= e!100173 tp_is_empty!3013)))

(declare-fun b!153417 () Bool)

(declare-fun e!100170 () Bool)

(declare-fun e!100179 () Bool)

(assert (=> b!153417 (= e!100170 e!100179)))

(declare-fun b!153418 () Bool)

(declare-fun e!100172 () Bool)

(assert (=> b!153418 (= e!100172 tp_is_empty!3013)))

(declare-fun res!72479 () Bool)

(declare-fun e!100177 () Bool)

(assert (=> start!15458 (=> (not res!72479) (not e!100177))))

(declare-datatypes ((V!3665 0))(
  ( (V!3666 (val!1551 Int)) )
))
(declare-datatypes ((array!5055 0))(
  ( (array!5056 (arr!2386 (Array (_ BitVec 32) (_ BitVec 64))) (size!2664 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1163 0))(
  ( (ValueCellFull!1163 (v!3398 V!3665)) (EmptyCell!1163) )
))
(declare-datatypes ((array!5057 0))(
  ( (array!5058 (arr!2387 (Array (_ BitVec 32) ValueCell!1163)) (size!2665 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1234 0))(
  ( (LongMapFixedSize!1235 (defaultEntry!3056 Int) (mask!7455 (_ BitVec 32)) (extraKeys!2797 (_ BitVec 32)) (zeroValue!2899 V!3665) (minValue!2899 V!3665) (_size!666 (_ BitVec 32)) (_keys!4828 array!5055) (_values!3039 array!5057) (_vacant!666 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1008 0))(
  ( (Cell!1009 (v!3399 LongMapFixedSize!1234)) )
))
(declare-datatypes ((LongMap!1008 0))(
  ( (LongMap!1009 (underlying!515 Cell!1008)) )
))
(declare-fun thiss!992 () LongMap!1008)

(declare-fun valid!613 (LongMap!1008) Bool)

(assert (=> start!15458 (= res!72479 (valid!613 thiss!992))))

(assert (=> start!15458 e!100177))

(declare-fun e!100176 () Bool)

(assert (=> start!15458 e!100176))

(assert (=> start!15458 true))

(declare-fun e!100180 () Bool)

(assert (=> start!15458 e!100180))

(declare-fun mapIsEmpty!5125 () Bool)

(declare-fun mapRes!5125 () Bool)

(assert (=> mapIsEmpty!5125 mapRes!5125))

(declare-fun b!153419 () Bool)

(declare-fun e!100178 () Bool)

(assert (=> b!153419 (= e!100178 tp_is_empty!3013)))

(declare-fun b!153420 () Bool)

(declare-fun res!72481 () Bool)

(assert (=> b!153420 (=> (not res!72481) (not e!100177))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153420 (= res!72481 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2664 (_keys!4828 (v!3399 (underlying!515 thiss!992)))))))))

(declare-fun e!100182 () Bool)

(declare-fun array_inv!1527 (array!5055) Bool)

(declare-fun array_inv!1528 (array!5057) Bool)

(assert (=> b!153421 (= e!100179 (and tp!12097 tp_is_empty!3013 (array_inv!1527 (_keys!4828 (v!3399 (underlying!515 thiss!992)))) (array_inv!1528 (_values!3039 (v!3399 (underlying!515 thiss!992)))) e!100182))))

(declare-fun b!153422 () Bool)

(declare-fun res!72477 () Bool)

(assert (=> b!153422 (=> (not res!72477) (not e!100177))))

(declare-fun newMap!16 () LongMapFixedSize!1234)

(declare-datatypes ((tuple2!2786 0))(
  ( (tuple2!2787 (_1!1404 (_ BitVec 64)) (_2!1404 V!3665)) )
))
(declare-datatypes ((List!1802 0))(
  ( (Nil!1799) (Cons!1798 (h!2407 tuple2!2786) (t!6583 List!1802)) )
))
(declare-datatypes ((ListLongMap!1779 0))(
  ( (ListLongMap!1780 (toList!905 List!1802)) )
))
(declare-fun getCurrentListMap!557 (array!5055 array!5057 (_ BitVec 32) (_ BitVec 32) V!3665 V!3665 (_ BitVec 32) Int) ListLongMap!1779)

(declare-fun map!1477 (LongMapFixedSize!1234) ListLongMap!1779)

(assert (=> b!153422 (= res!72477 (= (getCurrentListMap!557 (_keys!4828 (v!3399 (underlying!515 thiss!992))) (_values!3039 (v!3399 (underlying!515 thiss!992))) (mask!7455 (v!3399 (underlying!515 thiss!992))) (extraKeys!2797 (v!3399 (underlying!515 thiss!992))) (zeroValue!2899 (v!3399 (underlying!515 thiss!992))) (minValue!2899 (v!3399 (underlying!515 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3056 (v!3399 (underlying!515 thiss!992)))) (map!1477 newMap!16)))))

(declare-fun mapNonEmpty!5125 () Bool)

(declare-fun mapRes!5126 () Bool)

(declare-fun tp!12098 () Bool)

(assert (=> mapNonEmpty!5125 (= mapRes!5126 (and tp!12098 e!100178))))

(declare-fun mapValue!5125 () ValueCell!1163)

(declare-fun mapKey!5125 () (_ BitVec 32))

(declare-fun mapRest!5125 () (Array (_ BitVec 32) ValueCell!1163))

(assert (=> mapNonEmpty!5125 (= (arr!2387 (_values!3039 newMap!16)) (store mapRest!5125 mapKey!5125 mapValue!5125))))

(declare-fun e!100181 () Bool)

(assert (=> b!153423 (= e!100180 (and tp!12095 tp_is_empty!3013 (array_inv!1527 (_keys!4828 newMap!16)) (array_inv!1528 (_values!3039 newMap!16)) e!100181))))

(declare-fun b!153424 () Bool)

(declare-fun res!72478 () Bool)

(assert (=> b!153424 (=> (not res!72478) (not e!100177))))

(assert (=> b!153424 (= res!72478 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7455 newMap!16)) (_size!666 (v!3399 (underlying!515 thiss!992)))))))

(declare-fun b!153425 () Bool)

(assert (=> b!153425 (= e!100182 (and e!100172 mapRes!5125))))

(declare-fun condMapEmpty!5126 () Bool)

(declare-fun mapDefault!5125 () ValueCell!1163)

(assert (=> b!153425 (= condMapEmpty!5126 (= (arr!2387 (_values!3039 (v!3399 (underlying!515 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1163)) mapDefault!5125)))))

(declare-fun mapNonEmpty!5126 () Bool)

(declare-fun tp!12096 () Bool)

(assert (=> mapNonEmpty!5126 (= mapRes!5125 (and tp!12096 e!100173))))

(declare-fun mapRest!5126 () (Array (_ BitVec 32) ValueCell!1163))

(declare-fun mapValue!5126 () ValueCell!1163)

(declare-fun mapKey!5126 () (_ BitVec 32))

(assert (=> mapNonEmpty!5126 (= (arr!2387 (_values!3039 (v!3399 (underlying!515 thiss!992)))) (store mapRest!5126 mapKey!5126 mapValue!5126))))

(declare-fun b!153426 () Bool)

(declare-fun res!72480 () Bool)

(assert (=> b!153426 (=> (not res!72480) (not e!100177))))

(declare-fun valid!614 (LongMapFixedSize!1234) Bool)

(assert (=> b!153426 (= res!72480 (valid!614 newMap!16))))

(declare-fun b!153427 () Bool)

(declare-fun e!100175 () Bool)

(assert (=> b!153427 (= e!100175 tp_is_empty!3013)))

(declare-fun b!153428 () Bool)

(assert (=> b!153428 (= e!100181 (and e!100175 mapRes!5126))))

(declare-fun condMapEmpty!5125 () Bool)

(declare-fun mapDefault!5126 () ValueCell!1163)

(assert (=> b!153428 (= condMapEmpty!5125 (= (arr!2387 (_values!3039 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1163)) mapDefault!5126)))))

(declare-fun b!153429 () Bool)

(assert (=> b!153429 (= e!100176 e!100170)))

(declare-fun b!153430 () Bool)

(assert (=> b!153430 (= e!100177 (and (or (= (select (arr!2386 (_keys!4828 (v!3399 (underlying!515 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2386 (_keys!4828 (v!3399 (underlying!515 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) from!355)))))

(declare-fun mapIsEmpty!5126 () Bool)

(assert (=> mapIsEmpty!5126 mapRes!5126))

(assert (= (and start!15458 res!72479) b!153420))

(assert (= (and b!153420 res!72481) b!153426))

(assert (= (and b!153426 res!72480) b!153424))

(assert (= (and b!153424 res!72478) b!153422))

(assert (= (and b!153422 res!72477) b!153430))

(assert (= (and b!153425 condMapEmpty!5126) mapIsEmpty!5125))

(assert (= (and b!153425 (not condMapEmpty!5126)) mapNonEmpty!5126))

(get-info :version)

(assert (= (and mapNonEmpty!5126 ((_ is ValueCellFull!1163) mapValue!5126)) b!153416))

(assert (= (and b!153425 ((_ is ValueCellFull!1163) mapDefault!5125)) b!153418))

(assert (= b!153421 b!153425))

(assert (= b!153417 b!153421))

(assert (= b!153429 b!153417))

(assert (= start!15458 b!153429))

(assert (= (and b!153428 condMapEmpty!5125) mapIsEmpty!5126))

(assert (= (and b!153428 (not condMapEmpty!5125)) mapNonEmpty!5125))

(assert (= (and mapNonEmpty!5125 ((_ is ValueCellFull!1163) mapValue!5125)) b!153419))

(assert (= (and b!153428 ((_ is ValueCellFull!1163) mapDefault!5126)) b!153427))

(assert (= b!153423 b!153428))

(assert (= start!15458 b!153423))

(declare-fun m!186839 () Bool)

(assert (=> b!153421 m!186839))

(declare-fun m!186841 () Bool)

(assert (=> b!153421 m!186841))

(declare-fun m!186843 () Bool)

(assert (=> mapNonEmpty!5125 m!186843))

(declare-fun m!186845 () Bool)

(assert (=> b!153423 m!186845))

(declare-fun m!186847 () Bool)

(assert (=> b!153423 m!186847))

(declare-fun m!186849 () Bool)

(assert (=> mapNonEmpty!5126 m!186849))

(declare-fun m!186851 () Bool)

(assert (=> start!15458 m!186851))

(declare-fun m!186853 () Bool)

(assert (=> b!153422 m!186853))

(declare-fun m!186855 () Bool)

(assert (=> b!153422 m!186855))

(declare-fun m!186857 () Bool)

(assert (=> b!153426 m!186857))

(declare-fun m!186859 () Bool)

(assert (=> b!153430 m!186859))

(check-sat (not mapNonEmpty!5126) (not start!15458) (not b!153423) (not b_next!3195) (not b!153426) tp_is_empty!3013 (not b!153421) (not mapNonEmpty!5125) (not b!153422) b_and!9529 b_and!9531 (not b_next!3193))
(check-sat b_and!9529 b_and!9531 (not b_next!3193) (not b_next!3195))
