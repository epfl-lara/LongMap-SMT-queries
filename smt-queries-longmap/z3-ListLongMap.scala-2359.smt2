; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37618 () Bool)

(assert start!37618)

(declare-fun b_free!8745 () Bool)

(declare-fun b_next!8745 () Bool)

(assert (=> start!37618 (= b_free!8745 (not b_next!8745))))

(declare-fun tp!30950 () Bool)

(declare-fun b_and!15987 () Bool)

(assert (=> start!37618 (= tp!30950 b_and!15987)))

(declare-fun b!384932 () Bool)

(declare-fun e!233656 () Bool)

(declare-fun tp_is_empty!9393 () Bool)

(assert (=> b!384932 (= e!233656 tp_is_empty!9393)))

(declare-fun b!384933 () Bool)

(declare-fun res!219494 () Bool)

(declare-fun e!233653 () Bool)

(assert (=> b!384933 (=> (not res!219494) (not e!233653))))

(declare-datatypes ((array!22687 0))(
  ( (array!22688 (arr!10812 (Array (_ BitVec 32) (_ BitVec 64))) (size!11164 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22687)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22687 (_ BitVec 32)) Bool)

(assert (=> b!384933 (= res!219494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384934 () Bool)

(declare-fun res!219484 () Bool)

(assert (=> b!384934 (=> (not res!219484) (not e!233653))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384934 (= res!219484 (validKeyInArray!0 k0!778))))

(declare-fun b!384935 () Bool)

(declare-fun e!233657 () Bool)

(declare-fun e!233654 () Bool)

(assert (=> b!384935 (= e!233657 (not e!233654))))

(declare-fun res!219493 () Bool)

(assert (=> b!384935 (=> res!219493 e!233654)))

(declare-fun lt!181274 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384935 (= res!219493 (or (and (not lt!181274) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181274) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181274)))))

(assert (=> b!384935 (= lt!181274 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13629 0))(
  ( (V!13630 (val!4741 Int)) )
))
(declare-datatypes ((ValueCell!4353 0))(
  ( (ValueCellFull!4353 (v!6938 V!13629)) (EmptyCell!4353) )
))
(declare-datatypes ((array!22689 0))(
  ( (array!22690 (arr!10813 (Array (_ BitVec 32) ValueCell!4353)) (size!11165 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22689)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6386 0))(
  ( (tuple2!6387 (_1!3204 (_ BitVec 64)) (_2!3204 V!13629)) )
))
(declare-datatypes ((List!6221 0))(
  ( (Nil!6218) (Cons!6217 (h!7073 tuple2!6386) (t!11371 List!6221)) )
))
(declare-datatypes ((ListLongMap!5299 0))(
  ( (ListLongMap!5300 (toList!2665 List!6221)) )
))
(declare-fun lt!181276 () ListLongMap!5299)

(declare-fun zeroValue!472 () V!13629)

(declare-fun minValue!472 () V!13629)

(declare-fun getCurrentListMap!2063 (array!22687 array!22689 (_ BitVec 32) (_ BitVec 32) V!13629 V!13629 (_ BitVec 32) Int) ListLongMap!5299)

(assert (=> b!384935 (= lt!181276 (getCurrentListMap!2063 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181281 () array!22687)

(declare-fun lt!181271 () ListLongMap!5299)

(declare-fun lt!181273 () array!22689)

(assert (=> b!384935 (= lt!181271 (getCurrentListMap!2063 lt!181281 lt!181273 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181280 () ListLongMap!5299)

(declare-fun lt!181272 () ListLongMap!5299)

(assert (=> b!384935 (and (= lt!181280 lt!181272) (= lt!181272 lt!181280))))

(declare-fun lt!181277 () ListLongMap!5299)

(declare-fun lt!181278 () tuple2!6386)

(declare-fun +!1000 (ListLongMap!5299 tuple2!6386) ListLongMap!5299)

(assert (=> b!384935 (= lt!181272 (+!1000 lt!181277 lt!181278))))

(declare-fun v!373 () V!13629)

(assert (=> b!384935 (= lt!181278 (tuple2!6387 k0!778 v!373))))

(declare-datatypes ((Unit!11880 0))(
  ( (Unit!11881) )
))
(declare-fun lt!181275 () Unit!11880)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!221 (array!22687 array!22689 (_ BitVec 32) (_ BitVec 32) V!13629 V!13629 (_ BitVec 32) (_ BitVec 64) V!13629 (_ BitVec 32) Int) Unit!11880)

(assert (=> b!384935 (= lt!181275 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!221 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!897 (array!22687 array!22689 (_ BitVec 32) (_ BitVec 32) V!13629 V!13629 (_ BitVec 32) Int) ListLongMap!5299)

(assert (=> b!384935 (= lt!181280 (getCurrentListMapNoExtraKeys!897 lt!181281 lt!181273 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384935 (= lt!181273 (array!22690 (store (arr!10813 _values!506) i!548 (ValueCellFull!4353 v!373)) (size!11165 _values!506)))))

(assert (=> b!384935 (= lt!181277 (getCurrentListMapNoExtraKeys!897 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384936 () Bool)

(assert (=> b!384936 (= e!233653 e!233657)))

(declare-fun res!219490 () Bool)

(assert (=> b!384936 (=> (not res!219490) (not e!233657))))

(assert (=> b!384936 (= res!219490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181281 mask!970))))

(assert (=> b!384936 (= lt!181281 (array!22688 (store (arr!10812 _keys!658) i!548 k0!778) (size!11164 _keys!658)))))

(declare-fun mapNonEmpty!15654 () Bool)

(declare-fun mapRes!15654 () Bool)

(declare-fun tp!30951 () Bool)

(declare-fun e!233651 () Bool)

(assert (=> mapNonEmpty!15654 (= mapRes!15654 (and tp!30951 e!233651))))

(declare-fun mapRest!15654 () (Array (_ BitVec 32) ValueCell!4353))

(declare-fun mapValue!15654 () ValueCell!4353)

(declare-fun mapKey!15654 () (_ BitVec 32))

(assert (=> mapNonEmpty!15654 (= (arr!10813 _values!506) (store mapRest!15654 mapKey!15654 mapValue!15654))))

(declare-fun b!384937 () Bool)

(declare-fun res!219487 () Bool)

(assert (=> b!384937 (=> (not res!219487) (not e!233653))))

(assert (=> b!384937 (= res!219487 (and (= (size!11165 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11164 _keys!658) (size!11165 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384938 () Bool)

(assert (=> b!384938 (= e!233654 true)))

(declare-fun lt!181279 () ListLongMap!5299)

(assert (=> b!384938 (= lt!181279 (+!1000 lt!181276 lt!181278))))

(assert (=> b!384938 (= lt!181271 lt!181280)))

(declare-fun b!384939 () Bool)

(assert (=> b!384939 (= e!233651 tp_is_empty!9393)))

(declare-fun b!384940 () Bool)

(declare-fun e!233655 () Bool)

(assert (=> b!384940 (= e!233655 (and e!233656 mapRes!15654))))

(declare-fun condMapEmpty!15654 () Bool)

(declare-fun mapDefault!15654 () ValueCell!4353)

(assert (=> b!384940 (= condMapEmpty!15654 (= (arr!10813 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4353)) mapDefault!15654)))))

(declare-fun b!384941 () Bool)

(declare-fun res!219491 () Bool)

(assert (=> b!384941 (=> (not res!219491) (not e!233653))))

(assert (=> b!384941 (= res!219491 (or (= (select (arr!10812 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10812 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384931 () Bool)

(declare-fun res!219492 () Bool)

(assert (=> b!384931 (=> (not res!219492) (not e!233653))))

(assert (=> b!384931 (= res!219492 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11164 _keys!658))))))

(declare-fun res!219485 () Bool)

(assert (=> start!37618 (=> (not res!219485) (not e!233653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37618 (= res!219485 (validMask!0 mask!970))))

(assert (=> start!37618 e!233653))

(declare-fun array_inv!7960 (array!22689) Bool)

(assert (=> start!37618 (and (array_inv!7960 _values!506) e!233655)))

(assert (=> start!37618 tp!30950))

(assert (=> start!37618 true))

(assert (=> start!37618 tp_is_empty!9393))

(declare-fun array_inv!7961 (array!22687) Bool)

(assert (=> start!37618 (array_inv!7961 _keys!658)))

(declare-fun b!384942 () Bool)

(declare-fun res!219486 () Bool)

(assert (=> b!384942 (=> (not res!219486) (not e!233653))))

(declare-fun arrayContainsKey!0 (array!22687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384942 (= res!219486 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15654 () Bool)

(assert (=> mapIsEmpty!15654 mapRes!15654))

(declare-fun b!384943 () Bool)

(declare-fun res!219489 () Bool)

(assert (=> b!384943 (=> (not res!219489) (not e!233653))))

(declare-datatypes ((List!6222 0))(
  ( (Nil!6219) (Cons!6218 (h!7074 (_ BitVec 64)) (t!11372 List!6222)) )
))
(declare-fun arrayNoDuplicates!0 (array!22687 (_ BitVec 32) List!6222) Bool)

(assert (=> b!384943 (= res!219489 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6219))))

(declare-fun b!384944 () Bool)

(declare-fun res!219488 () Bool)

(assert (=> b!384944 (=> (not res!219488) (not e!233657))))

(assert (=> b!384944 (= res!219488 (arrayNoDuplicates!0 lt!181281 #b00000000000000000000000000000000 Nil!6219))))

(assert (= (and start!37618 res!219485) b!384937))

(assert (= (and b!384937 res!219487) b!384933))

(assert (= (and b!384933 res!219494) b!384943))

(assert (= (and b!384943 res!219489) b!384931))

(assert (= (and b!384931 res!219492) b!384934))

(assert (= (and b!384934 res!219484) b!384941))

(assert (= (and b!384941 res!219491) b!384942))

(assert (= (and b!384942 res!219486) b!384936))

(assert (= (and b!384936 res!219490) b!384944))

(assert (= (and b!384944 res!219488) b!384935))

(assert (= (and b!384935 (not res!219493)) b!384938))

(assert (= (and b!384940 condMapEmpty!15654) mapIsEmpty!15654))

(assert (= (and b!384940 (not condMapEmpty!15654)) mapNonEmpty!15654))

(get-info :version)

(assert (= (and mapNonEmpty!15654 ((_ is ValueCellFull!4353) mapValue!15654)) b!384939))

(assert (= (and b!384940 ((_ is ValueCellFull!4353) mapDefault!15654)) b!384932))

(assert (= start!37618 b!384940))

(declare-fun m!381595 () Bool)

(assert (=> b!384935 m!381595))

(declare-fun m!381597 () Bool)

(assert (=> b!384935 m!381597))

(declare-fun m!381599 () Bool)

(assert (=> b!384935 m!381599))

(declare-fun m!381601 () Bool)

(assert (=> b!384935 m!381601))

(declare-fun m!381603 () Bool)

(assert (=> b!384935 m!381603))

(declare-fun m!381605 () Bool)

(assert (=> b!384935 m!381605))

(declare-fun m!381607 () Bool)

(assert (=> b!384935 m!381607))

(declare-fun m!381609 () Bool)

(assert (=> b!384938 m!381609))

(declare-fun m!381611 () Bool)

(assert (=> b!384933 m!381611))

(declare-fun m!381613 () Bool)

(assert (=> start!37618 m!381613))

(declare-fun m!381615 () Bool)

(assert (=> start!37618 m!381615))

(declare-fun m!381617 () Bool)

(assert (=> start!37618 m!381617))

(declare-fun m!381619 () Bool)

(assert (=> b!384934 m!381619))

(declare-fun m!381621 () Bool)

(assert (=> b!384943 m!381621))

(declare-fun m!381623 () Bool)

(assert (=> b!384942 m!381623))

(declare-fun m!381625 () Bool)

(assert (=> b!384936 m!381625))

(declare-fun m!381627 () Bool)

(assert (=> b!384936 m!381627))

(declare-fun m!381629 () Bool)

(assert (=> mapNonEmpty!15654 m!381629))

(declare-fun m!381631 () Bool)

(assert (=> b!384944 m!381631))

(declare-fun m!381633 () Bool)

(assert (=> b!384941 m!381633))

(check-sat (not b!384934) (not mapNonEmpty!15654) (not b!384933) (not b!384942) (not b!384936) (not b!384935) (not start!37618) (not b!384938) (not b!384944) (not b!384943) tp_is_empty!9393 b_and!15987 (not b_next!8745))
(check-sat b_and!15987 (not b_next!8745))
