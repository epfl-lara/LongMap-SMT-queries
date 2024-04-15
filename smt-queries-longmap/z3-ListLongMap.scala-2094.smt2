; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35718 () Bool)

(assert start!35718)

(declare-fun mapNonEmpty!13785 () Bool)

(declare-fun mapRes!13785 () Bool)

(declare-fun tp!27843 () Bool)

(declare-fun e!219590 () Bool)

(assert (=> mapNonEmpty!13785 (= mapRes!13785 (and tp!27843 e!219590))))

(declare-datatypes ((V!11891 0))(
  ( (V!11892 (val!4137 Int)) )
))
(declare-datatypes ((ValueCell!3749 0))(
  ( (ValueCellFull!3749 (v!6325 V!11891)) (EmptyCell!3749) )
))
(declare-fun mapRest!13785 () (Array (_ BitVec 32) ValueCell!3749))

(declare-datatypes ((array!19911 0))(
  ( (array!19912 (arr!9449 (Array (_ BitVec 32) ValueCell!3749)) (size!9802 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19911)

(declare-fun mapKey!13785 () (_ BitVec 32))

(declare-fun mapValue!13785 () ValueCell!3749)

(assert (=> mapNonEmpty!13785 (= (arr!9449 _values!1208) (store mapRest!13785 mapKey!13785 mapValue!13785))))

(declare-fun b!358612 () Bool)

(declare-fun res!199331 () Bool)

(declare-fun e!219587 () Bool)

(assert (=> b!358612 (=> (not res!199331) (not e!219587))))

(declare-datatypes ((array!19913 0))(
  ( (array!19914 (arr!9450 (Array (_ BitVec 32) (_ BitVec 64))) (size!9803 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19913)

(declare-datatypes ((List!5412 0))(
  ( (Nil!5409) (Cons!5408 (h!6264 (_ BitVec 64)) (t!10553 List!5412)) )
))
(declare-fun arrayNoDuplicates!0 (array!19913 (_ BitVec 32) List!5412) Bool)

(assert (=> b!358612 (= res!199331 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5409))))

(declare-fun b!358613 () Bool)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358613 (= e!219587 (not (validKeyInArray!0 (select (arr!9450 _keys!1456) from!1805))))))

(declare-fun b!358614 () Bool)

(declare-fun res!199330 () Bool)

(assert (=> b!358614 (=> (not res!199330) (not e!219587))))

(assert (=> b!358614 (= res!199330 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9803 _keys!1456))))))

(declare-fun b!358615 () Bool)

(declare-fun res!199335 () Bool)

(assert (=> b!358615 (=> (not res!199335) (not e!219587))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19913 (_ BitVec 32)) Bool)

(assert (=> b!358615 (= res!199335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358616 () Bool)

(declare-fun tp_is_empty!8185 () Bool)

(assert (=> b!358616 (= e!219590 tp_is_empty!8185)))

(declare-fun b!358617 () Bool)

(declare-fun res!199334 () Bool)

(assert (=> b!358617 (=> (not res!199334) (not e!219587))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!358617 (= res!199334 (validKeyInArray!0 k0!1077))))

(declare-fun b!358618 () Bool)

(declare-fun res!199336 () Bool)

(assert (=> b!358618 (=> (not res!199336) (not e!219587))))

(assert (=> b!358618 (= res!199336 (= (select (arr!9450 _keys!1456) from!1805) k0!1077))))

(declare-fun b!358619 () Bool)

(declare-fun e!219591 () Bool)

(declare-fun e!219588 () Bool)

(assert (=> b!358619 (= e!219591 (and e!219588 mapRes!13785))))

(declare-fun condMapEmpty!13785 () Bool)

(declare-fun mapDefault!13785 () ValueCell!3749)

(assert (=> b!358619 (= condMapEmpty!13785 (= (arr!9449 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3749)) mapDefault!13785)))))

(declare-fun b!358620 () Bool)

(declare-fun res!199332 () Bool)

(assert (=> b!358620 (=> (not res!199332) (not e!219587))))

(declare-fun arrayContainsKey!0 (array!19913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358620 (= res!199332 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13785 () Bool)

(assert (=> mapIsEmpty!13785 mapRes!13785))

(declare-fun res!199333 () Bool)

(assert (=> start!35718 (=> (not res!199333) (not e!219587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35718 (= res!199333 (validMask!0 mask!1842))))

(assert (=> start!35718 e!219587))

(assert (=> start!35718 true))

(declare-fun array_inv!6974 (array!19913) Bool)

(assert (=> start!35718 (array_inv!6974 _keys!1456)))

(declare-fun array_inv!6975 (array!19911) Bool)

(assert (=> start!35718 (and (array_inv!6975 _values!1208) e!219591)))

(declare-fun b!358621 () Bool)

(assert (=> b!358621 (= e!219588 tp_is_empty!8185)))

(declare-fun b!358622 () Bool)

(declare-fun res!199329 () Bool)

(assert (=> b!358622 (=> (not res!199329) (not e!219587))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358622 (= res!199329 (and (= (size!9802 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9803 _keys!1456) (size!9802 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35718 res!199333) b!358622))

(assert (= (and b!358622 res!199329) b!358615))

(assert (= (and b!358615 res!199335) b!358612))

(assert (= (and b!358612 res!199331) b!358617))

(assert (= (and b!358617 res!199334) b!358614))

(assert (= (and b!358614 res!199330) b!358620))

(assert (= (and b!358620 res!199332) b!358618))

(assert (= (and b!358618 res!199336) b!358613))

(assert (= (and b!358619 condMapEmpty!13785) mapIsEmpty!13785))

(assert (= (and b!358619 (not condMapEmpty!13785)) mapNonEmpty!13785))

(get-info :version)

(assert (= (and mapNonEmpty!13785 ((_ is ValueCellFull!3749) mapValue!13785)) b!358616))

(assert (= (and b!358619 ((_ is ValueCellFull!3749) mapDefault!13785)) b!358621))

(assert (= start!35718 b!358619))

(declare-fun m!355833 () Bool)

(assert (=> b!358615 m!355833))

(declare-fun m!355835 () Bool)

(assert (=> b!358618 m!355835))

(declare-fun m!355837 () Bool)

(assert (=> mapNonEmpty!13785 m!355837))

(assert (=> b!358613 m!355835))

(assert (=> b!358613 m!355835))

(declare-fun m!355839 () Bool)

(assert (=> b!358613 m!355839))

(declare-fun m!355841 () Bool)

(assert (=> b!358620 m!355841))

(declare-fun m!355843 () Bool)

(assert (=> b!358612 m!355843))

(declare-fun m!355845 () Bool)

(assert (=> start!35718 m!355845))

(declare-fun m!355847 () Bool)

(assert (=> start!35718 m!355847))

(declare-fun m!355849 () Bool)

(assert (=> start!35718 m!355849))

(declare-fun m!355851 () Bool)

(assert (=> b!358617 m!355851))

(check-sat (not b!358612) (not b!358620) (not b!358615) (not b!358617) (not b!358613) tp_is_empty!8185 (not start!35718) (not mapNonEmpty!13785))
(check-sat)
