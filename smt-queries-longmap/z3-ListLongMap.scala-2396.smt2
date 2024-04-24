; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37914 () Bool)

(assert start!37914)

(declare-fun b_free!8941 () Bool)

(declare-fun b_next!8941 () Bool)

(assert (=> start!37914 (= b_free!8941 (not b_next!8941))))

(declare-fun tp!31587 () Bool)

(declare-fun b_and!16245 () Bool)

(assert (=> start!37914 (= tp!31587 b_and!16245)))

(declare-fun b!389933 () Bool)

(declare-fun res!223102 () Bool)

(declare-fun e!236229 () Bool)

(assert (=> b!389933 (=> (not res!223102) (not e!236229))))

(declare-datatypes ((array!23110 0))(
  ( (array!23111 (arr!11019 (Array (_ BitVec 32) (_ BitVec 64))) (size!11371 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23110)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389933 (= res!223102 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389934 () Bool)

(declare-fun res!223094 () Bool)

(declare-fun e!236223 () Bool)

(assert (=> b!389934 (=> (not res!223094) (not e!236223))))

(declare-fun lt!183629 () array!23110)

(declare-datatypes ((List!6241 0))(
  ( (Nil!6238) (Cons!6237 (h!7093 (_ BitVec 64)) (t!11391 List!6241)) )
))
(declare-fun arrayNoDuplicates!0 (array!23110 (_ BitVec 32) List!6241) Bool)

(assert (=> b!389934 (= res!223094 (arrayNoDuplicates!0 lt!183629 #b00000000000000000000000000000000 Nil!6238))))

(declare-fun b!389935 () Bool)

(declare-fun res!223096 () Bool)

(assert (=> b!389935 (=> (not res!223096) (not e!236229))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23110 (_ BitVec 32)) Bool)

(assert (=> b!389935 (= res!223096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389936 () Bool)

(declare-fun e!236230 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((V!13923 0))(
  ( (V!13924 (val!4851 Int)) )
))
(declare-datatypes ((ValueCell!4463 0))(
  ( (ValueCellFull!4463 (v!7065 V!13923)) (EmptyCell!4463) )
))
(declare-datatypes ((array!23112 0))(
  ( (array!23113 (arr!11020 (Array (_ BitVec 32) ValueCell!4463)) (size!11372 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23112)

(assert (=> b!389936 (= e!236230 (bvslt i!548 (size!11372 _values!506)))))

(declare-datatypes ((tuple2!6390 0))(
  ( (tuple2!6391 (_1!3206 (_ BitVec 64)) (_2!3206 V!13923)) )
))
(declare-fun lt!183626 () tuple2!6390)

(declare-datatypes ((List!6242 0))(
  ( (Nil!6239) (Cons!6238 (h!7094 tuple2!6390) (t!11392 List!6242)) )
))
(declare-datatypes ((ListLongMap!5305 0))(
  ( (ListLongMap!5306 (toList!2668 List!6242)) )
))
(declare-fun lt!183627 () ListLongMap!5305)

(declare-fun lt!183628 () ListLongMap!5305)

(declare-fun lt!183622 () tuple2!6390)

(declare-fun +!1022 (ListLongMap!5305 tuple2!6390) ListLongMap!5305)

(assert (=> b!389936 (= (+!1022 lt!183628 lt!183622) (+!1022 lt!183627 lt!183626))))

(declare-datatypes ((Unit!11915 0))(
  ( (Unit!11916) )
))
(declare-fun lt!183624 () Unit!11915)

(declare-fun v!373 () V!13923)

(declare-fun lt!183634 () ListLongMap!5305)

(declare-fun minValue!472 () V!13923)

(declare-fun addCommutativeForDiffKeys!334 (ListLongMap!5305 (_ BitVec 64) V!13923 (_ BitVec 64) V!13923) Unit!11915)

(assert (=> b!389936 (= lt!183624 (addCommutativeForDiffKeys!334 lt!183634 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!389937 () Bool)

(declare-fun res!223103 () Bool)

(assert (=> b!389937 (=> (not res!223103) (not e!236229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389937 (= res!223103 (validKeyInArray!0 k0!778))))

(declare-fun b!389938 () Bool)

(declare-fun res!223105 () Bool)

(assert (=> b!389938 (=> (not res!223105) (not e!236229))))

(assert (=> b!389938 (= res!223105 (or (= (select (arr!11019 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11019 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389939 () Bool)

(declare-fun res!223097 () Bool)

(assert (=> b!389939 (=> (not res!223097) (not e!236229))))

(assert (=> b!389939 (= res!223097 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6238))))

(declare-fun b!389940 () Bool)

(declare-fun res!223100 () Bool)

(assert (=> b!389940 (=> (not res!223100) (not e!236229))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389940 (= res!223100 (and (= (size!11372 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11371 _keys!658) (size!11372 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!223098 () Bool)

(assert (=> start!37914 (=> (not res!223098) (not e!236229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37914 (= res!223098 (validMask!0 mask!970))))

(assert (=> start!37914 e!236229))

(declare-fun e!236228 () Bool)

(declare-fun array_inv!8148 (array!23112) Bool)

(assert (=> start!37914 (and (array_inv!8148 _values!506) e!236228)))

(assert (=> start!37914 tp!31587))

(assert (=> start!37914 true))

(declare-fun tp_is_empty!9613 () Bool)

(assert (=> start!37914 tp_is_empty!9613))

(declare-fun array_inv!8149 (array!23110) Bool)

(assert (=> start!37914 (array_inv!8149 _keys!658)))

(declare-fun b!389941 () Bool)

(declare-fun res!223104 () Bool)

(assert (=> b!389941 (=> (not res!223104) (not e!236229))))

(assert (=> b!389941 (= res!223104 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11371 _keys!658))))))

(declare-fun mapIsEmpty!15996 () Bool)

(declare-fun mapRes!15996 () Bool)

(assert (=> mapIsEmpty!15996 mapRes!15996))

(declare-fun mapNonEmpty!15996 () Bool)

(declare-fun tp!31586 () Bool)

(declare-fun e!236226 () Bool)

(assert (=> mapNonEmpty!15996 (= mapRes!15996 (and tp!31586 e!236226))))

(declare-fun mapKey!15996 () (_ BitVec 32))

(declare-fun mapValue!15996 () ValueCell!4463)

(declare-fun mapRest!15996 () (Array (_ BitVec 32) ValueCell!4463))

(assert (=> mapNonEmpty!15996 (= (arr!11020 _values!506) (store mapRest!15996 mapKey!15996 mapValue!15996))))

(declare-fun b!389942 () Bool)

(declare-fun e!236225 () Bool)

(assert (=> b!389942 (= e!236223 (not e!236225))))

(declare-fun res!223095 () Bool)

(assert (=> b!389942 (=> res!223095 e!236225)))

(assert (=> b!389942 (= res!223095 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!183632 () ListLongMap!5305)

(declare-fun zeroValue!472 () V!13923)

(declare-fun getCurrentListMap!2052 (array!23110 array!23112 (_ BitVec 32) (_ BitVec 32) V!13923 V!13923 (_ BitVec 32) Int) ListLongMap!5305)

(assert (=> b!389942 (= lt!183632 (getCurrentListMap!2052 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183633 () array!23112)

(declare-fun lt!183623 () ListLongMap!5305)

(assert (=> b!389942 (= lt!183623 (getCurrentListMap!2052 lt!183629 lt!183633 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183635 () ListLongMap!5305)

(declare-fun lt!183630 () ListLongMap!5305)

(assert (=> b!389942 (and (= lt!183635 lt!183630) (= lt!183630 lt!183635))))

(declare-fun lt!183636 () ListLongMap!5305)

(assert (=> b!389942 (= lt!183630 (+!1022 lt!183636 lt!183626))))

(assert (=> b!389942 (= lt!183626 (tuple2!6391 k0!778 v!373))))

(declare-fun lt!183637 () Unit!11915)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 (array!23110 array!23112 (_ BitVec 32) (_ BitVec 32) V!13923 V!13923 (_ BitVec 32) (_ BitVec 64) V!13923 (_ BitVec 32) Int) Unit!11915)

(assert (=> b!389942 (= lt!183637 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!941 (array!23110 array!23112 (_ BitVec 32) (_ BitVec 32) V!13923 V!13923 (_ BitVec 32) Int) ListLongMap!5305)

(assert (=> b!389942 (= lt!183635 (getCurrentListMapNoExtraKeys!941 lt!183629 lt!183633 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389942 (= lt!183633 (array!23113 (store (arr!11020 _values!506) i!548 (ValueCellFull!4463 v!373)) (size!11372 _values!506)))))

(assert (=> b!389942 (= lt!183636 (getCurrentListMapNoExtraKeys!941 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389943 () Bool)

(assert (=> b!389943 (= e!236226 tp_is_empty!9613)))

(declare-fun b!389944 () Bool)

(declare-fun e!236227 () Bool)

(assert (=> b!389944 (= e!236227 tp_is_empty!9613)))

(declare-fun b!389945 () Bool)

(assert (=> b!389945 (= e!236228 (and e!236227 mapRes!15996))))

(declare-fun condMapEmpty!15996 () Bool)

(declare-fun mapDefault!15996 () ValueCell!4463)

(assert (=> b!389945 (= condMapEmpty!15996 (= (arr!11020 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4463)) mapDefault!15996)))))

(declare-fun b!389946 () Bool)

(assert (=> b!389946 (= e!236225 e!236230)))

(declare-fun res!223099 () Bool)

(assert (=> b!389946 (=> res!223099 e!236230)))

(assert (=> b!389946 (= res!223099 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183621 () ListLongMap!5305)

(assert (=> b!389946 (= lt!183621 lt!183628)))

(assert (=> b!389946 (= lt!183628 (+!1022 lt!183634 lt!183626))))

(declare-fun lt!183631 () Unit!11915)

(assert (=> b!389946 (= lt!183631 (addCommutativeForDiffKeys!334 lt!183636 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!389946 (= lt!183623 (+!1022 lt!183621 lt!183622))))

(declare-fun lt!183625 () tuple2!6390)

(assert (=> b!389946 (= lt!183621 (+!1022 lt!183630 lt!183625))))

(assert (=> b!389946 (= lt!183632 lt!183627)))

(assert (=> b!389946 (= lt!183627 (+!1022 lt!183634 lt!183622))))

(assert (=> b!389946 (= lt!183634 (+!1022 lt!183636 lt!183625))))

(assert (=> b!389946 (= lt!183623 (+!1022 (+!1022 lt!183635 lt!183625) lt!183622))))

(assert (=> b!389946 (= lt!183622 (tuple2!6391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389946 (= lt!183625 (tuple2!6391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389947 () Bool)

(assert (=> b!389947 (= e!236229 e!236223)))

(declare-fun res!223101 () Bool)

(assert (=> b!389947 (=> (not res!223101) (not e!236223))))

(assert (=> b!389947 (= res!223101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183629 mask!970))))

(assert (=> b!389947 (= lt!183629 (array!23111 (store (arr!11019 _keys!658) i!548 k0!778) (size!11371 _keys!658)))))

(assert (= (and start!37914 res!223098) b!389940))

(assert (= (and b!389940 res!223100) b!389935))

(assert (= (and b!389935 res!223096) b!389939))

(assert (= (and b!389939 res!223097) b!389941))

(assert (= (and b!389941 res!223104) b!389937))

(assert (= (and b!389937 res!223103) b!389938))

(assert (= (and b!389938 res!223105) b!389933))

(assert (= (and b!389933 res!223102) b!389947))

(assert (= (and b!389947 res!223101) b!389934))

(assert (= (and b!389934 res!223094) b!389942))

(assert (= (and b!389942 (not res!223095)) b!389946))

(assert (= (and b!389946 (not res!223099)) b!389936))

(assert (= (and b!389945 condMapEmpty!15996) mapIsEmpty!15996))

(assert (= (and b!389945 (not condMapEmpty!15996)) mapNonEmpty!15996))

(get-info :version)

(assert (= (and mapNonEmpty!15996 ((_ is ValueCellFull!4463) mapValue!15996)) b!389943))

(assert (= (and b!389945 ((_ is ValueCellFull!4463) mapDefault!15996)) b!389944))

(assert (= start!37914 b!389945))

(declare-fun m!386449 () Bool)

(assert (=> b!389937 m!386449))

(declare-fun m!386451 () Bool)

(assert (=> b!389933 m!386451))

(declare-fun m!386453 () Bool)

(assert (=> b!389947 m!386453))

(declare-fun m!386455 () Bool)

(assert (=> b!389947 m!386455))

(declare-fun m!386457 () Bool)

(assert (=> mapNonEmpty!15996 m!386457))

(declare-fun m!386459 () Bool)

(assert (=> start!37914 m!386459))

(declare-fun m!386461 () Bool)

(assert (=> start!37914 m!386461))

(declare-fun m!386463 () Bool)

(assert (=> start!37914 m!386463))

(declare-fun m!386465 () Bool)

(assert (=> b!389946 m!386465))

(declare-fun m!386467 () Bool)

(assert (=> b!389946 m!386467))

(declare-fun m!386469 () Bool)

(assert (=> b!389946 m!386469))

(declare-fun m!386471 () Bool)

(assert (=> b!389946 m!386471))

(declare-fun m!386473 () Bool)

(assert (=> b!389946 m!386473))

(assert (=> b!389946 m!386467))

(declare-fun m!386475 () Bool)

(assert (=> b!389946 m!386475))

(declare-fun m!386477 () Bool)

(assert (=> b!389946 m!386477))

(declare-fun m!386479 () Bool)

(assert (=> b!389946 m!386479))

(declare-fun m!386481 () Bool)

(assert (=> b!389936 m!386481))

(declare-fun m!386483 () Bool)

(assert (=> b!389936 m!386483))

(declare-fun m!386485 () Bool)

(assert (=> b!389936 m!386485))

(declare-fun m!386487 () Bool)

(assert (=> b!389935 m!386487))

(declare-fun m!386489 () Bool)

(assert (=> b!389938 m!386489))

(declare-fun m!386491 () Bool)

(assert (=> b!389942 m!386491))

(declare-fun m!386493 () Bool)

(assert (=> b!389942 m!386493))

(declare-fun m!386495 () Bool)

(assert (=> b!389942 m!386495))

(declare-fun m!386497 () Bool)

(assert (=> b!389942 m!386497))

(declare-fun m!386499 () Bool)

(assert (=> b!389942 m!386499))

(declare-fun m!386501 () Bool)

(assert (=> b!389942 m!386501))

(declare-fun m!386503 () Bool)

(assert (=> b!389942 m!386503))

(declare-fun m!386505 () Bool)

(assert (=> b!389939 m!386505))

(declare-fun m!386507 () Bool)

(assert (=> b!389934 m!386507))

(check-sat tp_is_empty!9613 (not b!389947) (not mapNonEmpty!15996) (not b_next!8941) (not b!389942) b_and!16245 (not b!389935) (not start!37914) (not b!389937) (not b!389934) (not b!389946) (not b!389933) (not b!389936) (not b!389939))
(check-sat b_and!16245 (not b_next!8941))
