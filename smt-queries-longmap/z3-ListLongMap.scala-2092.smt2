; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35706 () Bool)

(assert start!35706)

(declare-fun b!358494 () Bool)

(declare-fun res!199266 () Bool)

(declare-fun e!219501 () Bool)

(assert (=> b!358494 (=> (not res!199266) (not e!219501))))

(declare-datatypes ((array!19889 0))(
  ( (array!19890 (arr!9438 (Array (_ BitVec 32) (_ BitVec 64))) (size!9791 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19889)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19889 (_ BitVec 32)) Bool)

(assert (=> b!358494 (= res!199266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358495 () Bool)

(declare-fun e!219498 () Bool)

(declare-fun tp_is_empty!8173 () Bool)

(assert (=> b!358495 (= e!219498 tp_is_empty!8173)))

(declare-fun mapNonEmpty!13767 () Bool)

(declare-fun mapRes!13767 () Bool)

(declare-fun tp!27825 () Bool)

(declare-fun e!219497 () Bool)

(assert (=> mapNonEmpty!13767 (= mapRes!13767 (and tp!27825 e!219497))))

(declare-datatypes ((V!11875 0))(
  ( (V!11876 (val!4131 Int)) )
))
(declare-datatypes ((ValueCell!3743 0))(
  ( (ValueCellFull!3743 (v!6319 V!11875)) (EmptyCell!3743) )
))
(declare-fun mapRest!13767 () (Array (_ BitVec 32) ValueCell!3743))

(declare-fun mapValue!13767 () ValueCell!3743)

(declare-fun mapKey!13767 () (_ BitVec 32))

(declare-datatypes ((array!19891 0))(
  ( (array!19892 (arr!9439 (Array (_ BitVec 32) ValueCell!3743)) (size!9792 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19891)

(assert (=> mapNonEmpty!13767 (= (arr!9439 _values!1208) (store mapRest!13767 mapKey!13767 mapValue!13767))))

(declare-fun res!199265 () Bool)

(assert (=> start!35706 (=> (not res!199265) (not e!219501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35706 (= res!199265 (validMask!0 mask!1842))))

(assert (=> start!35706 e!219501))

(assert (=> start!35706 true))

(declare-fun e!219500 () Bool)

(declare-fun array_inv!6968 (array!19891) Bool)

(assert (=> start!35706 (and (array_inv!6968 _values!1208) e!219500)))

(declare-fun array_inv!6969 (array!19889) Bool)

(assert (=> start!35706 (array_inv!6969 _keys!1456)))

(declare-fun mapIsEmpty!13767 () Bool)

(assert (=> mapIsEmpty!13767 mapRes!13767))

(declare-fun b!358496 () Bool)

(assert (=> b!358496 (= e!219497 tp_is_empty!8173)))

(declare-fun b!358497 () Bool)

(assert (=> b!358497 (= e!219501 false)))

(declare-fun lt!166012 () Bool)

(declare-datatypes ((List!5409 0))(
  ( (Nil!5406) (Cons!5405 (h!6261 (_ BitVec 64)) (t!10550 List!5409)) )
))
(declare-fun arrayNoDuplicates!0 (array!19889 (_ BitVec 32) List!5409) Bool)

(assert (=> b!358497 (= lt!166012 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5406))))

(declare-fun b!358498 () Bool)

(assert (=> b!358498 (= e!219500 (and e!219498 mapRes!13767))))

(declare-fun condMapEmpty!13767 () Bool)

(declare-fun mapDefault!13767 () ValueCell!3743)

(assert (=> b!358498 (= condMapEmpty!13767 (= (arr!9439 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3743)) mapDefault!13767)))))

(declare-fun b!358499 () Bool)

(declare-fun res!199267 () Bool)

(assert (=> b!358499 (=> (not res!199267) (not e!219501))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358499 (= res!199267 (and (= (size!9792 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9791 _keys!1456) (size!9792 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35706 res!199265) b!358499))

(assert (= (and b!358499 res!199267) b!358494))

(assert (= (and b!358494 res!199266) b!358497))

(assert (= (and b!358498 condMapEmpty!13767) mapIsEmpty!13767))

(assert (= (and b!358498 (not condMapEmpty!13767)) mapNonEmpty!13767))

(get-info :version)

(assert (= (and mapNonEmpty!13767 ((_ is ValueCellFull!3743) mapValue!13767)) b!358496))

(assert (= (and b!358498 ((_ is ValueCellFull!3743) mapDefault!13767)) b!358495))

(assert (= start!35706 b!358498))

(declare-fun m!355761 () Bool)

(assert (=> b!358494 m!355761))

(declare-fun m!355763 () Bool)

(assert (=> mapNonEmpty!13767 m!355763))

(declare-fun m!355765 () Bool)

(assert (=> start!35706 m!355765))

(declare-fun m!355767 () Bool)

(assert (=> start!35706 m!355767))

(declare-fun m!355769 () Bool)

(assert (=> start!35706 m!355769))

(declare-fun m!355771 () Bool)

(assert (=> b!358497 m!355771))

(check-sat (not b!358494) (not mapNonEmpty!13767) (not start!35706) (not b!358497) tp_is_empty!8173)
(check-sat)
