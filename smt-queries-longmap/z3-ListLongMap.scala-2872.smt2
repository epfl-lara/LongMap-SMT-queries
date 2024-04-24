; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41338 () Bool)

(assert start!41338)

(declare-fun b!462178 () Bool)

(declare-fun e!269641 () Bool)

(declare-fun e!269639 () Bool)

(declare-fun mapRes!20374 () Bool)

(assert (=> b!462178 (= e!269641 (and e!269639 mapRes!20374))))

(declare-fun condMapEmpty!20374 () Bool)

(declare-datatypes ((V!17731 0))(
  ( (V!17732 (val!6279 Int)) )
))
(declare-datatypes ((ValueCell!5891 0))(
  ( (ValueCellFull!5891 (v!8567 V!17731)) (EmptyCell!5891) )
))
(declare-datatypes ((array!28740 0))(
  ( (array!28741 (arr!13803 (Array (_ BitVec 32) ValueCell!5891)) (size!14155 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28740)

(declare-fun mapDefault!20374 () ValueCell!5891)

(assert (=> b!462178 (= condMapEmpty!20374 (= (arr!13803 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5891)) mapDefault!20374)))))

(declare-fun res!276459 () Bool)

(declare-fun e!269640 () Bool)

(assert (=> start!41338 (=> (not res!276459) (not e!269640))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41338 (= res!276459 (validMask!0 mask!1365))))

(assert (=> start!41338 e!269640))

(assert (=> start!41338 true))

(declare-datatypes ((array!28742 0))(
  ( (array!28743 (arr!13804 (Array (_ BitVec 32) (_ BitVec 64))) (size!14156 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28742)

(declare-fun array_inv!10066 (array!28742) Bool)

(assert (=> start!41338 (array_inv!10066 _keys!1025)))

(declare-fun array_inv!10067 (array!28740) Bool)

(assert (=> start!41338 (and (array_inv!10067 _values!833) e!269641)))

(declare-fun mapNonEmpty!20374 () Bool)

(declare-fun tp!39193 () Bool)

(declare-fun e!269643 () Bool)

(assert (=> mapNonEmpty!20374 (= mapRes!20374 (and tp!39193 e!269643))))

(declare-fun mapRest!20374 () (Array (_ BitVec 32) ValueCell!5891))

(declare-fun mapValue!20374 () ValueCell!5891)

(declare-fun mapKey!20374 () (_ BitVec 32))

(assert (=> mapNonEmpty!20374 (= (arr!13803 _values!833) (store mapRest!20374 mapKey!20374 mapValue!20374))))

(declare-fun b!462179 () Bool)

(declare-fun res!276460 () Bool)

(assert (=> b!462179 (=> (not res!276460) (not e!269640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28742 (_ BitVec 32)) Bool)

(assert (=> b!462179 (= res!276460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462180 () Bool)

(declare-fun res!276458 () Bool)

(assert (=> b!462180 (=> (not res!276458) (not e!269640))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462180 (= res!276458 (and (= (size!14155 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14156 _keys!1025) (size!14155 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462181 () Bool)

(declare-fun tp_is_empty!12469 () Bool)

(assert (=> b!462181 (= e!269639 tp_is_empty!12469)))

(declare-fun mapIsEmpty!20374 () Bool)

(assert (=> mapIsEmpty!20374 mapRes!20374))

(declare-fun b!462182 () Bool)

(assert (=> b!462182 (= e!269640 false)))

(declare-fun lt!209189 () Bool)

(declare-datatypes ((List!8261 0))(
  ( (Nil!8258) (Cons!8257 (h!9113 (_ BitVec 64)) (t!14197 List!8261)) )
))
(declare-fun arrayNoDuplicates!0 (array!28742 (_ BitVec 32) List!8261) Bool)

(assert (=> b!462182 (= lt!209189 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8258))))

(declare-fun b!462183 () Bool)

(assert (=> b!462183 (= e!269643 tp_is_empty!12469)))

(assert (= (and start!41338 res!276459) b!462180))

(assert (= (and b!462180 res!276458) b!462179))

(assert (= (and b!462179 res!276460) b!462182))

(assert (= (and b!462178 condMapEmpty!20374) mapIsEmpty!20374))

(assert (= (and b!462178 (not condMapEmpty!20374)) mapNonEmpty!20374))

(get-info :version)

(assert (= (and mapNonEmpty!20374 ((_ is ValueCellFull!5891) mapValue!20374)) b!462183))

(assert (= (and b!462178 ((_ is ValueCellFull!5891) mapDefault!20374)) b!462181))

(assert (= start!41338 b!462178))

(declare-fun m!445427 () Bool)

(assert (=> start!41338 m!445427))

(declare-fun m!445429 () Bool)

(assert (=> start!41338 m!445429))

(declare-fun m!445431 () Bool)

(assert (=> start!41338 m!445431))

(declare-fun m!445433 () Bool)

(assert (=> mapNonEmpty!20374 m!445433))

(declare-fun m!445435 () Bool)

(assert (=> b!462179 m!445435))

(declare-fun m!445437 () Bool)

(assert (=> b!462182 m!445437))

(check-sat (not b!462179) tp_is_empty!12469 (not b!462182) (not start!41338) (not mapNonEmpty!20374))
(check-sat)
