; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35568 () Bool)

(assert start!35568)

(declare-fun b!356515 () Bool)

(declare-fun e!218381 () Bool)

(assert (=> b!356515 (= e!218381 (not true))))

(declare-datatypes ((array!19627 0))(
  ( (array!19628 (arr!9307 (Array (_ BitVec 32) (_ BitVec 64))) (size!9660 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19627)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356515 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11691 0))(
  ( (V!11692 (val!4062 Int)) )
))
(declare-fun minValue!1150 () V!11691)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3674 0))(
  ( (ValueCellFull!3674 (v!6250 V!11691)) (EmptyCell!3674) )
))
(declare-datatypes ((array!19629 0))(
  ( (array!19630 (arr!9308 (Array (_ BitVec 32) ValueCell!3674)) (size!9661 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19629)

(declare-datatypes ((Unit!10972 0))(
  ( (Unit!10973) )
))
(declare-fun lt!165733 () Unit!10972)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11691)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!13 (array!19627 array!19629 (_ BitVec 32) (_ BitVec 32) V!11691 V!11691 (_ BitVec 64) (_ BitVec 32)) Unit!10972)

(assert (=> b!356515 (= lt!165733 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!13 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13560 () Bool)

(declare-fun mapRes!13560 () Bool)

(assert (=> mapIsEmpty!13560 mapRes!13560))

(declare-fun b!356516 () Bool)

(declare-fun res!197912 () Bool)

(assert (=> b!356516 (=> (not res!197912) (not e!218381))))

(assert (=> b!356516 (= res!197912 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356517 () Bool)

(declare-fun res!197913 () Bool)

(assert (=> b!356517 (=> (not res!197913) (not e!218381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356517 (= res!197913 (validKeyInArray!0 k0!1077))))

(declare-fun b!356518 () Bool)

(declare-fun res!197914 () Bool)

(assert (=> b!356518 (=> (not res!197914) (not e!218381))))

(declare-datatypes ((List!5344 0))(
  ( (Nil!5341) (Cons!5340 (h!6196 (_ BitVec 64)) (t!10485 List!5344)) )
))
(declare-fun arrayNoDuplicates!0 (array!19627 (_ BitVec 32) List!5344) Bool)

(assert (=> b!356518 (= res!197914 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5341))))

(declare-fun b!356519 () Bool)

(declare-fun e!218384 () Bool)

(declare-fun e!218385 () Bool)

(assert (=> b!356519 (= e!218384 (and e!218385 mapRes!13560))))

(declare-fun condMapEmpty!13560 () Bool)

(declare-fun mapDefault!13560 () ValueCell!3674)

(assert (=> b!356519 (= condMapEmpty!13560 (= (arr!9308 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3674)) mapDefault!13560)))))

(declare-fun b!356520 () Bool)

(declare-fun res!197909 () Bool)

(assert (=> b!356520 (=> (not res!197909) (not e!218381))))

(assert (=> b!356520 (= res!197909 (and (= (size!9661 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9660 _keys!1456) (size!9661 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356521 () Bool)

(declare-fun res!197911 () Bool)

(assert (=> b!356521 (=> (not res!197911) (not e!218381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19627 (_ BitVec 32)) Bool)

(assert (=> b!356521 (= res!197911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356522 () Bool)

(declare-fun res!197908 () Bool)

(assert (=> b!356522 (=> (not res!197908) (not e!218381))))

(assert (=> b!356522 (= res!197908 (not (= (select (arr!9307 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356523 () Bool)

(declare-fun tp_is_empty!8035 () Bool)

(assert (=> b!356523 (= e!218385 tp_is_empty!8035)))

(declare-fun b!356524 () Bool)

(declare-fun res!197910 () Bool)

(assert (=> b!356524 (=> (not res!197910) (not e!218381))))

(assert (=> b!356524 (= res!197910 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9660 _keys!1456))))))

(declare-fun res!197907 () Bool)

(assert (=> start!35568 (=> (not res!197907) (not e!218381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35568 (= res!197907 (validMask!0 mask!1842))))

(assert (=> start!35568 e!218381))

(assert (=> start!35568 tp_is_empty!8035))

(assert (=> start!35568 true))

(declare-fun array_inv!6876 (array!19627) Bool)

(assert (=> start!35568 (array_inv!6876 _keys!1456)))

(declare-fun array_inv!6877 (array!19629) Bool)

(assert (=> start!35568 (and (array_inv!6877 _values!1208) e!218384)))

(declare-fun mapNonEmpty!13560 () Bool)

(declare-fun tp!27537 () Bool)

(declare-fun e!218383 () Bool)

(assert (=> mapNonEmpty!13560 (= mapRes!13560 (and tp!27537 e!218383))))

(declare-fun mapValue!13560 () ValueCell!3674)

(declare-fun mapKey!13560 () (_ BitVec 32))

(declare-fun mapRest!13560 () (Array (_ BitVec 32) ValueCell!3674))

(assert (=> mapNonEmpty!13560 (= (arr!9308 _values!1208) (store mapRest!13560 mapKey!13560 mapValue!13560))))

(declare-fun b!356525 () Bool)

(assert (=> b!356525 (= e!218383 tp_is_empty!8035)))

(assert (= (and start!35568 res!197907) b!356520))

(assert (= (and b!356520 res!197909) b!356521))

(assert (= (and b!356521 res!197911) b!356518))

(assert (= (and b!356518 res!197914) b!356517))

(assert (= (and b!356517 res!197913) b!356524))

(assert (= (and b!356524 res!197910) b!356516))

(assert (= (and b!356516 res!197912) b!356522))

(assert (= (and b!356522 res!197908) b!356515))

(assert (= (and b!356519 condMapEmpty!13560) mapIsEmpty!13560))

(assert (= (and b!356519 (not condMapEmpty!13560)) mapNonEmpty!13560))

(get-info :version)

(assert (= (and mapNonEmpty!13560 ((_ is ValueCellFull!3674) mapValue!13560)) b!356525))

(assert (= (and b!356519 ((_ is ValueCellFull!3674) mapDefault!13560)) b!356523))

(assert (= start!35568 b!356519))

(declare-fun m!354339 () Bool)

(assert (=> b!356516 m!354339))

(declare-fun m!354341 () Bool)

(assert (=> b!356518 m!354341))

(declare-fun m!354343 () Bool)

(assert (=> mapNonEmpty!13560 m!354343))

(declare-fun m!354345 () Bool)

(assert (=> b!356515 m!354345))

(declare-fun m!354347 () Bool)

(assert (=> b!356515 m!354347))

(declare-fun m!354349 () Bool)

(assert (=> b!356522 m!354349))

(declare-fun m!354351 () Bool)

(assert (=> b!356521 m!354351))

(declare-fun m!354353 () Bool)

(assert (=> start!35568 m!354353))

(declare-fun m!354355 () Bool)

(assert (=> start!35568 m!354355))

(declare-fun m!354357 () Bool)

(assert (=> start!35568 m!354357))

(declare-fun m!354359 () Bool)

(assert (=> b!356517 m!354359))

(check-sat (not b!356521) (not b!356517) tp_is_empty!8035 (not start!35568) (not b!356515) (not b!356516) (not b!356518) (not mapNonEmpty!13560))
(check-sat)
