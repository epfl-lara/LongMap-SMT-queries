; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108632 () Bool)

(assert start!108632)

(declare-fun b_free!27955 () Bool)

(declare-fun b_next!27955 () Bool)

(assert (=> start!108632 (= b_free!27955 (not b_next!27955))))

(declare-fun tp!98975 () Bool)

(declare-fun b_and!46017 () Bool)

(assert (=> start!108632 (= tp!98975 b_and!46017)))

(declare-fun b!1280769 () Bool)

(declare-fun res!850442 () Bool)

(declare-fun e!731876 () Bool)

(assert (=> b!1280769 (=> (not res!850442) (not e!731876))))

(declare-datatypes ((array!84305 0))(
  ( (array!84306 (arr!40652 (Array (_ BitVec 32) (_ BitVec 64))) (size!41203 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84305)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84305 (_ BitVec 32)) Bool)

(assert (=> b!1280769 (= res!850442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280770 () Bool)

(declare-fun e!731873 () Bool)

(declare-fun e!731877 () Bool)

(declare-fun mapRes!51944 () Bool)

(assert (=> b!1280770 (= e!731873 (and e!731877 mapRes!51944))))

(declare-fun condMapEmpty!51944 () Bool)

(declare-datatypes ((V!49897 0))(
  ( (V!49898 (val!16872 Int)) )
))
(declare-datatypes ((ValueCell!15899 0))(
  ( (ValueCellFull!15899 (v!19467 V!49897)) (EmptyCell!15899) )
))
(declare-datatypes ((array!84307 0))(
  ( (array!84308 (arr!40653 (Array (_ BitVec 32) ValueCell!15899)) (size!41204 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84307)

(declare-fun mapDefault!51944 () ValueCell!15899)

(assert (=> b!1280770 (= condMapEmpty!51944 (= (arr!40653 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15899)) mapDefault!51944)))))

(declare-fun b!1280771 () Bool)

(assert (=> b!1280771 (= e!731876 false)))

(declare-fun minValue!1387 () V!49897)

(declare-fun zeroValue!1387 () V!49897)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576498 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21612 0))(
  ( (tuple2!21613 (_1!10817 (_ BitVec 64)) (_2!10817 V!49897)) )
))
(declare-datatypes ((List!28825 0))(
  ( (Nil!28822) (Cons!28821 (h!30039 tuple2!21612) (t!42357 List!28825)) )
))
(declare-datatypes ((ListLongMap!19277 0))(
  ( (ListLongMap!19278 (toList!9654 List!28825)) )
))
(declare-fun contains!7783 (ListLongMap!19277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4723 (array!84305 array!84307 (_ BitVec 32) (_ BitVec 32) V!49897 V!49897 (_ BitVec 32) Int) ListLongMap!19277)

(assert (=> b!1280771 (= lt!576498 (contains!7783 (getCurrentListMap!4723 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!51944 () Bool)

(assert (=> mapIsEmpty!51944 mapRes!51944))

(declare-fun b!1280772 () Bool)

(declare-fun e!731874 () Bool)

(declare-fun tp_is_empty!33595 () Bool)

(assert (=> b!1280772 (= e!731874 tp_is_empty!33595)))

(declare-fun res!850444 () Bool)

(assert (=> start!108632 (=> (not res!850444) (not e!731876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108632 (= res!850444 (validMask!0 mask!2175))))

(assert (=> start!108632 e!731876))

(assert (=> start!108632 tp_is_empty!33595))

(assert (=> start!108632 true))

(declare-fun array_inv!31059 (array!84307) Bool)

(assert (=> start!108632 (and (array_inv!31059 _values!1445) e!731873)))

(declare-fun array_inv!31060 (array!84305) Bool)

(assert (=> start!108632 (array_inv!31060 _keys!1741)))

(assert (=> start!108632 tp!98975))

(declare-fun b!1280773 () Bool)

(assert (=> b!1280773 (= e!731877 tp_is_empty!33595)))

(declare-fun b!1280774 () Bool)

(declare-fun res!850443 () Bool)

(assert (=> b!1280774 (=> (not res!850443) (not e!731876))))

(assert (=> b!1280774 (= res!850443 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41203 _keys!1741))))))

(declare-fun b!1280775 () Bool)

(declare-fun res!850446 () Bool)

(assert (=> b!1280775 (=> (not res!850446) (not e!731876))))

(assert (=> b!1280775 (= res!850446 (and (= (size!41204 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41203 _keys!1741) (size!41204 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280776 () Bool)

(declare-fun res!850445 () Bool)

(assert (=> b!1280776 (=> (not res!850445) (not e!731876))))

(declare-datatypes ((List!28826 0))(
  ( (Nil!28823) (Cons!28822 (h!30040 (_ BitVec 64)) (t!42358 List!28826)) )
))
(declare-fun arrayNoDuplicates!0 (array!84305 (_ BitVec 32) List!28826) Bool)

(assert (=> b!1280776 (= res!850445 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28823))))

(declare-fun mapNonEmpty!51944 () Bool)

(declare-fun tp!98974 () Bool)

(assert (=> mapNonEmpty!51944 (= mapRes!51944 (and tp!98974 e!731874))))

(declare-fun mapRest!51944 () (Array (_ BitVec 32) ValueCell!15899))

(declare-fun mapValue!51944 () ValueCell!15899)

(declare-fun mapKey!51944 () (_ BitVec 32))

(assert (=> mapNonEmpty!51944 (= (arr!40653 _values!1445) (store mapRest!51944 mapKey!51944 mapValue!51944))))

(assert (= (and start!108632 res!850444) b!1280775))

(assert (= (and b!1280775 res!850446) b!1280769))

(assert (= (and b!1280769 res!850442) b!1280776))

(assert (= (and b!1280776 res!850445) b!1280774))

(assert (= (and b!1280774 res!850443) b!1280771))

(assert (= (and b!1280770 condMapEmpty!51944) mapIsEmpty!51944))

(assert (= (and b!1280770 (not condMapEmpty!51944)) mapNonEmpty!51944))

(get-info :version)

(assert (= (and mapNonEmpty!51944 ((_ is ValueCellFull!15899) mapValue!51944)) b!1280772))

(assert (= (and b!1280770 ((_ is ValueCellFull!15899) mapDefault!51944)) b!1280773))

(assert (= start!108632 b!1280770))

(declare-fun m!1176033 () Bool)

(assert (=> b!1280771 m!1176033))

(assert (=> b!1280771 m!1176033))

(declare-fun m!1176035 () Bool)

(assert (=> b!1280771 m!1176035))

(declare-fun m!1176037 () Bool)

(assert (=> b!1280769 m!1176037))

(declare-fun m!1176039 () Bool)

(assert (=> start!108632 m!1176039))

(declare-fun m!1176041 () Bool)

(assert (=> start!108632 m!1176041))

(declare-fun m!1176043 () Bool)

(assert (=> start!108632 m!1176043))

(declare-fun m!1176045 () Bool)

(assert (=> b!1280776 m!1176045))

(declare-fun m!1176047 () Bool)

(assert (=> mapNonEmpty!51944 m!1176047))

(check-sat (not start!108632) (not b!1280771) (not mapNonEmpty!51944) (not b!1280776) (not b!1280769) (not b_next!27955) b_and!46017 tp_is_empty!33595)
(check-sat b_and!46017 (not b_next!27955))
