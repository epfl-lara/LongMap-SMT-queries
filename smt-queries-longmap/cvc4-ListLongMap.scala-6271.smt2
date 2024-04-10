; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80238 () Bool)

(assert start!80238)

(declare-fun b!942512 () Bool)

(declare-fun b_free!17951 () Bool)

(declare-fun b_next!17951 () Bool)

(assert (=> b!942512 (= b_free!17951 (not b_next!17951))))

(declare-fun tp!62355 () Bool)

(declare-fun b_and!29363 () Bool)

(assert (=> b!942512 (= tp!62355 b_and!29363)))

(declare-fun e!529934 () Bool)

(declare-datatypes ((V!32243 0))(
  ( (V!32244 (val!10280 Int)) )
))
(declare-datatypes ((ValueCell!9748 0))(
  ( (ValueCellFull!9748 (v!12811 V!32243)) (EmptyCell!9748) )
))
(declare-datatypes ((array!56882 0))(
  ( (array!56883 (arr!27368 (Array (_ BitVec 32) ValueCell!9748)) (size!27833 (_ BitVec 32))) )
))
(declare-datatypes ((array!56884 0))(
  ( (array!56885 (arr!27369 (Array (_ BitVec 32) (_ BitVec 64))) (size!27834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4646 0))(
  ( (LongMapFixedSize!4647 (defaultEntry!5614 Int) (mask!27221 (_ BitVec 32)) (extraKeys!5346 (_ BitVec 32)) (zeroValue!5450 V!32243) (minValue!5450 V!32243) (_size!2378 (_ BitVec 32)) (_keys!10486 array!56884) (_values!5637 array!56882) (_vacant!2378 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4646)

(declare-fun e!529931 () Bool)

(declare-fun tp_is_empty!20459 () Bool)

(declare-fun array_inv!21264 (array!56884) Bool)

(declare-fun array_inv!21265 (array!56882) Bool)

(assert (=> b!942512 (= e!529934 (and tp!62355 tp_is_empty!20459 (array_inv!21264 (_keys!10486 thiss!1141)) (array_inv!21265 (_values!5637 thiss!1141)) e!529931))))

(declare-fun b!942513 () Bool)

(declare-fun res!633356 () Bool)

(declare-fun e!529933 () Bool)

(assert (=> b!942513 (=> (not res!633356) (not e!529933))))

(declare-datatypes ((List!19216 0))(
  ( (Nil!19213) (Cons!19212 (h!20362 (_ BitVec 64)) (t!27531 List!19216)) )
))
(declare-fun arrayNoDuplicates!0 (array!56884 (_ BitVec 32) List!19216) Bool)

(assert (=> b!942513 (= res!633356 (arrayNoDuplicates!0 (_keys!10486 thiss!1141) #b00000000000000000000000000000000 Nil!19213))))

(declare-fun b!942514 () Bool)

(declare-fun res!633355 () Bool)

(assert (=> b!942514 (=> (not res!633355) (not e!529933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56884 (_ BitVec 32)) Bool)

(assert (=> b!942514 (= res!633355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10486 thiss!1141) (mask!27221 thiss!1141)))))

(declare-fun b!942515 () Bool)

(declare-fun res!633350 () Bool)

(assert (=> b!942515 (=> (not res!633350) (not e!529933))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9033 0))(
  ( (MissingZero!9033 (index!38503 (_ BitVec 32))) (Found!9033 (index!38504 (_ BitVec 32))) (Intermediate!9033 (undefined!9845 Bool) (index!38505 (_ BitVec 32)) (x!80922 (_ BitVec 32))) (Undefined!9033) (MissingVacant!9033 (index!38506 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56884 (_ BitVec 32)) SeekEntryResult!9033)

(assert (=> b!942515 (= res!633350 (not (is-Found!9033 (seekEntry!0 key!756 (_keys!10486 thiss!1141) (mask!27221 thiss!1141)))))))

(declare-fun mapIsEmpty!32507 () Bool)

(declare-fun mapRes!32507 () Bool)

(assert (=> mapIsEmpty!32507 mapRes!32507))

(declare-fun b!942516 () Bool)

(declare-fun e!529935 () Bool)

(assert (=> b!942516 (= e!529935 tp_is_empty!20459)))

(declare-fun b!942517 () Bool)

(declare-fun res!633351 () Bool)

(assert (=> b!942517 (=> (not res!633351) (not e!529933))))

(assert (=> b!942517 (= res!633351 (and (= (size!27833 (_values!5637 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27221 thiss!1141))) (= (size!27834 (_keys!10486 thiss!1141)) (size!27833 (_values!5637 thiss!1141))) (bvsge (mask!27221 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5346 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5346 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32507 () Bool)

(declare-fun tp!62356 () Bool)

(assert (=> mapNonEmpty!32507 (= mapRes!32507 (and tp!62356 e!529935))))

(declare-fun mapKey!32507 () (_ BitVec 32))

(declare-fun mapRest!32507 () (Array (_ BitVec 32) ValueCell!9748))

(declare-fun mapValue!32507 () ValueCell!9748)

(assert (=> mapNonEmpty!32507 (= (arr!27368 (_values!5637 thiss!1141)) (store mapRest!32507 mapKey!32507 mapValue!32507))))

(declare-fun b!942519 () Bool)

(declare-fun res!633352 () Bool)

(assert (=> b!942519 (=> (not res!633352) (not e!529933))))

(assert (=> b!942519 (= res!633352 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942520 () Bool)

(assert (=> b!942520 (= e!529933 (bvsgt #b00000000000000000000000000000000 (size!27834 (_keys!10486 thiss!1141))))))

(declare-fun b!942521 () Bool)

(declare-fun res!633354 () Bool)

(assert (=> b!942521 (=> (not res!633354) (not e!529933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942521 (= res!633354 (validMask!0 (mask!27221 thiss!1141)))))

(declare-fun b!942522 () Bool)

(declare-fun e!529930 () Bool)

(assert (=> b!942522 (= e!529930 tp_is_empty!20459)))

(declare-fun res!633353 () Bool)

(assert (=> start!80238 (=> (not res!633353) (not e!529933))))

(declare-fun valid!1778 (LongMapFixedSize!4646) Bool)

(assert (=> start!80238 (= res!633353 (valid!1778 thiss!1141))))

(assert (=> start!80238 e!529933))

(assert (=> start!80238 e!529934))

(assert (=> start!80238 true))

(declare-fun b!942518 () Bool)

(assert (=> b!942518 (= e!529931 (and e!529930 mapRes!32507))))

(declare-fun condMapEmpty!32507 () Bool)

(declare-fun mapDefault!32507 () ValueCell!9748)

