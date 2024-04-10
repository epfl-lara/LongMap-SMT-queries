; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82770 () Bool)

(assert start!82770)

(declare-fun b_free!18903 () Bool)

(declare-fun b_next!18903 () Bool)

(assert (=> start!82770 (= b_free!18903 (not b_next!18903))))

(declare-fun tp!65829 () Bool)

(declare-fun b_and!30391 () Bool)

(assert (=> start!82770 (= tp!65829 b_and!30391)))

(declare-fun b!965435 () Bool)

(declare-fun res!646235 () Bool)

(declare-fun e!544240 () Bool)

(assert (=> b!965435 (=> (not res!646235) (not e!544240))))

(declare-datatypes ((array!59495 0))(
  ( (array!59496 (arr!28616 (Array (_ BitVec 32) (_ BitVec 64))) (size!29095 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59495)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965435 (= res!646235 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29095 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29095 _keys!1686))))))

(declare-fun b!965436 () Bool)

(assert (=> b!965436 (= e!544240 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33923 0))(
  ( (V!33924 (val!10903 Int)) )
))
(declare-datatypes ((ValueCell!10371 0))(
  ( (ValueCellFull!10371 (v!13461 V!33923)) (EmptyCell!10371) )
))
(declare-datatypes ((array!59497 0))(
  ( (array!59498 (arr!28617 (Array (_ BitVec 32) ValueCell!10371)) (size!29096 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59497)

(declare-fun minValue!1342 () V!33923)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!431239 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33923)

(declare-datatypes ((tuple2!14022 0))(
  ( (tuple2!14023 (_1!7022 (_ BitVec 64)) (_2!7022 V!33923)) )
))
(declare-datatypes ((List!19865 0))(
  ( (Nil!19862) (Cons!19861 (h!21023 tuple2!14022) (t!28228 List!19865)) )
))
(declare-datatypes ((ListLongMap!12719 0))(
  ( (ListLongMap!12720 (toList!6375 List!19865)) )
))
(declare-fun contains!5478 (ListLongMap!12719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3608 (array!59495 array!59497 (_ BitVec 32) (_ BitVec 32) V!33923 V!33923 (_ BitVec 32) Int) ListLongMap!12719)

(assert (=> b!965436 (= lt!431239 (contains!5478 (getCurrentListMap!3608 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28616 _keys!1686) i!803)))))

(declare-fun b!965437 () Bool)

(declare-fun res!646237 () Bool)

(assert (=> b!965437 (=> (not res!646237) (not e!544240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59495 (_ BitVec 32)) Bool)

(assert (=> b!965437 (= res!646237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34552 () Bool)

(declare-fun mapRes!34552 () Bool)

(assert (=> mapIsEmpty!34552 mapRes!34552))

(declare-fun mapNonEmpty!34552 () Bool)

(declare-fun tp!65828 () Bool)

(declare-fun e!544241 () Bool)

(assert (=> mapNonEmpty!34552 (= mapRes!34552 (and tp!65828 e!544241))))

(declare-fun mapKey!34552 () (_ BitVec 32))

(declare-fun mapValue!34552 () ValueCell!10371)

(declare-fun mapRest!34552 () (Array (_ BitVec 32) ValueCell!10371))

(assert (=> mapNonEmpty!34552 (= (arr!28617 _values!1400) (store mapRest!34552 mapKey!34552 mapValue!34552))))

(declare-fun b!965438 () Bool)

(declare-fun e!544238 () Bool)

(declare-fun tp_is_empty!21705 () Bool)

(assert (=> b!965438 (= e!544238 tp_is_empty!21705)))

(declare-fun res!646236 () Bool)

(assert (=> start!82770 (=> (not res!646236) (not e!544240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82770 (= res!646236 (validMask!0 mask!2110))))

(assert (=> start!82770 e!544240))

(assert (=> start!82770 true))

(declare-fun e!544237 () Bool)

(declare-fun array_inv!22163 (array!59497) Bool)

(assert (=> start!82770 (and (array_inv!22163 _values!1400) e!544237)))

(declare-fun array_inv!22164 (array!59495) Bool)

(assert (=> start!82770 (array_inv!22164 _keys!1686)))

(assert (=> start!82770 tp!65829))

(assert (=> start!82770 tp_is_empty!21705))

(declare-fun b!965439 () Bool)

(declare-fun res!646238 () Bool)

(assert (=> b!965439 (=> (not res!646238) (not e!544240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965439 (= res!646238 (validKeyInArray!0 (select (arr!28616 _keys!1686) i!803)))))

(declare-fun b!965440 () Bool)

(assert (=> b!965440 (= e!544241 tp_is_empty!21705)))

(declare-fun b!965441 () Bool)

(declare-fun res!646240 () Bool)

(assert (=> b!965441 (=> (not res!646240) (not e!544240))))

(declare-datatypes ((List!19866 0))(
  ( (Nil!19863) (Cons!19862 (h!21024 (_ BitVec 64)) (t!28229 List!19866)) )
))
(declare-fun arrayNoDuplicates!0 (array!59495 (_ BitVec 32) List!19866) Bool)

(assert (=> b!965441 (= res!646240 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19863))))

(declare-fun b!965442 () Bool)

(assert (=> b!965442 (= e!544237 (and e!544238 mapRes!34552))))

(declare-fun condMapEmpty!34552 () Bool)

(declare-fun mapDefault!34552 () ValueCell!10371)

(assert (=> b!965442 (= condMapEmpty!34552 (= (arr!28617 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10371)) mapDefault!34552)))))

(declare-fun b!965443 () Bool)

(declare-fun res!646239 () Bool)

(assert (=> b!965443 (=> (not res!646239) (not e!544240))))

(assert (=> b!965443 (= res!646239 (and (= (size!29096 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29095 _keys!1686) (size!29096 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82770 res!646236) b!965443))

(assert (= (and b!965443 res!646239) b!965437))

(assert (= (and b!965437 res!646237) b!965441))

(assert (= (and b!965441 res!646240) b!965435))

(assert (= (and b!965435 res!646235) b!965439))

(assert (= (and b!965439 res!646238) b!965436))

(assert (= (and b!965442 condMapEmpty!34552) mapIsEmpty!34552))

(assert (= (and b!965442 (not condMapEmpty!34552)) mapNonEmpty!34552))

(get-info :version)

(assert (= (and mapNonEmpty!34552 ((_ is ValueCellFull!10371) mapValue!34552)) b!965440))

(assert (= (and b!965442 ((_ is ValueCellFull!10371) mapDefault!34552)) b!965438))

(assert (= start!82770 b!965442))

(declare-fun m!894509 () Bool)

(assert (=> b!965437 m!894509))

(declare-fun m!894511 () Bool)

(assert (=> mapNonEmpty!34552 m!894511))

(declare-fun m!894513 () Bool)

(assert (=> b!965441 m!894513))

(declare-fun m!894515 () Bool)

(assert (=> b!965436 m!894515))

(declare-fun m!894517 () Bool)

(assert (=> b!965436 m!894517))

(assert (=> b!965436 m!894515))

(assert (=> b!965436 m!894517))

(declare-fun m!894519 () Bool)

(assert (=> b!965436 m!894519))

(declare-fun m!894521 () Bool)

(assert (=> start!82770 m!894521))

(declare-fun m!894523 () Bool)

(assert (=> start!82770 m!894523))

(declare-fun m!894525 () Bool)

(assert (=> start!82770 m!894525))

(assert (=> b!965439 m!894517))

(assert (=> b!965439 m!894517))

(declare-fun m!894527 () Bool)

(assert (=> b!965439 m!894527))

(check-sat (not b!965436) (not b!965437) (not b_next!18903) tp_is_empty!21705 (not b!965439) b_and!30391 (not mapNonEmpty!34552) (not b!965441) (not start!82770))
(check-sat b_and!30391 (not b_next!18903))
