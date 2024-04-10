; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41460 () Bool)

(assert start!41460)

(declare-fun b_free!11139 () Bool)

(declare-fun b_next!11139 () Bool)

(assert (=> start!41460 (= b_free!11139 (not b_next!11139))))

(declare-fun tp!39412 () Bool)

(declare-fun b_and!19475 () Bool)

(assert (=> start!41460 (= tp!39412 b_and!19475)))

(declare-fun b!463233 () Bool)

(declare-fun res!277001 () Bool)

(declare-fun e!270443 () Bool)

(assert (=> b!463233 (=> (not res!277001) (not e!270443))))

(declare-datatypes ((array!28929 0))(
  ( (array!28930 (arr!13897 (Array (_ BitVec 32) (_ BitVec 64))) (size!14249 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28929)

(declare-datatypes ((List!8380 0))(
  ( (Nil!8377) (Cons!8376 (h!9232 (_ BitVec 64)) (t!14324 List!8380)) )
))
(declare-fun arrayNoDuplicates!0 (array!28929 (_ BitVec 32) List!8380) Bool)

(assert (=> b!463233 (= res!277001 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8377))))

(declare-fun b!463234 () Bool)

(declare-fun e!270440 () Bool)

(declare-fun tp_is_empty!12567 () Bool)

(assert (=> b!463234 (= e!270440 tp_is_empty!12567)))

(declare-fun b!463235 () Bool)

(assert (=> b!463235 (= e!270443 false)))

(declare-datatypes ((V!17861 0))(
  ( (V!17862 (val!6328 Int)) )
))
(declare-fun minValueBefore!38 () V!17861)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8286 0))(
  ( (tuple2!8287 (_1!4154 (_ BitVec 64)) (_2!4154 V!17861)) )
))
(declare-datatypes ((List!8381 0))(
  ( (Nil!8378) (Cons!8377 (h!9233 tuple2!8286) (t!14325 List!8381)) )
))
(declare-datatypes ((ListLongMap!7199 0))(
  ( (ListLongMap!7200 (toList!3615 List!8381)) )
))
(declare-fun lt!209324 () ListLongMap!7199)

(declare-datatypes ((ValueCell!5940 0))(
  ( (ValueCellFull!5940 (v!8615 V!17861)) (EmptyCell!5940) )
))
(declare-datatypes ((array!28931 0))(
  ( (array!28932 (arr!13898 (Array (_ BitVec 32) ValueCell!5940)) (size!14250 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28931)

(declare-fun zeroValue!794 () V!17861)

(declare-fun getCurrentListMapNoExtraKeys!1795 (array!28929 array!28931 (_ BitVec 32) (_ BitVec 32) V!17861 V!17861 (_ BitVec 32) Int) ListLongMap!7199)

(assert (=> b!463235 (= lt!209324 (getCurrentListMapNoExtraKeys!1795 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463236 () Bool)

(declare-fun res!276998 () Bool)

(assert (=> b!463236 (=> (not res!276998) (not e!270443))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463236 (= res!276998 (and (= (size!14250 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14249 _keys!1025) (size!14250 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276999 () Bool)

(assert (=> start!41460 (=> (not res!276999) (not e!270443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41460 (= res!276999 (validMask!0 mask!1365))))

(assert (=> start!41460 e!270443))

(assert (=> start!41460 tp_is_empty!12567))

(assert (=> start!41460 tp!39412))

(assert (=> start!41460 true))

(declare-fun array_inv!10046 (array!28929) Bool)

(assert (=> start!41460 (array_inv!10046 _keys!1025)))

(declare-fun e!270444 () Bool)

(declare-fun array_inv!10047 (array!28931) Bool)

(assert (=> start!41460 (and (array_inv!10047 _values!833) e!270444)))

(declare-fun b!463237 () Bool)

(declare-fun e!270441 () Bool)

(declare-fun mapRes!20524 () Bool)

(assert (=> b!463237 (= e!270444 (and e!270441 mapRes!20524))))

(declare-fun condMapEmpty!20524 () Bool)

(declare-fun mapDefault!20524 () ValueCell!5940)

(assert (=> b!463237 (= condMapEmpty!20524 (= (arr!13898 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5940)) mapDefault!20524)))))

(declare-fun b!463238 () Bool)

(declare-fun res!277000 () Bool)

(assert (=> b!463238 (=> (not res!277000) (not e!270443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28929 (_ BitVec 32)) Bool)

(assert (=> b!463238 (= res!277000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463239 () Bool)

(assert (=> b!463239 (= e!270441 tp_is_empty!12567)))

(declare-fun mapNonEmpty!20524 () Bool)

(declare-fun tp!39411 () Bool)

(assert (=> mapNonEmpty!20524 (= mapRes!20524 (and tp!39411 e!270440))))

(declare-fun mapRest!20524 () (Array (_ BitVec 32) ValueCell!5940))

(declare-fun mapKey!20524 () (_ BitVec 32))

(declare-fun mapValue!20524 () ValueCell!5940)

(assert (=> mapNonEmpty!20524 (= (arr!13898 _values!833) (store mapRest!20524 mapKey!20524 mapValue!20524))))

(declare-fun mapIsEmpty!20524 () Bool)

(assert (=> mapIsEmpty!20524 mapRes!20524))

(assert (= (and start!41460 res!276999) b!463236))

(assert (= (and b!463236 res!276998) b!463238))

(assert (= (and b!463238 res!277000) b!463233))

(assert (= (and b!463233 res!277001) b!463235))

(assert (= (and b!463237 condMapEmpty!20524) mapIsEmpty!20524))

(assert (= (and b!463237 (not condMapEmpty!20524)) mapNonEmpty!20524))

(get-info :version)

(assert (= (and mapNonEmpty!20524 ((_ is ValueCellFull!5940) mapValue!20524)) b!463234))

(assert (= (and b!463237 ((_ is ValueCellFull!5940) mapDefault!20524)) b!463239))

(assert (= start!41460 b!463237))

(declare-fun m!445895 () Bool)

(assert (=> start!41460 m!445895))

(declare-fun m!445897 () Bool)

(assert (=> start!41460 m!445897))

(declare-fun m!445899 () Bool)

(assert (=> start!41460 m!445899))

(declare-fun m!445901 () Bool)

(assert (=> b!463235 m!445901))

(declare-fun m!445903 () Bool)

(assert (=> mapNonEmpty!20524 m!445903))

(declare-fun m!445905 () Bool)

(assert (=> b!463233 m!445905))

(declare-fun m!445907 () Bool)

(assert (=> b!463238 m!445907))

(check-sat (not b!463235) (not mapNonEmpty!20524) (not b_next!11139) (not b!463233) b_and!19475 tp_is_empty!12567 (not b!463238) (not start!41460))
(check-sat b_and!19475 (not b_next!11139))
