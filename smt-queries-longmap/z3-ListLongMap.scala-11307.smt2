; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131748 () Bool)

(assert start!131748)

(declare-fun res!1058618 () Bool)

(declare-fun e!858339 () Bool)

(assert (=> start!131748 (=> (not res!1058618) (not e!858339))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131748 (= res!1058618 (validMask!0 mask!926))))

(assert (=> start!131748 e!858339))

(assert (=> start!131748 true))

(declare-datatypes ((V!58759 0))(
  ( (V!58760 (val!18946 Int)) )
))
(declare-datatypes ((ValueCell!17958 0))(
  ( (ValueCellFull!17958 (v!21747 V!58759)) (EmptyCell!17958) )
))
(declare-datatypes ((array!102702 0))(
  ( (array!102703 (arr!49553 (Array (_ BitVec 32) ValueCell!17958)) (size!50103 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102702)

(declare-fun e!858337 () Bool)

(declare-fun array_inv!38559 (array!102702) Bool)

(assert (=> start!131748 (and (array_inv!38559 _values!470) e!858337)))

(declare-datatypes ((array!102704 0))(
  ( (array!102705 (arr!49554 (Array (_ BitVec 32) (_ BitVec 64))) (size!50104 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102704)

(declare-fun array_inv!38560 (array!102704) Bool)

(assert (=> start!131748 (array_inv!38560 _keys!618)))

(declare-fun b!1542687 () Bool)

(declare-fun e!858338 () Bool)

(declare-fun mapRes!58309 () Bool)

(assert (=> b!1542687 (= e!858337 (and e!858338 mapRes!58309))))

(declare-fun condMapEmpty!58309 () Bool)

(declare-fun mapDefault!58309 () ValueCell!17958)

(assert (=> b!1542687 (= condMapEmpty!58309 (= (arr!49553 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17958)) mapDefault!58309)))))

(declare-fun b!1542688 () Bool)

(declare-fun e!858336 () Bool)

(declare-fun tp_is_empty!37737 () Bool)

(assert (=> b!1542688 (= e!858336 tp_is_empty!37737)))

(declare-fun b!1542689 () Bool)

(declare-fun res!1058619 () Bool)

(assert (=> b!1542689 (=> (not res!1058619) (not e!858339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102704 (_ BitVec 32)) Bool)

(assert (=> b!1542689 (= res!1058619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542690 () Bool)

(declare-fun res!1058617 () Bool)

(assert (=> b!1542690 (=> (not res!1058617) (not e!858339))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542690 (= res!1058617 (and (= (size!50103 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50104 _keys!618) (size!50103 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542691 () Bool)

(assert (=> b!1542691 (= e!858339 false)))

(declare-fun lt!665858 () Bool)

(declare-datatypes ((List!35887 0))(
  ( (Nil!35884) (Cons!35883 (h!37328 (_ BitVec 64)) (t!50581 List!35887)) )
))
(declare-fun arrayNoDuplicates!0 (array!102704 (_ BitVec 32) List!35887) Bool)

(assert (=> b!1542691 (= lt!665858 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35884))))

(declare-fun b!1542692 () Bool)

(assert (=> b!1542692 (= e!858338 tp_is_empty!37737)))

(declare-fun mapNonEmpty!58309 () Bool)

(declare-fun tp!110836 () Bool)

(assert (=> mapNonEmpty!58309 (= mapRes!58309 (and tp!110836 e!858336))))

(declare-fun mapValue!58309 () ValueCell!17958)

(declare-fun mapKey!58309 () (_ BitVec 32))

(declare-fun mapRest!58309 () (Array (_ BitVec 32) ValueCell!17958))

(assert (=> mapNonEmpty!58309 (= (arr!49553 _values!470) (store mapRest!58309 mapKey!58309 mapValue!58309))))

(declare-fun mapIsEmpty!58309 () Bool)

(assert (=> mapIsEmpty!58309 mapRes!58309))

(assert (= (and start!131748 res!1058618) b!1542690))

(assert (= (and b!1542690 res!1058617) b!1542689))

(assert (= (and b!1542689 res!1058619) b!1542691))

(assert (= (and b!1542687 condMapEmpty!58309) mapIsEmpty!58309))

(assert (= (and b!1542687 (not condMapEmpty!58309)) mapNonEmpty!58309))

(get-info :version)

(assert (= (and mapNonEmpty!58309 ((_ is ValueCellFull!17958) mapValue!58309)) b!1542688))

(assert (= (and b!1542687 ((_ is ValueCellFull!17958) mapDefault!58309)) b!1542692))

(assert (= start!131748 b!1542687))

(declare-fun m!1424245 () Bool)

(assert (=> start!131748 m!1424245))

(declare-fun m!1424247 () Bool)

(assert (=> start!131748 m!1424247))

(declare-fun m!1424249 () Bool)

(assert (=> start!131748 m!1424249))

(declare-fun m!1424251 () Bool)

(assert (=> b!1542689 m!1424251))

(declare-fun m!1424253 () Bool)

(assert (=> b!1542691 m!1424253))

(declare-fun m!1424255 () Bool)

(assert (=> mapNonEmpty!58309 m!1424255))

(check-sat tp_is_empty!37737 (not start!131748) (not b!1542689) (not b!1542691) (not mapNonEmpty!58309))
(check-sat)
