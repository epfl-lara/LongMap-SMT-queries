; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132062 () Bool)

(assert start!132062)

(declare-fun b_free!31825 () Bool)

(declare-fun b_next!31825 () Bool)

(assert (=> start!132062 (= b_free!31825 (not b_next!31825))))

(declare-fun tp!111728 () Bool)

(declare-fun b_and!51217 () Bool)

(assert (=> start!132062 (= tp!111728 b_and!51217)))

(declare-fun b!1548928 () Bool)

(declare-fun res!1061345 () Bool)

(declare-fun e!862168 () Bool)

(assert (=> b!1548928 (=> (not res!1061345) (not e!862168))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103324 0))(
  ( (array!103325 (arr!49865 (Array (_ BitVec 32) (_ BitVec 64))) (size!50417 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103324)

(assert (=> b!1548928 (= res!1061345 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50417 _keys!618))))))

(declare-fun b!1548929 () Bool)

(declare-fun res!1061343 () Bool)

(assert (=> b!1548929 (=> (not res!1061343) (not e!862168))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59245 0))(
  ( (V!59246 (val!19128 Int)) )
))
(declare-datatypes ((ValueCell!18140 0))(
  ( (ValueCellFull!18140 (v!21925 V!59245)) (EmptyCell!18140) )
))
(declare-datatypes ((array!103326 0))(
  ( (array!103327 (arr!49866 (Array (_ BitVec 32) ValueCell!18140)) (size!50418 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103326)

(assert (=> b!1548929 (= res!1061343 (and (= (size!50418 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50417 _keys!618) (size!50418 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548930 () Bool)

(declare-fun res!1061342 () Bool)

(assert (=> b!1548930 (=> (not res!1061342) (not e!862168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103324 (_ BitVec 32)) Bool)

(assert (=> b!1548930 (= res!1061342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548931 () Bool)

(declare-fun e!862169 () Bool)

(assert (=> b!1548931 (= e!862169 (not true))))

(declare-datatypes ((tuple2!24708 0))(
  ( (tuple2!24709 (_1!12365 (_ BitVec 64)) (_2!12365 V!59245)) )
))
(declare-datatypes ((List!36167 0))(
  ( (Nil!36164) (Cons!36163 (h!37609 tuple2!24708) (t!50853 List!36167)) )
))
(declare-datatypes ((ListLongMap!22317 0))(
  ( (ListLongMap!22318 (toList!11174 List!36167)) )
))
(declare-fun lt!667459 () ListLongMap!22317)

(declare-fun lt!667461 () V!59245)

(declare-fun apply!1070 (ListLongMap!22317 (_ BitVec 64)) V!59245)

(assert (=> b!1548931 (= (apply!1070 lt!667459 (select (arr!49865 _keys!618) from!762)) lt!667461)))

(declare-datatypes ((Unit!51437 0))(
  ( (Unit!51438) )
))
(declare-fun lt!667457 () Unit!51437)

(declare-fun zeroValue!436 () V!59245)

(declare-fun lt!667460 () ListLongMap!22317)

(declare-fun addApplyDifferent!608 (ListLongMap!22317 (_ BitVec 64) V!59245 (_ BitVec 64)) Unit!51437)

(assert (=> b!1548931 (= lt!667457 (addApplyDifferent!608 lt!667460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49865 _keys!618) from!762)))))

(declare-fun lt!667465 () V!59245)

(assert (=> b!1548931 (= lt!667465 lt!667461)))

(assert (=> b!1548931 (= lt!667461 (apply!1070 lt!667460 (select (arr!49865 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59245)

(declare-fun +!4992 (ListLongMap!22317 tuple2!24708) ListLongMap!22317)

(assert (=> b!1548931 (= lt!667465 (apply!1070 (+!4992 lt!667460 (tuple2!24709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49865 _keys!618) from!762)))))

(declare-fun lt!667462 () Unit!51437)

(assert (=> b!1548931 (= lt!667462 (addApplyDifferent!608 lt!667460 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49865 _keys!618) from!762)))))

(declare-fun contains!10045 (ListLongMap!22317 (_ BitVec 64)) Bool)

(assert (=> b!1548931 (contains!10045 lt!667459 (select (arr!49865 _keys!618) from!762))))

(assert (=> b!1548931 (= lt!667459 (+!4992 lt!667460 (tuple2!24709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667458 () Unit!51437)

(declare-fun addStillContains!1268 (ListLongMap!22317 (_ BitVec 64) V!59245 (_ BitVec 64)) Unit!51437)

(assert (=> b!1548931 (= lt!667458 (addStillContains!1268 lt!667460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49865 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6620 (array!103324 array!103326 (_ BitVec 32) (_ BitVec 32) V!59245 V!59245 (_ BitVec 32) Int) ListLongMap!22317)

(assert (=> b!1548931 (= lt!667460 (getCurrentListMapNoExtraKeys!6620 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70377 () Bool)

(declare-fun call!70380 () ListLongMap!22317)

(declare-fun call!70383 () ListLongMap!22317)

(assert (=> bm!70377 (= call!70380 call!70383)))

(declare-fun call!70382 () ListLongMap!22317)

(declare-fun call!70381 () ListLongMap!22317)

(declare-fun c!142253 () Bool)

(declare-fun c!142252 () Bool)

(declare-fun bm!70378 () Bool)

(assert (=> bm!70378 (= call!70382 (+!4992 (ite c!142252 call!70381 (ite c!142253 call!70383 call!70380)) (ite (or c!142252 c!142253) (tuple2!24709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70379 () Bool)

(assert (=> bm!70379 (= call!70383 call!70381)))

(declare-fun bm!70380 () Bool)

(declare-fun call!70384 () ListLongMap!22317)

(assert (=> bm!70380 (= call!70384 call!70382)))

(declare-fun b!1548932 () Bool)

(declare-fun res!1061340 () Bool)

(assert (=> b!1548932 (=> (not res!1061340) (not e!862169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548932 (= res!1061340 (validKeyInArray!0 (select (arr!49865 _keys!618) from!762)))))

(declare-fun b!1548933 () Bool)

(declare-fun c!142254 () Bool)

(declare-fun lt!667463 () Bool)

(assert (=> b!1548933 (= c!142254 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667463))))

(declare-fun e!862166 () ListLongMap!22317)

(declare-fun e!862170 () ListLongMap!22317)

(assert (=> b!1548933 (= e!862166 e!862170)))

(declare-fun b!1548934 () Bool)

(declare-fun e!862162 () ListLongMap!22317)

(assert (=> b!1548934 (= e!862162 e!862166)))

(assert (=> b!1548934 (= c!142253 (and (not lt!667463) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548935 () Bool)

(assert (=> b!1548935 (= e!862166 call!70384)))

(declare-fun b!1548936 () Bool)

(declare-fun res!1061341 () Bool)

(assert (=> b!1548936 (=> (not res!1061341) (not e!862168))))

(declare-datatypes ((List!36168 0))(
  ( (Nil!36165) (Cons!36164 (h!37610 (_ BitVec 64)) (t!50854 List!36168)) )
))
(declare-fun arrayNoDuplicates!0 (array!103324 (_ BitVec 32) List!36168) Bool)

(assert (=> b!1548936 (= res!1061341 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36165))))

(declare-fun b!1548937 () Bool)

(assert (=> b!1548937 (= e!862168 e!862169)))

(declare-fun res!1061346 () Bool)

(assert (=> b!1548937 (=> (not res!1061346) (not e!862169))))

(assert (=> b!1548937 (= res!1061346 (bvslt from!762 (size!50417 _keys!618)))))

(declare-fun lt!667464 () ListLongMap!22317)

(assert (=> b!1548937 (= lt!667464 e!862162)))

(assert (=> b!1548937 (= c!142252 (and (not lt!667463) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548937 (= lt!667463 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1061344 () Bool)

(assert (=> start!132062 (=> (not res!1061344) (not e!862168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132062 (= res!1061344 (validMask!0 mask!926))))

(assert (=> start!132062 e!862168))

(declare-fun array_inv!38977 (array!103324) Bool)

(assert (=> start!132062 (array_inv!38977 _keys!618)))

(declare-fun tp_is_empty!38101 () Bool)

(assert (=> start!132062 tp_is_empty!38101))

(assert (=> start!132062 true))

(assert (=> start!132062 tp!111728))

(declare-fun e!862167 () Bool)

(declare-fun array_inv!38978 (array!103326) Bool)

(assert (=> start!132062 (and (array_inv!38978 _values!470) e!862167)))

(declare-fun mapIsEmpty!58855 () Bool)

(declare-fun mapRes!58855 () Bool)

(assert (=> mapIsEmpty!58855 mapRes!58855))

(declare-fun b!1548938 () Bool)

(assert (=> b!1548938 (= e!862162 (+!4992 call!70382 (tuple2!24709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70381 () Bool)

(assert (=> bm!70381 (= call!70381 (getCurrentListMapNoExtraKeys!6620 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548939 () Bool)

(declare-fun e!862163 () Bool)

(assert (=> b!1548939 (= e!862167 (and e!862163 mapRes!58855))))

(declare-fun condMapEmpty!58855 () Bool)

(declare-fun mapDefault!58855 () ValueCell!18140)

(assert (=> b!1548939 (= condMapEmpty!58855 (= (arr!49866 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18140)) mapDefault!58855)))))

(declare-fun mapNonEmpty!58855 () Bool)

(declare-fun tp!111727 () Bool)

(declare-fun e!862165 () Bool)

(assert (=> mapNonEmpty!58855 (= mapRes!58855 (and tp!111727 e!862165))))

(declare-fun mapValue!58855 () ValueCell!18140)

(declare-fun mapKey!58855 () (_ BitVec 32))

(declare-fun mapRest!58855 () (Array (_ BitVec 32) ValueCell!18140))

(assert (=> mapNonEmpty!58855 (= (arr!49866 _values!470) (store mapRest!58855 mapKey!58855 mapValue!58855))))

(declare-fun b!1548940 () Bool)

(assert (=> b!1548940 (= e!862170 call!70384)))

(declare-fun b!1548941 () Bool)

(assert (=> b!1548941 (= e!862163 tp_is_empty!38101)))

(declare-fun b!1548942 () Bool)

(assert (=> b!1548942 (= e!862170 call!70380)))

(declare-fun b!1548943 () Bool)

(assert (=> b!1548943 (= e!862165 tp_is_empty!38101)))

(assert (= (and start!132062 res!1061344) b!1548929))

(assert (= (and b!1548929 res!1061343) b!1548930))

(assert (= (and b!1548930 res!1061342) b!1548936))

(assert (= (and b!1548936 res!1061341) b!1548928))

(assert (= (and b!1548928 res!1061345) b!1548937))

(assert (= (and b!1548937 c!142252) b!1548938))

(assert (= (and b!1548937 (not c!142252)) b!1548934))

(assert (= (and b!1548934 c!142253) b!1548935))

(assert (= (and b!1548934 (not c!142253)) b!1548933))

(assert (= (and b!1548933 c!142254) b!1548940))

(assert (= (and b!1548933 (not c!142254)) b!1548942))

(assert (= (or b!1548940 b!1548942) bm!70377))

(assert (= (or b!1548935 bm!70377) bm!70379))

(assert (= (or b!1548935 b!1548940) bm!70380))

(assert (= (or b!1548938 bm!70379) bm!70381))

(assert (= (or b!1548938 bm!70380) bm!70378))

(assert (= (and b!1548937 res!1061346) b!1548932))

(assert (= (and b!1548932 res!1061340) b!1548931))

(assert (= (and b!1548939 condMapEmpty!58855) mapIsEmpty!58855))

(assert (= (and b!1548939 (not condMapEmpty!58855)) mapNonEmpty!58855))

(get-info :version)

(assert (= (and mapNonEmpty!58855 ((_ is ValueCellFull!18140) mapValue!58855)) b!1548943))

(assert (= (and b!1548939 ((_ is ValueCellFull!18140) mapDefault!58855)) b!1548941))

(assert (= start!132062 b!1548939))

(declare-fun m!1427619 () Bool)

(assert (=> bm!70381 m!1427619))

(declare-fun m!1427621 () Bool)

(assert (=> bm!70378 m!1427621))

(declare-fun m!1427623 () Bool)

(assert (=> mapNonEmpty!58855 m!1427623))

(declare-fun m!1427625 () Bool)

(assert (=> b!1548930 m!1427625))

(declare-fun m!1427627 () Bool)

(assert (=> b!1548936 m!1427627))

(declare-fun m!1427629 () Bool)

(assert (=> start!132062 m!1427629))

(declare-fun m!1427631 () Bool)

(assert (=> start!132062 m!1427631))

(declare-fun m!1427633 () Bool)

(assert (=> start!132062 m!1427633))

(declare-fun m!1427635 () Bool)

(assert (=> b!1548938 m!1427635))

(declare-fun m!1427637 () Bool)

(assert (=> b!1548931 m!1427637))

(declare-fun m!1427639 () Bool)

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427641 () Bool)

(assert (=> b!1548931 m!1427641))

(assert (=> b!1548931 m!1427619))

(assert (=> b!1548931 m!1427639))

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427643 () Bool)

(assert (=> b!1548931 m!1427643))

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427645 () Bool)

(assert (=> b!1548931 m!1427645))

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427647 () Bool)

(assert (=> b!1548931 m!1427647))

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427649 () Bool)

(assert (=> b!1548931 m!1427649))

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427651 () Bool)

(assert (=> b!1548931 m!1427651))

(declare-fun m!1427653 () Bool)

(assert (=> b!1548931 m!1427653))

(assert (=> b!1548931 m!1427639))

(declare-fun m!1427655 () Bool)

(assert (=> b!1548931 m!1427655))

(assert (=> b!1548931 m!1427637))

(assert (=> b!1548932 m!1427639))

(assert (=> b!1548932 m!1427639))

(declare-fun m!1427657 () Bool)

(assert (=> b!1548932 m!1427657))

(check-sat (not b_next!31825) (not b!1548938) (not b!1548930) b_and!51217 (not start!132062) tp_is_empty!38101 (not bm!70381) (not mapNonEmpty!58855) (not b!1548932) (not b!1548936) (not b!1548931) (not bm!70378))
(check-sat b_and!51217 (not b_next!31825))
