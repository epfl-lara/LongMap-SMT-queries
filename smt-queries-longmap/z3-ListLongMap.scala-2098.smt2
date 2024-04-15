; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35742 () Bool)

(assert start!35742)

(declare-fun mapNonEmpty!13821 () Bool)

(declare-fun mapRes!13821 () Bool)

(declare-fun tp!27888 () Bool)

(declare-fun e!219770 () Bool)

(assert (=> mapNonEmpty!13821 (= mapRes!13821 (and tp!27888 e!219770))))

(declare-fun mapKey!13821 () (_ BitVec 32))

(declare-datatypes ((V!11923 0))(
  ( (V!11924 (val!4149 Int)) )
))
(declare-datatypes ((ValueCell!3761 0))(
  ( (ValueCellFull!3761 (v!6337 V!11923)) (EmptyCell!3761) )
))
(declare-fun mapValue!13821 () ValueCell!3761)

(declare-fun mapRest!13821 () (Array (_ BitVec 32) ValueCell!3761))

(declare-datatypes ((array!19953 0))(
  ( (array!19954 (arr!9470 (Array (_ BitVec 32) ValueCell!3761)) (size!9823 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19953)

(assert (=> mapNonEmpty!13821 (= (arr!9470 _values!1208) (store mapRest!13821 mapKey!13821 mapValue!13821))))

(declare-fun mapIsEmpty!13821 () Bool)

(assert (=> mapIsEmpty!13821 mapRes!13821))

(declare-fun res!199526 () Bool)

(declare-fun e!219771 () Bool)

(assert (=> start!35742 (=> (not res!199526) (not e!219771))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35742 (= res!199526 (validMask!0 mask!1842))))

(assert (=> start!35742 e!219771))

(assert (=> start!35742 true))

(declare-fun e!219767 () Bool)

(declare-fun array_inv!6988 (array!19953) Bool)

(assert (=> start!35742 (and (array_inv!6988 _values!1208) e!219767)))

(declare-datatypes ((array!19955 0))(
  ( (array!19956 (arr!9471 (Array (_ BitVec 32) (_ BitVec 64))) (size!9824 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19955)

(declare-fun array_inv!6989 (array!19955) Bool)

(assert (=> start!35742 (array_inv!6989 _keys!1456)))

(declare-fun b!358917 () Bool)

(assert (=> b!358917 (= e!219771 false)))

(declare-fun lt!166066 () Bool)

(declare-datatypes ((List!5421 0))(
  ( (Nil!5418) (Cons!5417 (h!6273 (_ BitVec 64)) (t!10562 List!5421)) )
))
(declare-fun arrayNoDuplicates!0 (array!19955 (_ BitVec 32) List!5421) Bool)

(assert (=> b!358917 (= lt!166066 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5418))))

(declare-fun b!358918 () Bool)

(declare-fun e!219769 () Bool)

(assert (=> b!358918 (= e!219767 (and e!219769 mapRes!13821))))

(declare-fun condMapEmpty!13821 () Bool)

(declare-fun mapDefault!13821 () ValueCell!3761)

(assert (=> b!358918 (= condMapEmpty!13821 (= (arr!9470 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3761)) mapDefault!13821)))))

(declare-fun b!358919 () Bool)

(declare-fun tp_is_empty!8209 () Bool)

(assert (=> b!358919 (= e!219770 tp_is_empty!8209)))

(declare-fun b!358920 () Bool)

(assert (=> b!358920 (= e!219769 tp_is_empty!8209)))

(declare-fun b!358921 () Bool)

(declare-fun res!199527 () Bool)

(assert (=> b!358921 (=> (not res!199527) (not e!219771))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358921 (= res!199527 (and (= (size!9823 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9824 _keys!1456) (size!9823 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358922 () Bool)

(declare-fun res!199528 () Bool)

(assert (=> b!358922 (=> (not res!199528) (not e!219771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19955 (_ BitVec 32)) Bool)

(assert (=> b!358922 (= res!199528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35742 res!199526) b!358921))

(assert (= (and b!358921 res!199527) b!358922))

(assert (= (and b!358922 res!199528) b!358917))

(assert (= (and b!358918 condMapEmpty!13821) mapIsEmpty!13821))

(assert (= (and b!358918 (not condMapEmpty!13821)) mapNonEmpty!13821))

(get-info :version)

(assert (= (and mapNonEmpty!13821 ((_ is ValueCellFull!3761) mapValue!13821)) b!358919))

(assert (= (and b!358918 ((_ is ValueCellFull!3761) mapDefault!13821)) b!358920))

(assert (= start!35742 b!358918))

(declare-fun m!356049 () Bool)

(assert (=> mapNonEmpty!13821 m!356049))

(declare-fun m!356051 () Bool)

(assert (=> start!35742 m!356051))

(declare-fun m!356053 () Bool)

(assert (=> start!35742 m!356053))

(declare-fun m!356055 () Bool)

(assert (=> start!35742 m!356055))

(declare-fun m!356057 () Bool)

(assert (=> b!358917 m!356057))

(declare-fun m!356059 () Bool)

(assert (=> b!358922 m!356059))

(check-sat (not start!35742) (not b!358922) (not b!358917) (not mapNonEmpty!13821) tp_is_empty!8209)
(check-sat)
