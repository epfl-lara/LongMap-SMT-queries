; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35722 () Bool)

(assert start!35722)

(declare-fun b!358787 () Bool)

(declare-fun e!219689 () Bool)

(declare-fun e!219692 () Bool)

(declare-fun mapRes!13770 () Bool)

(assert (=> b!358787 (= e!219689 (and e!219692 mapRes!13770))))

(declare-fun condMapEmpty!13770 () Bool)

(declare-datatypes ((V!11877 0))(
  ( (V!11878 (val!4132 Int)) )
))
(declare-datatypes ((ValueCell!3744 0))(
  ( (ValueCellFull!3744 (v!6326 V!11877)) (EmptyCell!3744) )
))
(declare-datatypes ((array!19913 0))(
  ( (array!19914 (arr!9450 (Array (_ BitVec 32) ValueCell!3744)) (size!9802 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19913)

(declare-fun mapDefault!13770 () ValueCell!3744)

(assert (=> b!358787 (= condMapEmpty!13770 (= (arr!9450 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3744)) mapDefault!13770)))))

(declare-fun b!358788 () Bool)

(declare-fun tp_is_empty!8175 () Bool)

(assert (=> b!358788 (= e!219692 tp_is_empty!8175)))

(declare-fun b!358789 () Bool)

(declare-fun res!199404 () Bool)

(declare-fun e!219690 () Bool)

(assert (=> b!358789 (=> (not res!199404) (not e!219690))))

(declare-datatypes ((array!19915 0))(
  ( (array!19916 (arr!9451 (Array (_ BitVec 32) (_ BitVec 64))) (size!9803 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19915)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19915 (_ BitVec 32)) Bool)

(assert (=> b!358789 (= res!199404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199403 () Bool)

(assert (=> start!35722 (=> (not res!199403) (not e!219690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35722 (= res!199403 (validMask!0 mask!1842))))

(assert (=> start!35722 e!219690))

(assert (=> start!35722 true))

(declare-fun array_inv!6950 (array!19913) Bool)

(assert (=> start!35722 (and (array_inv!6950 _values!1208) e!219689)))

(declare-fun array_inv!6951 (array!19915) Bool)

(assert (=> start!35722 (array_inv!6951 _keys!1456)))

(declare-fun b!358790 () Bool)

(declare-fun e!219691 () Bool)

(assert (=> b!358790 (= e!219691 tp_is_empty!8175)))

(declare-fun mapIsEmpty!13770 () Bool)

(assert (=> mapIsEmpty!13770 mapRes!13770))

(declare-fun b!358791 () Bool)

(declare-fun res!199405 () Bool)

(assert (=> b!358791 (=> (not res!199405) (not e!219690))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358791 (= res!199405 (and (= (size!9802 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9803 _keys!1456) (size!9802 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358792 () Bool)

(assert (=> b!358792 (= e!219690 false)))

(declare-fun lt!166250 () Bool)

(declare-datatypes ((List!5445 0))(
  ( (Nil!5442) (Cons!5441 (h!6297 (_ BitVec 64)) (t!10595 List!5445)) )
))
(declare-fun arrayNoDuplicates!0 (array!19915 (_ BitVec 32) List!5445) Bool)

(assert (=> b!358792 (= lt!166250 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5442))))

(declare-fun mapNonEmpty!13770 () Bool)

(declare-fun tp!27828 () Bool)

(assert (=> mapNonEmpty!13770 (= mapRes!13770 (and tp!27828 e!219691))))

(declare-fun mapKey!13770 () (_ BitVec 32))

(declare-fun mapRest!13770 () (Array (_ BitVec 32) ValueCell!3744))

(declare-fun mapValue!13770 () ValueCell!3744)

(assert (=> mapNonEmpty!13770 (= (arr!9450 _values!1208) (store mapRest!13770 mapKey!13770 mapValue!13770))))

(assert (= (and start!35722 res!199403) b!358791))

(assert (= (and b!358791 res!199405) b!358789))

(assert (= (and b!358789 res!199404) b!358792))

(assert (= (and b!358787 condMapEmpty!13770) mapIsEmpty!13770))

(assert (= (and b!358787 (not condMapEmpty!13770)) mapNonEmpty!13770))

(get-info :version)

(assert (= (and mapNonEmpty!13770 ((_ is ValueCellFull!3744) mapValue!13770)) b!358790))

(assert (= (and b!358787 ((_ is ValueCellFull!3744) mapDefault!13770)) b!358788))

(assert (= start!35722 b!358787))

(declare-fun m!356503 () Bool)

(assert (=> b!358789 m!356503))

(declare-fun m!356505 () Bool)

(assert (=> start!35722 m!356505))

(declare-fun m!356507 () Bool)

(assert (=> start!35722 m!356507))

(declare-fun m!356509 () Bool)

(assert (=> start!35722 m!356509))

(declare-fun m!356511 () Bool)

(assert (=> b!358792 m!356511))

(declare-fun m!356513 () Bool)

(assert (=> mapNonEmpty!13770 m!356513))

(check-sat (not start!35722) (not b!358792) (not mapNonEmpty!13770) tp_is_empty!8175 (not b!358789))
(check-sat)
