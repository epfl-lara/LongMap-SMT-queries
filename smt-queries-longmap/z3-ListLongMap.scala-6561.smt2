; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83232 () Bool)

(assert start!83232)

(declare-fun b_free!19243 () Bool)

(declare-fun b_next!19243 () Bool)

(assert (=> start!83232 (= b_free!19243 (not b_next!19243))))

(declare-fun tp!67008 () Bool)

(declare-fun b_and!30705 () Bool)

(assert (=> start!83232 (= tp!67008 b_and!30705)))

(declare-fun b!971210 () Bool)

(declare-fun res!650119 () Bool)

(declare-fun e!547475 () Bool)

(assert (=> b!971210 (=> (not res!650119) (not e!547475))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((array!60266 0))(
  ( (array!60267 (arr!28997 (Array (_ BitVec 32) (_ BitVec 64))) (size!29478 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60266)

(assert (=> b!971210 (= res!650119 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29478 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29478 _keys!1717))))))

(declare-fun res!650117 () Bool)

(assert (=> start!83232 (=> (not res!650117) (not e!547475))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83232 (= res!650117 (validMask!0 mask!2147))))

(assert (=> start!83232 e!547475))

(assert (=> start!83232 true))

(declare-datatypes ((V!34505 0))(
  ( (V!34506 (val!11121 Int)) )
))
(declare-datatypes ((ValueCell!10589 0))(
  ( (ValueCellFull!10589 (v!13679 V!34505)) (EmptyCell!10589) )
))
(declare-datatypes ((array!60268 0))(
  ( (array!60269 (arr!28998 (Array (_ BitVec 32) ValueCell!10589)) (size!29479 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60268)

(declare-fun e!547473 () Bool)

(declare-fun array_inv!22503 (array!60268) Bool)

(assert (=> start!83232 (and (array_inv!22503 _values!1425) e!547473)))

(declare-fun tp_is_empty!22141 () Bool)

(assert (=> start!83232 tp_is_empty!22141))

(assert (=> start!83232 tp!67008))

(declare-fun array_inv!22504 (array!60266) Bool)

(assert (=> start!83232 (array_inv!22504 _keys!1717)))

(declare-fun b!971211 () Bool)

(declare-fun e!547476 () Bool)

(assert (=> b!971211 (= e!547476 tp_is_empty!22141)))

(declare-fun b!971212 () Bool)

(declare-fun res!650116 () Bool)

(assert (=> b!971212 (=> (not res!650116) (not e!547475))))

(declare-datatypes ((List!20158 0))(
  ( (Nil!20155) (Cons!20154 (h!21316 (_ BitVec 64)) (t!28512 List!20158)) )
))
(declare-fun arrayNoDuplicates!0 (array!60266 (_ BitVec 32) List!20158) Bool)

(assert (=> b!971212 (= res!650116 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20155))))

(declare-fun b!971213 () Bool)

(declare-fun e!547474 () Bool)

(assert (=> b!971213 (= e!547474 tp_is_empty!22141)))

(declare-fun b!971214 () Bool)

(declare-fun res!650113 () Bool)

(assert (=> b!971214 (=> (not res!650113) (not e!547475))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971214 (= res!650113 (and (= (size!29479 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29478 _keys!1717) (size!29479 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971215 () Bool)

(declare-fun res!650115 () Bool)

(assert (=> b!971215 (=> (not res!650115) (not e!547475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971215 (= res!650115 (validKeyInArray!0 (select (arr!28997 _keys!1717) i!822)))))

(declare-fun b!971216 () Bool)

(declare-fun mapRes!35221 () Bool)

(assert (=> b!971216 (= e!547473 (and e!547474 mapRes!35221))))

(declare-fun condMapEmpty!35221 () Bool)

(declare-fun mapDefault!35221 () ValueCell!10589)

(assert (=> b!971216 (= condMapEmpty!35221 (= (arr!28998 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10589)) mapDefault!35221)))))

(declare-fun b!971217 () Bool)

(declare-fun res!650114 () Bool)

(assert (=> b!971217 (=> (not res!650114) (not e!547475))))

(declare-fun zeroValue!1367 () V!34505)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34505)

(declare-datatypes ((tuple2!14342 0))(
  ( (tuple2!14343 (_1!7182 (_ BitVec 64)) (_2!7182 V!34505)) )
))
(declare-datatypes ((List!20159 0))(
  ( (Nil!20156) (Cons!20155 (h!21317 tuple2!14342) (t!28513 List!20159)) )
))
(declare-datatypes ((ListLongMap!13029 0))(
  ( (ListLongMap!13030 (toList!6530 List!20159)) )
))
(declare-fun contains!5574 (ListLongMap!13029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3692 (array!60266 array!60268 (_ BitVec 32) (_ BitVec 32) V!34505 V!34505 (_ BitVec 32) Int) ListLongMap!13029)

(assert (=> b!971217 (= res!650114 (contains!5574 (getCurrentListMap!3692 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28997 _keys!1717) i!822)))))

(declare-fun b!971218 () Bool)

(assert (=> b!971218 (= e!547475 false)))

(declare-fun lt!431598 () ListLongMap!13029)

(assert (=> b!971218 (= lt!431598 (getCurrentListMap!3692 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35221 () Bool)

(declare-fun tp!67009 () Bool)

(assert (=> mapNonEmpty!35221 (= mapRes!35221 (and tp!67009 e!547476))))

(declare-fun mapRest!35221 () (Array (_ BitVec 32) ValueCell!10589))

(declare-fun mapValue!35221 () ValueCell!10589)

(declare-fun mapKey!35221 () (_ BitVec 32))

(assert (=> mapNonEmpty!35221 (= (arr!28998 _values!1425) (store mapRest!35221 mapKey!35221 mapValue!35221))))

(declare-fun b!971219 () Bool)

(declare-fun res!650118 () Bool)

(assert (=> b!971219 (=> (not res!650118) (not e!547475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60266 (_ BitVec 32)) Bool)

(assert (=> b!971219 (= res!650118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35221 () Bool)

(assert (=> mapIsEmpty!35221 mapRes!35221))

(assert (= (and start!83232 res!650117) b!971214))

(assert (= (and b!971214 res!650113) b!971219))

(assert (= (and b!971219 res!650118) b!971212))

(assert (= (and b!971212 res!650116) b!971210))

(assert (= (and b!971210 res!650119) b!971215))

(assert (= (and b!971215 res!650115) b!971217))

(assert (= (and b!971217 res!650114) b!971218))

(assert (= (and b!971216 condMapEmpty!35221) mapIsEmpty!35221))

(assert (= (and b!971216 (not condMapEmpty!35221)) mapNonEmpty!35221))

(get-info :version)

(assert (= (and mapNonEmpty!35221 ((_ is ValueCellFull!10589) mapValue!35221)) b!971211))

(assert (= (and b!971216 ((_ is ValueCellFull!10589) mapDefault!35221)) b!971213))

(assert (= start!83232 b!971216))

(declare-fun m!898145 () Bool)

(assert (=> b!971219 m!898145))

(declare-fun m!898147 () Bool)

(assert (=> b!971212 m!898147))

(declare-fun m!898149 () Bool)

(assert (=> start!83232 m!898149))

(declare-fun m!898151 () Bool)

(assert (=> start!83232 m!898151))

(declare-fun m!898153 () Bool)

(assert (=> start!83232 m!898153))

(declare-fun m!898155 () Bool)

(assert (=> b!971215 m!898155))

(assert (=> b!971215 m!898155))

(declare-fun m!898157 () Bool)

(assert (=> b!971215 m!898157))

(declare-fun m!898159 () Bool)

(assert (=> b!971217 m!898159))

(assert (=> b!971217 m!898155))

(assert (=> b!971217 m!898159))

(assert (=> b!971217 m!898155))

(declare-fun m!898161 () Bool)

(assert (=> b!971217 m!898161))

(declare-fun m!898163 () Bool)

(assert (=> b!971218 m!898163))

(declare-fun m!898165 () Bool)

(assert (=> mapNonEmpty!35221 m!898165))

(check-sat (not b!971218) (not b!971215) (not b!971217) (not mapNonEmpty!35221) tp_is_empty!22141 (not b_next!19243) (not b!971219) (not b!971212) (not start!83232) b_and!30705)
(check-sat b_and!30705 (not b_next!19243))
