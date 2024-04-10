; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41372 () Bool)

(assert start!41372)

(declare-fun b!462419 () Bool)

(declare-fun e!269830 () Bool)

(assert (=> b!462419 (= e!269830 false)))

(declare-fun lt!209207 () Bool)

(declare-datatypes ((array!28779 0))(
  ( (array!28780 (arr!13823 (Array (_ BitVec 32) (_ BitVec 64))) (size!14175 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28779)

(declare-datatypes ((List!8342 0))(
  ( (Nil!8339) (Cons!8338 (h!9194 (_ BitVec 64)) (t!14286 List!8342)) )
))
(declare-fun arrayNoDuplicates!0 (array!28779 (_ BitVec 32) List!8342) Bool)

(assert (=> b!462419 (= lt!209207 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8339))))

(declare-fun b!462421 () Bool)

(declare-fun e!269831 () Bool)

(declare-fun e!269832 () Bool)

(declare-fun mapRes!20404 () Bool)

(assert (=> b!462421 (= e!269831 (and e!269832 mapRes!20404))))

(declare-fun condMapEmpty!20404 () Bool)

(declare-datatypes ((V!17757 0))(
  ( (V!17758 (val!6289 Int)) )
))
(declare-datatypes ((ValueCell!5901 0))(
  ( (ValueCellFull!5901 (v!8576 V!17757)) (EmptyCell!5901) )
))
(declare-datatypes ((array!28781 0))(
  ( (array!28782 (arr!13824 (Array (_ BitVec 32) ValueCell!5901)) (size!14176 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28781)

(declare-fun mapDefault!20404 () ValueCell!5901)

(assert (=> b!462421 (= condMapEmpty!20404 (= (arr!13824 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5901)) mapDefault!20404)))))

(declare-fun b!462422 () Bool)

(declare-fun res!276557 () Bool)

(assert (=> b!462422 (=> (not res!276557) (not e!269830))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462422 (= res!276557 (and (= (size!14176 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14175 _keys!1025) (size!14176 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20404 () Bool)

(declare-fun tp!39223 () Bool)

(declare-fun e!269828 () Bool)

(assert (=> mapNonEmpty!20404 (= mapRes!20404 (and tp!39223 e!269828))))

(declare-fun mapRest!20404 () (Array (_ BitVec 32) ValueCell!5901))

(declare-fun mapValue!20404 () ValueCell!5901)

(declare-fun mapKey!20404 () (_ BitVec 32))

(assert (=> mapNonEmpty!20404 (= (arr!13824 _values!833) (store mapRest!20404 mapKey!20404 mapValue!20404))))

(declare-fun b!462423 () Bool)

(declare-fun tp_is_empty!12489 () Bool)

(assert (=> b!462423 (= e!269828 tp_is_empty!12489)))

(declare-fun b!462420 () Bool)

(assert (=> b!462420 (= e!269832 tp_is_empty!12489)))

(declare-fun res!276556 () Bool)

(assert (=> start!41372 (=> (not res!276556) (not e!269830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41372 (= res!276556 (validMask!0 mask!1365))))

(assert (=> start!41372 e!269830))

(assert (=> start!41372 true))

(declare-fun array_inv!9996 (array!28779) Bool)

(assert (=> start!41372 (array_inv!9996 _keys!1025)))

(declare-fun array_inv!9997 (array!28781) Bool)

(assert (=> start!41372 (and (array_inv!9997 _values!833) e!269831)))

(declare-fun b!462424 () Bool)

(declare-fun res!276555 () Bool)

(assert (=> b!462424 (=> (not res!276555) (not e!269830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28779 (_ BitVec 32)) Bool)

(assert (=> b!462424 (= res!276555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20404 () Bool)

(assert (=> mapIsEmpty!20404 mapRes!20404))

(assert (= (and start!41372 res!276556) b!462422))

(assert (= (and b!462422 res!276557) b!462424))

(assert (= (and b!462424 res!276555) b!462419))

(assert (= (and b!462421 condMapEmpty!20404) mapIsEmpty!20404))

(assert (= (and b!462421 (not condMapEmpty!20404)) mapNonEmpty!20404))

(get-info :version)

(assert (= (and mapNonEmpty!20404 ((_ is ValueCellFull!5901) mapValue!20404)) b!462423))

(assert (= (and b!462421 ((_ is ValueCellFull!5901) mapDefault!20404)) b!462420))

(assert (= start!41372 b!462421))

(declare-fun m!445365 () Bool)

(assert (=> b!462419 m!445365))

(declare-fun m!445367 () Bool)

(assert (=> mapNonEmpty!20404 m!445367))

(declare-fun m!445369 () Bool)

(assert (=> start!41372 m!445369))

(declare-fun m!445371 () Bool)

(assert (=> start!41372 m!445371))

(declare-fun m!445373 () Bool)

(assert (=> start!41372 m!445373))

(declare-fun m!445375 () Bool)

(assert (=> b!462424 m!445375))

(check-sat (not b!462424) (not start!41372) tp_is_empty!12489 (not mapNonEmpty!20404) (not b!462419))
(check-sat)
