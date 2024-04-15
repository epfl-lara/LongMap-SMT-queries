; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97754 () Bool)

(assert start!97754)

(declare-fun b_free!23461 () Bool)

(declare-fun b_next!23461 () Bool)

(assert (=> start!97754 (= b_free!23461 (not b_next!23461))))

(declare-fun tp!83087 () Bool)

(declare-fun b_and!37713 () Bool)

(assert (=> start!97754 (= tp!83087 b_and!37713)))

(declare-fun b!1117967 () Bool)

(declare-fun e!636799 () Bool)

(declare-fun e!636801 () Bool)

(assert (=> b!1117967 (= e!636799 (not e!636801))))

(declare-fun res!746659 () Bool)

(assert (=> b!1117967 (=> res!746659 e!636801)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117967 (= res!746659 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72776 0))(
  ( (array!72777 (arr!35041 (Array (_ BitVec 32) (_ BitVec 64))) (size!35579 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72776)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117967 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36517 0))(
  ( (Unit!36518) )
))
(declare-fun lt!497221 () Unit!36517)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72776 (_ BitVec 64) (_ BitVec 32)) Unit!36517)

(assert (=> b!1117967 (= lt!497221 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117968 () Bool)

(declare-fun e!636798 () Bool)

(assert (=> b!1117968 (= e!636798 e!636799)))

(declare-fun res!746655 () Bool)

(assert (=> b!1117968 (=> (not res!746655) (not e!636799))))

(declare-fun lt!497223 () array!72776)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72776 (_ BitVec 32)) Bool)

(assert (=> b!1117968 (= res!746655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497223 mask!1564))))

(assert (=> b!1117968 (= lt!497223 (array!72777 (store (arr!35041 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35579 _keys!1208)))))

(declare-fun b!1117969 () Bool)

(declare-fun e!636800 () Bool)

(declare-fun tp_is_empty!27991 () Bool)

(assert (=> b!1117969 (= e!636800 tp_is_empty!27991)))

(declare-fun mapNonEmpty!43804 () Bool)

(declare-fun mapRes!43804 () Bool)

(declare-fun tp!83086 () Bool)

(declare-fun e!636797 () Bool)

(assert (=> mapNonEmpty!43804 (= mapRes!43804 (and tp!83086 e!636797))))

(declare-datatypes ((V!42449 0))(
  ( (V!42450 (val!14052 Int)) )
))
(declare-datatypes ((ValueCell!13286 0))(
  ( (ValueCellFull!13286 (v!16684 V!42449)) (EmptyCell!13286) )
))
(declare-fun mapValue!43804 () ValueCell!13286)

(declare-fun mapRest!43804 () (Array (_ BitVec 32) ValueCell!13286))

(declare-datatypes ((array!72778 0))(
  ( (array!72779 (arr!35042 (Array (_ BitVec 32) ValueCell!13286)) (size!35580 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72778)

(declare-fun mapKey!43804 () (_ BitVec 32))

(assert (=> mapNonEmpty!43804 (= (arr!35042 _values!996) (store mapRest!43804 mapKey!43804 mapValue!43804))))

(declare-fun b!1117970 () Bool)

(declare-fun res!746661 () Bool)

(assert (=> b!1117970 (=> (not res!746661) (not e!636798))))

(assert (=> b!1117970 (= res!746661 (= (select (arr!35041 _keys!1208) i!673) k0!934))))

(declare-fun b!1117971 () Bool)

(declare-fun res!746653 () Bool)

(assert (=> b!1117971 (=> (not res!746653) (not e!636798))))

(assert (=> b!1117971 (= res!746653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43804 () Bool)

(assert (=> mapIsEmpty!43804 mapRes!43804))

(declare-fun b!1117972 () Bool)

(assert (=> b!1117972 (= e!636797 tp_is_empty!27991)))

(declare-fun b!1117973 () Bool)

(declare-fun res!746660 () Bool)

(assert (=> b!1117973 (=> (not res!746660) (not e!636798))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117973 (= res!746660 (and (= (size!35580 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35579 _keys!1208) (size!35580 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117974 () Bool)

(declare-fun res!746652 () Bool)

(assert (=> b!1117974 (=> (not res!746652) (not e!636798))))

(declare-datatypes ((List!24447 0))(
  ( (Nil!24444) (Cons!24443 (h!25652 (_ BitVec 64)) (t!34919 List!24447)) )
))
(declare-fun arrayNoDuplicates!0 (array!72776 (_ BitVec 32) List!24447) Bool)

(assert (=> b!1117974 (= res!746652 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24444))))

(declare-fun res!746658 () Bool)

(assert (=> start!97754 (=> (not res!746658) (not e!636798))))

(assert (=> start!97754 (= res!746658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35579 _keys!1208))))))

(assert (=> start!97754 e!636798))

(assert (=> start!97754 tp_is_empty!27991))

(declare-fun array_inv!26994 (array!72776) Bool)

(assert (=> start!97754 (array_inv!26994 _keys!1208)))

(assert (=> start!97754 true))

(assert (=> start!97754 tp!83087))

(declare-fun e!636795 () Bool)

(declare-fun array_inv!26995 (array!72778) Bool)

(assert (=> start!97754 (and (array_inv!26995 _values!996) e!636795)))

(declare-fun b!1117975 () Bool)

(assert (=> b!1117975 (= e!636801 true)))

(declare-fun zeroValue!944 () V!42449)

(declare-datatypes ((tuple2!17686 0))(
  ( (tuple2!17687 (_1!8854 (_ BitVec 64)) (_2!8854 V!42449)) )
))
(declare-datatypes ((List!24448 0))(
  ( (Nil!24445) (Cons!24444 (h!25653 tuple2!17686) (t!34920 List!24448)) )
))
(declare-datatypes ((ListLongMap!15655 0))(
  ( (ListLongMap!15656 (toList!7843 List!24448)) )
))
(declare-fun lt!497222 () ListLongMap!15655)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42449)

(declare-fun getCurrentListMapNoExtraKeys!4352 (array!72776 array!72778 (_ BitVec 32) (_ BitVec 32) V!42449 V!42449 (_ BitVec 32) Int) ListLongMap!15655)

(assert (=> b!1117975 (= lt!497222 (getCurrentListMapNoExtraKeys!4352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117976 () Bool)

(declare-fun res!746654 () Bool)

(assert (=> b!1117976 (=> (not res!746654) (not e!636798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117976 (= res!746654 (validMask!0 mask!1564))))

(declare-fun b!1117977 () Bool)

(declare-fun res!746662 () Bool)

(assert (=> b!1117977 (=> (not res!746662) (not e!636799))))

(assert (=> b!1117977 (= res!746662 (arrayNoDuplicates!0 lt!497223 #b00000000000000000000000000000000 Nil!24444))))

(declare-fun b!1117978 () Bool)

(assert (=> b!1117978 (= e!636795 (and e!636800 mapRes!43804))))

(declare-fun condMapEmpty!43804 () Bool)

(declare-fun mapDefault!43804 () ValueCell!13286)

(assert (=> b!1117978 (= condMapEmpty!43804 (= (arr!35042 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13286)) mapDefault!43804)))))

(declare-fun b!1117979 () Bool)

(declare-fun res!746657 () Bool)

(assert (=> b!1117979 (=> (not res!746657) (not e!636798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117979 (= res!746657 (validKeyInArray!0 k0!934))))

(declare-fun b!1117980 () Bool)

(declare-fun res!746656 () Bool)

(assert (=> b!1117980 (=> (not res!746656) (not e!636798))))

(assert (=> b!1117980 (= res!746656 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35579 _keys!1208))))))

(assert (= (and start!97754 res!746658) b!1117976))

(assert (= (and b!1117976 res!746654) b!1117973))

(assert (= (and b!1117973 res!746660) b!1117971))

(assert (= (and b!1117971 res!746653) b!1117974))

(assert (= (and b!1117974 res!746652) b!1117980))

(assert (= (and b!1117980 res!746656) b!1117979))

(assert (= (and b!1117979 res!746657) b!1117970))

(assert (= (and b!1117970 res!746661) b!1117968))

(assert (= (and b!1117968 res!746655) b!1117977))

(assert (= (and b!1117977 res!746662) b!1117967))

(assert (= (and b!1117967 (not res!746659)) b!1117975))

(assert (= (and b!1117978 condMapEmpty!43804) mapIsEmpty!43804))

(assert (= (and b!1117978 (not condMapEmpty!43804)) mapNonEmpty!43804))

(get-info :version)

(assert (= (and mapNonEmpty!43804 ((_ is ValueCellFull!13286) mapValue!43804)) b!1117972))

(assert (= (and b!1117978 ((_ is ValueCellFull!13286) mapDefault!43804)) b!1117969))

(assert (= start!97754 b!1117978))

(declare-fun m!1033125 () Bool)

(assert (=> b!1117974 m!1033125))

(declare-fun m!1033127 () Bool)

(assert (=> b!1117967 m!1033127))

(declare-fun m!1033129 () Bool)

(assert (=> b!1117967 m!1033129))

(declare-fun m!1033131 () Bool)

(assert (=> b!1117979 m!1033131))

(declare-fun m!1033133 () Bool)

(assert (=> mapNonEmpty!43804 m!1033133))

(declare-fun m!1033135 () Bool)

(assert (=> b!1117971 m!1033135))

(declare-fun m!1033137 () Bool)

(assert (=> start!97754 m!1033137))

(declare-fun m!1033139 () Bool)

(assert (=> start!97754 m!1033139))

(declare-fun m!1033141 () Bool)

(assert (=> b!1117977 m!1033141))

(declare-fun m!1033143 () Bool)

(assert (=> b!1117968 m!1033143))

(declare-fun m!1033145 () Bool)

(assert (=> b!1117968 m!1033145))

(declare-fun m!1033147 () Bool)

(assert (=> b!1117970 m!1033147))

(declare-fun m!1033149 () Bool)

(assert (=> b!1117975 m!1033149))

(declare-fun m!1033151 () Bool)

(assert (=> b!1117976 m!1033151))

(check-sat (not b!1117974) (not b!1117967) (not start!97754) (not b!1117975) b_and!37713 (not b!1117968) tp_is_empty!27991 (not b!1117971) (not b!1117977) (not mapNonEmpty!43804) (not b!1117979) (not b_next!23461) (not b!1117976))
(check-sat b_and!37713 (not b_next!23461))
