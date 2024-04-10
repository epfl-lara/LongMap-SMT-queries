; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80398 () Bool)

(assert start!80398)

(declare-fun b!944304 () Bool)

(declare-fun b_free!18041 () Bool)

(declare-fun b_next!18041 () Bool)

(assert (=> b!944304 (= b_free!18041 (not b_next!18041))))

(declare-fun tp!62632 () Bool)

(declare-fun b_and!29459 () Bool)

(assert (=> b!944304 (= tp!62632 b_and!29459)))

(declare-fun b!944295 () Bool)

(declare-fun e!531007 () Bool)

(declare-fun tp_is_empty!20549 () Bool)

(assert (=> b!944295 (= e!531007 tp_is_empty!20549)))

(declare-fun b!944296 () Bool)

(declare-fun e!531008 () Bool)

(declare-fun e!531012 () Bool)

(assert (=> b!944296 (= e!531008 (not e!531012))))

(declare-fun res!634364 () Bool)

(assert (=> b!944296 (=> res!634364 e!531012)))

(declare-datatypes ((V!32363 0))(
  ( (V!32364 (val!10325 Int)) )
))
(declare-datatypes ((ValueCell!9793 0))(
  ( (ValueCellFull!9793 (v!12857 V!32363)) (EmptyCell!9793) )
))
(declare-datatypes ((array!57066 0))(
  ( (array!57067 (arr!27458 (Array (_ BitVec 32) ValueCell!9793)) (size!27924 (_ BitVec 32))) )
))
(declare-datatypes ((array!57068 0))(
  ( (array!57069 (arr!27459 (Array (_ BitVec 32) (_ BitVec 64))) (size!27925 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4736 0))(
  ( (LongMapFixedSize!4737 (defaultEntry!5663 Int) (mask!27309 (_ BitVec 32)) (extraKeys!5395 (_ BitVec 32)) (zeroValue!5499 V!32363) (minValue!5499 V!32363) (_size!2423 (_ BitVec 32)) (_keys!10541 array!57068) (_values!5686 array!57066) (_vacant!2423 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4736)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944296 (= res!634364 (not (validMask!0 (mask!27309 thiss!1141))))))

(declare-fun lt!425586 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57068 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944296 (= lt!425586 (arrayScanForKey!0 (_keys!10541 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944296 (arrayContainsKey!0 (_keys!10541 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31842 0))(
  ( (Unit!31843) )
))
(declare-fun lt!425585 () Unit!31842)

(declare-fun lemmaKeyInListMapIsInArray!301 (array!57068 array!57066 (_ BitVec 32) (_ BitVec 32) V!32363 V!32363 (_ BitVec 64) Int) Unit!31842)

(assert (=> b!944296 (= lt!425585 (lemmaKeyInListMapIsInArray!301 (_keys!10541 thiss!1141) (_values!5686 thiss!1141) (mask!27309 thiss!1141) (extraKeys!5395 thiss!1141) (zeroValue!5499 thiss!1141) (minValue!5499 thiss!1141) key!756 (defaultEntry!5663 thiss!1141)))))

(declare-fun b!944297 () Bool)

(declare-fun res!634360 () Bool)

(assert (=> b!944297 (=> (not res!634360) (not e!531008))))

(assert (=> b!944297 (= res!634360 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944298 () Bool)

(declare-fun res!634361 () Bool)

(assert (=> b!944298 (=> (not res!634361) (not e!531008))))

(declare-datatypes ((tuple2!13470 0))(
  ( (tuple2!13471 (_1!6746 (_ BitVec 64)) (_2!6746 V!32363)) )
))
(declare-datatypes ((List!19269 0))(
  ( (Nil!19266) (Cons!19265 (h!20416 tuple2!13470) (t!27586 List!19269)) )
))
(declare-datatypes ((ListLongMap!12167 0))(
  ( (ListLongMap!12168 (toList!6099 List!19269)) )
))
(declare-fun contains!5171 (ListLongMap!12167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3333 (array!57068 array!57066 (_ BitVec 32) (_ BitVec 32) V!32363 V!32363 (_ BitVec 32) Int) ListLongMap!12167)

(assert (=> b!944298 (= res!634361 (contains!5171 (getCurrentListMap!3333 (_keys!10541 thiss!1141) (_values!5686 thiss!1141) (mask!27309 thiss!1141) (extraKeys!5395 thiss!1141) (zeroValue!5499 thiss!1141) (minValue!5499 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5663 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32649 () Bool)

(declare-fun mapRes!32649 () Bool)

(declare-fun tp!62633 () Bool)

(assert (=> mapNonEmpty!32649 (= mapRes!32649 (and tp!62633 e!531007))))

(declare-fun mapKey!32649 () (_ BitVec 32))

(declare-fun mapValue!32649 () ValueCell!9793)

(declare-fun mapRest!32649 () (Array (_ BitVec 32) ValueCell!9793))

(assert (=> mapNonEmpty!32649 (= (arr!27458 (_values!5686 thiss!1141)) (store mapRest!32649 mapKey!32649 mapValue!32649))))

(declare-fun res!634363 () Bool)

(assert (=> start!80398 (=> (not res!634363) (not e!531008))))

(declare-fun valid!1811 (LongMapFixedSize!4736) Bool)

(assert (=> start!80398 (= res!634363 (valid!1811 thiss!1141))))

(assert (=> start!80398 e!531008))

(declare-fun e!531010 () Bool)

(assert (=> start!80398 e!531010))

(assert (=> start!80398 true))

(declare-fun b!944299 () Bool)

(declare-fun res!634365 () Bool)

(assert (=> b!944299 (=> res!634365 e!531012)))

(assert (=> b!944299 (= res!634365 (or (not (= (size!27925 (_keys!10541 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27309 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27925 (_keys!10541 thiss!1141))) (bvslt lt!425586 #b00000000000000000000000000000000) (bvsgt lt!425586 (size!27925 (_keys!10541 thiss!1141)))))))

(declare-fun b!944300 () Bool)

(declare-fun e!531009 () Bool)

(assert (=> b!944300 (= e!531009 tp_is_empty!20549)))

(declare-fun b!944301 () Bool)

(assert (=> b!944301 (= e!531012 true)))

(declare-fun lt!425584 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57068 (_ BitVec 32)) Bool)

(assert (=> b!944301 (= lt!425584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10541 thiss!1141) (mask!27309 thiss!1141)))))

(declare-fun b!944302 () Bool)

(declare-fun e!531011 () Bool)

(assert (=> b!944302 (= e!531011 (and e!531009 mapRes!32649))))

(declare-fun condMapEmpty!32649 () Bool)

(declare-fun mapDefault!32649 () ValueCell!9793)

