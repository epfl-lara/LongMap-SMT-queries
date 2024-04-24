; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39362 () Bool)

(assert start!39362)

(declare-fun b_free!9643 () Bool)

(declare-fun b_next!9643 () Bool)

(assert (=> start!39362 (= b_free!9643 (not b_next!9643))))

(declare-fun tp!34458 () Bool)

(declare-fun b_and!17175 () Bool)

(assert (=> start!39362 (= tp!34458 b_and!17175)))

(declare-fun b!418207 () Bool)

(declare-fun res!243689 () Bool)

(declare-fun e!249402 () Bool)

(assert (=> b!418207 (=> (not res!243689) (not e!249402))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418207 (= res!243689 (validKeyInArray!0 k0!794))))

(declare-fun b!418208 () Bool)

(declare-fun res!243692 () Bool)

(assert (=> b!418208 (=> (not res!243692) (not e!249402))))

(declare-datatypes ((array!25448 0))(
  ( (array!25449 (arr!12173 (Array (_ BitVec 32) (_ BitVec 64))) (size!12525 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25448)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25448 (_ BitVec 32)) Bool)

(assert (=> b!418208 (= res!243692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418209 () Bool)

(declare-fun res!243695 () Bool)

(declare-fun e!249406 () Bool)

(assert (=> b!418209 (=> (not res!243695) (not e!249406))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418209 (= res!243695 (bvsle from!863 i!563))))

(declare-fun b!418210 () Bool)

(declare-fun res!243687 () Bool)

(assert (=> b!418210 (=> (not res!243687) (not e!249402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418210 (= res!243687 (validMask!0 mask!1025))))

(declare-fun b!418211 () Bool)

(declare-fun e!249398 () Bool)

(assert (=> b!418211 (= e!249406 e!249398)))

(declare-fun res!243684 () Bool)

(assert (=> b!418211 (=> (not res!243684) (not e!249398))))

(assert (=> b!418211 (= res!243684 (= from!863 i!563))))

(declare-datatypes ((V!15499 0))(
  ( (V!15500 (val!5442 Int)) )
))
(declare-fun minValue!515 () V!15499)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15499)

(declare-fun lt!191709 () array!25448)

(declare-datatypes ((ValueCell!5054 0))(
  ( (ValueCellFull!5054 (v!7690 V!15499)) (EmptyCell!5054) )
))
(declare-datatypes ((array!25450 0))(
  ( (array!25451 (arr!12174 (Array (_ BitVec 32) ValueCell!5054)) (size!12526 (_ BitVec 32))) )
))
(declare-fun lt!191710 () array!25450)

(declare-datatypes ((tuple2!6990 0))(
  ( (tuple2!6991 (_1!3506 (_ BitVec 64)) (_2!3506 V!15499)) )
))
(declare-datatypes ((List!7003 0))(
  ( (Nil!7000) (Cons!6999 (h!7855 tuple2!6990) (t!12303 List!7003)) )
))
(declare-datatypes ((ListLongMap!5905 0))(
  ( (ListLongMap!5906 (toList!2968 List!7003)) )
))
(declare-fun lt!191712 () ListLongMap!5905)

(declare-fun getCurrentListMapNoExtraKeys!1214 (array!25448 array!25450 (_ BitVec 32) (_ BitVec 32) V!15499 V!15499 (_ BitVec 32) Int) ListLongMap!5905)

(assert (=> b!418211 (= lt!191712 (getCurrentListMapNoExtraKeys!1214 lt!191709 lt!191710 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25450)

(declare-fun v!412 () V!15499)

(assert (=> b!418211 (= lt!191710 (array!25451 (store (arr!12174 _values!549) i!563 (ValueCellFull!5054 v!412)) (size!12526 _values!549)))))

(declare-fun lt!191707 () ListLongMap!5905)

(assert (=> b!418211 (= lt!191707 (getCurrentListMapNoExtraKeys!1214 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418212 () Bool)

(declare-fun res!243686 () Bool)

(assert (=> b!418212 (=> (not res!243686) (not e!249402))))

(declare-fun arrayContainsKey!0 (array!25448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418212 (= res!243686 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418214 () Bool)

(declare-fun e!249403 () Bool)

(assert (=> b!418214 (= e!249398 (not e!249403))))

(declare-fun res!243696 () Bool)

(assert (=> b!418214 (=> res!243696 e!249403)))

(assert (=> b!418214 (= res!243696 (validKeyInArray!0 (select (arr!12173 _keys!709) from!863)))))

(declare-fun e!249405 () Bool)

(assert (=> b!418214 e!249405))

(declare-fun c!55155 () Bool)

(assert (=> b!418214 (= c!55155 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12345 0))(
  ( (Unit!12346) )
))
(declare-fun lt!191708 () Unit!12345)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!430 (array!25448 array!25450 (_ BitVec 32) (_ BitVec 32) V!15499 V!15499 (_ BitVec 32) (_ BitVec 64) V!15499 (_ BitVec 32) Int) Unit!12345)

(assert (=> b!418214 (= lt!191708 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418215 () Bool)

(declare-fun e!249401 () Bool)

(declare-fun tp_is_empty!10795 () Bool)

(assert (=> b!418215 (= e!249401 tp_is_empty!10795)))

(declare-fun b!418216 () Bool)

(declare-fun e!249399 () Bool)

(assert (=> b!418216 (= e!249399 tp_is_empty!10795)))

(declare-fun b!418217 () Bool)

(assert (=> b!418217 (= e!249402 e!249406)))

(declare-fun res!243691 () Bool)

(assert (=> b!418217 (=> (not res!243691) (not e!249406))))

(assert (=> b!418217 (= res!243691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191709 mask!1025))))

(assert (=> b!418217 (= lt!191709 (array!25449 (store (arr!12173 _keys!709) i!563 k0!794) (size!12525 _keys!709)))))

(declare-fun b!418218 () Bool)

(declare-fun res!243688 () Bool)

(assert (=> b!418218 (=> (not res!243688) (not e!249402))))

(assert (=> b!418218 (= res!243688 (or (= (select (arr!12173 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12173 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29091 () Bool)

(declare-fun call!29094 () ListLongMap!5905)

(assert (=> bm!29091 (= call!29094 (getCurrentListMapNoExtraKeys!1214 (ite c!55155 _keys!709 lt!191709) (ite c!55155 _values!549 lt!191710) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418219 () Bool)

(declare-fun res!243694 () Bool)

(assert (=> b!418219 (=> (not res!243694) (not e!249402))))

(assert (=> b!418219 (= res!243694 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12525 _keys!709))))))

(declare-fun call!29095 () ListLongMap!5905)

(declare-fun b!418220 () Bool)

(declare-fun +!1237 (ListLongMap!5905 tuple2!6990) ListLongMap!5905)

(assert (=> b!418220 (= e!249405 (= call!29095 (+!1237 call!29094 (tuple2!6991 k0!794 v!412))))))

(declare-fun b!418221 () Bool)

(declare-fun res!243685 () Bool)

(assert (=> b!418221 (=> (not res!243685) (not e!249402))))

(assert (=> b!418221 (= res!243685 (and (= (size!12526 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12525 _keys!709) (size!12526 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17814 () Bool)

(declare-fun mapRes!17814 () Bool)

(assert (=> mapIsEmpty!17814 mapRes!17814))

(declare-fun b!418222 () Bool)

(declare-fun res!243693 () Bool)

(assert (=> b!418222 (=> (not res!243693) (not e!249406))))

(declare-datatypes ((List!7004 0))(
  ( (Nil!7001) (Cons!7000 (h!7856 (_ BitVec 64)) (t!12304 List!7004)) )
))
(declare-fun arrayNoDuplicates!0 (array!25448 (_ BitVec 32) List!7004) Bool)

(assert (=> b!418222 (= res!243693 (arrayNoDuplicates!0 lt!191709 #b00000000000000000000000000000000 Nil!7001))))

(declare-fun bm!29092 () Bool)

(assert (=> bm!29092 (= call!29095 (getCurrentListMapNoExtraKeys!1214 (ite c!55155 lt!191709 _keys!709) (ite c!55155 lt!191710 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418213 () Bool)

(declare-fun e!249404 () Bool)

(assert (=> b!418213 (= e!249404 (and e!249401 mapRes!17814))))

(declare-fun condMapEmpty!17814 () Bool)

(declare-fun mapDefault!17814 () ValueCell!5054)

(assert (=> b!418213 (= condMapEmpty!17814 (= (arr!12174 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5054)) mapDefault!17814)))))

(declare-fun res!243683 () Bool)

(assert (=> start!39362 (=> (not res!243683) (not e!249402))))

(assert (=> start!39362 (= res!243683 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12525 _keys!709))))))

(assert (=> start!39362 e!249402))

(assert (=> start!39362 tp_is_empty!10795))

(assert (=> start!39362 tp!34458))

(assert (=> start!39362 true))

(declare-fun array_inv!8952 (array!25450) Bool)

(assert (=> start!39362 (and (array_inv!8952 _values!549) e!249404)))

(declare-fun array_inv!8953 (array!25448) Bool)

(assert (=> start!39362 (array_inv!8953 _keys!709)))

(declare-fun b!418223 () Bool)

(assert (=> b!418223 (= e!249405 (= call!29094 call!29095))))

(declare-fun mapNonEmpty!17814 () Bool)

(declare-fun tp!34457 () Bool)

(assert (=> mapNonEmpty!17814 (= mapRes!17814 (and tp!34457 e!249399))))

(declare-fun mapKey!17814 () (_ BitVec 32))

(declare-fun mapValue!17814 () ValueCell!5054)

(declare-fun mapRest!17814 () (Array (_ BitVec 32) ValueCell!5054))

(assert (=> mapNonEmpty!17814 (= (arr!12174 _values!549) (store mapRest!17814 mapKey!17814 mapValue!17814))))

(declare-fun b!418224 () Bool)

(assert (=> b!418224 (= e!249403 true)))

(declare-fun lt!191702 () V!15499)

(declare-fun lt!191705 () tuple2!6990)

(declare-fun lt!191704 () ListLongMap!5905)

(assert (=> b!418224 (= (+!1237 lt!191704 lt!191705) (+!1237 (+!1237 lt!191704 (tuple2!6991 k0!794 lt!191702)) lt!191705))))

(declare-fun lt!191711 () V!15499)

(assert (=> b!418224 (= lt!191705 (tuple2!6991 k0!794 lt!191711))))

(declare-fun lt!191703 () Unit!12345)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!28 (ListLongMap!5905 (_ BitVec 64) V!15499 V!15499) Unit!12345)

(assert (=> b!418224 (= lt!191703 (addSameAsAddTwiceSameKeyDiffValues!28 lt!191704 k0!794 lt!191702 lt!191711))))

(declare-fun lt!191706 () V!15499)

(declare-fun get!6030 (ValueCell!5054 V!15499) V!15499)

(assert (=> b!418224 (= lt!191702 (get!6030 (select (arr!12174 _values!549) from!863) lt!191706))))

(assert (=> b!418224 (= lt!191712 (+!1237 lt!191704 (tuple2!6991 (select (arr!12173 lt!191709) from!863) lt!191711)))))

(assert (=> b!418224 (= lt!191711 (get!6030 (select (store (arr!12174 _values!549) i!563 (ValueCellFull!5054 v!412)) from!863) lt!191706))))

(declare-fun dynLambda!695 (Int (_ BitVec 64)) V!15499)

(assert (=> b!418224 (= lt!191706 (dynLambda!695 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418224 (= lt!191704 (getCurrentListMapNoExtraKeys!1214 lt!191709 lt!191710 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418225 () Bool)

(declare-fun res!243690 () Bool)

(assert (=> b!418225 (=> (not res!243690) (not e!249402))))

(assert (=> b!418225 (= res!243690 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7001))))

(assert (= (and start!39362 res!243683) b!418210))

(assert (= (and b!418210 res!243687) b!418221))

(assert (= (and b!418221 res!243685) b!418208))

(assert (= (and b!418208 res!243692) b!418225))

(assert (= (and b!418225 res!243690) b!418219))

(assert (= (and b!418219 res!243694) b!418207))

(assert (= (and b!418207 res!243689) b!418218))

(assert (= (and b!418218 res!243688) b!418212))

(assert (= (and b!418212 res!243686) b!418217))

(assert (= (and b!418217 res!243691) b!418222))

(assert (= (and b!418222 res!243693) b!418209))

(assert (= (and b!418209 res!243695) b!418211))

(assert (= (and b!418211 res!243684) b!418214))

(assert (= (and b!418214 c!55155) b!418220))

(assert (= (and b!418214 (not c!55155)) b!418223))

(assert (= (or b!418220 b!418223) bm!29092))

(assert (= (or b!418220 b!418223) bm!29091))

(assert (= (and b!418214 (not res!243696)) b!418224))

(assert (= (and b!418213 condMapEmpty!17814) mapIsEmpty!17814))

(assert (= (and b!418213 (not condMapEmpty!17814)) mapNonEmpty!17814))

(get-info :version)

(assert (= (and mapNonEmpty!17814 ((_ is ValueCellFull!5054) mapValue!17814)) b!418216))

(assert (= (and b!418213 ((_ is ValueCellFull!5054) mapDefault!17814)) b!418215))

(assert (= start!39362 b!418213))

(declare-fun b_lambda!8969 () Bool)

(assert (=> (not b_lambda!8969) (not b!418224)))

(declare-fun t!12302 () Bool)

(declare-fun tb!3257 () Bool)

(assert (=> (and start!39362 (= defaultEntry!557 defaultEntry!557) t!12302) tb!3257))

(declare-fun result!6049 () Bool)

(assert (=> tb!3257 (= result!6049 tp_is_empty!10795)))

(assert (=> b!418224 t!12302))

(declare-fun b_and!17177 () Bool)

(assert (= b_and!17175 (and (=> t!12302 result!6049) b_and!17177)))

(declare-fun m!407843 () Bool)

(assert (=> b!418222 m!407843))

(declare-fun m!407845 () Bool)

(assert (=> b!418218 m!407845))

(declare-fun m!407847 () Bool)

(assert (=> b!418210 m!407847))

(declare-fun m!407849 () Bool)

(assert (=> b!418208 m!407849))

(declare-fun m!407851 () Bool)

(assert (=> b!418220 m!407851))

(declare-fun m!407853 () Bool)

(assert (=> b!418224 m!407853))

(declare-fun m!407855 () Bool)

(assert (=> b!418224 m!407855))

(declare-fun m!407857 () Bool)

(assert (=> b!418224 m!407857))

(declare-fun m!407859 () Bool)

(assert (=> b!418224 m!407859))

(declare-fun m!407861 () Bool)

(assert (=> b!418224 m!407861))

(declare-fun m!407863 () Bool)

(assert (=> b!418224 m!407863))

(declare-fun m!407865 () Bool)

(assert (=> b!418224 m!407865))

(assert (=> b!418224 m!407859))

(declare-fun m!407867 () Bool)

(assert (=> b!418224 m!407867))

(assert (=> b!418224 m!407867))

(declare-fun m!407869 () Bool)

(assert (=> b!418224 m!407869))

(declare-fun m!407871 () Bool)

(assert (=> b!418224 m!407871))

(declare-fun m!407873 () Bool)

(assert (=> b!418224 m!407873))

(assert (=> b!418224 m!407863))

(declare-fun m!407875 () Bool)

(assert (=> b!418224 m!407875))

(declare-fun m!407877 () Bool)

(assert (=> b!418224 m!407877))

(declare-fun m!407879 () Bool)

(assert (=> b!418211 m!407879))

(assert (=> b!418211 m!407877))

(declare-fun m!407881 () Bool)

(assert (=> b!418211 m!407881))

(declare-fun m!407883 () Bool)

(assert (=> b!418217 m!407883))

(declare-fun m!407885 () Bool)

(assert (=> b!418217 m!407885))

(declare-fun m!407887 () Bool)

(assert (=> start!39362 m!407887))

(declare-fun m!407889 () Bool)

(assert (=> start!39362 m!407889))

(declare-fun m!407891 () Bool)

(assert (=> b!418214 m!407891))

(assert (=> b!418214 m!407891))

(declare-fun m!407893 () Bool)

(assert (=> b!418214 m!407893))

(declare-fun m!407895 () Bool)

(assert (=> b!418214 m!407895))

(declare-fun m!407897 () Bool)

(assert (=> b!418207 m!407897))

(declare-fun m!407899 () Bool)

(assert (=> b!418212 m!407899))

(declare-fun m!407901 () Bool)

(assert (=> bm!29092 m!407901))

(declare-fun m!407903 () Bool)

(assert (=> b!418225 m!407903))

(declare-fun m!407905 () Bool)

(assert (=> mapNonEmpty!17814 m!407905))

(declare-fun m!407907 () Bool)

(assert (=> bm!29091 m!407907))

(check-sat (not b!418207) (not b!418214) (not b!418208) (not b_next!9643) (not b!418222) (not b!418220) (not mapNonEmpty!17814) (not b!418210) (not bm!29092) (not start!39362) (not b!418212) (not b!418225) (not bm!29091) (not b_lambda!8969) tp_is_empty!10795 (not b!418217) (not b!418211) (not b!418224) b_and!17177)
(check-sat b_and!17177 (not b_next!9643))
