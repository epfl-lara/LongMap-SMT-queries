; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41374 () Bool)

(assert start!41374)

(declare-fun b!462502 () Bool)

(declare-fun e!269910 () Bool)

(declare-fun tp_is_empty!12505 () Bool)

(assert (=> b!462502 (= e!269910 tp_is_empty!12505)))

(declare-fun b!462503 () Bool)

(declare-fun res!276620 () Bool)

(declare-fun e!269911 () Bool)

(assert (=> b!462503 (=> (not res!276620) (not e!269911))))

(declare-datatypes ((array!28808 0))(
  ( (array!28809 (arr!13837 (Array (_ BitVec 32) (_ BitVec 64))) (size!14189 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28808)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28808 (_ BitVec 32)) Bool)

(assert (=> b!462503 (= res!276620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462504 () Bool)

(declare-fun e!269913 () Bool)

(declare-fun e!269912 () Bool)

(declare-fun mapRes!20428 () Bool)

(assert (=> b!462504 (= e!269913 (and e!269912 mapRes!20428))))

(declare-fun condMapEmpty!20428 () Bool)

(declare-datatypes ((V!17779 0))(
  ( (V!17780 (val!6297 Int)) )
))
(declare-datatypes ((ValueCell!5909 0))(
  ( (ValueCellFull!5909 (v!8585 V!17779)) (EmptyCell!5909) )
))
(declare-datatypes ((array!28810 0))(
  ( (array!28811 (arr!13838 (Array (_ BitVec 32) ValueCell!5909)) (size!14190 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28810)

(declare-fun mapDefault!20428 () ValueCell!5909)

(assert (=> b!462504 (= condMapEmpty!20428 (= (arr!13838 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5909)) mapDefault!20428)))))

(declare-fun b!462505 () Bool)

(declare-fun res!276621 () Bool)

(assert (=> b!462505 (=> (not res!276621) (not e!269911))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462505 (= res!276621 (and (= (size!14190 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14189 _keys!1025) (size!14190 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462506 () Bool)

(assert (=> b!462506 (= e!269912 tp_is_empty!12505)))

(declare-fun mapIsEmpty!20428 () Bool)

(assert (=> mapIsEmpty!20428 mapRes!20428))

(declare-fun b!462507 () Bool)

(assert (=> b!462507 (= e!269911 false)))

(declare-fun lt!209243 () Bool)

(declare-datatypes ((List!8274 0))(
  ( (Nil!8271) (Cons!8270 (h!9126 (_ BitVec 64)) (t!14210 List!8274)) )
))
(declare-fun arrayNoDuplicates!0 (array!28808 (_ BitVec 32) List!8274) Bool)

(assert (=> b!462507 (= lt!209243 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8271))))

(declare-fun mapNonEmpty!20428 () Bool)

(declare-fun tp!39247 () Bool)

(assert (=> mapNonEmpty!20428 (= mapRes!20428 (and tp!39247 e!269910))))

(declare-fun mapValue!20428 () ValueCell!5909)

(declare-fun mapRest!20428 () (Array (_ BitVec 32) ValueCell!5909))

(declare-fun mapKey!20428 () (_ BitVec 32))

(assert (=> mapNonEmpty!20428 (= (arr!13838 _values!833) (store mapRest!20428 mapKey!20428 mapValue!20428))))

(declare-fun res!276622 () Bool)

(assert (=> start!41374 (=> (not res!276622) (not e!269911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41374 (= res!276622 (validMask!0 mask!1365))))

(assert (=> start!41374 e!269911))

(assert (=> start!41374 true))

(declare-fun array_inv!10088 (array!28808) Bool)

(assert (=> start!41374 (array_inv!10088 _keys!1025)))

(declare-fun array_inv!10089 (array!28810) Bool)

(assert (=> start!41374 (and (array_inv!10089 _values!833) e!269913)))

(assert (= (and start!41374 res!276622) b!462505))

(assert (= (and b!462505 res!276621) b!462503))

(assert (= (and b!462503 res!276620) b!462507))

(assert (= (and b!462504 condMapEmpty!20428) mapIsEmpty!20428))

(assert (= (and b!462504 (not condMapEmpty!20428)) mapNonEmpty!20428))

(get-info :version)

(assert (= (and mapNonEmpty!20428 ((_ is ValueCellFull!5909) mapValue!20428)) b!462502))

(assert (= (and b!462504 ((_ is ValueCellFull!5909) mapDefault!20428)) b!462506))

(assert (= start!41374 b!462504))

(declare-fun m!445643 () Bool)

(assert (=> b!462503 m!445643))

(declare-fun m!445645 () Bool)

(assert (=> b!462507 m!445645))

(declare-fun m!445647 () Bool)

(assert (=> mapNonEmpty!20428 m!445647))

(declare-fun m!445649 () Bool)

(assert (=> start!41374 m!445649))

(declare-fun m!445651 () Bool)

(assert (=> start!41374 m!445651))

(declare-fun m!445653 () Bool)

(assert (=> start!41374 m!445653))

(check-sat (not b!462503) tp_is_empty!12505 (not start!41374) (not mapNonEmpty!20428) (not b!462507))
(check-sat)
