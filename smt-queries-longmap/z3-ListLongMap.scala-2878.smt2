; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41390 () Bool)

(assert start!41390)

(declare-fun mapIsEmpty!20431 () Bool)

(declare-fun mapRes!20431 () Bool)

(assert (=> mapIsEmpty!20431 mapRes!20431))

(declare-fun b!462581 () Bool)

(declare-fun e!269966 () Bool)

(declare-fun e!269965 () Bool)

(assert (=> b!462581 (= e!269966 (and e!269965 mapRes!20431))))

(declare-fun condMapEmpty!20431 () Bool)

(declare-datatypes ((V!17781 0))(
  ( (V!17782 (val!6298 Int)) )
))
(declare-datatypes ((ValueCell!5910 0))(
  ( (ValueCellFull!5910 (v!8585 V!17781)) (EmptyCell!5910) )
))
(declare-datatypes ((array!28813 0))(
  ( (array!28814 (arr!13840 (Array (_ BitVec 32) ValueCell!5910)) (size!14192 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28813)

(declare-fun mapDefault!20431 () ValueCell!5910)

(assert (=> b!462581 (= condMapEmpty!20431 (= (arr!13840 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5910)) mapDefault!20431)))))

(declare-fun b!462582 () Bool)

(declare-fun tp_is_empty!12507 () Bool)

(assert (=> b!462582 (= e!269965 tp_is_empty!12507)))

(declare-fun res!276636 () Bool)

(declare-fun e!269964 () Bool)

(assert (=> start!41390 (=> (not res!276636) (not e!269964))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41390 (= res!276636 (validMask!0 mask!1365))))

(assert (=> start!41390 e!269964))

(assert (=> start!41390 true))

(declare-datatypes ((array!28815 0))(
  ( (array!28816 (arr!13841 (Array (_ BitVec 32) (_ BitVec 64))) (size!14193 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28815)

(declare-fun array_inv!10006 (array!28815) Bool)

(assert (=> start!41390 (array_inv!10006 _keys!1025)))

(declare-fun array_inv!10007 (array!28813) Bool)

(assert (=> start!41390 (and (array_inv!10007 _values!833) e!269966)))

(declare-fun b!462583 () Bool)

(declare-fun res!276637 () Bool)

(assert (=> b!462583 (=> (not res!276637) (not e!269964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28815 (_ BitVec 32)) Bool)

(assert (=> b!462583 (= res!276637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20431 () Bool)

(declare-fun tp!39250 () Bool)

(declare-fun e!269963 () Bool)

(assert (=> mapNonEmpty!20431 (= mapRes!20431 (and tp!39250 e!269963))))

(declare-fun mapRest!20431 () (Array (_ BitVec 32) ValueCell!5910))

(declare-fun mapKey!20431 () (_ BitVec 32))

(declare-fun mapValue!20431 () ValueCell!5910)

(assert (=> mapNonEmpty!20431 (= (arr!13840 _values!833) (store mapRest!20431 mapKey!20431 mapValue!20431))))

(declare-fun b!462584 () Bool)

(assert (=> b!462584 (= e!269964 false)))

(declare-fun lt!209234 () Bool)

(declare-datatypes ((List!8347 0))(
  ( (Nil!8344) (Cons!8343 (h!9199 (_ BitVec 64)) (t!14291 List!8347)) )
))
(declare-fun arrayNoDuplicates!0 (array!28815 (_ BitVec 32) List!8347) Bool)

(assert (=> b!462584 (= lt!209234 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8344))))

(declare-fun b!462585 () Bool)

(assert (=> b!462585 (= e!269963 tp_is_empty!12507)))

(declare-fun b!462586 () Bool)

(declare-fun res!276638 () Bool)

(assert (=> b!462586 (=> (not res!276638) (not e!269964))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462586 (= res!276638 (and (= (size!14192 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14193 _keys!1025) (size!14192 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41390 res!276636) b!462586))

(assert (= (and b!462586 res!276638) b!462583))

(assert (= (and b!462583 res!276637) b!462584))

(assert (= (and b!462581 condMapEmpty!20431) mapIsEmpty!20431))

(assert (= (and b!462581 (not condMapEmpty!20431)) mapNonEmpty!20431))

(get-info :version)

(assert (= (and mapNonEmpty!20431 ((_ is ValueCellFull!5910) mapValue!20431)) b!462585))

(assert (= (and b!462581 ((_ is ValueCellFull!5910) mapDefault!20431)) b!462582))

(assert (= start!41390 b!462581))

(declare-fun m!445473 () Bool)

(assert (=> start!41390 m!445473))

(declare-fun m!445475 () Bool)

(assert (=> start!41390 m!445475))

(declare-fun m!445477 () Bool)

(assert (=> start!41390 m!445477))

(declare-fun m!445479 () Bool)

(assert (=> b!462583 m!445479))

(declare-fun m!445481 () Bool)

(assert (=> mapNonEmpty!20431 m!445481))

(declare-fun m!445483 () Bool)

(assert (=> b!462584 m!445483))

(check-sat (not b!462583) (not mapNonEmpty!20431) (not start!41390) tp_is_empty!12507 (not b!462584))
(check-sat)
