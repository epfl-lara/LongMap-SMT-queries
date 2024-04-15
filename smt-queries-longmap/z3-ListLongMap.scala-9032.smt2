; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108976 () Bool)

(assert start!108976)

(declare-fun b_free!28465 () Bool)

(declare-fun b_next!28465 () Bool)

(assert (=> start!108976 (= b_free!28465 (not b_next!28465))))

(declare-fun tp!100514 () Bool)

(declare-fun b_and!46537 () Bool)

(assert (=> start!108976 (= tp!100514 b_and!46537)))

(declare-fun res!855194 () Bool)

(declare-fun e!735338 () Bool)

(assert (=> start!108976 (=> (not res!855194) (not e!735338))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108976 (= res!855194 (validMask!0 mask!2175))))

(assert (=> start!108976 e!735338))

(declare-fun tp_is_empty!34105 () Bool)

(assert (=> start!108976 tp_is_empty!34105))

(assert (=> start!108976 true))

(declare-datatypes ((V!50577 0))(
  ( (V!50578 (val!17127 Int)) )
))
(declare-datatypes ((ValueCell!16154 0))(
  ( (ValueCellFull!16154 (v!19729 V!50577)) (EmptyCell!16154) )
))
(declare-datatypes ((array!85149 0))(
  ( (array!85150 (arr!41076 (Array (_ BitVec 32) ValueCell!16154)) (size!41628 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85149)

(declare-fun e!735335 () Bool)

(declare-fun array_inv!31303 (array!85149) Bool)

(assert (=> start!108976 (and (array_inv!31303 _values!1445) e!735335)))

(declare-datatypes ((array!85151 0))(
  ( (array!85152 (arr!41077 (Array (_ BitVec 32) (_ BitVec 64))) (size!41629 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85151)

(declare-fun array_inv!31304 (array!85151) Bool)

(assert (=> start!108976 (array_inv!31304 _keys!1741)))

(assert (=> start!108976 tp!100514))

(declare-fun b!1287632 () Bool)

(declare-fun res!855198 () Bool)

(assert (=> b!1287632 (=> (not res!855198) (not e!735338))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1287632 (= res!855198 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41629 _keys!1741))))))

(declare-fun b!1287633 () Bool)

(declare-fun e!735336 () Bool)

(declare-fun mapRes!52718 () Bool)

(assert (=> b!1287633 (= e!735335 (and e!735336 mapRes!52718))))

(declare-fun condMapEmpty!52718 () Bool)

(declare-fun mapDefault!52718 () ValueCell!16154)

(assert (=> b!1287633 (= condMapEmpty!52718 (= (arr!41076 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16154)) mapDefault!52718)))))

(declare-fun b!1287634 () Bool)

(declare-fun res!855200 () Bool)

(assert (=> b!1287634 (=> (not res!855200) (not e!735338))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287634 (= res!855200 (and (= (size!41628 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41629 _keys!1741) (size!41628 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287635 () Bool)

(declare-fun e!735339 () Bool)

(assert (=> b!1287635 (= e!735339 tp_is_empty!34105)))

(declare-fun b!1287636 () Bool)

(declare-fun res!855195 () Bool)

(assert (=> b!1287636 (=> (not res!855195) (not e!735338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85151 (_ BitVec 32)) Bool)

(assert (=> b!1287636 (= res!855195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287637 () Bool)

(declare-fun res!855197 () Bool)

(assert (=> b!1287637 (=> (not res!855197) (not e!735338))))

(declare-fun minValue!1387 () V!50577)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!50577)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22034 0))(
  ( (tuple2!22035 (_1!11028 (_ BitVec 64)) (_2!11028 V!50577)) )
))
(declare-datatypes ((List!29206 0))(
  ( (Nil!29203) (Cons!29202 (h!30411 tuple2!22034) (t!42762 List!29206)) )
))
(declare-datatypes ((ListLongMap!19691 0))(
  ( (ListLongMap!19692 (toList!9861 List!29206)) )
))
(declare-fun contains!7909 (ListLongMap!19691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4823 (array!85151 array!85149 (_ BitVec 32) (_ BitVec 32) V!50577 V!50577 (_ BitVec 32) Int) ListLongMap!19691)

(assert (=> b!1287637 (= res!855197 (contains!7909 (getCurrentListMap!4823 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287638 () Bool)

(assert (=> b!1287638 (= e!735338 (not true))))

(assert (=> b!1287638 (not (contains!7909 (ListLongMap!19692 Nil!29203) k0!1205))))

(declare-datatypes ((Unit!42428 0))(
  ( (Unit!42429) )
))
(declare-fun lt!577711 () Unit!42428)

(declare-fun emptyContainsNothing!21 ((_ BitVec 64)) Unit!42428)

(assert (=> b!1287638 (= lt!577711 (emptyContainsNothing!21 k0!1205))))

(declare-fun b!1287639 () Bool)

(declare-fun res!855201 () Bool)

(assert (=> b!1287639 (=> (not res!855201) (not e!735338))))

(declare-datatypes ((List!29207 0))(
  ( (Nil!29204) (Cons!29203 (h!30412 (_ BitVec 64)) (t!42763 List!29207)) )
))
(declare-fun arrayNoDuplicates!0 (array!85151 (_ BitVec 32) List!29207) Bool)

(assert (=> b!1287639 (= res!855201 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29204))))

(declare-fun b!1287640 () Bool)

(assert (=> b!1287640 (= e!735336 tp_is_empty!34105)))

(declare-fun mapIsEmpty!52718 () Bool)

(assert (=> mapIsEmpty!52718 mapRes!52718))

(declare-fun b!1287641 () Bool)

(declare-fun res!855199 () Bool)

(assert (=> b!1287641 (=> (not res!855199) (not e!735338))))

(assert (=> b!1287641 (= res!855199 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41629 _keys!1741))))))

(declare-fun b!1287642 () Bool)

(declare-fun res!855196 () Bool)

(assert (=> b!1287642 (=> (not res!855196) (not e!735338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287642 (= res!855196 (not (validKeyInArray!0 (select (arr!41077 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52718 () Bool)

(declare-fun tp!100515 () Bool)

(assert (=> mapNonEmpty!52718 (= mapRes!52718 (and tp!100515 e!735339))))

(declare-fun mapValue!52718 () ValueCell!16154)

(declare-fun mapRest!52718 () (Array (_ BitVec 32) ValueCell!16154))

(declare-fun mapKey!52718 () (_ BitVec 32))

(assert (=> mapNonEmpty!52718 (= (arr!41076 _values!1445) (store mapRest!52718 mapKey!52718 mapValue!52718))))

(assert (= (and start!108976 res!855194) b!1287634))

(assert (= (and b!1287634 res!855200) b!1287636))

(assert (= (and b!1287636 res!855195) b!1287639))

(assert (= (and b!1287639 res!855201) b!1287632))

(assert (= (and b!1287632 res!855198) b!1287637))

(assert (= (and b!1287637 res!855197) b!1287641))

(assert (= (and b!1287641 res!855199) b!1287642))

(assert (= (and b!1287642 res!855196) b!1287638))

(assert (= (and b!1287633 condMapEmpty!52718) mapIsEmpty!52718))

(assert (= (and b!1287633 (not condMapEmpty!52718)) mapNonEmpty!52718))

(get-info :version)

(assert (= (and mapNonEmpty!52718 ((_ is ValueCellFull!16154) mapValue!52718)) b!1287635))

(assert (= (and b!1287633 ((_ is ValueCellFull!16154) mapDefault!52718)) b!1287640))

(assert (= start!108976 b!1287633))

(declare-fun m!1179987 () Bool)

(assert (=> b!1287639 m!1179987))

(declare-fun m!1179989 () Bool)

(assert (=> b!1287636 m!1179989))

(declare-fun m!1179991 () Bool)

(assert (=> mapNonEmpty!52718 m!1179991))

(declare-fun m!1179993 () Bool)

(assert (=> b!1287638 m!1179993))

(declare-fun m!1179995 () Bool)

(assert (=> b!1287638 m!1179995))

(declare-fun m!1179997 () Bool)

(assert (=> b!1287637 m!1179997))

(assert (=> b!1287637 m!1179997))

(declare-fun m!1179999 () Bool)

(assert (=> b!1287637 m!1179999))

(declare-fun m!1180001 () Bool)

(assert (=> start!108976 m!1180001))

(declare-fun m!1180003 () Bool)

(assert (=> start!108976 m!1180003))

(declare-fun m!1180005 () Bool)

(assert (=> start!108976 m!1180005))

(declare-fun m!1180007 () Bool)

(assert (=> b!1287642 m!1180007))

(assert (=> b!1287642 m!1180007))

(declare-fun m!1180009 () Bool)

(assert (=> b!1287642 m!1180009))

(check-sat (not b!1287638) (not start!108976) (not mapNonEmpty!52718) (not b!1287642) (not b!1287637) (not b_next!28465) (not b!1287639) b_and!46537 (not b!1287636) tp_is_empty!34105)
(check-sat b_and!46537 (not b_next!28465))
