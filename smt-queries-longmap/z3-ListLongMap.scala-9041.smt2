; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109254 () Bool)

(assert start!109254)

(declare-fun b_free!28519 () Bool)

(declare-fun b_next!28519 () Bool)

(assert (=> start!109254 (= b_free!28519 (not b_next!28519))))

(declare-fun tp!100675 () Bool)

(declare-fun b_and!46611 () Bool)

(assert (=> start!109254 (= tp!100675 b_and!46611)))

(declare-fun b!1289930 () Bool)

(declare-fun e!736654 () Bool)

(declare-fun e!736656 () Bool)

(assert (=> b!1289930 (= e!736654 (not e!736656))))

(declare-fun res!856435 () Bool)

(assert (=> b!1289930 (=> res!856435 e!736656)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289930 (= res!856435 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50649 0))(
  ( (V!50650 (val!17154 Int)) )
))
(declare-datatypes ((tuple2!22040 0))(
  ( (tuple2!22041 (_1!11031 (_ BitVec 64)) (_2!11031 V!50649)) )
))
(declare-datatypes ((List!29225 0))(
  ( (Nil!29222) (Cons!29221 (h!30439 tuple2!22040) (t!42781 List!29225)) )
))
(declare-datatypes ((ListLongMap!19705 0))(
  ( (ListLongMap!19706 (toList!9868 List!29225)) )
))
(declare-fun contains!7999 (ListLongMap!19705 (_ BitVec 64)) Bool)

(assert (=> b!1289930 (not (contains!7999 (ListLongMap!19706 Nil!29222) k0!1205))))

(declare-datatypes ((Unit!42585 0))(
  ( (Unit!42586) )
))
(declare-fun lt!578522 () Unit!42585)

(declare-fun emptyContainsNothing!46 ((_ BitVec 64)) Unit!42585)

(assert (=> b!1289930 (= lt!578522 (emptyContainsNothing!46 k0!1205))))

(declare-fun mapNonEmpty!52799 () Bool)

(declare-fun mapRes!52799 () Bool)

(declare-fun tp!100676 () Bool)

(declare-fun e!736659 () Bool)

(assert (=> mapNonEmpty!52799 (= mapRes!52799 (and tp!100676 e!736659))))

(declare-datatypes ((ValueCell!16181 0))(
  ( (ValueCellFull!16181 (v!19752 V!50649)) (EmptyCell!16181) )
))
(declare-fun mapValue!52799 () ValueCell!16181)

(declare-datatypes ((array!85399 0))(
  ( (array!85400 (arr!41196 (Array (_ BitVec 32) ValueCell!16181)) (size!41747 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85399)

(declare-fun mapRest!52799 () (Array (_ BitVec 32) ValueCell!16181))

(declare-fun mapKey!52799 () (_ BitVec 32))

(assert (=> mapNonEmpty!52799 (= (arr!41196 _values!1445) (store mapRest!52799 mapKey!52799 mapValue!52799))))

(declare-fun b!1289931 () Bool)

(declare-fun res!856434 () Bool)

(assert (=> b!1289931 (=> (not res!856434) (not e!736654))))

(declare-datatypes ((array!85401 0))(
  ( (array!85402 (arr!41197 (Array (_ BitVec 32) (_ BitVec 64))) (size!41748 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85401)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289931 (= res!856434 (not (validKeyInArray!0 (select (arr!41197 _keys!1741) from!2144))))))

(declare-fun b!1289932 () Bool)

(declare-fun res!856431 () Bool)

(assert (=> b!1289932 (=> (not res!856431) (not e!736654))))

(declare-fun minValue!1387 () V!50649)

(declare-fun zeroValue!1387 () V!50649)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4916 (array!85401 array!85399 (_ BitVec 32) (_ BitVec 32) V!50649 V!50649 (_ BitVec 32) Int) ListLongMap!19705)

(assert (=> b!1289932 (= res!856431 (contains!7999 (getCurrentListMap!4916 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!856429 () Bool)

(assert (=> start!109254 (=> (not res!856429) (not e!736654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109254 (= res!856429 (validMask!0 mask!2175))))

(assert (=> start!109254 e!736654))

(declare-fun tp_is_empty!34159 () Bool)

(assert (=> start!109254 tp_is_empty!34159))

(assert (=> start!109254 true))

(declare-fun e!736655 () Bool)

(declare-fun array_inv!31445 (array!85399) Bool)

(assert (=> start!109254 (and (array_inv!31445 _values!1445) e!736655)))

(declare-fun array_inv!31446 (array!85401) Bool)

(assert (=> start!109254 (array_inv!31446 _keys!1741)))

(assert (=> start!109254 tp!100675))

(declare-fun b!1289933 () Bool)

(declare-fun res!856430 () Bool)

(assert (=> b!1289933 (=> (not res!856430) (not e!736654))))

(assert (=> b!1289933 (= res!856430 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41748 _keys!1741))))))

(declare-fun b!1289934 () Bool)

(declare-fun res!856427 () Bool)

(assert (=> b!1289934 (=> (not res!856427) (not e!736654))))

(assert (=> b!1289934 (= res!856427 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41748 _keys!1741))))))

(declare-fun b!1289935 () Bool)

(assert (=> b!1289935 (= e!736656 true)))

(declare-fun lt!578521 () ListLongMap!19705)

(declare-fun +!4374 (ListLongMap!19705 tuple2!22040) ListLongMap!19705)

(assert (=> b!1289935 (not (contains!7999 (+!4374 lt!578521 (tuple2!22041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578523 () Unit!42585)

(declare-fun addStillNotContains!350 (ListLongMap!19705 (_ BitVec 64) V!50649 (_ BitVec 64)) Unit!42585)

(assert (=> b!1289935 (= lt!578523 (addStillNotContains!350 lt!578521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6012 (array!85401 array!85399 (_ BitVec 32) (_ BitVec 32) V!50649 V!50649 (_ BitVec 32) Int) ListLongMap!19705)

(assert (=> b!1289935 (= lt!578521 (getCurrentListMapNoExtraKeys!6012 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289936 () Bool)

(declare-fun res!856428 () Bool)

(assert (=> b!1289936 (=> (not res!856428) (not e!736654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85401 (_ BitVec 32)) Bool)

(assert (=> b!1289936 (= res!856428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52799 () Bool)

(assert (=> mapIsEmpty!52799 mapRes!52799))

(declare-fun b!1289937 () Bool)

(assert (=> b!1289937 (= e!736659 tp_is_empty!34159)))

(declare-fun b!1289938 () Bool)

(declare-fun res!856433 () Bool)

(assert (=> b!1289938 (=> (not res!856433) (not e!736654))))

(assert (=> b!1289938 (= res!856433 (and (= (size!41747 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41748 _keys!1741) (size!41747 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289939 () Bool)

(declare-fun e!736658 () Bool)

(assert (=> b!1289939 (= e!736655 (and e!736658 mapRes!52799))))

(declare-fun condMapEmpty!52799 () Bool)

(declare-fun mapDefault!52799 () ValueCell!16181)

(assert (=> b!1289939 (= condMapEmpty!52799 (= (arr!41196 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16181)) mapDefault!52799)))))

(declare-fun b!1289940 () Bool)

(assert (=> b!1289940 (= e!736658 tp_is_empty!34159)))

(declare-fun b!1289941 () Bool)

(declare-fun res!856432 () Bool)

(assert (=> b!1289941 (=> (not res!856432) (not e!736654))))

(declare-datatypes ((List!29226 0))(
  ( (Nil!29223) (Cons!29222 (h!30440 (_ BitVec 64)) (t!42782 List!29226)) )
))
(declare-fun arrayNoDuplicates!0 (array!85401 (_ BitVec 32) List!29226) Bool)

(assert (=> b!1289941 (= res!856432 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29223))))

(assert (= (and start!109254 res!856429) b!1289938))

(assert (= (and b!1289938 res!856433) b!1289936))

(assert (= (and b!1289936 res!856428) b!1289941))

(assert (= (and b!1289941 res!856432) b!1289933))

(assert (= (and b!1289933 res!856430) b!1289932))

(assert (= (and b!1289932 res!856431) b!1289934))

(assert (= (and b!1289934 res!856427) b!1289931))

(assert (= (and b!1289931 res!856434) b!1289930))

(assert (= (and b!1289930 (not res!856435)) b!1289935))

(assert (= (and b!1289939 condMapEmpty!52799) mapIsEmpty!52799))

(assert (= (and b!1289939 (not condMapEmpty!52799)) mapNonEmpty!52799))

(get-info :version)

(assert (= (and mapNonEmpty!52799 ((_ is ValueCellFull!16181) mapValue!52799)) b!1289937))

(assert (= (and b!1289939 ((_ is ValueCellFull!16181) mapDefault!52799)) b!1289940))

(assert (= start!109254 b!1289939))

(declare-fun m!1182837 () Bool)

(assert (=> mapNonEmpty!52799 m!1182837))

(declare-fun m!1182839 () Bool)

(assert (=> b!1289932 m!1182839))

(assert (=> b!1289932 m!1182839))

(declare-fun m!1182841 () Bool)

(assert (=> b!1289932 m!1182841))

(declare-fun m!1182843 () Bool)

(assert (=> b!1289936 m!1182843))

(declare-fun m!1182845 () Bool)

(assert (=> b!1289931 m!1182845))

(assert (=> b!1289931 m!1182845))

(declare-fun m!1182847 () Bool)

(assert (=> b!1289931 m!1182847))

(declare-fun m!1182849 () Bool)

(assert (=> b!1289930 m!1182849))

(declare-fun m!1182851 () Bool)

(assert (=> b!1289930 m!1182851))

(declare-fun m!1182853 () Bool)

(assert (=> start!109254 m!1182853))

(declare-fun m!1182855 () Bool)

(assert (=> start!109254 m!1182855))

(declare-fun m!1182857 () Bool)

(assert (=> start!109254 m!1182857))

(declare-fun m!1182859 () Bool)

(assert (=> b!1289941 m!1182859))

(declare-fun m!1182861 () Bool)

(assert (=> b!1289935 m!1182861))

(assert (=> b!1289935 m!1182861))

(declare-fun m!1182863 () Bool)

(assert (=> b!1289935 m!1182863))

(declare-fun m!1182865 () Bool)

(assert (=> b!1289935 m!1182865))

(declare-fun m!1182867 () Bool)

(assert (=> b!1289935 m!1182867))

(check-sat (not b!1289935) b_and!46611 (not b!1289931) (not b!1289936) (not b!1289932) (not b!1289941) (not b_next!28519) (not start!109254) (not b!1289930) tp_is_empty!34159 (not mapNonEmpty!52799))
(check-sat b_and!46611 (not b_next!28519))
