; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20176 () Bool)

(assert start!20176)

(declare-fun b_free!4831 () Bool)

(declare-fun b_next!4831 () Bool)

(assert (=> start!20176 (= b_free!4831 (not b_next!4831))))

(declare-fun tp!17524 () Bool)

(declare-fun b_and!11551 () Bool)

(assert (=> start!20176 (= tp!17524 b_and!11551)))

(declare-fun b!197867 () Bool)

(declare-fun res!93699 () Bool)

(declare-fun e!130110 () Bool)

(assert (=> b!197867 (=> (not res!93699) (not e!130110))))

(declare-datatypes ((array!8603 0))(
  ( (array!8604 (arr!4051 (Array (_ BitVec 32) (_ BitVec 64))) (size!4377 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8603)

(declare-datatypes ((V!5897 0))(
  ( (V!5898 (val!2388 Int)) )
))
(declare-datatypes ((ValueCell!2000 0))(
  ( (ValueCellFull!2000 (v!4352 V!5897)) (EmptyCell!2000) )
))
(declare-datatypes ((array!8605 0))(
  ( (array!8606 (arr!4052 (Array (_ BitVec 32) ValueCell!2000)) (size!4378 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8605)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197867 (= res!93699 (and (= (size!4378 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4377 _keys!825) (size!4378 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!93695 () Bool)

(assert (=> start!20176 (=> (not res!93695) (not e!130110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20176 (= res!93695 (validMask!0 mask!1149))))

(assert (=> start!20176 e!130110))

(declare-fun e!130113 () Bool)

(declare-fun array_inv!2637 (array!8605) Bool)

(assert (=> start!20176 (and (array_inv!2637 _values!649) e!130113)))

(assert (=> start!20176 true))

(declare-fun tp_is_empty!4687 () Bool)

(assert (=> start!20176 tp_is_empty!4687))

(declare-fun array_inv!2638 (array!8603) Bool)

(assert (=> start!20176 (array_inv!2638 _keys!825)))

(assert (=> start!20176 tp!17524))

(declare-fun b!197868 () Bool)

(declare-fun res!93700 () Bool)

(assert (=> b!197868 (=> (not res!93700) (not e!130110))))

(declare-datatypes ((List!2521 0))(
  ( (Nil!2518) (Cons!2517 (h!3159 (_ BitVec 64)) (t!7443 List!2521)) )
))
(declare-fun arrayNoDuplicates!0 (array!8603 (_ BitVec 32) List!2521) Bool)

(assert (=> b!197868 (= res!93700 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2518))))

(declare-fun b!197869 () Bool)

(declare-fun e!130112 () Bool)

(assert (=> b!197869 (= e!130112 tp_is_empty!4687)))

(declare-fun b!197870 () Bool)

(assert (=> b!197870 (= e!130110 false)))

(declare-datatypes ((tuple2!3588 0))(
  ( (tuple2!3589 (_1!1805 (_ BitVec 64)) (_2!1805 V!5897)) )
))
(declare-datatypes ((List!2522 0))(
  ( (Nil!2519) (Cons!2518 (h!3160 tuple2!3588) (t!7444 List!2522)) )
))
(declare-datatypes ((ListLongMap!2491 0))(
  ( (ListLongMap!2492 (toList!1261 List!2522)) )
))
(declare-fun lt!97651 () ListLongMap!2491)

(declare-fun v!520 () V!5897)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5897)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5897)

(declare-fun getCurrentListMapNoExtraKeys!241 (array!8603 array!8605 (_ BitVec 32) (_ BitVec 32) V!5897 V!5897 (_ BitVec 32) Int) ListLongMap!2491)

(assert (=> b!197870 (= lt!97651 (getCurrentListMapNoExtraKeys!241 _keys!825 (array!8606 (store (arr!4052 _values!649) i!601 (ValueCellFull!2000 v!520)) (size!4378 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97652 () ListLongMap!2491)

(assert (=> b!197870 (= lt!97652 (getCurrentListMapNoExtraKeys!241 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197871 () Bool)

(declare-fun res!93697 () Bool)

(assert (=> b!197871 (=> (not res!93697) (not e!130110))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197871 (= res!93697 (validKeyInArray!0 k0!843))))

(declare-fun b!197872 () Bool)

(declare-fun mapRes!8099 () Bool)

(assert (=> b!197872 (= e!130113 (and e!130112 mapRes!8099))))

(declare-fun condMapEmpty!8099 () Bool)

(declare-fun mapDefault!8099 () ValueCell!2000)

(assert (=> b!197872 (= condMapEmpty!8099 (= (arr!4052 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2000)) mapDefault!8099)))))

(declare-fun b!197873 () Bool)

(declare-fun res!93701 () Bool)

(assert (=> b!197873 (=> (not res!93701) (not e!130110))))

(assert (=> b!197873 (= res!93701 (= (select (arr!4051 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8099 () Bool)

(assert (=> mapIsEmpty!8099 mapRes!8099))

(declare-fun mapNonEmpty!8099 () Bool)

(declare-fun tp!17525 () Bool)

(declare-fun e!130111 () Bool)

(assert (=> mapNonEmpty!8099 (= mapRes!8099 (and tp!17525 e!130111))))

(declare-fun mapValue!8099 () ValueCell!2000)

(declare-fun mapRest!8099 () (Array (_ BitVec 32) ValueCell!2000))

(declare-fun mapKey!8099 () (_ BitVec 32))

(assert (=> mapNonEmpty!8099 (= (arr!4052 _values!649) (store mapRest!8099 mapKey!8099 mapValue!8099))))

(declare-fun b!197874 () Bool)

(assert (=> b!197874 (= e!130111 tp_is_empty!4687)))

(declare-fun b!197875 () Bool)

(declare-fun res!93698 () Bool)

(assert (=> b!197875 (=> (not res!93698) (not e!130110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8603 (_ BitVec 32)) Bool)

(assert (=> b!197875 (= res!93698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197876 () Bool)

(declare-fun res!93696 () Bool)

(assert (=> b!197876 (=> (not res!93696) (not e!130110))))

(assert (=> b!197876 (= res!93696 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4377 _keys!825))))))

(assert (= (and start!20176 res!93695) b!197867))

(assert (= (and b!197867 res!93699) b!197875))

(assert (= (and b!197875 res!93698) b!197868))

(assert (= (and b!197868 res!93700) b!197876))

(assert (= (and b!197876 res!93696) b!197871))

(assert (= (and b!197871 res!93697) b!197873))

(assert (= (and b!197873 res!93701) b!197870))

(assert (= (and b!197872 condMapEmpty!8099) mapIsEmpty!8099))

(assert (= (and b!197872 (not condMapEmpty!8099)) mapNonEmpty!8099))

(get-info :version)

(assert (= (and mapNonEmpty!8099 ((_ is ValueCellFull!2000) mapValue!8099)) b!197874))

(assert (= (and b!197872 ((_ is ValueCellFull!2000) mapDefault!8099)) b!197869))

(assert (= start!20176 b!197872))

(declare-fun m!224121 () Bool)

(assert (=> b!197868 m!224121))

(declare-fun m!224123 () Bool)

(assert (=> b!197870 m!224123))

(declare-fun m!224125 () Bool)

(assert (=> b!197870 m!224125))

(declare-fun m!224127 () Bool)

(assert (=> b!197870 m!224127))

(declare-fun m!224129 () Bool)

(assert (=> b!197875 m!224129))

(declare-fun m!224131 () Bool)

(assert (=> b!197871 m!224131))

(declare-fun m!224133 () Bool)

(assert (=> mapNonEmpty!8099 m!224133))

(declare-fun m!224135 () Bool)

(assert (=> start!20176 m!224135))

(declare-fun m!224137 () Bool)

(assert (=> start!20176 m!224137))

(declare-fun m!224139 () Bool)

(assert (=> start!20176 m!224139))

(declare-fun m!224141 () Bool)

(assert (=> b!197873 m!224141))

(check-sat (not mapNonEmpty!8099) (not start!20176) (not b_next!4831) b_and!11551 (not b!197875) (not b!197871) (not b!197870) (not b!197868) tp_is_empty!4687)
(check-sat b_and!11551 (not b_next!4831))
