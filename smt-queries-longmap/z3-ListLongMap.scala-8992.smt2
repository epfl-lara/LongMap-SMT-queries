; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108936 () Bool)

(assert start!108936)

(declare-fun b_free!28225 () Bool)

(declare-fun b_next!28225 () Bool)

(assert (=> start!108936 (= b_free!28225 (not b_next!28225))))

(declare-fun tp!99790 () Bool)

(declare-fun b_and!46293 () Bool)

(assert (=> start!108936 (= tp!99790 b_and!46293)))

(declare-fun mapIsEmpty!52355 () Bool)

(declare-fun mapRes!52355 () Bool)

(assert (=> mapIsEmpty!52355 mapRes!52355))

(declare-fun b!1284793 () Bool)

(declare-fun e!734094 () Bool)

(declare-fun e!734095 () Bool)

(assert (=> b!1284793 (= e!734094 (and e!734095 mapRes!52355))))

(declare-fun condMapEmpty!52355 () Bool)

(declare-datatypes ((V!50257 0))(
  ( (V!50258 (val!17007 Int)) )
))
(declare-datatypes ((ValueCell!16034 0))(
  ( (ValueCellFull!16034 (v!19604 V!50257)) (EmptyCell!16034) )
))
(declare-datatypes ((array!84821 0))(
  ( (array!84822 (arr!40908 (Array (_ BitVec 32) ValueCell!16034)) (size!41459 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84821)

(declare-fun mapDefault!52355 () ValueCell!16034)

(assert (=> b!1284793 (= condMapEmpty!52355 (= (arr!40908 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16034)) mapDefault!52355)))))

(declare-fun b!1284794 () Bool)

(declare-fun e!734096 () Bool)

(assert (=> b!1284794 (= e!734096 (not true))))

(declare-datatypes ((tuple2!21798 0))(
  ( (tuple2!21799 (_1!10910 (_ BitVec 64)) (_2!10910 V!50257)) )
))
(declare-datatypes ((List!29008 0))(
  ( (Nil!29005) (Cons!29004 (h!30222 tuple2!21798) (t!42544 List!29008)) )
))
(declare-datatypes ((ListLongMap!19463 0))(
  ( (ListLongMap!19464 (toList!9747 List!29008)) )
))
(declare-fun lt!577147 () ListLongMap!19463)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7878 (ListLongMap!19463 (_ BitVec 64)) Bool)

(assert (=> b!1284794 (contains!7878 lt!577147 k0!1205)))

(declare-fun minValue!1387 () V!50257)

(declare-datatypes ((Unit!42438 0))(
  ( (Unit!42439) )
))
(declare-fun lt!577148 () Unit!42438)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!9 ((_ BitVec 64) (_ BitVec 64) V!50257 ListLongMap!19463) Unit!42438)

(assert (=> b!1284794 (= lt!577148 (lemmaInListMapAfterAddingDiffThenInBefore!9 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577147))))

(declare-fun zeroValue!1387 () V!50257)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84823 0))(
  ( (array!84824 (arr!40909 (Array (_ BitVec 32) (_ BitVec 64))) (size!41460 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84823)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4334 (ListLongMap!19463 tuple2!21798) ListLongMap!19463)

(declare-fun getCurrentListMapNoExtraKeys!5966 (array!84823 array!84821 (_ BitVec 32) (_ BitVec 32) V!50257 V!50257 (_ BitVec 32) Int) ListLongMap!19463)

(assert (=> b!1284794 (= lt!577147 (+!4334 (getCurrentListMapNoExtraKeys!5966 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun res!853110 () Bool)

(assert (=> start!108936 (=> (not res!853110) (not e!734096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108936 (= res!853110 (validMask!0 mask!2175))))

(assert (=> start!108936 e!734096))

(declare-fun tp_is_empty!33865 () Bool)

(assert (=> start!108936 tp_is_empty!33865))

(assert (=> start!108936 true))

(declare-fun array_inv!31241 (array!84821) Bool)

(assert (=> start!108936 (and (array_inv!31241 _values!1445) e!734094)))

(declare-fun array_inv!31242 (array!84823) Bool)

(assert (=> start!108936 (array_inv!31242 _keys!1741)))

(assert (=> start!108936 tp!99790))

(declare-fun b!1284795 () Bool)

(declare-fun res!853109 () Bool)

(assert (=> b!1284795 (=> (not res!853109) (not e!734096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284795 (= res!853109 (validKeyInArray!0 (select (arr!40909 _keys!1741) from!2144)))))

(declare-fun b!1284796 () Bool)

(declare-fun res!853104 () Bool)

(assert (=> b!1284796 (=> (not res!853104) (not e!734096))))

(assert (=> b!1284796 (= res!853104 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41460 _keys!1741))))))

(declare-fun b!1284797 () Bool)

(declare-fun res!853106 () Bool)

(assert (=> b!1284797 (=> (not res!853106) (not e!734096))))

(declare-fun getCurrentListMap!4814 (array!84823 array!84821 (_ BitVec 32) (_ BitVec 32) V!50257 V!50257 (_ BitVec 32) Int) ListLongMap!19463)

(assert (=> b!1284797 (= res!853106 (contains!7878 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284798 () Bool)

(declare-fun res!853111 () Bool)

(assert (=> b!1284798 (=> (not res!853111) (not e!734096))))

(assert (=> b!1284798 (= res!853111 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284799 () Bool)

(declare-fun res!853107 () Bool)

(assert (=> b!1284799 (=> (not res!853107) (not e!734096))))

(assert (=> b!1284799 (= res!853107 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41460 _keys!1741))))))

(declare-fun b!1284800 () Bool)

(assert (=> b!1284800 (= e!734095 tp_is_empty!33865)))

(declare-fun b!1284801 () Bool)

(declare-fun res!853108 () Bool)

(assert (=> b!1284801 (=> (not res!853108) (not e!734096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84823 (_ BitVec 32)) Bool)

(assert (=> b!1284801 (= res!853108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284802 () Bool)

(declare-fun res!853103 () Bool)

(assert (=> b!1284802 (=> (not res!853103) (not e!734096))))

(assert (=> b!1284802 (= res!853103 (and (= (size!41459 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41460 _keys!1741) (size!41459 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284803 () Bool)

(declare-fun res!853105 () Bool)

(assert (=> b!1284803 (=> (not res!853105) (not e!734096))))

(declare-datatypes ((List!29009 0))(
  ( (Nil!29006) (Cons!29005 (h!30223 (_ BitVec 64)) (t!42545 List!29009)) )
))
(declare-fun arrayNoDuplicates!0 (array!84823 (_ BitVec 32) List!29009) Bool)

(assert (=> b!1284803 (= res!853105 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29006))))

(declare-fun b!1284804 () Bool)

(declare-fun e!734097 () Bool)

(assert (=> b!1284804 (= e!734097 tp_is_empty!33865)))

(declare-fun mapNonEmpty!52355 () Bool)

(declare-fun tp!99791 () Bool)

(assert (=> mapNonEmpty!52355 (= mapRes!52355 (and tp!99791 e!734097))))

(declare-fun mapValue!52355 () ValueCell!16034)

(declare-fun mapKey!52355 () (_ BitVec 32))

(declare-fun mapRest!52355 () (Array (_ BitVec 32) ValueCell!16034))

(assert (=> mapNonEmpty!52355 (= (arr!40908 _values!1445) (store mapRest!52355 mapKey!52355 mapValue!52355))))

(assert (= (and start!108936 res!853110) b!1284802))

(assert (= (and b!1284802 res!853103) b!1284801))

(assert (= (and b!1284801 res!853108) b!1284803))

(assert (= (and b!1284803 res!853105) b!1284796))

(assert (= (and b!1284796 res!853104) b!1284797))

(assert (= (and b!1284797 res!853106) b!1284799))

(assert (= (and b!1284799 res!853107) b!1284795))

(assert (= (and b!1284795 res!853109) b!1284798))

(assert (= (and b!1284798 res!853111) b!1284794))

(assert (= (and b!1284793 condMapEmpty!52355) mapIsEmpty!52355))

(assert (= (and b!1284793 (not condMapEmpty!52355)) mapNonEmpty!52355))

(get-info :version)

(assert (= (and mapNonEmpty!52355 ((_ is ValueCellFull!16034) mapValue!52355)) b!1284804))

(assert (= (and b!1284793 ((_ is ValueCellFull!16034) mapDefault!52355)) b!1284800))

(assert (= start!108936 b!1284793))

(declare-fun m!1179013 () Bool)

(assert (=> b!1284803 m!1179013))

(declare-fun m!1179015 () Bool)

(assert (=> b!1284794 m!1179015))

(declare-fun m!1179017 () Bool)

(assert (=> b!1284794 m!1179017))

(declare-fun m!1179019 () Bool)

(assert (=> b!1284794 m!1179019))

(assert (=> b!1284794 m!1179019))

(declare-fun m!1179021 () Bool)

(assert (=> b!1284794 m!1179021))

(declare-fun m!1179023 () Bool)

(assert (=> b!1284795 m!1179023))

(assert (=> b!1284795 m!1179023))

(declare-fun m!1179025 () Bool)

(assert (=> b!1284795 m!1179025))

(declare-fun m!1179027 () Bool)

(assert (=> start!108936 m!1179027))

(declare-fun m!1179029 () Bool)

(assert (=> start!108936 m!1179029))

(declare-fun m!1179031 () Bool)

(assert (=> start!108936 m!1179031))

(declare-fun m!1179033 () Bool)

(assert (=> b!1284797 m!1179033))

(assert (=> b!1284797 m!1179033))

(declare-fun m!1179035 () Bool)

(assert (=> b!1284797 m!1179035))

(declare-fun m!1179037 () Bool)

(assert (=> mapNonEmpty!52355 m!1179037))

(declare-fun m!1179039 () Bool)

(assert (=> b!1284801 m!1179039))

(check-sat (not b_next!28225) tp_is_empty!33865 (not mapNonEmpty!52355) (not b!1284797) (not b!1284795) (not start!108936) (not b!1284801) b_and!46293 (not b!1284803) (not b!1284794))
(check-sat b_and!46293 (not b_next!28225))
