; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83388 () Bool)

(assert start!83388)

(declare-fun b_free!19399 () Bool)

(declare-fun b_next!19399 () Bool)

(assert (=> start!83388 (= b_free!19399 (not b_next!19399))))

(declare-fun tp!67476 () Bool)

(declare-fun b_and!30975 () Bool)

(assert (=> start!83388 (= tp!67476 b_and!30975)))

(declare-fun b!973835 () Bool)

(declare-fun res!651928 () Bool)

(declare-fun e!548896 () Bool)

(assert (=> b!973835 (=> (not res!651928) (not e!548896))))

(declare-datatypes ((array!60562 0))(
  ( (array!60563 (arr!29145 (Array (_ BitVec 32) (_ BitVec 64))) (size!29626 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60562)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973835 (= res!651928 (validKeyInArray!0 (select (arr!29145 _keys!1717) i!822)))))

(declare-fun b!973836 () Bool)

(declare-fun res!651927 () Bool)

(assert (=> b!973836 (=> (not res!651927) (not e!548896))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60562 (_ BitVec 32)) Bool)

(assert (=> b!973836 (= res!651927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973837 () Bool)

(declare-fun e!548898 () Bool)

(declare-fun tp_is_empty!22297 () Bool)

(assert (=> b!973837 (= e!548898 tp_is_empty!22297)))

(declare-fun b!973838 () Bool)

(declare-fun res!651923 () Bool)

(assert (=> b!973838 (=> (not res!651923) (not e!548896))))

(declare-datatypes ((V!34713 0))(
  ( (V!34714 (val!11199 Int)) )
))
(declare-datatypes ((ValueCell!10667 0))(
  ( (ValueCellFull!10667 (v!13757 V!34713)) (EmptyCell!10667) )
))
(declare-datatypes ((array!60564 0))(
  ( (array!60565 (arr!29146 (Array (_ BitVec 32) ValueCell!10667)) (size!29627 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60564)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973838 (= res!651923 (and (= (size!29627 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29626 _keys!1717) (size!29627 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973839 () Bool)

(declare-fun e!548895 () Bool)

(assert (=> b!973839 (= e!548895 tp_is_empty!22297)))

(declare-fun b!973840 () Bool)

(declare-fun res!651922 () Bool)

(assert (=> b!973840 (=> (not res!651922) (not e!548896))))

(declare-datatypes ((List!20266 0))(
  ( (Nil!20263) (Cons!20262 (h!21424 (_ BitVec 64)) (t!28734 List!20266)) )
))
(declare-fun arrayNoDuplicates!0 (array!60562 (_ BitVec 32) List!20266) Bool)

(assert (=> b!973840 (= res!651922 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20263))))

(declare-fun b!973841 () Bool)

(declare-fun res!651924 () Bool)

(assert (=> b!973841 (=> (not res!651924) (not e!548896))))

(declare-fun zeroValue!1367 () V!34713)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34713)

(declare-datatypes ((tuple2!14460 0))(
  ( (tuple2!14461 (_1!7241 (_ BitVec 64)) (_2!7241 V!34713)) )
))
(declare-datatypes ((List!20267 0))(
  ( (Nil!20264) (Cons!20263 (h!21425 tuple2!14460) (t!28735 List!20267)) )
))
(declare-datatypes ((ListLongMap!13147 0))(
  ( (ListLongMap!13148 (toList!6589 List!20267)) )
))
(declare-fun contains!5628 (ListLongMap!13147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3751 (array!60562 array!60564 (_ BitVec 32) (_ BitVec 32) V!34713 V!34713 (_ BitVec 32) Int) ListLongMap!13147)

(assert (=> b!973841 (= res!651924 (contains!5628 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29145 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35455 () Bool)

(declare-fun mapRes!35455 () Bool)

(assert (=> mapIsEmpty!35455 mapRes!35455))

(declare-fun mapNonEmpty!35455 () Bool)

(declare-fun tp!67477 () Bool)

(assert (=> mapNonEmpty!35455 (= mapRes!35455 (and tp!67477 e!548895))))

(declare-fun mapRest!35455 () (Array (_ BitVec 32) ValueCell!10667))

(declare-fun mapValue!35455 () ValueCell!10667)

(declare-fun mapKey!35455 () (_ BitVec 32))

(assert (=> mapNonEmpty!35455 (= (arr!29146 _values!1425) (store mapRest!35455 mapKey!35455 mapValue!35455))))

(declare-fun res!651925 () Bool)

(assert (=> start!83388 (=> (not res!651925) (not e!548896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83388 (= res!651925 (validMask!0 mask!2147))))

(assert (=> start!83388 e!548896))

(assert (=> start!83388 true))

(declare-fun e!548894 () Bool)

(declare-fun array_inv!22595 (array!60564) Bool)

(assert (=> start!83388 (and (array_inv!22595 _values!1425) e!548894)))

(assert (=> start!83388 tp_is_empty!22297))

(assert (=> start!83388 tp!67476))

(declare-fun array_inv!22596 (array!60562) Bool)

(assert (=> start!83388 (array_inv!22596 _keys!1717)))

(declare-fun b!973842 () Bool)

(assert (=> b!973842 (= e!548896 false)))

(declare-fun lt!432498 () ListLongMap!13147)

(assert (=> b!973842 (= lt!432498 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973843 () Bool)

(declare-fun res!651926 () Bool)

(assert (=> b!973843 (=> (not res!651926) (not e!548896))))

(assert (=> b!973843 (= res!651926 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29626 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29626 _keys!1717))))))

(declare-fun b!973844 () Bool)

(assert (=> b!973844 (= e!548894 (and e!548898 mapRes!35455))))

(declare-fun condMapEmpty!35455 () Bool)

(declare-fun mapDefault!35455 () ValueCell!10667)

(assert (=> b!973844 (= condMapEmpty!35455 (= (arr!29146 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10667)) mapDefault!35455)))))

(assert (= (and start!83388 res!651925) b!973838))

(assert (= (and b!973838 res!651923) b!973836))

(assert (= (and b!973836 res!651927) b!973840))

(assert (= (and b!973840 res!651922) b!973843))

(assert (= (and b!973843 res!651926) b!973835))

(assert (= (and b!973835 res!651928) b!973841))

(assert (= (and b!973841 res!651924) b!973842))

(assert (= (and b!973844 condMapEmpty!35455) mapIsEmpty!35455))

(assert (= (and b!973844 (not condMapEmpty!35455)) mapNonEmpty!35455))

(get-info :version)

(assert (= (and mapNonEmpty!35455 ((_ is ValueCellFull!10667) mapValue!35455)) b!973839))

(assert (= (and b!973844 ((_ is ValueCellFull!10667) mapDefault!35455)) b!973837))

(assert (= start!83388 b!973844))

(declare-fun m!900935 () Bool)

(assert (=> b!973835 m!900935))

(assert (=> b!973835 m!900935))

(declare-fun m!900937 () Bool)

(assert (=> b!973835 m!900937))

(declare-fun m!900939 () Bool)

(assert (=> b!973841 m!900939))

(assert (=> b!973841 m!900935))

(assert (=> b!973841 m!900939))

(assert (=> b!973841 m!900935))

(declare-fun m!900941 () Bool)

(assert (=> b!973841 m!900941))

(declare-fun m!900943 () Bool)

(assert (=> start!83388 m!900943))

(declare-fun m!900945 () Bool)

(assert (=> start!83388 m!900945))

(declare-fun m!900947 () Bool)

(assert (=> start!83388 m!900947))

(declare-fun m!900949 () Bool)

(assert (=> mapNonEmpty!35455 m!900949))

(declare-fun m!900951 () Bool)

(assert (=> b!973842 m!900951))

(declare-fun m!900953 () Bool)

(assert (=> b!973836 m!900953))

(declare-fun m!900955 () Bool)

(assert (=> b!973840 m!900955))

(check-sat (not b_next!19399) b_and!30975 (not b!973840) (not start!83388) (not b!973841) (not b!973842) tp_is_empty!22297 (not mapNonEmpty!35455) (not b!973836) (not b!973835))
(check-sat b_and!30975 (not b_next!19399))
