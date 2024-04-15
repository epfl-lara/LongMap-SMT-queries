; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35784 () Bool)

(assert start!35784)

(declare-fun b!359295 () Bool)

(declare-fun e!220083 () Bool)

(declare-fun e!220086 () Bool)

(declare-fun mapRes!13884 () Bool)

(assert (=> b!359295 (= e!220083 (and e!220086 mapRes!13884))))

(declare-fun condMapEmpty!13884 () Bool)

(declare-datatypes ((V!11979 0))(
  ( (V!11980 (val!4170 Int)) )
))
(declare-datatypes ((ValueCell!3782 0))(
  ( (ValueCellFull!3782 (v!6358 V!11979)) (EmptyCell!3782) )
))
(declare-datatypes ((array!20033 0))(
  ( (array!20034 (arr!9510 (Array (_ BitVec 32) ValueCell!3782)) (size!9863 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20033)

(declare-fun mapDefault!13884 () ValueCell!3782)

(assert (=> b!359295 (= condMapEmpty!13884 (= (arr!9510 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3782)) mapDefault!13884)))))

(declare-fun mapNonEmpty!13884 () Bool)

(declare-fun tp!27951 () Bool)

(declare-fun e!220085 () Bool)

(assert (=> mapNonEmpty!13884 (= mapRes!13884 (and tp!27951 e!220085))))

(declare-fun mapKey!13884 () (_ BitVec 32))

(declare-fun mapValue!13884 () ValueCell!3782)

(declare-fun mapRest!13884 () (Array (_ BitVec 32) ValueCell!3782))

(assert (=> mapNonEmpty!13884 (= (arr!9510 _values!1208) (store mapRest!13884 mapKey!13884 mapValue!13884))))

(declare-fun b!359296 () Bool)

(declare-fun res!199716 () Bool)

(declare-fun e!220082 () Bool)

(assert (=> b!359296 (=> (not res!199716) (not e!220082))))

(declare-datatypes ((array!20035 0))(
  ( (array!20036 (arr!9511 (Array (_ BitVec 32) (_ BitVec 64))) (size!9864 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20035)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20035 (_ BitVec 32)) Bool)

(assert (=> b!359296 (= res!199716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359297 () Bool)

(declare-fun tp_is_empty!8251 () Bool)

(assert (=> b!359297 (= e!220085 tp_is_empty!8251)))

(declare-fun b!359298 () Bool)

(assert (=> b!359298 (= e!220086 tp_is_empty!8251)))

(declare-fun b!359299 () Bool)

(declare-fun res!199715 () Bool)

(assert (=> b!359299 (=> (not res!199715) (not e!220082))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359299 (= res!199715 (and (= (size!9863 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9864 _keys!1456) (size!9863 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199717 () Bool)

(assert (=> start!35784 (=> (not res!199717) (not e!220082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35784 (= res!199717 (validMask!0 mask!1842))))

(assert (=> start!35784 e!220082))

(assert (=> start!35784 true))

(declare-fun array_inv!7018 (array!20033) Bool)

(assert (=> start!35784 (and (array_inv!7018 _values!1208) e!220083)))

(declare-fun array_inv!7019 (array!20035) Bool)

(assert (=> start!35784 (array_inv!7019 _keys!1456)))

(declare-fun mapIsEmpty!13884 () Bool)

(assert (=> mapIsEmpty!13884 mapRes!13884))

(declare-fun b!359300 () Bool)

(assert (=> b!359300 (= e!220082 false)))

(declare-fun lt!166129 () Bool)

(declare-datatypes ((List!5437 0))(
  ( (Nil!5434) (Cons!5433 (h!6289 (_ BitVec 64)) (t!10578 List!5437)) )
))
(declare-fun arrayNoDuplicates!0 (array!20035 (_ BitVec 32) List!5437) Bool)

(assert (=> b!359300 (= lt!166129 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5434))))

(assert (= (and start!35784 res!199717) b!359299))

(assert (= (and b!359299 res!199715) b!359296))

(assert (= (and b!359296 res!199716) b!359300))

(assert (= (and b!359295 condMapEmpty!13884) mapIsEmpty!13884))

(assert (= (and b!359295 (not condMapEmpty!13884)) mapNonEmpty!13884))

(get-info :version)

(assert (= (and mapNonEmpty!13884 ((_ is ValueCellFull!3782) mapValue!13884)) b!359297))

(assert (= (and b!359295 ((_ is ValueCellFull!3782) mapDefault!13884)) b!359298))

(assert (= start!35784 b!359295))

(declare-fun m!356301 () Bool)

(assert (=> mapNonEmpty!13884 m!356301))

(declare-fun m!356303 () Bool)

(assert (=> b!359296 m!356303))

(declare-fun m!356305 () Bool)

(assert (=> start!35784 m!356305))

(declare-fun m!356307 () Bool)

(assert (=> start!35784 m!356307))

(declare-fun m!356309 () Bool)

(assert (=> start!35784 m!356309))

(declare-fun m!356311 () Bool)

(assert (=> b!359300 m!356311))

(check-sat (not b!359296) tp_is_empty!8251 (not b!359300) (not start!35784) (not mapNonEmpty!13884))
(check-sat)
