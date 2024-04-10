; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38700 () Bool)

(assert start!38700)

(declare-fun b_free!9237 () Bool)

(declare-fun b_next!9237 () Bool)

(assert (=> start!38700 (= b_free!9237 (not b_next!9237))))

(declare-fun tp!32835 () Bool)

(declare-fun b_and!16623 () Bool)

(assert (=> start!38700 (= tp!32835 b_and!16623)))

(declare-datatypes ((V!14597 0))(
  ( (V!14598 (val!5104 Int)) )
))
(declare-fun minValue!515 () V!14597)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4716 0))(
  ( (ValueCellFull!4716 (v!7351 V!14597)) (EmptyCell!4716) )
))
(declare-datatypes ((array!24143 0))(
  ( (array!24144 (arr!11521 (Array (_ BitVec 32) ValueCell!4716)) (size!11873 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24143)

(declare-fun bm!28372 () Bool)

(declare-fun zeroValue!515 () V!14597)

(declare-fun c!54812 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!6780 0))(
  ( (tuple2!6781 (_1!3401 (_ BitVec 64)) (_2!3401 V!14597)) )
))
(declare-datatypes ((List!6702 0))(
  ( (Nil!6699) (Cons!6698 (h!7554 tuple2!6780) (t!11876 List!6702)) )
))
(declare-datatypes ((ListLongMap!5693 0))(
  ( (ListLongMap!5694 (toList!2862 List!6702)) )
))
(declare-fun call!28376 () ListLongMap!5693)

(declare-fun v!412 () V!14597)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24145 0))(
  ( (array!24146 (arr!11522 (Array (_ BitVec 32) (_ BitVec 64))) (size!11874 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24145)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!187937 () array!24145)

(declare-fun getCurrentListMapNoExtraKeys!1072 (array!24145 array!24143 (_ BitVec 32) (_ BitVec 32) V!14597 V!14597 (_ BitVec 32) Int) ListLongMap!5693)

(assert (=> bm!28372 (= call!28376 (getCurrentListMapNoExtraKeys!1072 (ite c!54812 _keys!709 lt!187937) (ite c!54812 _values!549 (array!24144 (store (arr!11521 _values!549) i!563 (ValueCellFull!4716 v!412)) (size!11873 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402502 () Bool)

(declare-fun res!231847 () Bool)

(declare-fun e!242490 () Bool)

(assert (=> b!402502 (=> (not res!231847) (not e!242490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24145 (_ BitVec 32)) Bool)

(assert (=> b!402502 (= res!231847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402503 () Bool)

(declare-fun res!231839 () Bool)

(assert (=> b!402503 (=> (not res!231839) (not e!242490))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402503 (= res!231839 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28373 () Bool)

(declare-fun call!28375 () ListLongMap!5693)

(assert (=> bm!28373 (= call!28375 (getCurrentListMapNoExtraKeys!1072 (ite c!54812 lt!187937 _keys!709) (ite c!54812 (array!24144 (store (arr!11521 _values!549) i!563 (ValueCellFull!4716 v!412)) (size!11873 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402504 () Bool)

(declare-fun res!231842 () Bool)

(assert (=> b!402504 (=> (not res!231842) (not e!242490))))

(declare-datatypes ((List!6703 0))(
  ( (Nil!6700) (Cons!6699 (h!7555 (_ BitVec 64)) (t!11877 List!6703)) )
))
(declare-fun arrayNoDuplicates!0 (array!24145 (_ BitVec 32) List!6703) Bool)

(assert (=> b!402504 (= res!231842 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6700))))

(declare-fun b!402505 () Bool)

(declare-fun res!231838 () Bool)

(assert (=> b!402505 (=> (not res!231838) (not e!242490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402505 (= res!231838 (validMask!0 mask!1025))))

(declare-fun b!402506 () Bool)

(declare-fun e!242492 () Bool)

(assert (=> b!402506 (= e!242490 e!242492)))

(declare-fun res!231843 () Bool)

(assert (=> b!402506 (=> (not res!231843) (not e!242492))))

(assert (=> b!402506 (= res!231843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187937 mask!1025))))

(assert (=> b!402506 (= lt!187937 (array!24146 (store (arr!11522 _keys!709) i!563 k0!794) (size!11874 _keys!709)))))

(declare-fun b!402507 () Bool)

(declare-fun res!231841 () Bool)

(assert (=> b!402507 (=> (not res!231841) (not e!242490))))

(assert (=> b!402507 (= res!231841 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11874 _keys!709))))))

(declare-fun b!402508 () Bool)

(declare-fun e!242491 () Bool)

(declare-fun tp_is_empty!10119 () Bool)

(assert (=> b!402508 (= e!242491 tp_is_empty!10119)))

(declare-fun b!402509 () Bool)

(declare-fun res!231844 () Bool)

(assert (=> b!402509 (=> (not res!231844) (not e!242490))))

(assert (=> b!402509 (= res!231844 (or (= (select (arr!11522 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11522 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402510 () Bool)

(declare-fun e!242493 () Bool)

(declare-fun mapRes!16800 () Bool)

(assert (=> b!402510 (= e!242493 (and e!242491 mapRes!16800))))

(declare-fun condMapEmpty!16800 () Bool)

(declare-fun mapDefault!16800 () ValueCell!4716)

(assert (=> b!402510 (= condMapEmpty!16800 (= (arr!11521 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4716)) mapDefault!16800)))))

(declare-fun b!402511 () Bool)

(declare-fun res!231846 () Bool)

(assert (=> b!402511 (=> (not res!231846) (not e!242490))))

(assert (=> b!402511 (= res!231846 (and (= (size!11873 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11874 _keys!709) (size!11873 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402512 () Bool)

(declare-fun e!242495 () Bool)

(assert (=> b!402512 (= e!242495 tp_is_empty!10119)))

(declare-fun e!242496 () Bool)

(declare-fun b!402513 () Bool)

(declare-fun +!1139 (ListLongMap!5693 tuple2!6780) ListLongMap!5693)

(assert (=> b!402513 (= e!242496 (= call!28375 (+!1139 call!28376 (tuple2!6781 k0!794 v!412))))))

(declare-fun mapIsEmpty!16800 () Bool)

(assert (=> mapIsEmpty!16800 mapRes!16800))

(declare-fun b!402514 () Bool)

(assert (=> b!402514 (= e!242492 (not true))))

(assert (=> b!402514 e!242496))

(assert (=> b!402514 (= c!54812 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12186 0))(
  ( (Unit!12187) )
))
(declare-fun lt!187936 () Unit!12186)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!351 (array!24145 array!24143 (_ BitVec 32) (_ BitVec 32) V!14597 V!14597 (_ BitVec 32) (_ BitVec 64) V!14597 (_ BitVec 32) Int) Unit!12186)

(assert (=> b!402514 (= lt!187936 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!231840 () Bool)

(assert (=> start!38700 (=> (not res!231840) (not e!242490))))

(assert (=> start!38700 (= res!231840 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11874 _keys!709))))))

(assert (=> start!38700 e!242490))

(assert (=> start!38700 tp_is_empty!10119))

(assert (=> start!38700 tp!32835))

(assert (=> start!38700 true))

(declare-fun array_inv!8430 (array!24143) Bool)

(assert (=> start!38700 (and (array_inv!8430 _values!549) e!242493)))

(declare-fun array_inv!8431 (array!24145) Bool)

(assert (=> start!38700 (array_inv!8431 _keys!709)))

(declare-fun b!402515 () Bool)

(declare-fun res!231849 () Bool)

(assert (=> b!402515 (=> (not res!231849) (not e!242490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402515 (= res!231849 (validKeyInArray!0 k0!794))))

(declare-fun b!402516 () Bool)

(declare-fun res!231845 () Bool)

(assert (=> b!402516 (=> (not res!231845) (not e!242492))))

(assert (=> b!402516 (= res!231845 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11874 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402517 () Bool)

(declare-fun res!231848 () Bool)

(assert (=> b!402517 (=> (not res!231848) (not e!242492))))

(assert (=> b!402517 (= res!231848 (arrayNoDuplicates!0 lt!187937 #b00000000000000000000000000000000 Nil!6700))))

(declare-fun b!402518 () Bool)

(assert (=> b!402518 (= e!242496 (= call!28376 call!28375))))

(declare-fun mapNonEmpty!16800 () Bool)

(declare-fun tp!32834 () Bool)

(assert (=> mapNonEmpty!16800 (= mapRes!16800 (and tp!32834 e!242495))))

(declare-fun mapKey!16800 () (_ BitVec 32))

(declare-fun mapRest!16800 () (Array (_ BitVec 32) ValueCell!4716))

(declare-fun mapValue!16800 () ValueCell!4716)

(assert (=> mapNonEmpty!16800 (= (arr!11521 _values!549) (store mapRest!16800 mapKey!16800 mapValue!16800))))

(assert (= (and start!38700 res!231840) b!402505))

(assert (= (and b!402505 res!231838) b!402511))

(assert (= (and b!402511 res!231846) b!402502))

(assert (= (and b!402502 res!231847) b!402504))

(assert (= (and b!402504 res!231842) b!402507))

(assert (= (and b!402507 res!231841) b!402515))

(assert (= (and b!402515 res!231849) b!402509))

(assert (= (and b!402509 res!231844) b!402503))

(assert (= (and b!402503 res!231839) b!402506))

(assert (= (and b!402506 res!231843) b!402517))

(assert (= (and b!402517 res!231848) b!402516))

(assert (= (and b!402516 res!231845) b!402514))

(assert (= (and b!402514 c!54812) b!402513))

(assert (= (and b!402514 (not c!54812)) b!402518))

(assert (= (or b!402513 b!402518) bm!28373))

(assert (= (or b!402513 b!402518) bm!28372))

(assert (= (and b!402510 condMapEmpty!16800) mapIsEmpty!16800))

(assert (= (and b!402510 (not condMapEmpty!16800)) mapNonEmpty!16800))

(get-info :version)

(assert (= (and mapNonEmpty!16800 ((_ is ValueCellFull!4716) mapValue!16800)) b!402512))

(assert (= (and b!402510 ((_ is ValueCellFull!4716) mapDefault!16800)) b!402508))

(assert (= start!38700 b!402510))

(declare-fun m!396005 () Bool)

(assert (=> b!402502 m!396005))

(declare-fun m!396007 () Bool)

(assert (=> b!402506 m!396007))

(declare-fun m!396009 () Bool)

(assert (=> b!402506 m!396009))

(declare-fun m!396011 () Bool)

(assert (=> bm!28373 m!396011))

(declare-fun m!396013 () Bool)

(assert (=> bm!28373 m!396013))

(declare-fun m!396015 () Bool)

(assert (=> start!38700 m!396015))

(declare-fun m!396017 () Bool)

(assert (=> start!38700 m!396017))

(declare-fun m!396019 () Bool)

(assert (=> b!402515 m!396019))

(declare-fun m!396021 () Bool)

(assert (=> mapNonEmpty!16800 m!396021))

(declare-fun m!396023 () Bool)

(assert (=> b!402509 m!396023))

(declare-fun m!396025 () Bool)

(assert (=> b!402504 m!396025))

(declare-fun m!396027 () Bool)

(assert (=> b!402517 m!396027))

(declare-fun m!396029 () Bool)

(assert (=> b!402514 m!396029))

(declare-fun m!396031 () Bool)

(assert (=> b!402505 m!396031))

(declare-fun m!396033 () Bool)

(assert (=> b!402513 m!396033))

(assert (=> bm!28372 m!396011))

(declare-fun m!396035 () Bool)

(assert (=> bm!28372 m!396035))

(declare-fun m!396037 () Bool)

(assert (=> b!402503 m!396037))

(check-sat (not b!402502) (not mapNonEmpty!16800) b_and!16623 (not b!402515) (not b!402505) (not b!402513) (not b!402517) (not b_next!9237) (not b!402506) (not start!38700) tp_is_empty!10119 (not b!402514) (not bm!28372) (not bm!28373) (not b!402503) (not b!402504))
(check-sat b_and!16623 (not b_next!9237))
