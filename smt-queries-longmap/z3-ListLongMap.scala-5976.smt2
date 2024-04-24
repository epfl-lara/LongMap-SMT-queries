; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77850 () Bool)

(assert start!77850)

(declare-fun b_free!16267 () Bool)

(declare-fun b_next!16267 () Bool)

(assert (=> start!77850 (= b_free!16267 (not b_next!16267))))

(declare-fun tp!57063 () Bool)

(declare-fun b_and!26697 () Bool)

(assert (=> start!77850 (= tp!57063 b_and!26697)))

(declare-fun b!906887 () Bool)

(declare-fun e!508287 () Bool)

(declare-fun e!508282 () Bool)

(declare-fun mapRes!29740 () Bool)

(assert (=> b!906887 (= e!508287 (and e!508282 mapRes!29740))))

(declare-fun condMapEmpty!29740 () Bool)

(declare-datatypes ((V!29879 0))(
  ( (V!29880 (val!9393 Int)) )
))
(declare-datatypes ((ValueCell!8861 0))(
  ( (ValueCellFull!8861 (v!11895 V!29879)) (EmptyCell!8861) )
))
(declare-datatypes ((array!53453 0))(
  ( (array!53454 (arr!25681 (Array (_ BitVec 32) ValueCell!8861)) (size!26141 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53453)

(declare-fun mapDefault!29740 () ValueCell!8861)

(assert (=> b!906887 (= condMapEmpty!29740 (= (arr!25681 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8861)) mapDefault!29740)))))

(declare-fun b!906888 () Bool)

(declare-fun e!508283 () Bool)

(declare-fun e!508284 () Bool)

(assert (=> b!906888 (= e!508283 (not e!508284))))

(declare-fun res!611741 () Bool)

(assert (=> b!906888 (=> res!611741 e!508284)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53455 0))(
  ( (array!53456 (arr!25682 (Array (_ BitVec 32) (_ BitVec 64))) (size!26142 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53455)

(assert (=> b!906888 (= res!611741 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26142 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409114 () V!29879)

(declare-fun get!13508 (ValueCell!8861 V!29879) V!29879)

(declare-fun dynLambda!1354 (Int (_ BitVec 64)) V!29879)

(assert (=> b!906888 (= lt!409114 (get!13508 (select (arr!25681 _values!1152) i!717) (dynLambda!1354 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906888 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29879)

(declare-datatypes ((Unit!30736 0))(
  ( (Unit!30737) )
))
(declare-fun lt!409113 () Unit!30736)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29879)

(declare-fun lemmaKeyInListMapIsInArray!213 (array!53455 array!53453 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 64) Int) Unit!30736)

(assert (=> b!906888 (= lt!409113 (lemmaKeyInListMapIsInArray!213 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906889 () Bool)

(declare-fun e!508286 () Bool)

(assert (=> b!906889 (= e!508286 e!508283)))

(declare-fun res!611739 () Bool)

(assert (=> b!906889 (=> (not res!611739) (not e!508283))))

(declare-datatypes ((tuple2!12152 0))(
  ( (tuple2!12153 (_1!6087 (_ BitVec 64)) (_2!6087 V!29879)) )
))
(declare-datatypes ((List!17993 0))(
  ( (Nil!17990) (Cons!17989 (h!19141 tuple2!12152) (t!25424 List!17993)) )
))
(declare-datatypes ((ListLongMap!10851 0))(
  ( (ListLongMap!10852 (toList!5441 List!17993)) )
))
(declare-fun lt!409115 () ListLongMap!10851)

(declare-fun contains!4496 (ListLongMap!10851 (_ BitVec 64)) Bool)

(assert (=> b!906889 (= res!611739 (contains!4496 lt!409115 k0!1033))))

(declare-fun getCurrentListMap!2707 (array!53455 array!53453 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 32) Int) ListLongMap!10851)

(assert (=> b!906889 (= lt!409115 (getCurrentListMap!2707 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906890 () Bool)

(declare-fun res!611737 () Bool)

(assert (=> b!906890 (=> (not res!611737) (not e!508286))))

(declare-datatypes ((List!17994 0))(
  ( (Nil!17991) (Cons!17990 (h!19142 (_ BitVec 64)) (t!25425 List!17994)) )
))
(declare-fun arrayNoDuplicates!0 (array!53455 (_ BitVec 32) List!17994) Bool)

(assert (=> b!906890 (= res!611737 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17991))))

(declare-fun b!906891 () Bool)

(declare-fun e!508281 () Bool)

(declare-fun tp_is_empty!18685 () Bool)

(assert (=> b!906891 (= e!508281 tp_is_empty!18685)))

(declare-fun b!906892 () Bool)

(declare-fun res!611742 () Bool)

(declare-fun e!508285 () Bool)

(assert (=> b!906892 (=> res!611742 e!508285)))

(declare-fun lt!409117 () ListLongMap!10851)

(declare-fun apply!463 (ListLongMap!10851 (_ BitVec 64)) V!29879)

(assert (=> b!906892 (= res!611742 (not (= (apply!463 lt!409117 k0!1033) lt!409114)))))

(declare-fun b!906893 () Bool)

(declare-fun res!611736 () Bool)

(assert (=> b!906893 (=> (not res!611736) (not e!508286))))

(assert (=> b!906893 (= res!611736 (and (= (size!26141 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26142 _keys!1386) (size!26141 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!611735 () Bool)

(assert (=> start!77850 (=> (not res!611735) (not e!508286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77850 (= res!611735 (validMask!0 mask!1756))))

(assert (=> start!77850 e!508286))

(declare-fun array_inv!20174 (array!53453) Bool)

(assert (=> start!77850 (and (array_inv!20174 _values!1152) e!508287)))

(assert (=> start!77850 tp!57063))

(assert (=> start!77850 true))

(assert (=> start!77850 tp_is_empty!18685))

(declare-fun array_inv!20175 (array!53455) Bool)

(assert (=> start!77850 (array_inv!20175 _keys!1386)))

(declare-fun b!906894 () Bool)

(assert (=> b!906894 (= e!508284 e!508285)))

(declare-fun res!611738 () Bool)

(assert (=> b!906894 (=> res!611738 e!508285)))

(assert (=> b!906894 (= res!611738 (not (contains!4496 lt!409117 k0!1033)))))

(assert (=> b!906894 (= lt!409117 (getCurrentListMap!2707 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906895 () Bool)

(assert (=> b!906895 (= e!508282 tp_is_empty!18685)))

(declare-fun mapIsEmpty!29740 () Bool)

(assert (=> mapIsEmpty!29740 mapRes!29740))

(declare-fun b!906896 () Bool)

(declare-fun res!611743 () Bool)

(assert (=> b!906896 (=> (not res!611743) (not e!508283))))

(assert (=> b!906896 (= res!611743 (and (= (select (arr!25682 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29740 () Bool)

(declare-fun tp!57064 () Bool)

(assert (=> mapNonEmpty!29740 (= mapRes!29740 (and tp!57064 e!508281))))

(declare-fun mapRest!29740 () (Array (_ BitVec 32) ValueCell!8861))

(declare-fun mapKey!29740 () (_ BitVec 32))

(declare-fun mapValue!29740 () ValueCell!8861)

(assert (=> mapNonEmpty!29740 (= (arr!25681 _values!1152) (store mapRest!29740 mapKey!29740 mapValue!29740))))

(declare-fun b!906897 () Bool)

(declare-fun res!611740 () Bool)

(assert (=> b!906897 (=> (not res!611740) (not e!508286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53455 (_ BitVec 32)) Bool)

(assert (=> b!906897 (= res!611740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906898 () Bool)

(declare-fun res!611734 () Bool)

(assert (=> b!906898 (=> (not res!611734) (not e!508283))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906898 (= res!611734 (inRange!0 i!717 mask!1756))))

(declare-fun b!906899 () Bool)

(assert (=> b!906899 (= e!508285 true)))

(assert (=> b!906899 (= (apply!463 lt!409115 k0!1033) lt!409114)))

(declare-fun lt!409116 () Unit!30736)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!18 (array!53455 array!53453 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 64) V!29879 (_ BitVec 32) Int) Unit!30736)

(assert (=> b!906899 (= lt!409116 (lemmaListMapApplyFromThenApplyFromZero!18 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409114 i!717 defaultEntry!1160))))

(assert (= (and start!77850 res!611735) b!906893))

(assert (= (and b!906893 res!611736) b!906897))

(assert (= (and b!906897 res!611740) b!906890))

(assert (= (and b!906890 res!611737) b!906889))

(assert (= (and b!906889 res!611739) b!906898))

(assert (= (and b!906898 res!611734) b!906896))

(assert (= (and b!906896 res!611743) b!906888))

(assert (= (and b!906888 (not res!611741)) b!906894))

(assert (= (and b!906894 (not res!611738)) b!906892))

(assert (= (and b!906892 (not res!611742)) b!906899))

(assert (= (and b!906887 condMapEmpty!29740) mapIsEmpty!29740))

(assert (= (and b!906887 (not condMapEmpty!29740)) mapNonEmpty!29740))

(get-info :version)

(assert (= (and mapNonEmpty!29740 ((_ is ValueCellFull!8861) mapValue!29740)) b!906891))

(assert (= (and b!906887 ((_ is ValueCellFull!8861) mapDefault!29740)) b!906895))

(assert (= start!77850 b!906887))

(declare-fun b_lambda!13155 () Bool)

(assert (=> (not b_lambda!13155) (not b!906888)))

(declare-fun t!25423 () Bool)

(declare-fun tb!5281 () Bool)

(assert (=> (and start!77850 (= defaultEntry!1160 defaultEntry!1160) t!25423) tb!5281))

(declare-fun result!10365 () Bool)

(assert (=> tb!5281 (= result!10365 tp_is_empty!18685)))

(assert (=> b!906888 t!25423))

(declare-fun b_and!26699 () Bool)

(assert (= b_and!26697 (and (=> t!25423 result!10365) b_and!26699)))

(declare-fun m!842669 () Bool)

(assert (=> b!906897 m!842669))

(declare-fun m!842671 () Bool)

(assert (=> b!906889 m!842671))

(declare-fun m!842673 () Bool)

(assert (=> b!906889 m!842673))

(declare-fun m!842675 () Bool)

(assert (=> b!906899 m!842675))

(declare-fun m!842677 () Bool)

(assert (=> b!906899 m!842677))

(declare-fun m!842679 () Bool)

(assert (=> b!906888 m!842679))

(declare-fun m!842681 () Bool)

(assert (=> b!906888 m!842681))

(declare-fun m!842683 () Bool)

(assert (=> b!906888 m!842683))

(declare-fun m!842685 () Bool)

(assert (=> b!906888 m!842685))

(assert (=> b!906888 m!842679))

(assert (=> b!906888 m!842683))

(declare-fun m!842687 () Bool)

(assert (=> b!906888 m!842687))

(declare-fun m!842689 () Bool)

(assert (=> b!906892 m!842689))

(declare-fun m!842691 () Bool)

(assert (=> start!77850 m!842691))

(declare-fun m!842693 () Bool)

(assert (=> start!77850 m!842693))

(declare-fun m!842695 () Bool)

(assert (=> start!77850 m!842695))

(declare-fun m!842697 () Bool)

(assert (=> b!906894 m!842697))

(declare-fun m!842699 () Bool)

(assert (=> b!906894 m!842699))

(declare-fun m!842701 () Bool)

(assert (=> b!906898 m!842701))

(declare-fun m!842703 () Bool)

(assert (=> b!906896 m!842703))

(declare-fun m!842705 () Bool)

(assert (=> mapNonEmpty!29740 m!842705))

(declare-fun m!842707 () Bool)

(assert (=> b!906890 m!842707))

(check-sat b_and!26699 (not b_next!16267) (not b!906899) (not b!906897) (not b!906894) tp_is_empty!18685 (not b_lambda!13155) (not b!906890) (not mapNonEmpty!29740) (not b!906888) (not b!906892) (not b!906889) (not start!77850) (not b!906898))
(check-sat b_and!26699 (not b_next!16267))
