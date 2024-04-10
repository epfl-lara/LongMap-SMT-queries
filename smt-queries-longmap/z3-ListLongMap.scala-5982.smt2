; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77720 () Bool)

(assert start!77720)

(declare-fun b_free!16305 () Bool)

(declare-fun b_next!16305 () Bool)

(assert (=> start!77720 (= b_free!16305 (not b_next!16305))))

(declare-fun tp!57176 () Bool)

(declare-fun b_and!26763 () Bool)

(assert (=> start!77720 (= tp!57176 b_and!26763)))

(declare-fun b!906763 () Bool)

(declare-fun res!611964 () Bool)

(declare-fun e!508159 () Bool)

(assert (=> b!906763 (=> (not res!611964) (not e!508159))))

(declare-datatypes ((array!53488 0))(
  ( (array!53489 (arr!25703 (Array (_ BitVec 32) (_ BitVec 64))) (size!26162 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53488)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53488 (_ BitVec 32)) Bool)

(assert (=> b!906763 (= res!611964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29797 () Bool)

(declare-fun mapRes!29797 () Bool)

(assert (=> mapIsEmpty!29797 mapRes!29797))

(declare-fun b!906764 () Bool)

(declare-fun res!611967 () Bool)

(declare-fun e!508161 () Bool)

(assert (=> b!906764 (=> (not res!611967) (not e!508161))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!906764 (= res!611967 (and (= (select (arr!25703 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906765 () Bool)

(declare-fun e!508155 () Bool)

(declare-fun e!508160 () Bool)

(assert (=> b!906765 (= e!508155 (and e!508160 mapRes!29797))))

(declare-fun condMapEmpty!29797 () Bool)

(declare-datatypes ((V!29929 0))(
  ( (V!29930 (val!9412 Int)) )
))
(declare-datatypes ((ValueCell!8880 0))(
  ( (ValueCellFull!8880 (v!11917 V!29929)) (EmptyCell!8880) )
))
(declare-datatypes ((array!53490 0))(
  ( (array!53491 (arr!25704 (Array (_ BitVec 32) ValueCell!8880)) (size!26163 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53490)

(declare-fun mapDefault!29797 () ValueCell!8880)

(assert (=> b!906765 (= condMapEmpty!29797 (= (arr!25704 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8880)) mapDefault!29797)))))

(declare-fun b!906766 () Bool)

(declare-fun e!508158 () Bool)

(declare-fun e!508154 () Bool)

(assert (=> b!906766 (= e!508158 e!508154)))

(declare-fun res!611962 () Bool)

(assert (=> b!906766 (=> res!611962 e!508154)))

(declare-datatypes ((tuple2!12256 0))(
  ( (tuple2!12257 (_1!6139 (_ BitVec 64)) (_2!6139 V!29929)) )
))
(declare-datatypes ((List!18060 0))(
  ( (Nil!18057) (Cons!18056 (h!19202 tuple2!12256) (t!25537 List!18060)) )
))
(declare-datatypes ((ListLongMap!10953 0))(
  ( (ListLongMap!10954 (toList!5492 List!18060)) )
))
(declare-fun lt!409038 () ListLongMap!10953)

(declare-fun contains!4537 (ListLongMap!10953 (_ BitVec 64)) Bool)

(assert (=> b!906766 (= res!611962 (not (contains!4537 lt!409038 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29929)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29929)

(declare-fun getCurrentListMap!2758 (array!53488 array!53490 (_ BitVec 32) (_ BitVec 32) V!29929 V!29929 (_ BitVec 32) Int) ListLongMap!10953)

(assert (=> b!906766 (= lt!409038 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906767 () Bool)

(declare-fun res!611960 () Bool)

(assert (=> b!906767 (=> (not res!611960) (not e!508159))))

(assert (=> b!906767 (= res!611960 (and (= (size!26163 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26162 _keys!1386) (size!26163 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906768 () Bool)

(declare-fun e!508157 () Bool)

(declare-fun tp_is_empty!18723 () Bool)

(assert (=> b!906768 (= e!508157 tp_is_empty!18723)))

(declare-fun b!906769 () Bool)

(assert (=> b!906769 (= e!508161 (not e!508158))))

(declare-fun res!611968 () Bool)

(assert (=> b!906769 (=> res!611968 e!508158)))

(assert (=> b!906769 (= res!611968 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26162 _keys!1386))))))

(declare-fun lt!409037 () V!29929)

(declare-fun get!13517 (ValueCell!8880 V!29929) V!29929)

(declare-fun dynLambda!1355 (Int (_ BitVec 64)) V!29929)

(assert (=> b!906769 (= lt!409037 (get!13517 (select (arr!25704 _values!1152) i!717) (dynLambda!1355 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906769 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30778 0))(
  ( (Unit!30779) )
))
(declare-fun lt!409040 () Unit!30778)

(declare-fun lemmaKeyInListMapIsInArray!227 (array!53488 array!53490 (_ BitVec 32) (_ BitVec 32) V!29929 V!29929 (_ BitVec 64) Int) Unit!30778)

(assert (=> b!906769 (= lt!409040 (lemmaKeyInListMapIsInArray!227 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906770 () Bool)

(assert (=> b!906770 (= e!508159 e!508161)))

(declare-fun res!611961 () Bool)

(assert (=> b!906770 (=> (not res!611961) (not e!508161))))

(declare-fun lt!409039 () ListLongMap!10953)

(assert (=> b!906770 (= res!611961 (contains!4537 lt!409039 k0!1033))))

(assert (=> b!906770 (= lt!409039 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906771 () Bool)

(declare-fun res!611963 () Bool)

(assert (=> b!906771 (=> res!611963 e!508154)))

(declare-fun apply!478 (ListLongMap!10953 (_ BitVec 64)) V!29929)

(assert (=> b!906771 (= res!611963 (not (= (apply!478 lt!409038 k0!1033) lt!409037)))))

(declare-fun b!906772 () Bool)

(assert (=> b!906772 (= e!508160 tp_is_empty!18723)))

(declare-fun b!906773 () Bool)

(assert (=> b!906773 (= e!508154 true)))

(assert (=> b!906773 (= (apply!478 lt!409039 k0!1033) lt!409037)))

(declare-fun lt!409041 () Unit!30778)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!33 (array!53488 array!53490 (_ BitVec 32) (_ BitVec 32) V!29929 V!29929 (_ BitVec 64) V!29929 (_ BitVec 32) Int) Unit!30778)

(assert (=> b!906773 (= lt!409041 (lemmaListMapApplyFromThenApplyFromZero!33 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409037 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29797 () Bool)

(declare-fun tp!57177 () Bool)

(assert (=> mapNonEmpty!29797 (= mapRes!29797 (and tp!57177 e!508157))))

(declare-fun mapRest!29797 () (Array (_ BitVec 32) ValueCell!8880))

(declare-fun mapKey!29797 () (_ BitVec 32))

(declare-fun mapValue!29797 () ValueCell!8880)

(assert (=> mapNonEmpty!29797 (= (arr!25704 _values!1152) (store mapRest!29797 mapKey!29797 mapValue!29797))))

(declare-fun res!611969 () Bool)

(assert (=> start!77720 (=> (not res!611969) (not e!508159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77720 (= res!611969 (validMask!0 mask!1756))))

(assert (=> start!77720 e!508159))

(declare-fun array_inv!20136 (array!53490) Bool)

(assert (=> start!77720 (and (array_inv!20136 _values!1152) e!508155)))

(assert (=> start!77720 tp!57176))

(assert (=> start!77720 true))

(assert (=> start!77720 tp_is_empty!18723))

(declare-fun array_inv!20137 (array!53488) Bool)

(assert (=> start!77720 (array_inv!20137 _keys!1386)))

(declare-fun b!906774 () Bool)

(declare-fun res!611965 () Bool)

(assert (=> b!906774 (=> (not res!611965) (not e!508159))))

(declare-datatypes ((List!18061 0))(
  ( (Nil!18058) (Cons!18057 (h!19203 (_ BitVec 64)) (t!25538 List!18061)) )
))
(declare-fun arrayNoDuplicates!0 (array!53488 (_ BitVec 32) List!18061) Bool)

(assert (=> b!906774 (= res!611965 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18058))))

(declare-fun b!906775 () Bool)

(declare-fun res!611966 () Bool)

(assert (=> b!906775 (=> (not res!611966) (not e!508161))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906775 (= res!611966 (inRange!0 i!717 mask!1756))))

(assert (= (and start!77720 res!611969) b!906767))

(assert (= (and b!906767 res!611960) b!906763))

(assert (= (and b!906763 res!611964) b!906774))

(assert (= (and b!906774 res!611965) b!906770))

(assert (= (and b!906770 res!611961) b!906775))

(assert (= (and b!906775 res!611966) b!906764))

(assert (= (and b!906764 res!611967) b!906769))

(assert (= (and b!906769 (not res!611968)) b!906766))

(assert (= (and b!906766 (not res!611962)) b!906771))

(assert (= (and b!906771 (not res!611963)) b!906773))

(assert (= (and b!906765 condMapEmpty!29797) mapIsEmpty!29797))

(assert (= (and b!906765 (not condMapEmpty!29797)) mapNonEmpty!29797))

(get-info :version)

(assert (= (and mapNonEmpty!29797 ((_ is ValueCellFull!8880) mapValue!29797)) b!906768))

(assert (= (and b!906765 ((_ is ValueCellFull!8880) mapDefault!29797)) b!906772))

(assert (= start!77720 b!906765))

(declare-fun b_lambda!13179 () Bool)

(assert (=> (not b_lambda!13179) (not b!906769)))

(declare-fun t!25536 () Bool)

(declare-fun tb!5327 () Bool)

(assert (=> (and start!77720 (= defaultEntry!1160 defaultEntry!1160) t!25536) tb!5327))

(declare-fun result!10449 () Bool)

(assert (=> tb!5327 (= result!10449 tp_is_empty!18723)))

(assert (=> b!906769 t!25536))

(declare-fun b_and!26765 () Bool)

(assert (= b_and!26763 (and (=> t!25536 result!10449) b_and!26765)))

(declare-fun m!842135 () Bool)

(assert (=> b!906771 m!842135))

(declare-fun m!842137 () Bool)

(assert (=> b!906764 m!842137))

(declare-fun m!842139 () Bool)

(assert (=> b!906769 m!842139))

(declare-fun m!842141 () Bool)

(assert (=> b!906769 m!842141))

(declare-fun m!842143 () Bool)

(assert (=> b!906769 m!842143))

(declare-fun m!842145 () Bool)

(assert (=> b!906769 m!842145))

(assert (=> b!906769 m!842139))

(assert (=> b!906769 m!842143))

(declare-fun m!842147 () Bool)

(assert (=> b!906769 m!842147))

(declare-fun m!842149 () Bool)

(assert (=> mapNonEmpty!29797 m!842149))

(declare-fun m!842151 () Bool)

(assert (=> b!906763 m!842151))

(declare-fun m!842153 () Bool)

(assert (=> b!906775 m!842153))

(declare-fun m!842155 () Bool)

(assert (=> b!906770 m!842155))

(declare-fun m!842157 () Bool)

(assert (=> b!906770 m!842157))

(declare-fun m!842159 () Bool)

(assert (=> b!906774 m!842159))

(declare-fun m!842161 () Bool)

(assert (=> b!906766 m!842161))

(declare-fun m!842163 () Bool)

(assert (=> b!906766 m!842163))

(declare-fun m!842165 () Bool)

(assert (=> b!906773 m!842165))

(declare-fun m!842167 () Bool)

(assert (=> b!906773 m!842167))

(declare-fun m!842169 () Bool)

(assert (=> start!77720 m!842169))

(declare-fun m!842171 () Bool)

(assert (=> start!77720 m!842171))

(declare-fun m!842173 () Bool)

(assert (=> start!77720 m!842173))

(check-sat (not b!906775) (not b!906766) (not start!77720) (not b!906773) (not mapNonEmpty!29797) b_and!26765 (not b!906763) (not b!906771) (not b!906770) (not b!906774) (not b!906769) (not b_next!16305) tp_is_empty!18723 (not b_lambda!13179))
(check-sat b_and!26765 (not b_next!16305))
