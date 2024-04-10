; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35258 () Bool)

(assert start!35258)

(declare-fun b!353441 () Bool)

(declare-fun e!216425 () Bool)

(declare-fun tp_is_empty!7767 () Bool)

(assert (=> b!353441 (= e!216425 tp_is_empty!7767)))

(declare-fun b!353442 () Bool)

(declare-fun e!216429 () Bool)

(assert (=> b!353442 (= e!216429 tp_is_empty!7767)))

(declare-fun mapIsEmpty!13140 () Bool)

(declare-fun mapRes!13140 () Bool)

(assert (=> mapIsEmpty!13140 mapRes!13140))

(declare-fun res!195977 () Bool)

(declare-fun e!216427 () Bool)

(assert (=> start!35258 (=> (not res!195977) (not e!216427))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35258 (= res!195977 (validMask!0 mask!1842))))

(assert (=> start!35258 e!216427))

(assert (=> start!35258 true))

(declare-datatypes ((V!11333 0))(
  ( (V!11334 (val!3928 Int)) )
))
(declare-datatypes ((ValueCell!3540 0))(
  ( (ValueCellFull!3540 (v!6121 V!11333)) (EmptyCell!3540) )
))
(declare-datatypes ((array!19127 0))(
  ( (array!19128 (arr!9063 (Array (_ BitVec 32) ValueCell!3540)) (size!9415 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19127)

(declare-fun e!216428 () Bool)

(declare-fun array_inv!6678 (array!19127) Bool)

(assert (=> start!35258 (and (array_inv!6678 _values!1208) e!216428)))

(declare-datatypes ((array!19129 0))(
  ( (array!19130 (arr!9064 (Array (_ BitVec 32) (_ BitVec 64))) (size!9416 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19129)

(declare-fun array_inv!6679 (array!19129) Bool)

(assert (=> start!35258 (array_inv!6679 _keys!1456)))

(declare-fun mapNonEmpty!13140 () Bool)

(declare-fun tp!27036 () Bool)

(assert (=> mapNonEmpty!13140 (= mapRes!13140 (and tp!27036 e!216425))))

(declare-fun mapKey!13140 () (_ BitVec 32))

(declare-fun mapValue!13140 () ValueCell!3540)

(declare-fun mapRest!13140 () (Array (_ BitVec 32) ValueCell!3540))

(assert (=> mapNonEmpty!13140 (= (arr!9063 _values!1208) (store mapRest!13140 mapKey!13140 mapValue!13140))))

(declare-fun b!353443 () Bool)

(assert (=> b!353443 (= e!216428 (and e!216429 mapRes!13140))))

(declare-fun condMapEmpty!13140 () Bool)

(declare-fun mapDefault!13140 () ValueCell!3540)

(assert (=> b!353443 (= condMapEmpty!13140 (= (arr!9063 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3540)) mapDefault!13140)))))

(declare-fun b!353444 () Bool)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353444 (= e!216427 (and (= (size!9415 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9416 _keys!1456) (size!9415 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011) (not (= (size!9416 _keys!1456) (bvadd #b00000000000000000000000000000001 mask!1842)))))))

(assert (= (and start!35258 res!195977) b!353444))

(assert (= (and b!353443 condMapEmpty!13140) mapIsEmpty!13140))

(assert (= (and b!353443 (not condMapEmpty!13140)) mapNonEmpty!13140))

(get-info :version)

(assert (= (and mapNonEmpty!13140 ((_ is ValueCellFull!3540) mapValue!13140)) b!353441))

(assert (= (and b!353443 ((_ is ValueCellFull!3540) mapDefault!13140)) b!353442))

(assert (= start!35258 b!353443))

(declare-fun m!352823 () Bool)

(assert (=> start!35258 m!352823))

(declare-fun m!352825 () Bool)

(assert (=> start!35258 m!352825))

(declare-fun m!352827 () Bool)

(assert (=> start!35258 m!352827))

(declare-fun m!352829 () Bool)

(assert (=> mapNonEmpty!13140 m!352829))

(check-sat (not start!35258) (not mapNonEmpty!13140) tp_is_empty!7767)
(check-sat)
