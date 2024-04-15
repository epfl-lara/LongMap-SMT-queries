; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39248 () Bool)

(assert start!39248)

(declare-fun b_free!9529 () Bool)

(declare-fun b_next!9529 () Bool)

(assert (=> start!39248 (= b_free!9529 (not b_next!9529))))

(declare-fun tp!34116 () Bool)

(declare-fun b_and!16907 () Bool)

(assert (=> start!39248 (= tp!34116 b_and!16907)))

(declare-datatypes ((V!15347 0))(
  ( (V!15348 (val!5385 Int)) )
))
(declare-datatypes ((tuple2!6990 0))(
  ( (tuple2!6991 (_1!3506 (_ BitVec 64)) (_2!3506 V!15347)) )
))
(declare-datatypes ((List!7003 0))(
  ( (Nil!7000) (Cons!6999 (h!7855 tuple2!6990) (t!12188 List!7003)) )
))
(declare-datatypes ((ListLongMap!5893 0))(
  ( (ListLongMap!5894 (toList!2962 List!7003)) )
))
(declare-fun call!28740 () ListLongMap!5893)

(declare-fun e!247719 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28741 () ListLongMap!5893)

(declare-fun b!414622 () Bool)

(declare-fun v!412 () V!15347)

(declare-fun +!1197 (ListLongMap!5893 tuple2!6990) ListLongMap!5893)

(assert (=> b!414622 (= e!247719 (= call!28741 (+!1197 call!28740 (tuple2!6991 k0!794 v!412))))))

(declare-fun mapNonEmpty!17643 () Bool)

(declare-fun mapRes!17643 () Bool)

(declare-fun tp!34115 () Bool)

(declare-fun e!247724 () Bool)

(assert (=> mapNonEmpty!17643 (= mapRes!17643 (and tp!34115 e!247724))))

(declare-datatypes ((ValueCell!4997 0))(
  ( (ValueCellFull!4997 (v!7626 V!15347)) (EmptyCell!4997) )
))
(declare-fun mapValue!17643 () ValueCell!4997)

(declare-fun mapRest!17643 () (Array (_ BitVec 32) ValueCell!4997))

(declare-datatypes ((array!25209 0))(
  ( (array!25210 (arr!12054 (Array (_ BitVec 32) ValueCell!4997)) (size!12407 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25209)

(declare-fun mapKey!17643 () (_ BitVec 32))

(assert (=> mapNonEmpty!17643 (= (arr!12054 _values!549) (store mapRest!17643 mapKey!17643 mapValue!17643))))

(declare-fun b!414623 () Bool)

(declare-fun res!241173 () Bool)

(declare-fun e!247717 () Bool)

(assert (=> b!414623 (=> (not res!241173) (not e!247717))))

(declare-datatypes ((array!25211 0))(
  ( (array!25212 (arr!12055 (Array (_ BitVec 32) (_ BitVec 64))) (size!12408 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25211)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!414623 (= res!241173 (and (= (size!12407 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12408 _keys!709) (size!12407 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414624 () Bool)

(declare-fun res!241163 () Bool)

(assert (=> b!414624 (=> (not res!241163) (not e!247717))))

(declare-fun arrayContainsKey!0 (array!25211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414624 (= res!241163 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414625 () Bool)

(declare-fun tp_is_empty!10681 () Bool)

(assert (=> b!414625 (= e!247724 tp_is_empty!10681)))

(declare-fun minValue!515 () V!15347)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54936 () Bool)

(declare-fun zeroValue!515 () V!15347)

(declare-fun lt!189884 () array!25209)

(declare-fun bm!28737 () Bool)

(declare-fun lt!189880 () array!25211)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1174 (array!25211 array!25209 (_ BitVec 32) (_ BitVec 32) V!15347 V!15347 (_ BitVec 32) Int) ListLongMap!5893)

(assert (=> bm!28737 (= call!28740 (getCurrentListMapNoExtraKeys!1174 (ite c!54936 _keys!709 lt!189880) (ite c!54936 _values!549 lt!189884) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414626 () Bool)

(declare-fun e!247723 () Bool)

(assert (=> b!414626 (= e!247723 true)))

(declare-fun lt!189881 () ListLongMap!5893)

(declare-fun get!5941 (ValueCell!4997 V!15347) V!15347)

(declare-fun dynLambda!647 (Int (_ BitVec 64)) V!15347)

(assert (=> b!414626 (= lt!189881 (+!1197 (getCurrentListMapNoExtraKeys!1174 lt!189880 lt!189884 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6991 (select (arr!12055 lt!189880) from!863) (get!5941 (select (arr!12054 lt!189884) from!863) (dynLambda!647 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414628 () Bool)

(declare-fun e!247718 () Bool)

(declare-fun e!247721 () Bool)

(assert (=> b!414628 (= e!247718 e!247721)))

(declare-fun res!241166 () Bool)

(assert (=> b!414628 (=> (not res!241166) (not e!247721))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414628 (= res!241166 (= from!863 i!563))))

(assert (=> b!414628 (= lt!189881 (getCurrentListMapNoExtraKeys!1174 lt!189880 lt!189884 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414628 (= lt!189884 (array!25210 (store (arr!12054 _values!549) i!563 (ValueCellFull!4997 v!412)) (size!12407 _values!549)))))

(declare-fun lt!189883 () ListLongMap!5893)

(assert (=> b!414628 (= lt!189883 (getCurrentListMapNoExtraKeys!1174 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414629 () Bool)

(declare-fun res!241172 () Bool)

(assert (=> b!414629 (=> (not res!241172) (not e!247718))))

(declare-datatypes ((List!7004 0))(
  ( (Nil!7001) (Cons!7000 (h!7856 (_ BitVec 64)) (t!12189 List!7004)) )
))
(declare-fun arrayNoDuplicates!0 (array!25211 (_ BitVec 32) List!7004) Bool)

(assert (=> b!414629 (= res!241172 (arrayNoDuplicates!0 lt!189880 #b00000000000000000000000000000000 Nil!7001))))

(declare-fun b!414630 () Bool)

(assert (=> b!414630 (= e!247717 e!247718)))

(declare-fun res!241171 () Bool)

(assert (=> b!414630 (=> (not res!241171) (not e!247718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25211 (_ BitVec 32)) Bool)

(assert (=> b!414630 (= res!241171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189880 mask!1025))))

(assert (=> b!414630 (= lt!189880 (array!25212 (store (arr!12055 _keys!709) i!563 k0!794) (size!12408 _keys!709)))))

(declare-fun b!414631 () Bool)

(declare-fun res!241174 () Bool)

(assert (=> b!414631 (=> (not res!241174) (not e!247717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414631 (= res!241174 (validKeyInArray!0 k0!794))))

(declare-fun bm!28738 () Bool)

(assert (=> bm!28738 (= call!28741 (getCurrentListMapNoExtraKeys!1174 (ite c!54936 lt!189880 _keys!709) (ite c!54936 lt!189884 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414632 () Bool)

(assert (=> b!414632 (= e!247719 (= call!28740 call!28741))))

(declare-fun b!414633 () Bool)

(declare-fun res!241165 () Bool)

(assert (=> b!414633 (=> (not res!241165) (not e!247717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414633 (= res!241165 (validMask!0 mask!1025))))

(declare-fun b!414634 () Bool)

(declare-fun res!241169 () Bool)

(assert (=> b!414634 (=> (not res!241169) (not e!247718))))

(assert (=> b!414634 (= res!241169 (bvsle from!863 i!563))))

(declare-fun b!414635 () Bool)

(declare-fun res!241175 () Bool)

(assert (=> b!414635 (=> (not res!241175) (not e!247717))))

(assert (=> b!414635 (= res!241175 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7001))))

(declare-fun b!414636 () Bool)

(declare-fun e!247725 () Bool)

(assert (=> b!414636 (= e!247725 tp_is_empty!10681)))

(declare-fun b!414637 () Bool)

(declare-fun res!241168 () Bool)

(assert (=> b!414637 (=> (not res!241168) (not e!247717))))

(assert (=> b!414637 (= res!241168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414638 () Bool)

(declare-fun res!241176 () Bool)

(assert (=> b!414638 (=> (not res!241176) (not e!247717))))

(assert (=> b!414638 (= res!241176 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12408 _keys!709))))))

(declare-fun b!414627 () Bool)

(declare-fun e!247720 () Bool)

(assert (=> b!414627 (= e!247720 (and e!247725 mapRes!17643))))

(declare-fun condMapEmpty!17643 () Bool)

(declare-fun mapDefault!17643 () ValueCell!4997)

(assert (=> b!414627 (= condMapEmpty!17643 (= (arr!12054 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4997)) mapDefault!17643)))))

(declare-fun res!241164 () Bool)

(assert (=> start!39248 (=> (not res!241164) (not e!247717))))

(assert (=> start!39248 (= res!241164 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12408 _keys!709))))))

(assert (=> start!39248 e!247717))

(assert (=> start!39248 tp_is_empty!10681))

(assert (=> start!39248 tp!34116))

(assert (=> start!39248 true))

(declare-fun array_inv!8840 (array!25209) Bool)

(assert (=> start!39248 (and (array_inv!8840 _values!549) e!247720)))

(declare-fun array_inv!8841 (array!25211) Bool)

(assert (=> start!39248 (array_inv!8841 _keys!709)))

(declare-fun b!414639 () Bool)

(assert (=> b!414639 (= e!247721 (not e!247723))))

(declare-fun res!241170 () Bool)

(assert (=> b!414639 (=> res!241170 e!247723)))

(assert (=> b!414639 (= res!241170 (validKeyInArray!0 (select (arr!12055 _keys!709) from!863)))))

(assert (=> b!414639 e!247719))

(assert (=> b!414639 (= c!54936 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12240 0))(
  ( (Unit!12241) )
))
(declare-fun lt!189882 () Unit!12240)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!383 (array!25211 array!25209 (_ BitVec 32) (_ BitVec 32) V!15347 V!15347 (_ BitVec 32) (_ BitVec 64) V!15347 (_ BitVec 32) Int) Unit!12240)

(assert (=> b!414639 (= lt!189882 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414640 () Bool)

(declare-fun res!241167 () Bool)

(assert (=> b!414640 (=> (not res!241167) (not e!247717))))

(assert (=> b!414640 (= res!241167 (or (= (select (arr!12055 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12055 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17643 () Bool)

(assert (=> mapIsEmpty!17643 mapRes!17643))

(assert (= (and start!39248 res!241164) b!414633))

(assert (= (and b!414633 res!241165) b!414623))

(assert (= (and b!414623 res!241173) b!414637))

(assert (= (and b!414637 res!241168) b!414635))

(assert (= (and b!414635 res!241175) b!414638))

(assert (= (and b!414638 res!241176) b!414631))

(assert (= (and b!414631 res!241174) b!414640))

(assert (= (and b!414640 res!241167) b!414624))

(assert (= (and b!414624 res!241163) b!414630))

(assert (= (and b!414630 res!241171) b!414629))

(assert (= (and b!414629 res!241172) b!414634))

(assert (= (and b!414634 res!241169) b!414628))

(assert (= (and b!414628 res!241166) b!414639))

(assert (= (and b!414639 c!54936) b!414622))

(assert (= (and b!414639 (not c!54936)) b!414632))

(assert (= (or b!414622 b!414632) bm!28738))

(assert (= (or b!414622 b!414632) bm!28737))

(assert (= (and b!414639 (not res!241170)) b!414626))

(assert (= (and b!414627 condMapEmpty!17643) mapIsEmpty!17643))

(assert (= (and b!414627 (not condMapEmpty!17643)) mapNonEmpty!17643))

(get-info :version)

(assert (= (and mapNonEmpty!17643 ((_ is ValueCellFull!4997) mapValue!17643)) b!414625))

(assert (= (and b!414627 ((_ is ValueCellFull!4997) mapDefault!17643)) b!414636))

(assert (= start!39248 b!414627))

(declare-fun b_lambda!8815 () Bool)

(assert (=> (not b_lambda!8815) (not b!414626)))

(declare-fun t!12187 () Bool)

(declare-fun tb!3143 () Bool)

(assert (=> (and start!39248 (= defaultEntry!557 defaultEntry!557) t!12187) tb!3143))

(declare-fun result!5821 () Bool)

(assert (=> tb!3143 (= result!5821 tp_is_empty!10681)))

(assert (=> b!414626 t!12187))

(declare-fun b_and!16909 () Bool)

(assert (= b_and!16907 (and (=> t!12187 result!5821) b_and!16909)))

(declare-fun m!403351 () Bool)

(assert (=> b!414633 m!403351))

(declare-fun m!403353 () Bool)

(assert (=> b!414639 m!403353))

(assert (=> b!414639 m!403353))

(declare-fun m!403355 () Bool)

(assert (=> b!414639 m!403355))

(declare-fun m!403357 () Bool)

(assert (=> b!414639 m!403357))

(declare-fun m!403359 () Bool)

(assert (=> b!414637 m!403359))

(declare-fun m!403361 () Bool)

(assert (=> b!414626 m!403361))

(declare-fun m!403363 () Bool)

(assert (=> b!414626 m!403363))

(declare-fun m!403365 () Bool)

(assert (=> b!414626 m!403365))

(declare-fun m!403367 () Bool)

(assert (=> b!414626 m!403367))

(assert (=> b!414626 m!403367))

(declare-fun m!403369 () Bool)

(assert (=> b!414626 m!403369))

(assert (=> b!414626 m!403363))

(assert (=> b!414626 m!403365))

(declare-fun m!403371 () Bool)

(assert (=> b!414626 m!403371))

(declare-fun m!403373 () Bool)

(assert (=> b!414631 m!403373))

(declare-fun m!403375 () Bool)

(assert (=> b!414629 m!403375))

(declare-fun m!403377 () Bool)

(assert (=> bm!28737 m!403377))

(declare-fun m!403379 () Bool)

(assert (=> b!414640 m!403379))

(declare-fun m!403381 () Bool)

(assert (=> b!414622 m!403381))

(declare-fun m!403383 () Bool)

(assert (=> bm!28738 m!403383))

(declare-fun m!403385 () Bool)

(assert (=> b!414635 m!403385))

(declare-fun m!403387 () Bool)

(assert (=> b!414628 m!403387))

(declare-fun m!403389 () Bool)

(assert (=> b!414628 m!403389))

(declare-fun m!403391 () Bool)

(assert (=> b!414628 m!403391))

(declare-fun m!403393 () Bool)

(assert (=> b!414630 m!403393))

(declare-fun m!403395 () Bool)

(assert (=> b!414630 m!403395))

(declare-fun m!403397 () Bool)

(assert (=> start!39248 m!403397))

(declare-fun m!403399 () Bool)

(assert (=> start!39248 m!403399))

(declare-fun m!403401 () Bool)

(assert (=> mapNonEmpty!17643 m!403401))

(declare-fun m!403403 () Bool)

(assert (=> b!414624 m!403403))

(check-sat (not b!414629) (not b!414630) (not start!39248) (not b_lambda!8815) (not b!414637) (not b_next!9529) (not b!414639) (not b!414628) tp_is_empty!10681 b_and!16909 (not b!414622) (not b!414626) (not bm!28738) (not bm!28737) (not b!414635) (not mapNonEmpty!17643) (not b!414631) (not b!414624) (not b!414633))
(check-sat b_and!16909 (not b_next!9529))
