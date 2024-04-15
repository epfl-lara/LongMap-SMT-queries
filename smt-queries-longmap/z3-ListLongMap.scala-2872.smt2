; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41338 () Bool)

(assert start!41338)

(declare-fun b!461968 () Bool)

(declare-fun e!269506 () Bool)

(declare-fun tp_is_empty!12469 () Bool)

(assert (=> b!461968 (= e!269506 tp_is_empty!12469)))

(declare-fun b!461969 () Bool)

(declare-fun res!276337 () Bool)

(declare-fun e!269504 () Bool)

(assert (=> b!461969 (=> (not res!276337) (not e!269504))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28737 0))(
  ( (array!28738 (arr!13802 (Array (_ BitVec 32) (_ BitVec 64))) (size!14155 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28737)

(declare-datatypes ((V!17731 0))(
  ( (V!17732 (val!6279 Int)) )
))
(declare-datatypes ((ValueCell!5891 0))(
  ( (ValueCellFull!5891 (v!8560 V!17731)) (EmptyCell!5891) )
))
(declare-datatypes ((array!28739 0))(
  ( (array!28740 (arr!13803 (Array (_ BitVec 32) ValueCell!5891)) (size!14156 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28739)

(assert (=> b!461969 (= res!276337 (and (= (size!14156 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14155 _keys!1025) (size!14156 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!461970 () Bool)

(assert (=> b!461970 (= e!269504 false)))

(declare-fun lt!208943 () Bool)

(declare-datatypes ((List!8358 0))(
  ( (Nil!8355) (Cons!8354 (h!9210 (_ BitVec 64)) (t!14293 List!8358)) )
))
(declare-fun arrayNoDuplicates!0 (array!28737 (_ BitVec 32) List!8358) Bool)

(assert (=> b!461970 (= lt!208943 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8355))))

(declare-fun b!461971 () Bool)

(declare-fun e!269508 () Bool)

(assert (=> b!461971 (= e!269508 tp_is_empty!12469)))

(declare-fun b!461972 () Bool)

(declare-fun res!276338 () Bool)

(assert (=> b!461972 (=> (not res!276338) (not e!269504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28737 (_ BitVec 32)) Bool)

(assert (=> b!461972 (= res!276338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276336 () Bool)

(assert (=> start!41338 (=> (not res!276336) (not e!269504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41338 (= res!276336 (validMask!0 mask!1365))))

(assert (=> start!41338 e!269504))

(assert (=> start!41338 true))

(declare-fun array_inv!10052 (array!28737) Bool)

(assert (=> start!41338 (array_inv!10052 _keys!1025)))

(declare-fun e!269507 () Bool)

(declare-fun array_inv!10053 (array!28739) Bool)

(assert (=> start!41338 (and (array_inv!10053 _values!833) e!269507)))

(declare-fun mapIsEmpty!20374 () Bool)

(declare-fun mapRes!20374 () Bool)

(assert (=> mapIsEmpty!20374 mapRes!20374))

(declare-fun mapNonEmpty!20374 () Bool)

(declare-fun tp!39193 () Bool)

(assert (=> mapNonEmpty!20374 (= mapRes!20374 (and tp!39193 e!269506))))

(declare-fun mapValue!20374 () ValueCell!5891)

(declare-fun mapRest!20374 () (Array (_ BitVec 32) ValueCell!5891))

(declare-fun mapKey!20374 () (_ BitVec 32))

(assert (=> mapNonEmpty!20374 (= (arr!13803 _values!833) (store mapRest!20374 mapKey!20374 mapValue!20374))))

(declare-fun b!461973 () Bool)

(assert (=> b!461973 (= e!269507 (and e!269508 mapRes!20374))))

(declare-fun condMapEmpty!20374 () Bool)

(declare-fun mapDefault!20374 () ValueCell!5891)

(assert (=> b!461973 (= condMapEmpty!20374 (= (arr!13803 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5891)) mapDefault!20374)))))

(assert (= (and start!41338 res!276336) b!461969))

(assert (= (and b!461969 res!276337) b!461972))

(assert (= (and b!461972 res!276338) b!461970))

(assert (= (and b!461973 condMapEmpty!20374) mapIsEmpty!20374))

(assert (= (and b!461973 (not condMapEmpty!20374)) mapNonEmpty!20374))

(get-info :version)

(assert (= (and mapNonEmpty!20374 ((_ is ValueCellFull!5891) mapValue!20374)) b!461968))

(assert (= (and b!461973 ((_ is ValueCellFull!5891) mapDefault!20374)) b!461971))

(assert (= start!41338 b!461973))

(declare-fun m!444511 () Bool)

(assert (=> b!461970 m!444511))

(declare-fun m!444513 () Bool)

(assert (=> b!461972 m!444513))

(declare-fun m!444515 () Bool)

(assert (=> start!41338 m!444515))

(declare-fun m!444517 () Bool)

(assert (=> start!41338 m!444517))

(declare-fun m!444519 () Bool)

(assert (=> start!41338 m!444519))

(declare-fun m!444521 () Bool)

(assert (=> mapNonEmpty!20374 m!444521))

(check-sat (not mapNonEmpty!20374) (not start!41338) (not b!461970) (not b!461972) tp_is_empty!12469)
(check-sat)
