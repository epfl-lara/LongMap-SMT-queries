; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108912 () Bool)

(assert start!108912)

(declare-fun b_free!28201 () Bool)

(declare-fun b_next!28201 () Bool)

(assert (=> start!108912 (= b_free!28201 (not b_next!28201))))

(declare-fun tp!99719 () Bool)

(declare-fun b_and!46269 () Bool)

(assert (=> start!108912 (= tp!99719 b_and!46269)))

(declare-fun b!1284361 () Bool)

(declare-fun e!733914 () Bool)

(declare-fun tp_is_empty!33841 () Bool)

(assert (=> b!1284361 (= e!733914 tp_is_empty!33841)))

(declare-fun b!1284362 () Bool)

(declare-fun res!852784 () Bool)

(declare-fun e!733915 () Bool)

(assert (=> b!1284362 (=> (not res!852784) (not e!733915))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84777 0))(
  ( (array!84778 (arr!40886 (Array (_ BitVec 32) (_ BitVec 64))) (size!41437 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84777)

(assert (=> b!1284362 (= res!852784 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41437 _keys!1741))))))

(declare-fun b!1284363 () Bool)

(declare-fun res!852782 () Bool)

(assert (=> b!1284363 (=> (not res!852782) (not e!733915))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50225 0))(
  ( (V!50226 (val!16995 Int)) )
))
(declare-datatypes ((ValueCell!16022 0))(
  ( (ValueCellFull!16022 (v!19592 V!50225)) (EmptyCell!16022) )
))
(declare-datatypes ((array!84779 0))(
  ( (array!84780 (arr!40887 (Array (_ BitVec 32) ValueCell!16022)) (size!41438 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84779)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284363 (= res!852782 (and (= (size!41438 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41437 _keys!1741) (size!41438 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284364 () Bool)

(declare-fun res!852783 () Bool)

(assert (=> b!1284364 (=> (not res!852783) (not e!733915))))

(declare-datatypes ((List!28994 0))(
  ( (Nil!28991) (Cons!28990 (h!30208 (_ BitVec 64)) (t!42530 List!28994)) )
))
(declare-fun arrayNoDuplicates!0 (array!84777 (_ BitVec 32) List!28994) Bool)

(assert (=> b!1284364 (= res!852783 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28991))))

(declare-fun mapIsEmpty!52319 () Bool)

(declare-fun mapRes!52319 () Bool)

(assert (=> mapIsEmpty!52319 mapRes!52319))

(declare-fun b!1284365 () Bool)

(declare-fun res!852787 () Bool)

(assert (=> b!1284365 (=> (not res!852787) (not e!733915))))

(assert (=> b!1284365 (= res!852787 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41437 _keys!1741))))))

(declare-fun b!1284366 () Bool)

(declare-fun e!733917 () Bool)

(assert (=> b!1284366 (= e!733917 tp_is_empty!33841)))

(declare-fun b!1284367 () Bool)

(assert (=> b!1284367 (= e!733915 (not true))))

(declare-datatypes ((tuple2!21782 0))(
  ( (tuple2!21783 (_1!10902 (_ BitVec 64)) (_2!10902 V!50225)) )
))
(declare-datatypes ((List!28995 0))(
  ( (Nil!28992) (Cons!28991 (h!30209 tuple2!21782) (t!42531 List!28995)) )
))
(declare-datatypes ((ListLongMap!19447 0))(
  ( (ListLongMap!19448 (toList!9739 List!28995)) )
))
(declare-fun lt!577076 () ListLongMap!19447)

(declare-fun contains!7870 (ListLongMap!19447 (_ BitVec 64)) Bool)

(assert (=> b!1284367 (contains!7870 lt!577076 k0!1205)))

(declare-fun minValue!1387 () V!50225)

(declare-datatypes ((Unit!42422 0))(
  ( (Unit!42423) )
))
(declare-fun lt!577075 () Unit!42422)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!1 ((_ BitVec 64) (_ BitVec 64) V!50225 ListLongMap!19447) Unit!42422)

(assert (=> b!1284367 (= lt!577075 (lemmaInListMapAfterAddingDiffThenInBefore!1 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577076))))

(declare-fun zeroValue!1387 () V!50225)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4326 (ListLongMap!19447 tuple2!21782) ListLongMap!19447)

(declare-fun getCurrentListMapNoExtraKeys!5958 (array!84777 array!84779 (_ BitVec 32) (_ BitVec 32) V!50225 V!50225 (_ BitVec 32) Int) ListLongMap!19447)

(assert (=> b!1284367 (= lt!577076 (+!4326 (getCurrentListMapNoExtraKeys!5958 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284368 () Bool)

(declare-fun res!852779 () Bool)

(assert (=> b!1284368 (=> (not res!852779) (not e!733915))))

(assert (=> b!1284368 (= res!852779 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284369 () Bool)

(declare-fun res!852786 () Bool)

(assert (=> b!1284369 (=> (not res!852786) (not e!733915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284369 (= res!852786 (validKeyInArray!0 (select (arr!40886 _keys!1741) from!2144)))))

(declare-fun b!1284370 () Bool)

(declare-fun res!852781 () Bool)

(assert (=> b!1284370 (=> (not res!852781) (not e!733915))))

(declare-fun getCurrentListMap!4807 (array!84777 array!84779 (_ BitVec 32) (_ BitVec 32) V!50225 V!50225 (_ BitVec 32) Int) ListLongMap!19447)

(assert (=> b!1284370 (= res!852781 (contains!7870 (getCurrentListMap!4807 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52319 () Bool)

(declare-fun tp!99718 () Bool)

(assert (=> mapNonEmpty!52319 (= mapRes!52319 (and tp!99718 e!733914))))

(declare-fun mapKey!52319 () (_ BitVec 32))

(declare-fun mapValue!52319 () ValueCell!16022)

(declare-fun mapRest!52319 () (Array (_ BitVec 32) ValueCell!16022))

(assert (=> mapNonEmpty!52319 (= (arr!40887 _values!1445) (store mapRest!52319 mapKey!52319 mapValue!52319))))

(declare-fun res!852780 () Bool)

(assert (=> start!108912 (=> (not res!852780) (not e!733915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108912 (= res!852780 (validMask!0 mask!2175))))

(assert (=> start!108912 e!733915))

(assert (=> start!108912 tp_is_empty!33841))

(assert (=> start!108912 true))

(declare-fun e!733916 () Bool)

(declare-fun array_inv!31225 (array!84779) Bool)

(assert (=> start!108912 (and (array_inv!31225 _values!1445) e!733916)))

(declare-fun array_inv!31226 (array!84777) Bool)

(assert (=> start!108912 (array_inv!31226 _keys!1741)))

(assert (=> start!108912 tp!99719))

(declare-fun b!1284371 () Bool)

(declare-fun res!852785 () Bool)

(assert (=> b!1284371 (=> (not res!852785) (not e!733915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84777 (_ BitVec 32)) Bool)

(assert (=> b!1284371 (= res!852785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284372 () Bool)

(assert (=> b!1284372 (= e!733916 (and e!733917 mapRes!52319))))

(declare-fun condMapEmpty!52319 () Bool)

(declare-fun mapDefault!52319 () ValueCell!16022)

(assert (=> b!1284372 (= condMapEmpty!52319 (= (arr!40887 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16022)) mapDefault!52319)))))

(assert (= (and start!108912 res!852780) b!1284363))

(assert (= (and b!1284363 res!852782) b!1284371))

(assert (= (and b!1284371 res!852785) b!1284364))

(assert (= (and b!1284364 res!852783) b!1284365))

(assert (= (and b!1284365 res!852787) b!1284370))

(assert (= (and b!1284370 res!852781) b!1284362))

(assert (= (and b!1284362 res!852784) b!1284369))

(assert (= (and b!1284369 res!852786) b!1284368))

(assert (= (and b!1284368 res!852779) b!1284367))

(assert (= (and b!1284372 condMapEmpty!52319) mapIsEmpty!52319))

(assert (= (and b!1284372 (not condMapEmpty!52319)) mapNonEmpty!52319))

(get-info :version)

(assert (= (and mapNonEmpty!52319 ((_ is ValueCellFull!16022) mapValue!52319)) b!1284361))

(assert (= (and b!1284372 ((_ is ValueCellFull!16022) mapDefault!52319)) b!1284366))

(assert (= start!108912 b!1284372))

(declare-fun m!1178677 () Bool)

(assert (=> b!1284370 m!1178677))

(assert (=> b!1284370 m!1178677))

(declare-fun m!1178679 () Bool)

(assert (=> b!1284370 m!1178679))

(declare-fun m!1178681 () Bool)

(assert (=> b!1284369 m!1178681))

(assert (=> b!1284369 m!1178681))

(declare-fun m!1178683 () Bool)

(assert (=> b!1284369 m!1178683))

(declare-fun m!1178685 () Bool)

(assert (=> start!108912 m!1178685))

(declare-fun m!1178687 () Bool)

(assert (=> start!108912 m!1178687))

(declare-fun m!1178689 () Bool)

(assert (=> start!108912 m!1178689))

(declare-fun m!1178691 () Bool)

(assert (=> b!1284367 m!1178691))

(declare-fun m!1178693 () Bool)

(assert (=> b!1284367 m!1178693))

(declare-fun m!1178695 () Bool)

(assert (=> b!1284367 m!1178695))

(assert (=> b!1284367 m!1178695))

(declare-fun m!1178697 () Bool)

(assert (=> b!1284367 m!1178697))

(declare-fun m!1178699 () Bool)

(assert (=> mapNonEmpty!52319 m!1178699))

(declare-fun m!1178701 () Bool)

(assert (=> b!1284364 m!1178701))

(declare-fun m!1178703 () Bool)

(assert (=> b!1284371 m!1178703))

(check-sat b_and!46269 (not b!1284371) (not b!1284367) (not b!1284370) (not b_next!28201) (not mapNonEmpty!52319) (not b!1284364) (not start!108912) tp_is_empty!33841 (not b!1284369))
(check-sat b_and!46269 (not b_next!28201))
