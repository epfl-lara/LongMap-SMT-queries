; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113336 () Bool)

(assert start!113336)

(declare-fun b_free!31387 () Bool)

(declare-fun b_next!31387 () Bool)

(assert (=> start!113336 (= b_free!31387 (not b_next!31387))))

(declare-fun tp!109966 () Bool)

(declare-fun b_and!50609 () Bool)

(assert (=> start!113336 (= tp!109966 b_and!50609)))

(declare-fun mapNonEmpty!57787 () Bool)

(declare-fun mapRes!57787 () Bool)

(declare-fun tp!109967 () Bool)

(declare-fun e!765360 () Bool)

(assert (=> mapNonEmpty!57787 (= mapRes!57787 (and tp!109967 e!765360))))

(declare-datatypes ((V!54953 0))(
  ( (V!54954 (val!18768 Int)) )
))
(declare-datatypes ((ValueCell!17795 0))(
  ( (ValueCellFull!17795 (v!21415 V!54953)) (EmptyCell!17795) )
))
(declare-fun mapRest!57787 () (Array (_ BitVec 32) ValueCell!17795))

(declare-fun mapValue!57787 () ValueCell!17795)

(declare-fun mapKey!57787 () (_ BitVec 32))

(declare-datatypes ((array!91557 0))(
  ( (array!91558 (arr!44235 (Array (_ BitVec 32) ValueCell!17795)) (size!44787 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91557)

(assert (=> mapNonEmpty!57787 (= (arr!44235 _values!1303) (store mapRest!57787 mapKey!57787 mapValue!57787))))

(declare-fun b!1344849 () Bool)

(declare-fun tp_is_empty!37387 () Bool)

(assert (=> b!1344849 (= e!765360 tp_is_empty!37387)))

(declare-fun b!1344850 () Bool)

(declare-fun e!765357 () Bool)

(assert (=> b!1344850 (= e!765357 tp_is_empty!37387)))

(declare-fun b!1344851 () Bool)

(declare-fun res!892327 () Bool)

(declare-fun e!765358 () Bool)

(assert (=> b!1344851 (=> (not res!892327) (not e!765358))))

(declare-datatypes ((array!91559 0))(
  ( (array!91560 (arr!44236 (Array (_ BitVec 32) (_ BitVec 64))) (size!44788 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91559)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344851 (= res!892327 (validKeyInArray!0 (select (arr!44236 _keys!1571) from!1960)))))

(declare-fun b!1344852 () Bool)

(declare-fun res!892319 () Bool)

(assert (=> b!1344852 (=> (not res!892319) (not e!765358))))

(declare-fun minValue!1245 () V!54953)

(declare-fun zeroValue!1245 () V!54953)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24250 0))(
  ( (tuple2!24251 (_1!12136 (_ BitVec 64)) (_2!12136 V!54953)) )
))
(declare-datatypes ((List!31390 0))(
  ( (Nil!31387) (Cons!31386 (h!32595 tuple2!24250) (t!45926 List!31390)) )
))
(declare-datatypes ((ListLongMap!21907 0))(
  ( (ListLongMap!21908 (toList!10969 List!31390)) )
))
(declare-fun contains!9074 (ListLongMap!21907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5813 (array!91559 array!91557 (_ BitVec 32) (_ BitVec 32) V!54953 V!54953 (_ BitVec 32) Int) ListLongMap!21907)

(assert (=> b!1344852 (= res!892319 (contains!9074 (getCurrentListMap!5813 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57787 () Bool)

(assert (=> mapIsEmpty!57787 mapRes!57787))

(declare-fun b!1344853 () Bool)

(declare-fun res!892326 () Bool)

(assert (=> b!1344853 (=> (not res!892326) (not e!765358))))

(declare-datatypes ((List!31391 0))(
  ( (Nil!31388) (Cons!31387 (h!32596 (_ BitVec 64)) (t!45927 List!31391)) )
))
(declare-fun arrayNoDuplicates!0 (array!91559 (_ BitVec 32) List!31391) Bool)

(assert (=> b!1344853 (= res!892326 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31388))))

(declare-fun b!1344854 () Bool)

(declare-fun e!765362 () Bool)

(assert (=> b!1344854 (= e!765362 (not true))))

(declare-fun lt!595058 () ListLongMap!21907)

(assert (=> b!1344854 (contains!9074 lt!595058 k0!1142)))

(declare-datatypes ((Unit!43930 0))(
  ( (Unit!43931) )
))
(declare-fun lt!595059 () Unit!43930)

(declare-fun lt!595057 () V!54953)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!383 ((_ BitVec 64) (_ BitVec 64) V!54953 ListLongMap!21907) Unit!43930)

(assert (=> b!1344854 (= lt!595059 (lemmaInListMapAfterAddingDiffThenInBefore!383 k0!1142 (select (arr!44236 _keys!1571) from!1960) lt!595057 lt!595058))))

(declare-fun b!1344855 () Bool)

(assert (=> b!1344855 (= e!765358 e!765362)))

(declare-fun res!892320 () Bool)

(assert (=> b!1344855 (=> (not res!892320) (not e!765362))))

(declare-fun +!4848 (ListLongMap!21907 tuple2!24250) ListLongMap!21907)

(assert (=> b!1344855 (= res!892320 (contains!9074 (+!4848 lt!595058 (tuple2!24251 (select (arr!44236 _keys!1571) from!1960) lt!595057)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6491 (array!91559 array!91557 (_ BitVec 32) (_ BitVec 32) V!54953 V!54953 (_ BitVec 32) Int) ListLongMap!21907)

(assert (=> b!1344855 (= lt!595058 (getCurrentListMapNoExtraKeys!6491 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22350 (ValueCell!17795 V!54953) V!54953)

(declare-fun dynLambda!3778 (Int (_ BitVec 64)) V!54953)

(assert (=> b!1344855 (= lt!595057 (get!22350 (select (arr!44235 _values!1303) from!1960) (dynLambda!3778 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1344856 () Bool)

(declare-fun res!892317 () Bool)

(assert (=> b!1344856 (=> (not res!892317) (not e!765362))))

(assert (=> b!1344856 (= res!892317 (not (= k0!1142 (select (arr!44236 _keys!1571) from!1960))))))

(declare-fun b!1344857 () Bool)

(declare-fun res!892318 () Bool)

(assert (=> b!1344857 (=> (not res!892318) (not e!765358))))

(assert (=> b!1344857 (= res!892318 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44788 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344858 () Bool)

(declare-fun res!892325 () Bool)

(assert (=> b!1344858 (=> (not res!892325) (not e!765358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91559 (_ BitVec 32)) Bool)

(assert (=> b!1344858 (= res!892325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344859 () Bool)

(declare-fun res!892324 () Bool)

(assert (=> b!1344859 (=> (not res!892324) (not e!765358))))

(assert (=> b!1344859 (= res!892324 (not (= (select (arr!44236 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!892323 () Bool)

(assert (=> start!113336 (=> (not res!892323) (not e!765358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113336 (= res!892323 (validMask!0 mask!1977))))

(assert (=> start!113336 e!765358))

(assert (=> start!113336 tp_is_empty!37387))

(assert (=> start!113336 true))

(declare-fun array_inv!33527 (array!91559) Bool)

(assert (=> start!113336 (array_inv!33527 _keys!1571)))

(declare-fun e!765359 () Bool)

(declare-fun array_inv!33528 (array!91557) Bool)

(assert (=> start!113336 (and (array_inv!33528 _values!1303) e!765359)))

(assert (=> start!113336 tp!109966))

(declare-fun b!1344848 () Bool)

(declare-fun res!892321 () Bool)

(assert (=> b!1344848 (=> (not res!892321) (not e!765358))))

(assert (=> b!1344848 (= res!892321 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344860 () Bool)

(assert (=> b!1344860 (= e!765359 (and e!765357 mapRes!57787))))

(declare-fun condMapEmpty!57787 () Bool)

(declare-fun mapDefault!57787 () ValueCell!17795)

(assert (=> b!1344860 (= condMapEmpty!57787 (= (arr!44235 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17795)) mapDefault!57787)))))

(declare-fun b!1344861 () Bool)

(declare-fun res!892322 () Bool)

(assert (=> b!1344861 (=> (not res!892322) (not e!765358))))

(assert (=> b!1344861 (= res!892322 (and (= (size!44787 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44788 _keys!1571) (size!44787 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113336 res!892323) b!1344861))

(assert (= (and b!1344861 res!892322) b!1344858))

(assert (= (and b!1344858 res!892325) b!1344853))

(assert (= (and b!1344853 res!892326) b!1344857))

(assert (= (and b!1344857 res!892318) b!1344852))

(assert (= (and b!1344852 res!892319) b!1344859))

(assert (= (and b!1344859 res!892324) b!1344851))

(assert (= (and b!1344851 res!892327) b!1344848))

(assert (= (and b!1344848 res!892321) b!1344855))

(assert (= (and b!1344855 res!892320) b!1344856))

(assert (= (and b!1344856 res!892317) b!1344854))

(assert (= (and b!1344860 condMapEmpty!57787) mapIsEmpty!57787))

(assert (= (and b!1344860 (not condMapEmpty!57787)) mapNonEmpty!57787))

(get-info :version)

(assert (= (and mapNonEmpty!57787 ((_ is ValueCellFull!17795) mapValue!57787)) b!1344849))

(assert (= (and b!1344860 ((_ is ValueCellFull!17795) mapDefault!57787)) b!1344850))

(assert (= start!113336 b!1344860))

(declare-fun b_lambda!24499 () Bool)

(assert (=> (not b_lambda!24499) (not b!1344855)))

(declare-fun t!45925 () Bool)

(declare-fun tb!12339 () Bool)

(assert (=> (and start!113336 (= defaultEntry!1306 defaultEntry!1306) t!45925) tb!12339))

(declare-fun result!25777 () Bool)

(assert (=> tb!12339 (= result!25777 tp_is_empty!37387)))

(assert (=> b!1344855 t!45925))

(declare-fun b_and!50611 () Bool)

(assert (= b_and!50609 (and (=> t!45925 result!25777) b_and!50611)))

(declare-fun m!1231891 () Bool)

(assert (=> start!113336 m!1231891))

(declare-fun m!1231893 () Bool)

(assert (=> start!113336 m!1231893))

(declare-fun m!1231895 () Bool)

(assert (=> start!113336 m!1231895))

(declare-fun m!1231897 () Bool)

(assert (=> b!1344858 m!1231897))

(declare-fun m!1231899 () Bool)

(assert (=> mapNonEmpty!57787 m!1231899))

(declare-fun m!1231901 () Bool)

(assert (=> b!1344859 m!1231901))

(declare-fun m!1231903 () Bool)

(assert (=> b!1344854 m!1231903))

(assert (=> b!1344854 m!1231901))

(assert (=> b!1344854 m!1231901))

(declare-fun m!1231905 () Bool)

(assert (=> b!1344854 m!1231905))

(assert (=> b!1344851 m!1231901))

(assert (=> b!1344851 m!1231901))

(declare-fun m!1231907 () Bool)

(assert (=> b!1344851 m!1231907))

(declare-fun m!1231909 () Bool)

(assert (=> b!1344852 m!1231909))

(assert (=> b!1344852 m!1231909))

(declare-fun m!1231911 () Bool)

(assert (=> b!1344852 m!1231911))

(declare-fun m!1231913 () Bool)

(assert (=> b!1344855 m!1231913))

(declare-fun m!1231915 () Bool)

(assert (=> b!1344855 m!1231915))

(declare-fun m!1231917 () Bool)

(assert (=> b!1344855 m!1231917))

(declare-fun m!1231919 () Bool)

(assert (=> b!1344855 m!1231919))

(assert (=> b!1344855 m!1231915))

(declare-fun m!1231921 () Bool)

(assert (=> b!1344855 m!1231921))

(assert (=> b!1344855 m!1231917))

(assert (=> b!1344855 m!1231921))

(declare-fun m!1231923 () Bool)

(assert (=> b!1344855 m!1231923))

(assert (=> b!1344855 m!1231901))

(assert (=> b!1344856 m!1231901))

(declare-fun m!1231925 () Bool)

(assert (=> b!1344853 m!1231925))

(check-sat (not b!1344855) (not b!1344851) (not b!1344852) tp_is_empty!37387 (not b_lambda!24499) (not b_next!31387) (not mapNonEmpty!57787) (not b!1344853) (not start!113336) (not b!1344854) b_and!50611 (not b!1344858))
(check-sat b_and!50611 (not b_next!31387))
