; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35352 () Bool)

(assert start!35352)

(declare-fun b!354027 () Bool)

(declare-fun e!216904 () Bool)

(declare-fun e!216907 () Bool)

(declare-fun mapRes!13236 () Bool)

(assert (=> b!354027 (= e!216904 (and e!216907 mapRes!13236))))

(declare-fun condMapEmpty!13236 () Bool)

(declare-datatypes ((V!11403 0))(
  ( (V!11404 (val!3954 Int)) )
))
(declare-datatypes ((ValueCell!3566 0))(
  ( (ValueCellFull!3566 (v!6149 V!11403)) (EmptyCell!3566) )
))
(declare-datatypes ((array!19218 0))(
  ( (array!19219 (arr!9102 (Array (_ BitVec 32) ValueCell!3566)) (size!9454 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19218)

(declare-fun mapDefault!13236 () ValueCell!3566)

(assert (=> b!354027 (= condMapEmpty!13236 (= (arr!9102 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3566)) mapDefault!13236)))))

(declare-fun b!354028 () Bool)

(declare-fun tp_is_empty!7819 () Bool)

(assert (=> b!354028 (= e!216907 tp_is_empty!7819)))

(declare-fun res!196296 () Bool)

(declare-fun e!216903 () Bool)

(assert (=> start!35352 (=> (not res!196296) (not e!216903))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35352 (= res!196296 (validMask!0 mask!1842))))

(assert (=> start!35352 e!216903))

(assert (=> start!35352 true))

(declare-fun array_inv!6722 (array!19218) Bool)

(assert (=> start!35352 (and (array_inv!6722 _values!1208) e!216904)))

(declare-datatypes ((array!19220 0))(
  ( (array!19221 (arr!9103 (Array (_ BitVec 32) (_ BitVec 64))) (size!9455 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19220)

(declare-fun array_inv!6723 (array!19220) Bool)

(assert (=> start!35352 (array_inv!6723 _keys!1456)))

(declare-fun mapIsEmpty!13236 () Bool)

(assert (=> mapIsEmpty!13236 mapRes!13236))

(declare-fun mapNonEmpty!13236 () Bool)

(declare-fun tp!27132 () Bool)

(declare-fun e!216905 () Bool)

(assert (=> mapNonEmpty!13236 (= mapRes!13236 (and tp!27132 e!216905))))

(declare-fun mapValue!13236 () ValueCell!3566)

(declare-fun mapKey!13236 () (_ BitVec 32))

(declare-fun mapRest!13236 () (Array (_ BitVec 32) ValueCell!3566))

(assert (=> mapNonEmpty!13236 (= (arr!9102 _values!1208) (store mapRest!13236 mapKey!13236 mapValue!13236))))

(declare-fun b!354029 () Bool)

(assert (=> b!354029 (= e!216903 false)))

(declare-fun lt!165662 () Bool)

(declare-datatypes ((List!5193 0))(
  ( (Nil!5190) (Cons!5189 (h!6045 (_ BitVec 64)) (t!10335 List!5193)) )
))
(declare-fun arrayNoDuplicates!0 (array!19220 (_ BitVec 32) List!5193) Bool)

(assert (=> b!354029 (= lt!165662 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5190))))

(declare-fun b!354030 () Bool)

(declare-fun res!196295 () Bool)

(assert (=> b!354030 (=> (not res!196295) (not e!216903))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354030 (= res!196295 (and (= (size!9454 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9455 _keys!1456) (size!9454 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354031 () Bool)

(declare-fun res!196297 () Bool)

(assert (=> b!354031 (=> (not res!196297) (not e!216903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19220 (_ BitVec 32)) Bool)

(assert (=> b!354031 (= res!196297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354032 () Bool)

(assert (=> b!354032 (= e!216905 tp_is_empty!7819)))

(assert (= (and start!35352 res!196296) b!354030))

(assert (= (and b!354030 res!196295) b!354031))

(assert (= (and b!354031 res!196297) b!354029))

(assert (= (and b!354027 condMapEmpty!13236) mapIsEmpty!13236))

(assert (= (and b!354027 (not condMapEmpty!13236)) mapNonEmpty!13236))

(get-info :version)

(assert (= (and mapNonEmpty!13236 ((_ is ValueCellFull!3566) mapValue!13236)) b!354032))

(assert (= (and b!354027 ((_ is ValueCellFull!3566) mapDefault!13236)) b!354028))

(assert (= start!35352 b!354027))

(declare-fun m!353439 () Bool)

(assert (=> start!35352 m!353439))

(declare-fun m!353441 () Bool)

(assert (=> start!35352 m!353441))

(declare-fun m!353443 () Bool)

(assert (=> start!35352 m!353443))

(declare-fun m!353445 () Bool)

(assert (=> mapNonEmpty!13236 m!353445))

(declare-fun m!353447 () Bool)

(assert (=> b!354029 m!353447))

(declare-fun m!353449 () Bool)

(assert (=> b!354031 m!353449))

(check-sat (not mapNonEmpty!13236) (not b!354031) (not b!354029) tp_is_empty!7819 (not start!35352))
(check-sat)
