; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20470 () Bool)

(assert start!20470)

(declare-fun b_free!5125 () Bool)

(declare-fun b_next!5125 () Bool)

(assert (=> start!20470 (= b_free!5125 (not b_next!5125))))

(declare-fun tp!18406 () Bool)

(declare-fun b_and!11885 () Bool)

(assert (=> start!20470 (= tp!18406 b_and!11885)))

(declare-fun b!202934 () Bool)

(declare-fun res!97365 () Bool)

(declare-fun e!132885 () Bool)

(assert (=> b!202934 (=> (not res!97365) (not e!132885))))

(declare-datatypes ((array!9175 0))(
  ( (array!9176 (arr!4338 (Array (_ BitVec 32) (_ BitVec 64))) (size!4663 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9175)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202934 (= res!97365 (= (select (arr!4338 _keys!825) i!601) k0!843))))

(declare-fun b!202935 () Bool)

(declare-fun res!97364 () Bool)

(assert (=> b!202935 (=> (not res!97364) (not e!132885))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6289 0))(
  ( (V!6290 (val!2535 Int)) )
))
(declare-datatypes ((ValueCell!2147 0))(
  ( (ValueCellFull!2147 (v!4506 V!6289)) (EmptyCell!2147) )
))
(declare-datatypes ((array!9177 0))(
  ( (array!9178 (arr!4339 (Array (_ BitVec 32) ValueCell!2147)) (size!4664 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9177)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202935 (= res!97364 (and (= (size!4664 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4663 _keys!825) (size!4664 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202936 () Bool)

(declare-fun res!97367 () Bool)

(assert (=> b!202936 (=> (not res!97367) (not e!132885))))

(assert (=> b!202936 (= res!97367 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4663 _keys!825))))))

(declare-fun mapIsEmpty!8540 () Bool)

(declare-fun mapRes!8540 () Bool)

(assert (=> mapIsEmpty!8540 mapRes!8540))

(declare-fun b!202937 () Bool)

(declare-fun e!132889 () Bool)

(declare-fun tp_is_empty!4981 () Bool)

(assert (=> b!202937 (= e!132889 tp_is_empty!4981)))

(declare-fun b!202938 () Bool)

(declare-fun res!97363 () Bool)

(assert (=> b!202938 (=> (not res!97363) (not e!132885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9175 (_ BitVec 32)) Bool)

(assert (=> b!202938 (= res!97363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8540 () Bool)

(declare-fun tp!18407 () Bool)

(declare-fun e!132886 () Bool)

(assert (=> mapNonEmpty!8540 (= mapRes!8540 (and tp!18407 e!132886))))

(declare-fun mapValue!8540 () ValueCell!2147)

(declare-fun mapRest!8540 () (Array (_ BitVec 32) ValueCell!2147))

(declare-fun mapKey!8540 () (_ BitVec 32))

(assert (=> mapNonEmpty!8540 (= (arr!4339 _values!649) (store mapRest!8540 mapKey!8540 mapValue!8540))))

(declare-fun b!202939 () Bool)

(declare-fun e!132888 () Bool)

(assert (=> b!202939 (= e!132888 (and e!132889 mapRes!8540))))

(declare-fun condMapEmpty!8540 () Bool)

(declare-fun mapDefault!8540 () ValueCell!2147)

(assert (=> b!202939 (= condMapEmpty!8540 (= (arr!4339 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2147)) mapDefault!8540)))))

(declare-fun b!202940 () Bool)

(declare-fun res!97369 () Bool)

(assert (=> b!202940 (=> (not res!97369) (not e!132885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202940 (= res!97369 (validKeyInArray!0 k0!843))))

(declare-fun b!202941 () Bool)

(declare-fun e!132884 () Bool)

(declare-fun e!132890 () Bool)

(assert (=> b!202941 (= e!132884 e!132890)))

(declare-fun res!97366 () Bool)

(assert (=> b!202941 (=> res!97366 e!132890)))

(assert (=> b!202941 (= res!97366 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3780 0))(
  ( (tuple2!3781 (_1!1901 (_ BitVec 64)) (_2!1901 V!6289)) )
))
(declare-datatypes ((List!2684 0))(
  ( (Nil!2681) (Cons!2680 (h!3322 tuple2!3780) (t!7607 List!2684)) )
))
(declare-datatypes ((ListLongMap!2695 0))(
  ( (ListLongMap!2696 (toList!1363 List!2684)) )
))
(declare-fun lt!102134 () ListLongMap!2695)

(declare-fun lt!102125 () ListLongMap!2695)

(assert (=> b!202941 (= lt!102134 lt!102125)))

(declare-fun lt!102128 () ListLongMap!2695)

(declare-fun lt!102126 () tuple2!3780)

(declare-fun +!417 (ListLongMap!2695 tuple2!3780) ListLongMap!2695)

(assert (=> b!202941 (= lt!102125 (+!417 lt!102128 lt!102126))))

(declare-fun lt!102127 () ListLongMap!2695)

(declare-fun lt!102129 () ListLongMap!2695)

(assert (=> b!202941 (= lt!102127 lt!102129)))

(declare-fun lt!102124 () ListLongMap!2695)

(assert (=> b!202941 (= lt!102129 (+!417 lt!102124 lt!102126))))

(declare-fun lt!102123 () ListLongMap!2695)

(assert (=> b!202941 (= lt!102134 (+!417 lt!102123 lt!102126))))

(declare-fun zeroValue!615 () V!6289)

(assert (=> b!202941 (= lt!102126 (tuple2!3781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202942 () Bool)

(assert (=> b!202942 (= e!132885 (not e!132884))))

(declare-fun res!97368 () Bool)

(assert (=> b!202942 (=> res!97368 e!132884)))

(assert (=> b!202942 (= res!97368 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6289)

(declare-fun getCurrentListMap!946 (array!9175 array!9177 (_ BitVec 32) (_ BitVec 32) V!6289 V!6289 (_ BitVec 32) Int) ListLongMap!2695)

(assert (=> b!202942 (= lt!102127 (getCurrentListMap!946 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102132 () array!9177)

(assert (=> b!202942 (= lt!102134 (getCurrentListMap!946 _keys!825 lt!102132 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202942 (and (= lt!102123 lt!102128) (= lt!102128 lt!102123))))

(declare-fun lt!102133 () tuple2!3780)

(assert (=> b!202942 (= lt!102128 (+!417 lt!102124 lt!102133))))

(declare-fun v!520 () V!6289)

(assert (=> b!202942 (= lt!102133 (tuple2!3781 k0!843 v!520))))

(declare-datatypes ((Unit!6118 0))(
  ( (Unit!6119) )
))
(declare-fun lt!102131 () Unit!6118)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!82 (array!9175 array!9177 (_ BitVec 32) (_ BitVec 32) V!6289 V!6289 (_ BitVec 32) (_ BitVec 64) V!6289 (_ BitVec 32) Int) Unit!6118)

(assert (=> b!202942 (= lt!102131 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!82 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!339 (array!9175 array!9177 (_ BitVec 32) (_ BitVec 32) V!6289 V!6289 (_ BitVec 32) Int) ListLongMap!2695)

(assert (=> b!202942 (= lt!102123 (getCurrentListMapNoExtraKeys!339 _keys!825 lt!102132 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202942 (= lt!102132 (array!9178 (store (arr!4339 _values!649) i!601 (ValueCellFull!2147 v!520)) (size!4664 _values!649)))))

(assert (=> b!202942 (= lt!102124 (getCurrentListMapNoExtraKeys!339 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202943 () Bool)

(declare-fun res!97362 () Bool)

(assert (=> b!202943 (=> (not res!97362) (not e!132885))))

(declare-datatypes ((List!2685 0))(
  ( (Nil!2682) (Cons!2681 (h!3323 (_ BitVec 64)) (t!7608 List!2685)) )
))
(declare-fun arrayNoDuplicates!0 (array!9175 (_ BitVec 32) List!2685) Bool)

(assert (=> b!202943 (= res!97362 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2682))))

(declare-fun res!97361 () Bool)

(assert (=> start!20470 (=> (not res!97361) (not e!132885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20470 (= res!97361 (validMask!0 mask!1149))))

(assert (=> start!20470 e!132885))

(declare-fun array_inv!2835 (array!9177) Bool)

(assert (=> start!20470 (and (array_inv!2835 _values!649) e!132888)))

(assert (=> start!20470 true))

(assert (=> start!20470 tp_is_empty!4981))

(declare-fun array_inv!2836 (array!9175) Bool)

(assert (=> start!20470 (array_inv!2836 _keys!825)))

(assert (=> start!20470 tp!18406))

(declare-fun b!202944 () Bool)

(assert (=> b!202944 (= e!132890 true)))

(assert (=> b!202944 (= lt!102125 (+!417 lt!102129 lt!102133))))

(declare-fun lt!102130 () Unit!6118)

(declare-fun addCommutativeForDiffKeys!136 (ListLongMap!2695 (_ BitVec 64) V!6289 (_ BitVec 64) V!6289) Unit!6118)

(assert (=> b!202944 (= lt!102130 (addCommutativeForDiffKeys!136 lt!102124 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202945 () Bool)

(assert (=> b!202945 (= e!132886 tp_is_empty!4981)))

(assert (= (and start!20470 res!97361) b!202935))

(assert (= (and b!202935 res!97364) b!202938))

(assert (= (and b!202938 res!97363) b!202943))

(assert (= (and b!202943 res!97362) b!202936))

(assert (= (and b!202936 res!97367) b!202940))

(assert (= (and b!202940 res!97369) b!202934))

(assert (= (and b!202934 res!97365) b!202942))

(assert (= (and b!202942 (not res!97368)) b!202941))

(assert (= (and b!202941 (not res!97366)) b!202944))

(assert (= (and b!202939 condMapEmpty!8540) mapIsEmpty!8540))

(assert (= (and b!202939 (not condMapEmpty!8540)) mapNonEmpty!8540))

(get-info :version)

(assert (= (and mapNonEmpty!8540 ((_ is ValueCellFull!2147) mapValue!8540)) b!202945))

(assert (= (and b!202939 ((_ is ValueCellFull!2147) mapDefault!8540)) b!202937))

(assert (= start!20470 b!202939))

(declare-fun m!230433 () Bool)

(assert (=> b!202934 m!230433))

(declare-fun m!230435 () Bool)

(assert (=> b!202941 m!230435))

(declare-fun m!230437 () Bool)

(assert (=> b!202941 m!230437))

(declare-fun m!230439 () Bool)

(assert (=> b!202941 m!230439))

(declare-fun m!230441 () Bool)

(assert (=> b!202940 m!230441))

(declare-fun m!230443 () Bool)

(assert (=> b!202938 m!230443))

(declare-fun m!230445 () Bool)

(assert (=> mapNonEmpty!8540 m!230445))

(declare-fun m!230447 () Bool)

(assert (=> b!202943 m!230447))

(declare-fun m!230449 () Bool)

(assert (=> b!202944 m!230449))

(declare-fun m!230451 () Bool)

(assert (=> b!202944 m!230451))

(declare-fun m!230453 () Bool)

(assert (=> start!20470 m!230453))

(declare-fun m!230455 () Bool)

(assert (=> start!20470 m!230455))

(declare-fun m!230457 () Bool)

(assert (=> start!20470 m!230457))

(declare-fun m!230459 () Bool)

(assert (=> b!202942 m!230459))

(declare-fun m!230461 () Bool)

(assert (=> b!202942 m!230461))

(declare-fun m!230463 () Bool)

(assert (=> b!202942 m!230463))

(declare-fun m!230465 () Bool)

(assert (=> b!202942 m!230465))

(declare-fun m!230467 () Bool)

(assert (=> b!202942 m!230467))

(declare-fun m!230469 () Bool)

(assert (=> b!202942 m!230469))

(declare-fun m!230471 () Bool)

(assert (=> b!202942 m!230471))

(check-sat (not b!202943) (not b!202938) (not mapNonEmpty!8540) (not b!202941) (not b_next!5125) (not b!202940) (not start!20470) (not b!202944) (not b!202942) b_and!11885 tp_is_empty!4981)
(check-sat b_and!11885 (not b_next!5125))
