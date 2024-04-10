; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80296 () Bool)

(assert start!80296)

(declare-fun b!943300 () Bool)

(declare-fun b_free!17995 () Bool)

(declare-fun b_next!17995 () Bool)

(assert (=> b!943300 (= b_free!17995 (not b_next!17995))))

(declare-fun tp!62491 () Bool)

(declare-fun b_and!29407 () Bool)

(assert (=> b!943300 (= tp!62491 b_and!29407)))

(declare-fun e!530367 () Bool)

(declare-fun tp_is_empty!20503 () Bool)

(declare-fun e!530370 () Bool)

(declare-datatypes ((V!32303 0))(
  ( (V!32304 (val!10302 Int)) )
))
(declare-datatypes ((ValueCell!9770 0))(
  ( (ValueCellFull!9770 (v!12833 V!32303)) (EmptyCell!9770) )
))
(declare-datatypes ((array!56972 0))(
  ( (array!56973 (arr!27412 (Array (_ BitVec 32) ValueCell!9770)) (size!27877 (_ BitVec 32))) )
))
(declare-datatypes ((array!56974 0))(
  ( (array!56975 (arr!27413 (Array (_ BitVec 32) (_ BitVec 64))) (size!27878 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4690 0))(
  ( (LongMapFixedSize!4691 (defaultEntry!5636 Int) (mask!27262 (_ BitVec 32)) (extraKeys!5368 (_ BitVec 32)) (zeroValue!5472 V!32303) (minValue!5472 V!32303) (_size!2400 (_ BitVec 32)) (_keys!10510 array!56974) (_values!5659 array!56972) (_vacant!2400 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4690)

(declare-fun array_inv!21300 (array!56974) Bool)

(declare-fun array_inv!21301 (array!56972) Bool)

(assert (=> b!943300 (= e!530370 (and tp!62491 tp_is_empty!20503 (array_inv!21300 (_keys!10510 thiss!1141)) (array_inv!21301 (_values!5659 thiss!1141)) e!530367))))

(declare-fun b!943301 () Bool)

(declare-fun e!530368 () Bool)

(assert (=> b!943301 (= e!530368 tp_is_empty!20503)))

(declare-fun res!633838 () Bool)

(declare-fun e!530369 () Bool)

(assert (=> start!80296 (=> (not res!633838) (not e!530369))))

(declare-fun valid!1792 (LongMapFixedSize!4690) Bool)

(assert (=> start!80296 (= res!633838 (valid!1792 thiss!1141))))

(assert (=> start!80296 e!530369))

(assert (=> start!80296 e!530370))

(assert (=> start!80296 true))

(declare-fun mapNonEmpty!32576 () Bool)

(declare-fun mapRes!32576 () Bool)

(declare-fun tp!62490 () Bool)

(assert (=> mapNonEmpty!32576 (= mapRes!32576 (and tp!62490 e!530368))))

(declare-fun mapKey!32576 () (_ BitVec 32))

(declare-fun mapRest!32576 () (Array (_ BitVec 32) ValueCell!9770))

(declare-fun mapValue!32576 () ValueCell!9770)

(assert (=> mapNonEmpty!32576 (= (arr!27412 (_values!5659 thiss!1141)) (store mapRest!32576 mapKey!32576 mapValue!32576))))

(declare-fun b!943302 () Bool)

(declare-fun res!633836 () Bool)

(assert (=> b!943302 (=> (not res!633836) (not e!530369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56974 (_ BitVec 32)) Bool)

(assert (=> b!943302 (= res!633836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10510 thiss!1141) (mask!27262 thiss!1141)))))

(declare-fun mapIsEmpty!32576 () Bool)

(assert (=> mapIsEmpty!32576 mapRes!32576))

(declare-fun b!943303 () Bool)

(declare-fun e!530366 () Bool)

(assert (=> b!943303 (= e!530367 (and e!530366 mapRes!32576))))

(declare-fun condMapEmpty!32576 () Bool)

(declare-fun mapDefault!32576 () ValueCell!9770)

