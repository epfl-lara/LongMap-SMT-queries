; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77778 () Bool)

(assert start!77778)

(declare-fun b_free!16195 () Bool)

(declare-fun b_next!16195 () Bool)

(assert (=> start!77778 (= b_free!16195 (not b_next!16195))))

(declare-fun tp!56848 () Bool)

(declare-fun b_and!26571 () Bool)

(assert (=> start!77778 (= tp!56848 b_and!26571)))

(declare-fun b!905454 () Bool)

(declare-fun res!610679 () Bool)

(declare-fun e!507444 () Bool)

(assert (=> b!905454 (=> (not res!610679) (not e!507444))))

(declare-datatypes ((V!29783 0))(
  ( (V!29784 (val!9357 Int)) )
))
(declare-datatypes ((ValueCell!8825 0))(
  ( (ValueCellFull!8825 (v!11859 V!29783)) (EmptyCell!8825) )
))
(declare-datatypes ((array!53317 0))(
  ( (array!53318 (arr!25613 (Array (_ BitVec 32) ValueCell!8825)) (size!26073 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53317)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29783)

(declare-datatypes ((array!53319 0))(
  ( (array!53320 (arr!25614 (Array (_ BitVec 32) (_ BitVec 64))) (size!26074 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53319)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29783)

(declare-datatypes ((tuple2!12092 0))(
  ( (tuple2!12093 (_1!6057 (_ BitVec 64)) (_2!6057 V!29783)) )
))
(declare-datatypes ((List!17939 0))(
  ( (Nil!17936) (Cons!17935 (h!19087 tuple2!12092) (t!25314 List!17939)) )
))
(declare-datatypes ((ListLongMap!10791 0))(
  ( (ListLongMap!10792 (toList!5411 List!17939)) )
))
(declare-fun contains!4467 (ListLongMap!10791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2678 (array!53319 array!53317 (_ BitVec 32) (_ BitVec 32) V!29783 V!29783 (_ BitVec 32) Int) ListLongMap!10791)

(assert (=> b!905454 (= res!610679 (contains!4467 (getCurrentListMap!2678 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!905455 () Bool)

(declare-fun res!610687 () Bool)

(assert (=> b!905455 (=> (not res!610687) (not e!507444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53319 (_ BitVec 32)) Bool)

(assert (=> b!905455 (= res!610687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905456 () Bool)

(declare-fun e!507441 () Bool)

(assert (=> b!905456 (= e!507444 (not e!507441))))

(declare-fun res!610680 () Bool)

(assert (=> b!905456 (=> res!610680 e!507441)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905456 (= res!610680 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26074 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905456 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30684 0))(
  ( (Unit!30685) )
))
(declare-fun lt!408623 () Unit!30684)

(declare-fun lemmaKeyInListMapIsInArray!189 (array!53319 array!53317 (_ BitVec 32) (_ BitVec 32) V!29783 V!29783 (_ BitVec 64) Int) Unit!30684)

(assert (=> b!905456 (= lt!408623 (lemmaKeyInListMapIsInArray!189 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29632 () Bool)

(declare-fun mapRes!29632 () Bool)

(declare-fun tp!56847 () Bool)

(declare-fun e!507445 () Bool)

(assert (=> mapNonEmpty!29632 (= mapRes!29632 (and tp!56847 e!507445))))

(declare-fun mapKey!29632 () (_ BitVec 32))

(declare-fun mapRest!29632 () (Array (_ BitVec 32) ValueCell!8825))

(declare-fun mapValue!29632 () ValueCell!8825)

(assert (=> mapNonEmpty!29632 (= (arr!25613 _values!1152) (store mapRest!29632 mapKey!29632 mapValue!29632))))

(declare-fun res!610685 () Bool)

(assert (=> start!77778 (=> (not res!610685) (not e!507444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77778 (= res!610685 (validMask!0 mask!1756))))

(assert (=> start!77778 e!507444))

(declare-fun e!507443 () Bool)

(declare-fun array_inv!20126 (array!53317) Bool)

(assert (=> start!77778 (and (array_inv!20126 _values!1152) e!507443)))

(assert (=> start!77778 tp!56848))

(assert (=> start!77778 true))

(declare-fun tp_is_empty!18613 () Bool)

(assert (=> start!77778 tp_is_empty!18613))

(declare-fun array_inv!20127 (array!53319) Bool)

(assert (=> start!77778 (array_inv!20127 _keys!1386)))

(declare-fun b!905457 () Bool)

(declare-fun e!507447 () Bool)

(assert (=> b!905457 (= e!507447 tp_is_empty!18613)))

(declare-fun b!905458 () Bool)

(declare-fun res!610682 () Bool)

(assert (=> b!905458 (=> (not res!610682) (not e!507444))))

(declare-datatypes ((List!17940 0))(
  ( (Nil!17937) (Cons!17936 (h!19088 (_ BitVec 64)) (t!25315 List!17940)) )
))
(declare-fun arrayNoDuplicates!0 (array!53319 (_ BitVec 32) List!17940) Bool)

(assert (=> b!905458 (= res!610682 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17937))))

(declare-fun b!905459 () Bool)

(declare-fun e!507446 () Bool)

(assert (=> b!905459 (= e!507441 e!507446)))

(declare-fun res!610683 () Bool)

(assert (=> b!905459 (=> res!610683 e!507446)))

(declare-fun lt!408624 () ListLongMap!10791)

(assert (=> b!905459 (= res!610683 (not (contains!4467 lt!408624 k0!1033)))))

(assert (=> b!905459 (= lt!408624 (getCurrentListMap!2678 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905460 () Bool)

(declare-fun res!610681 () Bool)

(assert (=> b!905460 (=> (not res!610681) (not e!507444))))

(assert (=> b!905460 (= res!610681 (and (= (size!26073 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26074 _keys!1386) (size!26073 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905461 () Bool)

(assert (=> b!905461 (= e!507446 true)))

(declare-fun lt!408625 () V!29783)

(declare-fun apply!437 (ListLongMap!10791 (_ BitVec 64)) V!29783)

(assert (=> b!905461 (= lt!408625 (apply!437 lt!408624 k0!1033))))

(declare-fun b!905462 () Bool)

(declare-fun res!610686 () Bool)

(assert (=> b!905462 (=> (not res!610686) (not e!507444))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905462 (= res!610686 (inRange!0 i!717 mask!1756))))

(declare-fun b!905463 () Bool)

(assert (=> b!905463 (= e!507443 (and e!507447 mapRes!29632))))

(declare-fun condMapEmpty!29632 () Bool)

(declare-fun mapDefault!29632 () ValueCell!8825)

(assert (=> b!905463 (= condMapEmpty!29632 (= (arr!25613 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8825)) mapDefault!29632)))))

(declare-fun b!905464 () Bool)

(declare-fun res!610684 () Bool)

(assert (=> b!905464 (=> (not res!610684) (not e!507444))))

(assert (=> b!905464 (= res!610684 (and (= (select (arr!25614 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905465 () Bool)

(assert (=> b!905465 (= e!507445 tp_is_empty!18613)))

(declare-fun mapIsEmpty!29632 () Bool)

(assert (=> mapIsEmpty!29632 mapRes!29632))

(assert (= (and start!77778 res!610685) b!905460))

(assert (= (and b!905460 res!610681) b!905455))

(assert (= (and b!905455 res!610687) b!905458))

(assert (= (and b!905458 res!610682) b!905454))

(assert (= (and b!905454 res!610679) b!905462))

(assert (= (and b!905462 res!610686) b!905464))

(assert (= (and b!905464 res!610684) b!905456))

(assert (= (and b!905456 (not res!610680)) b!905459))

(assert (= (and b!905459 (not res!610683)) b!905461))

(assert (= (and b!905463 condMapEmpty!29632) mapIsEmpty!29632))

(assert (= (and b!905463 (not condMapEmpty!29632)) mapNonEmpty!29632))

(get-info :version)

(assert (= (and mapNonEmpty!29632 ((_ is ValueCellFull!8825) mapValue!29632)) b!905465))

(assert (= (and b!905463 ((_ is ValueCellFull!8825) mapDefault!29632)) b!905457))

(assert (= start!77778 b!905463))

(declare-fun m!841319 () Bool)

(assert (=> b!905455 m!841319))

(declare-fun m!841321 () Bool)

(assert (=> b!905461 m!841321))

(declare-fun m!841323 () Bool)

(assert (=> b!905454 m!841323))

(assert (=> b!905454 m!841323))

(declare-fun m!841325 () Bool)

(assert (=> b!905454 m!841325))

(declare-fun m!841327 () Bool)

(assert (=> b!905462 m!841327))

(declare-fun m!841329 () Bool)

(assert (=> start!77778 m!841329))

(declare-fun m!841331 () Bool)

(assert (=> start!77778 m!841331))

(declare-fun m!841333 () Bool)

(assert (=> start!77778 m!841333))

(declare-fun m!841335 () Bool)

(assert (=> b!905459 m!841335))

(declare-fun m!841337 () Bool)

(assert (=> b!905459 m!841337))

(declare-fun m!841339 () Bool)

(assert (=> b!905464 m!841339))

(declare-fun m!841341 () Bool)

(assert (=> mapNonEmpty!29632 m!841341))

(declare-fun m!841343 () Bool)

(assert (=> b!905458 m!841343))

(declare-fun m!841345 () Bool)

(assert (=> b!905456 m!841345))

(declare-fun m!841347 () Bool)

(assert (=> b!905456 m!841347))

(check-sat b_and!26571 (not b!905455) (not b!905461) (not b!905454) (not start!77778) (not b!905459) tp_is_empty!18613 (not b_next!16195) (not mapNonEmpty!29632) (not b!905458) (not b!905462) (not b!905456))
(check-sat b_and!26571 (not b_next!16195))
