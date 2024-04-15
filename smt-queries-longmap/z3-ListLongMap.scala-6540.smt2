; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83106 () Bool)

(assert start!83106)

(declare-fun b_free!19117 () Bool)

(declare-fun b_next!19117 () Bool)

(assert (=> start!83106 (= b_free!19117 (not b_next!19117))))

(declare-fun tp!66630 () Bool)

(declare-fun b_and!30579 () Bool)

(assert (=> start!83106 (= tp!66630 b_and!30579)))

(declare-fun b!969435 () Bool)

(declare-fun res!648905 () Bool)

(declare-fun e!546530 () Bool)

(assert (=> b!969435 (=> (not res!648905) (not e!546530))))

(declare-datatypes ((array!60026 0))(
  ( (array!60027 (arr!28877 (Array (_ BitVec 32) (_ BitVec 64))) (size!29358 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60026)

(declare-datatypes ((List!20069 0))(
  ( (Nil!20066) (Cons!20065 (h!21227 (_ BitVec 64)) (t!28423 List!20069)) )
))
(declare-fun arrayNoDuplicates!0 (array!60026 (_ BitVec 32) List!20069) Bool)

(assert (=> b!969435 (= res!648905 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20066))))

(declare-fun mapNonEmpty!35032 () Bool)

(declare-fun mapRes!35032 () Bool)

(declare-fun tp!66631 () Bool)

(declare-fun e!546527 () Bool)

(assert (=> mapNonEmpty!35032 (= mapRes!35032 (and tp!66631 e!546527))))

(declare-datatypes ((V!34337 0))(
  ( (V!34338 (val!11058 Int)) )
))
(declare-datatypes ((ValueCell!10526 0))(
  ( (ValueCellFull!10526 (v!13616 V!34337)) (EmptyCell!10526) )
))
(declare-datatypes ((array!60028 0))(
  ( (array!60029 (arr!28878 (Array (_ BitVec 32) ValueCell!10526)) (size!29359 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60028)

(declare-fun mapValue!35032 () ValueCell!10526)

(declare-fun mapRest!35032 () (Array (_ BitVec 32) ValueCell!10526))

(declare-fun mapKey!35032 () (_ BitVec 32))

(assert (=> mapNonEmpty!35032 (= (arr!28878 _values!1425) (store mapRest!35032 mapKey!35032 mapValue!35032))))

(declare-fun res!648909 () Bool)

(assert (=> start!83106 (=> (not res!648909) (not e!546530))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83106 (= res!648909 (validMask!0 mask!2147))))

(assert (=> start!83106 e!546530))

(assert (=> start!83106 true))

(declare-fun e!546529 () Bool)

(declare-fun array_inv!22415 (array!60028) Bool)

(assert (=> start!83106 (and (array_inv!22415 _values!1425) e!546529)))

(declare-fun tp_is_empty!22015 () Bool)

(assert (=> start!83106 tp_is_empty!22015))

(assert (=> start!83106 tp!66630))

(declare-fun array_inv!22416 (array!60026) Bool)

(assert (=> start!83106 (array_inv!22416 _keys!1717)))

(declare-fun b!969436 () Bool)

(declare-fun res!648906 () Bool)

(assert (=> b!969436 (=> (not res!648906) (not e!546530))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969436 (= res!648906 (validKeyInArray!0 (select (arr!28877 _keys!1717) i!822)))))

(declare-fun b!969437 () Bool)

(assert (=> b!969437 (= e!546527 tp_is_empty!22015)))

(declare-fun mapIsEmpty!35032 () Bool)

(assert (=> mapIsEmpty!35032 mapRes!35032))

(declare-fun b!969438 () Bool)

(declare-fun e!546528 () Bool)

(assert (=> b!969438 (= e!546529 (and e!546528 mapRes!35032))))

(declare-fun condMapEmpty!35032 () Bool)

(declare-fun mapDefault!35032 () ValueCell!10526)

(assert (=> b!969438 (= condMapEmpty!35032 (= (arr!28878 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10526)) mapDefault!35032)))))

(declare-fun b!969439 () Bool)

(assert (=> b!969439 (= e!546528 tp_is_empty!22015)))

(declare-fun b!969440 () Bool)

(assert (=> b!969440 (= e!546530 false)))

(declare-fun zeroValue!1367 () V!34337)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34337)

(declare-fun lt!431427 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14250 0))(
  ( (tuple2!14251 (_1!7136 (_ BitVec 64)) (_2!7136 V!34337)) )
))
(declare-datatypes ((List!20070 0))(
  ( (Nil!20067) (Cons!20066 (h!21228 tuple2!14250) (t!28424 List!20070)) )
))
(declare-datatypes ((ListLongMap!12937 0))(
  ( (ListLongMap!12938 (toList!6484 List!20070)) )
))
(declare-fun contains!5532 (ListLongMap!12937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3646 (array!60026 array!60028 (_ BitVec 32) (_ BitVec 32) V!34337 V!34337 (_ BitVec 32) Int) ListLongMap!12937)

(assert (=> b!969440 (= lt!431427 (contains!5532 (getCurrentListMap!3646 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28877 _keys!1717) i!822)))))

(declare-fun b!969441 () Bool)

(declare-fun res!648907 () Bool)

(assert (=> b!969441 (=> (not res!648907) (not e!546530))))

(assert (=> b!969441 (= res!648907 (and (= (size!29359 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29358 _keys!1717) (size!29359 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969442 () Bool)

(declare-fun res!648910 () Bool)

(assert (=> b!969442 (=> (not res!648910) (not e!546530))))

(assert (=> b!969442 (= res!648910 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29358 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29358 _keys!1717))))))

(declare-fun b!969443 () Bool)

(declare-fun res!648908 () Bool)

(assert (=> b!969443 (=> (not res!648908) (not e!546530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60026 (_ BitVec 32)) Bool)

(assert (=> b!969443 (= res!648908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83106 res!648909) b!969441))

(assert (= (and b!969441 res!648907) b!969443))

(assert (= (and b!969443 res!648908) b!969435))

(assert (= (and b!969435 res!648905) b!969442))

(assert (= (and b!969442 res!648910) b!969436))

(assert (= (and b!969436 res!648906) b!969440))

(assert (= (and b!969438 condMapEmpty!35032) mapIsEmpty!35032))

(assert (= (and b!969438 (not condMapEmpty!35032)) mapNonEmpty!35032))

(get-info :version)

(assert (= (and mapNonEmpty!35032 ((_ is ValueCellFull!10526) mapValue!35032)) b!969437))

(assert (= (and b!969438 ((_ is ValueCellFull!10526) mapDefault!35032)) b!969439))

(assert (= start!83106 b!969438))

(declare-fun m!896849 () Bool)

(assert (=> mapNonEmpty!35032 m!896849))

(declare-fun m!896851 () Bool)

(assert (=> b!969443 m!896851))

(declare-fun m!896853 () Bool)

(assert (=> b!969436 m!896853))

(assert (=> b!969436 m!896853))

(declare-fun m!896855 () Bool)

(assert (=> b!969436 m!896855))

(declare-fun m!896857 () Bool)

(assert (=> start!83106 m!896857))

(declare-fun m!896859 () Bool)

(assert (=> start!83106 m!896859))

(declare-fun m!896861 () Bool)

(assert (=> start!83106 m!896861))

(declare-fun m!896863 () Bool)

(assert (=> b!969440 m!896863))

(assert (=> b!969440 m!896853))

(assert (=> b!969440 m!896863))

(assert (=> b!969440 m!896853))

(declare-fun m!896865 () Bool)

(assert (=> b!969440 m!896865))

(declare-fun m!896867 () Bool)

(assert (=> b!969435 m!896867))

(check-sat (not start!83106) b_and!30579 (not b!969436) (not mapNonEmpty!35032) (not b!969435) (not b!969443) (not b!969440) (not b_next!19117) tp_is_empty!22015)
(check-sat b_and!30579 (not b_next!19117))
