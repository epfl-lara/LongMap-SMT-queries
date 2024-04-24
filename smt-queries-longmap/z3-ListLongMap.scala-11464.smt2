; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133994 () Bool)

(assert start!133994)

(declare-fun b_free!31999 () Bool)

(declare-fun b_next!31999 () Bool)

(assert (=> start!133994 (= b_free!31999 (not b_next!31999))))

(declare-fun tp!113120 () Bool)

(declare-fun b_and!51511 () Bool)

(assert (=> start!133994 (= tp!113120 b_and!51511)))

(declare-fun b!1564199 () Bool)

(declare-fun res!1068692 () Bool)

(declare-fun e!871829 () Bool)

(assert (=> b!1564199 (=> (not res!1068692) (not e!871829))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104162 0))(
  ( (array!104163 (arr!50266 (Array (_ BitVec 32) (_ BitVec 64))) (size!50817 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104162)

(assert (=> b!1564199 (= res!1068692 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50817 _keys!637)) (bvslt from!782 (size!50817 _keys!637))))))

(declare-fun mapIsEmpty!59373 () Bool)

(declare-fun mapRes!59373 () Bool)

(assert (=> mapIsEmpty!59373 mapRes!59373))

(declare-fun b!1564200 () Bool)

(declare-fun e!871831 () Bool)

(declare-fun tp_is_empty!38665 () Bool)

(assert (=> b!1564200 (= e!871831 tp_is_empty!38665)))

(declare-fun b!1564201 () Bool)

(declare-fun res!1068691 () Bool)

(assert (=> b!1564201 (=> (not res!1068691) (not e!871829))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59761 0))(
  ( (V!59762 (val!19416 Int)) )
))
(declare-datatypes ((ValueCell!18302 0))(
  ( (ValueCellFull!18302 (v!22160 V!59761)) (EmptyCell!18302) )
))
(declare-datatypes ((array!104164 0))(
  ( (array!104165 (arr!50267 (Array (_ BitVec 32) ValueCell!18302)) (size!50818 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104164)

(assert (=> b!1564201 (= res!1068691 (and (= (size!50818 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50817 _keys!637) (size!50818 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564202 () Bool)

(declare-fun e!871826 () Bool)

(assert (=> b!1564202 (= e!871826 true)))

(declare-fun lt!672225 () Bool)

(declare-datatypes ((tuple2!25142 0))(
  ( (tuple2!25143 (_1!12582 (_ BitVec 64)) (_2!12582 V!59761)) )
))
(declare-datatypes ((List!36481 0))(
  ( (Nil!36478) (Cons!36477 (h!37941 tuple2!25142) (t!51262 List!36481)) )
))
(declare-datatypes ((ListLongMap!22585 0))(
  ( (ListLongMap!22586 (toList!11308 List!36481)) )
))
(declare-fun lt!672227 () ListLongMap!22585)

(declare-fun contains!10309 (ListLongMap!22585 (_ BitVec 64)) Bool)

(assert (=> b!1564202 (= lt!672225 (contains!10309 lt!672227 (select (arr!50266 _keys!637) from!782)))))

(declare-fun b!1564203 () Bool)

(declare-fun res!1068686 () Bool)

(assert (=> b!1564203 (=> (not res!1068686) (not e!871829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564203 (= res!1068686 (validKeyInArray!0 (select (arr!50266 _keys!637) from!782)))))

(declare-fun res!1068688 () Bool)

(assert (=> start!133994 (=> (not res!1068688) (not e!871829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133994 (= res!1068688 (validMask!0 mask!947))))

(assert (=> start!133994 e!871829))

(assert (=> start!133994 tp!113120))

(assert (=> start!133994 tp_is_empty!38665))

(assert (=> start!133994 true))

(declare-fun array_inv!39315 (array!104162) Bool)

(assert (=> start!133994 (array_inv!39315 _keys!637)))

(declare-fun e!871828 () Bool)

(declare-fun array_inv!39316 (array!104164) Bool)

(assert (=> start!133994 (and (array_inv!39316 _values!487) e!871828)))

(declare-fun b!1564204 () Bool)

(assert (=> b!1564204 (= e!871829 (not e!871826))))

(declare-fun res!1068690 () Bool)

(assert (=> b!1564204 (=> res!1068690 e!871826)))

(assert (=> b!1564204 (= res!1068690 (contains!10309 lt!672227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564204 (not (contains!10309 lt!672227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672223 () ListLongMap!22585)

(declare-fun lt!672224 () V!59761)

(declare-fun +!5084 (ListLongMap!22585 tuple2!25142) ListLongMap!22585)

(assert (=> b!1564204 (= lt!672227 (+!5084 lt!672223 (tuple2!25143 (select (arr!50266 _keys!637) from!782) lt!672224)))))

(declare-datatypes ((Unit!51853 0))(
  ( (Unit!51854) )
))
(declare-fun lt!672226 () Unit!51853)

(declare-fun addStillNotContains!535 (ListLongMap!22585 (_ BitVec 64) V!59761 (_ BitVec 64)) Unit!51853)

(assert (=> b!1564204 (= lt!672226 (addStillNotContains!535 lt!672223 (select (arr!50266 _keys!637) from!782) lt!672224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26262 (ValueCell!18302 V!59761) V!59761)

(declare-fun dynLambda!3882 (Int (_ BitVec 64)) V!59761)

(assert (=> b!1564204 (= lt!672224 (get!26262 (select (arr!50267 _values!487) from!782) (dynLambda!3882 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59761)

(declare-fun minValue!453 () V!59761)

(declare-fun getCurrentListMapNoExtraKeys!6707 (array!104162 array!104164 (_ BitVec 32) (_ BitVec 32) V!59761 V!59761 (_ BitVec 32) Int) ListLongMap!22585)

(assert (=> b!1564204 (= lt!672223 (getCurrentListMapNoExtraKeys!6707 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59373 () Bool)

(declare-fun tp!113121 () Bool)

(declare-fun e!871830 () Bool)

(assert (=> mapNonEmpty!59373 (= mapRes!59373 (and tp!113121 e!871830))))

(declare-fun mapRest!59373 () (Array (_ BitVec 32) ValueCell!18302))

(declare-fun mapKey!59373 () (_ BitVec 32))

(declare-fun mapValue!59373 () ValueCell!18302)

(assert (=> mapNonEmpty!59373 (= (arr!50267 _values!487) (store mapRest!59373 mapKey!59373 mapValue!59373))))

(declare-fun b!1564205 () Bool)

(assert (=> b!1564205 (= e!871828 (and e!871831 mapRes!59373))))

(declare-fun condMapEmpty!59373 () Bool)

(declare-fun mapDefault!59373 () ValueCell!18302)

(assert (=> b!1564205 (= condMapEmpty!59373 (= (arr!50267 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18302)) mapDefault!59373)))))

(declare-fun b!1564206 () Bool)

(declare-fun res!1068689 () Bool)

(assert (=> b!1564206 (=> (not res!1068689) (not e!871829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104162 (_ BitVec 32)) Bool)

(assert (=> b!1564206 (= res!1068689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564207 () Bool)

(assert (=> b!1564207 (= e!871830 tp_is_empty!38665)))

(declare-fun b!1564208 () Bool)

(declare-fun res!1068687 () Bool)

(assert (=> b!1564208 (=> (not res!1068687) (not e!871829))))

(declare-datatypes ((List!36482 0))(
  ( (Nil!36479) (Cons!36478 (h!37942 (_ BitVec 64)) (t!51263 List!36482)) )
))
(declare-fun arrayNoDuplicates!0 (array!104162 (_ BitVec 32) List!36482) Bool)

(assert (=> b!1564208 (= res!1068687 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36479))))

(assert (= (and start!133994 res!1068688) b!1564201))

(assert (= (and b!1564201 res!1068691) b!1564206))

(assert (= (and b!1564206 res!1068689) b!1564208))

(assert (= (and b!1564208 res!1068687) b!1564199))

(assert (= (and b!1564199 res!1068692) b!1564203))

(assert (= (and b!1564203 res!1068686) b!1564204))

(assert (= (and b!1564204 (not res!1068690)) b!1564202))

(assert (= (and b!1564205 condMapEmpty!59373) mapIsEmpty!59373))

(assert (= (and b!1564205 (not condMapEmpty!59373)) mapNonEmpty!59373))

(get-info :version)

(assert (= (and mapNonEmpty!59373 ((_ is ValueCellFull!18302) mapValue!59373)) b!1564207))

(assert (= (and b!1564205 ((_ is ValueCellFull!18302) mapDefault!59373)) b!1564200))

(assert (= start!133994 b!1564205))

(declare-fun b_lambda!24867 () Bool)

(assert (=> (not b_lambda!24867) (not b!1564204)))

(declare-fun t!51261 () Bool)

(declare-fun tb!12535 () Bool)

(assert (=> (and start!133994 (= defaultEntry!495 defaultEntry!495) t!51261) tb!12535))

(declare-fun result!26359 () Bool)

(assert (=> tb!12535 (= result!26359 tp_is_empty!38665)))

(assert (=> b!1564204 t!51261))

(declare-fun b_and!51513 () Bool)

(assert (= b_and!51511 (and (=> t!51261 result!26359) b_and!51513)))

(declare-fun m!1439709 () Bool)

(assert (=> b!1564206 m!1439709))

(declare-fun m!1439711 () Bool)

(assert (=> b!1564208 m!1439711))

(declare-fun m!1439713 () Bool)

(assert (=> b!1564202 m!1439713))

(assert (=> b!1564202 m!1439713))

(declare-fun m!1439715 () Bool)

(assert (=> b!1564202 m!1439715))

(assert (=> b!1564203 m!1439713))

(assert (=> b!1564203 m!1439713))

(declare-fun m!1439717 () Bool)

(assert (=> b!1564203 m!1439717))

(declare-fun m!1439719 () Bool)

(assert (=> mapNonEmpty!59373 m!1439719))

(declare-fun m!1439721 () Bool)

(assert (=> b!1564204 m!1439721))

(declare-fun m!1439723 () Bool)

(assert (=> b!1564204 m!1439723))

(declare-fun m!1439725 () Bool)

(assert (=> b!1564204 m!1439725))

(assert (=> b!1564204 m!1439713))

(declare-fun m!1439727 () Bool)

(assert (=> b!1564204 m!1439727))

(declare-fun m!1439729 () Bool)

(assert (=> b!1564204 m!1439729))

(assert (=> b!1564204 m!1439721))

(assert (=> b!1564204 m!1439713))

(assert (=> b!1564204 m!1439723))

(declare-fun m!1439731 () Bool)

(assert (=> b!1564204 m!1439731))

(declare-fun m!1439733 () Bool)

(assert (=> b!1564204 m!1439733))

(declare-fun m!1439735 () Bool)

(assert (=> b!1564204 m!1439735))

(declare-fun m!1439737 () Bool)

(assert (=> start!133994 m!1439737))

(declare-fun m!1439739 () Bool)

(assert (=> start!133994 m!1439739))

(declare-fun m!1439741 () Bool)

(assert (=> start!133994 m!1439741))

(check-sat tp_is_empty!38665 (not mapNonEmpty!59373) (not b!1564203) (not start!133994) (not b_next!31999) (not b!1564206) (not b_lambda!24867) b_and!51513 (not b!1564204) (not b!1564208) (not b!1564202))
(check-sat b_and!51513 (not b_next!31999))
