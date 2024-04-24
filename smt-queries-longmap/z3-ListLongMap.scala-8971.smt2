; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108776 () Bool)

(assert start!108776)

(declare-fun b_free!28099 () Bool)

(declare-fun b_next!28099 () Bool)

(assert (=> start!108776 (= b_free!28099 (not b_next!28099))))

(declare-fun tp!99407 () Bool)

(declare-fun b_and!46161 () Bool)

(assert (=> start!108776 (= tp!99407 b_and!46161)))

(declare-fun b!1282692 () Bool)

(declare-fun res!851717 () Bool)

(declare-fun e!732956 () Bool)

(assert (=> b!1282692 (=> (not res!851717) (not e!732956))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84581 0))(
  ( (array!84582 (arr!40790 (Array (_ BitVec 32) (_ BitVec 64))) (size!41341 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84581)

(assert (=> b!1282692 (= res!851717 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41341 _keys!1741))))))

(declare-fun b!1282693 () Bool)

(declare-fun e!732958 () Bool)

(declare-fun tp_is_empty!33739 () Bool)

(assert (=> b!1282693 (= e!732958 tp_is_empty!33739)))

(declare-fun b!1282694 () Bool)

(declare-fun e!732955 () Bool)

(assert (=> b!1282694 (= e!732956 (not e!732955))))

(declare-fun res!851718 () Bool)

(assert (=> b!1282694 (=> res!851718 e!732955)))

(assert (=> b!1282694 (= res!851718 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-datatypes ((V!50089 0))(
  ( (V!50090 (val!16944 Int)) )
))
(declare-fun minValue!1387 () V!50089)

(declare-fun zeroValue!1387 () V!50089)

(declare-datatypes ((ValueCell!15971 0))(
  ( (ValueCellFull!15971 (v!19539 V!50089)) (EmptyCell!15971) )
))
(declare-datatypes ((array!84583 0))(
  ( (array!84584 (arr!40791 (Array (_ BitVec 32) ValueCell!15971)) (size!41342 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84583)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21714 0))(
  ( (tuple2!21715 (_1!10868 (_ BitVec 64)) (_2!10868 V!50089)) )
))
(declare-datatypes ((List!28929 0))(
  ( (Nil!28926) (Cons!28925 (h!30143 tuple2!21714) (t!42461 List!28929)) )
))
(declare-datatypes ((ListLongMap!19379 0))(
  ( (ListLongMap!19380 (toList!9705 List!28929)) )
))
(declare-fun contains!7834 (ListLongMap!19379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4774 (array!84581 array!84583 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 32) Int) ListLongMap!19379)

(assert (=> b!1282694 (contains!7834 (getCurrentListMap!4774 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42400 0))(
  ( (Unit!42401) )
))
(declare-fun lt!576707 () Unit!42400)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!21 (array!84581 array!84583 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 64) (_ BitVec 32) Int) Unit!42400)

(assert (=> b!1282694 (= lt!576707 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!21 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1282695 () Bool)

(declare-fun res!851720 () Bool)

(assert (=> b!1282695 (=> (not res!851720) (not e!732956))))

(assert (=> b!1282695 (= res!851720 (contains!7834 (getCurrentListMap!4774 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282696 () Bool)

(declare-fun res!851721 () Bool)

(assert (=> b!1282696 (=> (not res!851721) (not e!732956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84581 (_ BitVec 32)) Bool)

(assert (=> b!1282696 (= res!851721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282697 () Bool)

(declare-fun e!732957 () Bool)

(assert (=> b!1282697 (= e!732957 tp_is_empty!33739)))

(declare-fun b!1282698 () Bool)

(declare-fun e!732959 () Bool)

(declare-fun mapRes!52160 () Bool)

(assert (=> b!1282698 (= e!732959 (and e!732957 mapRes!52160))))

(declare-fun condMapEmpty!52160 () Bool)

(declare-fun mapDefault!52160 () ValueCell!15971)

(assert (=> b!1282698 (= condMapEmpty!52160 (= (arr!40791 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15971)) mapDefault!52160)))))

(declare-fun b!1282699 () Bool)

(assert (=> b!1282699 (= e!732955 true)))

(declare-fun arrayContainsKey!0 (array!84581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1282699 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576708 () Unit!42400)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!636 (array!84581 array!84583 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 64) (_ BitVec 32) Int) Unit!42400)

(assert (=> b!1282699 (= lt!576708 (lemmaListMapContainsThenArrayContainsFrom!636 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1282700 () Bool)

(declare-fun res!851722 () Bool)

(assert (=> b!1282700 (=> (not res!851722) (not e!732956))))

(declare-datatypes ((List!28930 0))(
  ( (Nil!28927) (Cons!28926 (h!30144 (_ BitVec 64)) (t!42462 List!28930)) )
))
(declare-fun arrayNoDuplicates!0 (array!84581 (_ BitVec 32) List!28930) Bool)

(assert (=> b!1282700 (= res!851722 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28927))))

(declare-fun b!1282701 () Bool)

(declare-fun res!851723 () Bool)

(assert (=> b!1282701 (=> (not res!851723) (not e!732956))))

(assert (=> b!1282701 (= res!851723 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41341 _keys!1741)) (not (= (select (arr!40790 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282702 () Bool)

(declare-fun res!851724 () Bool)

(assert (=> b!1282702 (=> (not res!851724) (not e!732956))))

(assert (=> b!1282702 (= res!851724 (and (= (size!41342 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41341 _keys!1741) (size!41342 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52160 () Bool)

(assert (=> mapIsEmpty!52160 mapRes!52160))

(declare-fun res!851719 () Bool)

(assert (=> start!108776 (=> (not res!851719) (not e!732956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108776 (= res!851719 (validMask!0 mask!2175))))

(assert (=> start!108776 e!732956))

(assert (=> start!108776 tp_is_empty!33739))

(assert (=> start!108776 true))

(declare-fun array_inv!31165 (array!84583) Bool)

(assert (=> start!108776 (and (array_inv!31165 _values!1445) e!732959)))

(declare-fun array_inv!31166 (array!84581) Bool)

(assert (=> start!108776 (array_inv!31166 _keys!1741)))

(assert (=> start!108776 tp!99407))

(declare-fun mapNonEmpty!52160 () Bool)

(declare-fun tp!99406 () Bool)

(assert (=> mapNonEmpty!52160 (= mapRes!52160 (and tp!99406 e!732958))))

(declare-fun mapKey!52160 () (_ BitVec 32))

(declare-fun mapRest!52160 () (Array (_ BitVec 32) ValueCell!15971))

(declare-fun mapValue!52160 () ValueCell!15971)

(assert (=> mapNonEmpty!52160 (= (arr!40791 _values!1445) (store mapRest!52160 mapKey!52160 mapValue!52160))))

(assert (= (and start!108776 res!851719) b!1282702))

(assert (= (and b!1282702 res!851724) b!1282696))

(assert (= (and b!1282696 res!851721) b!1282700))

(assert (= (and b!1282700 res!851722) b!1282692))

(assert (= (and b!1282692 res!851717) b!1282695))

(assert (= (and b!1282695 res!851720) b!1282701))

(assert (= (and b!1282701 res!851723) b!1282694))

(assert (= (and b!1282694 (not res!851718)) b!1282699))

(assert (= (and b!1282698 condMapEmpty!52160) mapIsEmpty!52160))

(assert (= (and b!1282698 (not condMapEmpty!52160)) mapNonEmpty!52160))

(get-info :version)

(assert (= (and mapNonEmpty!52160 ((_ is ValueCellFull!15971) mapValue!52160)) b!1282693))

(assert (= (and b!1282698 ((_ is ValueCellFull!15971) mapDefault!52160)) b!1282697))

(assert (= start!108776 b!1282698))

(declare-fun m!1177425 () Bool)

(assert (=> b!1282699 m!1177425))

(declare-fun m!1177427 () Bool)

(assert (=> b!1282699 m!1177427))

(declare-fun m!1177429 () Bool)

(assert (=> b!1282695 m!1177429))

(assert (=> b!1282695 m!1177429))

(declare-fun m!1177431 () Bool)

(assert (=> b!1282695 m!1177431))

(declare-fun m!1177433 () Bool)

(assert (=> b!1282700 m!1177433))

(declare-fun m!1177435 () Bool)

(assert (=> b!1282696 m!1177435))

(declare-fun m!1177437 () Bool)

(assert (=> b!1282701 m!1177437))

(declare-fun m!1177439 () Bool)

(assert (=> mapNonEmpty!52160 m!1177439))

(declare-fun m!1177441 () Bool)

(assert (=> start!108776 m!1177441))

(declare-fun m!1177443 () Bool)

(assert (=> start!108776 m!1177443))

(declare-fun m!1177445 () Bool)

(assert (=> start!108776 m!1177445))

(declare-fun m!1177447 () Bool)

(assert (=> b!1282694 m!1177447))

(assert (=> b!1282694 m!1177447))

(declare-fun m!1177449 () Bool)

(assert (=> b!1282694 m!1177449))

(declare-fun m!1177451 () Bool)

(assert (=> b!1282694 m!1177451))

(check-sat b_and!46161 tp_is_empty!33739 (not b!1282695) (not mapNonEmpty!52160) (not start!108776) (not b!1282694) (not b!1282700) (not b_next!28099) (not b!1282696) (not b!1282699))
(check-sat b_and!46161 (not b_next!28099))
