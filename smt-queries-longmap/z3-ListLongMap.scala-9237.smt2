; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110772 () Bool)

(assert start!110772)

(declare-fun b_free!29607 () Bool)

(declare-fun b_next!29607 () Bool)

(assert (=> start!110772 (= b_free!29607 (not b_next!29607))))

(declare-fun tp!104142 () Bool)

(declare-fun b_and!47815 () Bool)

(assert (=> start!110772 (= tp!104142 b_and!47815)))

(declare-fun b!1311071 () Bool)

(declare-fun res!870386 () Bool)

(declare-fun e!747916 () Bool)

(assert (=> b!1311071 (=> (not res!870386) (not e!747916))))

(declare-datatypes ((array!87662 0))(
  ( (array!87663 (arr!42311 (Array (_ BitVec 32) (_ BitVec 64))) (size!42861 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87662)

(declare-datatypes ((List!30005 0))(
  ( (Nil!30002) (Cons!30001 (h!31210 (_ BitVec 64)) (t!43611 List!30005)) )
))
(declare-fun arrayNoDuplicates!0 (array!87662 (_ BitVec 32) List!30005) Bool)

(assert (=> b!1311071 (= res!870386 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30002))))

(declare-fun mapNonEmpty!54634 () Bool)

(declare-fun mapRes!54634 () Bool)

(declare-fun tp!104143 () Bool)

(declare-fun e!747913 () Bool)

(assert (=> mapNonEmpty!54634 (= mapRes!54634 (and tp!104143 e!747913))))

(declare-datatypes ((V!52219 0))(
  ( (V!52220 (val!17743 Int)) )
))
(declare-datatypes ((ValueCell!16770 0))(
  ( (ValueCellFull!16770 (v!20370 V!52219)) (EmptyCell!16770) )
))
(declare-fun mapRest!54634 () (Array (_ BitVec 32) ValueCell!16770))

(declare-datatypes ((array!87664 0))(
  ( (array!87665 (arr!42312 (Array (_ BitVec 32) ValueCell!16770)) (size!42862 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87664)

(declare-fun mapKey!54634 () (_ BitVec 32))

(declare-fun mapValue!54634 () ValueCell!16770)

(assert (=> mapNonEmpty!54634 (= (arr!42312 _values!1354) (store mapRest!54634 mapKey!54634 mapValue!54634))))

(declare-fun b!1311073 () Bool)

(assert (=> b!1311073 (= e!747916 false)))

(declare-fun lt!585429 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52219)

(declare-fun zeroValue!1296 () V!52219)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22864 0))(
  ( (tuple2!22865 (_1!11443 (_ BitVec 64)) (_2!11443 V!52219)) )
))
(declare-datatypes ((List!30006 0))(
  ( (Nil!30003) (Cons!30002 (h!31211 tuple2!22864) (t!43612 List!30006)) )
))
(declare-datatypes ((ListLongMap!20521 0))(
  ( (ListLongMap!20522 (toList!10276 List!30006)) )
))
(declare-fun contains!8426 (ListLongMap!20521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5289 (array!87662 array!87664 (_ BitVec 32) (_ BitVec 32) V!52219 V!52219 (_ BitVec 32) Int) ListLongMap!20521)

(assert (=> b!1311073 (= lt!585429 (contains!8426 (getCurrentListMap!5289 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54634 () Bool)

(assert (=> mapIsEmpty!54634 mapRes!54634))

(declare-fun b!1311074 () Bool)

(declare-fun res!870385 () Bool)

(assert (=> b!1311074 (=> (not res!870385) (not e!747916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87662 (_ BitVec 32)) Bool)

(assert (=> b!1311074 (= res!870385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311075 () Bool)

(declare-fun res!870387 () Bool)

(assert (=> b!1311075 (=> (not res!870387) (not e!747916))))

(assert (=> b!1311075 (= res!870387 (and (= (size!42862 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42861 _keys!1628) (size!42862 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311076 () Bool)

(declare-fun res!870384 () Bool)

(assert (=> b!1311076 (=> (not res!870384) (not e!747916))))

(assert (=> b!1311076 (= res!870384 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42861 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311077 () Bool)

(declare-fun e!747915 () Bool)

(declare-fun e!747917 () Bool)

(assert (=> b!1311077 (= e!747915 (and e!747917 mapRes!54634))))

(declare-fun condMapEmpty!54634 () Bool)

(declare-fun mapDefault!54634 () ValueCell!16770)

(assert (=> b!1311077 (= condMapEmpty!54634 (= (arr!42312 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16770)) mapDefault!54634)))))

(declare-fun b!1311078 () Bool)

(declare-fun tp_is_empty!35337 () Bool)

(assert (=> b!1311078 (= e!747913 tp_is_empty!35337)))

(declare-fun b!1311072 () Bool)

(assert (=> b!1311072 (= e!747917 tp_is_empty!35337)))

(declare-fun res!870383 () Bool)

(assert (=> start!110772 (=> (not res!870383) (not e!747916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110772 (= res!870383 (validMask!0 mask!2040))))

(assert (=> start!110772 e!747916))

(assert (=> start!110772 tp!104142))

(declare-fun array_inv!31973 (array!87662) Bool)

(assert (=> start!110772 (array_inv!31973 _keys!1628)))

(assert (=> start!110772 true))

(assert (=> start!110772 tp_is_empty!35337))

(declare-fun array_inv!31974 (array!87664) Bool)

(assert (=> start!110772 (and (array_inv!31974 _values!1354) e!747915)))

(assert (= (and start!110772 res!870383) b!1311075))

(assert (= (and b!1311075 res!870387) b!1311074))

(assert (= (and b!1311074 res!870385) b!1311071))

(assert (= (and b!1311071 res!870386) b!1311076))

(assert (= (and b!1311076 res!870384) b!1311073))

(assert (= (and b!1311077 condMapEmpty!54634) mapIsEmpty!54634))

(assert (= (and b!1311077 (not condMapEmpty!54634)) mapNonEmpty!54634))

(get-info :version)

(assert (= (and mapNonEmpty!54634 ((_ is ValueCellFull!16770) mapValue!54634)) b!1311078))

(assert (= (and b!1311077 ((_ is ValueCellFull!16770) mapDefault!54634)) b!1311072))

(assert (= start!110772 b!1311077))

(declare-fun m!1200661 () Bool)

(assert (=> mapNonEmpty!54634 m!1200661))

(declare-fun m!1200663 () Bool)

(assert (=> b!1311073 m!1200663))

(assert (=> b!1311073 m!1200663))

(declare-fun m!1200665 () Bool)

(assert (=> b!1311073 m!1200665))

(declare-fun m!1200667 () Bool)

(assert (=> b!1311074 m!1200667))

(declare-fun m!1200669 () Bool)

(assert (=> b!1311071 m!1200669))

(declare-fun m!1200671 () Bool)

(assert (=> start!110772 m!1200671))

(declare-fun m!1200673 () Bool)

(assert (=> start!110772 m!1200673))

(declare-fun m!1200675 () Bool)

(assert (=> start!110772 m!1200675))

(check-sat (not b!1311074) (not b_next!29607) (not start!110772) (not b!1311071) tp_is_empty!35337 (not b!1311073) (not mapNonEmpty!54634) b_and!47815)
(check-sat b_and!47815 (not b_next!29607))
