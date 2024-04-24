; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41344 () Bool)

(assert start!41344)

(declare-fun b!462232 () Bool)

(declare-fun res!276486 () Bool)

(declare-fun e!269685 () Bool)

(assert (=> b!462232 (=> (not res!276486) (not e!269685))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28752 0))(
  ( (array!28753 (arr!13809 (Array (_ BitVec 32) (_ BitVec 64))) (size!14161 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28752)

(declare-datatypes ((V!17739 0))(
  ( (V!17740 (val!6282 Int)) )
))
(declare-datatypes ((ValueCell!5894 0))(
  ( (ValueCellFull!5894 (v!8570 V!17739)) (EmptyCell!5894) )
))
(declare-datatypes ((array!28754 0))(
  ( (array!28755 (arr!13810 (Array (_ BitVec 32) ValueCell!5894)) (size!14162 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28754)

(assert (=> b!462232 (= res!276486 (and (= (size!14162 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14161 _keys!1025) (size!14162 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462233 () Bool)

(declare-fun e!269687 () Bool)

(declare-fun tp_is_empty!12475 () Bool)

(assert (=> b!462233 (= e!269687 tp_is_empty!12475)))

(declare-fun b!462234 () Bool)

(assert (=> b!462234 (= e!269685 false)))

(declare-fun lt!209198 () Bool)

(declare-datatypes ((List!8262 0))(
  ( (Nil!8259) (Cons!8258 (h!9114 (_ BitVec 64)) (t!14198 List!8262)) )
))
(declare-fun arrayNoDuplicates!0 (array!28752 (_ BitVec 32) List!8262) Bool)

(assert (=> b!462234 (= lt!209198 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8259))))

(declare-fun b!462235 () Bool)

(declare-fun e!269686 () Bool)

(assert (=> b!462235 (= e!269686 tp_is_empty!12475)))

(declare-fun mapIsEmpty!20383 () Bool)

(declare-fun mapRes!20383 () Bool)

(assert (=> mapIsEmpty!20383 mapRes!20383))

(declare-fun b!462237 () Bool)

(declare-fun res!276485 () Bool)

(assert (=> b!462237 (=> (not res!276485) (not e!269685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28752 (_ BitVec 32)) Bool)

(assert (=> b!462237 (= res!276485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20383 () Bool)

(declare-fun tp!39202 () Bool)

(assert (=> mapNonEmpty!20383 (= mapRes!20383 (and tp!39202 e!269686))))

(declare-fun mapValue!20383 () ValueCell!5894)

(declare-fun mapRest!20383 () (Array (_ BitVec 32) ValueCell!5894))

(declare-fun mapKey!20383 () (_ BitVec 32))

(assert (=> mapNonEmpty!20383 (= (arr!13810 _values!833) (store mapRest!20383 mapKey!20383 mapValue!20383))))

(declare-fun b!462236 () Bool)

(declare-fun e!269688 () Bool)

(assert (=> b!462236 (= e!269688 (and e!269687 mapRes!20383))))

(declare-fun condMapEmpty!20383 () Bool)

(declare-fun mapDefault!20383 () ValueCell!5894)

(assert (=> b!462236 (= condMapEmpty!20383 (= (arr!13810 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5894)) mapDefault!20383)))))

(declare-fun res!276487 () Bool)

(assert (=> start!41344 (=> (not res!276487) (not e!269685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41344 (= res!276487 (validMask!0 mask!1365))))

(assert (=> start!41344 e!269685))

(assert (=> start!41344 true))

(declare-fun array_inv!10070 (array!28752) Bool)

(assert (=> start!41344 (array_inv!10070 _keys!1025)))

(declare-fun array_inv!10071 (array!28754) Bool)

(assert (=> start!41344 (and (array_inv!10071 _values!833) e!269688)))

(assert (= (and start!41344 res!276487) b!462232))

(assert (= (and b!462232 res!276486) b!462237))

(assert (= (and b!462237 res!276485) b!462234))

(assert (= (and b!462236 condMapEmpty!20383) mapIsEmpty!20383))

(assert (= (and b!462236 (not condMapEmpty!20383)) mapNonEmpty!20383))

(get-info :version)

(assert (= (and mapNonEmpty!20383 ((_ is ValueCellFull!5894) mapValue!20383)) b!462235))

(assert (= (and b!462236 ((_ is ValueCellFull!5894) mapDefault!20383)) b!462233))

(assert (= start!41344 b!462236))

(declare-fun m!445463 () Bool)

(assert (=> b!462234 m!445463))

(declare-fun m!445465 () Bool)

(assert (=> b!462237 m!445465))

(declare-fun m!445467 () Bool)

(assert (=> mapNonEmpty!20383 m!445467))

(declare-fun m!445469 () Bool)

(assert (=> start!41344 m!445469))

(declare-fun m!445471 () Bool)

(assert (=> start!41344 m!445471))

(declare-fun m!445473 () Bool)

(assert (=> start!41344 m!445473))

(check-sat (not b!462237) tp_is_empty!12475 (not mapNonEmpty!20383) (not start!41344) (not b!462234))
(check-sat)
