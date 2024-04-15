; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41356 () Bool)

(assert start!41356)

(declare-fun b!462130 () Bool)

(declare-fun e!269639 () Bool)

(declare-fun tp_is_empty!12487 () Bool)

(assert (=> b!462130 (= e!269639 tp_is_empty!12487)))

(declare-fun b!462131 () Bool)

(declare-fun e!269642 () Bool)

(declare-fun e!269640 () Bool)

(declare-fun mapRes!20401 () Bool)

(assert (=> b!462131 (= e!269642 (and e!269640 mapRes!20401))))

(declare-fun condMapEmpty!20401 () Bool)

(declare-datatypes ((V!17755 0))(
  ( (V!17756 (val!6288 Int)) )
))
(declare-datatypes ((ValueCell!5900 0))(
  ( (ValueCellFull!5900 (v!8569 V!17755)) (EmptyCell!5900) )
))
(declare-datatypes ((array!28771 0))(
  ( (array!28772 (arr!13819 (Array (_ BitVec 32) ValueCell!5900)) (size!14172 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28771)

(declare-fun mapDefault!20401 () ValueCell!5900)

(assert (=> b!462131 (= condMapEmpty!20401 (= (arr!13819 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5900)) mapDefault!20401)))))

(declare-fun b!462132 () Bool)

(declare-fun res!276418 () Bool)

(declare-fun e!269643 () Bool)

(assert (=> b!462132 (=> (not res!276418) (not e!269643))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28773 0))(
  ( (array!28774 (arr!13820 (Array (_ BitVec 32) (_ BitVec 64))) (size!14173 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28773)

(assert (=> b!462132 (= res!276418 (and (= (size!14172 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14173 _keys!1025) (size!14172 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20401 () Bool)

(assert (=> mapIsEmpty!20401 mapRes!20401))

(declare-fun mapNonEmpty!20401 () Bool)

(declare-fun tp!39220 () Bool)

(assert (=> mapNonEmpty!20401 (= mapRes!20401 (and tp!39220 e!269639))))

(declare-fun mapValue!20401 () ValueCell!5900)

(declare-fun mapKey!20401 () (_ BitVec 32))

(declare-fun mapRest!20401 () (Array (_ BitVec 32) ValueCell!5900))

(assert (=> mapNonEmpty!20401 (= (arr!13819 _values!833) (store mapRest!20401 mapKey!20401 mapValue!20401))))

(declare-fun res!276419 () Bool)

(assert (=> start!41356 (=> (not res!276419) (not e!269643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41356 (= res!276419 (validMask!0 mask!1365))))

(assert (=> start!41356 e!269643))

(assert (=> start!41356 true))

(declare-fun array_inv!10062 (array!28773) Bool)

(assert (=> start!41356 (array_inv!10062 _keys!1025)))

(declare-fun array_inv!10063 (array!28771) Bool)

(assert (=> start!41356 (and (array_inv!10063 _values!833) e!269642)))

(declare-fun b!462133 () Bool)

(declare-fun res!276417 () Bool)

(assert (=> b!462133 (=> (not res!276417) (not e!269643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28773 (_ BitVec 32)) Bool)

(assert (=> b!462133 (= res!276417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462134 () Bool)

(assert (=> b!462134 (= e!269643 false)))

(declare-fun lt!208970 () Bool)

(declare-datatypes ((List!8363 0))(
  ( (Nil!8360) (Cons!8359 (h!9215 (_ BitVec 64)) (t!14298 List!8363)) )
))
(declare-fun arrayNoDuplicates!0 (array!28773 (_ BitVec 32) List!8363) Bool)

(assert (=> b!462134 (= lt!208970 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8360))))

(declare-fun b!462135 () Bool)

(assert (=> b!462135 (= e!269640 tp_is_empty!12487)))

(assert (= (and start!41356 res!276419) b!462132))

(assert (= (and b!462132 res!276418) b!462133))

(assert (= (and b!462133 res!276417) b!462134))

(assert (= (and b!462131 condMapEmpty!20401) mapIsEmpty!20401))

(assert (= (and b!462131 (not condMapEmpty!20401)) mapNonEmpty!20401))

(get-info :version)

(assert (= (and mapNonEmpty!20401 ((_ is ValueCellFull!5900) mapValue!20401)) b!462130))

(assert (= (and b!462131 ((_ is ValueCellFull!5900) mapDefault!20401)) b!462135))

(assert (= start!41356 b!462131))

(declare-fun m!444619 () Bool)

(assert (=> mapNonEmpty!20401 m!444619))

(declare-fun m!444621 () Bool)

(assert (=> start!41356 m!444621))

(declare-fun m!444623 () Bool)

(assert (=> start!41356 m!444623))

(declare-fun m!444625 () Bool)

(assert (=> start!41356 m!444625))

(declare-fun m!444627 () Bool)

(assert (=> b!462133 m!444627))

(declare-fun m!444629 () Bool)

(assert (=> b!462134 m!444629))

(check-sat (not start!41356) tp_is_empty!12487 (not b!462134) (not mapNonEmpty!20401) (not b!462133))
(check-sat)
