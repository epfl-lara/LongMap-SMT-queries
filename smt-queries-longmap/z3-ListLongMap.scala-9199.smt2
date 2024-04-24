; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110766 () Bool)

(assert start!110766)

(declare-fun b_free!29377 () Bool)

(declare-fun b_next!29377 () Bool)

(assert (=> start!110766 (= b_free!29377 (not b_next!29377))))

(declare-fun tp!103452 () Bool)

(declare-fun b_and!47587 () Bool)

(assert (=> start!110766 (= tp!103452 b_and!47587)))

(declare-fun mapIsEmpty!54289 () Bool)

(declare-fun mapRes!54289 () Bool)

(assert (=> mapIsEmpty!54289 mapRes!54289))

(declare-fun b!1308962 () Bool)

(declare-fun res!868530 () Bool)

(declare-fun e!747033 () Bool)

(assert (=> b!1308962 (=> (not res!868530) (not e!747033))))

(declare-datatypes ((array!87273 0))(
  ( (array!87274 (arr!42112 (Array (_ BitVec 32) (_ BitVec 64))) (size!42663 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87273)

(declare-datatypes ((List!29890 0))(
  ( (Nil!29887) (Cons!29886 (h!31104 (_ BitVec 64)) (t!43488 List!29890)) )
))
(declare-fun arrayNoDuplicates!0 (array!87273 (_ BitVec 32) List!29890) Bool)

(assert (=> b!1308962 (= res!868530 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29887))))

(declare-fun b!1308963 () Bool)

(declare-fun e!747035 () Bool)

(declare-fun e!747032 () Bool)

(assert (=> b!1308963 (= e!747035 (and e!747032 mapRes!54289))))

(declare-fun condMapEmpty!54289 () Bool)

(declare-datatypes ((V!51913 0))(
  ( (V!51914 (val!17628 Int)) )
))
(declare-datatypes ((ValueCell!16655 0))(
  ( (ValueCellFull!16655 (v!20250 V!51913)) (EmptyCell!16655) )
))
(declare-datatypes ((array!87275 0))(
  ( (array!87276 (arr!42113 (Array (_ BitVec 32) ValueCell!16655)) (size!42664 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87275)

(declare-fun mapDefault!54289 () ValueCell!16655)

(assert (=> b!1308963 (= condMapEmpty!54289 (= (arr!42113 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16655)) mapDefault!54289)))))

(declare-fun mapNonEmpty!54289 () Bool)

(declare-fun tp!103453 () Bool)

(declare-fun e!747031 () Bool)

(assert (=> mapNonEmpty!54289 (= mapRes!54289 (and tp!103453 e!747031))))

(declare-fun mapKey!54289 () (_ BitVec 32))

(declare-fun mapRest!54289 () (Array (_ BitVec 32) ValueCell!16655))

(declare-fun mapValue!54289 () ValueCell!16655)

(assert (=> mapNonEmpty!54289 (= (arr!42113 _values!1354) (store mapRest!54289 mapKey!54289 mapValue!54289))))

(declare-fun b!1308964 () Bool)

(declare-fun res!868529 () Bool)

(assert (=> b!1308964 (=> (not res!868529) (not e!747033))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308964 (= res!868529 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42663 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308965 () Bool)

(declare-fun res!868531 () Bool)

(assert (=> b!1308965 (=> (not res!868531) (not e!747033))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308965 (= res!868531 (and (= (size!42664 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42663 _keys!1628) (size!42664 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308966 () Bool)

(declare-fun res!868528 () Bool)

(assert (=> b!1308966 (=> (not res!868528) (not e!747033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87273 (_ BitVec 32)) Bool)

(assert (=> b!1308966 (= res!868528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308968 () Bool)

(assert (=> b!1308968 (= e!747033 false)))

(declare-fun lt!585560 () Bool)

(declare-fun minValue!1296 () V!51913)

(declare-fun zeroValue!1296 () V!51913)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22724 0))(
  ( (tuple2!22725 (_1!11373 (_ BitVec 64)) (_2!11373 V!51913)) )
))
(declare-datatypes ((List!29891 0))(
  ( (Nil!29888) (Cons!29887 (h!31105 tuple2!22724) (t!43489 List!29891)) )
))
(declare-datatypes ((ListLongMap!20389 0))(
  ( (ListLongMap!20390 (toList!10210 List!29891)) )
))
(declare-fun contains!8372 (ListLongMap!20389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5214 (array!87273 array!87275 (_ BitVec 32) (_ BitVec 32) V!51913 V!51913 (_ BitVec 32) Int) ListLongMap!20389)

(assert (=> b!1308968 (= lt!585560 (contains!8372 (getCurrentListMap!5214 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308969 () Bool)

(declare-fun tp_is_empty!35107 () Bool)

(assert (=> b!1308969 (= e!747031 tp_is_empty!35107)))

(declare-fun b!1308967 () Bool)

(assert (=> b!1308967 (= e!747032 tp_is_empty!35107)))

(declare-fun res!868532 () Bool)

(assert (=> start!110766 (=> (not res!868532) (not e!747033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110766 (= res!868532 (validMask!0 mask!2040))))

(assert (=> start!110766 e!747033))

(assert (=> start!110766 tp!103452))

(declare-fun array_inv!32087 (array!87273) Bool)

(assert (=> start!110766 (array_inv!32087 _keys!1628)))

(assert (=> start!110766 true))

(assert (=> start!110766 tp_is_empty!35107))

(declare-fun array_inv!32088 (array!87275) Bool)

(assert (=> start!110766 (and (array_inv!32088 _values!1354) e!747035)))

(assert (= (and start!110766 res!868532) b!1308965))

(assert (= (and b!1308965 res!868531) b!1308966))

(assert (= (and b!1308966 res!868528) b!1308962))

(assert (= (and b!1308962 res!868530) b!1308964))

(assert (= (and b!1308964 res!868529) b!1308968))

(assert (= (and b!1308963 condMapEmpty!54289) mapIsEmpty!54289))

(assert (= (and b!1308963 (not condMapEmpty!54289)) mapNonEmpty!54289))

(get-info :version)

(assert (= (and mapNonEmpty!54289 ((_ is ValueCellFull!16655) mapValue!54289)) b!1308969))

(assert (= (and b!1308963 ((_ is ValueCellFull!16655) mapDefault!54289)) b!1308967))

(assert (= start!110766 b!1308963))

(declare-fun m!1199879 () Bool)

(assert (=> b!1308968 m!1199879))

(assert (=> b!1308968 m!1199879))

(declare-fun m!1199881 () Bool)

(assert (=> b!1308968 m!1199881))

(declare-fun m!1199883 () Bool)

(assert (=> mapNonEmpty!54289 m!1199883))

(declare-fun m!1199885 () Bool)

(assert (=> b!1308966 m!1199885))

(declare-fun m!1199887 () Bool)

(assert (=> b!1308962 m!1199887))

(declare-fun m!1199889 () Bool)

(assert (=> start!110766 m!1199889))

(declare-fun m!1199891 () Bool)

(assert (=> start!110766 m!1199891))

(declare-fun m!1199893 () Bool)

(assert (=> start!110766 m!1199893))

(check-sat (not b!1308966) (not mapNonEmpty!54289) (not b!1308968) (not b!1308962) tp_is_empty!35107 (not start!110766) b_and!47587 (not b_next!29377))
(check-sat b_and!47587 (not b_next!29377))
