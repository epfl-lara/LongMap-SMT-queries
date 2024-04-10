; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35686 () Bool)

(assert start!35686)

(declare-fun mapNonEmpty!13716 () Bool)

(declare-fun mapRes!13716 () Bool)

(declare-fun tp!27774 () Bool)

(declare-fun e!219419 () Bool)

(assert (=> mapNonEmpty!13716 (= mapRes!13716 (and tp!27774 e!219419))))

(declare-datatypes ((V!11829 0))(
  ( (V!11830 (val!4114 Int)) )
))
(declare-datatypes ((ValueCell!3726 0))(
  ( (ValueCellFull!3726 (v!6308 V!11829)) (EmptyCell!3726) )
))
(declare-fun mapValue!13716 () ValueCell!3726)

(declare-fun mapKey!13716 () (_ BitVec 32))

(declare-datatypes ((array!19843 0))(
  ( (array!19844 (arr!9415 (Array (_ BitVec 32) ValueCell!3726)) (size!9767 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19843)

(declare-fun mapRest!13716 () (Array (_ BitVec 32) ValueCell!3726))

(assert (=> mapNonEmpty!13716 (= (arr!9415 _values!1208) (store mapRest!13716 mapKey!13716 mapValue!13716))))

(declare-fun b!358463 () Bool)

(declare-fun e!219418 () Bool)

(assert (=> b!358463 (= e!219418 false)))

(declare-fun lt!166196 () Bool)

(declare-datatypes ((array!19845 0))(
  ( (array!19846 (arr!9416 (Array (_ BitVec 32) (_ BitVec 64))) (size!9768 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19845)

(declare-datatypes ((List!5432 0))(
  ( (Nil!5429) (Cons!5428 (h!6284 (_ BitVec 64)) (t!10582 List!5432)) )
))
(declare-fun arrayNoDuplicates!0 (array!19845 (_ BitVec 32) List!5432) Bool)

(assert (=> b!358463 (= lt!166196 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5429))))

(declare-fun b!358464 () Bool)

(declare-fun tp_is_empty!8139 () Bool)

(assert (=> b!358464 (= e!219419 tp_is_empty!8139)))

(declare-fun b!358465 () Bool)

(declare-fun res!199241 () Bool)

(assert (=> b!358465 (=> (not res!199241) (not e!219418))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!358465 (= res!199241 (and (= (size!9767 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9768 _keys!1456) (size!9767 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358466 () Bool)

(declare-fun res!199242 () Bool)

(assert (=> b!358466 (=> (not res!199242) (not e!219418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19845 (_ BitVec 32)) Bool)

(assert (=> b!358466 (= res!199242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199243 () Bool)

(assert (=> start!35686 (=> (not res!199243) (not e!219418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35686 (= res!199243 (validMask!0 mask!1842))))

(assert (=> start!35686 e!219418))

(assert (=> start!35686 true))

(declare-fun e!219420 () Bool)

(declare-fun array_inv!6922 (array!19843) Bool)

(assert (=> start!35686 (and (array_inv!6922 _values!1208) e!219420)))

(declare-fun array_inv!6923 (array!19845) Bool)

(assert (=> start!35686 (array_inv!6923 _keys!1456)))

(declare-fun b!358467 () Bool)

(declare-fun e!219421 () Bool)

(assert (=> b!358467 (= e!219421 tp_is_empty!8139)))

(declare-fun mapIsEmpty!13716 () Bool)

(assert (=> mapIsEmpty!13716 mapRes!13716))

(declare-fun b!358468 () Bool)

(assert (=> b!358468 (= e!219420 (and e!219421 mapRes!13716))))

(declare-fun condMapEmpty!13716 () Bool)

(declare-fun mapDefault!13716 () ValueCell!3726)

(assert (=> b!358468 (= condMapEmpty!13716 (= (arr!9415 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3726)) mapDefault!13716)))))

(assert (= (and start!35686 res!199243) b!358465))

(assert (= (and b!358465 res!199241) b!358466))

(assert (= (and b!358466 res!199242) b!358463))

(assert (= (and b!358468 condMapEmpty!13716) mapIsEmpty!13716))

(assert (= (and b!358468 (not condMapEmpty!13716)) mapNonEmpty!13716))

(get-info :version)

(assert (= (and mapNonEmpty!13716 ((_ is ValueCellFull!3726) mapValue!13716)) b!358464))

(assert (= (and b!358468 ((_ is ValueCellFull!3726) mapDefault!13716)) b!358467))

(assert (= start!35686 b!358468))

(declare-fun m!356287 () Bool)

(assert (=> mapNonEmpty!13716 m!356287))

(declare-fun m!356289 () Bool)

(assert (=> b!358463 m!356289))

(declare-fun m!356291 () Bool)

(assert (=> b!358466 m!356291))

(declare-fun m!356293 () Bool)

(assert (=> start!35686 m!356293))

(declare-fun m!356295 () Bool)

(assert (=> start!35686 m!356295))

(declare-fun m!356297 () Bool)

(assert (=> start!35686 m!356297))

(check-sat (not mapNonEmpty!13716) (not b!358466) tp_is_empty!8139 (not start!35686) (not b!358463))
(check-sat)
