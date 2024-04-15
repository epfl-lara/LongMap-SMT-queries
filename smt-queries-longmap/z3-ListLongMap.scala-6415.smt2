; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82268 () Bool)

(assert start!82268)

(declare-fun b_free!18559 () Bool)

(declare-fun b_next!18559 () Bool)

(assert (=> start!82268 (= b_free!18559 (not b_next!18559))))

(declare-fun tp!64638 () Bool)

(declare-fun b_and!30021 () Bool)

(assert (=> start!82268 (= tp!64638 b_and!30021)))

(declare-fun b!959033 () Bool)

(declare-fun e!540613 () Bool)

(assert (=> b!959033 (= e!540613 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33337 0))(
  ( (V!33338 (val!10683 Int)) )
))
(declare-fun minValue!1328 () V!33337)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58558 0))(
  ( (array!58559 (arr!28153 (Array (_ BitVec 32) (_ BitVec 64))) (size!28634 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58558)

(declare-datatypes ((ValueCell!10151 0))(
  ( (ValueCellFull!10151 (v!13239 V!33337)) (EmptyCell!10151) )
))
(declare-datatypes ((array!58560 0))(
  ( (array!58561 (arr!28154 (Array (_ BitVec 32) ValueCell!10151)) (size!28635 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58560)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33337)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13820 0))(
  ( (tuple2!13821 (_1!6921 (_ BitVec 64)) (_2!6921 V!33337)) )
))
(declare-datatypes ((List!19605 0))(
  ( (Nil!19602) (Cons!19601 (h!20763 tuple2!13820) (t!27959 List!19605)) )
))
(declare-datatypes ((ListLongMap!12507 0))(
  ( (ListLongMap!12508 (toList!6269 List!19605)) )
))
(declare-fun contains!5315 (ListLongMap!12507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3431 (array!58558 array!58560 (_ BitVec 32) (_ BitVec 32) V!33337 V!33337 (_ BitVec 32) Int) ListLongMap!12507)

(assert (=> b!959033 (contains!5315 (getCurrentListMap!3431 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28153 _keys!1668) i!793))))

(declare-datatypes ((Unit!32036 0))(
  ( (Unit!32037) )
))
(declare-fun lt!430294 () Unit!32036)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!9 (array!58558 array!58560 (_ BitVec 32) (_ BitVec 32) V!33337 V!33337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32036)

(assert (=> b!959033 (= lt!430294 (lemmaInListMapFromThenInFromSmaller!9 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun mapNonEmpty!33877 () Bool)

(declare-fun mapRes!33877 () Bool)

(declare-fun tp!64639 () Bool)

(declare-fun e!540615 () Bool)

(assert (=> mapNonEmpty!33877 (= mapRes!33877 (and tp!64639 e!540615))))

(declare-fun mapKey!33877 () (_ BitVec 32))

(declare-fun mapRest!33877 () (Array (_ BitVec 32) ValueCell!10151))

(declare-fun mapValue!33877 () ValueCell!10151)

(assert (=> mapNonEmpty!33877 (= (arr!28154 _values!1386) (store mapRest!33877 mapKey!33877 mapValue!33877))))

(declare-fun b!959034 () Bool)

(declare-fun e!540616 () Bool)

(declare-fun e!540614 () Bool)

(assert (=> b!959034 (= e!540616 (and e!540614 mapRes!33877))))

(declare-fun condMapEmpty!33877 () Bool)

(declare-fun mapDefault!33877 () ValueCell!10151)

(assert (=> b!959034 (= condMapEmpty!33877 (= (arr!28154 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10151)) mapDefault!33877)))))

(declare-fun mapIsEmpty!33877 () Bool)

(assert (=> mapIsEmpty!33877 mapRes!33877))

(declare-fun b!959035 () Bool)

(declare-fun res!642006 () Bool)

(assert (=> b!959035 (=> (not res!642006) (not e!540613))))

(assert (=> b!959035 (= res!642006 (and (= (size!28635 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28634 _keys!1668) (size!28635 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959036 () Bool)

(declare-fun res!642011 () Bool)

(assert (=> b!959036 (=> (not res!642011) (not e!540613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58558 (_ BitVec 32)) Bool)

(assert (=> b!959036 (= res!642011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959037 () Bool)

(declare-fun tp_is_empty!21265 () Bool)

(assert (=> b!959037 (= e!540614 tp_is_empty!21265)))

(declare-fun b!959038 () Bool)

(assert (=> b!959038 (= e!540615 tp_is_empty!21265)))

(declare-fun b!959039 () Bool)

(declare-fun res!642010 () Bool)

(assert (=> b!959039 (=> (not res!642010) (not e!540613))))

(assert (=> b!959039 (= res!642010 (contains!5315 (getCurrentListMap!3431 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28153 _keys!1668) i!793)))))

(declare-fun b!959040 () Bool)

(declare-fun res!642012 () Bool)

(assert (=> b!959040 (=> (not res!642012) (not e!540613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959040 (= res!642012 (validKeyInArray!0 (select (arr!28153 _keys!1668) i!793)))))

(declare-fun res!642007 () Bool)

(assert (=> start!82268 (=> (not res!642007) (not e!540613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82268 (= res!642007 (validMask!0 mask!2088))))

(assert (=> start!82268 e!540613))

(assert (=> start!82268 true))

(assert (=> start!82268 tp_is_empty!21265))

(declare-fun array_inv!21885 (array!58558) Bool)

(assert (=> start!82268 (array_inv!21885 _keys!1668)))

(declare-fun array_inv!21886 (array!58560) Bool)

(assert (=> start!82268 (and (array_inv!21886 _values!1386) e!540616)))

(assert (=> start!82268 tp!64638))

(declare-fun b!959041 () Bool)

(declare-fun res!642009 () Bool)

(assert (=> b!959041 (=> (not res!642009) (not e!540613))))

(assert (=> b!959041 (= res!642009 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28634 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28634 _keys!1668))))))

(declare-fun b!959042 () Bool)

(declare-fun res!642008 () Bool)

(assert (=> b!959042 (=> (not res!642008) (not e!540613))))

(declare-datatypes ((List!19606 0))(
  ( (Nil!19603) (Cons!19602 (h!20764 (_ BitVec 64)) (t!27960 List!19606)) )
))
(declare-fun arrayNoDuplicates!0 (array!58558 (_ BitVec 32) List!19606) Bool)

(assert (=> b!959042 (= res!642008 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19603))))

(assert (= (and start!82268 res!642007) b!959035))

(assert (= (and b!959035 res!642006) b!959036))

(assert (= (and b!959036 res!642011) b!959042))

(assert (= (and b!959042 res!642008) b!959041))

(assert (= (and b!959041 res!642009) b!959040))

(assert (= (and b!959040 res!642012) b!959039))

(assert (= (and b!959039 res!642010) b!959033))

(assert (= (and b!959034 condMapEmpty!33877) mapIsEmpty!33877))

(assert (= (and b!959034 (not condMapEmpty!33877)) mapNonEmpty!33877))

(get-info :version)

(assert (= (and mapNonEmpty!33877 ((_ is ValueCellFull!10151) mapValue!33877)) b!959038))

(assert (= (and b!959034 ((_ is ValueCellFull!10151) mapDefault!33877)) b!959037))

(assert (= start!82268 b!959034))

(declare-fun m!889029 () Bool)

(assert (=> b!959040 m!889029))

(assert (=> b!959040 m!889029))

(declare-fun m!889031 () Bool)

(assert (=> b!959040 m!889031))

(declare-fun m!889033 () Bool)

(assert (=> start!82268 m!889033))

(declare-fun m!889035 () Bool)

(assert (=> start!82268 m!889035))

(declare-fun m!889037 () Bool)

(assert (=> start!82268 m!889037))

(declare-fun m!889039 () Bool)

(assert (=> b!959033 m!889039))

(assert (=> b!959033 m!889029))

(assert (=> b!959033 m!889039))

(assert (=> b!959033 m!889029))

(declare-fun m!889041 () Bool)

(assert (=> b!959033 m!889041))

(declare-fun m!889043 () Bool)

(assert (=> b!959033 m!889043))

(declare-fun m!889045 () Bool)

(assert (=> b!959042 m!889045))

(declare-fun m!889047 () Bool)

(assert (=> b!959039 m!889047))

(assert (=> b!959039 m!889029))

(assert (=> b!959039 m!889047))

(assert (=> b!959039 m!889029))

(declare-fun m!889049 () Bool)

(assert (=> b!959039 m!889049))

(declare-fun m!889051 () Bool)

(assert (=> mapNonEmpty!33877 m!889051))

(declare-fun m!889053 () Bool)

(assert (=> b!959036 m!889053))

(check-sat (not mapNonEmpty!33877) b_and!30021 (not b!959033) (not b!959039) (not b!959042) (not start!82268) (not b!959036) (not b!959040) (not b_next!18559) tp_is_empty!21265)
(check-sat b_and!30021 (not b_next!18559))
