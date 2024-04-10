; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37162 () Bool)

(assert start!37162)

(declare-fun b_free!8289 () Bool)

(declare-fun b_next!8289 () Bool)

(assert (=> start!37162 (= b_free!8289 (not b_next!8289))))

(declare-fun tp!29583 () Bool)

(declare-fun b_and!15531 () Bool)

(assert (=> start!37162 (= tp!29583 b_and!15531)))

(declare-fun b!374937 () Bool)

(declare-fun res!211546 () Bool)

(declare-fun e!228467 () Bool)

(assert (=> b!374937 (=> (not res!211546) (not e!228467))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374937 (= res!211546 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14970 () Bool)

(declare-fun mapRes!14970 () Bool)

(assert (=> mapIsEmpty!14970 mapRes!14970))

(declare-fun b!374938 () Bool)

(declare-fun e!228470 () Bool)

(assert (=> b!374938 (= e!228467 e!228470)))

(declare-fun res!211543 () Bool)

(assert (=> b!374938 (=> (not res!211543) (not e!228470))))

(declare-datatypes ((array!21811 0))(
  ( (array!21812 (arr!10374 (Array (_ BitVec 32) (_ BitVec 64))) (size!10726 (_ BitVec 32))) )
))
(declare-fun lt!173186 () array!21811)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21811 (_ BitVec 32)) Bool)

(assert (=> b!374938 (= res!211543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173186 mask!970))))

(declare-fun _keys!658 () array!21811)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374938 (= lt!173186 (array!21812 (store (arr!10374 _keys!658) i!548 k0!778) (size!10726 _keys!658)))))

(declare-fun b!374939 () Bool)

(declare-fun e!228465 () Bool)

(declare-fun e!228464 () Bool)

(assert (=> b!374939 (= e!228465 e!228464)))

(declare-fun res!211550 () Bool)

(assert (=> b!374939 (=> res!211550 e!228464)))

(assert (=> b!374939 (= res!211550 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13021 0))(
  ( (V!13022 (val!4513 Int)) )
))
(declare-datatypes ((tuple2!6002 0))(
  ( (tuple2!6003 (_1!3012 (_ BitVec 64)) (_2!3012 V!13021)) )
))
(declare-datatypes ((List!5846 0))(
  ( (Nil!5843) (Cons!5842 (h!6698 tuple2!6002) (t!10996 List!5846)) )
))
(declare-datatypes ((ListLongMap!4915 0))(
  ( (ListLongMap!4916 (toList!2473 List!5846)) )
))
(declare-fun lt!173174 () ListLongMap!4915)

(declare-fun lt!173183 () ListLongMap!4915)

(assert (=> b!374939 (= lt!173174 lt!173183)))

(declare-fun lt!173189 () ListLongMap!4915)

(declare-fun lt!173185 () tuple2!6002)

(declare-fun +!819 (ListLongMap!4915 tuple2!6002) ListLongMap!4915)

(assert (=> b!374939 (= lt!173183 (+!819 lt!173189 lt!173185))))

(declare-fun lt!173184 () ListLongMap!4915)

(declare-fun zeroValue!472 () V!13021)

(declare-datatypes ((Unit!11544 0))(
  ( (Unit!11545) )
))
(declare-fun lt!173177 () Unit!11544)

(declare-fun v!373 () V!13021)

(declare-fun addCommutativeForDiffKeys!241 (ListLongMap!4915 (_ BitVec 64) V!13021 (_ BitVec 64) V!13021) Unit!11544)

(assert (=> b!374939 (= lt!173177 (addCommutativeForDiffKeys!241 lt!173184 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173180 () ListLongMap!4915)

(declare-fun lt!173179 () tuple2!6002)

(assert (=> b!374939 (= lt!173180 (+!819 lt!173174 lt!173179))))

(declare-fun lt!173188 () ListLongMap!4915)

(declare-fun lt!173187 () tuple2!6002)

(assert (=> b!374939 (= lt!173174 (+!819 lt!173188 lt!173187))))

(declare-fun lt!173176 () ListLongMap!4915)

(declare-fun lt!173178 () ListLongMap!4915)

(assert (=> b!374939 (= lt!173176 lt!173178)))

(assert (=> b!374939 (= lt!173178 (+!819 lt!173189 lt!173179))))

(assert (=> b!374939 (= lt!173189 (+!819 lt!173184 lt!173187))))

(declare-fun lt!173182 () ListLongMap!4915)

(assert (=> b!374939 (= lt!173180 (+!819 (+!819 lt!173182 lt!173187) lt!173179))))

(declare-fun minValue!472 () V!13021)

(assert (=> b!374939 (= lt!173179 (tuple2!6003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374939 (= lt!173187 (tuple2!6003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374941 () Bool)

(declare-fun res!211553 () Bool)

(assert (=> b!374941 (=> (not res!211553) (not e!228467))))

(assert (=> b!374941 (= res!211553 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10726 _keys!658))))))

(declare-fun b!374942 () Bool)

(assert (=> b!374942 (= e!228464 true)))

(assert (=> b!374942 (= (+!819 lt!173183 lt!173179) (+!819 lt!173178 lt!173185))))

(declare-fun lt!173181 () Unit!11544)

(assert (=> b!374942 (= lt!173181 (addCommutativeForDiffKeys!241 lt!173189 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374943 () Bool)

(assert (=> b!374943 (= e!228470 (not e!228465))))

(declare-fun res!211542 () Bool)

(assert (=> b!374943 (=> res!211542 e!228465)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374943 (= res!211542 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4125 0))(
  ( (ValueCellFull!4125 (v!6710 V!13021)) (EmptyCell!4125) )
))
(declare-datatypes ((array!21813 0))(
  ( (array!21814 (arr!10375 (Array (_ BitVec 32) ValueCell!4125)) (size!10727 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21813)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1910 (array!21811 array!21813 (_ BitVec 32) (_ BitVec 32) V!13021 V!13021 (_ BitVec 32) Int) ListLongMap!4915)

(assert (=> b!374943 (= lt!173176 (getCurrentListMap!1910 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173175 () array!21813)

(assert (=> b!374943 (= lt!173180 (getCurrentListMap!1910 lt!173186 lt!173175 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374943 (and (= lt!173182 lt!173188) (= lt!173188 lt!173182))))

(assert (=> b!374943 (= lt!173188 (+!819 lt!173184 lt!173185))))

(assert (=> b!374943 (= lt!173185 (tuple2!6003 k0!778 v!373))))

(declare-fun lt!173190 () Unit!11544)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!68 (array!21811 array!21813 (_ BitVec 32) (_ BitVec 32) V!13021 V!13021 (_ BitVec 32) (_ BitVec 64) V!13021 (_ BitVec 32) Int) Unit!11544)

(assert (=> b!374943 (= lt!173190 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!68 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!744 (array!21811 array!21813 (_ BitVec 32) (_ BitVec 32) V!13021 V!13021 (_ BitVec 32) Int) ListLongMap!4915)

(assert (=> b!374943 (= lt!173182 (getCurrentListMapNoExtraKeys!744 lt!173186 lt!173175 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374943 (= lt!173175 (array!21814 (store (arr!10375 _values!506) i!548 (ValueCellFull!4125 v!373)) (size!10727 _values!506)))))

(assert (=> b!374943 (= lt!173184 (getCurrentListMapNoExtraKeys!744 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374944 () Bool)

(declare-fun e!228469 () Bool)

(declare-fun tp_is_empty!8937 () Bool)

(assert (=> b!374944 (= e!228469 tp_is_empty!8937)))

(declare-fun b!374945 () Bool)

(declare-fun res!211548 () Bool)

(assert (=> b!374945 (=> (not res!211548) (not e!228467))))

(declare-fun arrayContainsKey!0 (array!21811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374945 (= res!211548 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374946 () Bool)

(declare-fun e!228463 () Bool)

(assert (=> b!374946 (= e!228463 (and e!228469 mapRes!14970))))

(declare-fun condMapEmpty!14970 () Bool)

(declare-fun mapDefault!14970 () ValueCell!4125)

(assert (=> b!374946 (= condMapEmpty!14970 (= (arr!10375 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4125)) mapDefault!14970)))))

(declare-fun b!374947 () Bool)

(declare-fun res!211547 () Bool)

(assert (=> b!374947 (=> (not res!211547) (not e!228470))))

(declare-datatypes ((List!5847 0))(
  ( (Nil!5844) (Cons!5843 (h!6699 (_ BitVec 64)) (t!10997 List!5847)) )
))
(declare-fun arrayNoDuplicates!0 (array!21811 (_ BitVec 32) List!5847) Bool)

(assert (=> b!374947 (= res!211547 (arrayNoDuplicates!0 lt!173186 #b00000000000000000000000000000000 Nil!5844))))

(declare-fun b!374948 () Bool)

(declare-fun res!211544 () Bool)

(assert (=> b!374948 (=> (not res!211544) (not e!228467))))

(assert (=> b!374948 (= res!211544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374949 () Bool)

(declare-fun e!228466 () Bool)

(assert (=> b!374949 (= e!228466 tp_is_empty!8937)))

(declare-fun b!374950 () Bool)

(declare-fun res!211552 () Bool)

(assert (=> b!374950 (=> (not res!211552) (not e!228467))))

(assert (=> b!374950 (= res!211552 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5844))))

(declare-fun res!211551 () Bool)

(assert (=> start!37162 (=> (not res!211551) (not e!228467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37162 (= res!211551 (validMask!0 mask!970))))

(assert (=> start!37162 e!228467))

(declare-fun array_inv!7650 (array!21813) Bool)

(assert (=> start!37162 (and (array_inv!7650 _values!506) e!228463)))

(assert (=> start!37162 tp!29583))

(assert (=> start!37162 true))

(assert (=> start!37162 tp_is_empty!8937))

(declare-fun array_inv!7651 (array!21811) Bool)

(assert (=> start!37162 (array_inv!7651 _keys!658)))

(declare-fun b!374940 () Bool)

(declare-fun res!211545 () Bool)

(assert (=> b!374940 (=> (not res!211545) (not e!228467))))

(assert (=> b!374940 (= res!211545 (and (= (size!10727 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10726 _keys!658) (size!10727 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374951 () Bool)

(declare-fun res!211549 () Bool)

(assert (=> b!374951 (=> (not res!211549) (not e!228467))))

(assert (=> b!374951 (= res!211549 (or (= (select (arr!10374 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10374 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14970 () Bool)

(declare-fun tp!29582 () Bool)

(assert (=> mapNonEmpty!14970 (= mapRes!14970 (and tp!29582 e!228466))))

(declare-fun mapValue!14970 () ValueCell!4125)

(declare-fun mapKey!14970 () (_ BitVec 32))

(declare-fun mapRest!14970 () (Array (_ BitVec 32) ValueCell!4125))

(assert (=> mapNonEmpty!14970 (= (arr!10375 _values!506) (store mapRest!14970 mapKey!14970 mapValue!14970))))

(assert (= (and start!37162 res!211551) b!374940))

(assert (= (and b!374940 res!211545) b!374948))

(assert (= (and b!374948 res!211544) b!374950))

(assert (= (and b!374950 res!211552) b!374941))

(assert (= (and b!374941 res!211553) b!374937))

(assert (= (and b!374937 res!211546) b!374951))

(assert (= (and b!374951 res!211549) b!374945))

(assert (= (and b!374945 res!211548) b!374938))

(assert (= (and b!374938 res!211543) b!374947))

(assert (= (and b!374947 res!211547) b!374943))

(assert (= (and b!374943 (not res!211542)) b!374939))

(assert (= (and b!374939 (not res!211550)) b!374942))

(assert (= (and b!374946 condMapEmpty!14970) mapIsEmpty!14970))

(assert (= (and b!374946 (not condMapEmpty!14970)) mapNonEmpty!14970))

(get-info :version)

(assert (= (and mapNonEmpty!14970 ((_ is ValueCellFull!4125) mapValue!14970)) b!374949))

(assert (= (and b!374946 ((_ is ValueCellFull!4125) mapDefault!14970)) b!374944))

(assert (= start!37162 b!374946))

(declare-fun m!371355 () Bool)

(assert (=> b!374950 m!371355))

(declare-fun m!371357 () Bool)

(assert (=> b!374939 m!371357))

(declare-fun m!371359 () Bool)

(assert (=> b!374939 m!371359))

(declare-fun m!371361 () Bool)

(assert (=> b!374939 m!371361))

(declare-fun m!371363 () Bool)

(assert (=> b!374939 m!371363))

(declare-fun m!371365 () Bool)

(assert (=> b!374939 m!371365))

(declare-fun m!371367 () Bool)

(assert (=> b!374939 m!371367))

(declare-fun m!371369 () Bool)

(assert (=> b!374939 m!371369))

(declare-fun m!371371 () Bool)

(assert (=> b!374939 m!371371))

(assert (=> b!374939 m!371365))

(declare-fun m!371373 () Bool)

(assert (=> b!374947 m!371373))

(declare-fun m!371375 () Bool)

(assert (=> start!37162 m!371375))

(declare-fun m!371377 () Bool)

(assert (=> start!37162 m!371377))

(declare-fun m!371379 () Bool)

(assert (=> start!37162 m!371379))

(declare-fun m!371381 () Bool)

(assert (=> b!374951 m!371381))

(declare-fun m!371383 () Bool)

(assert (=> b!374942 m!371383))

(declare-fun m!371385 () Bool)

(assert (=> b!374942 m!371385))

(declare-fun m!371387 () Bool)

(assert (=> b!374942 m!371387))

(declare-fun m!371389 () Bool)

(assert (=> b!374945 m!371389))

(declare-fun m!371391 () Bool)

(assert (=> b!374948 m!371391))

(declare-fun m!371393 () Bool)

(assert (=> b!374938 m!371393))

(declare-fun m!371395 () Bool)

(assert (=> b!374938 m!371395))

(declare-fun m!371397 () Bool)

(assert (=> b!374937 m!371397))

(declare-fun m!371399 () Bool)

(assert (=> b!374943 m!371399))

(declare-fun m!371401 () Bool)

(assert (=> b!374943 m!371401))

(declare-fun m!371403 () Bool)

(assert (=> b!374943 m!371403))

(declare-fun m!371405 () Bool)

(assert (=> b!374943 m!371405))

(declare-fun m!371407 () Bool)

(assert (=> b!374943 m!371407))

(declare-fun m!371409 () Bool)

(assert (=> b!374943 m!371409))

(declare-fun m!371411 () Bool)

(assert (=> b!374943 m!371411))

(declare-fun m!371413 () Bool)

(assert (=> mapNonEmpty!14970 m!371413))

(check-sat (not b!374943) (not b!374942) (not b!374938) (not b!374937) (not start!37162) (not b!374950) b_and!15531 (not b!374947) (not b_next!8289) (not b!374939) (not b!374945) (not mapNonEmpty!14970) (not b!374948) tp_is_empty!8937)
(check-sat b_and!15531 (not b_next!8289))
