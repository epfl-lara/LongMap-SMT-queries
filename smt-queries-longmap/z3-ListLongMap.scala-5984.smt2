; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77898 () Bool)

(assert start!77898)

(declare-fun b_free!16315 () Bool)

(declare-fun b_next!16315 () Bool)

(assert (=> start!77898 (= b_free!16315 (not b_next!16315))))

(declare-fun tp!57207 () Bool)

(declare-fun b_and!26793 () Bool)

(assert (=> start!77898 (= tp!57207 b_and!26793)))

(declare-fun b!907871 () Bool)

(declare-fun e!508857 () Bool)

(declare-fun e!508860 () Bool)

(assert (=> b!907871 (= e!508857 (not e!508860))))

(declare-fun res!612457 () Bool)

(assert (=> b!907871 (=> res!612457 e!508860)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53545 0))(
  ( (array!53546 (arr!25727 (Array (_ BitVec 32) (_ BitVec 64))) (size!26187 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53545)

(assert (=> b!907871 (= res!612457 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26187 _keys!1386))))))

(declare-datatypes ((V!29943 0))(
  ( (V!29944 (val!9417 Int)) )
))
(declare-datatypes ((ValueCell!8885 0))(
  ( (ValueCellFull!8885 (v!11919 V!29943)) (EmptyCell!8885) )
))
(declare-datatypes ((array!53547 0))(
  ( (array!53548 (arr!25728 (Array (_ BitVec 32) ValueCell!8885)) (size!26188 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53547)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409477 () V!29943)

(declare-fun get!13542 (ValueCell!8885 V!29943) V!29943)

(declare-fun dynLambda!1372 (Int (_ BitVec 64)) V!29943)

(assert (=> b!907871 (= lt!409477 (get!13542 (select (arr!25728 _values!1152) i!717) (dynLambda!1372 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907871 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29943)

(declare-datatypes ((Unit!30774 0))(
  ( (Unit!30775) )
))
(declare-fun lt!409473 () Unit!30774)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29943)

(declare-fun lemmaKeyInListMapIsInArray!231 (array!53545 array!53547 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 64) Int) Unit!30774)

(assert (=> b!907871 (= lt!409473 (lemmaKeyInListMapIsInArray!231 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907872 () Bool)

(declare-fun res!612463 () Bool)

(declare-fun e!508861 () Bool)

(assert (=> b!907872 (=> res!612463 e!508861)))

(declare-datatypes ((tuple2!12194 0))(
  ( (tuple2!12195 (_1!6108 (_ BitVec 64)) (_2!6108 V!29943)) )
))
(declare-datatypes ((List!18028 0))(
  ( (Nil!18025) (Cons!18024 (h!19176 tuple2!12194) (t!25507 List!18028)) )
))
(declare-datatypes ((ListLongMap!10893 0))(
  ( (ListLongMap!10894 (toList!5462 List!18028)) )
))
(declare-fun lt!409475 () ListLongMap!10893)

(declare-fun apply!481 (ListLongMap!10893 (_ BitVec 64)) V!29943)

(assert (=> b!907872 (= res!612463 (not (= (apply!481 lt!409475 k0!1033) lt!409477)))))

(declare-fun b!907873 () Bool)

(assert (=> b!907873 (= e!508861 true)))

(declare-fun lt!409474 () ListLongMap!10893)

(assert (=> b!907873 (= (apply!481 lt!409474 k0!1033) lt!409477)))

(declare-fun lt!409476 () Unit!30774)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!33 (array!53545 array!53547 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 64) V!29943 (_ BitVec 32) Int) Unit!30774)

(assert (=> b!907873 (= lt!409476 (lemmaListMapApplyFromThenApplyFromZero!33 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409477 i!717 defaultEntry!1160))))

(declare-fun b!907874 () Bool)

(assert (=> b!907874 (= e!508860 e!508861)))

(declare-fun res!612459 () Bool)

(assert (=> b!907874 (=> res!612459 e!508861)))

(declare-fun contains!4516 (ListLongMap!10893 (_ BitVec 64)) Bool)

(assert (=> b!907874 (= res!612459 (not (contains!4516 lt!409475 k0!1033)))))

(declare-fun getCurrentListMap!2727 (array!53545 array!53547 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 32) Int) ListLongMap!10893)

(assert (=> b!907874 (= lt!409475 (getCurrentListMap!2727 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907875 () Bool)

(declare-fun e!508862 () Bool)

(assert (=> b!907875 (= e!508862 e!508857)))

(declare-fun res!612461 () Bool)

(assert (=> b!907875 (=> (not res!612461) (not e!508857))))

(assert (=> b!907875 (= res!612461 (contains!4516 lt!409474 k0!1033))))

(assert (=> b!907875 (= lt!409474 (getCurrentListMap!2727 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29812 () Bool)

(declare-fun mapRes!29812 () Bool)

(declare-fun tp!57208 () Bool)

(declare-fun e!508856 () Bool)

(assert (=> mapNonEmpty!29812 (= mapRes!29812 (and tp!57208 e!508856))))

(declare-fun mapKey!29812 () (_ BitVec 32))

(declare-fun mapRest!29812 () (Array (_ BitVec 32) ValueCell!8885))

(declare-fun mapValue!29812 () ValueCell!8885)

(assert (=> mapNonEmpty!29812 (= (arr!25728 _values!1152) (store mapRest!29812 mapKey!29812 mapValue!29812))))

(declare-fun res!612456 () Bool)

(assert (=> start!77898 (=> (not res!612456) (not e!508862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77898 (= res!612456 (validMask!0 mask!1756))))

(assert (=> start!77898 e!508862))

(declare-fun e!508858 () Bool)

(declare-fun array_inv!20204 (array!53547) Bool)

(assert (=> start!77898 (and (array_inv!20204 _values!1152) e!508858)))

(assert (=> start!77898 tp!57207))

(assert (=> start!77898 true))

(declare-fun tp_is_empty!18733 () Bool)

(assert (=> start!77898 tp_is_empty!18733))

(declare-fun array_inv!20205 (array!53545) Bool)

(assert (=> start!77898 (array_inv!20205 _keys!1386)))

(declare-fun mapIsEmpty!29812 () Bool)

(assert (=> mapIsEmpty!29812 mapRes!29812))

(declare-fun b!907876 () Bool)

(declare-fun e!508859 () Bool)

(assert (=> b!907876 (= e!508858 (and e!508859 mapRes!29812))))

(declare-fun condMapEmpty!29812 () Bool)

(declare-fun mapDefault!29812 () ValueCell!8885)

(assert (=> b!907876 (= condMapEmpty!29812 (= (arr!25728 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8885)) mapDefault!29812)))))

(declare-fun b!907877 () Bool)

(declare-fun res!612455 () Bool)

(assert (=> b!907877 (=> (not res!612455) (not e!508862))))

(assert (=> b!907877 (= res!612455 (and (= (size!26188 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26187 _keys!1386) (size!26188 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907878 () Bool)

(declare-fun res!612458 () Bool)

(assert (=> b!907878 (=> (not res!612458) (not e!508857))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907878 (= res!612458 (inRange!0 i!717 mask!1756))))

(declare-fun b!907879 () Bool)

(declare-fun res!612454 () Bool)

(assert (=> b!907879 (=> (not res!612454) (not e!508862))))

(declare-datatypes ((List!18029 0))(
  ( (Nil!18026) (Cons!18025 (h!19177 (_ BitVec 64)) (t!25508 List!18029)) )
))
(declare-fun arrayNoDuplicates!0 (array!53545 (_ BitVec 32) List!18029) Bool)

(assert (=> b!907879 (= res!612454 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18026))))

(declare-fun b!907880 () Bool)

(assert (=> b!907880 (= e!508856 tp_is_empty!18733)))

(declare-fun b!907881 () Bool)

(declare-fun res!612460 () Bool)

(assert (=> b!907881 (=> (not res!612460) (not e!508862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53545 (_ BitVec 32)) Bool)

(assert (=> b!907881 (= res!612460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907882 () Bool)

(assert (=> b!907882 (= e!508859 tp_is_empty!18733)))

(declare-fun b!907883 () Bool)

(declare-fun res!612462 () Bool)

(assert (=> b!907883 (=> (not res!612462) (not e!508857))))

(assert (=> b!907883 (= res!612462 (and (= (select (arr!25727 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77898 res!612456) b!907877))

(assert (= (and b!907877 res!612455) b!907881))

(assert (= (and b!907881 res!612460) b!907879))

(assert (= (and b!907879 res!612454) b!907875))

(assert (= (and b!907875 res!612461) b!907878))

(assert (= (and b!907878 res!612458) b!907883))

(assert (= (and b!907883 res!612462) b!907871))

(assert (= (and b!907871 (not res!612457)) b!907874))

(assert (= (and b!907874 (not res!612459)) b!907872))

(assert (= (and b!907872 (not res!612463)) b!907873))

(assert (= (and b!907876 condMapEmpty!29812) mapIsEmpty!29812))

(assert (= (and b!907876 (not condMapEmpty!29812)) mapNonEmpty!29812))

(get-info :version)

(assert (= (and mapNonEmpty!29812 ((_ is ValueCellFull!8885) mapValue!29812)) b!907880))

(assert (= (and b!907876 ((_ is ValueCellFull!8885) mapDefault!29812)) b!907882))

(assert (= start!77898 b!907876))

(declare-fun b_lambda!13203 () Bool)

(assert (=> (not b_lambda!13203) (not b!907871)))

(declare-fun t!25506 () Bool)

(declare-fun tb!5329 () Bool)

(assert (=> (and start!77898 (= defaultEntry!1160 defaultEntry!1160) t!25506) tb!5329))

(declare-fun result!10461 () Bool)

(assert (=> tb!5329 (= result!10461 tp_is_empty!18733)))

(assert (=> b!907871 t!25506))

(declare-fun b_and!26795 () Bool)

(assert (= b_and!26793 (and (=> t!25506 result!10461) b_and!26795)))

(declare-fun m!843629 () Bool)

(assert (=> b!907873 m!843629))

(declare-fun m!843631 () Bool)

(assert (=> b!907873 m!843631))

(declare-fun m!843633 () Bool)

(assert (=> b!907879 m!843633))

(declare-fun m!843635 () Bool)

(assert (=> b!907878 m!843635))

(declare-fun m!843637 () Bool)

(assert (=> b!907874 m!843637))

(declare-fun m!843639 () Bool)

(assert (=> b!907874 m!843639))

(declare-fun m!843641 () Bool)

(assert (=> b!907883 m!843641))

(declare-fun m!843643 () Bool)

(assert (=> mapNonEmpty!29812 m!843643))

(declare-fun m!843645 () Bool)

(assert (=> b!907871 m!843645))

(declare-fun m!843647 () Bool)

(assert (=> b!907871 m!843647))

(declare-fun m!843649 () Bool)

(assert (=> b!907871 m!843649))

(declare-fun m!843651 () Bool)

(assert (=> b!907871 m!843651))

(assert (=> b!907871 m!843645))

(assert (=> b!907871 m!843649))

(declare-fun m!843653 () Bool)

(assert (=> b!907871 m!843653))

(declare-fun m!843655 () Bool)

(assert (=> start!77898 m!843655))

(declare-fun m!843657 () Bool)

(assert (=> start!77898 m!843657))

(declare-fun m!843659 () Bool)

(assert (=> start!77898 m!843659))

(declare-fun m!843661 () Bool)

(assert (=> b!907881 m!843661))

(declare-fun m!843663 () Bool)

(assert (=> b!907872 m!843663))

(declare-fun m!843665 () Bool)

(assert (=> b!907875 m!843665))

(declare-fun m!843667 () Bool)

(assert (=> b!907875 m!843667))

(check-sat (not b!907873) (not b!907871) tp_is_empty!18733 (not b!907874) (not mapNonEmpty!29812) (not b!907872) (not b!907881) (not b_lambda!13203) (not b_next!16315) (not b!907875) (not start!77898) b_and!26795 (not b!907878) (not b!907879))
(check-sat b_and!26795 (not b_next!16315))
