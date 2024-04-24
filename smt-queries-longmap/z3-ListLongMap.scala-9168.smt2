; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110382 () Bool)

(assert start!110382)

(declare-fun b_free!29281 () Bool)

(declare-fun b_next!29281 () Bool)

(assert (=> start!110382 (= b_free!29281 (not b_next!29281))))

(declare-fun tp!103000 () Bool)

(declare-fun b_and!47463 () Bool)

(assert (=> start!110382 (= tp!103000 b_and!47463)))

(declare-fun mapIsEmpty!53981 () Bool)

(declare-fun mapRes!53981 () Bool)

(assert (=> mapIsEmpty!53981 mapRes!53981))

(declare-fun b!1305571 () Bool)

(declare-fun e!744806 () Bool)

(declare-fun e!744807 () Bool)

(assert (=> b!1305571 (= e!744806 (and e!744807 mapRes!53981))))

(declare-fun condMapEmpty!53981 () Bool)

(declare-datatypes ((V!51665 0))(
  ( (V!51666 (val!17535 Int)) )
))
(declare-datatypes ((ValueCell!16562 0))(
  ( (ValueCellFull!16562 (v!20149 V!51665)) (EmptyCell!16562) )
))
(declare-datatypes ((array!86899 0))(
  ( (array!86900 (arr!41934 (Array (_ BitVec 32) ValueCell!16562)) (size!42485 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86899)

(declare-fun mapDefault!53981 () ValueCell!16562)

(assert (=> b!1305571 (= condMapEmpty!53981 (= (arr!41934 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16562)) mapDefault!53981)))))

(declare-fun b!1305572 () Bool)

(declare-fun res!866719 () Bool)

(declare-fun e!744805 () Bool)

(assert (=> b!1305572 (=> (not res!866719) (not e!744805))))

(declare-fun minValue!1387 () V!51665)

(declare-fun zeroValue!1387 () V!51665)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86901 0))(
  ( (array!86902 (arr!41935 (Array (_ BitVec 32) (_ BitVec 64))) (size!42486 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86901)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22656 0))(
  ( (tuple2!22657 (_1!11339 (_ BitVec 64)) (_2!11339 V!51665)) )
))
(declare-datatypes ((List!29802 0))(
  ( (Nil!29799) (Cons!29798 (h!31016 tuple2!22656) (t!43392 List!29802)) )
))
(declare-datatypes ((ListLongMap!20321 0))(
  ( (ListLongMap!20322 (toList!10176 List!29802)) )
))
(declare-fun contains!8328 (ListLongMap!20321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5185 (array!86901 array!86899 (_ BitVec 32) (_ BitVec 32) V!51665 V!51665 (_ BitVec 32) Int) ListLongMap!20321)

(assert (=> b!1305572 (= res!866719 (contains!8328 (getCurrentListMap!5185 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305573 () Bool)

(declare-fun res!866716 () Bool)

(assert (=> b!1305573 (=> (not res!866716) (not e!744805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86901 (_ BitVec 32)) Bool)

(assert (=> b!1305573 (= res!866716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1305574 () Bool)

(declare-fun res!866724 () Bool)

(assert (=> b!1305574 (=> (not res!866724) (not e!744805))))

(assert (=> b!1305574 (= res!866724 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42486 _keys!1741))))))

(declare-fun b!1305575 () Bool)

(declare-fun res!866717 () Bool)

(assert (=> b!1305575 (=> (not res!866717) (not e!744805))))

(assert (=> b!1305575 (= res!866717 (and (= (size!42485 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42486 _keys!1741) (size!42485 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305576 () Bool)

(declare-fun e!744803 () Bool)

(assert (=> b!1305576 (= e!744803 true)))

(declare-fun lt!584232 () ListLongMap!20321)

(declare-fun +!4532 (ListLongMap!20321 tuple2!22656) ListLongMap!20321)

(assert (=> b!1305576 (not (contains!8328 (+!4532 lt!584232 (tuple2!22657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!43160 0))(
  ( (Unit!43161) )
))
(declare-fun lt!584233 () Unit!43160)

(declare-fun addStillNotContains!483 (ListLongMap!20321 (_ BitVec 64) V!51665 (_ BitVec 64)) Unit!43160)

(assert (=> b!1305576 (= lt!584233 (addStillNotContains!483 lt!584232 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6171 (array!86901 array!86899 (_ BitVec 32) (_ BitVec 32) V!51665 V!51665 (_ BitVec 32) Int) ListLongMap!20321)

(assert (=> b!1305576 (= lt!584232 (getCurrentListMapNoExtraKeys!6171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305577 () Bool)

(assert (=> b!1305577 (= e!744805 (not e!744803))))

(declare-fun res!866722 () Bool)

(assert (=> b!1305577 (=> res!866722 e!744803)))

(assert (=> b!1305577 (= res!866722 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1305577 (not (contains!8328 (ListLongMap!20322 Nil!29799) k0!1205))))

(declare-fun lt!584234 () Unit!43160)

(declare-fun emptyContainsNothing!227 ((_ BitVec 64)) Unit!43160)

(assert (=> b!1305577 (= lt!584234 (emptyContainsNothing!227 k0!1205))))

(declare-fun b!1305578 () Bool)

(declare-fun tp_is_empty!34921 () Bool)

(assert (=> b!1305578 (= e!744807 tp_is_empty!34921)))

(declare-fun b!1305579 () Bool)

(declare-fun res!866723 () Bool)

(assert (=> b!1305579 (=> (not res!866723) (not e!744805))))

(declare-datatypes ((List!29803 0))(
  ( (Nil!29800) (Cons!29799 (h!31017 (_ BitVec 64)) (t!43393 List!29803)) )
))
(declare-fun arrayNoDuplicates!0 (array!86901 (_ BitVec 32) List!29803) Bool)

(assert (=> b!1305579 (= res!866723 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29800))))

(declare-fun res!866720 () Bool)

(assert (=> start!110382 (=> (not res!866720) (not e!744805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110382 (= res!866720 (validMask!0 mask!2175))))

(assert (=> start!110382 e!744805))

(assert (=> start!110382 tp_is_empty!34921))

(assert (=> start!110382 true))

(declare-fun array_inv!31965 (array!86899) Bool)

(assert (=> start!110382 (and (array_inv!31965 _values!1445) e!744806)))

(declare-fun array_inv!31966 (array!86901) Bool)

(assert (=> start!110382 (array_inv!31966 _keys!1741)))

(assert (=> start!110382 tp!103000))

(declare-fun b!1305580 () Bool)

(declare-fun e!744802 () Bool)

(assert (=> b!1305580 (= e!744802 tp_is_empty!34921)))

(declare-fun mapNonEmpty!53981 () Bool)

(declare-fun tp!103001 () Bool)

(assert (=> mapNonEmpty!53981 (= mapRes!53981 (and tp!103001 e!744802))))

(declare-fun mapRest!53981 () (Array (_ BitVec 32) ValueCell!16562))

(declare-fun mapKey!53981 () (_ BitVec 32))

(declare-fun mapValue!53981 () ValueCell!16562)

(assert (=> mapNonEmpty!53981 (= (arr!41934 _values!1445) (store mapRest!53981 mapKey!53981 mapValue!53981))))

(declare-fun b!1305581 () Bool)

(declare-fun res!866718 () Bool)

(assert (=> b!1305581 (=> (not res!866718) (not e!744805))))

(assert (=> b!1305581 (= res!866718 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42486 _keys!1741))))))

(declare-fun b!1305582 () Bool)

(declare-fun res!866721 () Bool)

(assert (=> b!1305582 (=> (not res!866721) (not e!744805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305582 (= res!866721 (not (validKeyInArray!0 (select (arr!41935 _keys!1741) from!2144))))))

(assert (= (and start!110382 res!866720) b!1305575))

(assert (= (and b!1305575 res!866717) b!1305573))

(assert (= (and b!1305573 res!866716) b!1305579))

(assert (= (and b!1305579 res!866723) b!1305574))

(assert (= (and b!1305574 res!866724) b!1305572))

(assert (= (and b!1305572 res!866719) b!1305581))

(assert (= (and b!1305581 res!866718) b!1305582))

(assert (= (and b!1305582 res!866721) b!1305577))

(assert (= (and b!1305577 (not res!866722)) b!1305576))

(assert (= (and b!1305571 condMapEmpty!53981) mapIsEmpty!53981))

(assert (= (and b!1305571 (not condMapEmpty!53981)) mapNonEmpty!53981))

(get-info :version)

(assert (= (and mapNonEmpty!53981 ((_ is ValueCellFull!16562) mapValue!53981)) b!1305580))

(assert (= (and b!1305571 ((_ is ValueCellFull!16562) mapDefault!53981)) b!1305578))

(assert (= start!110382 b!1305571))

(declare-fun m!1196855 () Bool)

(assert (=> b!1305576 m!1196855))

(assert (=> b!1305576 m!1196855))

(declare-fun m!1196857 () Bool)

(assert (=> b!1305576 m!1196857))

(declare-fun m!1196859 () Bool)

(assert (=> b!1305576 m!1196859))

(declare-fun m!1196861 () Bool)

(assert (=> b!1305576 m!1196861))

(declare-fun m!1196863 () Bool)

(assert (=> start!110382 m!1196863))

(declare-fun m!1196865 () Bool)

(assert (=> start!110382 m!1196865))

(declare-fun m!1196867 () Bool)

(assert (=> start!110382 m!1196867))

(declare-fun m!1196869 () Bool)

(assert (=> b!1305572 m!1196869))

(assert (=> b!1305572 m!1196869))

(declare-fun m!1196871 () Bool)

(assert (=> b!1305572 m!1196871))

(declare-fun m!1196873 () Bool)

(assert (=> b!1305582 m!1196873))

(assert (=> b!1305582 m!1196873))

(declare-fun m!1196875 () Bool)

(assert (=> b!1305582 m!1196875))

(declare-fun m!1196877 () Bool)

(assert (=> b!1305577 m!1196877))

(declare-fun m!1196879 () Bool)

(assert (=> b!1305577 m!1196879))

(declare-fun m!1196881 () Bool)

(assert (=> b!1305579 m!1196881))

(declare-fun m!1196883 () Bool)

(assert (=> b!1305573 m!1196883))

(declare-fun m!1196885 () Bool)

(assert (=> mapNonEmpty!53981 m!1196885))

(check-sat (not b!1305582) (not b!1305577) (not b!1305572) (not b!1305579) (not b_next!29281) (not b!1305576) b_and!47463 (not start!110382) tp_is_empty!34921 (not mapNonEmpty!53981) (not b!1305573))
(check-sat b_and!47463 (not b_next!29281))
