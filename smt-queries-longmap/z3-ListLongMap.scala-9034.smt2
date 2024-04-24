; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109212 () Bool)

(assert start!109212)

(declare-fun b_free!28477 () Bool)

(declare-fun b_next!28477 () Bool)

(assert (=> start!109212 (= b_free!28477 (not b_next!28477))))

(declare-fun tp!100549 () Bool)

(declare-fun b_and!46569 () Bool)

(assert (=> start!109212 (= tp!100549 b_and!46569)))

(declare-fun b!1289199 () Bool)

(declare-fun e!736303 () Bool)

(assert (=> b!1289199 (= e!736303 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50593 0))(
  ( (V!50594 (val!17133 Int)) )
))
(declare-datatypes ((tuple2!22004 0))(
  ( (tuple2!22005 (_1!11013 (_ BitVec 64)) (_2!11013 V!50593)) )
))
(declare-datatypes ((List!29193 0))(
  ( (Nil!29190) (Cons!29189 (h!30407 tuple2!22004) (t!42749 List!29193)) )
))
(declare-datatypes ((ListLongMap!19669 0))(
  ( (ListLongMap!19670 (toList!9850 List!29193)) )
))
(declare-fun contains!7981 (ListLongMap!19669 (_ BitVec 64)) Bool)

(assert (=> b!1289199 (not (contains!7981 (ListLongMap!19670 Nil!29190) k0!1205))))

(declare-datatypes ((Unit!42555 0))(
  ( (Unit!42556) )
))
(declare-fun lt!578391 () Unit!42555)

(declare-fun emptyContainsNothing!31 ((_ BitVec 64)) Unit!42555)

(assert (=> b!1289199 (= lt!578391 (emptyContainsNothing!31 k0!1205))))

(declare-fun b!1289200 () Bool)

(declare-fun res!855887 () Bool)

(assert (=> b!1289200 (=> (not res!855887) (not e!736303))))

(declare-datatypes ((array!85317 0))(
  ( (array!85318 (arr!41155 (Array (_ BitVec 32) (_ BitVec 64))) (size!41706 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85317)

(declare-datatypes ((List!29194 0))(
  ( (Nil!29191) (Cons!29190 (h!30408 (_ BitVec 64)) (t!42750 List!29194)) )
))
(declare-fun arrayNoDuplicates!0 (array!85317 (_ BitVec 32) List!29194) Bool)

(assert (=> b!1289200 (= res!855887 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29191))))

(declare-fun b!1289201 () Bool)

(declare-fun e!736301 () Bool)

(declare-fun tp_is_empty!34117 () Bool)

(assert (=> b!1289201 (= e!736301 tp_is_empty!34117)))

(declare-fun b!1289202 () Bool)

(declare-fun e!736302 () Bool)

(assert (=> b!1289202 (= e!736302 tp_is_empty!34117)))

(declare-fun b!1289203 () Bool)

(declare-fun res!855888 () Bool)

(assert (=> b!1289203 (=> (not res!855888) (not e!736303))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1289203 (= res!855888 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41706 _keys!1741))))))

(declare-fun b!1289204 () Bool)

(declare-fun res!855891 () Bool)

(assert (=> b!1289204 (=> (not res!855891) (not e!736303))))

(assert (=> b!1289204 (= res!855891 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41706 _keys!1741))))))

(declare-fun b!1289205 () Bool)

(declare-fun res!855890 () Bool)

(assert (=> b!1289205 (=> (not res!855890) (not e!736303))))

(declare-fun minValue!1387 () V!50593)

(declare-fun zeroValue!1387 () V!50593)

(declare-datatypes ((ValueCell!16160 0))(
  ( (ValueCellFull!16160 (v!19731 V!50593)) (EmptyCell!16160) )
))
(declare-datatypes ((array!85319 0))(
  ( (array!85320 (arr!41156 (Array (_ BitVec 32) ValueCell!16160)) (size!41707 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85319)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4901 (array!85317 array!85319 (_ BitVec 32) (_ BitVec 32) V!50593 V!50593 (_ BitVec 32) Int) ListLongMap!19669)

(assert (=> b!1289205 (= res!855890 (contains!7981 (getCurrentListMap!4901 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52736 () Bool)

(declare-fun mapRes!52736 () Bool)

(declare-fun tp!100550 () Bool)

(assert (=> mapNonEmpty!52736 (= mapRes!52736 (and tp!100550 e!736302))))

(declare-fun mapRest!52736 () (Array (_ BitVec 32) ValueCell!16160))

(declare-fun mapValue!52736 () ValueCell!16160)

(declare-fun mapKey!52736 () (_ BitVec 32))

(assert (=> mapNonEmpty!52736 (= (arr!41156 _values!1445) (store mapRest!52736 mapKey!52736 mapValue!52736))))

(declare-fun b!1289207 () Bool)

(declare-fun res!855886 () Bool)

(assert (=> b!1289207 (=> (not res!855886) (not e!736303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85317 (_ BitVec 32)) Bool)

(assert (=> b!1289207 (= res!855886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52736 () Bool)

(assert (=> mapIsEmpty!52736 mapRes!52736))

(declare-fun b!1289206 () Bool)

(declare-fun res!855885 () Bool)

(assert (=> b!1289206 (=> (not res!855885) (not e!736303))))

(assert (=> b!1289206 (= res!855885 (and (= (size!41707 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41706 _keys!1741) (size!41707 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!855889 () Bool)

(assert (=> start!109212 (=> (not res!855889) (not e!736303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109212 (= res!855889 (validMask!0 mask!2175))))

(assert (=> start!109212 e!736303))

(assert (=> start!109212 tp_is_empty!34117))

(assert (=> start!109212 true))

(declare-fun e!736304 () Bool)

(declare-fun array_inv!31415 (array!85319) Bool)

(assert (=> start!109212 (and (array_inv!31415 _values!1445) e!736304)))

(declare-fun array_inv!31416 (array!85317) Bool)

(assert (=> start!109212 (array_inv!31416 _keys!1741)))

(assert (=> start!109212 tp!100549))

(declare-fun b!1289208 () Bool)

(assert (=> b!1289208 (= e!736304 (and e!736301 mapRes!52736))))

(declare-fun condMapEmpty!52736 () Bool)

(declare-fun mapDefault!52736 () ValueCell!16160)

(assert (=> b!1289208 (= condMapEmpty!52736 (= (arr!41156 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16160)) mapDefault!52736)))))

(declare-fun b!1289209 () Bool)

(declare-fun res!855892 () Bool)

(assert (=> b!1289209 (=> (not res!855892) (not e!736303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289209 (= res!855892 (not (validKeyInArray!0 (select (arr!41155 _keys!1741) from!2144))))))

(assert (= (and start!109212 res!855889) b!1289206))

(assert (= (and b!1289206 res!855885) b!1289207))

(assert (= (and b!1289207 res!855886) b!1289200))

(assert (= (and b!1289200 res!855887) b!1289204))

(assert (= (and b!1289204 res!855891) b!1289205))

(assert (= (and b!1289205 res!855890) b!1289203))

(assert (= (and b!1289203 res!855888) b!1289209))

(assert (= (and b!1289209 res!855892) b!1289199))

(assert (= (and b!1289208 condMapEmpty!52736) mapIsEmpty!52736))

(assert (= (and b!1289208 (not condMapEmpty!52736)) mapNonEmpty!52736))

(get-info :version)

(assert (= (and mapNonEmpty!52736 ((_ is ValueCellFull!16160) mapValue!52736)) b!1289202))

(assert (= (and b!1289208 ((_ is ValueCellFull!16160) mapDefault!52736)) b!1289201))

(assert (= start!109212 b!1289208))

(declare-fun m!1182249 () Bool)

(assert (=> start!109212 m!1182249))

(declare-fun m!1182251 () Bool)

(assert (=> start!109212 m!1182251))

(declare-fun m!1182253 () Bool)

(assert (=> start!109212 m!1182253))

(declare-fun m!1182255 () Bool)

(assert (=> b!1289200 m!1182255))

(declare-fun m!1182257 () Bool)

(assert (=> b!1289207 m!1182257))

(declare-fun m!1182259 () Bool)

(assert (=> b!1289205 m!1182259))

(assert (=> b!1289205 m!1182259))

(declare-fun m!1182261 () Bool)

(assert (=> b!1289205 m!1182261))

(declare-fun m!1182263 () Bool)

(assert (=> b!1289199 m!1182263))

(declare-fun m!1182265 () Bool)

(assert (=> b!1289199 m!1182265))

(declare-fun m!1182267 () Bool)

(assert (=> b!1289209 m!1182267))

(assert (=> b!1289209 m!1182267))

(declare-fun m!1182269 () Bool)

(assert (=> b!1289209 m!1182269))

(declare-fun m!1182271 () Bool)

(assert (=> mapNonEmpty!52736 m!1182271))

(check-sat (not b_next!28477) (not b!1289199) tp_is_empty!34117 (not b!1289209) (not start!109212) b_and!46569 (not mapNonEmpty!52736) (not b!1289207) (not b!1289205) (not b!1289200))
(check-sat b_and!46569 (not b_next!28477))
