; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77712 () Bool)

(assert start!77712)

(declare-fun b_free!16315 () Bool)

(declare-fun b_next!16315 () Bool)

(assert (=> start!77712 (= b_free!16315 (not b_next!16315))))

(declare-fun tp!57207 () Bool)

(declare-fun b_and!26757 () Bool)

(assert (=> start!77712 (= tp!57207 b_and!26757)))

(declare-fun b!906729 () Bool)

(declare-fun e!508133 () Bool)

(declare-fun e!508128 () Bool)

(assert (=> b!906729 (= e!508133 e!508128)))

(declare-fun res!612005 () Bool)

(assert (=> b!906729 (=> (not res!612005) (not e!508128))))

(declare-datatypes ((V!29943 0))(
  ( (V!29944 (val!9417 Int)) )
))
(declare-datatypes ((tuple2!12282 0))(
  ( (tuple2!12283 (_1!6152 (_ BitVec 64)) (_2!6152 V!29943)) )
))
(declare-datatypes ((List!18069 0))(
  ( (Nil!18066) (Cons!18065 (h!19211 tuple2!12282) (t!25547 List!18069)) )
))
(declare-datatypes ((ListLongMap!10969 0))(
  ( (ListLongMap!10970 (toList!5500 List!18069)) )
))
(declare-fun lt!408880 () ListLongMap!10969)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4504 (ListLongMap!10969 (_ BitVec 64)) Bool)

(assert (=> b!906729 (= res!612005 (contains!4504 lt!408880 k0!1033))))

(declare-datatypes ((ValueCell!8885 0))(
  ( (ValueCellFull!8885 (v!11921 V!29943)) (EmptyCell!8885) )
))
(declare-datatypes ((array!53481 0))(
  ( (array!53482 (arr!25700 (Array (_ BitVec 32) ValueCell!8885)) (size!26161 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53481)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29943)

(declare-datatypes ((array!53483 0))(
  ( (array!53484 (arr!25701 (Array (_ BitVec 32) (_ BitVec 64))) (size!26162 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53483)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29943)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun getCurrentListMap!2708 (array!53483 array!53481 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 32) Int) ListLongMap!10969)

(assert (=> b!906729 (= lt!408880 (getCurrentListMap!2708 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29812 () Bool)

(declare-fun mapRes!29812 () Bool)

(assert (=> mapIsEmpty!29812 mapRes!29812))

(declare-fun res!612003 () Bool)

(assert (=> start!77712 (=> (not res!612003) (not e!508133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77712 (= res!612003 (validMask!0 mask!1756))))

(assert (=> start!77712 e!508133))

(declare-fun e!508132 () Bool)

(declare-fun array_inv!20168 (array!53481) Bool)

(assert (=> start!77712 (and (array_inv!20168 _values!1152) e!508132)))

(assert (=> start!77712 tp!57207))

(assert (=> start!77712 true))

(declare-fun tp_is_empty!18733 () Bool)

(assert (=> start!77712 tp_is_empty!18733))

(declare-fun array_inv!20169 (array!53483) Bool)

(assert (=> start!77712 (array_inv!20169 _keys!1386)))

(declare-fun b!906730 () Bool)

(declare-fun e!508127 () Bool)

(assert (=> b!906730 (= e!508127 true)))

(declare-fun lt!408878 () V!29943)

(declare-fun apply!476 (ListLongMap!10969 (_ BitVec 64)) V!29943)

(assert (=> b!906730 (= (apply!476 lt!408880 k0!1033) lt!408878)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30702 0))(
  ( (Unit!30703) )
))
(declare-fun lt!408876 () Unit!30702)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!37 (array!53483 array!53481 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 64) V!29943 (_ BitVec 32) Int) Unit!30702)

(assert (=> b!906730 (= lt!408876 (lemmaListMapApplyFromThenApplyFromZero!37 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408878 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29812 () Bool)

(declare-fun tp!57208 () Bool)

(declare-fun e!508126 () Bool)

(assert (=> mapNonEmpty!29812 (= mapRes!29812 (and tp!57208 e!508126))))

(declare-fun mapValue!29812 () ValueCell!8885)

(declare-fun mapKey!29812 () (_ BitVec 32))

(declare-fun mapRest!29812 () (Array (_ BitVec 32) ValueCell!8885))

(assert (=> mapNonEmpty!29812 (= (arr!25700 _values!1152) (store mapRest!29812 mapKey!29812 mapValue!29812))))

(declare-fun b!906731 () Bool)

(declare-fun res!612004 () Bool)

(assert (=> b!906731 (=> (not res!612004) (not e!508128))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906731 (= res!612004 (inRange!0 i!717 mask!1756))))

(declare-fun b!906732 () Bool)

(declare-fun res!612008 () Bool)

(assert (=> b!906732 (=> (not res!612008) (not e!508133))))

(assert (=> b!906732 (= res!612008 (and (= (size!26161 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26162 _keys!1386) (size!26161 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906733 () Bool)

(declare-fun res!612009 () Bool)

(assert (=> b!906733 (=> (not res!612009) (not e!508128))))

(assert (=> b!906733 (= res!612009 (and (= (select (arr!25701 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906734 () Bool)

(assert (=> b!906734 (= e!508126 tp_is_empty!18733)))

(declare-fun b!906735 () Bool)

(declare-fun e!508131 () Bool)

(assert (=> b!906735 (= e!508132 (and e!508131 mapRes!29812))))

(declare-fun condMapEmpty!29812 () Bool)

(declare-fun mapDefault!29812 () ValueCell!8885)

(assert (=> b!906735 (= condMapEmpty!29812 (= (arr!25700 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8885)) mapDefault!29812)))))

(declare-fun b!906736 () Bool)

(declare-fun e!508130 () Bool)

(assert (=> b!906736 (= e!508128 (not e!508130))))

(declare-fun res!612006 () Bool)

(assert (=> b!906736 (=> res!612006 e!508130)))

(assert (=> b!906736 (= res!612006 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26162 _keys!1386))))))

(declare-fun get!13519 (ValueCell!8885 V!29943) V!29943)

(declare-fun dynLambda!1348 (Int (_ BitVec 64)) V!29943)

(assert (=> b!906736 (= lt!408878 (get!13519 (select (arr!25700 _values!1152) i!717) (dynLambda!1348 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906736 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408879 () Unit!30702)

(declare-fun lemmaKeyInListMapIsInArray!224 (array!53483 array!53481 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 64) Int) Unit!30702)

(assert (=> b!906736 (= lt!408879 (lemmaKeyInListMapIsInArray!224 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906737 () Bool)

(declare-fun res!612007 () Bool)

(assert (=> b!906737 (=> (not res!612007) (not e!508133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53483 (_ BitVec 32)) Bool)

(assert (=> b!906737 (= res!612007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906738 () Bool)

(declare-fun res!612002 () Bool)

(assert (=> b!906738 (=> (not res!612002) (not e!508133))))

(declare-datatypes ((List!18070 0))(
  ( (Nil!18067) (Cons!18066 (h!19212 (_ BitVec 64)) (t!25548 List!18070)) )
))
(declare-fun arrayNoDuplicates!0 (array!53483 (_ BitVec 32) List!18070) Bool)

(assert (=> b!906738 (= res!612002 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18067))))

(declare-fun b!906739 () Bool)

(declare-fun res!612001 () Bool)

(assert (=> b!906739 (=> res!612001 e!508127)))

(declare-fun lt!408877 () ListLongMap!10969)

(assert (=> b!906739 (= res!612001 (not (= (apply!476 lt!408877 k0!1033) lt!408878)))))

(declare-fun b!906740 () Bool)

(assert (=> b!906740 (= e!508130 e!508127)))

(declare-fun res!612000 () Bool)

(assert (=> b!906740 (=> res!612000 e!508127)))

(assert (=> b!906740 (= res!612000 (not (contains!4504 lt!408877 k0!1033)))))

(assert (=> b!906740 (= lt!408877 (getCurrentListMap!2708 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906741 () Bool)

(assert (=> b!906741 (= e!508131 tp_is_empty!18733)))

(assert (= (and start!77712 res!612003) b!906732))

(assert (= (and b!906732 res!612008) b!906737))

(assert (= (and b!906737 res!612007) b!906738))

(assert (= (and b!906738 res!612002) b!906729))

(assert (= (and b!906729 res!612005) b!906731))

(assert (= (and b!906731 res!612004) b!906733))

(assert (= (and b!906733 res!612009) b!906736))

(assert (= (and b!906736 (not res!612006)) b!906740))

(assert (= (and b!906740 (not res!612000)) b!906739))

(assert (= (and b!906739 (not res!612001)) b!906730))

(assert (= (and b!906735 condMapEmpty!29812) mapIsEmpty!29812))

(assert (= (and b!906735 (not condMapEmpty!29812)) mapNonEmpty!29812))

(get-info :version)

(assert (= (and mapNonEmpty!29812 ((_ is ValueCellFull!8885) mapValue!29812)) b!906734))

(assert (= (and b!906735 ((_ is ValueCellFull!8885) mapDefault!29812)) b!906741))

(assert (= start!77712 b!906735))

(declare-fun b_lambda!13171 () Bool)

(assert (=> (not b_lambda!13171) (not b!906736)))

(declare-fun t!25546 () Bool)

(declare-fun tb!5329 () Bool)

(assert (=> (and start!77712 (= defaultEntry!1160 defaultEntry!1160) t!25546) tb!5329))

(declare-fun result!10461 () Bool)

(assert (=> tb!5329 (= result!10461 tp_is_empty!18733)))

(assert (=> b!906736 t!25546))

(declare-fun b_and!26759 () Bool)

(assert (= b_and!26757 (and (=> t!25546 result!10461) b_and!26759)))

(declare-fun m!841577 () Bool)

(assert (=> b!906737 m!841577))

(declare-fun m!841579 () Bool)

(assert (=> b!906731 m!841579))

(declare-fun m!841581 () Bool)

(assert (=> b!906730 m!841581))

(declare-fun m!841583 () Bool)

(assert (=> b!906730 m!841583))

(declare-fun m!841585 () Bool)

(assert (=> b!906739 m!841585))

(declare-fun m!841587 () Bool)

(assert (=> b!906740 m!841587))

(declare-fun m!841589 () Bool)

(assert (=> b!906740 m!841589))

(declare-fun m!841591 () Bool)

(assert (=> b!906733 m!841591))

(declare-fun m!841593 () Bool)

(assert (=> mapNonEmpty!29812 m!841593))

(declare-fun m!841595 () Bool)

(assert (=> b!906738 m!841595))

(declare-fun m!841597 () Bool)

(assert (=> start!77712 m!841597))

(declare-fun m!841599 () Bool)

(assert (=> start!77712 m!841599))

(declare-fun m!841601 () Bool)

(assert (=> start!77712 m!841601))

(declare-fun m!841603 () Bool)

(assert (=> b!906736 m!841603))

(declare-fun m!841605 () Bool)

(assert (=> b!906736 m!841605))

(declare-fun m!841607 () Bool)

(assert (=> b!906736 m!841607))

(declare-fun m!841609 () Bool)

(assert (=> b!906736 m!841609))

(assert (=> b!906736 m!841603))

(assert (=> b!906736 m!841607))

(declare-fun m!841611 () Bool)

(assert (=> b!906736 m!841611))

(declare-fun m!841613 () Bool)

(assert (=> b!906729 m!841613))

(declare-fun m!841615 () Bool)

(assert (=> b!906729 m!841615))

(check-sat (not start!77712) (not b_lambda!13171) (not b!906736) (not b_next!16315) (not b!906739) (not b!906729) (not b!906737) (not b!906740) (not mapNonEmpty!29812) (not b!906731) (not b!906738) tp_is_empty!18733 b_and!26759 (not b!906730))
(check-sat b_and!26759 (not b_next!16315))
