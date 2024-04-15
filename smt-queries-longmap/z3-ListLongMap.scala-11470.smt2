; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133568 () Bool)

(assert start!133568)

(declare-fun b_free!32035 () Bool)

(declare-fun b_next!32035 () Bool)

(assert (=> start!133568 (= b_free!32035 (not b_next!32035))))

(declare-fun tp!113230 () Bool)

(declare-fun b_and!51563 () Bool)

(assert (=> start!133568 (= tp!113230 b_and!51563)))

(declare-fun b!1561979 () Bool)

(declare-fun e!870399 () Bool)

(declare-fun tp_is_empty!38701 () Bool)

(assert (=> b!1561979 (= e!870399 tp_is_empty!38701)))

(declare-fun b!1561980 () Bool)

(declare-fun res!1068031 () Bool)

(declare-fun e!870398 () Bool)

(assert (=> b!1561980 (=> (not res!1068031) (not e!870398))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59809 0))(
  ( (V!59810 (val!19434 Int)) )
))
(declare-datatypes ((ValueCell!18320 0))(
  ( (ValueCellFull!18320 (v!22182 V!59809)) (EmptyCell!18320) )
))
(declare-datatypes ((array!104030 0))(
  ( (array!104031 (arr!50208 (Array (_ BitVec 32) ValueCell!18320)) (size!50760 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104030)

(declare-datatypes ((array!104032 0))(
  ( (array!104033 (arr!50209 (Array (_ BitVec 32) (_ BitVec 64))) (size!50761 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104032)

(assert (=> b!1561980 (= res!1068031 (and (= (size!50760 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50761 _keys!637) (size!50760 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561981 () Bool)

(declare-fun res!1068030 () Bool)

(assert (=> b!1561981 (=> (not res!1068030) (not e!870398))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561981 (= res!1068030 (validKeyInArray!0 (select (arr!50209 _keys!637) from!782)))))

(declare-fun b!1561982 () Bool)

(declare-fun res!1068028 () Bool)

(assert (=> b!1561982 (=> (not res!1068028) (not e!870398))))

(declare-datatypes ((List!36518 0))(
  ( (Nil!36515) (Cons!36514 (h!37961 (_ BitVec 64)) (t!51335 List!36518)) )
))
(declare-fun arrayNoDuplicates!0 (array!104032 (_ BitVec 32) List!36518) Bool)

(assert (=> b!1561982 (= res!1068028 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36515))))

(declare-fun b!1561983 () Bool)

(assert (=> b!1561983 (= e!870398 (not true))))

(declare-fun lt!671300 () Bool)

(declare-datatypes ((tuple2!25178 0))(
  ( (tuple2!25179 (_1!12600 (_ BitVec 64)) (_2!12600 V!59809)) )
))
(declare-datatypes ((List!36519 0))(
  ( (Nil!36516) (Cons!36515 (h!37962 tuple2!25178) (t!51336 List!36519)) )
))
(declare-datatypes ((ListLongMap!22613 0))(
  ( (ListLongMap!22614 (toList!11322 List!36519)) )
))
(declare-fun lt!671303 () ListLongMap!22613)

(declare-fun contains!10232 (ListLongMap!22613 (_ BitVec 64)) Bool)

(assert (=> b!1561983 (= lt!671300 (contains!10232 lt!671303 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561983 (not (contains!10232 lt!671303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671299 () ListLongMap!22613)

(declare-fun lt!671302 () V!59809)

(declare-fun +!5087 (ListLongMap!22613 tuple2!25178) ListLongMap!22613)

(assert (=> b!1561983 (= lt!671303 (+!5087 lt!671299 (tuple2!25179 (select (arr!50209 _keys!637) from!782) lt!671302)))))

(declare-datatypes ((Unit!51782 0))(
  ( (Unit!51783) )
))
(declare-fun lt!671301 () Unit!51782)

(declare-fun addStillNotContains!534 (ListLongMap!22613 (_ BitVec 64) V!59809 (_ BitVec 64)) Unit!51782)

(assert (=> b!1561983 (= lt!671301 (addStillNotContains!534 lt!671299 (select (arr!50209 _keys!637) from!782) lt!671302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26244 (ValueCell!18320 V!59809) V!59809)

(declare-fun dynLambda!3863 (Int (_ BitVec 64)) V!59809)

(assert (=> b!1561983 (= lt!671302 (get!26244 (select (arr!50208 _values!487) from!782) (dynLambda!3863 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59809)

(declare-fun minValue!453 () V!59809)

(declare-fun getCurrentListMapNoExtraKeys!6696 (array!104032 array!104030 (_ BitVec 32) (_ BitVec 32) V!59809 V!59809 (_ BitVec 32) Int) ListLongMap!22613)

(assert (=> b!1561983 (= lt!671299 (getCurrentListMapNoExtraKeys!6696 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561984 () Bool)

(declare-fun res!1068032 () Bool)

(assert (=> b!1561984 (=> (not res!1068032) (not e!870398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104032 (_ BitVec 32)) Bool)

(assert (=> b!1561984 (= res!1068032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59427 () Bool)

(declare-fun mapRes!59427 () Bool)

(declare-fun tp!113229 () Bool)

(declare-fun e!870397 () Bool)

(assert (=> mapNonEmpty!59427 (= mapRes!59427 (and tp!113229 e!870397))))

(declare-fun mapKey!59427 () (_ BitVec 32))

(declare-fun mapValue!59427 () ValueCell!18320)

(declare-fun mapRest!59427 () (Array (_ BitVec 32) ValueCell!18320))

(assert (=> mapNonEmpty!59427 (= (arr!50208 _values!487) (store mapRest!59427 mapKey!59427 mapValue!59427))))

(declare-fun b!1561985 () Bool)

(declare-fun res!1068033 () Bool)

(assert (=> b!1561985 (=> (not res!1068033) (not e!870398))))

(assert (=> b!1561985 (= res!1068033 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50761 _keys!637)) (bvslt from!782 (size!50761 _keys!637))))))

(declare-fun b!1561986 () Bool)

(assert (=> b!1561986 (= e!870397 tp_is_empty!38701)))

(declare-fun b!1561987 () Bool)

(declare-fun e!870400 () Bool)

(assert (=> b!1561987 (= e!870400 (and e!870399 mapRes!59427))))

(declare-fun condMapEmpty!59427 () Bool)

(declare-fun mapDefault!59427 () ValueCell!18320)

(assert (=> b!1561987 (= condMapEmpty!59427 (= (arr!50208 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18320)) mapDefault!59427)))))

(declare-fun res!1068029 () Bool)

(assert (=> start!133568 (=> (not res!1068029) (not e!870398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133568 (= res!1068029 (validMask!0 mask!947))))

(assert (=> start!133568 e!870398))

(assert (=> start!133568 tp!113230))

(assert (=> start!133568 tp_is_empty!38701))

(assert (=> start!133568 true))

(declare-fun array_inv!39213 (array!104032) Bool)

(assert (=> start!133568 (array_inv!39213 _keys!637)))

(declare-fun array_inv!39214 (array!104030) Bool)

(assert (=> start!133568 (and (array_inv!39214 _values!487) e!870400)))

(declare-fun mapIsEmpty!59427 () Bool)

(assert (=> mapIsEmpty!59427 mapRes!59427))

(assert (= (and start!133568 res!1068029) b!1561980))

(assert (= (and b!1561980 res!1068031) b!1561984))

(assert (= (and b!1561984 res!1068032) b!1561982))

(assert (= (and b!1561982 res!1068028) b!1561985))

(assert (= (and b!1561985 res!1068033) b!1561981))

(assert (= (and b!1561981 res!1068030) b!1561983))

(assert (= (and b!1561987 condMapEmpty!59427) mapIsEmpty!59427))

(assert (= (and b!1561987 (not condMapEmpty!59427)) mapNonEmpty!59427))

(get-info :version)

(assert (= (and mapNonEmpty!59427 ((_ is ValueCellFull!18320) mapValue!59427)) b!1561986))

(assert (= (and b!1561987 ((_ is ValueCellFull!18320) mapDefault!59427)) b!1561979))

(assert (= start!133568 b!1561987))

(declare-fun b_lambda!24899 () Bool)

(assert (=> (not b_lambda!24899) (not b!1561983)))

(declare-fun t!51334 () Bool)

(declare-fun tb!12571 () Bool)

(assert (=> (and start!133568 (= defaultEntry!495 defaultEntry!495) t!51334) tb!12571))

(declare-fun result!26431 () Bool)

(assert (=> tb!12571 (= result!26431 tp_is_empty!38701)))

(assert (=> b!1561983 t!51334))

(declare-fun b_and!51565 () Bool)

(assert (= b_and!51563 (and (=> t!51334 result!26431) b_and!51565)))

(declare-fun m!1437141 () Bool)

(assert (=> b!1561981 m!1437141))

(assert (=> b!1561981 m!1437141))

(declare-fun m!1437143 () Bool)

(assert (=> b!1561981 m!1437143))

(declare-fun m!1437145 () Bool)

(assert (=> mapNonEmpty!59427 m!1437145))

(declare-fun m!1437147 () Bool)

(assert (=> b!1561982 m!1437147))

(declare-fun m!1437149 () Bool)

(assert (=> b!1561983 m!1437149))

(declare-fun m!1437151 () Bool)

(assert (=> b!1561983 m!1437151))

(declare-fun m!1437153 () Bool)

(assert (=> b!1561983 m!1437153))

(declare-fun m!1437155 () Bool)

(assert (=> b!1561983 m!1437155))

(assert (=> b!1561983 m!1437141))

(declare-fun m!1437157 () Bool)

(assert (=> b!1561983 m!1437157))

(assert (=> b!1561983 m!1437149))

(assert (=> b!1561983 m!1437141))

(assert (=> b!1561983 m!1437151))

(declare-fun m!1437159 () Bool)

(assert (=> b!1561983 m!1437159))

(declare-fun m!1437161 () Bool)

(assert (=> b!1561983 m!1437161))

(declare-fun m!1437163 () Bool)

(assert (=> b!1561983 m!1437163))

(declare-fun m!1437165 () Bool)

(assert (=> b!1561984 m!1437165))

(declare-fun m!1437167 () Bool)

(assert (=> start!133568 m!1437167))

(declare-fun m!1437169 () Bool)

(assert (=> start!133568 m!1437169))

(declare-fun m!1437171 () Bool)

(assert (=> start!133568 m!1437171))

(check-sat b_and!51565 (not b_lambda!24899) (not mapNonEmpty!59427) (not b_next!32035) (not b!1561981) (not b!1561982) (not b!1561983) tp_is_empty!38701 (not start!133568) (not b!1561984))
(check-sat b_and!51565 (not b_next!32035))
