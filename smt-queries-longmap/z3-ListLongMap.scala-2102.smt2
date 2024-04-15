; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35766 () Bool)

(assert start!35766)

(declare-fun b!359133 () Bool)

(declare-fun res!199635 () Bool)

(declare-fun e!219948 () Bool)

(assert (=> b!359133 (=> (not res!199635) (not e!219948))))

(declare-datatypes ((array!19997 0))(
  ( (array!19998 (arr!9492 (Array (_ BitVec 32) (_ BitVec 64))) (size!9845 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19997)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19997 (_ BitVec 32)) Bool)

(assert (=> b!359133 (= res!199635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13857 () Bool)

(declare-fun mapRes!13857 () Bool)

(assert (=> mapIsEmpty!13857 mapRes!13857))

(declare-fun b!359134 () Bool)

(declare-fun e!219949 () Bool)

(declare-fun e!219951 () Bool)

(assert (=> b!359134 (= e!219949 (and e!219951 mapRes!13857))))

(declare-fun condMapEmpty!13857 () Bool)

(declare-datatypes ((V!11955 0))(
  ( (V!11956 (val!4161 Int)) )
))
(declare-datatypes ((ValueCell!3773 0))(
  ( (ValueCellFull!3773 (v!6349 V!11955)) (EmptyCell!3773) )
))
(declare-datatypes ((array!19999 0))(
  ( (array!20000 (arr!9493 (Array (_ BitVec 32) ValueCell!3773)) (size!9846 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19999)

(declare-fun mapDefault!13857 () ValueCell!3773)

(assert (=> b!359134 (= condMapEmpty!13857 (= (arr!9493 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3773)) mapDefault!13857)))))

(declare-fun b!359135 () Bool)

(assert (=> b!359135 (= e!219948 false)))

(declare-fun lt!166102 () Bool)

(declare-datatypes ((List!5430 0))(
  ( (Nil!5427) (Cons!5426 (h!6282 (_ BitVec 64)) (t!10571 List!5430)) )
))
(declare-fun arrayNoDuplicates!0 (array!19997 (_ BitVec 32) List!5430) Bool)

(assert (=> b!359135 (= lt!166102 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5427))))

(declare-fun res!199634 () Bool)

(assert (=> start!35766 (=> (not res!199634) (not e!219948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35766 (= res!199634 (validMask!0 mask!1842))))

(assert (=> start!35766 e!219948))

(assert (=> start!35766 true))

(declare-fun array_inv!7006 (array!19999) Bool)

(assert (=> start!35766 (and (array_inv!7006 _values!1208) e!219949)))

(declare-fun array_inv!7007 (array!19997) Bool)

(assert (=> start!35766 (array_inv!7007 _keys!1456)))

(declare-fun b!359136 () Bool)

(declare-fun tp_is_empty!8233 () Bool)

(assert (=> b!359136 (= e!219951 tp_is_empty!8233)))

(declare-fun b!359137 () Bool)

(declare-fun e!219950 () Bool)

(assert (=> b!359137 (= e!219950 tp_is_empty!8233)))

(declare-fun b!359138 () Bool)

(declare-fun res!199636 () Bool)

(assert (=> b!359138 (=> (not res!199636) (not e!219948))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359138 (= res!199636 (and (= (size!9846 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9845 _keys!1456) (size!9846 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13857 () Bool)

(declare-fun tp!27924 () Bool)

(assert (=> mapNonEmpty!13857 (= mapRes!13857 (and tp!27924 e!219950))))

(declare-fun mapRest!13857 () (Array (_ BitVec 32) ValueCell!3773))

(declare-fun mapValue!13857 () ValueCell!3773)

(declare-fun mapKey!13857 () (_ BitVec 32))

(assert (=> mapNonEmpty!13857 (= (arr!9493 _values!1208) (store mapRest!13857 mapKey!13857 mapValue!13857))))

(assert (= (and start!35766 res!199634) b!359138))

(assert (= (and b!359138 res!199636) b!359133))

(assert (= (and b!359133 res!199635) b!359135))

(assert (= (and b!359134 condMapEmpty!13857) mapIsEmpty!13857))

(assert (= (and b!359134 (not condMapEmpty!13857)) mapNonEmpty!13857))

(get-info :version)

(assert (= (and mapNonEmpty!13857 ((_ is ValueCellFull!3773) mapValue!13857)) b!359137))

(assert (= (and b!359134 ((_ is ValueCellFull!3773) mapDefault!13857)) b!359136))

(assert (= start!35766 b!359134))

(declare-fun m!356193 () Bool)

(assert (=> b!359133 m!356193))

(declare-fun m!356195 () Bool)

(assert (=> b!359135 m!356195))

(declare-fun m!356197 () Bool)

(assert (=> start!35766 m!356197))

(declare-fun m!356199 () Bool)

(assert (=> start!35766 m!356199))

(declare-fun m!356201 () Bool)

(assert (=> start!35766 m!356201))

(declare-fun m!356203 () Bool)

(assert (=> mapNonEmpty!13857 m!356203))

(check-sat tp_is_empty!8233 (not mapNonEmpty!13857) (not start!35766) (not b!359135) (not b!359133))
(check-sat)
