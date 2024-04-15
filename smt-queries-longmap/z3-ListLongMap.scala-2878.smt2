; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41374 () Bool)

(assert start!41374)

(declare-fun b!462292 () Bool)

(declare-fun e!269776 () Bool)

(declare-fun tp_is_empty!12505 () Bool)

(assert (=> b!462292 (= e!269776 tp_is_empty!12505)))

(declare-fun b!462293 () Bool)

(declare-fun res!276498 () Bool)

(declare-fun e!269777 () Bool)

(assert (=> b!462293 (=> (not res!276498) (not e!269777))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28805 0))(
  ( (array!28806 (arr!13836 (Array (_ BitVec 32) (_ BitVec 64))) (size!14189 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28805)

(declare-datatypes ((V!17779 0))(
  ( (V!17780 (val!6297 Int)) )
))
(declare-datatypes ((ValueCell!5909 0))(
  ( (ValueCellFull!5909 (v!8578 V!17779)) (EmptyCell!5909) )
))
(declare-datatypes ((array!28807 0))(
  ( (array!28808 (arr!13837 (Array (_ BitVec 32) ValueCell!5909)) (size!14190 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28807)

(assert (=> b!462293 (= res!276498 (and (= (size!14190 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14189 _keys!1025) (size!14190 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462294 () Bool)

(declare-fun e!269774 () Bool)

(declare-fun mapRes!20428 () Bool)

(assert (=> b!462294 (= e!269774 (and e!269776 mapRes!20428))))

(declare-fun condMapEmpty!20428 () Bool)

(declare-fun mapDefault!20428 () ValueCell!5909)

(assert (=> b!462294 (= condMapEmpty!20428 (= (arr!13837 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5909)) mapDefault!20428)))))

(declare-fun mapIsEmpty!20428 () Bool)

(assert (=> mapIsEmpty!20428 mapRes!20428))

(declare-fun res!276500 () Bool)

(assert (=> start!41374 (=> (not res!276500) (not e!269777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41374 (= res!276500 (validMask!0 mask!1365))))

(assert (=> start!41374 e!269777))

(assert (=> start!41374 true))

(declare-fun array_inv!10076 (array!28805) Bool)

(assert (=> start!41374 (array_inv!10076 _keys!1025)))

(declare-fun array_inv!10077 (array!28807) Bool)

(assert (=> start!41374 (and (array_inv!10077 _values!833) e!269774)))

(declare-fun b!462295 () Bool)

(assert (=> b!462295 (= e!269777 false)))

(declare-fun lt!208997 () Bool)

(declare-datatypes ((List!8370 0))(
  ( (Nil!8367) (Cons!8366 (h!9222 (_ BitVec 64)) (t!14305 List!8370)) )
))
(declare-fun arrayNoDuplicates!0 (array!28805 (_ BitVec 32) List!8370) Bool)

(assert (=> b!462295 (= lt!208997 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8367))))

(declare-fun b!462296 () Bool)

(declare-fun e!269778 () Bool)

(assert (=> b!462296 (= e!269778 tp_is_empty!12505)))

(declare-fun mapNonEmpty!20428 () Bool)

(declare-fun tp!39247 () Bool)

(assert (=> mapNonEmpty!20428 (= mapRes!20428 (and tp!39247 e!269778))))

(declare-fun mapValue!20428 () ValueCell!5909)

(declare-fun mapKey!20428 () (_ BitVec 32))

(declare-fun mapRest!20428 () (Array (_ BitVec 32) ValueCell!5909))

(assert (=> mapNonEmpty!20428 (= (arr!13837 _values!833) (store mapRest!20428 mapKey!20428 mapValue!20428))))

(declare-fun b!462297 () Bool)

(declare-fun res!276499 () Bool)

(assert (=> b!462297 (=> (not res!276499) (not e!269777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28805 (_ BitVec 32)) Bool)

(assert (=> b!462297 (= res!276499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41374 res!276500) b!462293))

(assert (= (and b!462293 res!276498) b!462297))

(assert (= (and b!462297 res!276499) b!462295))

(assert (= (and b!462294 condMapEmpty!20428) mapIsEmpty!20428))

(assert (= (and b!462294 (not condMapEmpty!20428)) mapNonEmpty!20428))

(get-info :version)

(assert (= (and mapNonEmpty!20428 ((_ is ValueCellFull!5909) mapValue!20428)) b!462296))

(assert (= (and b!462294 ((_ is ValueCellFull!5909) mapDefault!20428)) b!462292))

(assert (= start!41374 b!462294))

(declare-fun m!444727 () Bool)

(assert (=> start!41374 m!444727))

(declare-fun m!444729 () Bool)

(assert (=> start!41374 m!444729))

(declare-fun m!444731 () Bool)

(assert (=> start!41374 m!444731))

(declare-fun m!444733 () Bool)

(assert (=> b!462295 m!444733))

(declare-fun m!444735 () Bool)

(assert (=> mapNonEmpty!20428 m!444735))

(declare-fun m!444737 () Bool)

(assert (=> b!462297 m!444737))

(check-sat (not mapNonEmpty!20428) tp_is_empty!12505 (not start!41374) (not b!462295) (not b!462297))
(check-sat)
