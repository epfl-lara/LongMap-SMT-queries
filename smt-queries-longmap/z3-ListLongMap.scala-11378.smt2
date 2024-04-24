; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132622 () Bool)

(assert start!132622)

(declare-fun b_free!31885 () Bool)

(declare-fun b_next!31885 () Bool)

(assert (=> start!132622 (= b_free!31885 (not b_next!31885))))

(declare-fun tp!111913 () Bool)

(declare-fun b_and!51317 () Bool)

(assert (=> start!132622 (= tp!111913 b_and!51317)))

(declare-fun b!1553450 () Bool)

(declare-fun e!864906 () Bool)

(declare-fun tp_is_empty!38161 () Bool)

(assert (=> b!1553450 (= e!864906 tp_is_empty!38161)))

(declare-fun b!1553451 () Bool)

(declare-fun e!864910 () Bool)

(declare-fun e!864909 () Bool)

(declare-fun mapRes!58951 () Bool)

(assert (=> b!1553451 (= e!864910 (and e!864909 mapRes!58951))))

(declare-fun condMapEmpty!58951 () Bool)

(declare-datatypes ((V!59325 0))(
  ( (V!59326 (val!19158 Int)) )
))
(declare-datatypes ((ValueCell!18170 0))(
  ( (ValueCellFull!18170 (v!21953 V!59325)) (EmptyCell!18170) )
))
(declare-datatypes ((array!103648 0))(
  ( (array!103649 (arr!50017 (Array (_ BitVec 32) ValueCell!18170)) (size!50568 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103648)

(declare-fun mapDefault!58951 () ValueCell!18170)

(assert (=> b!1553451 (= condMapEmpty!58951 (= (arr!50017 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18170)) mapDefault!58951)))))

(declare-fun b!1553452 () Bool)

(declare-fun res!1063102 () Bool)

(declare-fun e!864911 () Bool)

(assert (=> b!1553452 (=> (not res!1063102) (not e!864911))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103650 0))(
  ( (array!103651 (arr!50018 (Array (_ BitVec 32) (_ BitVec 64))) (size!50569 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103650)

(assert (=> b!1553452 (= res!1063102 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50569 _keys!618))))))

(declare-fun b!1553453 () Bool)

(declare-fun e!864908 () Bool)

(assert (=> b!1553453 (= e!864911 e!864908)))

(declare-fun res!1063104 () Bool)

(assert (=> b!1553453 (=> (not res!1063104) (not e!864908))))

(assert (=> b!1553453 (= res!1063104 (bvslt from!762 (size!50569 _keys!618)))))

(declare-datatypes ((tuple2!24746 0))(
  ( (tuple2!24747 (_1!12384 (_ BitVec 64)) (_2!12384 V!59325)) )
))
(declare-datatypes ((List!36202 0))(
  ( (Nil!36199) (Cons!36198 (h!37661 tuple2!24746) (t!50904 List!36202)) )
))
(declare-datatypes ((ListLongMap!22363 0))(
  ( (ListLongMap!22364 (toList!11197 List!36202)) )
))
(declare-fun lt!669401 () ListLongMap!22363)

(declare-fun e!864912 () ListLongMap!22363)

(assert (=> b!1553453 (= lt!669401 e!864912)))

(declare-fun c!143491 () Bool)

(declare-fun lt!669403 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1553453 (= c!143491 (and (not lt!669403) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1553453 (= lt!669403 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1553454 () Bool)

(declare-fun res!1063106 () Bool)

(assert (=> b!1553454 (=> (not res!1063106) (not e!864911))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103650 (_ BitVec 32)) Bool)

(assert (=> b!1553454 (= res!1063106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1063103 () Bool)

(assert (=> start!132622 (=> (not res!1063103) (not e!864911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132622 (= res!1063103 (validMask!0 mask!926))))

(assert (=> start!132622 e!864911))

(declare-fun array_inv!39145 (array!103650) Bool)

(assert (=> start!132622 (array_inv!39145 _keys!618)))

(assert (=> start!132622 tp_is_empty!38161))

(assert (=> start!132622 true))

(assert (=> start!132622 tp!111913))

(declare-fun array_inv!39146 (array!103648) Bool)

(assert (=> start!132622 (and (array_inv!39146 _values!470) e!864910)))

(declare-fun zeroValue!436 () V!59325)

(declare-fun call!71045 () ListLongMap!22363)

(declare-fun call!71042 () ListLongMap!22363)

(declare-fun minValue!436 () V!59325)

(declare-fun call!71043 () ListLongMap!22363)

(declare-fun call!71044 () ListLongMap!22363)

(declare-fun bm!71039 () Bool)

(declare-fun c!143492 () Bool)

(declare-fun +!5028 (ListLongMap!22363 tuple2!24746) ListLongMap!22363)

(assert (=> bm!71039 (= call!71043 (+!5028 (ite c!143491 call!71044 (ite c!143492 call!71042 call!71045)) (ite (or c!143491 c!143492) (tuple2!24747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71040 () Bool)

(assert (=> bm!71040 (= call!71042 call!71044)))

(declare-fun b!1553455 () Bool)

(declare-fun e!864914 () ListLongMap!22363)

(declare-fun call!71046 () ListLongMap!22363)

(assert (=> b!1553455 (= e!864914 call!71046)))

(declare-fun b!1553456 () Bool)

(assert (=> b!1553456 (= e!864908 (not true))))

(declare-fun lt!669402 () ListLongMap!22363)

(declare-fun apply!1098 (ListLongMap!22363 (_ BitVec 64)) V!59325)

(assert (=> b!1553456 (= (apply!1098 (+!5028 lt!669402 (tuple2!24747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50018 _keys!618) from!762)) (apply!1098 lt!669402 (select (arr!50018 _keys!618) from!762)))))

(declare-datatypes ((Unit!51575 0))(
  ( (Unit!51576) )
))
(declare-fun lt!669404 () Unit!51575)

(declare-fun addApplyDifferent!625 (ListLongMap!22363 (_ BitVec 64) V!59325 (_ BitVec 64)) Unit!51575)

(assert (=> b!1553456 (= lt!669404 (addApplyDifferent!625 lt!669402 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50018 _keys!618) from!762)))))

(declare-fun contains!10155 (ListLongMap!22363 (_ BitVec 64)) Bool)

(assert (=> b!1553456 (contains!10155 (+!5028 lt!669402 (tuple2!24747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50018 _keys!618) from!762))))

(declare-fun lt!669400 () Unit!51575)

(declare-fun addStillContains!1290 (ListLongMap!22363 (_ BitVec 64) V!59325 (_ BitVec 64)) Unit!51575)

(assert (=> b!1553456 (= lt!669400 (addStillContains!1290 lt!669402 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50018 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6661 (array!103650 array!103648 (_ BitVec 32) (_ BitVec 32) V!59325 V!59325 (_ BitVec 32) Int) ListLongMap!22363)

(assert (=> b!1553456 (= lt!669402 (getCurrentListMapNoExtraKeys!6661 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71041 () Bool)

(assert (=> bm!71041 (= call!71044 (getCurrentListMapNoExtraKeys!6661 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58951 () Bool)

(assert (=> mapIsEmpty!58951 mapRes!58951))

(declare-fun b!1553457 () Bool)

(declare-fun res!1063105 () Bool)

(assert (=> b!1553457 (=> (not res!1063105) (not e!864911))))

(declare-datatypes ((List!36203 0))(
  ( (Nil!36200) (Cons!36199 (h!37662 (_ BitVec 64)) (t!50905 List!36203)) )
))
(declare-fun arrayNoDuplicates!0 (array!103650 (_ BitVec 32) List!36203) Bool)

(assert (=> b!1553457 (= res!1063105 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36200))))

(declare-fun b!1553458 () Bool)

(declare-fun res!1063101 () Bool)

(assert (=> b!1553458 (=> (not res!1063101) (not e!864911))))

(assert (=> b!1553458 (= res!1063101 (and (= (size!50568 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50569 _keys!618) (size!50568 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1553459 () Bool)

(declare-fun res!1063107 () Bool)

(assert (=> b!1553459 (=> (not res!1063107) (not e!864908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1553459 (= res!1063107 (validKeyInArray!0 (select (arr!50018 _keys!618) from!762)))))

(declare-fun b!1553460 () Bool)

(assert (=> b!1553460 (= e!864912 (+!5028 call!71043 (tuple2!24747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1553461 () Bool)

(declare-fun c!143490 () Bool)

(assert (=> b!1553461 (= c!143490 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669403))))

(declare-fun e!864913 () ListLongMap!22363)

(assert (=> b!1553461 (= e!864914 e!864913)))

(declare-fun b!1553462 () Bool)

(assert (=> b!1553462 (= e!864913 call!71046)))

(declare-fun mapNonEmpty!58951 () Bool)

(declare-fun tp!111912 () Bool)

(assert (=> mapNonEmpty!58951 (= mapRes!58951 (and tp!111912 e!864906))))

(declare-fun mapRest!58951 () (Array (_ BitVec 32) ValueCell!18170))

(declare-fun mapValue!58951 () ValueCell!18170)

(declare-fun mapKey!58951 () (_ BitVec 32))

(assert (=> mapNonEmpty!58951 (= (arr!50017 _values!470) (store mapRest!58951 mapKey!58951 mapValue!58951))))

(declare-fun b!1553463 () Bool)

(assert (=> b!1553463 (= e!864913 call!71045)))

(declare-fun bm!71042 () Bool)

(assert (=> bm!71042 (= call!71045 call!71042)))

(declare-fun bm!71043 () Bool)

(assert (=> bm!71043 (= call!71046 call!71043)))

(declare-fun b!1553464 () Bool)

(assert (=> b!1553464 (= e!864912 e!864914)))

(assert (=> b!1553464 (= c!143492 (and (not lt!669403) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1553465 () Bool)

(assert (=> b!1553465 (= e!864909 tp_is_empty!38161)))

(assert (= (and start!132622 res!1063103) b!1553458))

(assert (= (and b!1553458 res!1063101) b!1553454))

(assert (= (and b!1553454 res!1063106) b!1553457))

(assert (= (and b!1553457 res!1063105) b!1553452))

(assert (= (and b!1553452 res!1063102) b!1553453))

(assert (= (and b!1553453 c!143491) b!1553460))

(assert (= (and b!1553453 (not c!143491)) b!1553464))

(assert (= (and b!1553464 c!143492) b!1553455))

(assert (= (and b!1553464 (not c!143492)) b!1553461))

(assert (= (and b!1553461 c!143490) b!1553462))

(assert (= (and b!1553461 (not c!143490)) b!1553463))

(assert (= (or b!1553462 b!1553463) bm!71042))

(assert (= (or b!1553455 bm!71042) bm!71040))

(assert (= (or b!1553455 b!1553462) bm!71043))

(assert (= (or b!1553460 bm!71040) bm!71041))

(assert (= (or b!1553460 bm!71043) bm!71039))

(assert (= (and b!1553453 res!1063104) b!1553459))

(assert (= (and b!1553459 res!1063107) b!1553456))

(assert (= (and b!1553451 condMapEmpty!58951) mapIsEmpty!58951))

(assert (= (and b!1553451 (not condMapEmpty!58951)) mapNonEmpty!58951))

(get-info :version)

(assert (= (and mapNonEmpty!58951 ((_ is ValueCellFull!18170) mapValue!58951)) b!1553450))

(assert (= (and b!1553451 ((_ is ValueCellFull!18170) mapDefault!58951)) b!1553465))

(assert (= start!132622 b!1553451))

(declare-fun m!1432005 () Bool)

(assert (=> bm!71039 m!1432005))

(declare-fun m!1432007 () Bool)

(assert (=> b!1553459 m!1432007))

(assert (=> b!1553459 m!1432007))

(declare-fun m!1432009 () Bool)

(assert (=> b!1553459 m!1432009))

(declare-fun m!1432011 () Bool)

(assert (=> b!1553456 m!1432011))

(assert (=> b!1553456 m!1432007))

(declare-fun m!1432013 () Bool)

(assert (=> b!1553456 m!1432013))

(assert (=> b!1553456 m!1432007))

(declare-fun m!1432015 () Bool)

(assert (=> b!1553456 m!1432015))

(assert (=> b!1553456 m!1432011))

(assert (=> b!1553456 m!1432007))

(declare-fun m!1432017 () Bool)

(assert (=> b!1553456 m!1432017))

(assert (=> b!1553456 m!1432013))

(declare-fun m!1432019 () Bool)

(assert (=> b!1553456 m!1432019))

(assert (=> b!1553456 m!1432007))

(declare-fun m!1432021 () Bool)

(assert (=> b!1553456 m!1432021))

(assert (=> b!1553456 m!1432007))

(declare-fun m!1432023 () Bool)

(assert (=> b!1553456 m!1432023))

(assert (=> b!1553456 m!1432007))

(declare-fun m!1432025 () Bool)

(assert (=> b!1553456 m!1432025))

(assert (=> bm!71041 m!1432019))

(declare-fun m!1432027 () Bool)

(assert (=> b!1553454 m!1432027))

(declare-fun m!1432029 () Bool)

(assert (=> b!1553460 m!1432029))

(declare-fun m!1432031 () Bool)

(assert (=> b!1553457 m!1432031))

(declare-fun m!1432033 () Bool)

(assert (=> start!132622 m!1432033))

(declare-fun m!1432035 () Bool)

(assert (=> start!132622 m!1432035))

(declare-fun m!1432037 () Bool)

(assert (=> start!132622 m!1432037))

(declare-fun m!1432039 () Bool)

(assert (=> mapNonEmpty!58951 m!1432039))

(check-sat tp_is_empty!38161 (not bm!71039) (not start!132622) (not mapNonEmpty!58951) b_and!51317 (not b!1553459) (not b_next!31885) (not b!1553460) (not b!1553454) (not bm!71041) (not b!1553456) (not b!1553457))
(check-sat b_and!51317 (not b_next!31885))
