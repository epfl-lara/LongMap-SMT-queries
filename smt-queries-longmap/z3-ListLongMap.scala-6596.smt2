; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83442 () Bool)

(assert start!83442)

(declare-fun b_free!19447 () Bool)

(declare-fun b_next!19447 () Bool)

(assert (=> start!83442 (= b_free!19447 (not b_next!19447))))

(declare-fun tp!67629 () Bool)

(declare-fun b_and!31023 () Bool)

(assert (=> start!83442 (= tp!67629 b_and!31023)))

(declare-fun b!974618 () Bool)

(declare-fun res!652466 () Bool)

(declare-fun e!549312 () Bool)

(assert (=> b!974618 (=> (not res!652466) (not e!549312))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34785 0))(
  ( (V!34786 (val!11226 Int)) )
))
(declare-datatypes ((ValueCell!10694 0))(
  ( (ValueCellFull!10694 (v!13784 V!34785)) (EmptyCell!10694) )
))
(declare-datatypes ((array!60664 0))(
  ( (array!60665 (arr!29196 (Array (_ BitVec 32) ValueCell!10694)) (size!29677 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60664)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60666 0))(
  ( (array!60667 (arr!29197 (Array (_ BitVec 32) (_ BitVec 64))) (size!29678 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60666)

(assert (=> b!974618 (= res!652466 (and (= (size!29677 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29678 _keys!1717) (size!29677 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35536 () Bool)

(declare-fun mapRes!35536 () Bool)

(assert (=> mapIsEmpty!35536 mapRes!35536))

(declare-fun b!974619 () Bool)

(declare-fun e!549308 () Bool)

(declare-fun tp_is_empty!22351 () Bool)

(assert (=> b!974619 (= e!549308 tp_is_empty!22351)))

(declare-fun b!974620 () Bool)

(declare-fun res!652467 () Bool)

(assert (=> b!974620 (=> (not res!652467) (not e!549312))))

(declare-fun zeroValue!1367 () V!34785)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34785)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14496 0))(
  ( (tuple2!14497 (_1!7259 (_ BitVec 64)) (_2!7259 V!34785)) )
))
(declare-datatypes ((List!20304 0))(
  ( (Nil!20301) (Cons!20300 (h!21462 tuple2!14496) (t!28772 List!20304)) )
))
(declare-datatypes ((ListLongMap!13183 0))(
  ( (ListLongMap!13184 (toList!6607 List!20304)) )
))
(declare-fun contains!5642 (ListLongMap!13183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3769 (array!60666 array!60664 (_ BitVec 32) (_ BitVec 32) V!34785 V!34785 (_ BitVec 32) Int) ListLongMap!13183)

(assert (=> b!974620 (= res!652467 (contains!5642 (getCurrentListMap!3769 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29197 _keys!1717) i!822)))))

(declare-fun b!974621 () Bool)

(declare-fun res!652463 () Bool)

(assert (=> b!974621 (=> (not res!652463) (not e!549312))))

(declare-datatypes ((List!20305 0))(
  ( (Nil!20302) (Cons!20301 (h!21463 (_ BitVec 64)) (t!28773 List!20305)) )
))
(declare-fun arrayNoDuplicates!0 (array!60666 (_ BitVec 32) List!20305) Bool)

(assert (=> b!974621 (= res!652463 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20302))))

(declare-fun b!974622 () Bool)

(assert (=> b!974622 (= e!549312 false)))

(declare-fun lt!432570 () ListLongMap!13183)

(assert (=> b!974622 (= lt!432570 (getCurrentListMap!3769 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974623 () Bool)

(declare-fun e!549311 () Bool)

(assert (=> b!974623 (= e!549311 (and e!549308 mapRes!35536))))

(declare-fun condMapEmpty!35536 () Bool)

(declare-fun mapDefault!35536 () ValueCell!10694)

(assert (=> b!974623 (= condMapEmpty!35536 (= (arr!29196 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10694)) mapDefault!35536)))))

(declare-fun b!974624 () Bool)

(declare-fun res!652468 () Bool)

(assert (=> b!974624 (=> (not res!652468) (not e!549312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60666 (_ BitVec 32)) Bool)

(assert (=> b!974624 (= res!652468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974626 () Bool)

(declare-fun res!652465 () Bool)

(assert (=> b!974626 (=> (not res!652465) (not e!549312))))

(assert (=> b!974626 (= res!652465 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29678 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29678 _keys!1717))))))

(declare-fun b!974627 () Bool)

(declare-fun res!652462 () Bool)

(assert (=> b!974627 (=> (not res!652462) (not e!549312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974627 (= res!652462 (validKeyInArray!0 (select (arr!29197 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35536 () Bool)

(declare-fun tp!67630 () Bool)

(declare-fun e!549310 () Bool)

(assert (=> mapNonEmpty!35536 (= mapRes!35536 (and tp!67630 e!549310))))

(declare-fun mapKey!35536 () (_ BitVec 32))

(declare-fun mapValue!35536 () ValueCell!10694)

(declare-fun mapRest!35536 () (Array (_ BitVec 32) ValueCell!10694))

(assert (=> mapNonEmpty!35536 (= (arr!29196 _values!1425) (store mapRest!35536 mapKey!35536 mapValue!35536))))

(declare-fun b!974625 () Bool)

(assert (=> b!974625 (= e!549310 tp_is_empty!22351)))

(declare-fun res!652464 () Bool)

(assert (=> start!83442 (=> (not res!652464) (not e!549312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83442 (= res!652464 (validMask!0 mask!2147))))

(assert (=> start!83442 e!549312))

(assert (=> start!83442 true))

(declare-fun array_inv!22633 (array!60664) Bool)

(assert (=> start!83442 (and (array_inv!22633 _values!1425) e!549311)))

(assert (=> start!83442 tp_is_empty!22351))

(assert (=> start!83442 tp!67629))

(declare-fun array_inv!22634 (array!60666) Bool)

(assert (=> start!83442 (array_inv!22634 _keys!1717)))

(assert (= (and start!83442 res!652464) b!974618))

(assert (= (and b!974618 res!652466) b!974624))

(assert (= (and b!974624 res!652468) b!974621))

(assert (= (and b!974621 res!652463) b!974626))

(assert (= (and b!974626 res!652465) b!974627))

(assert (= (and b!974627 res!652462) b!974620))

(assert (= (and b!974620 res!652467) b!974622))

(assert (= (and b!974623 condMapEmpty!35536) mapIsEmpty!35536))

(assert (= (and b!974623 (not condMapEmpty!35536)) mapNonEmpty!35536))

(get-info :version)

(assert (= (and mapNonEmpty!35536 ((_ is ValueCellFull!10694) mapValue!35536)) b!974625))

(assert (= (and b!974623 ((_ is ValueCellFull!10694) mapDefault!35536)) b!974619))

(assert (= start!83442 b!974623))

(declare-fun m!901499 () Bool)

(assert (=> b!974620 m!901499))

(declare-fun m!901501 () Bool)

(assert (=> b!974620 m!901501))

(assert (=> b!974620 m!901499))

(assert (=> b!974620 m!901501))

(declare-fun m!901503 () Bool)

(assert (=> b!974620 m!901503))

(declare-fun m!901505 () Bool)

(assert (=> mapNonEmpty!35536 m!901505))

(assert (=> b!974627 m!901501))

(assert (=> b!974627 m!901501))

(declare-fun m!901507 () Bool)

(assert (=> b!974627 m!901507))

(declare-fun m!901509 () Bool)

(assert (=> start!83442 m!901509))

(declare-fun m!901511 () Bool)

(assert (=> start!83442 m!901511))

(declare-fun m!901513 () Bool)

(assert (=> start!83442 m!901513))

(declare-fun m!901515 () Bool)

(assert (=> b!974624 m!901515))

(declare-fun m!901517 () Bool)

(assert (=> b!974621 m!901517))

(declare-fun m!901519 () Bool)

(assert (=> b!974622 m!901519))

(check-sat (not b!974621) b_and!31023 (not b!974620) (not b_next!19447) (not b!974627) tp_is_empty!22351 (not start!83442) (not b!974624) (not mapNonEmpty!35536) (not b!974622))
(check-sat b_and!31023 (not b_next!19447))
