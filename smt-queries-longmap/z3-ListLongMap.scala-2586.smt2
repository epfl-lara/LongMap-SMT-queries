; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39320 () Bool)

(assert start!39320)

(declare-fun b_free!9601 () Bool)

(declare-fun b_next!9601 () Bool)

(assert (=> start!39320 (= b_free!9601 (not b_next!9601))))

(declare-fun tp!34332 () Bool)

(declare-fun b_and!17091 () Bool)

(assert (=> start!39320 (= tp!34332 b_and!17091)))

(declare-fun bm!28965 () Bool)

(declare-datatypes ((V!15443 0))(
  ( (V!15444 (val!5421 Int)) )
))
(declare-fun minValue!515 () V!15443)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5033 0))(
  ( (ValueCellFull!5033 (v!7669 V!15443)) (EmptyCell!5033) )
))
(declare-datatypes ((array!25364 0))(
  ( (array!25365 (arr!12131 (Array (_ BitVec 32) ValueCell!5033)) (size!12483 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25364)

(declare-fun zeroValue!515 () V!15443)

(declare-datatypes ((array!25366 0))(
  ( (array!25367 (arr!12132 (Array (_ BitVec 32) (_ BitVec 64))) (size!12484 (_ BitVec 32))) )
))
(declare-fun lt!191019 () array!25366)

(declare-fun lt!191013 () array!25364)

(declare-fun _keys!709 () array!25366)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6950 0))(
  ( (tuple2!6951 (_1!3486 (_ BitVec 64)) (_2!3486 V!15443)) )
))
(declare-datatypes ((List!6967 0))(
  ( (Nil!6964) (Cons!6963 (h!7819 tuple2!6950) (t!12225 List!6967)) )
))
(declare-datatypes ((ListLongMap!5865 0))(
  ( (ListLongMap!5866 (toList!2948 List!6967)) )
))
(declare-fun call!28968 () ListLongMap!5865)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!55092 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1195 (array!25366 array!25364 (_ BitVec 32) (_ BitVec 32) V!15443 V!15443 (_ BitVec 32) Int) ListLongMap!5865)

(assert (=> bm!28965 (= call!28968 (getCurrentListMapNoExtraKeys!1195 (ite c!55092 lt!191019 _keys!709) (ite c!55092 lt!191013 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416968 () Bool)

(declare-fun res!242804 () Bool)

(declare-fun e!248831 () Bool)

(assert (=> b!416968 (=> (not res!242804) (not e!248831))))

(declare-datatypes ((List!6968 0))(
  ( (Nil!6965) (Cons!6964 (h!7820 (_ BitVec 64)) (t!12226 List!6968)) )
))
(declare-fun arrayNoDuplicates!0 (array!25366 (_ BitVec 32) List!6968) Bool)

(assert (=> b!416968 (= res!242804 (arrayNoDuplicates!0 lt!191019 #b00000000000000000000000000000000 Nil!6965))))

(declare-fun b!416969 () Bool)

(declare-fun res!242806 () Bool)

(declare-fun e!248833 () Bool)

(assert (=> b!416969 (=> (not res!242806) (not e!248833))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416969 (= res!242806 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12484 _keys!709))))))

(declare-fun mapIsEmpty!17751 () Bool)

(declare-fun mapRes!17751 () Bool)

(assert (=> mapIsEmpty!17751 mapRes!17751))

(declare-fun b!416970 () Bool)

(declare-fun res!242811 () Bool)

(assert (=> b!416970 (=> (not res!242811) (not e!248833))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416970 (= res!242811 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416971 () Bool)

(declare-fun res!242812 () Bool)

(assert (=> b!416971 (=> (not res!242812) (not e!248833))))

(assert (=> b!416971 (= res!242812 (and (= (size!12483 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12484 _keys!709) (size!12483 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416972 () Bool)

(declare-fun res!242807 () Bool)

(assert (=> b!416972 (=> (not res!242807) (not e!248833))))

(assert (=> b!416972 (= res!242807 (or (= (select (arr!12132 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12132 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416973 () Bool)

(declare-fun res!242809 () Bool)

(assert (=> b!416973 (=> (not res!242809) (not e!248833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25366 (_ BitVec 32)) Bool)

(assert (=> b!416973 (= res!242809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416974 () Bool)

(declare-fun e!248839 () Bool)

(declare-fun tp_is_empty!10753 () Bool)

(assert (=> b!416974 (= e!248839 tp_is_empty!10753)))

(declare-fun res!242803 () Bool)

(assert (=> start!39320 (=> (not res!242803) (not e!248833))))

(assert (=> start!39320 (= res!242803 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12484 _keys!709))))))

(assert (=> start!39320 e!248833))

(assert (=> start!39320 tp_is_empty!10753))

(assert (=> start!39320 tp!34332))

(assert (=> start!39320 true))

(declare-fun e!248838 () Bool)

(declare-fun array_inv!8926 (array!25364) Bool)

(assert (=> start!39320 (and (array_inv!8926 _values!549) e!248838)))

(declare-fun array_inv!8927 (array!25366) Bool)

(assert (=> start!39320 (array_inv!8927 _keys!709)))

(declare-fun call!28969 () ListLongMap!5865)

(declare-fun bm!28966 () Bool)

(assert (=> bm!28966 (= call!28969 (getCurrentListMapNoExtraKeys!1195 (ite c!55092 _keys!709 lt!191019) (ite c!55092 _values!549 lt!191013) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416975 () Bool)

(declare-fun e!248835 () Bool)

(assert (=> b!416975 (= e!248838 (and e!248835 mapRes!17751))))

(declare-fun condMapEmpty!17751 () Bool)

(declare-fun mapDefault!17751 () ValueCell!5033)

(assert (=> b!416975 (= condMapEmpty!17751 (= (arr!12131 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5033)) mapDefault!17751)))))

(declare-fun b!416976 () Bool)

(declare-fun e!248837 () Bool)

(assert (=> b!416976 (= e!248837 (= call!28969 call!28968))))

(declare-fun b!416977 () Bool)

(declare-fun res!242810 () Bool)

(assert (=> b!416977 (=> (not res!242810) (not e!248833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416977 (= res!242810 (validKeyInArray!0 k0!794))))

(declare-fun b!416978 () Bool)

(declare-fun e!248834 () Bool)

(assert (=> b!416978 (= e!248831 e!248834)))

(declare-fun res!242808 () Bool)

(assert (=> b!416978 (=> (not res!242808) (not e!248834))))

(assert (=> b!416978 (= res!242808 (= from!863 i!563))))

(declare-fun lt!191015 () ListLongMap!5865)

(assert (=> b!416978 (= lt!191015 (getCurrentListMapNoExtraKeys!1195 lt!191019 lt!191013 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15443)

(assert (=> b!416978 (= lt!191013 (array!25365 (store (arr!12131 _values!549) i!563 (ValueCellFull!5033 v!412)) (size!12483 _values!549)))))

(declare-fun lt!191009 () ListLongMap!5865)

(assert (=> b!416978 (= lt!191009 (getCurrentListMapNoExtraKeys!1195 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416979 () Bool)

(declare-fun res!242802 () Bool)

(assert (=> b!416979 (=> (not res!242802) (not e!248833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416979 (= res!242802 (validMask!0 mask!1025))))

(declare-fun b!416980 () Bool)

(assert (=> b!416980 (= e!248833 e!248831)))

(declare-fun res!242813 () Bool)

(assert (=> b!416980 (=> (not res!242813) (not e!248831))))

(assert (=> b!416980 (= res!242813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191019 mask!1025))))

(assert (=> b!416980 (= lt!191019 (array!25367 (store (arr!12132 _keys!709) i!563 k0!794) (size!12484 _keys!709)))))

(declare-fun b!416981 () Bool)

(declare-fun e!248832 () Bool)

(assert (=> b!416981 (= e!248832 true)))

(declare-fun lt!191014 () V!15443)

(declare-fun lt!191017 () tuple2!6950)

(declare-fun lt!191011 () ListLongMap!5865)

(declare-fun +!1219 (ListLongMap!5865 tuple2!6950) ListLongMap!5865)

(assert (=> b!416981 (= (+!1219 lt!191011 lt!191017) (+!1219 (+!1219 lt!191011 (tuple2!6951 k0!794 lt!191014)) lt!191017))))

(declare-fun lt!191012 () V!15443)

(assert (=> b!416981 (= lt!191017 (tuple2!6951 k0!794 lt!191012))))

(declare-datatypes ((Unit!12313 0))(
  ( (Unit!12314) )
))
(declare-fun lt!191010 () Unit!12313)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!12 (ListLongMap!5865 (_ BitVec 64) V!15443 V!15443) Unit!12313)

(assert (=> b!416981 (= lt!191010 (addSameAsAddTwiceSameKeyDiffValues!12 lt!191011 k0!794 lt!191014 lt!191012))))

(declare-fun lt!191016 () V!15443)

(declare-fun get!6000 (ValueCell!5033 V!15443) V!15443)

(assert (=> b!416981 (= lt!191014 (get!6000 (select (arr!12131 _values!549) from!863) lt!191016))))

(assert (=> b!416981 (= lt!191015 (+!1219 lt!191011 (tuple2!6951 (select (arr!12132 lt!191019) from!863) lt!191012)))))

(assert (=> b!416981 (= lt!191012 (get!6000 (select (store (arr!12131 _values!549) i!563 (ValueCellFull!5033 v!412)) from!863) lt!191016))))

(declare-fun dynLambda!679 (Int (_ BitVec 64)) V!15443)

(assert (=> b!416981 (= lt!191016 (dynLambda!679 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416981 (= lt!191011 (getCurrentListMapNoExtraKeys!1195 lt!191019 lt!191013 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416982 () Bool)

(declare-fun res!242805 () Bool)

(assert (=> b!416982 (=> (not res!242805) (not e!248833))))

(assert (=> b!416982 (= res!242805 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6965))))

(declare-fun b!416983 () Bool)

(assert (=> b!416983 (= e!248834 (not e!248832))))

(declare-fun res!242814 () Bool)

(assert (=> b!416983 (=> res!242814 e!248832)))

(assert (=> b!416983 (= res!242814 (validKeyInArray!0 (select (arr!12132 _keys!709) from!863)))))

(assert (=> b!416983 e!248837))

(assert (=> b!416983 (= c!55092 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191018 () Unit!12313)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!422 (array!25366 array!25364 (_ BitVec 32) (_ BitVec 32) V!15443 V!15443 (_ BitVec 32) (_ BitVec 64) V!15443 (_ BitVec 32) Int) Unit!12313)

(assert (=> b!416983 (= lt!191018 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!422 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416984 () Bool)

(declare-fun res!242801 () Bool)

(assert (=> b!416984 (=> (not res!242801) (not e!248831))))

(assert (=> b!416984 (= res!242801 (bvsle from!863 i!563))))

(declare-fun b!416985 () Bool)

(assert (=> b!416985 (= e!248835 tp_is_empty!10753)))

(declare-fun b!416986 () Bool)

(assert (=> b!416986 (= e!248837 (= call!28968 (+!1219 call!28969 (tuple2!6951 k0!794 v!412))))))

(declare-fun mapNonEmpty!17751 () Bool)

(declare-fun tp!34331 () Bool)

(assert (=> mapNonEmpty!17751 (= mapRes!17751 (and tp!34331 e!248839))))

(declare-fun mapValue!17751 () ValueCell!5033)

(declare-fun mapRest!17751 () (Array (_ BitVec 32) ValueCell!5033))

(declare-fun mapKey!17751 () (_ BitVec 32))

(assert (=> mapNonEmpty!17751 (= (arr!12131 _values!549) (store mapRest!17751 mapKey!17751 mapValue!17751))))

(assert (= (and start!39320 res!242803) b!416979))

(assert (= (and b!416979 res!242802) b!416971))

(assert (= (and b!416971 res!242812) b!416973))

(assert (= (and b!416973 res!242809) b!416982))

(assert (= (and b!416982 res!242805) b!416969))

(assert (= (and b!416969 res!242806) b!416977))

(assert (= (and b!416977 res!242810) b!416972))

(assert (= (and b!416972 res!242807) b!416970))

(assert (= (and b!416970 res!242811) b!416980))

(assert (= (and b!416980 res!242813) b!416968))

(assert (= (and b!416968 res!242804) b!416984))

(assert (= (and b!416984 res!242801) b!416978))

(assert (= (and b!416978 res!242808) b!416983))

(assert (= (and b!416983 c!55092) b!416986))

(assert (= (and b!416983 (not c!55092)) b!416976))

(assert (= (or b!416986 b!416976) bm!28965))

(assert (= (or b!416986 b!416976) bm!28966))

(assert (= (and b!416983 (not res!242814)) b!416981))

(assert (= (and b!416975 condMapEmpty!17751) mapIsEmpty!17751))

(assert (= (and b!416975 (not condMapEmpty!17751)) mapNonEmpty!17751))

(get-info :version)

(assert (= (and mapNonEmpty!17751 ((_ is ValueCellFull!5033) mapValue!17751)) b!416974))

(assert (= (and b!416975 ((_ is ValueCellFull!5033) mapDefault!17751)) b!416985))

(assert (= start!39320 b!416975))

(declare-fun b_lambda!8927 () Bool)

(assert (=> (not b_lambda!8927) (not b!416981)))

(declare-fun t!12224 () Bool)

(declare-fun tb!3215 () Bool)

(assert (=> (and start!39320 (= defaultEntry!557 defaultEntry!557) t!12224) tb!3215))

(declare-fun result!5965 () Bool)

(assert (=> tb!3215 (= result!5965 tp_is_empty!10753)))

(assert (=> b!416981 t!12224))

(declare-fun b_and!17093 () Bool)

(assert (= b_and!17091 (and (=> t!12224 result!5965) b_and!17093)))

(declare-fun m!406465 () Bool)

(assert (=> start!39320 m!406465))

(declare-fun m!406467 () Bool)

(assert (=> start!39320 m!406467))

(declare-fun m!406469 () Bool)

(assert (=> b!416973 m!406469))

(declare-fun m!406471 () Bool)

(assert (=> b!416986 m!406471))

(declare-fun m!406473 () Bool)

(assert (=> b!416978 m!406473))

(declare-fun m!406475 () Bool)

(assert (=> b!416978 m!406475))

(declare-fun m!406477 () Bool)

(assert (=> b!416978 m!406477))

(declare-fun m!406479 () Bool)

(assert (=> bm!28965 m!406479))

(declare-fun m!406481 () Bool)

(assert (=> b!416970 m!406481))

(declare-fun m!406483 () Bool)

(assert (=> b!416981 m!406483))

(declare-fun m!406485 () Bool)

(assert (=> b!416981 m!406485))

(declare-fun m!406487 () Bool)

(assert (=> b!416981 m!406487))

(declare-fun m!406489 () Bool)

(assert (=> b!416981 m!406489))

(assert (=> b!416981 m!406475))

(declare-fun m!406491 () Bool)

(assert (=> b!416981 m!406491))

(declare-fun m!406493 () Bool)

(assert (=> b!416981 m!406493))

(assert (=> b!416981 m!406491))

(assert (=> b!416981 m!406483))

(declare-fun m!406495 () Bool)

(assert (=> b!416981 m!406495))

(declare-fun m!406497 () Bool)

(assert (=> b!416981 m!406497))

(declare-fun m!406499 () Bool)

(assert (=> b!416981 m!406499))

(declare-fun m!406501 () Bool)

(assert (=> b!416981 m!406501))

(declare-fun m!406503 () Bool)

(assert (=> b!416981 m!406503))

(declare-fun m!406505 () Bool)

(assert (=> b!416981 m!406505))

(assert (=> b!416981 m!406501))

(declare-fun m!406507 () Bool)

(assert (=> b!416983 m!406507))

(assert (=> b!416983 m!406507))

(declare-fun m!406509 () Bool)

(assert (=> b!416983 m!406509))

(declare-fun m!406511 () Bool)

(assert (=> b!416983 m!406511))

(declare-fun m!406513 () Bool)

(assert (=> b!416977 m!406513))

(declare-fun m!406515 () Bool)

(assert (=> b!416968 m!406515))

(declare-fun m!406517 () Bool)

(assert (=> b!416972 m!406517))

(declare-fun m!406519 () Bool)

(assert (=> bm!28966 m!406519))

(declare-fun m!406521 () Bool)

(assert (=> b!416980 m!406521))

(declare-fun m!406523 () Bool)

(assert (=> b!416980 m!406523))

(declare-fun m!406525 () Bool)

(assert (=> b!416982 m!406525))

(declare-fun m!406527 () Bool)

(assert (=> mapNonEmpty!17751 m!406527))

(declare-fun m!406529 () Bool)

(assert (=> b!416979 m!406529))

(check-sat (not start!39320) (not b!416978) (not b!416981) (not b!416979) (not bm!28966) (not b!416973) (not b!416968) (not mapNonEmpty!17751) (not b!416986) (not b_next!9601) (not bm!28965) (not b!416982) (not b!416983) (not b!416977) (not b!416980) tp_is_empty!10753 (not b!416970) b_and!17093 (not b_lambda!8927))
(check-sat b_and!17093 (not b_next!9601))
