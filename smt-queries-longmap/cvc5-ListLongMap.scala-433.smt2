; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8126 () Bool)

(assert start!8126)

(declare-fun b!51223 () Bool)

(declare-fun b_free!1585 () Bool)

(declare-fun b_next!1585 () Bool)

(assert (=> b!51223 (= b_free!1585 (not b_next!1585))))

(declare-fun tp!6838 () Bool)

(declare-fun b_and!2795 () Bool)

(assert (=> b!51223 (= tp!6838 b_and!2795)))

(declare-fun b!51222 () Bool)

(declare-fun b_free!1587 () Bool)

(declare-fun b_next!1587 () Bool)

(assert (=> b!51222 (= b_free!1587 (not b_next!1587))))

(declare-fun tp!6836 () Bool)

(declare-fun b_and!2797 () Bool)

(assert (=> b!51222 (= tp!6836 b_and!2797)))

(declare-fun b!51219 () Bool)

(declare-fun e!33188 () Bool)

(declare-fun tp_is_empty!2209 () Bool)

(assert (=> b!51219 (= e!33188 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2277 () Bool)

(declare-fun mapRes!2277 () Bool)

(declare-fun tp!6837 () Bool)

(declare-fun e!33187 () Bool)

(assert (=> mapNonEmpty!2277 (= mapRes!2277 (and tp!6837 e!33187))))

(declare-fun mapKey!2278 () (_ BitVec 32))

(declare-datatypes ((V!2593 0))(
  ( (V!2594 (val!1149 Int)) )
))
(declare-datatypes ((ValueCell!761 0))(
  ( (ValueCellFull!761 (v!2186 V!2593)) (EmptyCell!761) )
))
(declare-fun mapRest!2278 () (Array (_ BitVec 32) ValueCell!761))

(declare-datatypes ((array!3335 0))(
  ( (array!3336 (arr!1593 (Array (_ BitVec 32) (_ BitVec 64))) (size!1819 (_ BitVec 32))) )
))
(declare-datatypes ((array!3337 0))(
  ( (array!3338 (arr!1594 (Array (_ BitVec 32) ValueCell!761)) (size!1820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!430 0))(
  ( (LongMapFixedSize!431 (defaultEntry!1929 Int) (mask!5733 (_ BitVec 32)) (extraKeys!1820 (_ BitVec 32)) (zeroValue!1847 V!2593) (minValue!1847 V!2593) (_size!264 (_ BitVec 32)) (_keys!3543 array!3335) (_values!1912 array!3337) (_vacant!264 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!430)

(declare-fun mapValue!2278 () ValueCell!761)

(assert (=> mapNonEmpty!2277 (= (arr!1594 (_values!1912 newMap!16)) (store mapRest!2278 mapKey!2278 mapValue!2278))))

(declare-fun b!51220 () Bool)

(declare-fun res!29342 () Bool)

(declare-fun e!33198 () Bool)

(assert (=> b!51220 (=> (not res!29342) (not e!33198))))

(declare-datatypes ((Cell!254 0))(
  ( (Cell!255 (v!2187 LongMapFixedSize!430)) )
))
(declare-datatypes ((LongMap!254 0))(
  ( (LongMap!255 (underlying!138 Cell!254)) )
))
(declare-fun thiss!992 () LongMap!254)

(assert (=> b!51220 (= res!29342 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5733 newMap!16)) (_size!264 (v!2187 (underlying!138 thiss!992)))))))

(declare-fun mapNonEmpty!2278 () Bool)

(declare-fun mapRes!2278 () Bool)

(declare-fun tp!6835 () Bool)

(declare-fun e!33195 () Bool)

(assert (=> mapNonEmpty!2278 (= mapRes!2278 (and tp!6835 e!33195))))

(declare-fun mapRest!2277 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2277 () (_ BitVec 32))

(declare-fun mapValue!2277 () ValueCell!761)

(assert (=> mapNonEmpty!2278 (= (arr!1594 (_values!1912 (v!2187 (underlying!138 thiss!992)))) (store mapRest!2277 mapKey!2277 mapValue!2277))))

(declare-fun b!51221 () Bool)

(declare-fun e!33189 () Bool)

(declare-fun e!33196 () Bool)

(assert (=> b!51221 (= e!33189 e!33196)))

(declare-fun e!33191 () Bool)

(declare-fun e!33197 () Bool)

(declare-fun array_inv!977 (array!3335) Bool)

(declare-fun array_inv!978 (array!3337) Bool)

(assert (=> b!51222 (= e!33191 (and tp!6836 tp_is_empty!2209 (array_inv!977 (_keys!3543 newMap!16)) (array_inv!978 (_values!1912 newMap!16)) e!33197))))

(declare-fun mapIsEmpty!2277 () Bool)

(assert (=> mapIsEmpty!2277 mapRes!2278))

(declare-fun e!33194 () Bool)

(declare-fun e!33199 () Bool)

(assert (=> b!51223 (= e!33194 (and tp!6838 tp_is_empty!2209 (array_inv!977 (_keys!3543 (v!2187 (underlying!138 thiss!992)))) (array_inv!978 (_values!1912 (v!2187 (underlying!138 thiss!992)))) e!33199))))

(declare-fun res!29343 () Bool)

(assert (=> start!8126 (=> (not res!29343) (not e!33198))))

(declare-fun valid!146 (LongMap!254) Bool)

(assert (=> start!8126 (= res!29343 (valid!146 thiss!992))))

(assert (=> start!8126 e!33198))

(assert (=> start!8126 e!33189))

(assert (=> start!8126 true))

(assert (=> start!8126 e!33191))

(declare-fun b!51224 () Bool)

(assert (=> b!51224 (= e!33195 tp_is_empty!2209)))

(declare-fun b!51225 () Bool)

(assert (=> b!51225 (= e!33198 (and (= (size!1820 (_values!1912 (v!2187 (underlying!138 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5733 (v!2187 (underlying!138 thiss!992))))) (= (size!1819 (_keys!3543 (v!2187 (underlying!138 thiss!992)))) (size!1820 (_values!1912 (v!2187 (underlying!138 thiss!992))))) (bvsge (mask!5733 (v!2187 (underlying!138 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1820 (v!2187 (underlying!138 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1820 (v!2187 (underlying!138 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51226 () Bool)

(assert (=> b!51226 (= e!33187 tp_is_empty!2209)))

(declare-fun b!51227 () Bool)

(declare-fun res!29340 () Bool)

(assert (=> b!51227 (=> (not res!29340) (not e!33198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51227 (= res!29340 (validMask!0 (mask!5733 (v!2187 (underlying!138 thiss!992)))))))

(declare-fun b!51228 () Bool)

(declare-fun res!29344 () Bool)

(assert (=> b!51228 (=> (not res!29344) (not e!33198))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51228 (= res!29344 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1819 (_keys!3543 (v!2187 (underlying!138 thiss!992)))))))))

(declare-fun b!51229 () Bool)

(assert (=> b!51229 (= e!33196 e!33194)))

(declare-fun b!51230 () Bool)

(assert (=> b!51230 (= e!33197 (and e!33188 mapRes!2277))))

(declare-fun condMapEmpty!2277 () Bool)

(declare-fun mapDefault!2277 () ValueCell!761)

