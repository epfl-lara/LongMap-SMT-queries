; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43234 () Bool)

(assert start!43234)

(declare-fun b_free!12115 () Bool)

(declare-fun b_next!12115 () Bool)

(assert (=> start!43234 (= b_free!12115 (not b_next!12115))))

(declare-fun tp!42615 () Bool)

(declare-fun b_and!20841 () Bool)

(assert (=> start!43234 (= tp!42615 b_and!20841)))

(declare-fun b!478903 () Bool)

(declare-fun e!281704 () Bool)

(declare-fun tp_is_empty!13627 () Bool)

(assert (=> b!478903 (= e!281704 tp_is_empty!13627)))

(declare-fun mapNonEmpty!22138 () Bool)

(declare-fun mapRes!22138 () Bool)

(declare-fun tp!42616 () Bool)

(assert (=> mapNonEmpty!22138 (= mapRes!22138 (and tp!42616 e!281704))))

(declare-fun mapKey!22138 () (_ BitVec 32))

(declare-datatypes ((V!19241 0))(
  ( (V!19242 (val!6861 Int)) )
))
(declare-datatypes ((ValueCell!6452 0))(
  ( (ValueCellFull!6452 (v!9144 V!19241)) (EmptyCell!6452) )
))
(declare-fun mapValue!22138 () ValueCell!6452)

(declare-datatypes ((array!30921 0))(
  ( (array!30922 (arr!14867 (Array (_ BitVec 32) ValueCell!6452)) (size!15226 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30921)

(declare-fun mapRest!22138 () (Array (_ BitVec 32) ValueCell!6452))

(assert (=> mapNonEmpty!22138 (= (arr!14867 _values!1516) (store mapRest!22138 mapKey!22138 mapValue!22138))))

(declare-fun res!285708 () Bool)

(declare-fun e!281706 () Bool)

(assert (=> start!43234 (=> (not res!285708) (not e!281706))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43234 (= res!285708 (validMask!0 mask!2352))))

(assert (=> start!43234 e!281706))

(assert (=> start!43234 true))

(assert (=> start!43234 tp_is_empty!13627))

(declare-fun e!281705 () Bool)

(declare-fun array_inv!10816 (array!30921) Bool)

(assert (=> start!43234 (and (array_inv!10816 _values!1516) e!281705)))

(assert (=> start!43234 tp!42615))

(declare-datatypes ((array!30923 0))(
  ( (array!30924 (arr!14868 (Array (_ BitVec 32) (_ BitVec 64))) (size!15227 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30923)

(declare-fun array_inv!10817 (array!30923) Bool)

(assert (=> start!43234 (array_inv!10817 _keys!1874)))

(declare-fun b!478904 () Bool)

(declare-fun res!285709 () Bool)

(assert (=> b!478904 (=> (not res!285709) (not e!281706))))

(declare-datatypes ((List!9124 0))(
  ( (Nil!9121) (Cons!9120 (h!9976 (_ BitVec 64)) (t!15321 List!9124)) )
))
(declare-fun arrayNoDuplicates!0 (array!30923 (_ BitVec 32) List!9124) Bool)

(assert (=> b!478904 (= res!285709 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9121))))

(declare-fun b!478905 () Bool)

(declare-fun e!281703 () Bool)

(assert (=> b!478905 (= e!281705 (and e!281703 mapRes!22138))))

(declare-fun condMapEmpty!22138 () Bool)

(declare-fun mapDefault!22138 () ValueCell!6452)

(assert (=> b!478905 (= condMapEmpty!22138 (= (arr!14867 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6452)) mapDefault!22138)))))

(declare-fun mapIsEmpty!22138 () Bool)

(assert (=> mapIsEmpty!22138 mapRes!22138))

(declare-fun b!478906 () Bool)

(declare-fun res!285711 () Bool)

(assert (=> b!478906 (=> (not res!285711) (not e!281706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30923 (_ BitVec 32)) Bool)

(assert (=> b!478906 (= res!285711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478907 () Bool)

(declare-fun res!285710 () Bool)

(assert (=> b!478907 (=> (not res!285710) (not e!281706))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478907 (= res!285710 (and (= (size!15226 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15227 _keys!1874) (size!15226 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478908 () Bool)

(assert (=> b!478908 (= e!281706 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19241)

(declare-fun lt!217591 () Bool)

(declare-fun zeroValue!1458 () V!19241)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9064 0))(
  ( (tuple2!9065 (_1!4543 (_ BitVec 64)) (_2!4543 V!19241)) )
))
(declare-datatypes ((List!9125 0))(
  ( (Nil!9122) (Cons!9121 (h!9977 tuple2!9064) (t!15322 List!9125)) )
))
(declare-datatypes ((ListLongMap!7967 0))(
  ( (ListLongMap!7968 (toList!3999 List!9125)) )
))
(declare-fun contains!2574 (ListLongMap!7967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2252 (array!30923 array!30921 (_ BitVec 32) (_ BitVec 32) V!19241 V!19241 (_ BitVec 32) Int) ListLongMap!7967)

(assert (=> b!478908 (= lt!217591 (contains!2574 (getCurrentListMap!2252 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!478909 () Bool)

(assert (=> b!478909 (= e!281703 tp_is_empty!13627)))

(assert (= (and start!43234 res!285708) b!478907))

(assert (= (and b!478907 res!285710) b!478906))

(assert (= (and b!478906 res!285711) b!478904))

(assert (= (and b!478904 res!285709) b!478908))

(assert (= (and b!478905 condMapEmpty!22138) mapIsEmpty!22138))

(assert (= (and b!478905 (not condMapEmpty!22138)) mapNonEmpty!22138))

(get-info :version)

(assert (= (and mapNonEmpty!22138 ((_ is ValueCellFull!6452) mapValue!22138)) b!478903))

(assert (= (and b!478905 ((_ is ValueCellFull!6452) mapDefault!22138)) b!478909))

(assert (= start!43234 b!478905))

(declare-fun m!460449 () Bool)

(assert (=> b!478906 m!460449))

(declare-fun m!460451 () Bool)

(assert (=> b!478908 m!460451))

(assert (=> b!478908 m!460451))

(declare-fun m!460453 () Bool)

(assert (=> b!478908 m!460453))

(declare-fun m!460455 () Bool)

(assert (=> b!478904 m!460455))

(declare-fun m!460457 () Bool)

(assert (=> mapNonEmpty!22138 m!460457))

(declare-fun m!460459 () Bool)

(assert (=> start!43234 m!460459))

(declare-fun m!460461 () Bool)

(assert (=> start!43234 m!460461))

(declare-fun m!460463 () Bool)

(assert (=> start!43234 m!460463))

(check-sat (not start!43234) tp_is_empty!13627 (not b!478904) (not b!478908) (not b_next!12115) b_and!20841 (not b!478906) (not mapNonEmpty!22138))
(check-sat b_and!20841 (not b_next!12115))
