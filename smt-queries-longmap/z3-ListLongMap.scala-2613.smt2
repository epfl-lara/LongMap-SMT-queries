; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39482 () Bool)

(assert start!39482)

(declare-fun b_free!9763 () Bool)

(declare-fun b_next!9763 () Bool)

(assert (=> start!39482 (= b_free!9763 (not b_next!9763))))

(declare-fun tp!34818 () Bool)

(declare-fun b_and!17375 () Bool)

(assert (=> start!39482 (= tp!34818 b_and!17375)))

(declare-fun b!421525 () Bool)

(declare-fun res!246083 () Bool)

(declare-fun e!250882 () Bool)

(assert (=> b!421525 (=> (not res!246083) (not e!250882))))

(declare-datatypes ((array!25661 0))(
  ( (array!25662 (arr!12280 (Array (_ BitVec 32) (_ BitVec 64))) (size!12633 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25661)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25661 (_ BitVec 32)) Bool)

(assert (=> b!421525 (= res!246083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421526 () Bool)

(declare-fun e!250884 () Bool)

(declare-datatypes ((V!15659 0))(
  ( (V!15660 (val!5502 Int)) )
))
(declare-datatypes ((tuple2!7206 0))(
  ( (tuple2!7207 (_1!3614 (_ BitVec 64)) (_2!3614 V!15659)) )
))
(declare-datatypes ((List!7198 0))(
  ( (Nil!7195) (Cons!7194 (h!8050 tuple2!7206) (t!12617 List!7198)) )
))
(declare-datatypes ((ListLongMap!6109 0))(
  ( (ListLongMap!6110 (toList!3070 List!7198)) )
))
(declare-fun call!29443 () ListLongMap!6109)

(declare-fun call!29442 () ListLongMap!6109)

(assert (=> b!421526 (= e!250884 (= call!29443 call!29442))))

(declare-fun b!421527 () Bool)

(declare-fun res!246080 () Bool)

(assert (=> b!421527 (=> (not res!246080) (not e!250882))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421527 (= res!246080 (validKeyInArray!0 k0!794))))

(declare-fun minValue!515 () V!15659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29439 () Bool)

(declare-datatypes ((ValueCell!5114 0))(
  ( (ValueCellFull!5114 (v!7743 V!15659)) (EmptyCell!5114) )
))
(declare-datatypes ((array!25663 0))(
  ( (array!25664 (arr!12281 (Array (_ BitVec 32) ValueCell!5114)) (size!12634 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25663)

(declare-fun zeroValue!515 () V!15659)

(declare-fun lt!193435 () array!25663)

(declare-fun c!55287 () Bool)

(declare-fun lt!193438 () array!25661)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1279 (array!25661 array!25663 (_ BitVec 32) (_ BitVec 32) V!15659 V!15659 (_ BitVec 32) Int) ListLongMap!6109)

(assert (=> bm!29439 (= call!29443 (getCurrentListMapNoExtraKeys!1279 (ite c!55287 _keys!709 lt!193438) (ite c!55287 _values!549 lt!193435) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421528 () Bool)

(declare-fun e!250878 () Bool)

(declare-fun e!250883 () Bool)

(assert (=> b!421528 (= e!250878 (not e!250883))))

(declare-fun res!246079 () Bool)

(assert (=> b!421528 (=> res!246079 e!250883)))

(assert (=> b!421528 (= res!246079 (validKeyInArray!0 (select (arr!12280 _keys!709) from!863)))))

(assert (=> b!421528 e!250884))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421528 (= c!55287 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!15659)

(declare-datatypes ((Unit!12428 0))(
  ( (Unit!12429) )
))
(declare-fun lt!193437 () Unit!12428)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!462 (array!25661 array!25663 (_ BitVec 32) (_ BitVec 32) V!15659 V!15659 (_ BitVec 32) (_ BitVec 64) V!15659 (_ BitVec 32) Int) Unit!12428)

(assert (=> b!421528 (= lt!193437 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!462 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421529 () Bool)

(declare-fun e!250877 () Bool)

(declare-fun tp_is_empty!10915 () Bool)

(assert (=> b!421529 (= e!250877 tp_is_empty!10915)))

(declare-fun res!246082 () Bool)

(assert (=> start!39482 (=> (not res!246082) (not e!250882))))

(assert (=> start!39482 (= res!246082 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12633 _keys!709))))))

(assert (=> start!39482 e!250882))

(assert (=> start!39482 tp_is_empty!10915))

(assert (=> start!39482 tp!34818))

(assert (=> start!39482 true))

(declare-fun e!250876 () Bool)

(declare-fun array_inv!8988 (array!25663) Bool)

(assert (=> start!39482 (and (array_inv!8988 _values!549) e!250876)))

(declare-fun array_inv!8989 (array!25661) Bool)

(assert (=> start!39482 (array_inv!8989 _keys!709)))

(declare-fun mapNonEmpty!17994 () Bool)

(declare-fun mapRes!17994 () Bool)

(declare-fun tp!34817 () Bool)

(assert (=> mapNonEmpty!17994 (= mapRes!17994 (and tp!34817 e!250877))))

(declare-fun mapValue!17994 () ValueCell!5114)

(declare-fun mapRest!17994 () (Array (_ BitVec 32) ValueCell!5114))

(declare-fun mapKey!17994 () (_ BitVec 32))

(assert (=> mapNonEmpty!17994 (= (arr!12281 _values!549) (store mapRest!17994 mapKey!17994 mapValue!17994))))

(declare-fun b!421530 () Bool)

(declare-fun res!246088 () Bool)

(assert (=> b!421530 (=> (not res!246088) (not e!250882))))

(declare-datatypes ((List!7199 0))(
  ( (Nil!7196) (Cons!7195 (h!8051 (_ BitVec 64)) (t!12618 List!7199)) )
))
(declare-fun arrayNoDuplicates!0 (array!25661 (_ BitVec 32) List!7199) Bool)

(assert (=> b!421530 (= res!246088 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7196))))

(declare-fun bm!29440 () Bool)

(assert (=> bm!29440 (= call!29442 (getCurrentListMapNoExtraKeys!1279 (ite c!55287 lt!193438 _keys!709) (ite c!55287 lt!193435 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421531 () Bool)

(declare-fun res!246081 () Bool)

(assert (=> b!421531 (=> (not res!246081) (not e!250882))))

(declare-fun arrayContainsKey!0 (array!25661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421531 (= res!246081 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421532 () Bool)

(declare-fun res!246084 () Bool)

(assert (=> b!421532 (=> (not res!246084) (not e!250882))))

(assert (=> b!421532 (= res!246084 (or (= (select (arr!12280 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12280 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421533 () Bool)

(assert (=> b!421533 (= e!250883 true)))

(declare-fun lt!193429 () tuple2!7206)

(declare-fun lt!193430 () ListLongMap!6109)

(declare-fun lt!193434 () V!15659)

(declare-fun +!1290 (ListLongMap!6109 tuple2!7206) ListLongMap!6109)

(assert (=> b!421533 (= (+!1290 lt!193430 lt!193429) (+!1290 (+!1290 lt!193430 (tuple2!7207 k0!794 lt!193434)) lt!193429))))

(declare-fun lt!193439 () V!15659)

(assert (=> b!421533 (= lt!193429 (tuple2!7207 k0!794 lt!193439))))

(declare-fun lt!193433 () Unit!12428)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!73 (ListLongMap!6109 (_ BitVec 64) V!15659 V!15659) Unit!12428)

(assert (=> b!421533 (= lt!193433 (addSameAsAddTwiceSameKeyDiffValues!73 lt!193430 k0!794 lt!193434 lt!193439))))

(declare-fun lt!193436 () V!15659)

(declare-fun get!6102 (ValueCell!5114 V!15659) V!15659)

(assert (=> b!421533 (= lt!193434 (get!6102 (select (arr!12281 _values!549) from!863) lt!193436))))

(declare-fun lt!193431 () ListLongMap!6109)

(assert (=> b!421533 (= lt!193431 (+!1290 lt!193430 (tuple2!7207 (select (arr!12280 lt!193438) from!863) lt!193439)))))

(assert (=> b!421533 (= lt!193439 (get!6102 (select (store (arr!12281 _values!549) i!563 (ValueCellFull!5114 v!412)) from!863) lt!193436))))

(declare-fun dynLambda!730 (Int (_ BitVec 64)) V!15659)

(assert (=> b!421533 (= lt!193436 (dynLambda!730 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421533 (= lt!193430 (getCurrentListMapNoExtraKeys!1279 lt!193438 lt!193435 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421534 () Bool)

(declare-fun res!246087 () Bool)

(assert (=> b!421534 (=> (not res!246087) (not e!250882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421534 (= res!246087 (validMask!0 mask!1025))))

(declare-fun b!421535 () Bool)

(declare-fun e!250880 () Bool)

(assert (=> b!421535 (= e!250882 e!250880)))

(declare-fun res!246089 () Bool)

(assert (=> b!421535 (=> (not res!246089) (not e!250880))))

(assert (=> b!421535 (= res!246089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193438 mask!1025))))

(assert (=> b!421535 (= lt!193438 (array!25662 (store (arr!12280 _keys!709) i!563 k0!794) (size!12633 _keys!709)))))

(declare-fun b!421536 () Bool)

(declare-fun e!250879 () Bool)

(assert (=> b!421536 (= e!250879 tp_is_empty!10915)))

(declare-fun b!421537 () Bool)

(assert (=> b!421537 (= e!250884 (= call!29442 (+!1290 call!29443 (tuple2!7207 k0!794 v!412))))))

(declare-fun b!421538 () Bool)

(declare-fun res!246077 () Bool)

(assert (=> b!421538 (=> (not res!246077) (not e!250880))))

(assert (=> b!421538 (= res!246077 (arrayNoDuplicates!0 lt!193438 #b00000000000000000000000000000000 Nil!7196))))

(declare-fun b!421539 () Bool)

(assert (=> b!421539 (= e!250880 e!250878)))

(declare-fun res!246086 () Bool)

(assert (=> b!421539 (=> (not res!246086) (not e!250878))))

(assert (=> b!421539 (= res!246086 (= from!863 i!563))))

(assert (=> b!421539 (= lt!193431 (getCurrentListMapNoExtraKeys!1279 lt!193438 lt!193435 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421539 (= lt!193435 (array!25664 (store (arr!12281 _values!549) i!563 (ValueCellFull!5114 v!412)) (size!12634 _values!549)))))

(declare-fun lt!193432 () ListLongMap!6109)

(assert (=> b!421539 (= lt!193432 (getCurrentListMapNoExtraKeys!1279 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421540 () Bool)

(declare-fun res!246085 () Bool)

(assert (=> b!421540 (=> (not res!246085) (not e!250882))))

(assert (=> b!421540 (= res!246085 (and (= (size!12634 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12633 _keys!709) (size!12634 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421541 () Bool)

(declare-fun res!246078 () Bool)

(assert (=> b!421541 (=> (not res!246078) (not e!250882))))

(assert (=> b!421541 (= res!246078 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12633 _keys!709))))))

(declare-fun mapIsEmpty!17994 () Bool)

(assert (=> mapIsEmpty!17994 mapRes!17994))

(declare-fun b!421542 () Bool)

(declare-fun res!246090 () Bool)

(assert (=> b!421542 (=> (not res!246090) (not e!250880))))

(assert (=> b!421542 (= res!246090 (bvsle from!863 i!563))))

(declare-fun b!421543 () Bool)

(assert (=> b!421543 (= e!250876 (and e!250879 mapRes!17994))))

(declare-fun condMapEmpty!17994 () Bool)

(declare-fun mapDefault!17994 () ValueCell!5114)

(assert (=> b!421543 (= condMapEmpty!17994 (= (arr!12281 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5114)) mapDefault!17994)))))

(assert (= (and start!39482 res!246082) b!421534))

(assert (= (and b!421534 res!246087) b!421540))

(assert (= (and b!421540 res!246085) b!421525))

(assert (= (and b!421525 res!246083) b!421530))

(assert (= (and b!421530 res!246088) b!421541))

(assert (= (and b!421541 res!246078) b!421527))

(assert (= (and b!421527 res!246080) b!421532))

(assert (= (and b!421532 res!246084) b!421531))

(assert (= (and b!421531 res!246081) b!421535))

(assert (= (and b!421535 res!246089) b!421538))

(assert (= (and b!421538 res!246077) b!421542))

(assert (= (and b!421542 res!246090) b!421539))

(assert (= (and b!421539 res!246086) b!421528))

(assert (= (and b!421528 c!55287) b!421537))

(assert (= (and b!421528 (not c!55287)) b!421526))

(assert (= (or b!421537 b!421526) bm!29440))

(assert (= (or b!421537 b!421526) bm!29439))

(assert (= (and b!421528 (not res!246079)) b!421533))

(assert (= (and b!421543 condMapEmpty!17994) mapIsEmpty!17994))

(assert (= (and b!421543 (not condMapEmpty!17994)) mapNonEmpty!17994))

(get-info :version)

(assert (= (and mapNonEmpty!17994 ((_ is ValueCellFull!5114) mapValue!17994)) b!421529))

(assert (= (and b!421543 ((_ is ValueCellFull!5114) mapDefault!17994)) b!421536))

(assert (= start!39482 b!421543))

(declare-fun b_lambda!9049 () Bool)

(assert (=> (not b_lambda!9049) (not b!421533)))

(declare-fun t!12616 () Bool)

(declare-fun tb!3377 () Bool)

(assert (=> (and start!39482 (= defaultEntry!557 defaultEntry!557) t!12616) tb!3377))

(declare-fun result!6289 () Bool)

(assert (=> tb!3377 (= result!6289 tp_is_empty!10915)))

(assert (=> b!421533 t!12616))

(declare-fun b_and!17377 () Bool)

(assert (= b_and!17375 (and (=> t!12616 result!6289) b_and!17377)))

(declare-fun m!410847 () Bool)

(assert (=> start!39482 m!410847))

(declare-fun m!410849 () Bool)

(assert (=> start!39482 m!410849))

(declare-fun m!410851 () Bool)

(assert (=> b!421538 m!410851))

(declare-fun m!410853 () Bool)

(assert (=> b!421531 m!410853))

(declare-fun m!410855 () Bool)

(assert (=> bm!29440 m!410855))

(declare-fun m!410857 () Bool)

(assert (=> b!421535 m!410857))

(declare-fun m!410859 () Bool)

(assert (=> b!421535 m!410859))

(declare-fun m!410861 () Bool)

(assert (=> b!421534 m!410861))

(declare-fun m!410863 () Bool)

(assert (=> b!421533 m!410863))

(declare-fun m!410865 () Bool)

(assert (=> b!421533 m!410865))

(declare-fun m!410867 () Bool)

(assert (=> b!421533 m!410867))

(declare-fun m!410869 () Bool)

(assert (=> b!421533 m!410869))

(declare-fun m!410871 () Bool)

(assert (=> b!421533 m!410871))

(declare-fun m!410873 () Bool)

(assert (=> b!421533 m!410873))

(declare-fun m!410875 () Bool)

(assert (=> b!421533 m!410875))

(declare-fun m!410877 () Bool)

(assert (=> b!421533 m!410877))

(declare-fun m!410879 () Bool)

(assert (=> b!421533 m!410879))

(declare-fun m!410881 () Bool)

(assert (=> b!421533 m!410881))

(declare-fun m!410883 () Bool)

(assert (=> b!421533 m!410883))

(assert (=> b!421533 m!410863))

(declare-fun m!410885 () Bool)

(assert (=> b!421533 m!410885))

(assert (=> b!421533 m!410877))

(declare-fun m!410887 () Bool)

(assert (=> b!421533 m!410887))

(assert (=> b!421533 m!410867))

(declare-fun m!410889 () Bool)

(assert (=> mapNonEmpty!17994 m!410889))

(declare-fun m!410891 () Bool)

(assert (=> b!421525 m!410891))

(declare-fun m!410893 () Bool)

(assert (=> bm!29439 m!410893))

(declare-fun m!410895 () Bool)

(assert (=> b!421539 m!410895))

(assert (=> b!421539 m!410873))

(declare-fun m!410897 () Bool)

(assert (=> b!421539 m!410897))

(declare-fun m!410899 () Bool)

(assert (=> b!421528 m!410899))

(assert (=> b!421528 m!410899))

(declare-fun m!410901 () Bool)

(assert (=> b!421528 m!410901))

(declare-fun m!410903 () Bool)

(assert (=> b!421528 m!410903))

(declare-fun m!410905 () Bool)

(assert (=> b!421532 m!410905))

(declare-fun m!410907 () Bool)

(assert (=> b!421537 m!410907))

(declare-fun m!410909 () Bool)

(assert (=> b!421527 m!410909))

(declare-fun m!410911 () Bool)

(assert (=> b!421530 m!410911))

(check-sat (not b!421527) (not mapNonEmpty!17994) (not b_lambda!9049) (not b!421525) (not b_next!9763) (not b!421534) (not bm!29439) (not start!39482) (not b!421538) tp_is_empty!10915 (not b!421539) (not b!421531) (not b!421533) b_and!17377 (not b!421535) (not b!421528) (not b!421530) (not b!421537) (not bm!29440))
(check-sat b_and!17377 (not b_next!9763))
