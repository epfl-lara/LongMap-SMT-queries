; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39432 () Bool)

(assert start!39432)

(declare-fun b_free!9699 () Bool)

(declare-fun b_next!9699 () Bool)

(assert (=> start!39432 (= b_free!9699 (not b_next!9699))))

(declare-fun tp!34625 () Bool)

(declare-fun b_and!17273 () Bool)

(assert (=> start!39432 (= tp!34625 b_and!17273)))

(declare-fun b!419908 () Bool)

(declare-fun res!244867 () Bool)

(declare-fun e!250193 () Bool)

(assert (=> b!419908 (=> (not res!244867) (not e!250193))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419908 (= res!244867 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17898 () Bool)

(declare-fun mapRes!17898 () Bool)

(assert (=> mapIsEmpty!17898 mapRes!17898))

(declare-fun b!419909 () Bool)

(declare-fun res!244874 () Bool)

(assert (=> b!419909 (=> (not res!244874) (not e!250193))))

(declare-datatypes ((array!25551 0))(
  ( (array!25552 (arr!12225 (Array (_ BitVec 32) (_ BitVec 64))) (size!12577 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25551)

(declare-fun arrayContainsKey!0 (array!25551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419909 (= res!244874 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419910 () Bool)

(declare-fun e!250194 () Bool)

(declare-fun e!250190 () Bool)

(assert (=> b!419910 (= e!250194 (and e!250190 mapRes!17898))))

(declare-fun condMapEmpty!17898 () Bool)

(declare-datatypes ((V!15573 0))(
  ( (V!15574 (val!5470 Int)) )
))
(declare-datatypes ((ValueCell!5082 0))(
  ( (ValueCellFull!5082 (v!7717 V!15573)) (EmptyCell!5082) )
))
(declare-datatypes ((array!25553 0))(
  ( (array!25554 (arr!12226 (Array (_ BitVec 32) ValueCell!5082)) (size!12578 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25553)

(declare-fun mapDefault!17898 () ValueCell!5082)

(assert (=> b!419910 (= condMapEmpty!17898 (= (arr!12226 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5082)) mapDefault!17898)))))

(declare-fun b!419911 () Bool)

(declare-fun res!244865 () Bool)

(assert (=> b!419911 (=> (not res!244865) (not e!250193))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419911 (= res!244865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12577 _keys!709))))))

(declare-fun b!419912 () Bool)

(declare-fun res!244873 () Bool)

(assert (=> b!419912 (=> (not res!244873) (not e!250193))))

(assert (=> b!419912 (= res!244873 (or (= (select (arr!12225 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12225 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419913 () Bool)

(declare-fun res!244862 () Bool)

(declare-fun e!250189 () Bool)

(assert (=> b!419913 (=> (not res!244862) (not e!250189))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!419913 (= res!244862 (bvsle from!863 i!563))))

(declare-fun b!419914 () Bool)

(declare-fun res!244869 () Bool)

(assert (=> b!419914 (=> (not res!244869) (not e!250193))))

(declare-datatypes ((List!7172 0))(
  ( (Nil!7169) (Cons!7168 (h!8024 (_ BitVec 64)) (t!12536 List!7172)) )
))
(declare-fun arrayNoDuplicates!0 (array!25551 (_ BitVec 32) List!7172) Bool)

(assert (=> b!419914 (= res!244869 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7169))))

(declare-fun b!419915 () Bool)

(declare-fun e!250187 () Bool)

(declare-datatypes ((tuple2!7164 0))(
  ( (tuple2!7165 (_1!3593 (_ BitVec 64)) (_2!3593 V!15573)) )
))
(declare-datatypes ((List!7173 0))(
  ( (Nil!7170) (Cons!7169 (h!8025 tuple2!7164) (t!12537 List!7173)) )
))
(declare-datatypes ((ListLongMap!6077 0))(
  ( (ListLongMap!6078 (toList!3054 List!7173)) )
))
(declare-fun call!29276 () ListLongMap!6077)

(declare-fun v!412 () V!15573)

(declare-fun call!29275 () ListLongMap!6077)

(declare-fun +!1251 (ListLongMap!6077 tuple2!7164) ListLongMap!6077)

(assert (=> b!419915 (= e!250187 (= call!29276 (+!1251 call!29275 (tuple2!7165 k0!794 v!412))))))

(declare-fun minValue!515 () V!15573)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192616 () array!25551)

(declare-fun lt!192610 () array!25553)

(declare-fun zeroValue!515 () V!15573)

(declare-fun bm!29272 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!55262 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1259 (array!25551 array!25553 (_ BitVec 32) (_ BitVec 32) V!15573 V!15573 (_ BitVec 32) Int) ListLongMap!6077)

(assert (=> bm!29272 (= call!29276 (getCurrentListMapNoExtraKeys!1259 (ite c!55262 lt!192616 _keys!709) (ite c!55262 lt!192610 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419916 () Bool)

(declare-fun e!250191 () Bool)

(declare-fun e!250192 () Bool)

(assert (=> b!419916 (= e!250191 (not e!250192))))

(declare-fun res!244868 () Bool)

(assert (=> b!419916 (=> res!244868 e!250192)))

(assert (=> b!419916 (= res!244868 (validKeyInArray!0 (select (arr!12225 _keys!709) from!863)))))

(assert (=> b!419916 e!250187))

(assert (=> b!419916 (= c!55262 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12406 0))(
  ( (Unit!12407) )
))
(declare-fun lt!192609 () Unit!12406)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!453 (array!25551 array!25553 (_ BitVec 32) (_ BitVec 32) V!15573 V!15573 (_ BitVec 32) (_ BitVec 64) V!15573 (_ BitVec 32) Int) Unit!12406)

(assert (=> b!419916 (= lt!192609 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!453 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419917 () Bool)

(declare-fun res!244863 () Bool)

(assert (=> b!419917 (=> (not res!244863) (not e!250193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25551 (_ BitVec 32)) Bool)

(assert (=> b!419917 (= res!244863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419918 () Bool)

(assert (=> b!419918 (= e!250193 e!250189)))

(declare-fun res!244872 () Bool)

(assert (=> b!419918 (=> (not res!244872) (not e!250189))))

(assert (=> b!419918 (= res!244872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192616 mask!1025))))

(assert (=> b!419918 (= lt!192616 (array!25552 (store (arr!12225 _keys!709) i!563 k0!794) (size!12577 _keys!709)))))

(declare-fun bm!29273 () Bool)

(assert (=> bm!29273 (= call!29275 (getCurrentListMapNoExtraKeys!1259 (ite c!55262 _keys!709 lt!192616) (ite c!55262 _values!549 lt!192610) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419919 () Bool)

(declare-fun res!244866 () Bool)

(assert (=> b!419919 (=> (not res!244866) (not e!250193))))

(assert (=> b!419919 (= res!244866 (and (= (size!12578 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12577 _keys!709) (size!12578 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!244875 () Bool)

(assert (=> start!39432 (=> (not res!244875) (not e!250193))))

(assert (=> start!39432 (= res!244875 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12577 _keys!709))))))

(assert (=> start!39432 e!250193))

(declare-fun tp_is_empty!10851 () Bool)

(assert (=> start!39432 tp_is_empty!10851))

(assert (=> start!39432 tp!34625))

(assert (=> start!39432 true))

(declare-fun array_inv!8914 (array!25553) Bool)

(assert (=> start!39432 (and (array_inv!8914 _values!549) e!250194)))

(declare-fun array_inv!8915 (array!25551) Bool)

(assert (=> start!39432 (array_inv!8915 _keys!709)))

(declare-fun mapNonEmpty!17898 () Bool)

(declare-fun tp!34626 () Bool)

(declare-fun e!250186 () Bool)

(assert (=> mapNonEmpty!17898 (= mapRes!17898 (and tp!34626 e!250186))))

(declare-fun mapRest!17898 () (Array (_ BitVec 32) ValueCell!5082))

(declare-fun mapValue!17898 () ValueCell!5082)

(declare-fun mapKey!17898 () (_ BitVec 32))

(assert (=> mapNonEmpty!17898 (= (arr!12226 _values!549) (store mapRest!17898 mapKey!17898 mapValue!17898))))

(declare-fun b!419920 () Bool)

(declare-fun res!244864 () Bool)

(assert (=> b!419920 (=> (not res!244864) (not e!250189))))

(assert (=> b!419920 (= res!244864 (arrayNoDuplicates!0 lt!192616 #b00000000000000000000000000000000 Nil!7169))))

(declare-fun b!419921 () Bool)

(assert (=> b!419921 (= e!250192 true)))

(declare-fun lt!192611 () V!15573)

(declare-fun lt!192617 () ListLongMap!6077)

(declare-fun lt!192614 () tuple2!7164)

(assert (=> b!419921 (= (+!1251 lt!192617 lt!192614) (+!1251 (+!1251 lt!192617 (tuple2!7165 k0!794 lt!192611)) lt!192614))))

(declare-fun lt!192612 () V!15573)

(assert (=> b!419921 (= lt!192614 (tuple2!7165 k0!794 lt!192612))))

(declare-fun lt!192607 () Unit!12406)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!48 (ListLongMap!6077 (_ BitVec 64) V!15573 V!15573) Unit!12406)

(assert (=> b!419921 (= lt!192607 (addSameAsAddTwiceSameKeyDiffValues!48 lt!192617 k0!794 lt!192611 lt!192612))))

(declare-fun lt!192608 () V!15573)

(declare-fun get!6066 (ValueCell!5082 V!15573) V!15573)

(assert (=> b!419921 (= lt!192611 (get!6066 (select (arr!12226 _values!549) from!863) lt!192608))))

(declare-fun lt!192613 () ListLongMap!6077)

(assert (=> b!419921 (= lt!192613 (+!1251 lt!192617 (tuple2!7165 (select (arr!12225 lt!192616) from!863) lt!192612)))))

(assert (=> b!419921 (= lt!192612 (get!6066 (select (store (arr!12226 _values!549) i!563 (ValueCellFull!5082 v!412)) from!863) lt!192608))))

(declare-fun dynLambda!719 (Int (_ BitVec 64)) V!15573)

(assert (=> b!419921 (= lt!192608 (dynLambda!719 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419921 (= lt!192617 (getCurrentListMapNoExtraKeys!1259 lt!192616 lt!192610 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419922 () Bool)

(assert (=> b!419922 (= e!250190 tp_is_empty!10851)))

(declare-fun b!419923 () Bool)

(assert (=> b!419923 (= e!250187 (= call!29275 call!29276))))

(declare-fun b!419924 () Bool)

(declare-fun res!244870 () Bool)

(assert (=> b!419924 (=> (not res!244870) (not e!250193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419924 (= res!244870 (validMask!0 mask!1025))))

(declare-fun b!419925 () Bool)

(assert (=> b!419925 (= e!250186 tp_is_empty!10851)))

(declare-fun b!419926 () Bool)

(assert (=> b!419926 (= e!250189 e!250191)))

(declare-fun res!244871 () Bool)

(assert (=> b!419926 (=> (not res!244871) (not e!250191))))

(assert (=> b!419926 (= res!244871 (= from!863 i!563))))

(assert (=> b!419926 (= lt!192613 (getCurrentListMapNoExtraKeys!1259 lt!192616 lt!192610 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419926 (= lt!192610 (array!25554 (store (arr!12226 _values!549) i!563 (ValueCellFull!5082 v!412)) (size!12578 _values!549)))))

(declare-fun lt!192615 () ListLongMap!6077)

(assert (=> b!419926 (= lt!192615 (getCurrentListMapNoExtraKeys!1259 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39432 res!244875) b!419924))

(assert (= (and b!419924 res!244870) b!419919))

(assert (= (and b!419919 res!244866) b!419917))

(assert (= (and b!419917 res!244863) b!419914))

(assert (= (and b!419914 res!244869) b!419911))

(assert (= (and b!419911 res!244865) b!419908))

(assert (= (and b!419908 res!244867) b!419912))

(assert (= (and b!419912 res!244873) b!419909))

(assert (= (and b!419909 res!244874) b!419918))

(assert (= (and b!419918 res!244872) b!419920))

(assert (= (and b!419920 res!244864) b!419913))

(assert (= (and b!419913 res!244862) b!419926))

(assert (= (and b!419926 res!244871) b!419916))

(assert (= (and b!419916 c!55262) b!419915))

(assert (= (and b!419916 (not c!55262)) b!419923))

(assert (= (or b!419915 b!419923) bm!29272))

(assert (= (or b!419915 b!419923) bm!29273))

(assert (= (and b!419916 (not res!244868)) b!419921))

(assert (= (and b!419910 condMapEmpty!17898) mapIsEmpty!17898))

(assert (= (and b!419910 (not condMapEmpty!17898)) mapNonEmpty!17898))

(get-info :version)

(assert (= (and mapNonEmpty!17898 ((_ is ValueCellFull!5082) mapValue!17898)) b!419925))

(assert (= (and b!419910 ((_ is ValueCellFull!5082) mapDefault!17898)) b!419922))

(assert (= start!39432 b!419910))

(declare-fun b_lambda!9003 () Bool)

(assert (=> (not b_lambda!9003) (not b!419921)))

(declare-fun t!12535 () Bool)

(declare-fun tb!3321 () Bool)

(assert (=> (and start!39432 (= defaultEntry!557 defaultEntry!557) t!12535) tb!3321))

(declare-fun result!6169 () Bool)

(assert (=> tb!3321 (= result!6169 tp_is_empty!10851)))

(assert (=> b!419921 t!12535))

(declare-fun b_and!17275 () Bool)

(assert (= b_and!17273 (and (=> t!12535 result!6169) b_and!17275)))

(declare-fun m!409469 () Bool)

(assert (=> b!419909 m!409469))

(declare-fun m!409471 () Bool)

(assert (=> b!419926 m!409471))

(declare-fun m!409473 () Bool)

(assert (=> b!419926 m!409473))

(declare-fun m!409475 () Bool)

(assert (=> b!419926 m!409475))

(declare-fun m!409477 () Bool)

(assert (=> start!39432 m!409477))

(declare-fun m!409479 () Bool)

(assert (=> start!39432 m!409479))

(declare-fun m!409481 () Bool)

(assert (=> b!419914 m!409481))

(declare-fun m!409483 () Bool)

(assert (=> bm!29273 m!409483))

(declare-fun m!409485 () Bool)

(assert (=> b!419920 m!409485))

(declare-fun m!409487 () Bool)

(assert (=> b!419918 m!409487))

(declare-fun m!409489 () Bool)

(assert (=> b!419918 m!409489))

(declare-fun m!409491 () Bool)

(assert (=> b!419915 m!409491))

(declare-fun m!409493 () Bool)

(assert (=> b!419916 m!409493))

(assert (=> b!419916 m!409493))

(declare-fun m!409495 () Bool)

(assert (=> b!419916 m!409495))

(declare-fun m!409497 () Bool)

(assert (=> b!419916 m!409497))

(declare-fun m!409499 () Bool)

(assert (=> bm!29272 m!409499))

(declare-fun m!409501 () Bool)

(assert (=> b!419921 m!409501))

(declare-fun m!409503 () Bool)

(assert (=> b!419921 m!409503))

(declare-fun m!409505 () Bool)

(assert (=> b!419921 m!409505))

(declare-fun m!409507 () Bool)

(assert (=> b!419921 m!409507))

(declare-fun m!409509 () Bool)

(assert (=> b!419921 m!409509))

(assert (=> b!419921 m!409503))

(declare-fun m!409511 () Bool)

(assert (=> b!419921 m!409511))

(declare-fun m!409513 () Bool)

(assert (=> b!419921 m!409513))

(declare-fun m!409515 () Bool)

(assert (=> b!419921 m!409515))

(declare-fun m!409517 () Bool)

(assert (=> b!419921 m!409517))

(declare-fun m!409519 () Bool)

(assert (=> b!419921 m!409519))

(declare-fun m!409521 () Bool)

(assert (=> b!419921 m!409521))

(assert (=> b!419921 m!409507))

(declare-fun m!409523 () Bool)

(assert (=> b!419921 m!409523))

(assert (=> b!419921 m!409473))

(assert (=> b!419921 m!409513))

(declare-fun m!409525 () Bool)

(assert (=> b!419912 m!409525))

(declare-fun m!409527 () Bool)

(assert (=> b!419924 m!409527))

(declare-fun m!409529 () Bool)

(assert (=> mapNonEmpty!17898 m!409529))

(declare-fun m!409531 () Bool)

(assert (=> b!419908 m!409531))

(declare-fun m!409533 () Bool)

(assert (=> b!419917 m!409533))

(check-sat (not b!419916) (not b!419918) (not b!419909) (not b!419926) (not b!419924) (not b!419920) (not b!419914) (not b!419915) (not bm!29273) (not bm!29272) (not start!39432) (not b!419908) (not b_lambda!9003) (not mapNonEmpty!17898) b_and!17275 (not b!419917) tp_is_empty!10851 (not b!419921) (not b_next!9699))
(check-sat b_and!17275 (not b_next!9699))
