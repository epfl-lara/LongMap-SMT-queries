; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35736 () Bool)

(assert start!35736)

(declare-fun b!359085 () Bool)

(declare-fun res!199626 () Bool)

(declare-fun e!219866 () Bool)

(assert (=> b!359085 (=> (not res!199626) (not e!219866))))

(declare-datatypes ((array!19944 0))(
  ( (array!19945 (arr!9465 (Array (_ BitVec 32) (_ BitVec 64))) (size!9817 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19944)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19944 (_ BitVec 32)) Bool)

(assert (=> b!359085 (= res!199626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359086 () Bool)

(declare-fun e!219865 () Bool)

(declare-fun tp_is_empty!8203 () Bool)

(assert (=> b!359086 (= e!219865 tp_is_empty!8203)))

(declare-fun mapIsEmpty!13812 () Bool)

(declare-fun mapRes!13812 () Bool)

(assert (=> mapIsEmpty!13812 mapRes!13812))

(declare-fun b!359087 () Bool)

(declare-fun e!219864 () Bool)

(assert (=> b!359087 (= e!219864 tp_is_empty!8203)))

(declare-fun b!359088 () Bool)

(assert (=> b!359088 (= e!219866 false)))

(declare-fun lt!166310 () Bool)

(declare-datatypes ((List!5364 0))(
  ( (Nil!5361) (Cons!5360 (h!6216 (_ BitVec 64)) (t!10506 List!5364)) )
))
(declare-fun arrayNoDuplicates!0 (array!19944 (_ BitVec 32) List!5364) Bool)

(assert (=> b!359088 (= lt!166310 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5361))))

(declare-fun res!199625 () Bool)

(assert (=> start!35736 (=> (not res!199625) (not e!219866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35736 (= res!199625 (validMask!0 mask!1842))))

(assert (=> start!35736 e!219866))

(assert (=> start!35736 true))

(declare-datatypes ((V!11915 0))(
  ( (V!11916 (val!4146 Int)) )
))
(declare-datatypes ((ValueCell!3758 0))(
  ( (ValueCellFull!3758 (v!6341 V!11915)) (EmptyCell!3758) )
))
(declare-datatypes ((array!19946 0))(
  ( (array!19947 (arr!9466 (Array (_ BitVec 32) ValueCell!3758)) (size!9818 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19946)

(declare-fun e!219868 () Bool)

(declare-fun array_inv!6998 (array!19946) Bool)

(assert (=> start!35736 (and (array_inv!6998 _values!1208) e!219868)))

(declare-fun array_inv!6999 (array!19944) Bool)

(assert (=> start!35736 (array_inv!6999 _keys!1456)))

(declare-fun b!359089 () Bool)

(declare-fun res!199627 () Bool)

(assert (=> b!359089 (=> (not res!199627) (not e!219866))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359089 (= res!199627 (and (= (size!9818 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9817 _keys!1456) (size!9818 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13812 () Bool)

(declare-fun tp!27879 () Bool)

(assert (=> mapNonEmpty!13812 (= mapRes!13812 (and tp!27879 e!219864))))

(declare-fun mapKey!13812 () (_ BitVec 32))

(declare-fun mapRest!13812 () (Array (_ BitVec 32) ValueCell!3758))

(declare-fun mapValue!13812 () ValueCell!3758)

(assert (=> mapNonEmpty!13812 (= (arr!9466 _values!1208) (store mapRest!13812 mapKey!13812 mapValue!13812))))

(declare-fun b!359090 () Bool)

(assert (=> b!359090 (= e!219868 (and e!219865 mapRes!13812))))

(declare-fun condMapEmpty!13812 () Bool)

(declare-fun mapDefault!13812 () ValueCell!3758)

(assert (=> b!359090 (= condMapEmpty!13812 (= (arr!9466 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3758)) mapDefault!13812)))))

(assert (= (and start!35736 res!199625) b!359089))

(assert (= (and b!359089 res!199627) b!359085))

(assert (= (and b!359085 res!199626) b!359088))

(assert (= (and b!359090 condMapEmpty!13812) mapIsEmpty!13812))

(assert (= (and b!359090 (not condMapEmpty!13812)) mapNonEmpty!13812))

(get-info :version)

(assert (= (and mapNonEmpty!13812 ((_ is ValueCellFull!3758) mapValue!13812)) b!359087))

(assert (= (and b!359090 ((_ is ValueCellFull!3758) mapDefault!13812)) b!359086))

(assert (= start!35736 b!359090))

(declare-fun m!356967 () Bool)

(assert (=> b!359085 m!356967))

(declare-fun m!356969 () Bool)

(assert (=> b!359088 m!356969))

(declare-fun m!356971 () Bool)

(assert (=> start!35736 m!356971))

(declare-fun m!356973 () Bool)

(assert (=> start!35736 m!356973))

(declare-fun m!356975 () Bool)

(assert (=> start!35736 m!356975))

(declare-fun m!356977 () Bool)

(assert (=> mapNonEmpty!13812 m!356977))

(check-sat (not b!359088) (not start!35736) tp_is_empty!8203 (not b!359085) (not mapNonEmpty!13812))
(check-sat)
