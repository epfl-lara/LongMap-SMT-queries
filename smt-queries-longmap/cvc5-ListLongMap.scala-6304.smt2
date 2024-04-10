; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80696 () Bool)

(assert start!80696)

(declare-fun b!946584 () Bool)

(declare-fun b_free!18145 () Bool)

(declare-fun b_next!18145 () Bool)

(assert (=> b!946584 (= b_free!18145 (not b_next!18145))))

(declare-fun tp!62980 () Bool)

(declare-fun b_and!29567 () Bool)

(assert (=> b!946584 (= tp!62980 b_and!29567)))

(declare-fun b!946582 () Bool)

(declare-fun e!532634 () Bool)

(declare-fun tp_is_empty!20653 () Bool)

(assert (=> b!946582 (= e!532634 tp_is_empty!20653)))

(declare-fun b!946583 () Bool)

(declare-fun res!635437 () Bool)

(declare-fun e!532635 () Bool)

(assert (=> b!946583 (=> (not res!635437) (not e!532635))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946583 (= res!635437 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32840 () Bool)

(declare-fun mapRes!32840 () Bool)

(assert (=> mapIsEmpty!32840 mapRes!32840))

(declare-fun mapNonEmpty!32840 () Bool)

(declare-fun tp!62979 () Bool)

(assert (=> mapNonEmpty!32840 (= mapRes!32840 (and tp!62979 e!532634))))

(declare-datatypes ((V!32503 0))(
  ( (V!32504 (val!10377 Int)) )
))
(declare-datatypes ((ValueCell!9845 0))(
  ( (ValueCellFull!9845 (v!12911 V!32503)) (EmptyCell!9845) )
))
(declare-fun mapValue!32840 () ValueCell!9845)

(declare-fun mapRest!32840 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapKey!32840 () (_ BitVec 32))

(declare-datatypes ((array!57294 0))(
  ( (array!57295 (arr!27562 (Array (_ BitVec 32) ValueCell!9845)) (size!28033 (_ BitVec 32))) )
))
(declare-datatypes ((array!57296 0))(
  ( (array!57297 (arr!27563 (Array (_ BitVec 32) (_ BitVec 64))) (size!28034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4840 0))(
  ( (LongMapFixedSize!4841 (defaultEntry!5717 Int) (mask!27426 (_ BitVec 32)) (extraKeys!5449 (_ BitVec 32)) (zeroValue!5553 V!32503) (minValue!5553 V!32503) (_size!2475 (_ BitVec 32)) (_keys!10614 array!57296) (_values!5740 array!57294) (_vacant!2475 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4840)

(assert (=> mapNonEmpty!32840 (= (arr!27562 (_values!5740 thiss!1141)) (store mapRest!32840 mapKey!32840 mapValue!32840))))

(declare-fun e!532636 () Bool)

(declare-fun e!532633 () Bool)

(declare-fun array_inv!21400 (array!57296) Bool)

(declare-fun array_inv!21401 (array!57294) Bool)

(assert (=> b!946584 (= e!532633 (and tp!62980 tp_is_empty!20653 (array_inv!21400 (_keys!10614 thiss!1141)) (array_inv!21401 (_values!5740 thiss!1141)) e!532636))))

(declare-fun b!946585 () Bool)

(declare-fun e!532632 () Bool)

(assert (=> b!946585 (= e!532635 e!532632)))

(declare-fun res!635435 () Bool)

(assert (=> b!946585 (=> (not res!635435) (not e!532632))))

(declare-datatypes ((SeekEntryResult!9104 0))(
  ( (MissingZero!9104 (index!38787 (_ BitVec 32))) (Found!9104 (index!38788 (_ BitVec 32))) (Intermediate!9104 (undefined!9916 Bool) (index!38789 (_ BitVec 32)) (x!81406 (_ BitVec 32))) (Undefined!9104) (MissingVacant!9104 (index!38790 (_ BitVec 32))) )
))
(declare-fun lt!426336 () SeekEntryResult!9104)

(assert (=> b!946585 (= res!635435 (is-Found!9104 lt!426336))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57296 (_ BitVec 32)) SeekEntryResult!9104)

(assert (=> b!946585 (= lt!426336 (seekEntry!0 key!756 (_keys!10614 thiss!1141) (mask!27426 thiss!1141)))))

(declare-fun b!946586 () Bool)

(declare-fun e!532638 () Bool)

(assert (=> b!946586 (= e!532638 (or (not (= (size!28033 (_values!5740 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27426 thiss!1141)))) (not (= (size!28034 (_keys!10614 thiss!1141)) (size!28033 (_values!5740 thiss!1141)))) (bvslt (mask!27426 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5449 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946587 () Bool)

(assert (=> b!946587 (= e!532632 (not e!532638))))

(declare-fun res!635434 () Bool)

(assert (=> b!946587 (=> res!635434 e!532638)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946587 (= res!635434 (not (validMask!0 (mask!27426 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946587 (arrayContainsKey!0 (_keys!10614 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31906 0))(
  ( (Unit!31907) )
))
(declare-fun lt!426335 () Unit!31906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57296 (_ BitVec 64) (_ BitVec 32)) Unit!31906)

(assert (=> b!946587 (= lt!426335 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10614 thiss!1141) key!756 (index!38788 lt!426336)))))

(declare-fun b!946588 () Bool)

(declare-fun e!532631 () Bool)

(assert (=> b!946588 (= e!532631 tp_is_empty!20653)))

(declare-fun b!946589 () Bool)

(assert (=> b!946589 (= e!532636 (and e!532631 mapRes!32840))))

(declare-fun condMapEmpty!32840 () Bool)

(declare-fun mapDefault!32840 () ValueCell!9845)

