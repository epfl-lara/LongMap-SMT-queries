; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108412 () Bool)

(assert start!108412)

(declare-fun b_free!27959 () Bool)

(declare-fun b_next!27959 () Bool)

(assert (=> start!108412 (= b_free!27959 (not b_next!27959))))

(declare-fun tp!98987 () Bool)

(declare-fun b_and!46019 () Bool)

(assert (=> start!108412 (= tp!98987 b_and!46019)))

(declare-fun res!849953 () Bool)

(declare-fun e!731059 () Bool)

(assert (=> start!108412 (=> (not res!849953) (not e!731059))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108412 (= res!849953 (validMask!0 mask!2175))))

(assert (=> start!108412 e!731059))

(declare-fun tp_is_empty!33599 () Bool)

(assert (=> start!108412 tp_is_empty!33599))

(assert (=> start!108412 true))

(declare-datatypes ((V!49901 0))(
  ( (V!49902 (val!16874 Int)) )
))
(declare-datatypes ((ValueCell!15901 0))(
  ( (ValueCellFull!15901 (v!19474 V!49901)) (EmptyCell!15901) )
))
(declare-datatypes ((array!84284 0))(
  ( (array!84285 (arr!40646 (Array (_ BitVec 32) ValueCell!15901)) (size!41196 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84284)

(declare-fun e!731058 () Bool)

(declare-fun array_inv!30857 (array!84284) Bool)

(assert (=> start!108412 (and (array_inv!30857 _values!1445) e!731058)))

(declare-datatypes ((array!84286 0))(
  ( (array!84287 (arr!40647 (Array (_ BitVec 32) (_ BitVec 64))) (size!41197 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84286)

(declare-fun array_inv!30858 (array!84286) Bool)

(assert (=> start!108412 (array_inv!30858 _keys!1741)))

(assert (=> start!108412 tp!98987))

(declare-fun b!1279512 () Bool)

(declare-fun res!849955 () Bool)

(assert (=> b!1279512 (=> (not res!849955) (not e!731059))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279512 (= res!849955 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41197 _keys!1741))))))

(declare-fun mapIsEmpty!51950 () Bool)

(declare-fun mapRes!51950 () Bool)

(assert (=> mapIsEmpty!51950 mapRes!51950))

(declare-fun b!1279513 () Bool)

(declare-fun res!849952 () Bool)

(assert (=> b!1279513 (=> (not res!849952) (not e!731059))))

(declare-datatypes ((List!28789 0))(
  ( (Nil!28786) (Cons!28785 (h!29994 (_ BitVec 64)) (t!42329 List!28789)) )
))
(declare-fun arrayNoDuplicates!0 (array!84286 (_ BitVec 32) List!28789) Bool)

(assert (=> b!1279513 (= res!849952 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28786))))

(declare-fun b!1279514 () Bool)

(declare-fun e!731057 () Bool)

(assert (=> b!1279514 (= e!731057 tp_is_empty!33599)))

(declare-fun mapNonEmpty!51950 () Bool)

(declare-fun tp!98986 () Bool)

(declare-fun e!731060 () Bool)

(assert (=> mapNonEmpty!51950 (= mapRes!51950 (and tp!98986 e!731060))))

(declare-fun mapRest!51950 () (Array (_ BitVec 32) ValueCell!15901))

(declare-fun mapValue!51950 () ValueCell!15901)

(declare-fun mapKey!51950 () (_ BitVec 32))

(assert (=> mapNonEmpty!51950 (= (arr!40646 _values!1445) (store mapRest!51950 mapKey!51950 mapValue!51950))))

(declare-fun b!1279515 () Bool)

(declare-fun res!849954 () Bool)

(assert (=> b!1279515 (=> (not res!849954) (not e!731059))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279515 (= res!849954 (and (= (size!41196 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41197 _keys!1741) (size!41196 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279516 () Bool)

(declare-fun res!849956 () Bool)

(assert (=> b!1279516 (=> (not res!849956) (not e!731059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84286 (_ BitVec 32)) Bool)

(assert (=> b!1279516 (= res!849956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279517 () Bool)

(assert (=> b!1279517 (= e!731059 false)))

(declare-fun minValue!1387 () V!49901)

(declare-fun zeroValue!1387 () V!49901)

(declare-fun lt!576020 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21590 0))(
  ( (tuple2!21591 (_1!10806 (_ BitVec 64)) (_2!10806 V!49901)) )
))
(declare-datatypes ((List!28790 0))(
  ( (Nil!28787) (Cons!28786 (h!29995 tuple2!21590) (t!42330 List!28790)) )
))
(declare-datatypes ((ListLongMap!19247 0))(
  ( (ListLongMap!19248 (toList!9639 List!28790)) )
))
(declare-fun contains!7754 (ListLongMap!19247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4723 (array!84286 array!84284 (_ BitVec 32) (_ BitVec 32) V!49901 V!49901 (_ BitVec 32) Int) ListLongMap!19247)

(assert (=> b!1279517 (= lt!576020 (contains!7754 (getCurrentListMap!4723 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279518 () Bool)

(assert (=> b!1279518 (= e!731058 (and e!731057 mapRes!51950))))

(declare-fun condMapEmpty!51950 () Bool)

(declare-fun mapDefault!51950 () ValueCell!15901)

