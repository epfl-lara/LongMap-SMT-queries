; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40214 () Bool)

(assert start!40214)

(declare-fun b_free!10495 () Bool)

(declare-fun b_next!10495 () Bool)

(assert (=> start!40214 (= b_free!10495 (not b_next!10495))))

(declare-fun tp!37014 () Bool)

(declare-fun b_and!18437 () Bool)

(assert (=> start!40214 (= tp!37014 b_and!18437)))

(declare-fun b!440965 () Bool)

(declare-fun e!259668 () Bool)

(declare-fun tp_is_empty!11647 () Bool)

(assert (=> b!440965 (= e!259668 tp_is_empty!11647)))

(declare-fun b!440966 () Bool)

(declare-fun res!261021 () Bool)

(declare-fun e!259669 () Bool)

(assert (=> b!440966 (=> (not res!261021) (not e!259669))))

(declare-datatypes ((array!27109 0))(
  ( (array!27110 (arr!13004 (Array (_ BitVec 32) (_ BitVec 64))) (size!13357 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27109)

(declare-datatypes ((List!7806 0))(
  ( (Nil!7803) (Cons!7802 (h!8658 (_ BitVec 64)) (t!13553 List!7806)) )
))
(declare-fun arrayNoDuplicates!0 (array!27109 (_ BitVec 32) List!7806) Bool)

(assert (=> b!440966 (= res!261021 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7803))))

(declare-fun mapIsEmpty!19092 () Bool)

(declare-fun mapRes!19092 () Bool)

(assert (=> mapIsEmpty!19092 mapRes!19092))

(declare-fun b!440967 () Bool)

(declare-fun res!261023 () Bool)

(assert (=> b!440967 (=> (not res!261023) (not e!259669))))

(declare-datatypes ((V!16635 0))(
  ( (V!16636 (val!5868 Int)) )
))
(declare-datatypes ((ValueCell!5480 0))(
  ( (ValueCellFull!5480 (v!8109 V!16635)) (EmptyCell!5480) )
))
(declare-datatypes ((array!27111 0))(
  ( (array!27112 (arr!13005 (Array (_ BitVec 32) ValueCell!5480)) (size!13358 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27111)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!440967 (= res!261023 (and (= (size!13358 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13357 _keys!709) (size!13358 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440968 () Bool)

(declare-fun res!261020 () Bool)

(assert (=> b!440968 (=> (not res!261020) (not e!259669))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440968 (= res!261020 (or (= (select (arr!13004 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13004 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440969 () Bool)

(declare-fun e!259665 () Bool)

(declare-fun e!259666 () Bool)

(assert (=> b!440969 (= e!259665 e!259666)))

(declare-fun res!261019 () Bool)

(assert (=> b!440969 (=> (not res!261019) (not e!259666))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440969 (= res!261019 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16635)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7820 0))(
  ( (tuple2!7821 (_1!3921 (_ BitVec 64)) (_2!3921 V!16635)) )
))
(declare-datatypes ((List!7807 0))(
  ( (Nil!7804) (Cons!7803 (h!8659 tuple2!7820) (t!13554 List!7807)) )
))
(declare-datatypes ((ListLongMap!6723 0))(
  ( (ListLongMap!6724 (toList!3377 List!7807)) )
))
(declare-fun lt!202597 () ListLongMap!6723)

(declare-fun lt!202600 () array!27109)

(declare-fun lt!202601 () array!27111)

(declare-fun zeroValue!515 () V!16635)

(declare-fun getCurrentListMapNoExtraKeys!1576 (array!27109 array!27111 (_ BitVec 32) (_ BitVec 32) V!16635 V!16635 (_ BitVec 32) Int) ListLongMap!6723)

(assert (=> b!440969 (= lt!202597 (getCurrentListMapNoExtraKeys!1576 lt!202600 lt!202601 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16635)

(assert (=> b!440969 (= lt!202601 (array!27112 (store (arr!13005 _values!549) i!563 (ValueCellFull!5480 v!412)) (size!13358 _values!549)))))

(declare-fun lt!202598 () ListLongMap!6723)

(assert (=> b!440969 (= lt!202598 (getCurrentListMapNoExtraKeys!1576 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440970 () Bool)

(declare-fun res!261018 () Bool)

(assert (=> b!440970 (=> (not res!261018) (not e!259669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440970 (= res!261018 (validMask!0 mask!1025))))

(declare-fun res!261017 () Bool)

(assert (=> start!40214 (=> (not res!261017) (not e!259669))))

(assert (=> start!40214 (= res!261017 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13357 _keys!709))))))

(assert (=> start!40214 e!259669))

(assert (=> start!40214 tp_is_empty!11647))

(assert (=> start!40214 tp!37014))

(assert (=> start!40214 true))

(declare-fun e!259667 () Bool)

(declare-fun array_inv!9482 (array!27111) Bool)

(assert (=> start!40214 (and (array_inv!9482 _values!549) e!259667)))

(declare-fun array_inv!9483 (array!27109) Bool)

(assert (=> start!40214 (array_inv!9483 _keys!709)))

(declare-fun b!440971 () Bool)

(assert (=> b!440971 (= e!259666 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1537 (ListLongMap!6723 tuple2!7820) ListLongMap!6723)

(assert (=> b!440971 (= (getCurrentListMapNoExtraKeys!1576 lt!202600 lt!202601 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1537 (getCurrentListMapNoExtraKeys!1576 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7821 k0!794 v!412)))))

(declare-datatypes ((Unit!13091 0))(
  ( (Unit!13092) )
))
(declare-fun lt!202599 () Unit!13091)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!675 (array!27109 array!27111 (_ BitVec 32) (_ BitVec 32) V!16635 V!16635 (_ BitVec 32) (_ BitVec 64) V!16635 (_ BitVec 32) Int) Unit!13091)

(assert (=> b!440971 (= lt!202599 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!675 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440972 () Bool)

(assert (=> b!440972 (= e!259669 e!259665)))

(declare-fun res!261025 () Bool)

(assert (=> b!440972 (=> (not res!261025) (not e!259665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27109 (_ BitVec 32)) Bool)

(assert (=> b!440972 (= res!261025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202600 mask!1025))))

(assert (=> b!440972 (= lt!202600 (array!27110 (store (arr!13004 _keys!709) i!563 k0!794) (size!13357 _keys!709)))))

(declare-fun b!440973 () Bool)

(declare-fun res!261015 () Bool)

(assert (=> b!440973 (=> (not res!261015) (not e!259669))))

(declare-fun arrayContainsKey!0 (array!27109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440973 (= res!261015 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440974 () Bool)

(declare-fun res!261026 () Bool)

(assert (=> b!440974 (=> (not res!261026) (not e!259669))))

(assert (=> b!440974 (= res!261026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440975 () Bool)

(declare-fun res!261022 () Bool)

(assert (=> b!440975 (=> (not res!261022) (not e!259665))))

(assert (=> b!440975 (= res!261022 (bvsle from!863 i!563))))

(declare-fun b!440976 () Bool)

(declare-fun res!261016 () Bool)

(assert (=> b!440976 (=> (not res!261016) (not e!259669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440976 (= res!261016 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19092 () Bool)

(declare-fun tp!37013 () Bool)

(assert (=> mapNonEmpty!19092 (= mapRes!19092 (and tp!37013 e!259668))))

(declare-fun mapRest!19092 () (Array (_ BitVec 32) ValueCell!5480))

(declare-fun mapKey!19092 () (_ BitVec 32))

(declare-fun mapValue!19092 () ValueCell!5480)

(assert (=> mapNonEmpty!19092 (= (arr!13005 _values!549) (store mapRest!19092 mapKey!19092 mapValue!19092))))

(declare-fun b!440977 () Bool)

(declare-fun e!259670 () Bool)

(assert (=> b!440977 (= e!259670 tp_is_empty!11647)))

(declare-fun b!440978 () Bool)

(declare-fun res!261027 () Bool)

(assert (=> b!440978 (=> (not res!261027) (not e!259665))))

(assert (=> b!440978 (= res!261027 (arrayNoDuplicates!0 lt!202600 #b00000000000000000000000000000000 Nil!7803))))

(declare-fun b!440979 () Bool)

(assert (=> b!440979 (= e!259667 (and e!259670 mapRes!19092))))

(declare-fun condMapEmpty!19092 () Bool)

(declare-fun mapDefault!19092 () ValueCell!5480)

(assert (=> b!440979 (= condMapEmpty!19092 (= (arr!13005 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5480)) mapDefault!19092)))))

(declare-fun b!440980 () Bool)

(declare-fun res!261024 () Bool)

(assert (=> b!440980 (=> (not res!261024) (not e!259669))))

(assert (=> b!440980 (= res!261024 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13357 _keys!709))))))

(assert (= (and start!40214 res!261017) b!440970))

(assert (= (and b!440970 res!261018) b!440967))

(assert (= (and b!440967 res!261023) b!440974))

(assert (= (and b!440974 res!261026) b!440966))

(assert (= (and b!440966 res!261021) b!440980))

(assert (= (and b!440980 res!261024) b!440976))

(assert (= (and b!440976 res!261016) b!440968))

(assert (= (and b!440968 res!261020) b!440973))

(assert (= (and b!440973 res!261015) b!440972))

(assert (= (and b!440972 res!261025) b!440978))

(assert (= (and b!440978 res!261027) b!440975))

(assert (= (and b!440975 res!261022) b!440969))

(assert (= (and b!440969 res!261019) b!440971))

(assert (= (and b!440979 condMapEmpty!19092) mapIsEmpty!19092))

(assert (= (and b!440979 (not condMapEmpty!19092)) mapNonEmpty!19092))

(get-info :version)

(assert (= (and mapNonEmpty!19092 ((_ is ValueCellFull!5480) mapValue!19092)) b!440965))

(assert (= (and b!440979 ((_ is ValueCellFull!5480) mapDefault!19092)) b!440977))

(assert (= start!40214 b!440979))

(declare-fun m!427383 () Bool)

(assert (=> b!440974 m!427383))

(declare-fun m!427385 () Bool)

(assert (=> b!440973 m!427385))

(declare-fun m!427387 () Bool)

(assert (=> b!440972 m!427387))

(declare-fun m!427389 () Bool)

(assert (=> b!440972 m!427389))

(declare-fun m!427391 () Bool)

(assert (=> b!440970 m!427391))

(declare-fun m!427393 () Bool)

(assert (=> b!440966 m!427393))

(declare-fun m!427395 () Bool)

(assert (=> start!40214 m!427395))

(declare-fun m!427397 () Bool)

(assert (=> start!40214 m!427397))

(declare-fun m!427399 () Bool)

(assert (=> b!440969 m!427399))

(declare-fun m!427401 () Bool)

(assert (=> b!440969 m!427401))

(declare-fun m!427403 () Bool)

(assert (=> b!440969 m!427403))

(declare-fun m!427405 () Bool)

(assert (=> b!440968 m!427405))

(declare-fun m!427407 () Bool)

(assert (=> b!440976 m!427407))

(declare-fun m!427409 () Bool)

(assert (=> b!440978 m!427409))

(declare-fun m!427411 () Bool)

(assert (=> b!440971 m!427411))

(declare-fun m!427413 () Bool)

(assert (=> b!440971 m!427413))

(assert (=> b!440971 m!427413))

(declare-fun m!427415 () Bool)

(assert (=> b!440971 m!427415))

(declare-fun m!427417 () Bool)

(assert (=> b!440971 m!427417))

(declare-fun m!427419 () Bool)

(assert (=> mapNonEmpty!19092 m!427419))

(check-sat (not b!440971) (not b!440969) (not b!440966) (not b!440974) (not b!440973) (not b!440970) tp_is_empty!11647 (not b!440978) b_and!18437 (not b_next!10495) (not b!440972) (not mapNonEmpty!19092) (not b!440976) (not start!40214))
(check-sat b_and!18437 (not b_next!10495))
