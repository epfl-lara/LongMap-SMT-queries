; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41350 () Bool)

(assert start!41350)

(declare-fun mapIsEmpty!20392 () Bool)

(declare-fun mapRes!20392 () Bool)

(assert (=> mapIsEmpty!20392 mapRes!20392))

(declare-fun b!462076 () Bool)

(declare-fun e!269597 () Bool)

(declare-fun tp_is_empty!12481 () Bool)

(assert (=> b!462076 (= e!269597 tp_is_empty!12481)))

(declare-fun b!462077 () Bool)

(declare-fun res!276392 () Bool)

(declare-fun e!269598 () Bool)

(assert (=> b!462077 (=> (not res!276392) (not e!269598))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28759 0))(
  ( (array!28760 (arr!13813 (Array (_ BitVec 32) (_ BitVec 64))) (size!14166 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28759)

(declare-datatypes ((V!17747 0))(
  ( (V!17748 (val!6285 Int)) )
))
(declare-datatypes ((ValueCell!5897 0))(
  ( (ValueCellFull!5897 (v!8566 V!17747)) (EmptyCell!5897) )
))
(declare-datatypes ((array!28761 0))(
  ( (array!28762 (arr!13814 (Array (_ BitVec 32) ValueCell!5897)) (size!14167 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28761)

(assert (=> b!462077 (= res!276392 (and (= (size!14167 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14166 _keys!1025) (size!14167 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462078 () Bool)

(declare-fun e!269595 () Bool)

(declare-fun e!269594 () Bool)

(assert (=> b!462078 (= e!269595 (and e!269594 mapRes!20392))))

(declare-fun condMapEmpty!20392 () Bool)

(declare-fun mapDefault!20392 () ValueCell!5897)

(assert (=> b!462078 (= condMapEmpty!20392 (= (arr!13814 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5897)) mapDefault!20392)))))

(declare-fun b!462080 () Bool)

(declare-fun res!276391 () Bool)

(assert (=> b!462080 (=> (not res!276391) (not e!269598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28759 (_ BitVec 32)) Bool)

(assert (=> b!462080 (= res!276391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462081 () Bool)

(assert (=> b!462081 (= e!269594 tp_is_empty!12481)))

(declare-fun mapNonEmpty!20392 () Bool)

(declare-fun tp!39211 () Bool)

(assert (=> mapNonEmpty!20392 (= mapRes!20392 (and tp!39211 e!269597))))

(declare-fun mapKey!20392 () (_ BitVec 32))

(declare-fun mapValue!20392 () ValueCell!5897)

(declare-fun mapRest!20392 () (Array (_ BitVec 32) ValueCell!5897))

(assert (=> mapNonEmpty!20392 (= (arr!13814 _values!833) (store mapRest!20392 mapKey!20392 mapValue!20392))))

(declare-fun res!276390 () Bool)

(assert (=> start!41350 (=> (not res!276390) (not e!269598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41350 (= res!276390 (validMask!0 mask!1365))))

(assert (=> start!41350 e!269598))

(assert (=> start!41350 true))

(declare-fun array_inv!10058 (array!28759) Bool)

(assert (=> start!41350 (array_inv!10058 _keys!1025)))

(declare-fun array_inv!10059 (array!28761) Bool)

(assert (=> start!41350 (and (array_inv!10059 _values!833) e!269595)))

(declare-fun b!462079 () Bool)

(assert (=> b!462079 (= e!269598 false)))

(declare-fun lt!208961 () Bool)

(declare-datatypes ((List!8362 0))(
  ( (Nil!8359) (Cons!8358 (h!9214 (_ BitVec 64)) (t!14297 List!8362)) )
))
(declare-fun arrayNoDuplicates!0 (array!28759 (_ BitVec 32) List!8362) Bool)

(assert (=> b!462079 (= lt!208961 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8359))))

(assert (= (and start!41350 res!276390) b!462077))

(assert (= (and b!462077 res!276392) b!462080))

(assert (= (and b!462080 res!276391) b!462079))

(assert (= (and b!462078 condMapEmpty!20392) mapIsEmpty!20392))

(assert (= (and b!462078 (not condMapEmpty!20392)) mapNonEmpty!20392))

(get-info :version)

(assert (= (and mapNonEmpty!20392 ((_ is ValueCellFull!5897) mapValue!20392)) b!462076))

(assert (= (and b!462078 ((_ is ValueCellFull!5897) mapDefault!20392)) b!462081))

(assert (= start!41350 b!462078))

(declare-fun m!444583 () Bool)

(assert (=> b!462080 m!444583))

(declare-fun m!444585 () Bool)

(assert (=> mapNonEmpty!20392 m!444585))

(declare-fun m!444587 () Bool)

(assert (=> start!41350 m!444587))

(declare-fun m!444589 () Bool)

(assert (=> start!41350 m!444589))

(declare-fun m!444591 () Bool)

(assert (=> start!41350 m!444591))

(declare-fun m!444593 () Bool)

(assert (=> b!462079 m!444593))

(check-sat tp_is_empty!12481 (not start!41350) (not mapNonEmpty!20392) (not b!462079) (not b!462080))
(check-sat)
