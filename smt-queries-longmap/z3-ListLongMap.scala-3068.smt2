; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43262 () Bool)

(assert start!43262)

(declare-fun b_free!12129 () Bool)

(declare-fun b_next!12129 () Bool)

(assert (=> start!43262 (= b_free!12129 (not b_next!12129))))

(declare-fun tp!42657 () Bool)

(declare-fun b_and!20881 () Bool)

(assert (=> start!43262 (= tp!42657 b_and!20881)))

(declare-fun b!479321 () Bool)

(declare-fun e!281983 () Bool)

(declare-fun e!281982 () Bool)

(declare-fun mapRes!22159 () Bool)

(assert (=> b!479321 (= e!281983 (and e!281982 mapRes!22159))))

(declare-fun condMapEmpty!22159 () Bool)

(declare-datatypes ((V!19259 0))(
  ( (V!19260 (val!6868 Int)) )
))
(declare-datatypes ((ValueCell!6459 0))(
  ( (ValueCellFull!6459 (v!9157 V!19259)) (EmptyCell!6459) )
))
(declare-datatypes ((array!30955 0))(
  ( (array!30956 (arr!14884 (Array (_ BitVec 32) ValueCell!6459)) (size!15242 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30955)

(declare-fun mapDefault!22159 () ValueCell!6459)

(assert (=> b!479321 (= condMapEmpty!22159 (= (arr!14884 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6459)) mapDefault!22159)))))

(declare-fun b!479322 () Bool)

(declare-fun res!285921 () Bool)

(declare-fun e!281984 () Bool)

(assert (=> b!479322 (=> (not res!285921) (not e!281984))))

(declare-datatypes ((array!30957 0))(
  ( (array!30958 (arr!14885 (Array (_ BitVec 32) (_ BitVec 64))) (size!15243 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30957)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30957 (_ BitVec 32)) Bool)

(assert (=> b!479322 (= res!285921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22159 () Bool)

(declare-fun tp!42658 () Bool)

(declare-fun e!281981 () Bool)

(assert (=> mapNonEmpty!22159 (= mapRes!22159 (and tp!42658 e!281981))))

(declare-fun mapKey!22159 () (_ BitVec 32))

(declare-fun mapValue!22159 () ValueCell!6459)

(declare-fun mapRest!22159 () (Array (_ BitVec 32) ValueCell!6459))

(assert (=> mapNonEmpty!22159 (= (arr!14884 _values!1516) (store mapRest!22159 mapKey!22159 mapValue!22159))))

(declare-fun mapIsEmpty!22159 () Bool)

(assert (=> mapIsEmpty!22159 mapRes!22159))

(declare-fun res!285922 () Bool)

(assert (=> start!43262 (=> (not res!285922) (not e!281984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43262 (= res!285922 (validMask!0 mask!2352))))

(assert (=> start!43262 e!281984))

(assert (=> start!43262 true))

(declare-fun tp_is_empty!13641 () Bool)

(assert (=> start!43262 tp_is_empty!13641))

(declare-fun array_inv!10738 (array!30955) Bool)

(assert (=> start!43262 (and (array_inv!10738 _values!1516) e!281983)))

(assert (=> start!43262 tp!42657))

(declare-fun array_inv!10739 (array!30957) Bool)

(assert (=> start!43262 (array_inv!10739 _keys!1874)))

(declare-fun b!479323 () Bool)

(assert (=> b!479323 (= e!281984 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217846 () Bool)

(declare-fun minValue!1458 () V!19259)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19259)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9014 0))(
  ( (tuple2!9015 (_1!4518 (_ BitVec 64)) (_2!4518 V!19259)) )
))
(declare-datatypes ((List!9093 0))(
  ( (Nil!9090) (Cons!9089 (h!9945 tuple2!9014) (t!15299 List!9093)) )
))
(declare-datatypes ((ListLongMap!7927 0))(
  ( (ListLongMap!7928 (toList!3979 List!9093)) )
))
(declare-fun contains!2589 (ListLongMap!7927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2298 (array!30957 array!30955 (_ BitVec 32) (_ BitVec 32) V!19259 V!19259 (_ BitVec 32) Int) ListLongMap!7927)

(assert (=> b!479323 (= lt!217846 (contains!2589 (getCurrentListMap!2298 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479324 () Bool)

(declare-fun res!285923 () Bool)

(assert (=> b!479324 (=> (not res!285923) (not e!281984))))

(assert (=> b!479324 (= res!285923 (and (= (size!15242 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15243 _keys!1874) (size!15242 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479325 () Bool)

(assert (=> b!479325 (= e!281981 tp_is_empty!13641)))

(declare-fun b!479326 () Bool)

(assert (=> b!479326 (= e!281982 tp_is_empty!13641)))

(declare-fun b!479327 () Bool)

(declare-fun res!285924 () Bool)

(assert (=> b!479327 (=> (not res!285924) (not e!281984))))

(declare-datatypes ((List!9094 0))(
  ( (Nil!9091) (Cons!9090 (h!9946 (_ BitVec 64)) (t!15300 List!9094)) )
))
(declare-fun arrayNoDuplicates!0 (array!30957 (_ BitVec 32) List!9094) Bool)

(assert (=> b!479327 (= res!285924 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9091))))

(assert (= (and start!43262 res!285922) b!479324))

(assert (= (and b!479324 res!285923) b!479322))

(assert (= (and b!479322 res!285921) b!479327))

(assert (= (and b!479327 res!285924) b!479323))

(assert (= (and b!479321 condMapEmpty!22159) mapIsEmpty!22159))

(assert (= (and b!479321 (not condMapEmpty!22159)) mapNonEmpty!22159))

(get-info :version)

(assert (= (and mapNonEmpty!22159 ((_ is ValueCellFull!6459) mapValue!22159)) b!479325))

(assert (= (and b!479321 ((_ is ValueCellFull!6459) mapDefault!22159)) b!479326))

(assert (= start!43262 b!479321))

(declare-fun m!461295 () Bool)

(assert (=> b!479323 m!461295))

(assert (=> b!479323 m!461295))

(declare-fun m!461297 () Bool)

(assert (=> b!479323 m!461297))

(declare-fun m!461299 () Bool)

(assert (=> start!43262 m!461299))

(declare-fun m!461301 () Bool)

(assert (=> start!43262 m!461301))

(declare-fun m!461303 () Bool)

(assert (=> start!43262 m!461303))

(declare-fun m!461305 () Bool)

(assert (=> b!479327 m!461305))

(declare-fun m!461307 () Bool)

(assert (=> mapNonEmpty!22159 m!461307))

(declare-fun m!461309 () Bool)

(assert (=> b!479322 m!461309))

(check-sat (not b_next!12129) (not start!43262) tp_is_empty!13641 (not b!479323) b_and!20881 (not b!479322) (not b!479327) (not mapNonEmpty!22159))
(check-sat b_and!20881 (not b_next!12129))
