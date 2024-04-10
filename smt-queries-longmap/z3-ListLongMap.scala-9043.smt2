; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109044 () Bool)

(assert start!109044)

(declare-fun b_free!28533 () Bool)

(declare-fun b_next!28533 () Bool)

(assert (=> start!109044 (= b_free!28533 (not b_next!28533))))

(declare-fun tp!100718 () Bool)

(declare-fun b_and!46623 () Bool)

(assert (=> start!109044 (= tp!100718 b_and!46623)))

(declare-fun b!1288877 () Bool)

(declare-fun e!735936 () Bool)

(declare-fun e!735934 () Bool)

(declare-fun mapRes!52820 () Bool)

(assert (=> b!1288877 (= e!735936 (and e!735934 mapRes!52820))))

(declare-fun condMapEmpty!52820 () Bool)

(declare-datatypes ((V!50667 0))(
  ( (V!50668 (val!17161 Int)) )
))
(declare-datatypes ((ValueCell!16188 0))(
  ( (ValueCellFull!16188 (v!19764 V!50667)) (EmptyCell!16188) )
))
(declare-datatypes ((array!85390 0))(
  ( (array!85391 (arr!41196 (Array (_ BitVec 32) ValueCell!16188)) (size!41746 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85390)

(declare-fun mapDefault!52820 () ValueCell!16188)

(assert (=> b!1288877 (= condMapEmpty!52820 (= (arr!41196 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16188)) mapDefault!52820)))))

(declare-fun res!856104 () Bool)

(declare-fun e!735933 () Bool)

(assert (=> start!109044 (=> (not res!856104) (not e!735933))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109044 (= res!856104 (validMask!0 mask!2175))))

(assert (=> start!109044 e!735933))

(declare-fun tp_is_empty!34173 () Bool)

(assert (=> start!109044 tp_is_empty!34173))

(assert (=> start!109044 true))

(declare-fun array_inv!31233 (array!85390) Bool)

(assert (=> start!109044 (and (array_inv!31233 _values!1445) e!735936)))

(declare-datatypes ((array!85392 0))(
  ( (array!85393 (arr!41197 (Array (_ BitVec 32) (_ BitVec 64))) (size!41747 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85392)

(declare-fun array_inv!31234 (array!85392) Bool)

(assert (=> start!109044 (array_inv!31234 _keys!1741)))

(assert (=> start!109044 tp!100718))

(declare-fun b!1288878 () Bool)

(declare-fun e!735937 () Bool)

(assert (=> b!1288878 (= e!735937 true)))

(declare-datatypes ((tuple2!22036 0))(
  ( (tuple2!22037 (_1!11029 (_ BitVec 64)) (_2!11029 V!50667)) )
))
(declare-datatypes ((List!29207 0))(
  ( (Nil!29204) (Cons!29203 (h!30412 tuple2!22036) (t!42771 List!29207)) )
))
(declare-datatypes ((ListLongMap!19693 0))(
  ( (ListLongMap!19694 (toList!9862 List!29207)) )
))
(declare-fun lt!578100 () ListLongMap!19693)

(declare-fun zeroValue!1387 () V!50667)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7980 (ListLongMap!19693 (_ BitVec 64)) Bool)

(declare-fun +!4334 (ListLongMap!19693 tuple2!22036) ListLongMap!19693)

(assert (=> b!1288878 (not (contains!7980 (+!4334 lt!578100 (tuple2!22037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42642 0))(
  ( (Unit!42643) )
))
(declare-fun lt!578102 () Unit!42642)

(declare-fun addStillNotContains!352 (ListLongMap!19693 (_ BitVec 64) V!50667 (_ BitVec 64)) Unit!42642)

(assert (=> b!1288878 (= lt!578102 (addStillNotContains!352 lt!578100 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50667)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5965 (array!85392 array!85390 (_ BitVec 32) (_ BitVec 32) V!50667 V!50667 (_ BitVec 32) Int) ListLongMap!19693)

(assert (=> b!1288878 (= lt!578100 (getCurrentListMapNoExtraKeys!5965 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288879 () Bool)

(declare-fun res!856103 () Bool)

(assert (=> b!1288879 (=> (not res!856103) (not e!735933))))

(declare-datatypes ((List!29208 0))(
  ( (Nil!29205) (Cons!29204 (h!30413 (_ BitVec 64)) (t!42772 List!29208)) )
))
(declare-fun arrayNoDuplicates!0 (array!85392 (_ BitVec 32) List!29208) Bool)

(assert (=> b!1288879 (= res!856103 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29205))))

(declare-fun b!1288880 () Bool)

(assert (=> b!1288880 (= e!735934 tp_is_empty!34173)))

(declare-fun b!1288881 () Bool)

(declare-fun res!856098 () Bool)

(assert (=> b!1288881 (=> (not res!856098) (not e!735933))))

(assert (=> b!1288881 (= res!856098 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41747 _keys!1741))))))

(declare-fun b!1288882 () Bool)

(declare-fun res!856099 () Bool)

(assert (=> b!1288882 (=> (not res!856099) (not e!735933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288882 (= res!856099 (not (validKeyInArray!0 (select (arr!41197 _keys!1741) from!2144))))))

(declare-fun b!1288883 () Bool)

(declare-fun res!856097 () Bool)

(assert (=> b!1288883 (=> (not res!856097) (not e!735933))))

(declare-fun getCurrentListMap!4924 (array!85392 array!85390 (_ BitVec 32) (_ BitVec 32) V!50667 V!50667 (_ BitVec 32) Int) ListLongMap!19693)

(assert (=> b!1288883 (= res!856097 (contains!7980 (getCurrentListMap!4924 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288884 () Bool)

(declare-fun res!856102 () Bool)

(assert (=> b!1288884 (=> (not res!856102) (not e!735933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85392 (_ BitVec 32)) Bool)

(assert (=> b!1288884 (= res!856102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288885 () Bool)

(declare-fun res!856096 () Bool)

(assert (=> b!1288885 (=> (not res!856096) (not e!735933))))

(assert (=> b!1288885 (= res!856096 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41747 _keys!1741))))))

(declare-fun b!1288886 () Bool)

(assert (=> b!1288886 (= e!735933 (not e!735937))))

(declare-fun res!856100 () Bool)

(assert (=> b!1288886 (=> res!856100 e!735937)))

(assert (=> b!1288886 (= res!856100 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288886 (not (contains!7980 (ListLongMap!19694 Nil!29204) k0!1205))))

(declare-fun lt!578101 () Unit!42642)

(declare-fun emptyContainsNothing!50 ((_ BitVec 64)) Unit!42642)

(assert (=> b!1288886 (= lt!578101 (emptyContainsNothing!50 k0!1205))))

(declare-fun mapNonEmpty!52820 () Bool)

(declare-fun tp!100717 () Bool)

(declare-fun e!735935 () Bool)

(assert (=> mapNonEmpty!52820 (= mapRes!52820 (and tp!100717 e!735935))))

(declare-fun mapRest!52820 () (Array (_ BitVec 32) ValueCell!16188))

(declare-fun mapValue!52820 () ValueCell!16188)

(declare-fun mapKey!52820 () (_ BitVec 32))

(assert (=> mapNonEmpty!52820 (= (arr!41196 _values!1445) (store mapRest!52820 mapKey!52820 mapValue!52820))))

(declare-fun b!1288887 () Bool)

(assert (=> b!1288887 (= e!735935 tp_is_empty!34173)))

(declare-fun mapIsEmpty!52820 () Bool)

(assert (=> mapIsEmpty!52820 mapRes!52820))

(declare-fun b!1288888 () Bool)

(declare-fun res!856101 () Bool)

(assert (=> b!1288888 (=> (not res!856101) (not e!735933))))

(assert (=> b!1288888 (= res!856101 (and (= (size!41746 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41747 _keys!1741) (size!41746 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109044 res!856104) b!1288888))

(assert (= (and b!1288888 res!856101) b!1288884))

(assert (= (and b!1288884 res!856102) b!1288879))

(assert (= (and b!1288879 res!856103) b!1288885))

(assert (= (and b!1288885 res!856096) b!1288883))

(assert (= (and b!1288883 res!856097) b!1288881))

(assert (= (and b!1288881 res!856098) b!1288882))

(assert (= (and b!1288882 res!856099) b!1288886))

(assert (= (and b!1288886 (not res!856100)) b!1288878))

(assert (= (and b!1288877 condMapEmpty!52820) mapIsEmpty!52820))

(assert (= (and b!1288877 (not condMapEmpty!52820)) mapNonEmpty!52820))

(get-info :version)

(assert (= (and mapNonEmpty!52820 ((_ is ValueCellFull!16188) mapValue!52820)) b!1288887))

(assert (= (and b!1288877 ((_ is ValueCellFull!16188) mapDefault!52820)) b!1288880))

(assert (= start!109044 b!1288877))

(declare-fun m!1181443 () Bool)

(assert (=> b!1288879 m!1181443))

(declare-fun m!1181445 () Bool)

(assert (=> b!1288878 m!1181445))

(assert (=> b!1288878 m!1181445))

(declare-fun m!1181447 () Bool)

(assert (=> b!1288878 m!1181447))

(declare-fun m!1181449 () Bool)

(assert (=> b!1288878 m!1181449))

(declare-fun m!1181451 () Bool)

(assert (=> b!1288878 m!1181451))

(declare-fun m!1181453 () Bool)

(assert (=> mapNonEmpty!52820 m!1181453))

(declare-fun m!1181455 () Bool)

(assert (=> b!1288886 m!1181455))

(declare-fun m!1181457 () Bool)

(assert (=> b!1288886 m!1181457))

(declare-fun m!1181459 () Bool)

(assert (=> start!109044 m!1181459))

(declare-fun m!1181461 () Bool)

(assert (=> start!109044 m!1181461))

(declare-fun m!1181463 () Bool)

(assert (=> start!109044 m!1181463))

(declare-fun m!1181465 () Bool)

(assert (=> b!1288882 m!1181465))

(assert (=> b!1288882 m!1181465))

(declare-fun m!1181467 () Bool)

(assert (=> b!1288882 m!1181467))

(declare-fun m!1181469 () Bool)

(assert (=> b!1288883 m!1181469))

(assert (=> b!1288883 m!1181469))

(declare-fun m!1181471 () Bool)

(assert (=> b!1288883 m!1181471))

(declare-fun m!1181473 () Bool)

(assert (=> b!1288884 m!1181473))

(check-sat (not b!1288882) tp_is_empty!34173 (not b!1288883) (not b!1288878) (not mapNonEmpty!52820) (not b!1288886) (not b!1288884) (not b_next!28533) (not b!1288879) b_and!46623 (not start!109044))
(check-sat b_and!46623 (not b_next!28533))
