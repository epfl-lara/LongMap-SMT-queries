; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107496 () Bool)

(assert start!107496)

(declare-fun b!1273081 () Bool)

(declare-fun b_free!27701 () Bool)

(declare-fun b_next!27701 () Bool)

(assert (=> b!1273081 (= b_free!27701 (not b_next!27701))))

(declare-fun tp!97638 () Bool)

(declare-fun b_and!45757 () Bool)

(assert (=> b!1273081 (= tp!97638 b_and!45757)))

(declare-fun res!846673 () Bool)

(declare-fun e!726264 () Bool)

(assert (=> start!107496 (=> (not res!846673) (not e!726264))))

(declare-datatypes ((V!49287 0))(
  ( (V!49288 (val!16610 Int)) )
))
(declare-datatypes ((ValueCell!15682 0))(
  ( (ValueCellFull!15682 (v!19247 V!49287)) (EmptyCell!15682) )
))
(declare-datatypes ((array!83406 0))(
  ( (array!83407 (arr!40232 (Array (_ BitVec 32) ValueCell!15682)) (size!40773 (_ BitVec 32))) )
))
(declare-datatypes ((array!83408 0))(
  ( (array!83409 (arr!40233 (Array (_ BitVec 32) (_ BitVec 64))) (size!40774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6128 0))(
  ( (LongMapFixedSize!6129 (defaultEntry!6710 Int) (mask!34477 (_ BitVec 32)) (extraKeys!6389 (_ BitVec 32)) (zeroValue!6495 V!49287) (minValue!6495 V!49287) (_size!3119 (_ BitVec 32)) (_keys!12121 array!83408) (_values!6733 array!83406) (_vacant!3119 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6128)

(declare-fun valid!2299 (LongMapFixedSize!6128) Bool)

(assert (=> start!107496 (= res!846673 (valid!2299 thiss!1559))))

(assert (=> start!107496 e!726264))

(declare-fun e!726266 () Bool)

(assert (=> start!107496 e!726266))

(declare-fun b!1273075 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83408 (_ BitVec 32)) Bool)

(assert (=> b!1273075 (= e!726264 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12121 thiss!1559) (mask!34477 thiss!1559))))))

(declare-fun b!1273076 () Bool)

(declare-fun res!846674 () Bool)

(assert (=> b!1273076 (=> (not res!846674) (not e!726264))))

(assert (=> b!1273076 (= res!846674 (and (= (size!40773 (_values!6733 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34477 thiss!1559))) (= (size!40774 (_keys!12121 thiss!1559)) (size!40773 (_values!6733 thiss!1559))) (bvsge (mask!34477 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6389 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6389 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273077 () Bool)

(declare-fun e!726269 () Bool)

(declare-fun e!726265 () Bool)

(declare-fun mapRes!51216 () Bool)

(assert (=> b!1273077 (= e!726269 (and e!726265 mapRes!51216))))

(declare-fun condMapEmpty!51216 () Bool)

(declare-fun mapDefault!51216 () ValueCell!15682)

