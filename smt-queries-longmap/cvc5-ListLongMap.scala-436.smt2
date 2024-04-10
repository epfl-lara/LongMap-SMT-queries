; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8228 () Bool)

(assert start!8228)

(declare-fun b!52043 () Bool)

(declare-fun b_free!1621 () Bool)

(declare-fun b_next!1621 () Bool)

(assert (=> b!52043 (= b_free!1621 (not b_next!1621))))

(declare-fun tp!6963 () Bool)

(declare-fun b_and!2831 () Bool)

(assert (=> b!52043 (= tp!6963 b_and!2831)))

(declare-fun b!52046 () Bool)

(declare-fun b_free!1623 () Bool)

(declare-fun b_next!1623 () Bool)

(assert (=> b!52046 (= b_free!1623 (not b_next!1623))))

(declare-fun tp!6966 () Bool)

(declare-fun b_and!2833 () Bool)

(assert (=> b!52046 (= tp!6966 b_and!2833)))

(declare-fun b!52032 () Bool)

(declare-fun res!29683 () Bool)

(declare-fun e!33781 () Bool)

(assert (=> b!52032 (=> (not res!29683) (not e!33781))))

(declare-datatypes ((V!2617 0))(
  ( (V!2618 (val!1158 Int)) )
))
(declare-datatypes ((array!3377 0))(
  ( (array!3378 (arr!1611 (Array (_ BitVec 32) (_ BitVec 64))) (size!1840 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!770 0))(
  ( (ValueCellFull!770 (v!2206 V!2617)) (EmptyCell!770) )
))
(declare-datatypes ((array!3379 0))(
  ( (array!3380 (arr!1612 (Array (_ BitVec 32) ValueCell!770)) (size!1841 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!448 0))(
  ( (LongMapFixedSize!449 (defaultEntry!1938 Int) (mask!5757 (_ BitVec 32)) (extraKeys!1829 (_ BitVec 32)) (zeroValue!1856 V!2617) (minValue!1856 V!2617) (_size!273 (_ BitVec 32)) (_keys!3558 array!3377) (_values!1921 array!3379) (_vacant!273 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!448)

(declare-fun valid!156 (LongMapFixedSize!448) Bool)

(assert (=> b!52032 (= res!29683 (valid!156 newMap!16))))

(declare-fun b!52033 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52033 (= e!33781 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!52034 () Bool)

(declare-fun e!33785 () Bool)

(declare-fun e!33777 () Bool)

(assert (=> b!52034 (= e!33785 e!33777)))

(declare-fun b!52035 () Bool)

(declare-fun e!33780 () Bool)

(declare-fun tp_is_empty!2227 () Bool)

(assert (=> b!52035 (= e!33780 tp_is_empty!2227)))

(declare-fun b!52036 () Bool)

(declare-fun res!29687 () Bool)

(assert (=> b!52036 (=> (not res!29687) (not e!33781))))

(declare-datatypes ((Cell!272 0))(
  ( (Cell!273 (v!2207 LongMapFixedSize!448)) )
))
(declare-datatypes ((LongMap!272 0))(
  ( (LongMap!273 (underlying!147 Cell!272)) )
))
(declare-fun thiss!992 () LongMap!272)

(assert (=> b!52036 (= res!29687 (and (= (size!1841 (_values!1921 (v!2207 (underlying!147 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5757 (v!2207 (underlying!147 thiss!992))))) (= (size!1840 (_keys!3558 (v!2207 (underlying!147 thiss!992)))) (size!1841 (_values!1921 (v!2207 (underlying!147 thiss!992))))) (bvsge (mask!5757 (v!2207 (underlying!147 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1829 (v!2207 (underlying!147 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1829 (v!2207 (underlying!147 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52037 () Bool)

(declare-fun e!33776 () Bool)

(assert (=> b!52037 (= e!33776 tp_is_empty!2227)))

(declare-fun b!52038 () Bool)

(declare-fun e!33787 () Bool)

(assert (=> b!52038 (= e!33787 tp_is_empty!2227)))

(declare-fun b!52039 () Bool)

(declare-fun res!29685 () Bool)

(assert (=> b!52039 (=> (not res!29685) (not e!33781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52039 (= res!29685 (validMask!0 (mask!5757 (v!2207 (underlying!147 thiss!992)))))))

(declare-fun b!52040 () Bool)

(declare-fun res!29688 () Bool)

(assert (=> b!52040 (=> (not res!29688) (not e!33781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3377 (_ BitVec 32)) Bool)

(assert (=> b!52040 (= res!29688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3558 (v!2207 (underlying!147 thiss!992))) (mask!5757 (v!2207 (underlying!147 thiss!992)))))))

(declare-fun mapNonEmpty!2351 () Bool)

(declare-fun mapRes!2351 () Bool)

(declare-fun tp!6965 () Bool)

(assert (=> mapNonEmpty!2351 (= mapRes!2351 (and tp!6965 e!33776))))

(declare-fun mapKey!2352 () (_ BitVec 32))

(declare-fun mapRest!2352 () (Array (_ BitVec 32) ValueCell!770))

(declare-fun mapValue!2351 () ValueCell!770)

(assert (=> mapNonEmpty!2351 (= (arr!1612 (_values!1921 (v!2207 (underlying!147 thiss!992)))) (store mapRest!2352 mapKey!2352 mapValue!2351))))

(declare-fun b!52041 () Bool)

(declare-fun e!33786 () Bool)

(assert (=> b!52041 (= e!33786 e!33785)))

(declare-fun b!52042 () Bool)

(declare-fun res!29684 () Bool)

(assert (=> b!52042 (=> (not res!29684) (not e!33781))))

(declare-datatypes ((List!1336 0))(
  ( (Nil!1333) (Cons!1332 (h!1912 (_ BitVec 64)) (t!4370 List!1336)) )
))
(declare-fun arrayNoDuplicates!0 (array!3377 (_ BitVec 32) List!1336) Bool)

(assert (=> b!52042 (= res!29684 (arrayNoDuplicates!0 (_keys!3558 (v!2207 (underlying!147 thiss!992))) #b00000000000000000000000000000000 Nil!1333))))

(declare-fun e!33788 () Bool)

(declare-fun array_inv!989 (array!3377) Bool)

(declare-fun array_inv!990 (array!3379) Bool)

(assert (=> b!52043 (= e!33777 (and tp!6963 tp_is_empty!2227 (array_inv!989 (_keys!3558 (v!2207 (underlying!147 thiss!992)))) (array_inv!990 (_values!1921 (v!2207 (underlying!147 thiss!992)))) e!33788))))

(declare-fun b!52044 () Bool)

(declare-fun e!33778 () Bool)

(assert (=> b!52044 (= e!33778 tp_is_empty!2227)))

(declare-fun res!29686 () Bool)

(assert (=> start!8228 (=> (not res!29686) (not e!33781))))

(declare-fun valid!157 (LongMap!272) Bool)

(assert (=> start!8228 (= res!29686 (valid!157 thiss!992))))

(assert (=> start!8228 e!33781))

(assert (=> start!8228 e!33786))

(assert (=> start!8228 true))

(declare-fun e!33782 () Bool)

(assert (=> start!8228 e!33782))

(declare-fun b!52045 () Bool)

(declare-fun res!29690 () Bool)

(assert (=> b!52045 (=> (not res!29690) (not e!33781))))

(assert (=> b!52045 (= res!29690 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1840 (_keys!3558 (v!2207 (underlying!147 thiss!992)))))))))

(declare-fun e!33779 () Bool)

(assert (=> b!52046 (= e!33782 (and tp!6966 tp_is_empty!2227 (array_inv!989 (_keys!3558 newMap!16)) (array_inv!990 (_values!1921 newMap!16)) e!33779))))

(declare-fun mapIsEmpty!2351 () Bool)

(assert (=> mapIsEmpty!2351 mapRes!2351))

(declare-fun mapIsEmpty!2352 () Bool)

(declare-fun mapRes!2352 () Bool)

(assert (=> mapIsEmpty!2352 mapRes!2352))

(declare-fun b!52047 () Bool)

(assert (=> b!52047 (= e!33788 (and e!33787 mapRes!2351))))

(declare-fun condMapEmpty!2352 () Bool)

(declare-fun mapDefault!2352 () ValueCell!770)

