; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107512 () Bool)

(assert start!107512)

(declare-fun b!1273179 () Bool)

(declare-fun b_free!27707 () Bool)

(declare-fun b_next!27707 () Bool)

(assert (=> b!1273179 (= b_free!27707 (not b_next!27707))))

(declare-fun tp!97658 () Bool)

(declare-fun b_and!45763 () Bool)

(assert (=> b!1273179 (= tp!97658 b_and!45763)))

(declare-fun res!846725 () Bool)

(declare-fun e!726336 () Bool)

(assert (=> start!107512 (=> (not res!846725) (not e!726336))))

(declare-datatypes ((V!49295 0))(
  ( (V!49296 (val!16613 Int)) )
))
(declare-datatypes ((ValueCell!15685 0))(
  ( (ValueCellFull!15685 (v!19250 V!49295)) (EmptyCell!15685) )
))
(declare-datatypes ((array!83420 0))(
  ( (array!83421 (arr!40238 (Array (_ BitVec 32) ValueCell!15685)) (size!40779 (_ BitVec 32))) )
))
(declare-datatypes ((array!83422 0))(
  ( (array!83423 (arr!40239 (Array (_ BitVec 32) (_ BitVec 64))) (size!40780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6134 0))(
  ( (LongMapFixedSize!6135 (defaultEntry!6713 Int) (mask!34484 (_ BitVec 32)) (extraKeys!6392 (_ BitVec 32)) (zeroValue!6498 V!49295) (minValue!6498 V!49295) (_size!3122 (_ BitVec 32)) (_keys!12125 array!83422) (_values!6736 array!83420) (_vacant!3122 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6134)

(declare-fun valid!2302 (LongMapFixedSize!6134) Bool)

(assert (=> start!107512 (= res!846725 (valid!2302 thiss!1559))))

(assert (=> start!107512 e!726336))

(declare-fun e!726341 () Bool)

(assert (=> start!107512 e!726341))

(declare-fun mapNonEmpty!51228 () Bool)

(declare-fun mapRes!51228 () Bool)

(declare-fun tp!97659 () Bool)

(declare-fun e!726340 () Bool)

(assert (=> mapNonEmpty!51228 (= mapRes!51228 (and tp!97659 e!726340))))

(declare-fun mapKey!51228 () (_ BitVec 32))

(declare-fun mapRest!51228 () (Array (_ BitVec 32) ValueCell!15685))

(declare-fun mapValue!51228 () ValueCell!15685)

(assert (=> mapNonEmpty!51228 (= (arr!40238 (_values!6736 thiss!1559)) (store mapRest!51228 mapKey!51228 mapValue!51228))))

(declare-fun b!1273175 () Bool)

(declare-fun res!846723 () Bool)

(assert (=> b!1273175 (=> (not res!846723) (not e!726336))))

(assert (=> b!1273175 (= res!846723 (and (= (size!40779 (_values!6736 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34484 thiss!1559))) (= (size!40780 (_keys!12125 thiss!1559)) (size!40779 (_values!6736 thiss!1559))) (bvsge (mask!34484 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6392 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6392 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273176 () Bool)

(declare-fun res!846726 () Bool)

(assert (=> b!1273176 (=> (not res!846726) (not e!726336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83422 (_ BitVec 32)) Bool)

(assert (=> b!1273176 (= res!846726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12125 thiss!1559) (mask!34484 thiss!1559)))))

(declare-fun b!1273177 () Bool)

(declare-fun res!846724 () Bool)

(assert (=> b!1273177 (=> (not res!846724) (not e!726336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273177 (= res!846724 (validMask!0 (mask!34484 thiss!1559)))))

(declare-fun b!1273178 () Bool)

(declare-fun e!726337 () Bool)

(declare-fun e!726339 () Bool)

(assert (=> b!1273178 (= e!726337 (and e!726339 mapRes!51228))))

(declare-fun condMapEmpty!51228 () Bool)

(declare-fun mapDefault!51228 () ValueCell!15685)

