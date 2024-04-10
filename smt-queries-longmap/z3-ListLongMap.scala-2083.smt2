; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35668 () Bool)

(assert start!35668)

(declare-fun b!358285 () Bool)

(declare-fun res!199147 () Bool)

(declare-fun e!219283 () Bool)

(assert (=> b!358285 (=> (not res!199147) (not e!219283))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358285 (= res!199147 (validKeyInArray!0 k0!1077))))

(declare-fun b!358286 () Bool)

(declare-fun res!199149 () Bool)

(assert (=> b!358286 (=> (not res!199149) (not e!219283))))

(declare-datatypes ((array!19809 0))(
  ( (array!19810 (arr!9398 (Array (_ BitVec 32) (_ BitVec 64))) (size!9750 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19809)

(declare-datatypes ((List!5425 0))(
  ( (Nil!5422) (Cons!5421 (h!6277 (_ BitVec 64)) (t!10575 List!5425)) )
))
(declare-fun arrayNoDuplicates!0 (array!19809 (_ BitVec 32) List!5425) Bool)

(assert (=> b!358286 (= res!199149 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5422))))

(declare-fun b!358287 () Bool)

(declare-fun e!219284 () Bool)

(declare-fun e!219285 () Bool)

(declare-fun mapRes!13689 () Bool)

(assert (=> b!358287 (= e!219284 (and e!219285 mapRes!13689))))

(declare-fun condMapEmpty!13689 () Bool)

(declare-datatypes ((V!11805 0))(
  ( (V!11806 (val!4105 Int)) )
))
(declare-datatypes ((ValueCell!3717 0))(
  ( (ValueCellFull!3717 (v!6299 V!11805)) (EmptyCell!3717) )
))
(declare-datatypes ((array!19811 0))(
  ( (array!19812 (arr!9399 (Array (_ BitVec 32) ValueCell!3717)) (size!9751 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19811)

(declare-fun mapDefault!13689 () ValueCell!3717)

(assert (=> b!358287 (= condMapEmpty!13689 (= (arr!9399 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3717)) mapDefault!13689)))))

(declare-fun mapIsEmpty!13689 () Bool)

(assert (=> mapIsEmpty!13689 mapRes!13689))

(declare-fun mapNonEmpty!13689 () Bool)

(declare-fun tp!27747 () Bool)

(declare-fun e!219286 () Bool)

(assert (=> mapNonEmpty!13689 (= mapRes!13689 (and tp!27747 e!219286))))

(declare-fun mapRest!13689 () (Array (_ BitVec 32) ValueCell!3717))

(declare-fun mapKey!13689 () (_ BitVec 32))

(declare-fun mapValue!13689 () ValueCell!3717)

(assert (=> mapNonEmpty!13689 (= (arr!9399 _values!1208) (store mapRest!13689 mapKey!13689 mapValue!13689))))

(declare-fun res!199144 () Bool)

(assert (=> start!35668 (=> (not res!199144) (not e!219283))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35668 (= res!199144 (validMask!0 mask!1842))))

(assert (=> start!35668 e!219283))

(assert (=> start!35668 true))

(declare-fun array_inv!6908 (array!19809) Bool)

(assert (=> start!35668 (array_inv!6908 _keys!1456)))

(declare-fun array_inv!6909 (array!19811) Bool)

(assert (=> start!35668 (and (array_inv!6909 _values!1208) e!219284)))

(declare-fun b!358288 () Bool)

(declare-fun res!199145 () Bool)

(assert (=> b!358288 (=> (not res!199145) (not e!219283))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!358288 (= res!199145 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9750 _keys!1456))))))

(declare-fun b!358289 () Bool)

(declare-fun res!199148 () Bool)

(assert (=> b!358289 (=> (not res!199148) (not e!219283))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358289 (= res!199148 (and (= (size!9751 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9750 _keys!1456) (size!9751 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358290 () Bool)

(declare-fun res!199150 () Bool)

(assert (=> b!358290 (=> (not res!199150) (not e!219283))))

(declare-fun arrayContainsKey!0 (array!19809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358290 (= res!199150 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358291 () Bool)

(assert (=> b!358291 (= e!219283 (bvslt (bvsub (size!9750 _keys!1456) from!1805) #b00000000000000000000000000000000))))

(declare-fun b!358292 () Bool)

(declare-fun tp_is_empty!8121 () Bool)

(assert (=> b!358292 (= e!219285 tp_is_empty!8121)))

(declare-fun b!358293 () Bool)

(assert (=> b!358293 (= e!219286 tp_is_empty!8121)))

(declare-fun b!358294 () Bool)

(declare-fun res!199146 () Bool)

(assert (=> b!358294 (=> (not res!199146) (not e!219283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19809 (_ BitVec 32)) Bool)

(assert (=> b!358294 (= res!199146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35668 res!199144) b!358289))

(assert (= (and b!358289 res!199148) b!358294))

(assert (= (and b!358294 res!199146) b!358286))

(assert (= (and b!358286 res!199149) b!358285))

(assert (= (and b!358285 res!199147) b!358288))

(assert (= (and b!358288 res!199145) b!358290))

(assert (= (and b!358290 res!199150) b!358291))

(assert (= (and b!358287 condMapEmpty!13689) mapIsEmpty!13689))

(assert (= (and b!358287 (not condMapEmpty!13689)) mapNonEmpty!13689))

(get-info :version)

(assert (= (and mapNonEmpty!13689 ((_ is ValueCellFull!3717) mapValue!13689)) b!358293))

(assert (= (and b!358287 ((_ is ValueCellFull!3717) mapDefault!13689)) b!358292))

(assert (= start!35668 b!358287))

(declare-fun m!356171 () Bool)

(assert (=> b!358294 m!356171))

(declare-fun m!356173 () Bool)

(assert (=> b!358285 m!356173))

(declare-fun m!356175 () Bool)

(assert (=> start!35668 m!356175))

(declare-fun m!356177 () Bool)

(assert (=> start!35668 m!356177))

(declare-fun m!356179 () Bool)

(assert (=> start!35668 m!356179))

(declare-fun m!356181 () Bool)

(assert (=> mapNonEmpty!13689 m!356181))

(declare-fun m!356183 () Bool)

(assert (=> b!358286 m!356183))

(declare-fun m!356185 () Bool)

(assert (=> b!358290 m!356185))

(check-sat (not b!358290) (not mapNonEmpty!13689) (not b!358286) (not start!35668) (not b!358285) (not b!358294) tp_is_empty!8121)
(check-sat)
