; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41350 () Bool)

(assert start!41350)

(declare-fun res!276512 () Bool)

(declare-fun e!269731 () Bool)

(assert (=> start!41350 (=> (not res!276512) (not e!269731))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41350 (= res!276512 (validMask!0 mask!1365))))

(assert (=> start!41350 e!269731))

(assert (=> start!41350 true))

(declare-datatypes ((array!28764 0))(
  ( (array!28765 (arr!13815 (Array (_ BitVec 32) (_ BitVec 64))) (size!14167 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28764)

(declare-fun array_inv!10072 (array!28764) Bool)

(assert (=> start!41350 (array_inv!10072 _keys!1025)))

(declare-datatypes ((V!17747 0))(
  ( (V!17748 (val!6285 Int)) )
))
(declare-datatypes ((ValueCell!5897 0))(
  ( (ValueCellFull!5897 (v!8573 V!17747)) (EmptyCell!5897) )
))
(declare-datatypes ((array!28766 0))(
  ( (array!28767 (arr!13816 (Array (_ BitVec 32) ValueCell!5897)) (size!14168 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28766)

(declare-fun e!269729 () Bool)

(declare-fun array_inv!10073 (array!28766) Bool)

(assert (=> start!41350 (and (array_inv!10073 _values!833) e!269729)))

(declare-fun b!462286 () Bool)

(declare-fun e!269730 () Bool)

(declare-fun tp_is_empty!12481 () Bool)

(assert (=> b!462286 (= e!269730 tp_is_empty!12481)))

(declare-fun b!462287 () Bool)

(declare-fun e!269732 () Bool)

(assert (=> b!462287 (= e!269732 tp_is_empty!12481)))

(declare-fun mapNonEmpty!20392 () Bool)

(declare-fun mapRes!20392 () Bool)

(declare-fun tp!39211 () Bool)

(assert (=> mapNonEmpty!20392 (= mapRes!20392 (and tp!39211 e!269730))))

(declare-fun mapRest!20392 () (Array (_ BitVec 32) ValueCell!5897))

(declare-fun mapValue!20392 () ValueCell!5897)

(declare-fun mapKey!20392 () (_ BitVec 32))

(assert (=> mapNonEmpty!20392 (= (arr!13816 _values!833) (store mapRest!20392 mapKey!20392 mapValue!20392))))

(declare-fun b!462288 () Bool)

(assert (=> b!462288 (= e!269729 (and e!269732 mapRes!20392))))

(declare-fun condMapEmpty!20392 () Bool)

(declare-fun mapDefault!20392 () ValueCell!5897)

(assert (=> b!462288 (= condMapEmpty!20392 (= (arr!13816 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5897)) mapDefault!20392)))))

(declare-fun b!462289 () Bool)

(declare-fun res!276514 () Bool)

(assert (=> b!462289 (=> (not res!276514) (not e!269731))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462289 (= res!276514 (and (= (size!14168 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14167 _keys!1025) (size!14168 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462290 () Bool)

(declare-fun res!276513 () Bool)

(assert (=> b!462290 (=> (not res!276513) (not e!269731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28764 (_ BitVec 32)) Bool)

(assert (=> b!462290 (= res!276513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462291 () Bool)

(assert (=> b!462291 (= e!269731 false)))

(declare-fun lt!209207 () Bool)

(declare-datatypes ((List!8264 0))(
  ( (Nil!8261) (Cons!8260 (h!9116 (_ BitVec 64)) (t!14200 List!8264)) )
))
(declare-fun arrayNoDuplicates!0 (array!28764 (_ BitVec 32) List!8264) Bool)

(assert (=> b!462291 (= lt!209207 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8261))))

(declare-fun mapIsEmpty!20392 () Bool)

(assert (=> mapIsEmpty!20392 mapRes!20392))

(assert (= (and start!41350 res!276512) b!462289))

(assert (= (and b!462289 res!276514) b!462290))

(assert (= (and b!462290 res!276513) b!462291))

(assert (= (and b!462288 condMapEmpty!20392) mapIsEmpty!20392))

(assert (= (and b!462288 (not condMapEmpty!20392)) mapNonEmpty!20392))

(get-info :version)

(assert (= (and mapNonEmpty!20392 ((_ is ValueCellFull!5897) mapValue!20392)) b!462286))

(assert (= (and b!462288 ((_ is ValueCellFull!5897) mapDefault!20392)) b!462287))

(assert (= start!41350 b!462288))

(declare-fun m!445499 () Bool)

(assert (=> start!41350 m!445499))

(declare-fun m!445501 () Bool)

(assert (=> start!41350 m!445501))

(declare-fun m!445503 () Bool)

(assert (=> start!41350 m!445503))

(declare-fun m!445505 () Bool)

(assert (=> mapNonEmpty!20392 m!445505))

(declare-fun m!445507 () Bool)

(assert (=> b!462290 m!445507))

(declare-fun m!445509 () Bool)

(assert (=> b!462291 m!445509))

(check-sat (not mapNonEmpty!20392) (not b!462290) (not b!462291) (not start!41350) tp_is_empty!12481)
(check-sat)
