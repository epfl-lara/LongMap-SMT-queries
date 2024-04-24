; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109812 () Bool)

(assert start!109812)

(declare-fun b_free!29077 () Bool)

(declare-fun b_next!29077 () Bool)

(assert (=> start!109812 (= b_free!29077 (not b_next!29077))))

(declare-fun tp!102350 () Bool)

(declare-fun b_and!47169 () Bool)

(assert (=> start!109812 (= tp!102350 b_and!47169)))

(declare-fun b!1299322 () Bool)

(declare-fun res!863151 () Bool)

(declare-fun e!741395 () Bool)

(assert (=> b!1299322 (=> (not res!863151) (not e!741395))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86481 0))(
  ( (array!86482 (arr!41737 (Array (_ BitVec 32) (_ BitVec 64))) (size!42288 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86481)

(assert (=> b!1299322 (= res!863151 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42288 _keys!1741)) (not (= (select (arr!41737 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!53636 () Bool)

(declare-fun mapRes!53636 () Bool)

(assert (=> mapIsEmpty!53636 mapRes!53636))

(declare-fun mapNonEmpty!53636 () Bool)

(declare-fun tp!102349 () Bool)

(declare-fun e!741399 () Bool)

(assert (=> mapNonEmpty!53636 (= mapRes!53636 (and tp!102349 e!741399))))

(declare-datatypes ((V!51393 0))(
  ( (V!51394 (val!17433 Int)) )
))
(declare-datatypes ((ValueCell!16460 0))(
  ( (ValueCellFull!16460 (v!20031 V!51393)) (EmptyCell!16460) )
))
(declare-fun mapValue!53636 () ValueCell!16460)

(declare-datatypes ((array!86483 0))(
  ( (array!86484 (arr!41738 (Array (_ BitVec 32) ValueCell!16460)) (size!42289 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86483)

(declare-fun mapRest!53636 () (Array (_ BitVec 32) ValueCell!16460))

(declare-fun mapKey!53636 () (_ BitVec 32))

(assert (=> mapNonEmpty!53636 (= (arr!41738 _values!1445) (store mapRest!53636 mapKey!53636 mapValue!53636))))

(declare-fun b!1299324 () Bool)

(declare-fun e!741396 () Bool)

(declare-fun e!741397 () Bool)

(assert (=> b!1299324 (= e!741396 (and e!741397 mapRes!53636))))

(declare-fun condMapEmpty!53636 () Bool)

(declare-fun mapDefault!53636 () ValueCell!16460)

(assert (=> b!1299324 (= condMapEmpty!53636 (= (arr!41738 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16460)) mapDefault!53636)))))

(declare-fun b!1299325 () Bool)

(declare-fun res!863146 () Bool)

(assert (=> b!1299325 (=> (not res!863146) (not e!741395))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299325 (= res!863146 (and (= (size!42289 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42288 _keys!1741) (size!42289 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299326 () Bool)

(declare-fun res!863150 () Bool)

(assert (=> b!1299326 (=> (not res!863150) (not e!741395))))

(declare-datatypes ((List!29640 0))(
  ( (Nil!29637) (Cons!29636 (h!30854 (_ BitVec 64)) (t!43196 List!29640)) )
))
(declare-fun arrayNoDuplicates!0 (array!86481 (_ BitVec 32) List!29640) Bool)

(assert (=> b!1299326 (= res!863150 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29637))))

(declare-fun b!1299327 () Bool)

(declare-fun tp_is_empty!34717 () Bool)

(assert (=> b!1299327 (= e!741397 tp_is_empty!34717)))

(declare-fun res!863148 () Bool)

(assert (=> start!109812 (=> (not res!863148) (not e!741395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109812 (= res!863148 (validMask!0 mask!2175))))

(assert (=> start!109812 e!741395))

(assert (=> start!109812 tp_is_empty!34717))

(assert (=> start!109812 true))

(declare-fun array_inv!31819 (array!86483) Bool)

(assert (=> start!109812 (and (array_inv!31819 _values!1445) e!741396)))

(declare-fun array_inv!31820 (array!86481) Bool)

(assert (=> start!109812 (array_inv!31820 _keys!1741)))

(assert (=> start!109812 tp!102350))

(declare-fun b!1299323 () Bool)

(assert (=> b!1299323 (= e!741395 (not true))))

(declare-fun minValue!1387 () V!51393)

(declare-fun zeroValue!1387 () V!51393)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22480 0))(
  ( (tuple2!22481 (_1!11251 (_ BitVec 64)) (_2!11251 V!51393)) )
))
(declare-datatypes ((List!29641 0))(
  ( (Nil!29638) (Cons!29637 (h!30855 tuple2!22480) (t!43197 List!29641)) )
))
(declare-datatypes ((ListLongMap!20145 0))(
  ( (ListLongMap!20146 (toList!10088 List!29641)) )
))
(declare-fun contains!8218 (ListLongMap!20145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5107 (array!86481 array!86483 (_ BitVec 32) (_ BitVec 32) V!51393 V!51393 (_ BitVec 32) Int) ListLongMap!20145)

(assert (=> b!1299323 (contains!8218 (getCurrentListMap!5107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42931 0))(
  ( (Unit!42932) )
))
(declare-fun lt!581145 () Unit!42931)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!32 (array!86481 array!86483 (_ BitVec 32) (_ BitVec 32) V!51393 V!51393 (_ BitVec 64) (_ BitVec 32) Int) Unit!42931)

(assert (=> b!1299323 (= lt!581145 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!32 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299328 () Bool)

(declare-fun res!863147 () Bool)

(assert (=> b!1299328 (=> (not res!863147) (not e!741395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86481 (_ BitVec 32)) Bool)

(assert (=> b!1299328 (= res!863147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299329 () Bool)

(declare-fun res!863152 () Bool)

(assert (=> b!1299329 (=> (not res!863152) (not e!741395))))

(assert (=> b!1299329 (= res!863152 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42288 _keys!1741))))))

(declare-fun b!1299330 () Bool)

(assert (=> b!1299330 (= e!741399 tp_is_empty!34717)))

(declare-fun b!1299331 () Bool)

(declare-fun res!863149 () Bool)

(assert (=> b!1299331 (=> (not res!863149) (not e!741395))))

(assert (=> b!1299331 (= res!863149 (contains!8218 (getCurrentListMap!5107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109812 res!863148) b!1299325))

(assert (= (and b!1299325 res!863146) b!1299328))

(assert (= (and b!1299328 res!863147) b!1299326))

(assert (= (and b!1299326 res!863150) b!1299329))

(assert (= (and b!1299329 res!863152) b!1299331))

(assert (= (and b!1299331 res!863149) b!1299322))

(assert (= (and b!1299322 res!863151) b!1299323))

(assert (= (and b!1299324 condMapEmpty!53636) mapIsEmpty!53636))

(assert (= (and b!1299324 (not condMapEmpty!53636)) mapNonEmpty!53636))

(get-info :version)

(assert (= (and mapNonEmpty!53636 ((_ is ValueCellFull!16460) mapValue!53636)) b!1299330))

(assert (= (and b!1299324 ((_ is ValueCellFull!16460) mapDefault!53636)) b!1299327))

(assert (= start!109812 b!1299324))

(declare-fun m!1191069 () Bool)

(assert (=> start!109812 m!1191069))

(declare-fun m!1191071 () Bool)

(assert (=> start!109812 m!1191071))

(declare-fun m!1191073 () Bool)

(assert (=> start!109812 m!1191073))

(declare-fun m!1191075 () Bool)

(assert (=> b!1299323 m!1191075))

(assert (=> b!1299323 m!1191075))

(declare-fun m!1191077 () Bool)

(assert (=> b!1299323 m!1191077))

(declare-fun m!1191079 () Bool)

(assert (=> b!1299323 m!1191079))

(declare-fun m!1191081 () Bool)

(assert (=> mapNonEmpty!53636 m!1191081))

(declare-fun m!1191083 () Bool)

(assert (=> b!1299331 m!1191083))

(assert (=> b!1299331 m!1191083))

(declare-fun m!1191085 () Bool)

(assert (=> b!1299331 m!1191085))

(declare-fun m!1191087 () Bool)

(assert (=> b!1299328 m!1191087))

(declare-fun m!1191089 () Bool)

(assert (=> b!1299322 m!1191089))

(declare-fun m!1191091 () Bool)

(assert (=> b!1299326 m!1191091))

(check-sat (not b!1299328) (not start!109812) (not b!1299326) (not b!1299331) (not mapNonEmpty!53636) b_and!47169 (not b!1299323) (not b_next!29077) tp_is_empty!34717)
(check-sat b_and!47169 (not b_next!29077))
