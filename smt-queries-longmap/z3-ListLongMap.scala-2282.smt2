; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37140 () Bool)

(assert start!37140)

(declare-fun b_free!8281 () Bool)

(declare-fun b_next!8281 () Bool)

(assert (=> start!37140 (= b_free!8281 (not b_next!8281))))

(declare-fun tp!29559 () Bool)

(declare-fun b_and!15497 () Bool)

(assert (=> start!37140 (= tp!29559 b_and!15497)))

(declare-fun b!374486 () Bool)

(declare-fun res!211270 () Bool)

(declare-fun e!228197 () Bool)

(assert (=> b!374486 (=> (not res!211270) (not e!228197))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13011 0))(
  ( (V!13012 (val!4509 Int)) )
))
(declare-datatypes ((ValueCell!4121 0))(
  ( (ValueCellFull!4121 (v!6700 V!13011)) (EmptyCell!4121) )
))
(declare-datatypes ((array!21775 0))(
  ( (array!21776 (arr!10356 (Array (_ BitVec 32) ValueCell!4121)) (size!10709 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21775)

(declare-datatypes ((array!21777 0))(
  ( (array!21778 (arr!10357 (Array (_ BitVec 32) (_ BitVec 64))) (size!10710 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21777)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!374486 (= res!211270 (and (= (size!10709 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10710 _keys!658) (size!10709 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374487 () Bool)

(declare-fun res!211269 () Bool)

(declare-fun e!228193 () Bool)

(assert (=> b!374487 (=> (not res!211269) (not e!228193))))

(declare-fun lt!172739 () array!21777)

(declare-datatypes ((List!5801 0))(
  ( (Nil!5798) (Cons!5797 (h!6653 (_ BitVec 64)) (t!10942 List!5801)) )
))
(declare-fun arrayNoDuplicates!0 (array!21777 (_ BitVec 32) List!5801) Bool)

(assert (=> b!374487 (= res!211269 (arrayNoDuplicates!0 lt!172739 #b00000000000000000000000000000000 Nil!5798))))

(declare-fun b!374488 () Bool)

(declare-fun res!211279 () Bool)

(assert (=> b!374488 (=> (not res!211279) (not e!228197))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374488 (= res!211279 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10710 _keys!658))))))

(declare-fun b!374490 () Bool)

(declare-fun e!228199 () Bool)

(declare-fun e!228196 () Bool)

(declare-fun mapRes!14958 () Bool)

(assert (=> b!374490 (= e!228199 (and e!228196 mapRes!14958))))

(declare-fun condMapEmpty!14958 () Bool)

(declare-fun mapDefault!14958 () ValueCell!4121)

(assert (=> b!374490 (= condMapEmpty!14958 (= (arr!10356 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4121)) mapDefault!14958)))))

(declare-fun b!374491 () Bool)

(declare-fun e!228195 () Bool)

(assert (=> b!374491 (= e!228195 true)))

(declare-datatypes ((tuple2!5968 0))(
  ( (tuple2!5969 (_1!2995 (_ BitVec 64)) (_2!2995 V!13011)) )
))
(declare-fun lt!172744 () tuple2!5968)

(declare-datatypes ((List!5802 0))(
  ( (Nil!5799) (Cons!5798 (h!6654 tuple2!5968) (t!10943 List!5802)) )
))
(declare-datatypes ((ListLongMap!4871 0))(
  ( (ListLongMap!4872 (toList!2451 List!5802)) )
))
(declare-fun lt!172751 () ListLongMap!4871)

(declare-fun lt!172748 () ListLongMap!4871)

(declare-fun lt!172740 () tuple2!5968)

(declare-fun +!819 (ListLongMap!4871 tuple2!5968) ListLongMap!4871)

(assert (=> b!374491 (= (+!819 lt!172751 lt!172740) (+!819 lt!172748 lt!172744))))

(declare-fun v!373 () V!13011)

(declare-fun lt!172752 () ListLongMap!4871)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11510 0))(
  ( (Unit!11511) )
))
(declare-fun lt!172747 () Unit!11510)

(declare-fun minValue!472 () V!13011)

(declare-fun addCommutativeForDiffKeys!235 (ListLongMap!4871 (_ BitVec 64) V!13011 (_ BitVec 64) V!13011) Unit!11510)

(assert (=> b!374491 (= lt!172747 (addCommutativeForDiffKeys!235 lt!172752 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374492 () Bool)

(declare-fun res!211280 () Bool)

(assert (=> b!374492 (=> (not res!211280) (not e!228197))))

(assert (=> b!374492 (= res!211280 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5798))))

(declare-fun b!374493 () Bool)

(declare-fun e!228200 () Bool)

(assert (=> b!374493 (= e!228200 e!228195)))

(declare-fun res!211277 () Bool)

(assert (=> b!374493 (=> res!211277 e!228195)))

(assert (=> b!374493 (= res!211277 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172736 () ListLongMap!4871)

(assert (=> b!374493 (= lt!172736 lt!172751)))

(assert (=> b!374493 (= lt!172751 (+!819 lt!172752 lt!172744))))

(declare-fun lt!172750 () Unit!11510)

(declare-fun lt!172737 () ListLongMap!4871)

(declare-fun zeroValue!472 () V!13011)

(assert (=> b!374493 (= lt!172750 (addCommutativeForDiffKeys!235 lt!172737 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172743 () ListLongMap!4871)

(assert (=> b!374493 (= lt!172743 (+!819 lt!172736 lt!172740))))

(declare-fun lt!172746 () ListLongMap!4871)

(declare-fun lt!172749 () tuple2!5968)

(assert (=> b!374493 (= lt!172736 (+!819 lt!172746 lt!172749))))

(declare-fun lt!172741 () ListLongMap!4871)

(assert (=> b!374493 (= lt!172741 lt!172748)))

(assert (=> b!374493 (= lt!172748 (+!819 lt!172752 lt!172740))))

(assert (=> b!374493 (= lt!172752 (+!819 lt!172737 lt!172749))))

(declare-fun lt!172738 () ListLongMap!4871)

(assert (=> b!374493 (= lt!172743 (+!819 (+!819 lt!172738 lt!172749) lt!172740))))

(assert (=> b!374493 (= lt!172740 (tuple2!5969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374493 (= lt!172749 (tuple2!5969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14958 () Bool)

(declare-fun tp!29558 () Bool)

(declare-fun e!228194 () Bool)

(assert (=> mapNonEmpty!14958 (= mapRes!14958 (and tp!29558 e!228194))))

(declare-fun mapValue!14958 () ValueCell!4121)

(declare-fun mapRest!14958 () (Array (_ BitVec 32) ValueCell!4121))

(declare-fun mapKey!14958 () (_ BitVec 32))

(assert (=> mapNonEmpty!14958 (= (arr!10356 _values!506) (store mapRest!14958 mapKey!14958 mapValue!14958))))

(declare-fun b!374494 () Bool)

(declare-fun tp_is_empty!8929 () Bool)

(assert (=> b!374494 (= e!228194 tp_is_empty!8929)))

(declare-fun res!211272 () Bool)

(assert (=> start!37140 (=> (not res!211272) (not e!228197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37140 (= res!211272 (validMask!0 mask!970))))

(assert (=> start!37140 e!228197))

(declare-fun array_inv!7642 (array!21775) Bool)

(assert (=> start!37140 (and (array_inv!7642 _values!506) e!228199)))

(assert (=> start!37140 tp!29559))

(assert (=> start!37140 true))

(assert (=> start!37140 tp_is_empty!8929))

(declare-fun array_inv!7643 (array!21777) Bool)

(assert (=> start!37140 (array_inv!7643 _keys!658)))

(declare-fun b!374489 () Bool)

(declare-fun res!211274 () Bool)

(assert (=> b!374489 (=> (not res!211274) (not e!228197))))

(declare-fun arrayContainsKey!0 (array!21777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374489 (= res!211274 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374495 () Bool)

(assert (=> b!374495 (= e!228197 e!228193)))

(declare-fun res!211273 () Bool)

(assert (=> b!374495 (=> (not res!211273) (not e!228193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21777 (_ BitVec 32)) Bool)

(assert (=> b!374495 (= res!211273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172739 mask!970))))

(assert (=> b!374495 (= lt!172739 (array!21778 (store (arr!10357 _keys!658) i!548 k0!778) (size!10710 _keys!658)))))

(declare-fun b!374496 () Bool)

(declare-fun res!211271 () Bool)

(assert (=> b!374496 (=> (not res!211271) (not e!228197))))

(assert (=> b!374496 (= res!211271 (or (= (select (arr!10357 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10357 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14958 () Bool)

(assert (=> mapIsEmpty!14958 mapRes!14958))

(declare-fun b!374497 () Bool)

(declare-fun res!211275 () Bool)

(assert (=> b!374497 (=> (not res!211275) (not e!228197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374497 (= res!211275 (validKeyInArray!0 k0!778))))

(declare-fun b!374498 () Bool)

(assert (=> b!374498 (= e!228196 tp_is_empty!8929)))

(declare-fun b!374499 () Bool)

(assert (=> b!374499 (= e!228193 (not e!228200))))

(declare-fun res!211276 () Bool)

(assert (=> b!374499 (=> res!211276 e!228200)))

(assert (=> b!374499 (= res!211276 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1869 (array!21777 array!21775 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) Int) ListLongMap!4871)

(assert (=> b!374499 (= lt!172741 (getCurrentListMap!1869 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172745 () array!21775)

(assert (=> b!374499 (= lt!172743 (getCurrentListMap!1869 lt!172739 lt!172745 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374499 (and (= lt!172738 lt!172746) (= lt!172746 lt!172738))))

(assert (=> b!374499 (= lt!172746 (+!819 lt!172737 lt!172744))))

(assert (=> b!374499 (= lt!172744 (tuple2!5969 k0!778 v!373))))

(declare-fun lt!172742 () Unit!11510)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!62 (array!21777 array!21775 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) (_ BitVec 64) V!13011 (_ BitVec 32) Int) Unit!11510)

(assert (=> b!374499 (= lt!172742 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!62 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!734 (array!21777 array!21775 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) Int) ListLongMap!4871)

(assert (=> b!374499 (= lt!172738 (getCurrentListMapNoExtraKeys!734 lt!172739 lt!172745 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374499 (= lt!172745 (array!21776 (store (arr!10356 _values!506) i!548 (ValueCellFull!4121 v!373)) (size!10709 _values!506)))))

(assert (=> b!374499 (= lt!172737 (getCurrentListMapNoExtraKeys!734 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374500 () Bool)

(declare-fun res!211278 () Bool)

(assert (=> b!374500 (=> (not res!211278) (not e!228197))))

(assert (=> b!374500 (= res!211278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37140 res!211272) b!374486))

(assert (= (and b!374486 res!211270) b!374500))

(assert (= (and b!374500 res!211278) b!374492))

(assert (= (and b!374492 res!211280) b!374488))

(assert (= (and b!374488 res!211279) b!374497))

(assert (= (and b!374497 res!211275) b!374496))

(assert (= (and b!374496 res!211271) b!374489))

(assert (= (and b!374489 res!211274) b!374495))

(assert (= (and b!374495 res!211273) b!374487))

(assert (= (and b!374487 res!211269) b!374499))

(assert (= (and b!374499 (not res!211276)) b!374493))

(assert (= (and b!374493 (not res!211277)) b!374491))

(assert (= (and b!374490 condMapEmpty!14958) mapIsEmpty!14958))

(assert (= (and b!374490 (not condMapEmpty!14958)) mapNonEmpty!14958))

(get-info :version)

(assert (= (and mapNonEmpty!14958 ((_ is ValueCellFull!4121) mapValue!14958)) b!374494))

(assert (= (and b!374490 ((_ is ValueCellFull!4121) mapDefault!14958)) b!374498))

(assert (= start!37140 b!374490))

(declare-fun m!370391 () Bool)

(assert (=> b!374491 m!370391))

(declare-fun m!370393 () Bool)

(assert (=> b!374491 m!370393))

(declare-fun m!370395 () Bool)

(assert (=> b!374491 m!370395))

(declare-fun m!370397 () Bool)

(assert (=> b!374493 m!370397))

(declare-fun m!370399 () Bool)

(assert (=> b!374493 m!370399))

(declare-fun m!370401 () Bool)

(assert (=> b!374493 m!370401))

(declare-fun m!370403 () Bool)

(assert (=> b!374493 m!370403))

(declare-fun m!370405 () Bool)

(assert (=> b!374493 m!370405))

(assert (=> b!374493 m!370405))

(declare-fun m!370407 () Bool)

(assert (=> b!374493 m!370407))

(declare-fun m!370409 () Bool)

(assert (=> b!374493 m!370409))

(declare-fun m!370411 () Bool)

(assert (=> b!374493 m!370411))

(declare-fun m!370413 () Bool)

(assert (=> start!37140 m!370413))

(declare-fun m!370415 () Bool)

(assert (=> start!37140 m!370415))

(declare-fun m!370417 () Bool)

(assert (=> start!37140 m!370417))

(declare-fun m!370419 () Bool)

(assert (=> b!374497 m!370419))

(declare-fun m!370421 () Bool)

(assert (=> b!374489 m!370421))

(declare-fun m!370423 () Bool)

(assert (=> b!374495 m!370423))

(declare-fun m!370425 () Bool)

(assert (=> b!374495 m!370425))

(declare-fun m!370427 () Bool)

(assert (=> mapNonEmpty!14958 m!370427))

(declare-fun m!370429 () Bool)

(assert (=> b!374496 m!370429))

(declare-fun m!370431 () Bool)

(assert (=> b!374499 m!370431))

(declare-fun m!370433 () Bool)

(assert (=> b!374499 m!370433))

(declare-fun m!370435 () Bool)

(assert (=> b!374499 m!370435))

(declare-fun m!370437 () Bool)

(assert (=> b!374499 m!370437))

(declare-fun m!370439 () Bool)

(assert (=> b!374499 m!370439))

(declare-fun m!370441 () Bool)

(assert (=> b!374499 m!370441))

(declare-fun m!370443 () Bool)

(assert (=> b!374499 m!370443))

(declare-fun m!370445 () Bool)

(assert (=> b!374487 m!370445))

(declare-fun m!370447 () Bool)

(assert (=> b!374500 m!370447))

(declare-fun m!370449 () Bool)

(assert (=> b!374492 m!370449))

(check-sat (not b!374500) tp_is_empty!8929 (not b!374492) (not b!374487) (not b!374493) (not b_next!8281) (not b!374497) (not start!37140) b_and!15497 (not b!374491) (not b!374499) (not mapNonEmpty!14958) (not b!374495) (not b!374489))
(check-sat b_and!15497 (not b_next!8281))
