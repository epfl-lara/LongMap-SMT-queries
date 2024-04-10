; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35716 () Bool)

(assert start!35716)

(declare-fun b!358733 () Bool)

(declare-fun res!199377 () Bool)

(declare-fun e!219646 () Bool)

(assert (=> b!358733 (=> (not res!199377) (not e!219646))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19903 0))(
  ( (array!19904 (arr!9445 (Array (_ BitVec 32) (_ BitVec 64))) (size!9797 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19903)

(declare-datatypes ((V!11869 0))(
  ( (V!11870 (val!4129 Int)) )
))
(declare-datatypes ((ValueCell!3741 0))(
  ( (ValueCellFull!3741 (v!6323 V!11869)) (EmptyCell!3741) )
))
(declare-datatypes ((array!19905 0))(
  ( (array!19906 (arr!9446 (Array (_ BitVec 32) ValueCell!3741)) (size!9798 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19905)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358733 (= res!199377 (and (= (size!9798 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9797 _keys!1456) (size!9798 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13761 () Bool)

(declare-fun mapRes!13761 () Bool)

(declare-fun tp!27819 () Bool)

(declare-fun e!219644 () Bool)

(assert (=> mapNonEmpty!13761 (= mapRes!13761 (and tp!27819 e!219644))))

(declare-fun mapValue!13761 () ValueCell!3741)

(declare-fun mapKey!13761 () (_ BitVec 32))

(declare-fun mapRest!13761 () (Array (_ BitVec 32) ValueCell!3741))

(assert (=> mapNonEmpty!13761 (= (arr!9446 _values!1208) (store mapRest!13761 mapKey!13761 mapValue!13761))))

(declare-fun b!358734 () Bool)

(declare-fun e!219647 () Bool)

(declare-fun tp_is_empty!8169 () Bool)

(assert (=> b!358734 (= e!219647 tp_is_empty!8169)))

(declare-fun b!358735 () Bool)

(declare-fun e!219645 () Bool)

(assert (=> b!358735 (= e!219645 (and e!219647 mapRes!13761))))

(declare-fun condMapEmpty!13761 () Bool)

(declare-fun mapDefault!13761 () ValueCell!3741)

(assert (=> b!358735 (= condMapEmpty!13761 (= (arr!9446 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3741)) mapDefault!13761)))))

(declare-fun b!358736 () Bool)

(assert (=> b!358736 (= e!219644 tp_is_empty!8169)))

(declare-fun b!358737 () Bool)

(assert (=> b!358737 (= e!219646 false)))

(declare-fun lt!166241 () Bool)

(declare-datatypes ((List!5443 0))(
  ( (Nil!5440) (Cons!5439 (h!6295 (_ BitVec 64)) (t!10593 List!5443)) )
))
(declare-fun arrayNoDuplicates!0 (array!19903 (_ BitVec 32) List!5443) Bool)

(assert (=> b!358737 (= lt!166241 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5440))))

(declare-fun res!199376 () Bool)

(assert (=> start!35716 (=> (not res!199376) (not e!219646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35716 (= res!199376 (validMask!0 mask!1842))))

(assert (=> start!35716 e!219646))

(assert (=> start!35716 true))

(declare-fun array_inv!6946 (array!19905) Bool)

(assert (=> start!35716 (and (array_inv!6946 _values!1208) e!219645)))

(declare-fun array_inv!6947 (array!19903) Bool)

(assert (=> start!35716 (array_inv!6947 _keys!1456)))

(declare-fun b!358738 () Bool)

(declare-fun res!199378 () Bool)

(assert (=> b!358738 (=> (not res!199378) (not e!219646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19903 (_ BitVec 32)) Bool)

(assert (=> b!358738 (= res!199378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13761 () Bool)

(assert (=> mapIsEmpty!13761 mapRes!13761))

(assert (= (and start!35716 res!199376) b!358733))

(assert (= (and b!358733 res!199377) b!358738))

(assert (= (and b!358738 res!199378) b!358737))

(assert (= (and b!358735 condMapEmpty!13761) mapIsEmpty!13761))

(assert (= (and b!358735 (not condMapEmpty!13761)) mapNonEmpty!13761))

(get-info :version)

(assert (= (and mapNonEmpty!13761 ((_ is ValueCellFull!3741) mapValue!13761)) b!358736))

(assert (= (and b!358735 ((_ is ValueCellFull!3741) mapDefault!13761)) b!358734))

(assert (= start!35716 b!358735))

(declare-fun m!356467 () Bool)

(assert (=> mapNonEmpty!13761 m!356467))

(declare-fun m!356469 () Bool)

(assert (=> b!358737 m!356469))

(declare-fun m!356471 () Bool)

(assert (=> start!35716 m!356471))

(declare-fun m!356473 () Bool)

(assert (=> start!35716 m!356473))

(declare-fun m!356475 () Bool)

(assert (=> start!35716 m!356475))

(declare-fun m!356477 () Bool)

(assert (=> b!358738 m!356477))

(check-sat (not mapNonEmpty!13761) (not start!35716) tp_is_empty!8169 (not b!358737) (not b!358738))
(check-sat)
