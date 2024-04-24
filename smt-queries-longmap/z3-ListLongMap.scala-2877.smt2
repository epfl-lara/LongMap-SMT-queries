; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41368 () Bool)

(assert start!41368)

(declare-fun b!462448 () Bool)

(declare-fun e!269868 () Bool)

(declare-fun e!269865 () Bool)

(declare-fun mapRes!20419 () Bool)

(assert (=> b!462448 (= e!269868 (and e!269865 mapRes!20419))))

(declare-fun condMapEmpty!20419 () Bool)

(declare-datatypes ((V!17771 0))(
  ( (V!17772 (val!6294 Int)) )
))
(declare-datatypes ((ValueCell!5906 0))(
  ( (ValueCellFull!5906 (v!8582 V!17771)) (EmptyCell!5906) )
))
(declare-datatypes ((array!28796 0))(
  ( (array!28797 (arr!13831 (Array (_ BitVec 32) ValueCell!5906)) (size!14183 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28796)

(declare-fun mapDefault!20419 () ValueCell!5906)

(assert (=> b!462448 (= condMapEmpty!20419 (= (arr!13831 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5906)) mapDefault!20419)))))

(declare-fun b!462449 () Bool)

(declare-fun res!276594 () Bool)

(declare-fun e!269864 () Bool)

(assert (=> b!462449 (=> (not res!276594) (not e!269864))))

(declare-datatypes ((array!28798 0))(
  ( (array!28799 (arr!13832 (Array (_ BitVec 32) (_ BitVec 64))) (size!14184 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28798)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28798 (_ BitVec 32)) Bool)

(assert (=> b!462449 (= res!276594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20419 () Bool)

(declare-fun tp!39238 () Bool)

(declare-fun e!269867 () Bool)

(assert (=> mapNonEmpty!20419 (= mapRes!20419 (and tp!39238 e!269867))))

(declare-fun mapValue!20419 () ValueCell!5906)

(declare-fun mapKey!20419 () (_ BitVec 32))

(declare-fun mapRest!20419 () (Array (_ BitVec 32) ValueCell!5906))

(assert (=> mapNonEmpty!20419 (= (arr!13831 _values!833) (store mapRest!20419 mapKey!20419 mapValue!20419))))

(declare-fun b!462450 () Bool)

(declare-fun tp_is_empty!12499 () Bool)

(assert (=> b!462450 (= e!269865 tp_is_empty!12499)))

(declare-fun b!462451 () Bool)

(assert (=> b!462451 (= e!269867 tp_is_empty!12499)))

(declare-fun res!276593 () Bool)

(assert (=> start!41368 (=> (not res!276593) (not e!269864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41368 (= res!276593 (validMask!0 mask!1365))))

(assert (=> start!41368 e!269864))

(assert (=> start!41368 true))

(declare-fun array_inv!10082 (array!28798) Bool)

(assert (=> start!41368 (array_inv!10082 _keys!1025)))

(declare-fun array_inv!10083 (array!28796) Bool)

(assert (=> start!41368 (and (array_inv!10083 _values!833) e!269868)))

(declare-fun b!462452 () Bool)

(declare-fun res!276595 () Bool)

(assert (=> b!462452 (=> (not res!276595) (not e!269864))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462452 (= res!276595 (and (= (size!14183 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14184 _keys!1025) (size!14183 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20419 () Bool)

(assert (=> mapIsEmpty!20419 mapRes!20419))

(declare-fun b!462453 () Bool)

(assert (=> b!462453 (= e!269864 false)))

(declare-fun lt!209234 () Bool)

(declare-datatypes ((List!8271 0))(
  ( (Nil!8268) (Cons!8267 (h!9123 (_ BitVec 64)) (t!14207 List!8271)) )
))
(declare-fun arrayNoDuplicates!0 (array!28798 (_ BitVec 32) List!8271) Bool)

(assert (=> b!462453 (= lt!209234 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8268))))

(assert (= (and start!41368 res!276593) b!462452))

(assert (= (and b!462452 res!276595) b!462449))

(assert (= (and b!462449 res!276594) b!462453))

(assert (= (and b!462448 condMapEmpty!20419) mapIsEmpty!20419))

(assert (= (and b!462448 (not condMapEmpty!20419)) mapNonEmpty!20419))

(get-info :version)

(assert (= (and mapNonEmpty!20419 ((_ is ValueCellFull!5906) mapValue!20419)) b!462451))

(assert (= (and b!462448 ((_ is ValueCellFull!5906) mapDefault!20419)) b!462450))

(assert (= start!41368 b!462448))

(declare-fun m!445607 () Bool)

(assert (=> b!462449 m!445607))

(declare-fun m!445609 () Bool)

(assert (=> mapNonEmpty!20419 m!445609))

(declare-fun m!445611 () Bool)

(assert (=> start!41368 m!445611))

(declare-fun m!445613 () Bool)

(assert (=> start!41368 m!445613))

(declare-fun m!445615 () Bool)

(assert (=> start!41368 m!445615))

(declare-fun m!445617 () Bool)

(assert (=> b!462453 m!445617))

(check-sat (not mapNonEmpty!20419) (not start!41368) (not b!462453) tp_is_empty!12499 (not b!462449))
(check-sat)
