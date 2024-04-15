; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77822 () Bool)

(assert start!77822)

(declare-fun b_free!16399 () Bool)

(declare-fun b_next!16399 () Bool)

(assert (=> start!77822 (= b_free!16399 (not b_next!16399))))

(declare-fun tp!57462 () Bool)

(declare-fun b_and!26929 () Bool)

(assert (=> start!77822 (= tp!57462 b_and!26929)))

(declare-fun res!613333 () Bool)

(declare-fun e!509236 () Bool)

(assert (=> start!77822 (=> (not res!613333) (not e!509236))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77822 (= res!613333 (validMask!0 mask!1756))))

(assert (=> start!77822 e!509236))

(declare-datatypes ((V!30055 0))(
  ( (V!30056 (val!9459 Int)) )
))
(declare-datatypes ((ValueCell!8927 0))(
  ( (ValueCellFull!8927 (v!11965 V!30055)) (EmptyCell!8927) )
))
(declare-datatypes ((array!53647 0))(
  ( (array!53648 (arr!25782 (Array (_ BitVec 32) ValueCell!8927)) (size!26243 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53647)

(declare-fun e!509240 () Bool)

(declare-fun array_inv!20222 (array!53647) Bool)

(assert (=> start!77822 (and (array_inv!20222 _values!1152) e!509240)))

(assert (=> start!77822 tp!57462))

(assert (=> start!77822 true))

(declare-fun tp_is_empty!18817 () Bool)

(assert (=> start!77822 tp_is_empty!18817))

(declare-datatypes ((array!53649 0))(
  ( (array!53650 (arr!25783 (Array (_ BitVec 32) (_ BitVec 64))) (size!26244 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53649)

(declare-fun array_inv!20223 (array!53649) Bool)

(assert (=> start!77822 (array_inv!20223 _keys!1386)))

(declare-fun b!908603 () Bool)

(declare-fun e!509243 () Bool)

(assert (=> b!908603 (= e!509236 e!509243)))

(declare-fun res!613328 () Bool)

(assert (=> b!908603 (=> (not res!613328) (not e!509243))))

(declare-datatypes ((tuple2!12358 0))(
  ( (tuple2!12359 (_1!6190 (_ BitVec 64)) (_2!6190 V!30055)) )
))
(declare-datatypes ((List!18138 0))(
  ( (Nil!18135) (Cons!18134 (h!19280 tuple2!12358) (t!25700 List!18138)) )
))
(declare-datatypes ((ListLongMap!11045 0))(
  ( (ListLongMap!11046 (toList!5538 List!18138)) )
))
(declare-fun lt!409628 () ListLongMap!11045)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4537 (ListLongMap!11045 (_ BitVec 64)) Bool)

(assert (=> b!908603 (= res!613328 (contains!4537 lt!409628 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30055)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30055)

(declare-fun getCurrentListMap!2740 (array!53649 array!53647 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 32) Int) ListLongMap!11045)

(assert (=> b!908603 (= lt!409628 (getCurrentListMap!2740 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908604 () Bool)

(declare-fun e!509241 () Bool)

(declare-fun e!509238 () Bool)

(assert (=> b!908604 (= e!509241 e!509238)))

(declare-fun res!613324 () Bool)

(assert (=> b!908604 (=> res!613324 e!509238)))

(declare-fun lt!409629 () ListLongMap!11045)

(assert (=> b!908604 (= res!613324 (not (contains!4537 lt!409629 k0!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!908604 (= lt!409629 (getCurrentListMap!2740 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908605 () Bool)

(declare-fun e!509237 () Bool)

(declare-fun mapRes!29941 () Bool)

(assert (=> b!908605 (= e!509240 (and e!509237 mapRes!29941))))

(declare-fun condMapEmpty!29941 () Bool)

(declare-fun mapDefault!29941 () ValueCell!8927)

(assert (=> b!908605 (= condMapEmpty!29941 (= (arr!25782 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8927)) mapDefault!29941)))))

(declare-fun mapNonEmpty!29941 () Bool)

(declare-fun tp!57463 () Bool)

(declare-fun e!509239 () Bool)

(assert (=> mapNonEmpty!29941 (= mapRes!29941 (and tp!57463 e!509239))))

(declare-fun mapValue!29941 () ValueCell!8927)

(declare-fun mapKey!29941 () (_ BitVec 32))

(declare-fun mapRest!29941 () (Array (_ BitVec 32) ValueCell!8927))

(assert (=> mapNonEmpty!29941 (= (arr!25782 _values!1152) (store mapRest!29941 mapKey!29941 mapValue!29941))))

(declare-fun b!908606 () Bool)

(declare-fun res!613332 () Bool)

(assert (=> b!908606 (=> (not res!613332) (not e!509243))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908606 (= res!613332 (inRange!0 i!717 mask!1756))))

(declare-fun b!908607 () Bool)

(assert (=> b!908607 (= e!509237 tp_is_empty!18817)))

(declare-fun b!908608 () Bool)

(declare-fun res!613330 () Bool)

(assert (=> b!908608 (=> (not res!613330) (not e!509236))))

(declare-datatypes ((List!18139 0))(
  ( (Nil!18136) (Cons!18135 (h!19281 (_ BitVec 64)) (t!25701 List!18139)) )
))
(declare-fun arrayNoDuplicates!0 (array!53649 (_ BitVec 32) List!18139) Bool)

(assert (=> b!908608 (= res!613330 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18136))))

(declare-fun b!908609 () Bool)

(declare-fun res!613331 () Bool)

(assert (=> b!908609 (=> res!613331 e!509238)))

(declare-fun lt!409627 () V!30055)

(declare-fun apply!510 (ListLongMap!11045 (_ BitVec 64)) V!30055)

(assert (=> b!908609 (= res!613331 (not (= (apply!510 lt!409629 k0!1033) lt!409627)))))

(declare-fun b!908610 () Bool)

(assert (=> b!908610 (= e!509239 tp_is_empty!18817)))

(declare-fun b!908611 () Bool)

(assert (=> b!908611 (= e!509238 (bvsle #b00000000000000000000000000000000 (size!26244 _keys!1386)))))

(assert (=> b!908611 (= (apply!510 lt!409628 k0!1033) lt!409627)))

(declare-datatypes ((Unit!30774 0))(
  ( (Unit!30775) )
))
(declare-fun lt!409626 () Unit!30774)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!65 (array!53649 array!53647 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 64) V!30055 (_ BitVec 32) Int) Unit!30774)

(assert (=> b!908611 (= lt!409626 (lemmaListMapApplyFromThenApplyFromZero!65 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409627 i!717 defaultEntry!1160))))

(declare-fun b!908612 () Bool)

(declare-fun res!613325 () Bool)

(assert (=> b!908612 (=> (not res!613325) (not e!509236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53649 (_ BitVec 32)) Bool)

(assert (=> b!908612 (= res!613325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908613 () Bool)

(declare-fun res!613326 () Bool)

(assert (=> b!908613 (=> (not res!613326) (not e!509243))))

(assert (=> b!908613 (= res!613326 (and (= (select (arr!25783 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908614 () Bool)

(assert (=> b!908614 (= e!509243 (not e!509241))))

(declare-fun res!613329 () Bool)

(assert (=> b!908614 (=> res!613329 e!509241)))

(assert (=> b!908614 (= res!613329 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26244 _keys!1386))))))

(declare-fun get!13577 (ValueCell!8927 V!30055) V!30055)

(declare-fun dynLambda!1375 (Int (_ BitVec 64)) V!30055)

(assert (=> b!908614 (= lt!409627 (get!13577 (select (arr!25782 _values!1152) i!717) (dynLambda!1375 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908614 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409625 () Unit!30774)

(declare-fun lemmaKeyInListMapIsInArray!251 (array!53649 array!53647 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 64) Int) Unit!30774)

(assert (=> b!908614 (= lt!409625 (lemmaKeyInListMapIsInArray!251 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908615 () Bool)

(declare-fun res!613327 () Bool)

(assert (=> b!908615 (=> (not res!613327) (not e!509236))))

(assert (=> b!908615 (= res!613327 (and (= (size!26243 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26244 _keys!1386) (size!26243 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29941 () Bool)

(assert (=> mapIsEmpty!29941 mapRes!29941))

(assert (= (and start!77822 res!613333) b!908615))

(assert (= (and b!908615 res!613327) b!908612))

(assert (= (and b!908612 res!613325) b!908608))

(assert (= (and b!908608 res!613330) b!908603))

(assert (= (and b!908603 res!613328) b!908606))

(assert (= (and b!908606 res!613332) b!908613))

(assert (= (and b!908613 res!613326) b!908614))

(assert (= (and b!908614 (not res!613329)) b!908604))

(assert (= (and b!908604 (not res!613324)) b!908609))

(assert (= (and b!908609 (not res!613331)) b!908611))

(assert (= (and b!908605 condMapEmpty!29941) mapIsEmpty!29941))

(assert (= (and b!908605 (not condMapEmpty!29941)) mapNonEmpty!29941))

(get-info :version)

(assert (= (and mapNonEmpty!29941 ((_ is ValueCellFull!8927) mapValue!29941)) b!908610))

(assert (= (and b!908605 ((_ is ValueCellFull!8927) mapDefault!29941)) b!908607))

(assert (= start!77822 b!908605))

(declare-fun b_lambda!13265 () Bool)

(assert (=> (not b_lambda!13265) (not b!908614)))

(declare-fun t!25699 () Bool)

(declare-fun tb!5413 () Bool)

(assert (=> (and start!77822 (= defaultEntry!1160 defaultEntry!1160) t!25699) tb!5413))

(declare-fun result!10631 () Bool)

(assert (=> tb!5413 (= result!10631 tp_is_empty!18817)))

(assert (=> b!908614 t!25699))

(declare-fun b_and!26931 () Bool)

(assert (= b_and!26929 (and (=> t!25699 result!10631) b_and!26931)))

(declare-fun m!843411 () Bool)

(assert (=> b!908614 m!843411))

(declare-fun m!843413 () Bool)

(assert (=> b!908614 m!843413))

(declare-fun m!843415 () Bool)

(assert (=> b!908614 m!843415))

(declare-fun m!843417 () Bool)

(assert (=> b!908614 m!843417))

(assert (=> b!908614 m!843411))

(assert (=> b!908614 m!843415))

(declare-fun m!843419 () Bool)

(assert (=> b!908614 m!843419))

(declare-fun m!843421 () Bool)

(assert (=> b!908611 m!843421))

(declare-fun m!843423 () Bool)

(assert (=> b!908611 m!843423))

(declare-fun m!843425 () Bool)

(assert (=> b!908609 m!843425))

(declare-fun m!843427 () Bool)

(assert (=> b!908613 m!843427))

(declare-fun m!843429 () Bool)

(assert (=> b!908604 m!843429))

(declare-fun m!843431 () Bool)

(assert (=> b!908604 m!843431))

(declare-fun m!843433 () Bool)

(assert (=> b!908612 m!843433))

(declare-fun m!843435 () Bool)

(assert (=> mapNonEmpty!29941 m!843435))

(declare-fun m!843437 () Bool)

(assert (=> b!908606 m!843437))

(declare-fun m!843439 () Bool)

(assert (=> b!908603 m!843439))

(declare-fun m!843441 () Bool)

(assert (=> b!908603 m!843441))

(declare-fun m!843443 () Bool)

(assert (=> b!908608 m!843443))

(declare-fun m!843445 () Bool)

(assert (=> start!77822 m!843445))

(declare-fun m!843447 () Bool)

(assert (=> start!77822 m!843447))

(declare-fun m!843449 () Bool)

(assert (=> start!77822 m!843449))

(check-sat (not b!908609) (not b_next!16399) (not b!908611) (not mapNonEmpty!29941) b_and!26931 (not b!908614) (not b!908612) tp_is_empty!18817 (not b!908604) (not b!908603) (not b_lambda!13265) (not b!908606) (not b!908608) (not start!77822))
(check-sat b_and!26931 (not b_next!16399))
