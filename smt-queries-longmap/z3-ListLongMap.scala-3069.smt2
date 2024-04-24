; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43252 () Bool)

(assert start!43252)

(declare-fun b_free!12133 () Bool)

(declare-fun b_next!12133 () Bool)

(assert (=> start!43252 (= b_free!12133 (not b_next!12133))))

(declare-fun tp!42669 () Bool)

(declare-fun b_and!20895 () Bool)

(assert (=> start!43252 (= tp!42669 b_and!20895)))

(declare-fun res!285939 () Bool)

(declare-fun e!281973 () Bool)

(assert (=> start!43252 (=> (not res!285939) (not e!281973))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43252 (= res!285939 (validMask!0 mask!2352))))

(assert (=> start!43252 e!281973))

(assert (=> start!43252 true))

(declare-fun tp_is_empty!13645 () Bool)

(assert (=> start!43252 tp_is_empty!13645))

(declare-datatypes ((V!19265 0))(
  ( (V!19266 (val!6870 Int)) )
))
(declare-datatypes ((ValueCell!6461 0))(
  ( (ValueCellFull!6461 (v!9160 V!19265)) (EmptyCell!6461) )
))
(declare-datatypes ((array!30944 0))(
  ( (array!30945 (arr!14878 (Array (_ BitVec 32) ValueCell!6461)) (size!15236 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30944)

(declare-fun e!281975 () Bool)

(declare-fun array_inv!10810 (array!30944) Bool)

(assert (=> start!43252 (and (array_inv!10810 _values!1516) e!281975)))

(assert (=> start!43252 tp!42669))

(declare-datatypes ((array!30946 0))(
  ( (array!30947 (arr!14879 (Array (_ BitVec 32) (_ BitVec 64))) (size!15237 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30946)

(declare-fun array_inv!10811 (array!30946) Bool)

(assert (=> start!43252 (array_inv!10811 _keys!1874)))

(declare-fun mapNonEmpty!22165 () Bool)

(declare-fun mapRes!22165 () Bool)

(declare-fun tp!42670 () Bool)

(declare-fun e!281974 () Bool)

(assert (=> mapNonEmpty!22165 (= mapRes!22165 (and tp!42670 e!281974))))

(declare-fun mapRest!22165 () (Array (_ BitVec 32) ValueCell!6461))

(declare-fun mapValue!22165 () ValueCell!6461)

(declare-fun mapKey!22165 () (_ BitVec 32))

(assert (=> mapNonEmpty!22165 (= (arr!14878 _values!1516) (store mapRest!22165 mapKey!22165 mapValue!22165))))

(declare-fun b!479302 () Bool)

(assert (=> b!479302 (= e!281974 tp_is_empty!13645)))

(declare-fun b!479303 () Bool)

(assert (=> b!479303 (= e!281973 false)))

(declare-fun lt!217864 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19265)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19265)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8938 0))(
  ( (tuple2!8939 (_1!4480 (_ BitVec 64)) (_2!4480 V!19265)) )
))
(declare-datatypes ((List!9004 0))(
  ( (Nil!9001) (Cons!9000 (h!9856 tuple2!8938) (t!15202 List!9004)) )
))
(declare-datatypes ((ListLongMap!7853 0))(
  ( (ListLongMap!7854 (toList!3942 List!9004)) )
))
(declare-fun contains!2570 (ListLongMap!7853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2256 (array!30946 array!30944 (_ BitVec 32) (_ BitVec 32) V!19265 V!19265 (_ BitVec 32) Int) ListLongMap!7853)

(assert (=> b!479303 (= lt!217864 (contains!2570 (getCurrentListMap!2256 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479304 () Bool)

(declare-fun res!285938 () Bool)

(assert (=> b!479304 (=> (not res!285938) (not e!281973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30946 (_ BitVec 32)) Bool)

(assert (=> b!479304 (= res!285938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479305 () Bool)

(declare-fun res!285941 () Bool)

(assert (=> b!479305 (=> (not res!285941) (not e!281973))))

(assert (=> b!479305 (= res!285941 (and (= (size!15236 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15237 _keys!1874) (size!15236 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22165 () Bool)

(assert (=> mapIsEmpty!22165 mapRes!22165))

(declare-fun b!479306 () Bool)

(declare-fun e!281976 () Bool)

(assert (=> b!479306 (= e!281976 tp_is_empty!13645)))

(declare-fun b!479307 () Bool)

(declare-fun res!285940 () Bool)

(assert (=> b!479307 (=> (not res!285940) (not e!281973))))

(declare-datatypes ((List!9005 0))(
  ( (Nil!9002) (Cons!9001 (h!9857 (_ BitVec 64)) (t!15203 List!9005)) )
))
(declare-fun arrayNoDuplicates!0 (array!30946 (_ BitVec 32) List!9005) Bool)

(assert (=> b!479307 (= res!285940 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9002))))

(declare-fun b!479308 () Bool)

(assert (=> b!479308 (= e!281975 (and e!281976 mapRes!22165))))

(declare-fun condMapEmpty!22165 () Bool)

(declare-fun mapDefault!22165 () ValueCell!6461)

(assert (=> b!479308 (= condMapEmpty!22165 (= (arr!14878 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6461)) mapDefault!22165)))))

(assert (= (and start!43252 res!285939) b!479305))

(assert (= (and b!479305 res!285941) b!479304))

(assert (= (and b!479304 res!285938) b!479307))

(assert (= (and b!479307 res!285940) b!479303))

(assert (= (and b!479308 condMapEmpty!22165) mapIsEmpty!22165))

(assert (= (and b!479308 (not condMapEmpty!22165)) mapNonEmpty!22165))

(get-info :version)

(assert (= (and mapNonEmpty!22165 ((_ is ValueCellFull!6461) mapValue!22165)) b!479302))

(assert (= (and b!479308 ((_ is ValueCellFull!6461) mapDefault!22165)) b!479306))

(assert (= start!43252 b!479308))

(declare-fun m!461509 () Bool)

(assert (=> b!479304 m!461509))

(declare-fun m!461511 () Bool)

(assert (=> b!479303 m!461511))

(assert (=> b!479303 m!461511))

(declare-fun m!461513 () Bool)

(assert (=> b!479303 m!461513))

(declare-fun m!461515 () Bool)

(assert (=> start!43252 m!461515))

(declare-fun m!461517 () Bool)

(assert (=> start!43252 m!461517))

(declare-fun m!461519 () Bool)

(assert (=> start!43252 m!461519))

(declare-fun m!461521 () Bool)

(assert (=> mapNonEmpty!22165 m!461521))

(declare-fun m!461523 () Bool)

(assert (=> b!479307 m!461523))

(check-sat (not b!479303) b_and!20895 (not b!479304) (not mapNonEmpty!22165) tp_is_empty!13645 (not b_next!12133) (not b!479307) (not start!43252))
(check-sat b_and!20895 (not b_next!12133))
