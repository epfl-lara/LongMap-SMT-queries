; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39242 () Bool)

(assert start!39242)

(declare-fun b_free!9523 () Bool)

(declare-fun b_next!9523 () Bool)

(assert (=> start!39242 (= b_free!9523 (not b_next!9523))))

(declare-fun tp!34098 () Bool)

(declare-fun b_and!16895 () Bool)

(assert (=> start!39242 (= tp!34098 b_and!16895)))

(declare-fun b!414445 () Bool)

(declare-fun res!241047 () Bool)

(declare-fun e!247643 () Bool)

(assert (=> b!414445 (=> (not res!241047) (not e!247643))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414445 (= res!241047 (bvsle from!863 i!563))))

(declare-fun b!414446 () Bool)

(declare-fun e!247638 () Bool)

(declare-datatypes ((V!15339 0))(
  ( (V!15340 (val!5382 Int)) )
))
(declare-datatypes ((tuple2!6986 0))(
  ( (tuple2!6987 (_1!3504 (_ BitVec 64)) (_2!3504 V!15339)) )
))
(declare-datatypes ((List!6998 0))(
  ( (Nil!6995) (Cons!6994 (h!7850 tuple2!6986) (t!12177 List!6998)) )
))
(declare-datatypes ((ListLongMap!5889 0))(
  ( (ListLongMap!5890 (toList!2960 List!6998)) )
))
(declare-fun call!28723 () ListLongMap!5889)

(declare-fun call!28722 () ListLongMap!5889)

(assert (=> b!414446 (= e!247638 (= call!28723 call!28722))))

(declare-fun res!241041 () Bool)

(declare-fun e!247639 () Bool)

(assert (=> start!39242 (=> (not res!241041) (not e!247639))))

(declare-datatypes ((array!25197 0))(
  ( (array!25198 (arr!12048 (Array (_ BitVec 32) (_ BitVec 64))) (size!12401 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25197)

(assert (=> start!39242 (= res!241041 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12401 _keys!709))))))

(assert (=> start!39242 e!247639))

(declare-fun tp_is_empty!10675 () Bool)

(assert (=> start!39242 tp_is_empty!10675))

(assert (=> start!39242 tp!34098))

(assert (=> start!39242 true))

(declare-datatypes ((ValueCell!4994 0))(
  ( (ValueCellFull!4994 (v!7623 V!15339)) (EmptyCell!4994) )
))
(declare-datatypes ((array!25199 0))(
  ( (array!25200 (arr!12049 (Array (_ BitVec 32) ValueCell!4994)) (size!12402 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25199)

(declare-fun e!247637 () Bool)

(declare-fun array_inv!8836 (array!25199) Bool)

(assert (=> start!39242 (and (array_inv!8836 _values!549) e!247637)))

(declare-fun array_inv!8837 (array!25197) Bool)

(assert (=> start!39242 (array_inv!8837 _keys!709)))

(declare-fun b!414447 () Bool)

(declare-fun e!247641 () Bool)

(declare-fun mapRes!17634 () Bool)

(assert (=> b!414447 (= e!247637 (and e!247641 mapRes!17634))))

(declare-fun condMapEmpty!17634 () Bool)

(declare-fun mapDefault!17634 () ValueCell!4994)

(assert (=> b!414447 (= condMapEmpty!17634 (= (arr!12049 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4994)) mapDefault!17634)))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!414448 () Bool)

(declare-fun v!412 () V!15339)

(declare-fun +!1195 (ListLongMap!5889 tuple2!6986) ListLongMap!5889)

(assert (=> b!414448 (= e!247638 (= call!28722 (+!1195 call!28723 (tuple2!6987 k0!794 v!412))))))

(declare-fun mapIsEmpty!17634 () Bool)

(assert (=> mapIsEmpty!17634 mapRes!17634))

(declare-fun b!414449 () Bool)

(declare-fun e!247640 () Bool)

(assert (=> b!414449 (= e!247640 true)))

(declare-fun lt!189838 () array!25199)

(declare-fun minValue!515 () V!15339)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15339)

(declare-fun lt!189837 () array!25197)

(declare-fun lt!189839 () ListLongMap!5889)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1172 (array!25197 array!25199 (_ BitVec 32) (_ BitVec 32) V!15339 V!15339 (_ BitVec 32) Int) ListLongMap!5889)

(declare-fun get!5937 (ValueCell!4994 V!15339) V!15339)

(declare-fun dynLambda!645 (Int (_ BitVec 64)) V!15339)

(assert (=> b!414449 (= lt!189839 (+!1195 (getCurrentListMapNoExtraKeys!1172 lt!189837 lt!189838 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6987 (select (arr!12048 lt!189837) from!863) (get!5937 (select (arr!12049 lt!189838) from!863) (dynLambda!645 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414450 () Bool)

(declare-fun res!241046 () Bool)

(assert (=> b!414450 (=> (not res!241046) (not e!247639))))

(assert (=> b!414450 (= res!241046 (or (= (select (arr!12048 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12048 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414451 () Bool)

(assert (=> b!414451 (= e!247641 tp_is_empty!10675)))

(declare-fun b!414452 () Bool)

(assert (=> b!414452 (= e!247639 e!247643)))

(declare-fun res!241049 () Bool)

(assert (=> b!414452 (=> (not res!241049) (not e!247643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25197 (_ BitVec 32)) Bool)

(assert (=> b!414452 (= res!241049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189837 mask!1025))))

(assert (=> b!414452 (= lt!189837 (array!25198 (store (arr!12048 _keys!709) i!563 k0!794) (size!12401 _keys!709)))))

(declare-fun b!414453 () Bool)

(declare-fun e!247642 () Bool)

(assert (=> b!414453 (= e!247642 (not e!247640))))

(declare-fun res!241045 () Bool)

(assert (=> b!414453 (=> res!241045 e!247640)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414453 (= res!241045 (validKeyInArray!0 (select (arr!12048 _keys!709) from!863)))))

(assert (=> b!414453 e!247638))

(declare-fun c!54927 () Bool)

(assert (=> b!414453 (= c!54927 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12234 0))(
  ( (Unit!12235) )
))
(declare-fun lt!189836 () Unit!12234)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!380 (array!25197 array!25199 (_ BitVec 32) (_ BitVec 32) V!15339 V!15339 (_ BitVec 32) (_ BitVec 64) V!15339 (_ BitVec 32) Int) Unit!12234)

(assert (=> b!414453 (= lt!189836 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414454 () Bool)

(declare-fun e!247644 () Bool)

(assert (=> b!414454 (= e!247644 tp_is_empty!10675)))

(declare-fun b!414455 () Bool)

(declare-fun res!241040 () Bool)

(assert (=> b!414455 (=> (not res!241040) (not e!247639))))

(declare-fun arrayContainsKey!0 (array!25197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414455 (= res!241040 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414456 () Bool)

(declare-fun res!241037 () Bool)

(assert (=> b!414456 (=> (not res!241037) (not e!247639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414456 (= res!241037 (validMask!0 mask!1025))))

(declare-fun bm!28719 () Bool)

(assert (=> bm!28719 (= call!28722 (getCurrentListMapNoExtraKeys!1172 (ite c!54927 lt!189837 _keys!709) (ite c!54927 lt!189838 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414457 () Bool)

(declare-fun res!241048 () Bool)

(assert (=> b!414457 (=> (not res!241048) (not e!247639))))

(declare-datatypes ((List!6999 0))(
  ( (Nil!6996) (Cons!6995 (h!7851 (_ BitVec 64)) (t!12178 List!6999)) )
))
(declare-fun arrayNoDuplicates!0 (array!25197 (_ BitVec 32) List!6999) Bool)

(assert (=> b!414457 (= res!241048 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6996))))

(declare-fun mapNonEmpty!17634 () Bool)

(declare-fun tp!34097 () Bool)

(assert (=> mapNonEmpty!17634 (= mapRes!17634 (and tp!34097 e!247644))))

(declare-fun mapRest!17634 () (Array (_ BitVec 32) ValueCell!4994))

(declare-fun mapValue!17634 () ValueCell!4994)

(declare-fun mapKey!17634 () (_ BitVec 32))

(assert (=> mapNonEmpty!17634 (= (arr!12049 _values!549) (store mapRest!17634 mapKey!17634 mapValue!17634))))

(declare-fun b!414458 () Bool)

(declare-fun res!241044 () Bool)

(assert (=> b!414458 (=> (not res!241044) (not e!247643))))

(assert (=> b!414458 (= res!241044 (arrayNoDuplicates!0 lt!189837 #b00000000000000000000000000000000 Nil!6996))))

(declare-fun b!414459 () Bool)

(declare-fun res!241050 () Bool)

(assert (=> b!414459 (=> (not res!241050) (not e!247639))))

(assert (=> b!414459 (= res!241050 (and (= (size!12402 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12401 _keys!709) (size!12402 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414460 () Bool)

(declare-fun res!241042 () Bool)

(assert (=> b!414460 (=> (not res!241042) (not e!247639))))

(assert (=> b!414460 (= res!241042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414461 () Bool)

(assert (=> b!414461 (= e!247643 e!247642)))

(declare-fun res!241043 () Bool)

(assert (=> b!414461 (=> (not res!241043) (not e!247642))))

(assert (=> b!414461 (= res!241043 (= from!863 i!563))))

(assert (=> b!414461 (= lt!189839 (getCurrentListMapNoExtraKeys!1172 lt!189837 lt!189838 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414461 (= lt!189838 (array!25200 (store (arr!12049 _values!549) i!563 (ValueCellFull!4994 v!412)) (size!12402 _values!549)))))

(declare-fun lt!189835 () ListLongMap!5889)

(assert (=> b!414461 (= lt!189835 (getCurrentListMapNoExtraKeys!1172 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28720 () Bool)

(assert (=> bm!28720 (= call!28723 (getCurrentListMapNoExtraKeys!1172 (ite c!54927 _keys!709 lt!189837) (ite c!54927 _values!549 lt!189838) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414462 () Bool)

(declare-fun res!241038 () Bool)

(assert (=> b!414462 (=> (not res!241038) (not e!247639))))

(assert (=> b!414462 (= res!241038 (validKeyInArray!0 k0!794))))

(declare-fun b!414463 () Bool)

(declare-fun res!241039 () Bool)

(assert (=> b!414463 (=> (not res!241039) (not e!247639))))

(assert (=> b!414463 (= res!241039 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12401 _keys!709))))))

(assert (= (and start!39242 res!241041) b!414456))

(assert (= (and b!414456 res!241037) b!414459))

(assert (= (and b!414459 res!241050) b!414460))

(assert (= (and b!414460 res!241042) b!414457))

(assert (= (and b!414457 res!241048) b!414463))

(assert (= (and b!414463 res!241039) b!414462))

(assert (= (and b!414462 res!241038) b!414450))

(assert (= (and b!414450 res!241046) b!414455))

(assert (= (and b!414455 res!241040) b!414452))

(assert (= (and b!414452 res!241049) b!414458))

(assert (= (and b!414458 res!241044) b!414445))

(assert (= (and b!414445 res!241047) b!414461))

(assert (= (and b!414461 res!241043) b!414453))

(assert (= (and b!414453 c!54927) b!414448))

(assert (= (and b!414453 (not c!54927)) b!414446))

(assert (= (or b!414448 b!414446) bm!28719))

(assert (= (or b!414448 b!414446) bm!28720))

(assert (= (and b!414453 (not res!241045)) b!414449))

(assert (= (and b!414447 condMapEmpty!17634) mapIsEmpty!17634))

(assert (= (and b!414447 (not condMapEmpty!17634)) mapNonEmpty!17634))

(get-info :version)

(assert (= (and mapNonEmpty!17634 ((_ is ValueCellFull!4994) mapValue!17634)) b!414454))

(assert (= (and b!414447 ((_ is ValueCellFull!4994) mapDefault!17634)) b!414451))

(assert (= start!39242 b!414447))

(declare-fun b_lambda!8809 () Bool)

(assert (=> (not b_lambda!8809) (not b!414449)))

(declare-fun t!12176 () Bool)

(declare-fun tb!3137 () Bool)

(assert (=> (and start!39242 (= defaultEntry!557 defaultEntry!557) t!12176) tb!3137))

(declare-fun result!5809 () Bool)

(assert (=> tb!3137 (= result!5809 tp_is_empty!10675)))

(assert (=> b!414449 t!12176))

(declare-fun b_and!16897 () Bool)

(assert (= b_and!16895 (and (=> t!12176 result!5809) b_and!16897)))

(declare-fun m!403191 () Bool)

(assert (=> bm!28720 m!403191))

(declare-fun m!403193 () Bool)

(assert (=> b!414460 m!403193))

(declare-fun m!403195 () Bool)

(assert (=> mapNonEmpty!17634 m!403195))

(declare-fun m!403197 () Bool)

(assert (=> b!414456 m!403197))

(declare-fun m!403199 () Bool)

(assert (=> b!414449 m!403199))

(declare-fun m!403201 () Bool)

(assert (=> b!414449 m!403201))

(declare-fun m!403203 () Bool)

(assert (=> b!414449 m!403203))

(declare-fun m!403205 () Bool)

(assert (=> b!414449 m!403205))

(assert (=> b!414449 m!403199))

(declare-fun m!403207 () Bool)

(assert (=> b!414449 m!403207))

(assert (=> b!414449 m!403201))

(assert (=> b!414449 m!403203))

(declare-fun m!403209 () Bool)

(assert (=> b!414449 m!403209))

(declare-fun m!403211 () Bool)

(assert (=> b!414457 m!403211))

(declare-fun m!403213 () Bool)

(assert (=> b!414450 m!403213))

(declare-fun m!403215 () Bool)

(assert (=> bm!28719 m!403215))

(declare-fun m!403217 () Bool)

(assert (=> b!414448 m!403217))

(declare-fun m!403219 () Bool)

(assert (=> b!414453 m!403219))

(assert (=> b!414453 m!403219))

(declare-fun m!403221 () Bool)

(assert (=> b!414453 m!403221))

(declare-fun m!403223 () Bool)

(assert (=> b!414453 m!403223))

(declare-fun m!403225 () Bool)

(assert (=> b!414462 m!403225))

(declare-fun m!403227 () Bool)

(assert (=> b!414461 m!403227))

(declare-fun m!403229 () Bool)

(assert (=> b!414461 m!403229))

(declare-fun m!403231 () Bool)

(assert (=> b!414461 m!403231))

(declare-fun m!403233 () Bool)

(assert (=> b!414452 m!403233))

(declare-fun m!403235 () Bool)

(assert (=> b!414452 m!403235))

(declare-fun m!403237 () Bool)

(assert (=> b!414458 m!403237))

(declare-fun m!403239 () Bool)

(assert (=> start!39242 m!403239))

(declare-fun m!403241 () Bool)

(assert (=> start!39242 m!403241))

(declare-fun m!403243 () Bool)

(assert (=> b!414455 m!403243))

(check-sat b_and!16897 (not b!414455) (not b!414456) (not b!414458) (not b_lambda!8809) (not mapNonEmpty!17634) (not bm!28720) (not b_next!9523) (not b!414462) (not b!414453) (not b!414452) (not start!39242) (not b!414460) (not b!414461) (not b!414449) (not b!414457) (not bm!28719) (not b!414448) tp_is_empty!10675)
(check-sat b_and!16897 (not b_next!9523))
