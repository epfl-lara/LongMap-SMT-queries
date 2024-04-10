; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41448 () Bool)

(assert start!41448)

(declare-fun b_free!11127 () Bool)

(declare-fun b_next!11127 () Bool)

(assert (=> start!41448 (= b_free!11127 (not b_next!11127))))

(declare-fun tp!39376 () Bool)

(declare-fun b_and!19463 () Bool)

(assert (=> start!41448 (= tp!39376 b_and!19463)))

(declare-fun b!463107 () Bool)

(declare-fun e!270352 () Bool)

(declare-fun e!270351 () Bool)

(declare-fun mapRes!20506 () Bool)

(assert (=> b!463107 (= e!270352 (and e!270351 mapRes!20506))))

(declare-fun condMapEmpty!20506 () Bool)

(declare-datatypes ((V!17845 0))(
  ( (V!17846 (val!6322 Int)) )
))
(declare-datatypes ((ValueCell!5934 0))(
  ( (ValueCellFull!5934 (v!8609 V!17845)) (EmptyCell!5934) )
))
(declare-datatypes ((array!28907 0))(
  ( (array!28908 (arr!13886 (Array (_ BitVec 32) ValueCell!5934)) (size!14238 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28907)

(declare-fun mapDefault!20506 () ValueCell!5934)

(assert (=> b!463107 (= condMapEmpty!20506 (= (arr!13886 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5934)) mapDefault!20506)))))

(declare-fun b!463108 () Bool)

(declare-fun res!276927 () Bool)

(declare-fun e!270350 () Bool)

(assert (=> b!463108 (=> (not res!276927) (not e!270350))))

(declare-datatypes ((array!28909 0))(
  ( (array!28910 (arr!13887 (Array (_ BitVec 32) (_ BitVec 64))) (size!14239 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28909)

(declare-datatypes ((List!8374 0))(
  ( (Nil!8371) (Cons!8370 (h!9226 (_ BitVec 64)) (t!14318 List!8374)) )
))
(declare-fun arrayNoDuplicates!0 (array!28909 (_ BitVec 32) List!8374) Bool)

(assert (=> b!463108 (= res!276927 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8371))))

(declare-fun b!463109 () Bool)

(assert (=> b!463109 (= e!270350 false)))

(declare-fun zeroValue!794 () V!17845)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17845)

(declare-datatypes ((tuple2!8282 0))(
  ( (tuple2!8283 (_1!4152 (_ BitVec 64)) (_2!4152 V!17845)) )
))
(declare-datatypes ((List!8375 0))(
  ( (Nil!8372) (Cons!8371 (h!9227 tuple2!8282) (t!14319 List!8375)) )
))
(declare-datatypes ((ListLongMap!7195 0))(
  ( (ListLongMap!7196 (toList!3613 List!8375)) )
))
(declare-fun lt!209306 () ListLongMap!7195)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1793 (array!28909 array!28907 (_ BitVec 32) (_ BitVec 32) V!17845 V!17845 (_ BitVec 32) Int) ListLongMap!7195)

(assert (=> b!463109 (= lt!209306 (getCurrentListMapNoExtraKeys!1793 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463110 () Bool)

(declare-fun res!276926 () Bool)

(assert (=> b!463110 (=> (not res!276926) (not e!270350))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463110 (= res!276926 (and (= (size!14238 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14239 _keys!1025) (size!14238 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20506 () Bool)

(declare-fun tp!39375 () Bool)

(declare-fun e!270353 () Bool)

(assert (=> mapNonEmpty!20506 (= mapRes!20506 (and tp!39375 e!270353))))

(declare-fun mapKey!20506 () (_ BitVec 32))

(declare-fun mapRest!20506 () (Array (_ BitVec 32) ValueCell!5934))

(declare-fun mapValue!20506 () ValueCell!5934)

(assert (=> mapNonEmpty!20506 (= (arr!13886 _values!833) (store mapRest!20506 mapKey!20506 mapValue!20506))))

(declare-fun mapIsEmpty!20506 () Bool)

(assert (=> mapIsEmpty!20506 mapRes!20506))

(declare-fun b!463111 () Bool)

(declare-fun tp_is_empty!12555 () Bool)

(assert (=> b!463111 (= e!270353 tp_is_empty!12555)))

(declare-fun res!276929 () Bool)

(assert (=> start!41448 (=> (not res!276929) (not e!270350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41448 (= res!276929 (validMask!0 mask!1365))))

(assert (=> start!41448 e!270350))

(assert (=> start!41448 tp_is_empty!12555))

(assert (=> start!41448 tp!39376))

(assert (=> start!41448 true))

(declare-fun array_inv!10038 (array!28909) Bool)

(assert (=> start!41448 (array_inv!10038 _keys!1025)))

(declare-fun array_inv!10039 (array!28907) Bool)

(assert (=> start!41448 (and (array_inv!10039 _values!833) e!270352)))

(declare-fun b!463112 () Bool)

(assert (=> b!463112 (= e!270351 tp_is_empty!12555)))

(declare-fun b!463113 () Bool)

(declare-fun res!276928 () Bool)

(assert (=> b!463113 (=> (not res!276928) (not e!270350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28909 (_ BitVec 32)) Bool)

(assert (=> b!463113 (= res!276928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41448 res!276929) b!463110))

(assert (= (and b!463110 res!276926) b!463113))

(assert (= (and b!463113 res!276928) b!463108))

(assert (= (and b!463108 res!276927) b!463109))

(assert (= (and b!463107 condMapEmpty!20506) mapIsEmpty!20506))

(assert (= (and b!463107 (not condMapEmpty!20506)) mapNonEmpty!20506))

(get-info :version)

(assert (= (and mapNonEmpty!20506 ((_ is ValueCellFull!5934) mapValue!20506)) b!463111))

(assert (= (and b!463107 ((_ is ValueCellFull!5934) mapDefault!20506)) b!463112))

(assert (= start!41448 b!463107))

(declare-fun m!445811 () Bool)

(assert (=> b!463113 m!445811))

(declare-fun m!445813 () Bool)

(assert (=> b!463109 m!445813))

(declare-fun m!445815 () Bool)

(assert (=> mapNonEmpty!20506 m!445815))

(declare-fun m!445817 () Bool)

(assert (=> b!463108 m!445817))

(declare-fun m!445819 () Bool)

(assert (=> start!41448 m!445819))

(declare-fun m!445821 () Bool)

(assert (=> start!41448 m!445821))

(declare-fun m!445823 () Bool)

(assert (=> start!41448 m!445823))

(check-sat (not start!41448) (not b!463113) (not b_next!11127) (not b!463108) tp_is_empty!12555 (not mapNonEmpty!20506) b_and!19463 (not b!463109))
(check-sat b_and!19463 (not b_next!11127))
