; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83396 () Bool)

(assert start!83396)

(declare-fun b_free!19389 () Bool)

(declare-fun b_next!19389 () Bool)

(assert (=> start!83396 (= b_free!19389 (not b_next!19389))))

(declare-fun tp!67446 () Bool)

(declare-fun b_and!30991 () Bool)

(assert (=> start!83396 (= tp!67446 b_and!30991)))

(declare-fun b!973924 () Bool)

(declare-fun res!651929 () Bool)

(declare-fun e!548967 () Bool)

(assert (=> b!973924 (=> (not res!651929) (not e!548967))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34699 0))(
  ( (V!34700 (val!11194 Int)) )
))
(declare-datatypes ((ValueCell!10662 0))(
  ( (ValueCellFull!10662 (v!13753 V!34699)) (EmptyCell!10662) )
))
(declare-datatypes ((array!60615 0))(
  ( (array!60616 (arr!29171 (Array (_ BitVec 32) ValueCell!10662)) (size!29650 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60615)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60617 0))(
  ( (array!60618 (arr!29172 (Array (_ BitVec 32) (_ BitVec 64))) (size!29651 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60617)

(assert (=> b!973924 (= res!651929 (and (= (size!29650 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29651 _keys!1717) (size!29650 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!651931 () Bool)

(assert (=> start!83396 (=> (not res!651931) (not e!548967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83396 (= res!651931 (validMask!0 mask!2147))))

(assert (=> start!83396 e!548967))

(assert (=> start!83396 true))

(declare-fun e!548969 () Bool)

(declare-fun array_inv!22563 (array!60615) Bool)

(assert (=> start!83396 (and (array_inv!22563 _values!1425) e!548969)))

(declare-fun tp_is_empty!22287 () Bool)

(assert (=> start!83396 tp_is_empty!22287))

(assert (=> start!83396 tp!67446))

(declare-fun array_inv!22564 (array!60617) Bool)

(assert (=> start!83396 (array_inv!22564 _keys!1717)))

(declare-fun mapNonEmpty!35440 () Bool)

(declare-fun mapRes!35440 () Bool)

(declare-fun tp!67445 () Bool)

(declare-fun e!548970 () Bool)

(assert (=> mapNonEmpty!35440 (= mapRes!35440 (and tp!67445 e!548970))))

(declare-fun mapValue!35440 () ValueCell!10662)

(declare-fun mapKey!35440 () (_ BitVec 32))

(declare-fun mapRest!35440 () (Array (_ BitVec 32) ValueCell!10662))

(assert (=> mapNonEmpty!35440 (= (arr!29171 _values!1425) (store mapRest!35440 mapKey!35440 mapValue!35440))))

(declare-fun b!973925 () Bool)

(declare-fun res!651927 () Bool)

(assert (=> b!973925 (=> (not res!651927) (not e!548967))))

(declare-datatypes ((List!20239 0))(
  ( (Nil!20236) (Cons!20235 (h!21397 (_ BitVec 64)) (t!28716 List!20239)) )
))
(declare-fun arrayNoDuplicates!0 (array!60617 (_ BitVec 32) List!20239) Bool)

(assert (=> b!973925 (= res!651927 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20236))))

(declare-fun mapIsEmpty!35440 () Bool)

(assert (=> mapIsEmpty!35440 mapRes!35440))

(declare-fun b!973926 () Bool)

(declare-fun e!548971 () Bool)

(assert (=> b!973926 (= e!548971 tp_is_empty!22287)))

(declare-fun b!973927 () Bool)

(assert (=> b!973927 (= e!548969 (and e!548971 mapRes!35440))))

(declare-fun condMapEmpty!35440 () Bool)

(declare-fun mapDefault!35440 () ValueCell!10662)

(assert (=> b!973927 (= condMapEmpty!35440 (= (arr!29171 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10662)) mapDefault!35440)))))

(declare-fun b!973928 () Bool)

(declare-fun res!651933 () Bool)

(assert (=> b!973928 (=> (not res!651933) (not e!548967))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973928 (= res!651933 (validKeyInArray!0 (select (arr!29172 _keys!1717) i!822)))))

(declare-fun b!973929 () Bool)

(declare-fun res!651928 () Bool)

(assert (=> b!973929 (=> (not res!651928) (not e!548967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60617 (_ BitVec 32)) Bool)

(assert (=> b!973929 (= res!651928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973930 () Bool)

(declare-fun res!651930 () Bool)

(assert (=> b!973930 (=> (not res!651930) (not e!548967))))

(declare-fun zeroValue!1367 () V!34699)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34699)

(declare-datatypes ((tuple2!14380 0))(
  ( (tuple2!14381 (_1!7201 (_ BitVec 64)) (_2!7201 V!34699)) )
))
(declare-datatypes ((List!20240 0))(
  ( (Nil!20237) (Cons!20236 (h!21398 tuple2!14380) (t!28717 List!20240)) )
))
(declare-datatypes ((ListLongMap!13077 0))(
  ( (ListLongMap!13078 (toList!6554 List!20240)) )
))
(declare-fun contains!5644 (ListLongMap!13077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3787 (array!60617 array!60615 (_ BitVec 32) (_ BitVec 32) V!34699 V!34699 (_ BitVec 32) Int) ListLongMap!13077)

(assert (=> b!973930 (= res!651930 (contains!5644 (getCurrentListMap!3787 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29172 _keys!1717) i!822)))))

(declare-fun b!973931 () Bool)

(declare-fun res!651932 () Bool)

(assert (=> b!973931 (=> (not res!651932) (not e!548967))))

(assert (=> b!973931 (= res!651932 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29651 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29651 _keys!1717))))))

(declare-fun b!973932 () Bool)

(assert (=> b!973932 (= e!548967 false)))

(declare-fun lt!432719 () ListLongMap!13077)

(assert (=> b!973932 (= lt!432719 (getCurrentListMap!3787 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973933 () Bool)

(assert (=> b!973933 (= e!548970 tp_is_empty!22287)))

(assert (= (and start!83396 res!651931) b!973924))

(assert (= (and b!973924 res!651929) b!973929))

(assert (= (and b!973929 res!651928) b!973925))

(assert (= (and b!973925 res!651927) b!973931))

(assert (= (and b!973931 res!651932) b!973928))

(assert (= (and b!973928 res!651933) b!973930))

(assert (= (and b!973930 res!651930) b!973932))

(assert (= (and b!973927 condMapEmpty!35440) mapIsEmpty!35440))

(assert (= (and b!973927 (not condMapEmpty!35440)) mapNonEmpty!35440))

(get-info :version)

(assert (= (and mapNonEmpty!35440 ((_ is ValueCellFull!10662) mapValue!35440)) b!973933))

(assert (= (and b!973927 ((_ is ValueCellFull!10662) mapDefault!35440)) b!973926))

(assert (= start!83396 b!973927))

(declare-fun m!901583 () Bool)

(assert (=> b!973932 m!901583))

(declare-fun m!901585 () Bool)

(assert (=> start!83396 m!901585))

(declare-fun m!901587 () Bool)

(assert (=> start!83396 m!901587))

(declare-fun m!901589 () Bool)

(assert (=> start!83396 m!901589))

(declare-fun m!901591 () Bool)

(assert (=> b!973925 m!901591))

(declare-fun m!901593 () Bool)

(assert (=> b!973928 m!901593))

(assert (=> b!973928 m!901593))

(declare-fun m!901595 () Bool)

(assert (=> b!973928 m!901595))

(declare-fun m!901597 () Bool)

(assert (=> b!973930 m!901597))

(assert (=> b!973930 m!901593))

(assert (=> b!973930 m!901597))

(assert (=> b!973930 m!901593))

(declare-fun m!901599 () Bool)

(assert (=> b!973930 m!901599))

(declare-fun m!901601 () Bool)

(assert (=> b!973929 m!901601))

(declare-fun m!901603 () Bool)

(assert (=> mapNonEmpty!35440 m!901603))

(check-sat (not b!973928) (not b!973932) (not b!973930) b_and!30991 (not start!83396) (not mapNonEmpty!35440) (not b_next!19389) tp_is_empty!22287 (not b!973925) (not b!973929))
(check-sat b_and!30991 (not b_next!19389))
