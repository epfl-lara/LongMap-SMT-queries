; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83628 () Bool)

(assert start!83628)

(declare-fun b_free!19447 () Bool)

(declare-fun b_next!19447 () Bool)

(assert (=> start!83628 (= b_free!19447 (not b_next!19447))))

(declare-fun tp!67629 () Bool)

(declare-fun b_and!31059 () Bool)

(assert (=> start!83628 (= tp!67629 b_and!31059)))

(declare-fun b!975760 () Bool)

(declare-fun e!550038 () Bool)

(declare-fun tp_is_empty!22351 () Bool)

(assert (=> b!975760 (= e!550038 tp_is_empty!22351)))

(declare-fun b!975761 () Bool)

(declare-fun e!550042 () Bool)

(declare-fun e!550040 () Bool)

(declare-fun mapRes!35536 () Bool)

(assert (=> b!975761 (= e!550042 (and e!550040 mapRes!35536))))

(declare-fun condMapEmpty!35536 () Bool)

(declare-datatypes ((V!34785 0))(
  ( (V!34786 (val!11226 Int)) )
))
(declare-datatypes ((ValueCell!10694 0))(
  ( (ValueCellFull!10694 (v!13782 V!34785)) (EmptyCell!10694) )
))
(declare-datatypes ((array!60770 0))(
  ( (array!60771 (arr!29244 (Array (_ BitVec 32) ValueCell!10694)) (size!29724 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60770)

(declare-fun mapDefault!35536 () ValueCell!10694)

(assert (=> b!975761 (= condMapEmpty!35536 (= (arr!29244 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10694)) mapDefault!35536)))))

(declare-fun b!975762 () Bool)

(declare-fun e!550039 () Bool)

(assert (=> b!975762 (= e!550039 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34785)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34785)

(declare-datatypes ((tuple2!14436 0))(
  ( (tuple2!14437 (_1!7229 (_ BitVec 64)) (_2!7229 V!34785)) )
))
(declare-datatypes ((List!20284 0))(
  ( (Nil!20281) (Cons!20280 (h!21448 tuple2!14436) (t!28753 List!20284)) )
))
(declare-datatypes ((ListLongMap!13135 0))(
  ( (ListLongMap!13136 (toList!6583 List!20284)) )
))
(declare-fun lt!433167 () ListLongMap!13135)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60772 0))(
  ( (array!60773 (arr!29245 (Array (_ BitVec 32) (_ BitVec 64))) (size!29725 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60772)

(declare-fun getCurrentListMap!3816 (array!60772 array!60770 (_ BitVec 32) (_ BitVec 32) V!34785 V!34785 (_ BitVec 32) Int) ListLongMap!13135)

(assert (=> b!975762 (= lt!433167 (getCurrentListMap!3816 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!652922 () Bool)

(assert (=> start!83628 (=> (not res!652922) (not e!550039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83628 (= res!652922 (validMask!0 mask!2147))))

(assert (=> start!83628 e!550039))

(assert (=> start!83628 true))

(declare-fun array_inv!22667 (array!60770) Bool)

(assert (=> start!83628 (and (array_inv!22667 _values!1425) e!550042)))

(assert (=> start!83628 tp_is_empty!22351))

(assert (=> start!83628 tp!67629))

(declare-fun array_inv!22668 (array!60772) Bool)

(assert (=> start!83628 (array_inv!22668 _keys!1717)))

(declare-fun b!975763 () Bool)

(assert (=> b!975763 (= e!550040 tp_is_empty!22351)))

(declare-fun b!975764 () Bool)

(declare-fun res!652916 () Bool)

(assert (=> b!975764 (=> (not res!652916) (not e!550039))))

(assert (=> b!975764 (= res!652916 (and (= (size!29724 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29725 _keys!1717) (size!29724 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35536 () Bool)

(assert (=> mapIsEmpty!35536 mapRes!35536))

(declare-fun b!975765 () Bool)

(declare-fun res!652918 () Bool)

(assert (=> b!975765 (=> (not res!652918) (not e!550039))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975765 (= res!652918 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29725 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29725 _keys!1717))))))

(declare-fun b!975766 () Bool)

(declare-fun res!652917 () Bool)

(assert (=> b!975766 (=> (not res!652917) (not e!550039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975766 (= res!652917 (validKeyInArray!0 (select (arr!29245 _keys!1717) i!822)))))

(declare-fun b!975767 () Bool)

(declare-fun res!652921 () Bool)

(assert (=> b!975767 (=> (not res!652921) (not e!550039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60772 (_ BitVec 32)) Bool)

(assert (=> b!975767 (= res!652921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975768 () Bool)

(declare-fun res!652920 () Bool)

(assert (=> b!975768 (=> (not res!652920) (not e!550039))))

(declare-fun contains!5685 (ListLongMap!13135 (_ BitVec 64)) Bool)

(assert (=> b!975768 (= res!652920 (contains!5685 (getCurrentListMap!3816 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29245 _keys!1717) i!822)))))

(declare-fun b!975769 () Bool)

(declare-fun res!652919 () Bool)

(assert (=> b!975769 (=> (not res!652919) (not e!550039))))

(declare-datatypes ((List!20285 0))(
  ( (Nil!20282) (Cons!20281 (h!21449 (_ BitVec 64)) (t!28754 List!20285)) )
))
(declare-fun arrayNoDuplicates!0 (array!60772 (_ BitVec 32) List!20285) Bool)

(assert (=> b!975769 (= res!652919 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20282))))

(declare-fun mapNonEmpty!35536 () Bool)

(declare-fun tp!67630 () Bool)

(assert (=> mapNonEmpty!35536 (= mapRes!35536 (and tp!67630 e!550038))))

(declare-fun mapRest!35536 () (Array (_ BitVec 32) ValueCell!10694))

(declare-fun mapValue!35536 () ValueCell!10694)

(declare-fun mapKey!35536 () (_ BitVec 32))

(assert (=> mapNonEmpty!35536 (= (arr!29244 _values!1425) (store mapRest!35536 mapKey!35536 mapValue!35536))))

(assert (= (and start!83628 res!652922) b!975764))

(assert (= (and b!975764 res!652916) b!975767))

(assert (= (and b!975767 res!652921) b!975769))

(assert (= (and b!975769 res!652919) b!975765))

(assert (= (and b!975765 res!652918) b!975766))

(assert (= (and b!975766 res!652917) b!975768))

(assert (= (and b!975768 res!652920) b!975762))

(assert (= (and b!975761 condMapEmpty!35536) mapIsEmpty!35536))

(assert (= (and b!975761 (not condMapEmpty!35536)) mapNonEmpty!35536))

(get-info :version)

(assert (= (and mapNonEmpty!35536 ((_ is ValueCellFull!10694) mapValue!35536)) b!975760))

(assert (= (and b!975761 ((_ is ValueCellFull!10694) mapDefault!35536)) b!975763))

(assert (= start!83628 b!975761))

(declare-fun m!903551 () Bool)

(assert (=> b!975762 m!903551))

(declare-fun m!903553 () Bool)

(assert (=> b!975766 m!903553))

(assert (=> b!975766 m!903553))

(declare-fun m!903555 () Bool)

(assert (=> b!975766 m!903555))

(declare-fun m!903557 () Bool)

(assert (=> mapNonEmpty!35536 m!903557))

(declare-fun m!903559 () Bool)

(assert (=> b!975768 m!903559))

(assert (=> b!975768 m!903553))

(assert (=> b!975768 m!903559))

(assert (=> b!975768 m!903553))

(declare-fun m!903561 () Bool)

(assert (=> b!975768 m!903561))

(declare-fun m!903563 () Bool)

(assert (=> b!975767 m!903563))

(declare-fun m!903565 () Bool)

(assert (=> b!975769 m!903565))

(declare-fun m!903567 () Bool)

(assert (=> start!83628 m!903567))

(declare-fun m!903569 () Bool)

(assert (=> start!83628 m!903569))

(declare-fun m!903571 () Bool)

(assert (=> start!83628 m!903571))

(check-sat (not b!975766) (not b!975767) b_and!31059 (not b!975769) (not b!975762) tp_is_empty!22351 (not start!83628) (not b!975768) (not mapNonEmpty!35536) (not b_next!19447))
(check-sat b_and!31059 (not b_next!19447))
