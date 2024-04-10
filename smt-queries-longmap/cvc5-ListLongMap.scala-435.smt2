; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8194 () Bool)

(assert start!8194)

(declare-fun b!51761 () Bool)

(declare-fun b_free!1609 () Bool)

(declare-fun b_next!1609 () Bool)

(assert (=> b!51761 (= b_free!1609 (not b_next!1609))))

(declare-fun tp!6922 () Bool)

(declare-fun b_and!2819 () Bool)

(assert (=> b!51761 (= tp!6922 b_and!2819)))

(declare-fun b!51758 () Bool)

(declare-fun b_free!1611 () Bool)

(declare-fun b_next!1611 () Bool)

(assert (=> b!51758 (= b_free!1611 (not b_next!1611))))

(declare-fun tp!6924 () Bool)

(declare-fun b_and!2821 () Bool)

(assert (=> b!51758 (= tp!6924 b_and!2821)))

(declare-fun b!51752 () Bool)

(declare-fun e!33579 () Bool)

(declare-fun tp_is_empty!2221 () Bool)

(assert (=> b!51752 (= e!33579 tp_is_empty!2221)))

(declare-fun res!29563 () Bool)

(declare-fun e!33590 () Bool)

(assert (=> start!8194 (=> (not res!29563) (not e!33590))))

(declare-datatypes ((V!2609 0))(
  ( (V!2610 (val!1155 Int)) )
))
(declare-datatypes ((array!3363 0))(
  ( (array!3364 (arr!1605 (Array (_ BitVec 32) (_ BitVec 64))) (size!1833 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!767 0))(
  ( (ValueCellFull!767 (v!2199 V!2609)) (EmptyCell!767) )
))
(declare-datatypes ((array!3365 0))(
  ( (array!3366 (arr!1606 (Array (_ BitVec 32) ValueCell!767)) (size!1834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!442 0))(
  ( (LongMapFixedSize!443 (defaultEntry!1935 Int) (mask!5749 (_ BitVec 32)) (extraKeys!1826 (_ BitVec 32)) (zeroValue!1853 V!2609) (minValue!1853 V!2609) (_size!270 (_ BitVec 32)) (_keys!3553 array!3363) (_values!1918 array!3365) (_vacant!270 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!266 0))(
  ( (Cell!267 (v!2200 LongMapFixedSize!442)) )
))
(declare-datatypes ((LongMap!266 0))(
  ( (LongMap!267 (underlying!144 Cell!266)) )
))
(declare-fun thiss!992 () LongMap!266)

(declare-fun valid!152 (LongMap!266) Bool)

(assert (=> start!8194 (= res!29563 (valid!152 thiss!992))))

(assert (=> start!8194 e!33590))

(declare-fun e!33583 () Bool)

(assert (=> start!8194 e!33583))

(assert (=> start!8194 true))

(declare-fun e!33587 () Bool)

(assert (=> start!8194 e!33587))

(declare-fun b!51753 () Bool)

(declare-fun e!33581 () Bool)

(assert (=> b!51753 (= e!33581 tp_is_empty!2221)))

(declare-fun mapIsEmpty!2327 () Bool)

(declare-fun mapRes!2328 () Bool)

(assert (=> mapIsEmpty!2327 mapRes!2328))

(declare-fun b!51754 () Bool)

(declare-fun e!33578 () Bool)

(declare-fun e!33584 () Bool)

(assert (=> b!51754 (= e!33578 e!33584)))

(declare-fun mapNonEmpty!2327 () Bool)

(declare-fun tp!6921 () Bool)

(declare-fun e!33585 () Bool)

(assert (=> mapNonEmpty!2327 (= mapRes!2328 (and tp!6921 e!33585))))

(declare-fun mapRest!2328 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapKey!2328 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!442)

(declare-fun mapValue!2328 () ValueCell!767)

(assert (=> mapNonEmpty!2327 (= (arr!1606 (_values!1918 newMap!16)) (store mapRest!2328 mapKey!2328 mapValue!2328))))

(declare-fun b!51755 () Bool)

(assert (=> b!51755 (= e!33583 e!33578)))

(declare-fun b!51756 () Bool)

(declare-fun res!29560 () Bool)

(assert (=> b!51756 (=> (not res!29560) (not e!33590))))

(assert (=> b!51756 (= res!29560 (and (= (size!1834 (_values!1918 (v!2200 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5749 (v!2200 (underlying!144 thiss!992))))) (= (size!1833 (_keys!3553 (v!2200 (underlying!144 thiss!992)))) (size!1834 (_values!1918 (v!2200 (underlying!144 thiss!992))))) (bvsge (mask!5749 (v!2200 (underlying!144 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1826 (v!2200 (underlying!144 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1826 (v!2200 (underlying!144 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51757 () Bool)

(declare-datatypes ((List!1334 0))(
  ( (Nil!1331) (Cons!1330 (h!1910 (_ BitVec 64)) (t!4368 List!1334)) )
))
(declare-fun arrayNoDuplicates!0 (array!3363 (_ BitVec 32) List!1334) Bool)

(assert (=> b!51757 (= e!33590 (not (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!144 thiss!992))) #b00000000000000000000000000000000 Nil!1331)))))

(declare-fun e!33589 () Bool)

(declare-fun array_inv!985 (array!3363) Bool)

(declare-fun array_inv!986 (array!3365) Bool)

(assert (=> b!51758 (= e!33587 (and tp!6924 tp_is_empty!2221 (array_inv!985 (_keys!3553 newMap!16)) (array_inv!986 (_values!1918 newMap!16)) e!33589))))

(declare-fun b!51759 () Bool)

(declare-fun res!29561 () Bool)

(assert (=> b!51759 (=> (not res!29561) (not e!33590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51759 (= res!29561 (validMask!0 (mask!5749 (v!2200 (underlying!144 thiss!992)))))))

(declare-fun b!51760 () Bool)

(declare-fun res!29558 () Bool)

(assert (=> b!51760 (=> (not res!29558) (not e!33590))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51760 (= res!29558 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1833 (_keys!3553 (v!2200 (underlying!144 thiss!992)))))))))

(declare-fun e!33580 () Bool)

(assert (=> b!51761 (= e!33584 (and tp!6922 tp_is_empty!2221 (array_inv!985 (_keys!3553 (v!2200 (underlying!144 thiss!992)))) (array_inv!986 (_values!1918 (v!2200 (underlying!144 thiss!992)))) e!33580))))

(declare-fun b!51762 () Bool)

(assert (=> b!51762 (= e!33589 (and e!33579 mapRes!2328))))

(declare-fun condMapEmpty!2327 () Bool)

(declare-fun mapDefault!2327 () ValueCell!767)

