; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41424 () Bool)

(assert start!41424)

(declare-fun b_free!11103 () Bool)

(declare-fun b_next!11103 () Bool)

(assert (=> start!41424 (= b_free!11103 (not b_next!11103))))

(declare-fun tp!39304 () Bool)

(declare-fun b_and!19439 () Bool)

(assert (=> start!41424 (= tp!39304 b_and!19439)))

(declare-fun b!462855 () Bool)

(declare-fun e!270171 () Bool)

(declare-fun e!270172 () Bool)

(declare-fun mapRes!20470 () Bool)

(assert (=> b!462855 (= e!270171 (and e!270172 mapRes!20470))))

(declare-fun condMapEmpty!20470 () Bool)

(declare-datatypes ((V!17813 0))(
  ( (V!17814 (val!6310 Int)) )
))
(declare-datatypes ((ValueCell!5922 0))(
  ( (ValueCellFull!5922 (v!8597 V!17813)) (EmptyCell!5922) )
))
(declare-datatypes ((array!28863 0))(
  ( (array!28864 (arr!13864 (Array (_ BitVec 32) ValueCell!5922)) (size!14216 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28863)

(declare-fun mapDefault!20470 () ValueCell!5922)

(assert (=> b!462855 (= condMapEmpty!20470 (= (arr!13864 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5922)) mapDefault!20470)))))

(declare-fun mapIsEmpty!20470 () Bool)

(assert (=> mapIsEmpty!20470 mapRes!20470))

(declare-fun b!462856 () Bool)

(declare-fun res!276785 () Bool)

(declare-fun e!270174 () Bool)

(assert (=> b!462856 (=> (not res!276785) (not e!270174))))

(declare-datatypes ((array!28865 0))(
  ( (array!28866 (arr!13865 (Array (_ BitVec 32) (_ BitVec 64))) (size!14217 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28865)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28865 (_ BitVec 32)) Bool)

(assert (=> b!462856 (= res!276785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462857 () Bool)

(declare-fun e!270170 () Bool)

(declare-fun tp_is_empty!12531 () Bool)

(assert (=> b!462857 (= e!270170 tp_is_empty!12531)))

(declare-fun b!462858 () Bool)

(declare-fun res!276782 () Bool)

(assert (=> b!462858 (=> (not res!276782) (not e!270174))))

(declare-datatypes ((List!8360 0))(
  ( (Nil!8357) (Cons!8356 (h!9212 (_ BitVec 64)) (t!14304 List!8360)) )
))
(declare-fun arrayNoDuplicates!0 (array!28865 (_ BitVec 32) List!8360) Bool)

(assert (=> b!462858 (= res!276782 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8357))))

(declare-fun b!462859 () Bool)

(assert (=> b!462859 (= e!270172 tp_is_empty!12531)))

(declare-fun b!462860 () Bool)

(declare-fun res!276784 () Bool)

(assert (=> b!462860 (=> (not res!276784) (not e!270174))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462860 (= res!276784 (and (= (size!14216 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14217 _keys!1025) (size!14216 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276783 () Bool)

(assert (=> start!41424 (=> (not res!276783) (not e!270174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41424 (= res!276783 (validMask!0 mask!1365))))

(assert (=> start!41424 e!270174))

(assert (=> start!41424 tp_is_empty!12531))

(assert (=> start!41424 tp!39304))

(assert (=> start!41424 true))

(declare-fun array_inv!10026 (array!28865) Bool)

(assert (=> start!41424 (array_inv!10026 _keys!1025)))

(declare-fun array_inv!10027 (array!28863) Bool)

(assert (=> start!41424 (and (array_inv!10027 _values!833) e!270171)))

(declare-fun b!462861 () Bool)

(assert (=> b!462861 (= e!270174 false)))

(declare-fun minValueBefore!38 () V!17813)

(declare-fun zeroValue!794 () V!17813)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8268 0))(
  ( (tuple2!8269 (_1!4145 (_ BitVec 64)) (_2!4145 V!17813)) )
))
(declare-datatypes ((List!8361 0))(
  ( (Nil!8358) (Cons!8357 (h!9213 tuple2!8268) (t!14305 List!8361)) )
))
(declare-datatypes ((ListLongMap!7181 0))(
  ( (ListLongMap!7182 (toList!3606 List!8361)) )
))
(declare-fun lt!209270 () ListLongMap!7181)

(declare-fun getCurrentListMapNoExtraKeys!1786 (array!28865 array!28863 (_ BitVec 32) (_ BitVec 32) V!17813 V!17813 (_ BitVec 32) Int) ListLongMap!7181)

(assert (=> b!462861 (= lt!209270 (getCurrentListMapNoExtraKeys!1786 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20470 () Bool)

(declare-fun tp!39303 () Bool)

(assert (=> mapNonEmpty!20470 (= mapRes!20470 (and tp!39303 e!270170))))

(declare-fun mapValue!20470 () ValueCell!5922)

(declare-fun mapRest!20470 () (Array (_ BitVec 32) ValueCell!5922))

(declare-fun mapKey!20470 () (_ BitVec 32))

(assert (=> mapNonEmpty!20470 (= (arr!13864 _values!833) (store mapRest!20470 mapKey!20470 mapValue!20470))))

(assert (= (and start!41424 res!276783) b!462860))

(assert (= (and b!462860 res!276784) b!462856))

(assert (= (and b!462856 res!276785) b!462858))

(assert (= (and b!462858 res!276782) b!462861))

(assert (= (and b!462855 condMapEmpty!20470) mapIsEmpty!20470))

(assert (= (and b!462855 (not condMapEmpty!20470)) mapNonEmpty!20470))

(get-info :version)

(assert (= (and mapNonEmpty!20470 ((_ is ValueCellFull!5922) mapValue!20470)) b!462857))

(assert (= (and b!462855 ((_ is ValueCellFull!5922) mapDefault!20470)) b!462859))

(assert (= start!41424 b!462855))

(declare-fun m!445643 () Bool)

(assert (=> b!462861 m!445643))

(declare-fun m!445645 () Bool)

(assert (=> mapNonEmpty!20470 m!445645))

(declare-fun m!445647 () Bool)

(assert (=> start!41424 m!445647))

(declare-fun m!445649 () Bool)

(assert (=> start!41424 m!445649))

(declare-fun m!445651 () Bool)

(assert (=> start!41424 m!445651))

(declare-fun m!445653 () Bool)

(assert (=> b!462856 m!445653))

(declare-fun m!445655 () Bool)

(assert (=> b!462858 m!445655))

(check-sat b_and!19439 (not b_next!11103) (not mapNonEmpty!20470) (not b!462856) (not start!41424) (not b!462861) (not b!462858) tp_is_empty!12531)
(check-sat b_and!19439 (not b_next!11103))
