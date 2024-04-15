; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108540 () Bool)

(assert start!108540)

(declare-fun b_free!28087 () Bool)

(declare-fun b_next!28087 () Bool)

(assert (=> start!108540 (= b_free!28087 (not b_next!28087))))

(declare-fun tp!99371 () Bool)

(declare-fun b_and!46129 () Bool)

(assert (=> start!108540 (= tp!99371 b_and!46129)))

(declare-fun b!1281141 () Bool)

(declare-fun res!851047 () Bool)

(declare-fun e!731987 () Bool)

(assert (=> b!1281141 (=> (not res!851047) (not e!731987))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50073 0))(
  ( (V!50074 (val!16938 Int)) )
))
(declare-datatypes ((ValueCell!15965 0))(
  ( (ValueCellFull!15965 (v!19537 V!50073)) (EmptyCell!15965) )
))
(declare-datatypes ((array!84421 0))(
  ( (array!84422 (arr!40715 (Array (_ BitVec 32) ValueCell!15965)) (size!41267 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84421)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84423 0))(
  ( (array!84424 (arr!40716 (Array (_ BitVec 32) (_ BitVec 64))) (size!41268 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84423)

(assert (=> b!1281141 (= res!851047 (and (= (size!41267 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41268 _keys!1741) (size!41267 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281142 () Bool)

(declare-fun res!851046 () Bool)

(assert (=> b!1281142 (=> (not res!851046) (not e!731987))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1281142 (= res!851046 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41268 _keys!1741)) (not (= (select (arr!40716 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!851042 () Bool)

(assert (=> start!108540 (=> (not res!851042) (not e!731987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108540 (= res!851042 (validMask!0 mask!2175))))

(assert (=> start!108540 e!731987))

(declare-fun tp_is_empty!33727 () Bool)

(assert (=> start!108540 tp_is_empty!33727))

(assert (=> start!108540 true))

(declare-fun e!731990 () Bool)

(declare-fun array_inv!31057 (array!84421) Bool)

(assert (=> start!108540 (and (array_inv!31057 _values!1445) e!731990)))

(declare-fun array_inv!31058 (array!84423) Bool)

(assert (=> start!108540 (array_inv!31058 _keys!1741)))

(assert (=> start!108540 tp!99371))

(declare-fun mapIsEmpty!52142 () Bool)

(declare-fun mapRes!52142 () Bool)

(assert (=> mapIsEmpty!52142 mapRes!52142))

(declare-fun b!1281143 () Bool)

(declare-fun res!851043 () Bool)

(assert (=> b!1281143 (=> (not res!851043) (not e!731987))))

(assert (=> b!1281143 (= res!851043 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41268 _keys!1741))))))

(declare-fun b!1281144 () Bool)

(declare-fun res!851045 () Bool)

(assert (=> b!1281144 (=> (not res!851045) (not e!731987))))

(declare-fun minValue!1387 () V!50073)

(declare-fun zeroValue!1387 () V!50073)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21754 0))(
  ( (tuple2!21755 (_1!10888 (_ BitVec 64)) (_2!10888 V!50073)) )
))
(declare-datatypes ((List!28945 0))(
  ( (Nil!28942) (Cons!28941 (h!30150 tuple2!21754) (t!42477 List!28945)) )
))
(declare-datatypes ((ListLongMap!19411 0))(
  ( (ListLongMap!19412 (toList!9721 List!28945)) )
))
(declare-fun contains!7766 (ListLongMap!19411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4695 (array!84423 array!84421 (_ BitVec 32) (_ BitVec 32) V!50073 V!50073 (_ BitVec 32) Int) ListLongMap!19411)

(assert (=> b!1281144 (= res!851045 (contains!7766 (getCurrentListMap!4695 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52142 () Bool)

(declare-fun tp!99372 () Bool)

(declare-fun e!731991 () Bool)

(assert (=> mapNonEmpty!52142 (= mapRes!52142 (and tp!99372 e!731991))))

(declare-fun mapValue!52142 () ValueCell!15965)

(declare-fun mapRest!52142 () (Array (_ BitVec 32) ValueCell!15965))

(declare-fun mapKey!52142 () (_ BitVec 32))

(assert (=> mapNonEmpty!52142 (= (arr!40715 _values!1445) (store mapRest!52142 mapKey!52142 mapValue!52142))))

(declare-fun b!1281145 () Bool)

(declare-fun res!851044 () Bool)

(assert (=> b!1281145 (=> (not res!851044) (not e!731987))))

(declare-datatypes ((List!28946 0))(
  ( (Nil!28943) (Cons!28942 (h!30151 (_ BitVec 64)) (t!42478 List!28946)) )
))
(declare-fun arrayNoDuplicates!0 (array!84423 (_ BitVec 32) List!28946) Bool)

(assert (=> b!1281145 (= res!851044 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28943))))

(declare-fun b!1281146 () Bool)

(declare-fun res!851048 () Bool)

(assert (=> b!1281146 (=> (not res!851048) (not e!731987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84423 (_ BitVec 32)) Bool)

(assert (=> b!1281146 (= res!851048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281147 () Bool)

(assert (=> b!1281147 (= e!731991 tp_is_empty!33727)))

(declare-fun b!1281148 () Bool)

(declare-fun e!731988 () Bool)

(assert (=> b!1281148 (= e!731988 tp_is_empty!33727)))

(declare-fun b!1281149 () Bool)

(assert (=> b!1281149 (= e!731987 (not true))))

(assert (=> b!1281149 (contains!7766 (getCurrentListMap!4695 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42267 0))(
  ( (Unit!42268) )
))
(declare-fun lt!576025 () Unit!42267)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!15 (array!84423 array!84421 (_ BitVec 32) (_ BitVec 32) V!50073 V!50073 (_ BitVec 64) (_ BitVec 32) Int) Unit!42267)

(assert (=> b!1281149 (= lt!576025 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!15 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281150 () Bool)

(assert (=> b!1281150 (= e!731990 (and e!731988 mapRes!52142))))

(declare-fun condMapEmpty!52142 () Bool)

(declare-fun mapDefault!52142 () ValueCell!15965)

(assert (=> b!1281150 (= condMapEmpty!52142 (= (arr!40715 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15965)) mapDefault!52142)))))

(assert (= (and start!108540 res!851042) b!1281141))

(assert (= (and b!1281141 res!851047) b!1281146))

(assert (= (and b!1281146 res!851048) b!1281145))

(assert (= (and b!1281145 res!851044) b!1281143))

(assert (= (and b!1281143 res!851043) b!1281144))

(assert (= (and b!1281144 res!851045) b!1281142))

(assert (= (and b!1281142 res!851046) b!1281149))

(assert (= (and b!1281150 condMapEmpty!52142) mapIsEmpty!52142))

(assert (= (and b!1281150 (not condMapEmpty!52142)) mapNonEmpty!52142))

(get-info :version)

(assert (= (and mapNonEmpty!52142 ((_ is ValueCellFull!15965) mapValue!52142)) b!1281147))

(assert (= (and b!1281150 ((_ is ValueCellFull!15965) mapDefault!52142)) b!1281148))

(assert (= start!108540 b!1281150))

(declare-fun m!1175169 () Bool)

(assert (=> b!1281149 m!1175169))

(assert (=> b!1281149 m!1175169))

(declare-fun m!1175171 () Bool)

(assert (=> b!1281149 m!1175171))

(declare-fun m!1175173 () Bool)

(assert (=> b!1281149 m!1175173))

(declare-fun m!1175175 () Bool)

(assert (=> b!1281145 m!1175175))

(declare-fun m!1175177 () Bool)

(assert (=> start!108540 m!1175177))

(declare-fun m!1175179 () Bool)

(assert (=> start!108540 m!1175179))

(declare-fun m!1175181 () Bool)

(assert (=> start!108540 m!1175181))

(declare-fun m!1175183 () Bool)

(assert (=> b!1281144 m!1175183))

(assert (=> b!1281144 m!1175183))

(declare-fun m!1175185 () Bool)

(assert (=> b!1281144 m!1175185))

(declare-fun m!1175187 () Bool)

(assert (=> b!1281142 m!1175187))

(declare-fun m!1175189 () Bool)

(assert (=> b!1281146 m!1175189))

(declare-fun m!1175191 () Bool)

(assert (=> mapNonEmpty!52142 m!1175191))

(check-sat (not b!1281149) (not b!1281146) (not mapNonEmpty!52142) (not b!1281144) (not start!108540) b_and!46129 (not b_next!28087) tp_is_empty!33727 (not b!1281145))
(check-sat b_and!46129 (not b_next!28087))
