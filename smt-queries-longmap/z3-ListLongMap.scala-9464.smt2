; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112616 () Bool)

(assert start!112616)

(declare-fun b_free!30787 () Bool)

(declare-fun b_next!30787 () Bool)

(assert (=> start!112616 (= b_free!30787 (not b_next!30787))))

(declare-fun tp!107997 () Bool)

(declare-fun b_and!49631 () Bool)

(assert (=> start!112616 (= tp!107997 b_and!49631)))

(declare-fun mapNonEmpty!56719 () Bool)

(declare-fun mapRes!56719 () Bool)

(declare-fun tp!107998 () Bool)

(declare-fun e!759948 () Bool)

(assert (=> mapNonEmpty!56719 (= mapRes!56719 (and tp!107998 e!759948))))

(declare-datatypes ((V!54033 0))(
  ( (V!54034 (val!18423 Int)) )
))
(declare-datatypes ((ValueCell!17450 0))(
  ( (ValueCellFull!17450 (v!21055 V!54033)) (EmptyCell!17450) )
))
(declare-datatypes ((array!90379 0))(
  ( (array!90380 (arr!43651 (Array (_ BitVec 32) ValueCell!17450)) (size!44202 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90379)

(declare-fun mapRest!56719 () (Array (_ BitVec 32) ValueCell!17450))

(declare-fun mapKey!56719 () (_ BitVec 32))

(declare-fun mapValue!56719 () ValueCell!17450)

(assert (=> mapNonEmpty!56719 (= (arr!43651 _values!1320) (store mapRest!56719 mapKey!56719 mapValue!56719))))

(declare-fun b!1333806 () Bool)

(declare-fun e!759945 () Bool)

(declare-fun tp_is_empty!36697 () Bool)

(assert (=> b!1333806 (= e!759945 tp_is_empty!36697)))

(declare-fun b!1333807 () Bool)

(declare-fun e!759949 () Bool)

(assert (=> b!1333807 (= e!759949 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90381 0))(
  ( (array!90382 (arr!43652 (Array (_ BitVec 32) (_ BitVec 64))) (size!44203 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90381)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54033)

(declare-fun zeroValue!1262 () V!54033)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592509 () Bool)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23778 0))(
  ( (tuple2!23779 (_1!11900 (_ BitVec 64)) (_2!11900 V!54033)) )
))
(declare-datatypes ((List!30934 0))(
  ( (Nil!30931) (Cons!30930 (h!32148 tuple2!23778) (t!45124 List!30934)) )
))
(declare-datatypes ((ListLongMap!21443 0))(
  ( (ListLongMap!21444 (toList!10737 List!30934)) )
))
(declare-fun contains!8913 (ListLongMap!21443 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5701 (array!90381 array!90379 (_ BitVec 32) (_ BitVec 32) V!54033 V!54033 (_ BitVec 32) Int) ListLongMap!21443)

(assert (=> b!1333807 (= lt!592509 (contains!8913 (getCurrentListMap!5701 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56719 () Bool)

(assert (=> mapIsEmpty!56719 mapRes!56719))

(declare-fun b!1333808 () Bool)

(assert (=> b!1333808 (= e!759948 tp_is_empty!36697)))

(declare-fun b!1333809 () Bool)

(declare-fun res!884793 () Bool)

(assert (=> b!1333809 (=> (not res!884793) (not e!759949))))

(assert (=> b!1333809 (= res!884793 (and (= (size!44202 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44203 _keys!1590) (size!44202 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333810 () Bool)

(declare-fun res!884791 () Bool)

(assert (=> b!1333810 (=> (not res!884791) (not e!759949))))

(declare-datatypes ((List!30935 0))(
  ( (Nil!30932) (Cons!30931 (h!32149 (_ BitVec 64)) (t!45125 List!30935)) )
))
(declare-fun arrayNoDuplicates!0 (array!90381 (_ BitVec 32) List!30935) Bool)

(assert (=> b!1333810 (= res!884791 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30932))))

(declare-fun res!884795 () Bool)

(assert (=> start!112616 (=> (not res!884795) (not e!759949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112616 (= res!884795 (validMask!0 mask!1998))))

(assert (=> start!112616 e!759949))

(declare-fun e!759947 () Bool)

(declare-fun array_inv!33199 (array!90379) Bool)

(assert (=> start!112616 (and (array_inv!33199 _values!1320) e!759947)))

(assert (=> start!112616 true))

(declare-fun array_inv!33200 (array!90381) Bool)

(assert (=> start!112616 (array_inv!33200 _keys!1590)))

(assert (=> start!112616 tp!107997))

(assert (=> start!112616 tp_is_empty!36697))

(declare-fun b!1333811 () Bool)

(declare-fun res!884792 () Bool)

(assert (=> b!1333811 (=> (not res!884792) (not e!759949))))

(assert (=> b!1333811 (= res!884792 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44203 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333812 () Bool)

(assert (=> b!1333812 (= e!759947 (and e!759945 mapRes!56719))))

(declare-fun condMapEmpty!56719 () Bool)

(declare-fun mapDefault!56719 () ValueCell!17450)

(assert (=> b!1333812 (= condMapEmpty!56719 (= (arr!43651 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17450)) mapDefault!56719)))))

(declare-fun b!1333813 () Bool)

(declare-fun res!884794 () Bool)

(assert (=> b!1333813 (=> (not res!884794) (not e!759949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90381 (_ BitVec 32)) Bool)

(assert (=> b!1333813 (= res!884794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112616 res!884795) b!1333809))

(assert (= (and b!1333809 res!884793) b!1333813))

(assert (= (and b!1333813 res!884794) b!1333810))

(assert (= (and b!1333810 res!884791) b!1333811))

(assert (= (and b!1333811 res!884792) b!1333807))

(assert (= (and b!1333812 condMapEmpty!56719) mapIsEmpty!56719))

(assert (= (and b!1333812 (not condMapEmpty!56719)) mapNonEmpty!56719))

(get-info :version)

(assert (= (and mapNonEmpty!56719 ((_ is ValueCellFull!17450) mapValue!56719)) b!1333808))

(assert (= (and b!1333812 ((_ is ValueCellFull!17450) mapDefault!56719)) b!1333806))

(assert (= start!112616 b!1333812))

(declare-fun m!1222937 () Bool)

(assert (=> b!1333810 m!1222937))

(declare-fun m!1222939 () Bool)

(assert (=> b!1333807 m!1222939))

(assert (=> b!1333807 m!1222939))

(declare-fun m!1222941 () Bool)

(assert (=> b!1333807 m!1222941))

(declare-fun m!1222943 () Bool)

(assert (=> start!112616 m!1222943))

(declare-fun m!1222945 () Bool)

(assert (=> start!112616 m!1222945))

(declare-fun m!1222947 () Bool)

(assert (=> start!112616 m!1222947))

(declare-fun m!1222949 () Bool)

(assert (=> mapNonEmpty!56719 m!1222949))

(declare-fun m!1222951 () Bool)

(assert (=> b!1333813 m!1222951))

(check-sat (not b_next!30787) (not mapNonEmpty!56719) tp_is_empty!36697 (not b!1333807) (not b!1333810) (not b!1333813) b_and!49631 (not start!112616))
(check-sat b_and!49631 (not b_next!30787))
