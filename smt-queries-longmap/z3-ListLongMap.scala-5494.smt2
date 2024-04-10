; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72750 () Bool)

(assert start!72750)

(declare-fun b!844340 () Bool)

(declare-fun res!573677 () Bool)

(declare-fun e!471245 () Bool)

(assert (=> b!844340 (=> (not res!573677) (not e!471245))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47836 0))(
  ( (array!47837 (arr!22949 (Array (_ BitVec 32) (_ BitVec 64))) (size!23389 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47836)

(declare-datatypes ((V!26115 0))(
  ( (V!26116 (val!7948 Int)) )
))
(declare-datatypes ((ValueCell!7461 0))(
  ( (ValueCellFull!7461 (v!10373 V!26115)) (EmptyCell!7461) )
))
(declare-datatypes ((array!47838 0))(
  ( (array!47839 (arr!22950 (Array (_ BitVec 32) ValueCell!7461)) (size!23390 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47838)

(assert (=> b!844340 (= res!573677 (and (= (size!23390 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23389 _keys!868) (size!23390 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25301 () Bool)

(declare-fun mapRes!25301 () Bool)

(declare-fun tp!48619 () Bool)

(declare-fun e!471246 () Bool)

(assert (=> mapNonEmpty!25301 (= mapRes!25301 (and tp!48619 e!471246))))

(declare-fun mapRest!25301 () (Array (_ BitVec 32) ValueCell!7461))

(declare-fun mapKey!25301 () (_ BitVec 32))

(declare-fun mapValue!25301 () ValueCell!7461)

(assert (=> mapNonEmpty!25301 (= (arr!22950 _values!688) (store mapRest!25301 mapKey!25301 mapValue!25301))))

(declare-fun mapIsEmpty!25301 () Bool)

(assert (=> mapIsEmpty!25301 mapRes!25301))

(declare-fun b!844341 () Bool)

(declare-fun res!573674 () Bool)

(assert (=> b!844341 (=> (not res!573674) (not e!471245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844341 (= res!573674 (validMask!0 mask!1196))))

(declare-fun res!573676 () Bool)

(assert (=> start!72750 (=> (not res!573676) (not e!471245))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72750 (= res!573676 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23389 _keys!868))))))

(assert (=> start!72750 e!471245))

(assert (=> start!72750 true))

(declare-fun array_inv!18250 (array!47836) Bool)

(assert (=> start!72750 (array_inv!18250 _keys!868)))

(declare-fun e!471247 () Bool)

(declare-fun array_inv!18251 (array!47838) Bool)

(assert (=> start!72750 (and (array_inv!18251 _values!688) e!471247)))

(declare-fun b!844342 () Bool)

(assert (=> b!844342 (= e!471245 false)))

(declare-fun lt!381268 () Bool)

(declare-datatypes ((List!16268 0))(
  ( (Nil!16265) (Cons!16264 (h!17395 (_ BitVec 64)) (t!22639 List!16268)) )
))
(declare-fun arrayNoDuplicates!0 (array!47836 (_ BitVec 32) List!16268) Bool)

(assert (=> b!844342 (= lt!381268 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16265))))

(declare-fun b!844343 () Bool)

(declare-fun e!471244 () Bool)

(assert (=> b!844343 (= e!471247 (and e!471244 mapRes!25301))))

(declare-fun condMapEmpty!25301 () Bool)

(declare-fun mapDefault!25301 () ValueCell!7461)

(assert (=> b!844343 (= condMapEmpty!25301 (= (arr!22950 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7461)) mapDefault!25301)))))

(declare-fun b!844344 () Bool)

(declare-fun tp_is_empty!15801 () Bool)

(assert (=> b!844344 (= e!471246 tp_is_empty!15801)))

(declare-fun b!844345 () Bool)

(assert (=> b!844345 (= e!471244 tp_is_empty!15801)))

(declare-fun b!844346 () Bool)

(declare-fun res!573675 () Bool)

(assert (=> b!844346 (=> (not res!573675) (not e!471245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47836 (_ BitVec 32)) Bool)

(assert (=> b!844346 (= res!573675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72750 res!573676) b!844341))

(assert (= (and b!844341 res!573674) b!844340))

(assert (= (and b!844340 res!573677) b!844346))

(assert (= (and b!844346 res!573675) b!844342))

(assert (= (and b!844343 condMapEmpty!25301) mapIsEmpty!25301))

(assert (= (and b!844343 (not condMapEmpty!25301)) mapNonEmpty!25301))

(get-info :version)

(assert (= (and mapNonEmpty!25301 ((_ is ValueCellFull!7461) mapValue!25301)) b!844344))

(assert (= (and b!844343 ((_ is ValueCellFull!7461) mapDefault!25301)) b!844345))

(assert (= start!72750 b!844343))

(declare-fun m!786633 () Bool)

(assert (=> b!844342 m!786633))

(declare-fun m!786635 () Bool)

(assert (=> b!844346 m!786635))

(declare-fun m!786637 () Bool)

(assert (=> mapNonEmpty!25301 m!786637))

(declare-fun m!786639 () Bool)

(assert (=> start!72750 m!786639))

(declare-fun m!786641 () Bool)

(assert (=> start!72750 m!786641))

(declare-fun m!786643 () Bool)

(assert (=> b!844341 m!786643))

(check-sat (not start!72750) (not mapNonEmpty!25301) (not b!844341) (not b!844342) tp_is_empty!15801 (not b!844346))
(check-sat)
