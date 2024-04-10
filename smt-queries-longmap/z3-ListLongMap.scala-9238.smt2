; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110778 () Bool)

(assert start!110778)

(declare-fun b_free!29613 () Bool)

(declare-fun b_next!29613 () Bool)

(assert (=> start!110778 (= b_free!29613 (not b_next!29613))))

(declare-fun tp!104161 () Bool)

(declare-fun b_and!47821 () Bool)

(assert (=> start!110778 (= tp!104161 b_and!47821)))

(declare-fun b!1311143 () Bool)

(declare-fun res!870431 () Bool)

(declare-fun e!747962 () Bool)

(assert (=> b!1311143 (=> (not res!870431) (not e!747962))))

(declare-datatypes ((array!87674 0))(
  ( (array!87675 (arr!42317 (Array (_ BitVec 32) (_ BitVec 64))) (size!42867 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87674)

(declare-datatypes ((List!30009 0))(
  ( (Nil!30006) (Cons!30005 (h!31214 (_ BitVec 64)) (t!43615 List!30009)) )
))
(declare-fun arrayNoDuplicates!0 (array!87674 (_ BitVec 32) List!30009) Bool)

(assert (=> b!1311143 (= res!870431 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30006))))

(declare-fun b!1311144 () Bool)

(declare-fun res!870432 () Bool)

(assert (=> b!1311144 (=> (not res!870432) (not e!747962))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87674 (_ BitVec 32)) Bool)

(assert (=> b!1311144 (= res!870432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54643 () Bool)

(declare-fun mapRes!54643 () Bool)

(assert (=> mapIsEmpty!54643 mapRes!54643))

(declare-fun b!1311145 () Bool)

(declare-fun res!870428 () Bool)

(assert (=> b!1311145 (=> (not res!870428) (not e!747962))))

(declare-datatypes ((V!52227 0))(
  ( (V!52228 (val!17746 Int)) )
))
(declare-datatypes ((ValueCell!16773 0))(
  ( (ValueCellFull!16773 (v!20373 V!52227)) (EmptyCell!16773) )
))
(declare-datatypes ((array!87676 0))(
  ( (array!87677 (arr!42318 (Array (_ BitVec 32) ValueCell!16773)) (size!42868 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87676)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311145 (= res!870428 (and (= (size!42868 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42867 _keys!1628) (size!42868 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311146 () Bool)

(declare-fun res!870430 () Bool)

(assert (=> b!1311146 (=> (not res!870430) (not e!747962))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311146 (= res!870430 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42867 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311147 () Bool)

(declare-fun e!747960 () Bool)

(declare-fun tp_is_empty!35343 () Bool)

(assert (=> b!1311147 (= e!747960 tp_is_empty!35343)))

(declare-fun b!1311148 () Bool)

(assert (=> b!1311148 (= e!747962 false)))

(declare-fun lt!585438 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52227)

(declare-fun zeroValue!1296 () V!52227)

(declare-datatypes ((tuple2!22868 0))(
  ( (tuple2!22869 (_1!11445 (_ BitVec 64)) (_2!11445 V!52227)) )
))
(declare-datatypes ((List!30010 0))(
  ( (Nil!30007) (Cons!30006 (h!31215 tuple2!22868) (t!43616 List!30010)) )
))
(declare-datatypes ((ListLongMap!20525 0))(
  ( (ListLongMap!20526 (toList!10278 List!30010)) )
))
(declare-fun contains!8428 (ListLongMap!20525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5291 (array!87674 array!87676 (_ BitVec 32) (_ BitVec 32) V!52227 V!52227 (_ BitVec 32) Int) ListLongMap!20525)

(assert (=> b!1311148 (= lt!585438 (contains!8428 (getCurrentListMap!5291 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!870429 () Bool)

(assert (=> start!110778 (=> (not res!870429) (not e!747962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110778 (= res!870429 (validMask!0 mask!2040))))

(assert (=> start!110778 e!747962))

(assert (=> start!110778 tp!104161))

(declare-fun array_inv!31975 (array!87674) Bool)

(assert (=> start!110778 (array_inv!31975 _keys!1628)))

(assert (=> start!110778 true))

(assert (=> start!110778 tp_is_empty!35343))

(declare-fun e!747959 () Bool)

(declare-fun array_inv!31976 (array!87676) Bool)

(assert (=> start!110778 (and (array_inv!31976 _values!1354) e!747959)))

(declare-fun mapNonEmpty!54643 () Bool)

(declare-fun tp!104160 () Bool)

(assert (=> mapNonEmpty!54643 (= mapRes!54643 (and tp!104160 e!747960))))

(declare-fun mapValue!54643 () ValueCell!16773)

(declare-fun mapRest!54643 () (Array (_ BitVec 32) ValueCell!16773))

(declare-fun mapKey!54643 () (_ BitVec 32))

(assert (=> mapNonEmpty!54643 (= (arr!42318 _values!1354) (store mapRest!54643 mapKey!54643 mapValue!54643))))

(declare-fun b!1311149 () Bool)

(declare-fun e!747961 () Bool)

(assert (=> b!1311149 (= e!747959 (and e!747961 mapRes!54643))))

(declare-fun condMapEmpty!54643 () Bool)

(declare-fun mapDefault!54643 () ValueCell!16773)

(assert (=> b!1311149 (= condMapEmpty!54643 (= (arr!42318 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16773)) mapDefault!54643)))))

(declare-fun b!1311150 () Bool)

(assert (=> b!1311150 (= e!747961 tp_is_empty!35343)))

(assert (= (and start!110778 res!870429) b!1311145))

(assert (= (and b!1311145 res!870428) b!1311144))

(assert (= (and b!1311144 res!870432) b!1311143))

(assert (= (and b!1311143 res!870431) b!1311146))

(assert (= (and b!1311146 res!870430) b!1311148))

(assert (= (and b!1311149 condMapEmpty!54643) mapIsEmpty!54643))

(assert (= (and b!1311149 (not condMapEmpty!54643)) mapNonEmpty!54643))

(get-info :version)

(assert (= (and mapNonEmpty!54643 ((_ is ValueCellFull!16773) mapValue!54643)) b!1311147))

(assert (= (and b!1311149 ((_ is ValueCellFull!16773) mapDefault!54643)) b!1311150))

(assert (= start!110778 b!1311149))

(declare-fun m!1200709 () Bool)

(assert (=> b!1311144 m!1200709))

(declare-fun m!1200711 () Bool)

(assert (=> b!1311143 m!1200711))

(declare-fun m!1200713 () Bool)

(assert (=> mapNonEmpty!54643 m!1200713))

(declare-fun m!1200715 () Bool)

(assert (=> start!110778 m!1200715))

(declare-fun m!1200717 () Bool)

(assert (=> start!110778 m!1200717))

(declare-fun m!1200719 () Bool)

(assert (=> start!110778 m!1200719))

(declare-fun m!1200721 () Bool)

(assert (=> b!1311148 m!1200721))

(assert (=> b!1311148 m!1200721))

(declare-fun m!1200723 () Bool)

(assert (=> b!1311148 m!1200723))

(check-sat (not mapNonEmpty!54643) (not b!1311148) (not start!110778) tp_is_empty!35343 (not b_next!29613) (not b!1311144) b_and!47821 (not b!1311143))
(check-sat b_and!47821 (not b_next!29613))
