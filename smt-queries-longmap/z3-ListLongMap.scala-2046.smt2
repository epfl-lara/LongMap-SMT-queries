; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35430 () Bool)

(assert start!35430)

(declare-fun b_free!7831 () Bool)

(declare-fun b_next!7831 () Bool)

(assert (=> start!35430 (= b_free!7831 (not b_next!7831))))

(declare-fun tp!27278 () Bool)

(declare-fun b_and!15087 () Bool)

(assert (=> start!35430 (= tp!27278 b_and!15087)))

(declare-fun b!354903 () Bool)

(declare-fun res!196828 () Bool)

(declare-fun e!217488 () Bool)

(assert (=> b!354903 (=> (not res!196828) (not e!217488))))

(declare-datatypes ((array!19364 0))(
  ( (array!19365 (arr!9175 (Array (_ BitVec 32) (_ BitVec 64))) (size!9527 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19364)

(declare-datatypes ((List!5223 0))(
  ( (Nil!5220) (Cons!5219 (h!6075 (_ BitVec 64)) (t!10365 List!5223)) )
))
(declare-fun arrayNoDuplicates!0 (array!19364 (_ BitVec 32) List!5223) Bool)

(assert (=> b!354903 (= res!196828 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5220))))

(declare-fun mapIsEmpty!13353 () Bool)

(declare-fun mapRes!13353 () Bool)

(assert (=> mapIsEmpty!13353 mapRes!13353))

(declare-fun b!354905 () Bool)

(declare-fun res!196825 () Bool)

(assert (=> b!354905 (=> (not res!196825) (not e!217488))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354905 (= res!196825 (validKeyInArray!0 (select (arr!9175 _keys!1456) from!1805)))))

(declare-fun b!354906 () Bool)

(declare-fun res!196826 () Bool)

(assert (=> b!354906 (=> (not res!196826) (not e!217488))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19364 (_ BitVec 32)) Bool)

(assert (=> b!354906 (= res!196826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354907 () Bool)

(declare-fun res!196821 () Bool)

(assert (=> b!354907 (=> (not res!196821) (not e!217488))))

(assert (=> b!354907 (= res!196821 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9527 _keys!1456))))))

(declare-fun b!354908 () Bool)

(declare-fun res!196823 () Bool)

(assert (=> b!354908 (=> (not res!196823) (not e!217488))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354908 (= res!196823 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354909 () Bool)

(declare-fun e!217490 () Bool)

(declare-fun tp_is_empty!7897 () Bool)

(assert (=> b!354909 (= e!217490 tp_is_empty!7897)))

(declare-fun b!354910 () Bool)

(declare-fun res!196822 () Bool)

(assert (=> b!354910 (=> (not res!196822) (not e!217488))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11507 0))(
  ( (V!11508 (val!3993 Int)) )
))
(declare-datatypes ((ValueCell!3605 0))(
  ( (ValueCellFull!3605 (v!6188 V!11507)) (EmptyCell!3605) )
))
(declare-datatypes ((array!19366 0))(
  ( (array!19367 (arr!9176 (Array (_ BitVec 32) ValueCell!3605)) (size!9528 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19366)

(assert (=> b!354910 (= res!196822 (and (= (size!9528 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9527 _keys!1456) (size!9528 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!196827 () Bool)

(assert (=> start!35430 (=> (not res!196827) (not e!217488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35430 (= res!196827 (validMask!0 mask!1842))))

(assert (=> start!35430 e!217488))

(assert (=> start!35430 tp_is_empty!7897))

(assert (=> start!35430 true))

(assert (=> start!35430 tp!27278))

(declare-fun array_inv!6782 (array!19364) Bool)

(assert (=> start!35430 (array_inv!6782 _keys!1456)))

(declare-fun e!217491 () Bool)

(declare-fun array_inv!6783 (array!19366) Bool)

(assert (=> start!35430 (and (array_inv!6783 _values!1208) e!217491)))

(declare-fun b!354904 () Bool)

(declare-fun res!196820 () Bool)

(assert (=> b!354904 (=> (not res!196820) (not e!217488))))

(assert (=> b!354904 (= res!196820 (validKeyInArray!0 k0!1077))))

(declare-fun b!354911 () Bool)

(assert (=> b!354911 (= e!217488 (not true))))

(declare-fun minValue!1150 () V!11507)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11507)

(declare-datatypes ((tuple2!5586 0))(
  ( (tuple2!5587 (_1!2804 (_ BitVec 64)) (_2!2804 V!11507)) )
))
(declare-datatypes ((List!5224 0))(
  ( (Nil!5221) (Cons!5220 (h!6076 tuple2!5586) (t!10366 List!5224)) )
))
(declare-datatypes ((ListLongMap!4501 0))(
  ( (ListLongMap!4502 (toList!2266 List!5224)) )
))
(declare-fun contains!2365 (ListLongMap!4501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1794 (array!19364 array!19366 (_ BitVec 32) (_ BitVec 32) V!11507 V!11507 (_ BitVec 32) Int) ListLongMap!4501)

(assert (=> b!354911 (contains!2365 (getCurrentListMap!1794 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9175 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10917 0))(
  ( (Unit!10918) )
))
(declare-fun lt!165779 () Unit!10917)

(declare-fun lemmaValidKeyInArrayIsInListMap!184 (array!19364 array!19366 (_ BitVec 32) (_ BitVec 32) V!11507 V!11507 (_ BitVec 32) Int) Unit!10917)

(assert (=> b!354911 (= lt!165779 (lemmaValidKeyInArrayIsInListMap!184 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapNonEmpty!13353 () Bool)

(declare-fun tp!27279 () Bool)

(declare-fun e!217489 () Bool)

(assert (=> mapNonEmpty!13353 (= mapRes!13353 (and tp!27279 e!217489))))

(declare-fun mapValue!13353 () ValueCell!3605)

(declare-fun mapRest!13353 () (Array (_ BitVec 32) ValueCell!3605))

(declare-fun mapKey!13353 () (_ BitVec 32))

(assert (=> mapNonEmpty!13353 (= (arr!9176 _values!1208) (store mapRest!13353 mapKey!13353 mapValue!13353))))

(declare-fun b!354912 () Bool)

(assert (=> b!354912 (= e!217491 (and e!217490 mapRes!13353))))

(declare-fun condMapEmpty!13353 () Bool)

(declare-fun mapDefault!13353 () ValueCell!3605)

(assert (=> b!354912 (= condMapEmpty!13353 (= (arr!9176 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3605)) mapDefault!13353)))))

(declare-fun b!354913 () Bool)

(assert (=> b!354913 (= e!217489 tp_is_empty!7897)))

(declare-fun b!354914 () Bool)

(declare-fun res!196824 () Bool)

(assert (=> b!354914 (=> (not res!196824) (not e!217488))))

(assert (=> b!354914 (= res!196824 (= (select (arr!9175 _keys!1456) from!1805) k0!1077))))

(assert (= (and start!35430 res!196827) b!354910))

(assert (= (and b!354910 res!196822) b!354906))

(assert (= (and b!354906 res!196826) b!354903))

(assert (= (and b!354903 res!196828) b!354904))

(assert (= (and b!354904 res!196820) b!354907))

(assert (= (and b!354907 res!196821) b!354908))

(assert (= (and b!354908 res!196823) b!354914))

(assert (= (and b!354914 res!196824) b!354905))

(assert (= (and b!354905 res!196825) b!354911))

(assert (= (and b!354912 condMapEmpty!13353) mapIsEmpty!13353))

(assert (= (and b!354912 (not condMapEmpty!13353)) mapNonEmpty!13353))

(get-info :version)

(assert (= (and mapNonEmpty!13353 ((_ is ValueCellFull!3605) mapValue!13353)) b!354913))

(assert (= (and b!354912 ((_ is ValueCellFull!3605) mapDefault!13353)) b!354909))

(assert (= start!35430 b!354912))

(declare-fun m!354033 () Bool)

(assert (=> b!354906 m!354033))

(declare-fun m!354035 () Bool)

(assert (=> start!35430 m!354035))

(declare-fun m!354037 () Bool)

(assert (=> start!35430 m!354037))

(declare-fun m!354039 () Bool)

(assert (=> start!35430 m!354039))

(declare-fun m!354041 () Bool)

(assert (=> b!354908 m!354041))

(declare-fun m!354043 () Bool)

(assert (=> mapNonEmpty!13353 m!354043))

(declare-fun m!354045 () Bool)

(assert (=> b!354904 m!354045))

(declare-fun m!354047 () Bool)

(assert (=> b!354911 m!354047))

(declare-fun m!354049 () Bool)

(assert (=> b!354911 m!354049))

(assert (=> b!354911 m!354047))

(assert (=> b!354911 m!354049))

(declare-fun m!354051 () Bool)

(assert (=> b!354911 m!354051))

(declare-fun m!354053 () Bool)

(assert (=> b!354911 m!354053))

(declare-fun m!354055 () Bool)

(assert (=> b!354903 m!354055))

(assert (=> b!354914 m!354049))

(assert (=> b!354905 m!354049))

(assert (=> b!354905 m!354049))

(declare-fun m!354057 () Bool)

(assert (=> b!354905 m!354057))

(check-sat (not b!354904) b_and!15087 tp_is_empty!7897 (not b_next!7831) (not b!354911) (not b!354906) (not start!35430) (not b!354903) (not b!354908) (not mapNonEmpty!13353) (not b!354905))
(check-sat b_and!15087 (not b_next!7831))
