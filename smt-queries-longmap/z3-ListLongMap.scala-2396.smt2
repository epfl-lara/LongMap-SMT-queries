; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37914 () Bool)

(assert start!37914)

(declare-fun b_free!8941 () Bool)

(declare-fun b_next!8941 () Bool)

(assert (=> start!37914 (= b_free!8941 (not b_next!8941))))

(declare-fun tp!31586 () Bool)

(declare-fun b_and!16205 () Bool)

(assert (=> start!37914 (= tp!31586 b_and!16205)))

(declare-fun b!389711 () Bool)

(declare-fun res!222979 () Bool)

(declare-fun e!236083 () Bool)

(assert (=> b!389711 (=> (not res!222979) (not e!236083))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13923 0))(
  ( (V!13924 (val!4851 Int)) )
))
(declare-datatypes ((ValueCell!4463 0))(
  ( (ValueCellFull!4463 (v!7058 V!13923)) (EmptyCell!4463) )
))
(declare-datatypes ((array!23109 0))(
  ( (array!23110 (arr!11019 (Array (_ BitVec 32) ValueCell!4463)) (size!11372 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23109)

(declare-datatypes ((array!23111 0))(
  ( (array!23112 (arr!11020 (Array (_ BitVec 32) (_ BitVec 64))) (size!11373 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23111)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!389711 (= res!222979 (and (= (size!11372 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11373 _keys!658) (size!11372 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15996 () Bool)

(declare-fun mapRes!15996 () Bool)

(assert (=> mapIsEmpty!15996 mapRes!15996))

(declare-fun b!389713 () Bool)

(declare-fun e!236085 () Bool)

(declare-fun e!236081 () Bool)

(assert (=> b!389713 (= e!236085 (not e!236081))))

(declare-fun res!222970 () Bool)

(assert (=> b!389713 (=> res!222970 e!236081)))

(assert (=> b!389713 (= res!222970 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13923)

(declare-datatypes ((tuple2!6498 0))(
  ( (tuple2!6499 (_1!3260 (_ BitVec 64)) (_2!3260 V!13923)) )
))
(declare-datatypes ((List!6344 0))(
  ( (Nil!6341) (Cons!6340 (h!7196 tuple2!6498) (t!11493 List!6344)) )
))
(declare-datatypes ((ListLongMap!5401 0))(
  ( (ListLongMap!5402 (toList!2716 List!6344)) )
))
(declare-fun lt!183379 () ListLongMap!5401)

(declare-fun minValue!472 () V!13923)

(declare-fun getCurrentListMap!2043 (array!23111 array!23109 (_ BitVec 32) (_ BitVec 32) V!13923 V!13923 (_ BitVec 32) Int) ListLongMap!5401)

(assert (=> b!389713 (= lt!183379 (getCurrentListMap!2043 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183380 () array!23111)

(declare-fun lt!183381 () array!23109)

(declare-fun lt!183377 () ListLongMap!5401)

(assert (=> b!389713 (= lt!183377 (getCurrentListMap!2043 lt!183380 lt!183381 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183378 () ListLongMap!5401)

(declare-fun lt!183372 () ListLongMap!5401)

(assert (=> b!389713 (and (= lt!183378 lt!183372) (= lt!183372 lt!183378))))

(declare-fun lt!183382 () ListLongMap!5401)

(declare-fun lt!183384 () tuple2!6498)

(declare-fun +!1036 (ListLongMap!5401 tuple2!6498) ListLongMap!5401)

(assert (=> b!389713 (= lt!183372 (+!1036 lt!183382 lt!183384))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13923)

(assert (=> b!389713 (= lt!183384 (tuple2!6499 k0!778 v!373))))

(declare-datatypes ((Unit!11916 0))(
  ( (Unit!11917) )
))
(declare-fun lt!183369 () Unit!11916)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!244 (array!23111 array!23109 (_ BitVec 32) (_ BitVec 32) V!13923 V!13923 (_ BitVec 32) (_ BitVec 64) V!13923 (_ BitVec 32) Int) Unit!11916)

(assert (=> b!389713 (= lt!183369 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!244 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!953 (array!23111 array!23109 (_ BitVec 32) (_ BitVec 32) V!13923 V!13923 (_ BitVec 32) Int) ListLongMap!5401)

(assert (=> b!389713 (= lt!183378 (getCurrentListMapNoExtraKeys!953 lt!183380 lt!183381 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389713 (= lt!183381 (array!23110 (store (arr!11019 _values!506) i!548 (ValueCellFull!4463 v!373)) (size!11372 _values!506)))))

(assert (=> b!389713 (= lt!183382 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389714 () Bool)

(declare-fun e!236086 () Bool)

(assert (=> b!389714 (= e!236081 e!236086)))

(declare-fun res!222969 () Bool)

(assert (=> b!389714 (=> res!222969 e!236086)))

(assert (=> b!389714 (= res!222969 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183383 () ListLongMap!5401)

(declare-fun lt!183373 () ListLongMap!5401)

(assert (=> b!389714 (= lt!183383 lt!183373)))

(declare-fun lt!183370 () ListLongMap!5401)

(assert (=> b!389714 (= lt!183373 (+!1036 lt!183370 lt!183384))))

(declare-fun lt!183375 () Unit!11916)

(declare-fun addCommutativeForDiffKeys!326 (ListLongMap!5401 (_ BitVec 64) V!13923 (_ BitVec 64) V!13923) Unit!11916)

(assert (=> b!389714 (= lt!183375 (addCommutativeForDiffKeys!326 lt!183382 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183368 () tuple2!6498)

(assert (=> b!389714 (= lt!183377 (+!1036 lt!183383 lt!183368))))

(declare-fun lt!183376 () tuple2!6498)

(assert (=> b!389714 (= lt!183383 (+!1036 lt!183372 lt!183376))))

(declare-fun lt!183371 () ListLongMap!5401)

(assert (=> b!389714 (= lt!183379 lt!183371)))

(assert (=> b!389714 (= lt!183371 (+!1036 lt!183370 lt!183368))))

(assert (=> b!389714 (= lt!183370 (+!1036 lt!183382 lt!183376))))

(assert (=> b!389714 (= lt!183377 (+!1036 (+!1036 lt!183378 lt!183376) lt!183368))))

(assert (=> b!389714 (= lt!183368 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389714 (= lt!183376 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389715 () Bool)

(declare-fun e!236088 () Bool)

(declare-fun tp_is_empty!9613 () Bool)

(assert (=> b!389715 (= e!236088 tp_is_empty!9613)))

(declare-fun b!389716 () Bool)

(declare-fun res!222973 () Bool)

(assert (=> b!389716 (=> (not res!222973) (not e!236083))))

(declare-datatypes ((List!6345 0))(
  ( (Nil!6342) (Cons!6341 (h!7197 (_ BitVec 64)) (t!11494 List!6345)) )
))
(declare-fun arrayNoDuplicates!0 (array!23111 (_ BitVec 32) List!6345) Bool)

(assert (=> b!389716 (= res!222973 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6342))))

(declare-fun b!389717 () Bool)

(assert (=> b!389717 (= e!236086 (bvslt i!548 (size!11372 _values!506)))))

(assert (=> b!389717 (= (+!1036 lt!183373 lt!183368) (+!1036 lt!183371 lt!183384))))

(declare-fun lt!183374 () Unit!11916)

(assert (=> b!389717 (= lt!183374 (addCommutativeForDiffKeys!326 lt!183370 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!389718 () Bool)

(declare-fun res!222974 () Bool)

(assert (=> b!389718 (=> (not res!222974) (not e!236083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389718 (= res!222974 (validKeyInArray!0 k0!778))))

(declare-fun b!389719 () Bool)

(declare-fun res!222968 () Bool)

(assert (=> b!389719 (=> (not res!222968) (not e!236083))))

(declare-fun arrayContainsKey!0 (array!23111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389719 (= res!222968 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389720 () Bool)

(declare-fun res!222975 () Bool)

(assert (=> b!389720 (=> (not res!222975) (not e!236083))))

(assert (=> b!389720 (= res!222975 (or (= (select (arr!11020 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11020 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389721 () Bool)

(declare-fun res!222978 () Bool)

(assert (=> b!389721 (=> (not res!222978) (not e!236083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23111 (_ BitVec 32)) Bool)

(assert (=> b!389721 (= res!222978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389722 () Bool)

(declare-fun res!222976 () Bool)

(assert (=> b!389722 (=> (not res!222976) (not e!236085))))

(assert (=> b!389722 (= res!222976 (arrayNoDuplicates!0 lt!183380 #b00000000000000000000000000000000 Nil!6342))))

(declare-fun res!222972 () Bool)

(assert (=> start!37914 (=> (not res!222972) (not e!236083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37914 (= res!222972 (validMask!0 mask!970))))

(assert (=> start!37914 e!236083))

(declare-fun e!236087 () Bool)

(declare-fun array_inv!8098 (array!23109) Bool)

(assert (=> start!37914 (and (array_inv!8098 _values!506) e!236087)))

(assert (=> start!37914 tp!31586))

(assert (=> start!37914 true))

(assert (=> start!37914 tp_is_empty!9613))

(declare-fun array_inv!8099 (array!23111) Bool)

(assert (=> start!37914 (array_inv!8099 _keys!658)))

(declare-fun b!389712 () Bool)

(assert (=> b!389712 (= e!236087 (and e!236088 mapRes!15996))))

(declare-fun condMapEmpty!15996 () Bool)

(declare-fun mapDefault!15996 () ValueCell!4463)

(assert (=> b!389712 (= condMapEmpty!15996 (= (arr!11019 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4463)) mapDefault!15996)))))

(declare-fun b!389723 () Bool)

(declare-fun e!236082 () Bool)

(assert (=> b!389723 (= e!236082 tp_is_empty!9613)))

(declare-fun b!389724 () Bool)

(assert (=> b!389724 (= e!236083 e!236085)))

(declare-fun res!222977 () Bool)

(assert (=> b!389724 (=> (not res!222977) (not e!236085))))

(assert (=> b!389724 (= res!222977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183380 mask!970))))

(assert (=> b!389724 (= lt!183380 (array!23112 (store (arr!11020 _keys!658) i!548 k0!778) (size!11373 _keys!658)))))

(declare-fun b!389725 () Bool)

(declare-fun res!222971 () Bool)

(assert (=> b!389725 (=> (not res!222971) (not e!236083))))

(assert (=> b!389725 (= res!222971 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11373 _keys!658))))))

(declare-fun mapNonEmpty!15996 () Bool)

(declare-fun tp!31587 () Bool)

(assert (=> mapNonEmpty!15996 (= mapRes!15996 (and tp!31587 e!236082))))

(declare-fun mapRest!15996 () (Array (_ BitVec 32) ValueCell!4463))

(declare-fun mapValue!15996 () ValueCell!4463)

(declare-fun mapKey!15996 () (_ BitVec 32))

(assert (=> mapNonEmpty!15996 (= (arr!11019 _values!506) (store mapRest!15996 mapKey!15996 mapValue!15996))))

(assert (= (and start!37914 res!222972) b!389711))

(assert (= (and b!389711 res!222979) b!389721))

(assert (= (and b!389721 res!222978) b!389716))

(assert (= (and b!389716 res!222973) b!389725))

(assert (= (and b!389725 res!222971) b!389718))

(assert (= (and b!389718 res!222974) b!389720))

(assert (= (and b!389720 res!222975) b!389719))

(assert (= (and b!389719 res!222968) b!389724))

(assert (= (and b!389724 res!222977) b!389722))

(assert (= (and b!389722 res!222976) b!389713))

(assert (= (and b!389713 (not res!222970)) b!389714))

(assert (= (and b!389714 (not res!222969)) b!389717))

(assert (= (and b!389712 condMapEmpty!15996) mapIsEmpty!15996))

(assert (= (and b!389712 (not condMapEmpty!15996)) mapNonEmpty!15996))

(get-info :version)

(assert (= (and mapNonEmpty!15996 ((_ is ValueCellFull!4463) mapValue!15996)) b!389723))

(assert (= (and b!389712 ((_ is ValueCellFull!4463) mapDefault!15996)) b!389715))

(assert (= start!37914 b!389712))

(declare-fun m!385495 () Bool)

(assert (=> b!389714 m!385495))

(declare-fun m!385497 () Bool)

(assert (=> b!389714 m!385497))

(declare-fun m!385499 () Bool)

(assert (=> b!389714 m!385499))

(declare-fun m!385501 () Bool)

(assert (=> b!389714 m!385501))

(declare-fun m!385503 () Bool)

(assert (=> b!389714 m!385503))

(declare-fun m!385505 () Bool)

(assert (=> b!389714 m!385505))

(declare-fun m!385507 () Bool)

(assert (=> b!389714 m!385507))

(assert (=> b!389714 m!385507))

(declare-fun m!385509 () Bool)

(assert (=> b!389714 m!385509))

(declare-fun m!385511 () Bool)

(assert (=> b!389713 m!385511))

(declare-fun m!385513 () Bool)

(assert (=> b!389713 m!385513))

(declare-fun m!385515 () Bool)

(assert (=> b!389713 m!385515))

(declare-fun m!385517 () Bool)

(assert (=> b!389713 m!385517))

(declare-fun m!385519 () Bool)

(assert (=> b!389713 m!385519))

(declare-fun m!385521 () Bool)

(assert (=> b!389713 m!385521))

(declare-fun m!385523 () Bool)

(assert (=> b!389713 m!385523))

(declare-fun m!385525 () Bool)

(assert (=> b!389724 m!385525))

(declare-fun m!385527 () Bool)

(assert (=> b!389724 m!385527))

(declare-fun m!385529 () Bool)

(assert (=> b!389721 m!385529))

(declare-fun m!385531 () Bool)

(assert (=> b!389716 m!385531))

(declare-fun m!385533 () Bool)

(assert (=> start!37914 m!385533))

(declare-fun m!385535 () Bool)

(assert (=> start!37914 m!385535))

(declare-fun m!385537 () Bool)

(assert (=> start!37914 m!385537))

(declare-fun m!385539 () Bool)

(assert (=> b!389717 m!385539))

(declare-fun m!385541 () Bool)

(assert (=> b!389717 m!385541))

(declare-fun m!385543 () Bool)

(assert (=> b!389717 m!385543))

(declare-fun m!385545 () Bool)

(assert (=> b!389718 m!385545))

(declare-fun m!385547 () Bool)

(assert (=> b!389720 m!385547))

(declare-fun m!385549 () Bool)

(assert (=> mapNonEmpty!15996 m!385549))

(declare-fun m!385551 () Bool)

(assert (=> b!389722 m!385551))

(declare-fun m!385553 () Bool)

(assert (=> b!389719 m!385553))

(check-sat (not b!389722) (not b_next!8941) (not b!389717) (not b!389713) (not b!389718) tp_is_empty!9613 (not b!389719) (not mapNonEmpty!15996) b_and!16205 (not b!389724) (not b!389716) (not b!389721) (not start!37914) (not b!389714))
(check-sat b_and!16205 (not b_next!8941))
