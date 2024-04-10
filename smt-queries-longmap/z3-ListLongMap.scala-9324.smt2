; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111382 () Bool)

(assert start!111382)

(declare-fun b_free!30039 () Bool)

(declare-fun b_next!30039 () Bool)

(assert (=> start!111382 (= b_free!30039 (not b_next!30039))))

(declare-fun tp!105592 () Bool)

(declare-fun b_and!48259 () Bool)

(assert (=> start!111382 (= tp!105592 b_and!48259)))

(declare-fun b!1317988 () Bool)

(declare-fun res!874711 () Bool)

(declare-fun e!752131 () Bool)

(assert (=> b!1317988 (=> (not res!874711) (not e!752131))))

(declare-datatypes ((array!88670 0))(
  ( (array!88671 (arr!42809 (Array (_ BitVec 32) (_ BitVec 64))) (size!43359 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88670)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88670 (_ BitVec 32)) Bool)

(assert (=> b!1317988 (= res!874711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317989 () Bool)

(declare-fun e!752134 () Bool)

(declare-fun tp_is_empty!35859 () Bool)

(assert (=> b!1317989 (= e!752134 tp_is_empty!35859)))

(declare-fun b!1317990 () Bool)

(declare-fun res!874712 () Bool)

(assert (=> b!1317990 (=> (not res!874712) (not e!752131))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52915 0))(
  ( (V!52916 (val!18004 Int)) )
))
(declare-datatypes ((ValueCell!17031 0))(
  ( (ValueCellFull!17031 (v!20634 V!52915)) (EmptyCell!17031) )
))
(declare-datatypes ((array!88672 0))(
  ( (array!88673 (arr!42810 (Array (_ BitVec 32) ValueCell!17031)) (size!43360 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88672)

(assert (=> b!1317990 (= res!874712 (and (= (size!43360 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43359 _keys!1609) (size!43360 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317991 () Bool)

(declare-fun e!752132 () Bool)

(assert (=> b!1317991 (= e!752132 tp_is_empty!35859)))

(declare-fun mapNonEmpty!55436 () Bool)

(declare-fun mapRes!55436 () Bool)

(declare-fun tp!105593 () Bool)

(assert (=> mapNonEmpty!55436 (= mapRes!55436 (and tp!105593 e!752132))))

(declare-fun mapKey!55436 () (_ BitVec 32))

(declare-fun mapValue!55436 () ValueCell!17031)

(declare-fun mapRest!55436 () (Array (_ BitVec 32) ValueCell!17031))

(assert (=> mapNonEmpty!55436 (= (arr!42810 _values!1337) (store mapRest!55436 mapKey!55436 mapValue!55436))))

(declare-fun b!1317992 () Bool)

(assert (=> b!1317992 (= e!752131 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52915)

(declare-fun minValue!1279 () V!52915)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586434 () Bool)

(declare-datatypes ((tuple2!23174 0))(
  ( (tuple2!23175 (_1!11598 (_ BitVec 64)) (_2!11598 V!52915)) )
))
(declare-datatypes ((List!30331 0))(
  ( (Nil!30328) (Cons!30327 (h!31536 tuple2!23174) (t!43939 List!30331)) )
))
(declare-datatypes ((ListLongMap!20831 0))(
  ( (ListLongMap!20832 (toList!10431 List!30331)) )
))
(declare-fun contains!8586 (ListLongMap!20831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5444 (array!88670 array!88672 (_ BitVec 32) (_ BitVec 32) V!52915 V!52915 (_ BitVec 32) Int) ListLongMap!20831)

(assert (=> b!1317992 (= lt!586434 (contains!8586 (getCurrentListMap!5444 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!874715 () Bool)

(assert (=> start!111382 (=> (not res!874715) (not e!752131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111382 (= res!874715 (validMask!0 mask!2019))))

(assert (=> start!111382 e!752131))

(declare-fun array_inv!32333 (array!88670) Bool)

(assert (=> start!111382 (array_inv!32333 _keys!1609)))

(assert (=> start!111382 true))

(assert (=> start!111382 tp_is_empty!35859))

(declare-fun e!752130 () Bool)

(declare-fun array_inv!32334 (array!88672) Bool)

(assert (=> start!111382 (and (array_inv!32334 _values!1337) e!752130)))

(assert (=> start!111382 tp!105592))

(declare-fun b!1317993 () Bool)

(assert (=> b!1317993 (= e!752130 (and e!752134 mapRes!55436))))

(declare-fun condMapEmpty!55436 () Bool)

(declare-fun mapDefault!55436 () ValueCell!17031)

(assert (=> b!1317993 (= condMapEmpty!55436 (= (arr!42810 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17031)) mapDefault!55436)))))

(declare-fun b!1317994 () Bool)

(declare-fun res!874714 () Bool)

(assert (=> b!1317994 (=> (not res!874714) (not e!752131))))

(declare-datatypes ((List!30332 0))(
  ( (Nil!30329) (Cons!30328 (h!31537 (_ BitVec 64)) (t!43940 List!30332)) )
))
(declare-fun arrayNoDuplicates!0 (array!88670 (_ BitVec 32) List!30332) Bool)

(assert (=> b!1317994 (= res!874714 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30329))))

(declare-fun b!1317995 () Bool)

(declare-fun res!874713 () Bool)

(assert (=> b!1317995 (=> (not res!874713) (not e!752131))))

(assert (=> b!1317995 (= res!874713 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43359 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55436 () Bool)

(assert (=> mapIsEmpty!55436 mapRes!55436))

(assert (= (and start!111382 res!874715) b!1317990))

(assert (= (and b!1317990 res!874712) b!1317988))

(assert (= (and b!1317988 res!874711) b!1317994))

(assert (= (and b!1317994 res!874714) b!1317995))

(assert (= (and b!1317995 res!874713) b!1317992))

(assert (= (and b!1317993 condMapEmpty!55436) mapIsEmpty!55436))

(assert (= (and b!1317993 (not condMapEmpty!55436)) mapNonEmpty!55436))

(get-info :version)

(assert (= (and mapNonEmpty!55436 ((_ is ValueCellFull!17031) mapValue!55436)) b!1317991))

(assert (= (and b!1317993 ((_ is ValueCellFull!17031) mapDefault!55436)) b!1317989))

(assert (= start!111382 b!1317993))

(declare-fun m!1205659 () Bool)

(assert (=> b!1317994 m!1205659))

(declare-fun m!1205661 () Bool)

(assert (=> b!1317988 m!1205661))

(declare-fun m!1205663 () Bool)

(assert (=> start!111382 m!1205663))

(declare-fun m!1205665 () Bool)

(assert (=> start!111382 m!1205665))

(declare-fun m!1205667 () Bool)

(assert (=> start!111382 m!1205667))

(declare-fun m!1205669 () Bool)

(assert (=> b!1317992 m!1205669))

(assert (=> b!1317992 m!1205669))

(declare-fun m!1205671 () Bool)

(assert (=> b!1317992 m!1205671))

(declare-fun m!1205673 () Bool)

(assert (=> mapNonEmpty!55436 m!1205673))

(check-sat (not b!1317994) (not mapNonEmpty!55436) (not b!1317988) (not b_next!30039) tp_is_empty!35859 b_and!48259 (not start!111382) (not b!1317992))
(check-sat b_and!48259 (not b_next!30039))
