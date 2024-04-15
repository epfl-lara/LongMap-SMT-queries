; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20098 () Bool)

(assert start!20098)

(declare-fun b_free!4753 () Bool)

(declare-fun b_next!4753 () Bool)

(assert (=> start!20098 (= b_free!4753 (not b_next!4753))))

(declare-fun tp!17290 () Bool)

(declare-fun b_and!11473 () Bool)

(assert (=> start!20098 (= tp!17290 b_and!11473)))

(declare-fun b!196697 () Bool)

(declare-fun e!129528 () Bool)

(declare-fun e!129527 () Bool)

(declare-fun mapRes!7982 () Bool)

(assert (=> b!196697 (= e!129528 (and e!129527 mapRes!7982))))

(declare-fun condMapEmpty!7982 () Bool)

(declare-datatypes ((V!5793 0))(
  ( (V!5794 (val!2349 Int)) )
))
(declare-datatypes ((ValueCell!1961 0))(
  ( (ValueCellFull!1961 (v!4313 V!5793)) (EmptyCell!1961) )
))
(declare-datatypes ((array!8449 0))(
  ( (array!8450 (arr!3974 (Array (_ BitVec 32) ValueCell!1961)) (size!4300 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8449)

(declare-fun mapDefault!7982 () ValueCell!1961)

(assert (=> b!196697 (= condMapEmpty!7982 (= (arr!3974 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1961)) mapDefault!7982)))))

(declare-fun b!196698 () Bool)

(declare-fun res!92882 () Bool)

(declare-fun e!129526 () Bool)

(assert (=> b!196698 (=> (not res!92882) (not e!129526))))

(declare-datatypes ((array!8451 0))(
  ( (array!8452 (arr!3975 (Array (_ BitVec 32) (_ BitVec 64))) (size!4301 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8451)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8451 (_ BitVec 32)) Bool)

(assert (=> b!196698 (= res!92882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196699 () Bool)

(declare-fun res!92879 () Bool)

(assert (=> b!196699 (=> (not res!92879) (not e!129526))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196699 (= res!92879 (and (= (size!4300 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4301 _keys!825) (size!4300 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7982 () Bool)

(assert (=> mapIsEmpty!7982 mapRes!7982))

(declare-fun b!196701 () Bool)

(assert (=> b!196701 (= e!129526 false)))

(declare-datatypes ((tuple2!3536 0))(
  ( (tuple2!3537 (_1!1779 (_ BitVec 64)) (_2!1779 V!5793)) )
))
(declare-datatypes ((List!2466 0))(
  ( (Nil!2463) (Cons!2462 (h!3104 tuple2!3536) (t!7388 List!2466)) )
))
(declare-datatypes ((ListLongMap!2439 0))(
  ( (ListLongMap!2440 (toList!1235 List!2466)) )
))
(declare-fun lt!97478 () ListLongMap!2439)

(declare-fun zeroValue!615 () V!5793)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5793)

(declare-fun getCurrentListMapNoExtraKeys!215 (array!8451 array!8449 (_ BitVec 32) (_ BitVec 32) V!5793 V!5793 (_ BitVec 32) Int) ListLongMap!2439)

(assert (=> b!196701 (= lt!97478 (getCurrentListMapNoExtraKeys!215 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196702 () Bool)

(declare-fun tp_is_empty!4609 () Bool)

(assert (=> b!196702 (= e!129527 tp_is_empty!4609)))

(declare-fun b!196703 () Bool)

(declare-fun res!92880 () Bool)

(assert (=> b!196703 (=> (not res!92880) (not e!129526))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196703 (= res!92880 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4301 _keys!825))))))

(declare-fun b!196704 () Bool)

(declare-fun res!92878 () Bool)

(assert (=> b!196704 (=> (not res!92878) (not e!129526))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196704 (= res!92878 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!7982 () Bool)

(declare-fun tp!17291 () Bool)

(declare-fun e!129524 () Bool)

(assert (=> mapNonEmpty!7982 (= mapRes!7982 (and tp!17291 e!129524))))

(declare-fun mapKey!7982 () (_ BitVec 32))

(declare-fun mapRest!7982 () (Array (_ BitVec 32) ValueCell!1961))

(declare-fun mapValue!7982 () ValueCell!1961)

(assert (=> mapNonEmpty!7982 (= (arr!3974 _values!649) (store mapRest!7982 mapKey!7982 mapValue!7982))))

(declare-fun b!196705 () Bool)

(declare-fun res!92877 () Bool)

(assert (=> b!196705 (=> (not res!92877) (not e!129526))))

(assert (=> b!196705 (= res!92877 (= (select (arr!3975 _keys!825) i!601) k0!843))))

(declare-fun b!196706 () Bool)

(assert (=> b!196706 (= e!129524 tp_is_empty!4609)))

(declare-fun res!92881 () Bool)

(assert (=> start!20098 (=> (not res!92881) (not e!129526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20098 (= res!92881 (validMask!0 mask!1149))))

(assert (=> start!20098 e!129526))

(declare-fun array_inv!2581 (array!8449) Bool)

(assert (=> start!20098 (and (array_inv!2581 _values!649) e!129528)))

(assert (=> start!20098 true))

(assert (=> start!20098 tp_is_empty!4609))

(declare-fun array_inv!2582 (array!8451) Bool)

(assert (=> start!20098 (array_inv!2582 _keys!825)))

(assert (=> start!20098 tp!17290))

(declare-fun b!196700 () Bool)

(declare-fun res!92876 () Bool)

(assert (=> b!196700 (=> (not res!92876) (not e!129526))))

(declare-datatypes ((List!2467 0))(
  ( (Nil!2464) (Cons!2463 (h!3105 (_ BitVec 64)) (t!7389 List!2467)) )
))
(declare-fun arrayNoDuplicates!0 (array!8451 (_ BitVec 32) List!2467) Bool)

(assert (=> b!196700 (= res!92876 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2464))))

(assert (= (and start!20098 res!92881) b!196699))

(assert (= (and b!196699 res!92879) b!196698))

(assert (= (and b!196698 res!92882) b!196700))

(assert (= (and b!196700 res!92876) b!196703))

(assert (= (and b!196703 res!92880) b!196704))

(assert (= (and b!196704 res!92878) b!196705))

(assert (= (and b!196705 res!92877) b!196701))

(assert (= (and b!196697 condMapEmpty!7982) mapIsEmpty!7982))

(assert (= (and b!196697 (not condMapEmpty!7982)) mapNonEmpty!7982))

(get-info :version)

(assert (= (and mapNonEmpty!7982 ((_ is ValueCellFull!1961) mapValue!7982)) b!196706))

(assert (= (and b!196697 ((_ is ValueCellFull!1961) mapDefault!7982)) b!196702))

(assert (= start!20098 b!196697))

(declare-fun m!223347 () Bool)

(assert (=> mapNonEmpty!7982 m!223347))

(declare-fun m!223349 () Bool)

(assert (=> b!196701 m!223349))

(declare-fun m!223351 () Bool)

(assert (=> b!196700 m!223351))

(declare-fun m!223353 () Bool)

(assert (=> b!196704 m!223353))

(declare-fun m!223355 () Bool)

(assert (=> b!196705 m!223355))

(declare-fun m!223357 () Bool)

(assert (=> b!196698 m!223357))

(declare-fun m!223359 () Bool)

(assert (=> start!20098 m!223359))

(declare-fun m!223361 () Bool)

(assert (=> start!20098 m!223361))

(declare-fun m!223363 () Bool)

(assert (=> start!20098 m!223363))

(check-sat (not b!196701) tp_is_empty!4609 (not b!196700) (not b!196698) (not start!20098) (not mapNonEmpty!7982) (not b!196704) b_and!11473 (not b_next!4753))
(check-sat b_and!11473 (not b_next!4753))
