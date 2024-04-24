; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37850 () Bool)

(assert start!37850)

(declare-fun b_free!8923 () Bool)

(declare-fun b_next!8923 () Bool)

(assert (=> start!37850 (= b_free!8923 (not b_next!8923))))

(declare-fun tp!31526 () Bool)

(declare-fun b_and!16203 () Bool)

(assert (=> start!37850 (= tp!31526 b_and!16203)))

(declare-fun b!389106 () Bool)

(declare-fun res!222577 () Bool)

(declare-fun e!235746 () Bool)

(assert (=> b!389106 (=> (not res!222577) (not e!235746))))

(declare-datatypes ((array!23070 0))(
  ( (array!23071 (arr!11001 (Array (_ BitVec 32) (_ BitVec 64))) (size!11353 (_ BitVec 32))) )
))
(declare-fun lt!182905 () array!23070)

(declare-datatypes ((List!6226 0))(
  ( (Nil!6223) (Cons!6222 (h!7078 (_ BitVec 64)) (t!11372 List!6226)) )
))
(declare-fun arrayNoDuplicates!0 (array!23070 (_ BitVec 32) List!6226) Bool)

(assert (=> b!389106 (= res!222577 (arrayNoDuplicates!0 lt!182905 #b00000000000000000000000000000000 Nil!6223))))

(declare-fun b!389107 () Bool)

(declare-fun res!222572 () Bool)

(declare-fun e!235752 () Bool)

(assert (=> b!389107 (=> (not res!222572) (not e!235752))))

(declare-datatypes ((V!13899 0))(
  ( (V!13900 (val!4842 Int)) )
))
(declare-datatypes ((tuple2!6374 0))(
  ( (tuple2!6375 (_1!3198 (_ BitVec 64)) (_2!3198 V!13899)) )
))
(declare-fun lt!182900 () tuple2!6374)

(declare-datatypes ((List!6227 0))(
  ( (Nil!6224) (Cons!6223 (h!7079 tuple2!6374) (t!11373 List!6227)) )
))
(declare-datatypes ((ListLongMap!5289 0))(
  ( (ListLongMap!5290 (toList!2660 List!6227)) )
))
(declare-fun lt!182902 () ListLongMap!5289)

(declare-fun lt!182904 () tuple2!6374)

(declare-fun lt!182901 () ListLongMap!5289)

(declare-fun +!1014 (ListLongMap!5289 tuple2!6374) ListLongMap!5289)

(assert (=> b!389107 (= res!222572 (= lt!182901 (+!1014 (+!1014 lt!182902 lt!182900) lt!182904)))))

(declare-fun b!389108 () Bool)

(declare-fun res!222573 () Bool)

(declare-fun e!235750 () Bool)

(assert (=> b!389108 (=> (not res!222573) (not e!235750))))

(declare-fun _keys!658 () array!23070)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23070 (_ BitVec 32)) Bool)

(assert (=> b!389108 (= res!222573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389109 () Bool)

(declare-fun res!222583 () Bool)

(assert (=> b!389109 (=> (not res!222583) (not e!235750))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389109 (= res!222583 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11353 _keys!658))))))

(declare-fun b!389110 () Bool)

(declare-fun res!222582 () Bool)

(assert (=> b!389110 (=> (not res!222582) (not e!235750))))

(assert (=> b!389110 (= res!222582 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6223))))

(declare-fun b!389111 () Bool)

(declare-fun e!235751 () Bool)

(declare-fun tp_is_empty!9595 () Bool)

(assert (=> b!389111 (= e!235751 tp_is_empty!9595)))

(declare-fun mapNonEmpty!15963 () Bool)

(declare-fun mapRes!15963 () Bool)

(declare-fun tp!31527 () Bool)

(assert (=> mapNonEmpty!15963 (= mapRes!15963 (and tp!31527 e!235751))))

(declare-datatypes ((ValueCell!4454 0))(
  ( (ValueCellFull!4454 (v!7048 V!13899)) (EmptyCell!4454) )
))
(declare-datatypes ((array!23072 0))(
  ( (array!23073 (arr!11002 (Array (_ BitVec 32) ValueCell!4454)) (size!11354 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23072)

(declare-fun mapRest!15963 () (Array (_ BitVec 32) ValueCell!4454))

(declare-fun mapValue!15963 () ValueCell!4454)

(declare-fun mapKey!15963 () (_ BitVec 32))

(assert (=> mapNonEmpty!15963 (= (arr!11002 _values!506) (store mapRest!15963 mapKey!15963 mapValue!15963))))

(declare-fun b!389112 () Bool)

(declare-fun e!235749 () Bool)

(assert (=> b!389112 (= e!235749 tp_is_empty!9595)))

(declare-fun b!389113 () Bool)

(declare-fun e!235748 () Bool)

(assert (=> b!389113 (= e!235746 (not e!235748))))

(declare-fun res!222584 () Bool)

(assert (=> b!389113 (=> res!222584 e!235748)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389113 (= res!222584 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13899)

(declare-fun minValue!472 () V!13899)

(declare-fun getCurrentListMap!2044 (array!23070 array!23072 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) Int) ListLongMap!5289)

(assert (=> b!389113 (= lt!182901 (getCurrentListMap!2044 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182906 () array!23072)

(declare-fun lt!182898 () ListLongMap!5289)

(assert (=> b!389113 (= lt!182898 (getCurrentListMap!2044 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182899 () ListLongMap!5289)

(declare-fun lt!182897 () ListLongMap!5289)

(assert (=> b!389113 (and (= lt!182899 lt!182897) (= lt!182897 lt!182899))))

(declare-fun v!373 () V!13899)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!389113 (= lt!182897 (+!1014 lt!182902 (tuple2!6375 k0!778 v!373)))))

(declare-datatypes ((Unit!11895 0))(
  ( (Unit!11896) )
))
(declare-fun lt!182903 () Unit!11895)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!235 (array!23070 array!23072 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) (_ BitVec 64) V!13899 (_ BitVec 32) Int) Unit!11895)

(assert (=> b!389113 (= lt!182903 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!235 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!933 (array!23070 array!23072 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) Int) ListLongMap!5289)

(assert (=> b!389113 (= lt!182899 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389113 (= lt!182906 (array!23073 (store (arr!11002 _values!506) i!548 (ValueCellFull!4454 v!373)) (size!11354 _values!506)))))

(assert (=> b!389113 (= lt!182902 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389114 () Bool)

(declare-fun res!222576 () Bool)

(assert (=> b!389114 (=> (not res!222576) (not e!235750))))

(declare-fun arrayContainsKey!0 (array!23070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389114 (= res!222576 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389115 () Bool)

(declare-fun e!235745 () Bool)

(assert (=> b!389115 (= e!235745 (and e!235749 mapRes!15963))))

(declare-fun condMapEmpty!15963 () Bool)

(declare-fun mapDefault!15963 () ValueCell!4454)

(assert (=> b!389115 (= condMapEmpty!15963 (= (arr!11002 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4454)) mapDefault!15963)))))

(declare-fun res!222574 () Bool)

(assert (=> start!37850 (=> (not res!222574) (not e!235750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37850 (= res!222574 (validMask!0 mask!970))))

(assert (=> start!37850 e!235750))

(declare-fun array_inv!8132 (array!23072) Bool)

(assert (=> start!37850 (and (array_inv!8132 _values!506) e!235745)))

(assert (=> start!37850 tp!31526))

(assert (=> start!37850 true))

(assert (=> start!37850 tp_is_empty!9595))

(declare-fun array_inv!8133 (array!23070) Bool)

(assert (=> start!37850 (array_inv!8133 _keys!658)))

(declare-fun b!389116 () Bool)

(declare-fun res!222578 () Bool)

(assert (=> b!389116 (=> (not res!222578) (not e!235750))))

(assert (=> b!389116 (= res!222578 (and (= (size!11354 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11353 _keys!658) (size!11354 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15963 () Bool)

(assert (=> mapIsEmpty!15963 mapRes!15963))

(declare-fun b!389117 () Bool)

(declare-fun res!222579 () Bool)

(assert (=> b!389117 (=> (not res!222579) (not e!235750))))

(assert (=> b!389117 (= res!222579 (or (= (select (arr!11001 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11001 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389118 () Bool)

(assert (=> b!389118 (= e!235750 e!235746)))

(declare-fun res!222575 () Bool)

(assert (=> b!389118 (=> (not res!222575) (not e!235746))))

(assert (=> b!389118 (= res!222575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182905 mask!970))))

(assert (=> b!389118 (= lt!182905 (array!23071 (store (arr!11001 _keys!658) i!548 k0!778) (size!11353 _keys!658)))))

(declare-fun b!389119 () Bool)

(assert (=> b!389119 (= e!235748 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389119 e!235752))

(declare-fun res!222580 () Bool)

(assert (=> b!389119 (=> (not res!222580) (not e!235752))))

(assert (=> b!389119 (= res!222580 (= lt!182898 (+!1014 (+!1014 lt!182899 lt!182900) lt!182904)))))

(assert (=> b!389119 (= lt!182904 (tuple2!6375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389119 (= lt!182900 (tuple2!6375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389120 () Bool)

(declare-fun res!222581 () Bool)

(assert (=> b!389120 (=> (not res!222581) (not e!235750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389120 (= res!222581 (validKeyInArray!0 k0!778))))

(declare-fun b!389121 () Bool)

(assert (=> b!389121 (= e!235752 (= lt!182898 (+!1014 (+!1014 lt!182897 lt!182900) lt!182904)))))

(assert (= (and start!37850 res!222574) b!389116))

(assert (= (and b!389116 res!222578) b!389108))

(assert (= (and b!389108 res!222573) b!389110))

(assert (= (and b!389110 res!222582) b!389109))

(assert (= (and b!389109 res!222583) b!389120))

(assert (= (and b!389120 res!222581) b!389117))

(assert (= (and b!389117 res!222579) b!389114))

(assert (= (and b!389114 res!222576) b!389118))

(assert (= (and b!389118 res!222575) b!389106))

(assert (= (and b!389106 res!222577) b!389113))

(assert (= (and b!389113 (not res!222584)) b!389119))

(assert (= (and b!389119 res!222580) b!389107))

(assert (= (and b!389107 res!222572) b!389121))

(assert (= (and b!389115 condMapEmpty!15963) mapIsEmpty!15963))

(assert (= (and b!389115 (not condMapEmpty!15963)) mapNonEmpty!15963))

(get-info :version)

(assert (= (and mapNonEmpty!15963 ((_ is ValueCellFull!4454) mapValue!15963)) b!389111))

(assert (= (and b!389115 ((_ is ValueCellFull!4454) mapDefault!15963)) b!389112))

(assert (= start!37850 b!389115))

(declare-fun m!385399 () Bool)

(assert (=> b!389108 m!385399))

(declare-fun m!385401 () Bool)

(assert (=> b!389113 m!385401))

(declare-fun m!385403 () Bool)

(assert (=> b!389113 m!385403))

(declare-fun m!385405 () Bool)

(assert (=> b!389113 m!385405))

(declare-fun m!385407 () Bool)

(assert (=> b!389113 m!385407))

(declare-fun m!385409 () Bool)

(assert (=> b!389113 m!385409))

(declare-fun m!385411 () Bool)

(assert (=> b!389113 m!385411))

(declare-fun m!385413 () Bool)

(assert (=> b!389113 m!385413))

(declare-fun m!385415 () Bool)

(assert (=> b!389117 m!385415))

(declare-fun m!385417 () Bool)

(assert (=> b!389110 m!385417))

(declare-fun m!385419 () Bool)

(assert (=> b!389120 m!385419))

(declare-fun m!385421 () Bool)

(assert (=> start!37850 m!385421))

(declare-fun m!385423 () Bool)

(assert (=> start!37850 m!385423))

(declare-fun m!385425 () Bool)

(assert (=> start!37850 m!385425))

(declare-fun m!385427 () Bool)

(assert (=> b!389121 m!385427))

(assert (=> b!389121 m!385427))

(declare-fun m!385429 () Bool)

(assert (=> b!389121 m!385429))

(declare-fun m!385431 () Bool)

(assert (=> b!389107 m!385431))

(assert (=> b!389107 m!385431))

(declare-fun m!385433 () Bool)

(assert (=> b!389107 m!385433))

(declare-fun m!385435 () Bool)

(assert (=> b!389118 m!385435))

(declare-fun m!385437 () Bool)

(assert (=> b!389118 m!385437))

(declare-fun m!385439 () Bool)

(assert (=> b!389114 m!385439))

(declare-fun m!385441 () Bool)

(assert (=> b!389119 m!385441))

(assert (=> b!389119 m!385441))

(declare-fun m!385443 () Bool)

(assert (=> b!389119 m!385443))

(declare-fun m!385445 () Bool)

(assert (=> mapNonEmpty!15963 m!385445))

(declare-fun m!385447 () Bool)

(assert (=> b!389106 m!385447))

(check-sat (not mapNonEmpty!15963) (not b!389118) (not b!389119) (not b!389107) (not b!389106) (not b!389108) (not b!389121) b_and!16203 (not b!389120) (not b_next!8923) (not start!37850) (not b!389110) (not b!389113) (not b!389114) tp_is_empty!9595)
(check-sat b_and!16203 (not b_next!8923))
(get-model)

(declare-fun d!72907 () Bool)

(declare-fun e!235803 () Bool)

(assert (=> d!72907 e!235803))

(declare-fun res!222667 () Bool)

(assert (=> d!72907 (=> (not res!222667) (not e!235803))))

(declare-fun lt!182976 () ListLongMap!5289)

(declare-fun contains!2425 (ListLongMap!5289 (_ BitVec 64)) Bool)

(assert (=> d!72907 (= res!222667 (contains!2425 lt!182976 (_1!3198 lt!182904)))))

(declare-fun lt!182977 () List!6227)

(assert (=> d!72907 (= lt!182976 (ListLongMap!5290 lt!182977))))

(declare-fun lt!182975 () Unit!11895)

(declare-fun lt!182978 () Unit!11895)

(assert (=> d!72907 (= lt!182975 lt!182978)))

(declare-datatypes ((Option!364 0))(
  ( (Some!363 (v!7054 V!13899)) (None!362) )
))
(declare-fun getValueByKey!358 (List!6227 (_ BitVec 64)) Option!364)

(assert (=> d!72907 (= (getValueByKey!358 lt!182977 (_1!3198 lt!182904)) (Some!363 (_2!3198 lt!182904)))))

(declare-fun lemmaContainsTupThenGetReturnValue!180 (List!6227 (_ BitVec 64) V!13899) Unit!11895)

(assert (=> d!72907 (= lt!182978 (lemmaContainsTupThenGetReturnValue!180 lt!182977 (_1!3198 lt!182904) (_2!3198 lt!182904)))))

(declare-fun insertStrictlySorted!183 (List!6227 (_ BitVec 64) V!13899) List!6227)

(assert (=> d!72907 (= lt!182977 (insertStrictlySorted!183 (toList!2660 (+!1014 lt!182897 lt!182900)) (_1!3198 lt!182904) (_2!3198 lt!182904)))))

(assert (=> d!72907 (= (+!1014 (+!1014 lt!182897 lt!182900) lt!182904) lt!182976)))

(declare-fun b!389222 () Bool)

(declare-fun res!222668 () Bool)

(assert (=> b!389222 (=> (not res!222668) (not e!235803))))

(assert (=> b!389222 (= res!222668 (= (getValueByKey!358 (toList!2660 lt!182976) (_1!3198 lt!182904)) (Some!363 (_2!3198 lt!182904))))))

(declare-fun b!389223 () Bool)

(declare-fun contains!2426 (List!6227 tuple2!6374) Bool)

(assert (=> b!389223 (= e!235803 (contains!2426 (toList!2660 lt!182976) lt!182904))))

(assert (= (and d!72907 res!222667) b!389222))

(assert (= (and b!389222 res!222668) b!389223))

(declare-fun m!385549 () Bool)

(assert (=> d!72907 m!385549))

(declare-fun m!385551 () Bool)

(assert (=> d!72907 m!385551))

(declare-fun m!385553 () Bool)

(assert (=> d!72907 m!385553))

(declare-fun m!385555 () Bool)

(assert (=> d!72907 m!385555))

(declare-fun m!385557 () Bool)

(assert (=> b!389222 m!385557))

(declare-fun m!385559 () Bool)

(assert (=> b!389223 m!385559))

(assert (=> b!389121 d!72907))

(declare-fun d!72909 () Bool)

(declare-fun e!235804 () Bool)

(assert (=> d!72909 e!235804))

(declare-fun res!222669 () Bool)

(assert (=> d!72909 (=> (not res!222669) (not e!235804))))

(declare-fun lt!182980 () ListLongMap!5289)

(assert (=> d!72909 (= res!222669 (contains!2425 lt!182980 (_1!3198 lt!182900)))))

(declare-fun lt!182981 () List!6227)

(assert (=> d!72909 (= lt!182980 (ListLongMap!5290 lt!182981))))

(declare-fun lt!182979 () Unit!11895)

(declare-fun lt!182982 () Unit!11895)

(assert (=> d!72909 (= lt!182979 lt!182982)))

(assert (=> d!72909 (= (getValueByKey!358 lt!182981 (_1!3198 lt!182900)) (Some!363 (_2!3198 lt!182900)))))

(assert (=> d!72909 (= lt!182982 (lemmaContainsTupThenGetReturnValue!180 lt!182981 (_1!3198 lt!182900) (_2!3198 lt!182900)))))

(assert (=> d!72909 (= lt!182981 (insertStrictlySorted!183 (toList!2660 lt!182897) (_1!3198 lt!182900) (_2!3198 lt!182900)))))

(assert (=> d!72909 (= (+!1014 lt!182897 lt!182900) lt!182980)))

(declare-fun b!389224 () Bool)

(declare-fun res!222670 () Bool)

(assert (=> b!389224 (=> (not res!222670) (not e!235804))))

(assert (=> b!389224 (= res!222670 (= (getValueByKey!358 (toList!2660 lt!182980) (_1!3198 lt!182900)) (Some!363 (_2!3198 lt!182900))))))

(declare-fun b!389225 () Bool)

(assert (=> b!389225 (= e!235804 (contains!2426 (toList!2660 lt!182980) lt!182900))))

(assert (= (and d!72909 res!222669) b!389224))

(assert (= (and b!389224 res!222670) b!389225))

(declare-fun m!385561 () Bool)

(assert (=> d!72909 m!385561))

(declare-fun m!385563 () Bool)

(assert (=> d!72909 m!385563))

(declare-fun m!385565 () Bool)

(assert (=> d!72909 m!385565))

(declare-fun m!385567 () Bool)

(assert (=> d!72909 m!385567))

(declare-fun m!385569 () Bool)

(assert (=> b!389224 m!385569))

(declare-fun m!385571 () Bool)

(assert (=> b!389225 m!385571))

(assert (=> b!389121 d!72909))

(declare-fun d!72911 () Bool)

(declare-fun e!235805 () Bool)

(assert (=> d!72911 e!235805))

(declare-fun res!222671 () Bool)

(assert (=> d!72911 (=> (not res!222671) (not e!235805))))

(declare-fun lt!182984 () ListLongMap!5289)

(assert (=> d!72911 (= res!222671 (contains!2425 lt!182984 (_1!3198 lt!182904)))))

(declare-fun lt!182985 () List!6227)

(assert (=> d!72911 (= lt!182984 (ListLongMap!5290 lt!182985))))

(declare-fun lt!182983 () Unit!11895)

(declare-fun lt!182986 () Unit!11895)

(assert (=> d!72911 (= lt!182983 lt!182986)))

(assert (=> d!72911 (= (getValueByKey!358 lt!182985 (_1!3198 lt!182904)) (Some!363 (_2!3198 lt!182904)))))

(assert (=> d!72911 (= lt!182986 (lemmaContainsTupThenGetReturnValue!180 lt!182985 (_1!3198 lt!182904) (_2!3198 lt!182904)))))

(assert (=> d!72911 (= lt!182985 (insertStrictlySorted!183 (toList!2660 (+!1014 lt!182902 lt!182900)) (_1!3198 lt!182904) (_2!3198 lt!182904)))))

(assert (=> d!72911 (= (+!1014 (+!1014 lt!182902 lt!182900) lt!182904) lt!182984)))

(declare-fun b!389226 () Bool)

(declare-fun res!222672 () Bool)

(assert (=> b!389226 (=> (not res!222672) (not e!235805))))

(assert (=> b!389226 (= res!222672 (= (getValueByKey!358 (toList!2660 lt!182984) (_1!3198 lt!182904)) (Some!363 (_2!3198 lt!182904))))))

(declare-fun b!389227 () Bool)

(assert (=> b!389227 (= e!235805 (contains!2426 (toList!2660 lt!182984) lt!182904))))

(assert (= (and d!72911 res!222671) b!389226))

(assert (= (and b!389226 res!222672) b!389227))

(declare-fun m!385573 () Bool)

(assert (=> d!72911 m!385573))

(declare-fun m!385575 () Bool)

(assert (=> d!72911 m!385575))

(declare-fun m!385577 () Bool)

(assert (=> d!72911 m!385577))

(declare-fun m!385579 () Bool)

(assert (=> d!72911 m!385579))

(declare-fun m!385581 () Bool)

(assert (=> b!389226 m!385581))

(declare-fun m!385583 () Bool)

(assert (=> b!389227 m!385583))

(assert (=> b!389107 d!72911))

(declare-fun d!72913 () Bool)

(declare-fun e!235806 () Bool)

(assert (=> d!72913 e!235806))

(declare-fun res!222673 () Bool)

(assert (=> d!72913 (=> (not res!222673) (not e!235806))))

(declare-fun lt!182988 () ListLongMap!5289)

(assert (=> d!72913 (= res!222673 (contains!2425 lt!182988 (_1!3198 lt!182900)))))

(declare-fun lt!182989 () List!6227)

(assert (=> d!72913 (= lt!182988 (ListLongMap!5290 lt!182989))))

(declare-fun lt!182987 () Unit!11895)

(declare-fun lt!182990 () Unit!11895)

(assert (=> d!72913 (= lt!182987 lt!182990)))

(assert (=> d!72913 (= (getValueByKey!358 lt!182989 (_1!3198 lt!182900)) (Some!363 (_2!3198 lt!182900)))))

(assert (=> d!72913 (= lt!182990 (lemmaContainsTupThenGetReturnValue!180 lt!182989 (_1!3198 lt!182900) (_2!3198 lt!182900)))))

(assert (=> d!72913 (= lt!182989 (insertStrictlySorted!183 (toList!2660 lt!182902) (_1!3198 lt!182900) (_2!3198 lt!182900)))))

(assert (=> d!72913 (= (+!1014 lt!182902 lt!182900) lt!182988)))

(declare-fun b!389228 () Bool)

(declare-fun res!222674 () Bool)

(assert (=> b!389228 (=> (not res!222674) (not e!235806))))

(assert (=> b!389228 (= res!222674 (= (getValueByKey!358 (toList!2660 lt!182988) (_1!3198 lt!182900)) (Some!363 (_2!3198 lt!182900))))))

(declare-fun b!389229 () Bool)

(assert (=> b!389229 (= e!235806 (contains!2426 (toList!2660 lt!182988) lt!182900))))

(assert (= (and d!72913 res!222673) b!389228))

(assert (= (and b!389228 res!222674) b!389229))

(declare-fun m!385585 () Bool)

(assert (=> d!72913 m!385585))

(declare-fun m!385587 () Bool)

(assert (=> d!72913 m!385587))

(declare-fun m!385589 () Bool)

(assert (=> d!72913 m!385589))

(declare-fun m!385591 () Bool)

(assert (=> d!72913 m!385591))

(declare-fun m!385593 () Bool)

(assert (=> b!389228 m!385593))

(declare-fun m!385595 () Bool)

(assert (=> b!389229 m!385595))

(assert (=> b!389107 d!72913))

(declare-fun d!72915 () Bool)

(assert (=> d!72915 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389120 d!72915))

(declare-fun d!72917 () Bool)

(declare-fun res!222682 () Bool)

(declare-fun e!235817 () Bool)

(assert (=> d!72917 (=> res!222682 e!235817)))

(assert (=> d!72917 (= res!222682 (bvsge #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(assert (=> d!72917 (= (arrayNoDuplicates!0 lt!182905 #b00000000000000000000000000000000 Nil!6223) e!235817)))

(declare-fun b!389240 () Bool)

(declare-fun e!235818 () Bool)

(assert (=> b!389240 (= e!235817 e!235818)))

(declare-fun res!222683 () Bool)

(assert (=> b!389240 (=> (not res!222683) (not e!235818))))

(declare-fun e!235815 () Bool)

(assert (=> b!389240 (= res!222683 (not e!235815))))

(declare-fun res!222681 () Bool)

(assert (=> b!389240 (=> (not res!222681) (not e!235815))))

(assert (=> b!389240 (= res!222681 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(declare-fun bm!27387 () Bool)

(declare-fun call!27390 () Bool)

(declare-fun c!54006 () Bool)

(assert (=> bm!27387 (= call!27390 (arrayNoDuplicates!0 lt!182905 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54006 (Cons!6222 (select (arr!11001 lt!182905) #b00000000000000000000000000000000) Nil!6223) Nil!6223)))))

(declare-fun b!389241 () Bool)

(declare-fun e!235816 () Bool)

(assert (=> b!389241 (= e!235816 call!27390)))

(declare-fun b!389242 () Bool)

(assert (=> b!389242 (= e!235816 call!27390)))

(declare-fun b!389243 () Bool)

(assert (=> b!389243 (= e!235818 e!235816)))

(assert (=> b!389243 (= c!54006 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(declare-fun b!389244 () Bool)

(declare-fun contains!2427 (List!6226 (_ BitVec 64)) Bool)

(assert (=> b!389244 (= e!235815 (contains!2427 Nil!6223 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(assert (= (and d!72917 (not res!222682)) b!389240))

(assert (= (and b!389240 res!222681) b!389244))

(assert (= (and b!389240 res!222683) b!389243))

(assert (= (and b!389243 c!54006) b!389242))

(assert (= (and b!389243 (not c!54006)) b!389241))

(assert (= (or b!389242 b!389241) bm!27387))

(declare-fun m!385597 () Bool)

(assert (=> b!389240 m!385597))

(assert (=> b!389240 m!385597))

(declare-fun m!385599 () Bool)

(assert (=> b!389240 m!385599))

(assert (=> bm!27387 m!385597))

(declare-fun m!385601 () Bool)

(assert (=> bm!27387 m!385601))

(assert (=> b!389243 m!385597))

(assert (=> b!389243 m!385597))

(assert (=> b!389243 m!385599))

(assert (=> b!389244 m!385597))

(assert (=> b!389244 m!385597))

(declare-fun m!385603 () Bool)

(assert (=> b!389244 m!385603))

(assert (=> b!389106 d!72917))

(declare-fun d!72919 () Bool)

(declare-fun res!222688 () Bool)

(declare-fun e!235827 () Bool)

(assert (=> d!72919 (=> res!222688 e!235827)))

(assert (=> d!72919 (= res!222688 (bvsge #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(assert (=> d!72919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182905 mask!970) e!235827)))

(declare-fun b!389253 () Bool)

(declare-fun e!235825 () Bool)

(assert (=> b!389253 (= e!235827 e!235825)))

(declare-fun c!54009 () Bool)

(assert (=> b!389253 (= c!54009 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(declare-fun b!389254 () Bool)

(declare-fun e!235826 () Bool)

(declare-fun call!27393 () Bool)

(assert (=> b!389254 (= e!235826 call!27393)))

(declare-fun bm!27390 () Bool)

(assert (=> bm!27390 (= call!27393 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182905 mask!970))))

(declare-fun b!389255 () Bool)

(assert (=> b!389255 (= e!235825 e!235826)))

(declare-fun lt!182997 () (_ BitVec 64))

(assert (=> b!389255 (= lt!182997 (select (arr!11001 lt!182905) #b00000000000000000000000000000000))))

(declare-fun lt!182998 () Unit!11895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23070 (_ BitVec 64) (_ BitVec 32)) Unit!11895)

(assert (=> b!389255 (= lt!182998 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182905 lt!182997 #b00000000000000000000000000000000))))

(assert (=> b!389255 (arrayContainsKey!0 lt!182905 lt!182997 #b00000000000000000000000000000000)))

(declare-fun lt!182999 () Unit!11895)

(assert (=> b!389255 (= lt!182999 lt!182998)))

(declare-fun res!222689 () Bool)

(declare-datatypes ((SeekEntryResult!3459 0))(
  ( (MissingZero!3459 (index!16015 (_ BitVec 32))) (Found!3459 (index!16016 (_ BitVec 32))) (Intermediate!3459 (undefined!4271 Bool) (index!16017 (_ BitVec 32)) (x!38175 (_ BitVec 32))) (Undefined!3459) (MissingVacant!3459 (index!16018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23070 (_ BitVec 32)) SeekEntryResult!3459)

(assert (=> b!389255 (= res!222689 (= (seekEntryOrOpen!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000) lt!182905 mask!970) (Found!3459 #b00000000000000000000000000000000)))))

(assert (=> b!389255 (=> (not res!222689) (not e!235826))))

(declare-fun b!389256 () Bool)

(assert (=> b!389256 (= e!235825 call!27393)))

(assert (= (and d!72919 (not res!222688)) b!389253))

(assert (= (and b!389253 c!54009) b!389255))

(assert (= (and b!389253 (not c!54009)) b!389256))

(assert (= (and b!389255 res!222689) b!389254))

(assert (= (or b!389254 b!389256) bm!27390))

(assert (=> b!389253 m!385597))

(assert (=> b!389253 m!385597))

(assert (=> b!389253 m!385599))

(declare-fun m!385605 () Bool)

(assert (=> bm!27390 m!385605))

(assert (=> b!389255 m!385597))

(declare-fun m!385607 () Bool)

(assert (=> b!389255 m!385607))

(declare-fun m!385609 () Bool)

(assert (=> b!389255 m!385609))

(assert (=> b!389255 m!385597))

(declare-fun m!385611 () Bool)

(assert (=> b!389255 m!385611))

(assert (=> b!389118 d!72919))

(declare-fun d!72921 () Bool)

(declare-fun res!222694 () Bool)

(declare-fun e!235832 () Bool)

(assert (=> d!72921 (=> res!222694 e!235832)))

(assert (=> d!72921 (= res!222694 (= (select (arr!11001 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72921 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235832)))

(declare-fun b!389261 () Bool)

(declare-fun e!235833 () Bool)

(assert (=> b!389261 (= e!235832 e!235833)))

(declare-fun res!222695 () Bool)

(assert (=> b!389261 (=> (not res!222695) (not e!235833))))

(assert (=> b!389261 (= res!222695 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11353 _keys!658)))))

(declare-fun b!389262 () Bool)

(assert (=> b!389262 (= e!235833 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72921 (not res!222694)) b!389261))

(assert (= (and b!389261 res!222695) b!389262))

(declare-fun m!385613 () Bool)

(assert (=> d!72921 m!385613))

(declare-fun m!385615 () Bool)

(assert (=> b!389262 m!385615))

(assert (=> b!389114 d!72921))

(declare-fun d!72923 () Bool)

(declare-fun res!222697 () Bool)

(declare-fun e!235836 () Bool)

(assert (=> d!72923 (=> res!222697 e!235836)))

(assert (=> d!72923 (= res!222697 (bvsge #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(assert (=> d!72923 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6223) e!235836)))

(declare-fun b!389263 () Bool)

(declare-fun e!235837 () Bool)

(assert (=> b!389263 (= e!235836 e!235837)))

(declare-fun res!222698 () Bool)

(assert (=> b!389263 (=> (not res!222698) (not e!235837))))

(declare-fun e!235834 () Bool)

(assert (=> b!389263 (= res!222698 (not e!235834))))

(declare-fun res!222696 () Bool)

(assert (=> b!389263 (=> (not res!222696) (not e!235834))))

(assert (=> b!389263 (= res!222696 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27391 () Bool)

(declare-fun call!27394 () Bool)

(declare-fun c!54010 () Bool)

(assert (=> bm!27391 (= call!27394 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54010 (Cons!6222 (select (arr!11001 _keys!658) #b00000000000000000000000000000000) Nil!6223) Nil!6223)))))

(declare-fun b!389264 () Bool)

(declare-fun e!235835 () Bool)

(assert (=> b!389264 (= e!235835 call!27394)))

(declare-fun b!389265 () Bool)

(assert (=> b!389265 (= e!235835 call!27394)))

(declare-fun b!389266 () Bool)

(assert (=> b!389266 (= e!235837 e!235835)))

(assert (=> b!389266 (= c!54010 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389267 () Bool)

(assert (=> b!389267 (= e!235834 (contains!2427 Nil!6223 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72923 (not res!222697)) b!389263))

(assert (= (and b!389263 res!222696) b!389267))

(assert (= (and b!389263 res!222698) b!389266))

(assert (= (and b!389266 c!54010) b!389265))

(assert (= (and b!389266 (not c!54010)) b!389264))

(assert (= (or b!389265 b!389264) bm!27391))

(assert (=> b!389263 m!385613))

(assert (=> b!389263 m!385613))

(declare-fun m!385617 () Bool)

(assert (=> b!389263 m!385617))

(assert (=> bm!27391 m!385613))

(declare-fun m!385619 () Bool)

(assert (=> bm!27391 m!385619))

(assert (=> b!389266 m!385613))

(assert (=> b!389266 m!385613))

(assert (=> b!389266 m!385617))

(assert (=> b!389267 m!385613))

(assert (=> b!389267 m!385613))

(declare-fun m!385621 () Bool)

(assert (=> b!389267 m!385621))

(assert (=> b!389110 d!72923))

(declare-fun d!72925 () Bool)

(assert (=> d!72925 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37850 d!72925))

(declare-fun d!72927 () Bool)

(assert (=> d!72927 (= (array_inv!8132 _values!506) (bvsge (size!11354 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37850 d!72927))

(declare-fun d!72929 () Bool)

(assert (=> d!72929 (= (array_inv!8133 _keys!658) (bvsge (size!11353 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37850 d!72929))

(declare-fun d!72931 () Bool)

(declare-fun e!235838 () Bool)

(assert (=> d!72931 e!235838))

(declare-fun res!222699 () Bool)

(assert (=> d!72931 (=> (not res!222699) (not e!235838))))

(declare-fun lt!183001 () ListLongMap!5289)

(assert (=> d!72931 (= res!222699 (contains!2425 lt!183001 (_1!3198 lt!182904)))))

(declare-fun lt!183002 () List!6227)

(assert (=> d!72931 (= lt!183001 (ListLongMap!5290 lt!183002))))

(declare-fun lt!183000 () Unit!11895)

(declare-fun lt!183003 () Unit!11895)

(assert (=> d!72931 (= lt!183000 lt!183003)))

(assert (=> d!72931 (= (getValueByKey!358 lt!183002 (_1!3198 lt!182904)) (Some!363 (_2!3198 lt!182904)))))

(assert (=> d!72931 (= lt!183003 (lemmaContainsTupThenGetReturnValue!180 lt!183002 (_1!3198 lt!182904) (_2!3198 lt!182904)))))

(assert (=> d!72931 (= lt!183002 (insertStrictlySorted!183 (toList!2660 (+!1014 lt!182899 lt!182900)) (_1!3198 lt!182904) (_2!3198 lt!182904)))))

(assert (=> d!72931 (= (+!1014 (+!1014 lt!182899 lt!182900) lt!182904) lt!183001)))

(declare-fun b!389268 () Bool)

(declare-fun res!222700 () Bool)

(assert (=> b!389268 (=> (not res!222700) (not e!235838))))

(assert (=> b!389268 (= res!222700 (= (getValueByKey!358 (toList!2660 lt!183001) (_1!3198 lt!182904)) (Some!363 (_2!3198 lt!182904))))))

(declare-fun b!389269 () Bool)

(assert (=> b!389269 (= e!235838 (contains!2426 (toList!2660 lt!183001) lt!182904))))

(assert (= (and d!72931 res!222699) b!389268))

(assert (= (and b!389268 res!222700) b!389269))

(declare-fun m!385623 () Bool)

(assert (=> d!72931 m!385623))

(declare-fun m!385625 () Bool)

(assert (=> d!72931 m!385625))

(declare-fun m!385627 () Bool)

(assert (=> d!72931 m!385627))

(declare-fun m!385629 () Bool)

(assert (=> d!72931 m!385629))

(declare-fun m!385631 () Bool)

(assert (=> b!389268 m!385631))

(declare-fun m!385633 () Bool)

(assert (=> b!389269 m!385633))

(assert (=> b!389119 d!72931))

(declare-fun d!72933 () Bool)

(declare-fun e!235839 () Bool)

(assert (=> d!72933 e!235839))

(declare-fun res!222701 () Bool)

(assert (=> d!72933 (=> (not res!222701) (not e!235839))))

(declare-fun lt!183005 () ListLongMap!5289)

(assert (=> d!72933 (= res!222701 (contains!2425 lt!183005 (_1!3198 lt!182900)))))

(declare-fun lt!183006 () List!6227)

(assert (=> d!72933 (= lt!183005 (ListLongMap!5290 lt!183006))))

(declare-fun lt!183004 () Unit!11895)

(declare-fun lt!183007 () Unit!11895)

(assert (=> d!72933 (= lt!183004 lt!183007)))

(assert (=> d!72933 (= (getValueByKey!358 lt!183006 (_1!3198 lt!182900)) (Some!363 (_2!3198 lt!182900)))))

(assert (=> d!72933 (= lt!183007 (lemmaContainsTupThenGetReturnValue!180 lt!183006 (_1!3198 lt!182900) (_2!3198 lt!182900)))))

(assert (=> d!72933 (= lt!183006 (insertStrictlySorted!183 (toList!2660 lt!182899) (_1!3198 lt!182900) (_2!3198 lt!182900)))))

(assert (=> d!72933 (= (+!1014 lt!182899 lt!182900) lt!183005)))

(declare-fun b!389270 () Bool)

(declare-fun res!222702 () Bool)

(assert (=> b!389270 (=> (not res!222702) (not e!235839))))

(assert (=> b!389270 (= res!222702 (= (getValueByKey!358 (toList!2660 lt!183005) (_1!3198 lt!182900)) (Some!363 (_2!3198 lt!182900))))))

(declare-fun b!389271 () Bool)

(assert (=> b!389271 (= e!235839 (contains!2426 (toList!2660 lt!183005) lt!182900))))

(assert (= (and d!72933 res!222701) b!389270))

(assert (= (and b!389270 res!222702) b!389271))

(declare-fun m!385635 () Bool)

(assert (=> d!72933 m!385635))

(declare-fun m!385637 () Bool)

(assert (=> d!72933 m!385637))

(declare-fun m!385639 () Bool)

(assert (=> d!72933 m!385639))

(declare-fun m!385641 () Bool)

(assert (=> d!72933 m!385641))

(declare-fun m!385643 () Bool)

(assert (=> b!389270 m!385643))

(declare-fun m!385645 () Bool)

(assert (=> b!389271 m!385645))

(assert (=> b!389119 d!72933))

(declare-fun d!72935 () Bool)

(declare-fun res!222703 () Bool)

(declare-fun e!235842 () Bool)

(assert (=> d!72935 (=> res!222703 e!235842)))

(assert (=> d!72935 (= res!222703 (bvsge #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(assert (=> d!72935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235842)))

(declare-fun b!389272 () Bool)

(declare-fun e!235840 () Bool)

(assert (=> b!389272 (= e!235842 e!235840)))

(declare-fun c!54011 () Bool)

(assert (=> b!389272 (= c!54011 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389273 () Bool)

(declare-fun e!235841 () Bool)

(declare-fun call!27395 () Bool)

(assert (=> b!389273 (= e!235841 call!27395)))

(declare-fun bm!27392 () Bool)

(assert (=> bm!27392 (= call!27395 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!389274 () Bool)

(assert (=> b!389274 (= e!235840 e!235841)))

(declare-fun lt!183008 () (_ BitVec 64))

(assert (=> b!389274 (= lt!183008 (select (arr!11001 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183009 () Unit!11895)

(assert (=> b!389274 (= lt!183009 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!183008 #b00000000000000000000000000000000))))

(assert (=> b!389274 (arrayContainsKey!0 _keys!658 lt!183008 #b00000000000000000000000000000000)))

(declare-fun lt!183010 () Unit!11895)

(assert (=> b!389274 (= lt!183010 lt!183009)))

(declare-fun res!222704 () Bool)

(assert (=> b!389274 (= res!222704 (= (seekEntryOrOpen!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3459 #b00000000000000000000000000000000)))))

(assert (=> b!389274 (=> (not res!222704) (not e!235841))))

(declare-fun b!389275 () Bool)

(assert (=> b!389275 (= e!235840 call!27395)))

(assert (= (and d!72935 (not res!222703)) b!389272))

(assert (= (and b!389272 c!54011) b!389274))

(assert (= (and b!389272 (not c!54011)) b!389275))

(assert (= (and b!389274 res!222704) b!389273))

(assert (= (or b!389273 b!389275) bm!27392))

(assert (=> b!389272 m!385613))

(assert (=> b!389272 m!385613))

(assert (=> b!389272 m!385617))

(declare-fun m!385647 () Bool)

(assert (=> bm!27392 m!385647))

(assert (=> b!389274 m!385613))

(declare-fun m!385649 () Bool)

(assert (=> b!389274 m!385649))

(declare-fun m!385651 () Bool)

(assert (=> b!389274 m!385651))

(assert (=> b!389274 m!385613))

(declare-fun m!385653 () Bool)

(assert (=> b!389274 m!385653))

(assert (=> b!389108 d!72935))

(declare-fun b!389300 () Bool)

(declare-fun e!235862 () Bool)

(declare-fun e!235857 () Bool)

(assert (=> b!389300 (= e!235862 e!235857)))

(assert (=> b!389300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(declare-fun res!222715 () Bool)

(declare-fun lt!183026 () ListLongMap!5289)

(assert (=> b!389300 (= res!222715 (contains!2425 lt!183026 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389300 (=> (not res!222715) (not e!235857))))

(declare-fun b!389301 () Bool)

(declare-fun e!235859 () Bool)

(assert (=> b!389301 (= e!235862 e!235859)))

(declare-fun c!54022 () Bool)

(assert (=> b!389301 (= c!54022 (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(declare-fun b!389302 () Bool)

(assert (=> b!389302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(assert (=> b!389302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11354 _values!506)))))

(declare-fun apply!299 (ListLongMap!5289 (_ BitVec 64)) V!13899)

(declare-fun get!5577 (ValueCell!4454 V!13899) V!13899)

(declare-fun dynLambda!642 (Int (_ BitVec 64)) V!13899)

(assert (=> b!389302 (= e!235857 (= (apply!299 lt!183026 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)) (get!5577 (select (arr!11002 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!27395 () Bool)

(declare-fun call!27398 () ListLongMap!5289)

(assert (=> bm!27395 (= call!27398 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389303 () Bool)

(assert (=> b!389303 (= e!235859 (= lt!183026 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!389304 () Bool)

(declare-fun e!235863 () Bool)

(assert (=> b!389304 (= e!235863 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389304 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!72937 () Bool)

(declare-fun e!235861 () Bool)

(assert (=> d!72937 e!235861))

(declare-fun res!222716 () Bool)

(assert (=> d!72937 (=> (not res!222716) (not e!235861))))

(assert (=> d!72937 (= res!222716 (not (contains!2425 lt!183026 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235860 () ListLongMap!5289)

(assert (=> d!72937 (= lt!183026 e!235860)))

(declare-fun c!54020 () Bool)

(assert (=> d!72937 (= c!54020 (bvsge #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(assert (=> d!72937 (validMask!0 mask!970)))

(assert (=> d!72937 (= (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183026)))

(declare-fun b!389305 () Bool)

(declare-fun lt!183028 () Unit!11895)

(declare-fun lt!183025 () Unit!11895)

(assert (=> b!389305 (= lt!183028 lt!183025)))

(declare-fun lt!183029 () (_ BitVec 64))

(declare-fun lt!183031 () (_ BitVec 64))

(declare-fun lt!183027 () ListLongMap!5289)

(declare-fun lt!183030 () V!13899)

(assert (=> b!389305 (not (contains!2425 (+!1014 lt!183027 (tuple2!6375 lt!183029 lt!183030)) lt!183031))))

(declare-fun addStillNotContains!134 (ListLongMap!5289 (_ BitVec 64) V!13899 (_ BitVec 64)) Unit!11895)

(assert (=> b!389305 (= lt!183025 (addStillNotContains!134 lt!183027 lt!183029 lt!183030 lt!183031))))

(assert (=> b!389305 (= lt!183031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389305 (= lt!183030 (get!5577 (select (arr!11002 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389305 (= lt!183029 (select (arr!11001 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389305 (= lt!183027 call!27398)))

(declare-fun e!235858 () ListLongMap!5289)

(assert (=> b!389305 (= e!235858 (+!1014 call!27398 (tuple2!6375 (select (arr!11001 _keys!658) #b00000000000000000000000000000000) (get!5577 (select (arr!11002 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389306 () Bool)

(declare-fun isEmpty!551 (ListLongMap!5289) Bool)

(assert (=> b!389306 (= e!235859 (isEmpty!551 lt!183026))))

(declare-fun b!389307 () Bool)

(assert (=> b!389307 (= e!235861 e!235862)))

(declare-fun c!54021 () Bool)

(assert (=> b!389307 (= c!54021 e!235863)))

(declare-fun res!222714 () Bool)

(assert (=> b!389307 (=> (not res!222714) (not e!235863))))

(assert (=> b!389307 (= res!222714 (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(declare-fun b!389308 () Bool)

(assert (=> b!389308 (= e!235860 (ListLongMap!5290 Nil!6224))))

(declare-fun b!389309 () Bool)

(assert (=> b!389309 (= e!235860 e!235858)))

(declare-fun c!54023 () Bool)

(assert (=> b!389309 (= c!54023 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389310 () Bool)

(assert (=> b!389310 (= e!235858 call!27398)))

(declare-fun b!389311 () Bool)

(declare-fun res!222713 () Bool)

(assert (=> b!389311 (=> (not res!222713) (not e!235861))))

(assert (=> b!389311 (= res!222713 (not (contains!2425 lt!183026 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!72937 c!54020) b!389308))

(assert (= (and d!72937 (not c!54020)) b!389309))

(assert (= (and b!389309 c!54023) b!389305))

(assert (= (and b!389309 (not c!54023)) b!389310))

(assert (= (or b!389305 b!389310) bm!27395))

(assert (= (and d!72937 res!222716) b!389311))

(assert (= (and b!389311 res!222713) b!389307))

(assert (= (and b!389307 res!222714) b!389304))

(assert (= (and b!389307 c!54021) b!389300))

(assert (= (and b!389307 (not c!54021)) b!389301))

(assert (= (and b!389300 res!222715) b!389302))

(assert (= (and b!389301 c!54022) b!389303))

(assert (= (and b!389301 (not c!54022)) b!389306))

(declare-fun b_lambda!8597 () Bool)

(assert (=> (not b_lambda!8597) (not b!389302)))

(declare-fun t!11379 () Bool)

(declare-fun tb!3105 () Bool)

(assert (=> (and start!37850 (= defaultEntry!514 defaultEntry!514) t!11379) tb!3105))

(declare-fun result!5711 () Bool)

(assert (=> tb!3105 (= result!5711 tp_is_empty!9595)))

(assert (=> b!389302 t!11379))

(declare-fun b_and!16209 () Bool)

(assert (= b_and!16203 (and (=> t!11379 result!5711) b_and!16209)))

(declare-fun b_lambda!8599 () Bool)

(assert (=> (not b_lambda!8599) (not b!389305)))

(assert (=> b!389305 t!11379))

(declare-fun b_and!16211 () Bool)

(assert (= b_and!16209 (and (=> t!11379 result!5711) b_and!16211)))

(declare-fun m!385655 () Bool)

(assert (=> d!72937 m!385655))

(assert (=> d!72937 m!385421))

(assert (=> b!389309 m!385613))

(assert (=> b!389309 m!385613))

(assert (=> b!389309 m!385617))

(declare-fun m!385657 () Bool)

(assert (=> b!389305 m!385657))

(assert (=> b!389305 m!385613))

(declare-fun m!385659 () Bool)

(assert (=> b!389305 m!385659))

(declare-fun m!385661 () Bool)

(assert (=> b!389305 m!385661))

(declare-fun m!385663 () Bool)

(assert (=> b!389305 m!385663))

(declare-fun m!385665 () Bool)

(assert (=> b!389305 m!385665))

(assert (=> b!389305 m!385659))

(declare-fun m!385667 () Bool)

(assert (=> b!389305 m!385667))

(declare-fun m!385669 () Bool)

(assert (=> b!389305 m!385669))

(assert (=> b!389305 m!385661))

(assert (=> b!389305 m!385667))

(declare-fun m!385671 () Bool)

(assert (=> b!389306 m!385671))

(assert (=> b!389300 m!385613))

(assert (=> b!389300 m!385613))

(declare-fun m!385673 () Bool)

(assert (=> b!389300 m!385673))

(assert (=> b!389304 m!385613))

(assert (=> b!389304 m!385613))

(assert (=> b!389304 m!385617))

(declare-fun m!385675 () Bool)

(assert (=> bm!27395 m!385675))

(assert (=> b!389302 m!385613))

(assert (=> b!389302 m!385659))

(assert (=> b!389302 m!385661))

(assert (=> b!389302 m!385659))

(assert (=> b!389302 m!385661))

(assert (=> b!389302 m!385663))

(assert (=> b!389302 m!385613))

(declare-fun m!385677 () Bool)

(assert (=> b!389302 m!385677))

(declare-fun m!385679 () Bool)

(assert (=> b!389311 m!385679))

(assert (=> b!389303 m!385675))

(assert (=> b!389113 d!72937))

(declare-fun b!389356 () Bool)

(declare-fun e!235897 () ListLongMap!5289)

(declare-fun call!27419 () ListLongMap!5289)

(assert (=> b!389356 (= e!235897 call!27419)))

(declare-fun b!389357 () Bool)

(declare-fun res!222737 () Bool)

(declare-fun e!235899 () Bool)

(assert (=> b!389357 (=> (not res!222737) (not e!235899))))

(declare-fun e!235892 () Bool)

(assert (=> b!389357 (= res!222737 e!235892)))

(declare-fun res!222743 () Bool)

(assert (=> b!389357 (=> res!222743 e!235892)))

(declare-fun e!235898 () Bool)

(assert (=> b!389357 (= res!222743 (not e!235898))))

(declare-fun res!222742 () Bool)

(assert (=> b!389357 (=> (not res!222742) (not e!235898))))

(assert (=> b!389357 (= res!222742 (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(declare-fun b!389359 () Bool)

(declare-fun e!235893 () Bool)

(declare-fun lt!183080 () ListLongMap!5289)

(assert (=> b!389359 (= e!235893 (= (apply!299 lt!183080 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)) (get!5577 (select (arr!11002 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11354 _values!506)))))

(assert (=> b!389359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(declare-fun b!389360 () Bool)

(declare-fun call!27415 () ListLongMap!5289)

(assert (=> b!389360 (= e!235897 call!27415)))

(declare-fun b!389361 () Bool)

(declare-fun e!235902 () Unit!11895)

(declare-fun Unit!11901 () Unit!11895)

(assert (=> b!389361 (= e!235902 Unit!11901)))

(declare-fun call!27414 () ListLongMap!5289)

(declare-fun bm!27410 () Bool)

(assert (=> bm!27410 (= call!27414 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389362 () Bool)

(declare-fun e!235894 () ListLongMap!5289)

(declare-fun e!235896 () ListLongMap!5289)

(assert (=> b!389362 (= e!235894 e!235896)))

(declare-fun c!54037 () Bool)

(assert (=> b!389362 (= c!54037 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389363 () Bool)

(declare-fun e!235900 () Bool)

(declare-fun call!27418 () Bool)

(assert (=> b!389363 (= e!235900 (not call!27418))))

(declare-fun b!389364 () Bool)

(declare-fun e!235901 () Bool)

(assert (=> b!389364 (= e!235901 (= (apply!299 lt!183080 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389358 () Bool)

(declare-fun e!235891 () Bool)

(declare-fun e!235895 () Bool)

(assert (=> b!389358 (= e!235891 e!235895)))

(declare-fun res!222738 () Bool)

(declare-fun call!27416 () Bool)

(assert (=> b!389358 (= res!222738 call!27416)))

(assert (=> b!389358 (=> (not res!222738) (not e!235895))))

(declare-fun d!72939 () Bool)

(assert (=> d!72939 e!235899))

(declare-fun res!222740 () Bool)

(assert (=> d!72939 (=> (not res!222740) (not e!235899))))

(assert (=> d!72939 (= res!222740 (or (bvsge #b00000000000000000000000000000000 (size!11353 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))))

(declare-fun lt!183089 () ListLongMap!5289)

(assert (=> d!72939 (= lt!183080 lt!183089)))

(declare-fun lt!183079 () Unit!11895)

(assert (=> d!72939 (= lt!183079 e!235902)))

(declare-fun c!54039 () Bool)

(declare-fun e!235890 () Bool)

(assert (=> d!72939 (= c!54039 e!235890)))

(declare-fun res!222739 () Bool)

(assert (=> d!72939 (=> (not res!222739) (not e!235890))))

(assert (=> d!72939 (= res!222739 (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(assert (=> d!72939 (= lt!183089 e!235894)))

(declare-fun c!54038 () Bool)

(assert (=> d!72939 (= c!54038 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72939 (validMask!0 mask!970)))

(assert (=> d!72939 (= (getCurrentListMap!2044 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183080)))

(declare-fun b!389365 () Bool)

(assert (=> b!389365 (= e!235896 call!27419)))

(declare-fun b!389366 () Bool)

(assert (=> b!389366 (= e!235892 e!235893)))

(declare-fun res!222736 () Bool)

(assert (=> b!389366 (=> (not res!222736) (not e!235893))))

(assert (=> b!389366 (= res!222736 (contains!2425 lt!183080 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(declare-fun bm!27411 () Bool)

(declare-fun call!27413 () ListLongMap!5289)

(assert (=> bm!27411 (= call!27419 call!27413)))

(declare-fun bm!27412 () Bool)

(declare-fun call!27417 () ListLongMap!5289)

(assert (=> bm!27412 (= call!27415 call!27417)))

(declare-fun b!389367 () Bool)

(declare-fun c!54040 () Bool)

(assert (=> b!389367 (= c!54040 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!389367 (= e!235896 e!235897)))

(declare-fun b!389368 () Bool)

(declare-fun lt!183090 () Unit!11895)

(assert (=> b!389368 (= e!235902 lt!183090)))

(declare-fun lt!183081 () ListLongMap!5289)

(assert (=> b!389368 (= lt!183081 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183078 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183078 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183097 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183097 (select (arr!11001 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183085 () Unit!11895)

(declare-fun addStillContains!275 (ListLongMap!5289 (_ BitVec 64) V!13899 (_ BitVec 64)) Unit!11895)

(assert (=> b!389368 (= lt!183085 (addStillContains!275 lt!183081 lt!183078 zeroValue!472 lt!183097))))

(assert (=> b!389368 (contains!2425 (+!1014 lt!183081 (tuple2!6375 lt!183078 zeroValue!472)) lt!183097)))

(declare-fun lt!183088 () Unit!11895)

(assert (=> b!389368 (= lt!183088 lt!183085)))

(declare-fun lt!183093 () ListLongMap!5289)

(assert (=> b!389368 (= lt!183093 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183092 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183092 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183084 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183084 (select (arr!11001 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183094 () Unit!11895)

(declare-fun addApplyDifferent!275 (ListLongMap!5289 (_ BitVec 64) V!13899 (_ BitVec 64)) Unit!11895)

(assert (=> b!389368 (= lt!183094 (addApplyDifferent!275 lt!183093 lt!183092 minValue!472 lt!183084))))

(assert (=> b!389368 (= (apply!299 (+!1014 lt!183093 (tuple2!6375 lt!183092 minValue!472)) lt!183084) (apply!299 lt!183093 lt!183084))))

(declare-fun lt!183083 () Unit!11895)

(assert (=> b!389368 (= lt!183083 lt!183094)))

(declare-fun lt!183076 () ListLongMap!5289)

(assert (=> b!389368 (= lt!183076 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183082 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183091 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183091 (select (arr!11001 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183087 () Unit!11895)

(assert (=> b!389368 (= lt!183087 (addApplyDifferent!275 lt!183076 lt!183082 zeroValue!472 lt!183091))))

(assert (=> b!389368 (= (apply!299 (+!1014 lt!183076 (tuple2!6375 lt!183082 zeroValue!472)) lt!183091) (apply!299 lt!183076 lt!183091))))

(declare-fun lt!183096 () Unit!11895)

(assert (=> b!389368 (= lt!183096 lt!183087)))

(declare-fun lt!183077 () ListLongMap!5289)

(assert (=> b!389368 (= lt!183077 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183086 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183095 () (_ BitVec 64))

(assert (=> b!389368 (= lt!183095 (select (arr!11001 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389368 (= lt!183090 (addApplyDifferent!275 lt!183077 lt!183086 minValue!472 lt!183095))))

(assert (=> b!389368 (= (apply!299 (+!1014 lt!183077 (tuple2!6375 lt!183086 minValue!472)) lt!183095) (apply!299 lt!183077 lt!183095))))

(declare-fun b!389369 () Bool)

(assert (=> b!389369 (= e!235900 e!235901)))

(declare-fun res!222741 () Bool)

(assert (=> b!389369 (= res!222741 call!27418)))

(assert (=> b!389369 (=> (not res!222741) (not e!235901))))

(declare-fun bm!27413 () Bool)

(assert (=> bm!27413 (= call!27418 (contains!2425 lt!183080 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389370 () Bool)

(assert (=> b!389370 (= e!235891 (not call!27416))))

(declare-fun bm!27414 () Bool)

(assert (=> bm!27414 (= call!27417 call!27414)))

(declare-fun bm!27415 () Bool)

(assert (=> bm!27415 (= call!27416 (contains!2425 lt!183080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389371 () Bool)

(declare-fun res!222735 () Bool)

(assert (=> b!389371 (=> (not res!222735) (not e!235899))))

(assert (=> b!389371 (= res!222735 e!235891)))

(declare-fun c!54041 () Bool)

(assert (=> b!389371 (= c!54041 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27416 () Bool)

(assert (=> bm!27416 (= call!27413 (+!1014 (ite c!54038 call!27414 (ite c!54037 call!27417 call!27415)) (ite (or c!54038 c!54037) (tuple2!6375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389372 () Bool)

(assert (=> b!389372 (= e!235894 (+!1014 call!27413 (tuple2!6375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!389373 () Bool)

(assert (=> b!389373 (= e!235898 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389374 () Bool)

(assert (=> b!389374 (= e!235895 (= (apply!299 lt!183080 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389375 () Bool)

(assert (=> b!389375 (= e!235890 (validKeyInArray!0 (select (arr!11001 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389376 () Bool)

(assert (=> b!389376 (= e!235899 e!235900)))

(declare-fun c!54036 () Bool)

(assert (=> b!389376 (= c!54036 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!72939 c!54038) b!389372))

(assert (= (and d!72939 (not c!54038)) b!389362))

(assert (= (and b!389362 c!54037) b!389365))

(assert (= (and b!389362 (not c!54037)) b!389367))

(assert (= (and b!389367 c!54040) b!389356))

(assert (= (and b!389367 (not c!54040)) b!389360))

(assert (= (or b!389356 b!389360) bm!27412))

(assert (= (or b!389365 bm!27412) bm!27414))

(assert (= (or b!389365 b!389356) bm!27411))

(assert (= (or b!389372 bm!27414) bm!27410))

(assert (= (or b!389372 bm!27411) bm!27416))

(assert (= (and d!72939 res!222739) b!389375))

(assert (= (and d!72939 c!54039) b!389368))

(assert (= (and d!72939 (not c!54039)) b!389361))

(assert (= (and d!72939 res!222740) b!389357))

(assert (= (and b!389357 res!222742) b!389373))

(assert (= (and b!389357 (not res!222743)) b!389366))

(assert (= (and b!389366 res!222736) b!389359))

(assert (= (and b!389357 res!222737) b!389371))

(assert (= (and b!389371 c!54041) b!389358))

(assert (= (and b!389371 (not c!54041)) b!389370))

(assert (= (and b!389358 res!222738) b!389374))

(assert (= (or b!389358 b!389370) bm!27415))

(assert (= (and b!389371 res!222735) b!389376))

(assert (= (and b!389376 c!54036) b!389369))

(assert (= (and b!389376 (not c!54036)) b!389363))

(assert (= (and b!389369 res!222741) b!389364))

(assert (= (or b!389369 b!389363) bm!27413))

(declare-fun b_lambda!8601 () Bool)

(assert (=> (not b_lambda!8601) (not b!389359)))

(assert (=> b!389359 t!11379))

(declare-fun b_and!16213 () Bool)

(assert (= b_and!16211 (and (=> t!11379 result!5711) b_and!16213)))

(assert (=> b!389359 m!385659))

(assert (=> b!389359 m!385661))

(assert (=> b!389359 m!385659))

(assert (=> b!389359 m!385661))

(assert (=> b!389359 m!385663))

(assert (=> b!389359 m!385613))

(assert (=> b!389359 m!385613))

(declare-fun m!385681 () Bool)

(assert (=> b!389359 m!385681))

(declare-fun m!385683 () Bool)

(assert (=> b!389364 m!385683))

(assert (=> b!389375 m!385613))

(assert (=> b!389375 m!385613))

(assert (=> b!389375 m!385617))

(declare-fun m!385685 () Bool)

(assert (=> bm!27415 m!385685))

(declare-fun m!385687 () Bool)

(assert (=> b!389374 m!385687))

(assert (=> d!72939 m!385421))

(assert (=> bm!27410 m!385401))

(declare-fun m!385689 () Bool)

(assert (=> b!389368 m!385689))

(declare-fun m!385691 () Bool)

(assert (=> b!389368 m!385691))

(declare-fun m!385693 () Bool)

(assert (=> b!389368 m!385693))

(assert (=> b!389368 m!385691))

(declare-fun m!385695 () Bool)

(assert (=> b!389368 m!385695))

(declare-fun m!385697 () Bool)

(assert (=> b!389368 m!385697))

(declare-fun m!385699 () Bool)

(assert (=> b!389368 m!385699))

(assert (=> b!389368 m!385401))

(declare-fun m!385701 () Bool)

(assert (=> b!389368 m!385701))

(declare-fun m!385703 () Bool)

(assert (=> b!389368 m!385703))

(declare-fun m!385705 () Bool)

(assert (=> b!389368 m!385705))

(declare-fun m!385707 () Bool)

(assert (=> b!389368 m!385707))

(declare-fun m!385709 () Bool)

(assert (=> b!389368 m!385709))

(declare-fun m!385711 () Bool)

(assert (=> b!389368 m!385711))

(assert (=> b!389368 m!385709))

(declare-fun m!385713 () Bool)

(assert (=> b!389368 m!385713))

(declare-fun m!385715 () Bool)

(assert (=> b!389368 m!385715))

(assert (=> b!389368 m!385613))

(assert (=> b!389368 m!385701))

(assert (=> b!389368 m!385689))

(declare-fun m!385717 () Bool)

(assert (=> b!389368 m!385717))

(assert (=> b!389373 m!385613))

(assert (=> b!389373 m!385613))

(assert (=> b!389373 m!385617))

(assert (=> b!389366 m!385613))

(assert (=> b!389366 m!385613))

(declare-fun m!385719 () Bool)

(assert (=> b!389366 m!385719))

(declare-fun m!385721 () Bool)

(assert (=> bm!27413 m!385721))

(declare-fun m!385723 () Bool)

(assert (=> bm!27416 m!385723))

(declare-fun m!385725 () Bool)

(assert (=> b!389372 m!385725))

(assert (=> b!389113 d!72939))

(declare-fun b!389377 () Bool)

(declare-fun e!235908 () Bool)

(declare-fun e!235903 () Bool)

(assert (=> b!389377 (= e!235908 e!235903)))

(assert (=> b!389377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(declare-fun res!222746 () Bool)

(declare-fun lt!183099 () ListLongMap!5289)

(assert (=> b!389377 (= res!222746 (contains!2425 lt!183099 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(assert (=> b!389377 (=> (not res!222746) (not e!235903))))

(declare-fun b!389378 () Bool)

(declare-fun e!235905 () Bool)

(assert (=> b!389378 (= e!235908 e!235905)))

(declare-fun c!54044 () Bool)

(assert (=> b!389378 (= c!54044 (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(declare-fun b!389379 () Bool)

(assert (=> b!389379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(assert (=> b!389379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11354 lt!182906)))))

(assert (=> b!389379 (= e!235903 (= (apply!299 lt!183099 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)) (get!5577 (select (arr!11002 lt!182906) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!27420 () ListLongMap!5289)

(declare-fun bm!27417 () Bool)

(assert (=> bm!27417 (= call!27420 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389380 () Bool)

(assert (=> b!389380 (= e!235905 (= lt!183099 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!389381 () Bool)

(declare-fun e!235909 () Bool)

(assert (=> b!389381 (= e!235909 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(assert (=> b!389381 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!72941 () Bool)

(declare-fun e!235907 () Bool)

(assert (=> d!72941 e!235907))

(declare-fun res!222747 () Bool)

(assert (=> d!72941 (=> (not res!222747) (not e!235907))))

(assert (=> d!72941 (= res!222747 (not (contains!2425 lt!183099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235906 () ListLongMap!5289)

(assert (=> d!72941 (= lt!183099 e!235906)))

(declare-fun c!54042 () Bool)

(assert (=> d!72941 (= c!54042 (bvsge #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(assert (=> d!72941 (validMask!0 mask!970)))

(assert (=> d!72941 (= (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183099)))

(declare-fun b!389382 () Bool)

(declare-fun lt!183101 () Unit!11895)

(declare-fun lt!183098 () Unit!11895)

(assert (=> b!389382 (= lt!183101 lt!183098)))

(declare-fun lt!183100 () ListLongMap!5289)

(declare-fun lt!183102 () (_ BitVec 64))

(declare-fun lt!183104 () (_ BitVec 64))

(declare-fun lt!183103 () V!13899)

(assert (=> b!389382 (not (contains!2425 (+!1014 lt!183100 (tuple2!6375 lt!183102 lt!183103)) lt!183104))))

(assert (=> b!389382 (= lt!183098 (addStillNotContains!134 lt!183100 lt!183102 lt!183103 lt!183104))))

(assert (=> b!389382 (= lt!183104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389382 (= lt!183103 (get!5577 (select (arr!11002 lt!182906) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389382 (= lt!183102 (select (arr!11001 lt!182905) #b00000000000000000000000000000000))))

(assert (=> b!389382 (= lt!183100 call!27420)))

(declare-fun e!235904 () ListLongMap!5289)

(assert (=> b!389382 (= e!235904 (+!1014 call!27420 (tuple2!6375 (select (arr!11001 lt!182905) #b00000000000000000000000000000000) (get!5577 (select (arr!11002 lt!182906) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389383 () Bool)

(assert (=> b!389383 (= e!235905 (isEmpty!551 lt!183099))))

(declare-fun b!389384 () Bool)

(assert (=> b!389384 (= e!235907 e!235908)))

(declare-fun c!54043 () Bool)

(assert (=> b!389384 (= c!54043 e!235909)))

(declare-fun res!222745 () Bool)

(assert (=> b!389384 (=> (not res!222745) (not e!235909))))

(assert (=> b!389384 (= res!222745 (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(declare-fun b!389385 () Bool)

(assert (=> b!389385 (= e!235906 (ListLongMap!5290 Nil!6224))))

(declare-fun b!389386 () Bool)

(assert (=> b!389386 (= e!235906 e!235904)))

(declare-fun c!54045 () Bool)

(assert (=> b!389386 (= c!54045 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(declare-fun b!389387 () Bool)

(assert (=> b!389387 (= e!235904 call!27420)))

(declare-fun b!389388 () Bool)

(declare-fun res!222744 () Bool)

(assert (=> b!389388 (=> (not res!222744) (not e!235907))))

(assert (=> b!389388 (= res!222744 (not (contains!2425 lt!183099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!72941 c!54042) b!389385))

(assert (= (and d!72941 (not c!54042)) b!389386))

(assert (= (and b!389386 c!54045) b!389382))

(assert (= (and b!389386 (not c!54045)) b!389387))

(assert (= (or b!389382 b!389387) bm!27417))

(assert (= (and d!72941 res!222747) b!389388))

(assert (= (and b!389388 res!222744) b!389384))

(assert (= (and b!389384 res!222745) b!389381))

(assert (= (and b!389384 c!54043) b!389377))

(assert (= (and b!389384 (not c!54043)) b!389378))

(assert (= (and b!389377 res!222746) b!389379))

(assert (= (and b!389378 c!54044) b!389380))

(assert (= (and b!389378 (not c!54044)) b!389383))

(declare-fun b_lambda!8603 () Bool)

(assert (=> (not b_lambda!8603) (not b!389379)))

(assert (=> b!389379 t!11379))

(declare-fun b_and!16215 () Bool)

(assert (= b_and!16213 (and (=> t!11379 result!5711) b_and!16215)))

(declare-fun b_lambda!8605 () Bool)

(assert (=> (not b_lambda!8605) (not b!389382)))

(assert (=> b!389382 t!11379))

(declare-fun b_and!16217 () Bool)

(assert (= b_and!16215 (and (=> t!11379 result!5711) b_and!16217)))

(declare-fun m!385727 () Bool)

(assert (=> d!72941 m!385727))

(assert (=> d!72941 m!385421))

(assert (=> b!389386 m!385597))

(assert (=> b!389386 m!385597))

(assert (=> b!389386 m!385599))

(declare-fun m!385729 () Bool)

(assert (=> b!389382 m!385729))

(assert (=> b!389382 m!385597))

(declare-fun m!385731 () Bool)

(assert (=> b!389382 m!385731))

(assert (=> b!389382 m!385661))

(declare-fun m!385733 () Bool)

(assert (=> b!389382 m!385733))

(declare-fun m!385735 () Bool)

(assert (=> b!389382 m!385735))

(assert (=> b!389382 m!385731))

(declare-fun m!385737 () Bool)

(assert (=> b!389382 m!385737))

(declare-fun m!385739 () Bool)

(assert (=> b!389382 m!385739))

(assert (=> b!389382 m!385661))

(assert (=> b!389382 m!385737))

(declare-fun m!385741 () Bool)

(assert (=> b!389383 m!385741))

(assert (=> b!389377 m!385597))

(assert (=> b!389377 m!385597))

(declare-fun m!385743 () Bool)

(assert (=> b!389377 m!385743))

(assert (=> b!389381 m!385597))

(assert (=> b!389381 m!385597))

(assert (=> b!389381 m!385599))

(declare-fun m!385745 () Bool)

(assert (=> bm!27417 m!385745))

(assert (=> b!389379 m!385597))

(assert (=> b!389379 m!385731))

(assert (=> b!389379 m!385661))

(assert (=> b!389379 m!385731))

(assert (=> b!389379 m!385661))

(assert (=> b!389379 m!385733))

(assert (=> b!389379 m!385597))

(declare-fun m!385747 () Bool)

(assert (=> b!389379 m!385747))

(declare-fun m!385749 () Bool)

(assert (=> b!389388 m!385749))

(assert (=> b!389380 m!385745))

(assert (=> b!389113 d!72941))

(declare-fun b!389389 () Bool)

(declare-fun e!235917 () ListLongMap!5289)

(declare-fun call!27427 () ListLongMap!5289)

(assert (=> b!389389 (= e!235917 call!27427)))

(declare-fun b!389390 () Bool)

(declare-fun res!222750 () Bool)

(declare-fun e!235919 () Bool)

(assert (=> b!389390 (=> (not res!222750) (not e!235919))))

(declare-fun e!235912 () Bool)

(assert (=> b!389390 (= res!222750 e!235912)))

(declare-fun res!222756 () Bool)

(assert (=> b!389390 (=> res!222756 e!235912)))

(declare-fun e!235918 () Bool)

(assert (=> b!389390 (= res!222756 (not e!235918))))

(declare-fun res!222755 () Bool)

(assert (=> b!389390 (=> (not res!222755) (not e!235918))))

(assert (=> b!389390 (= res!222755 (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(declare-fun lt!183109 () ListLongMap!5289)

(declare-fun e!235913 () Bool)

(declare-fun b!389392 () Bool)

(assert (=> b!389392 (= e!235913 (= (apply!299 lt!183109 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)) (get!5577 (select (arr!11002 lt!182906) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11354 lt!182906)))))

(assert (=> b!389392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(declare-fun b!389393 () Bool)

(declare-fun call!27423 () ListLongMap!5289)

(assert (=> b!389393 (= e!235917 call!27423)))

(declare-fun b!389394 () Bool)

(declare-fun e!235922 () Unit!11895)

(declare-fun Unit!11902 () Unit!11895)

(assert (=> b!389394 (= e!235922 Unit!11902)))

(declare-fun bm!27418 () Bool)

(declare-fun call!27422 () ListLongMap!5289)

(assert (=> bm!27418 (= call!27422 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389395 () Bool)

(declare-fun e!235914 () ListLongMap!5289)

(declare-fun e!235916 () ListLongMap!5289)

(assert (=> b!389395 (= e!235914 e!235916)))

(declare-fun c!54047 () Bool)

(assert (=> b!389395 (= c!54047 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389396 () Bool)

(declare-fun e!235920 () Bool)

(declare-fun call!27426 () Bool)

(assert (=> b!389396 (= e!235920 (not call!27426))))

(declare-fun b!389397 () Bool)

(declare-fun e!235921 () Bool)

(assert (=> b!389397 (= e!235921 (= (apply!299 lt!183109 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389391 () Bool)

(declare-fun e!235911 () Bool)

(declare-fun e!235915 () Bool)

(assert (=> b!389391 (= e!235911 e!235915)))

(declare-fun res!222751 () Bool)

(declare-fun call!27424 () Bool)

(assert (=> b!389391 (= res!222751 call!27424)))

(assert (=> b!389391 (=> (not res!222751) (not e!235915))))

(declare-fun d!72943 () Bool)

(assert (=> d!72943 e!235919))

(declare-fun res!222753 () Bool)

(assert (=> d!72943 (=> (not res!222753) (not e!235919))))

(assert (=> d!72943 (= res!222753 (or (bvsge #b00000000000000000000000000000000 (size!11353 lt!182905)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))))

(declare-fun lt!183118 () ListLongMap!5289)

(assert (=> d!72943 (= lt!183109 lt!183118)))

(declare-fun lt!183108 () Unit!11895)

(assert (=> d!72943 (= lt!183108 e!235922)))

(declare-fun c!54049 () Bool)

(declare-fun e!235910 () Bool)

(assert (=> d!72943 (= c!54049 e!235910)))

(declare-fun res!222752 () Bool)

(assert (=> d!72943 (=> (not res!222752) (not e!235910))))

(assert (=> d!72943 (= res!222752 (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(assert (=> d!72943 (= lt!183118 e!235914)))

(declare-fun c!54048 () Bool)

(assert (=> d!72943 (= c!54048 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72943 (validMask!0 mask!970)))

(assert (=> d!72943 (= (getCurrentListMap!2044 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183109)))

(declare-fun b!389398 () Bool)

(assert (=> b!389398 (= e!235916 call!27427)))

(declare-fun b!389399 () Bool)

(assert (=> b!389399 (= e!235912 e!235913)))

(declare-fun res!222749 () Bool)

(assert (=> b!389399 (=> (not res!222749) (not e!235913))))

(assert (=> b!389399 (= res!222749 (contains!2425 lt!183109 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(assert (=> b!389399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11353 lt!182905)))))

(declare-fun bm!27419 () Bool)

(declare-fun call!27421 () ListLongMap!5289)

(assert (=> bm!27419 (= call!27427 call!27421)))

(declare-fun bm!27420 () Bool)

(declare-fun call!27425 () ListLongMap!5289)

(assert (=> bm!27420 (= call!27423 call!27425)))

(declare-fun b!389400 () Bool)

(declare-fun c!54050 () Bool)

(assert (=> b!389400 (= c!54050 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!389400 (= e!235916 e!235917)))

(declare-fun b!389401 () Bool)

(declare-fun lt!183119 () Unit!11895)

(assert (=> b!389401 (= e!235922 lt!183119)))

(declare-fun lt!183110 () ListLongMap!5289)

(assert (=> b!389401 (= lt!183110 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183107 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183126 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183126 (select (arr!11001 lt!182905) #b00000000000000000000000000000000))))

(declare-fun lt!183114 () Unit!11895)

(assert (=> b!389401 (= lt!183114 (addStillContains!275 lt!183110 lt!183107 zeroValue!472 lt!183126))))

(assert (=> b!389401 (contains!2425 (+!1014 lt!183110 (tuple2!6375 lt!183107 zeroValue!472)) lt!183126)))

(declare-fun lt!183117 () Unit!11895)

(assert (=> b!389401 (= lt!183117 lt!183114)))

(declare-fun lt!183122 () ListLongMap!5289)

(assert (=> b!389401 (= lt!183122 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183121 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183121 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183113 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183113 (select (arr!11001 lt!182905) #b00000000000000000000000000000000))))

(declare-fun lt!183123 () Unit!11895)

(assert (=> b!389401 (= lt!183123 (addApplyDifferent!275 lt!183122 lt!183121 minValue!472 lt!183113))))

(assert (=> b!389401 (= (apply!299 (+!1014 lt!183122 (tuple2!6375 lt!183121 minValue!472)) lt!183113) (apply!299 lt!183122 lt!183113))))

(declare-fun lt!183112 () Unit!11895)

(assert (=> b!389401 (= lt!183112 lt!183123)))

(declare-fun lt!183105 () ListLongMap!5289)

(assert (=> b!389401 (= lt!183105 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183111 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183120 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183120 (select (arr!11001 lt!182905) #b00000000000000000000000000000000))))

(declare-fun lt!183116 () Unit!11895)

(assert (=> b!389401 (= lt!183116 (addApplyDifferent!275 lt!183105 lt!183111 zeroValue!472 lt!183120))))

(assert (=> b!389401 (= (apply!299 (+!1014 lt!183105 (tuple2!6375 lt!183111 zeroValue!472)) lt!183120) (apply!299 lt!183105 lt!183120))))

(declare-fun lt!183125 () Unit!11895)

(assert (=> b!389401 (= lt!183125 lt!183116)))

(declare-fun lt!183106 () ListLongMap!5289)

(assert (=> b!389401 (= lt!183106 (getCurrentListMapNoExtraKeys!933 lt!182905 lt!182906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183115 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183115 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183124 () (_ BitVec 64))

(assert (=> b!389401 (= lt!183124 (select (arr!11001 lt!182905) #b00000000000000000000000000000000))))

(assert (=> b!389401 (= lt!183119 (addApplyDifferent!275 lt!183106 lt!183115 minValue!472 lt!183124))))

(assert (=> b!389401 (= (apply!299 (+!1014 lt!183106 (tuple2!6375 lt!183115 minValue!472)) lt!183124) (apply!299 lt!183106 lt!183124))))

(declare-fun b!389402 () Bool)

(assert (=> b!389402 (= e!235920 e!235921)))

(declare-fun res!222754 () Bool)

(assert (=> b!389402 (= res!222754 call!27426)))

(assert (=> b!389402 (=> (not res!222754) (not e!235921))))

(declare-fun bm!27421 () Bool)

(assert (=> bm!27421 (= call!27426 (contains!2425 lt!183109 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389403 () Bool)

(assert (=> b!389403 (= e!235911 (not call!27424))))

(declare-fun bm!27422 () Bool)

(assert (=> bm!27422 (= call!27425 call!27422)))

(declare-fun bm!27423 () Bool)

(assert (=> bm!27423 (= call!27424 (contains!2425 lt!183109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389404 () Bool)

(declare-fun res!222748 () Bool)

(assert (=> b!389404 (=> (not res!222748) (not e!235919))))

(assert (=> b!389404 (= res!222748 e!235911)))

(declare-fun c!54051 () Bool)

(assert (=> b!389404 (= c!54051 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27424 () Bool)

(assert (=> bm!27424 (= call!27421 (+!1014 (ite c!54048 call!27422 (ite c!54047 call!27425 call!27423)) (ite (or c!54048 c!54047) (tuple2!6375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389405 () Bool)

(assert (=> b!389405 (= e!235914 (+!1014 call!27421 (tuple2!6375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!389406 () Bool)

(assert (=> b!389406 (= e!235918 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(declare-fun b!389407 () Bool)

(assert (=> b!389407 (= e!235915 (= (apply!299 lt!183109 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389408 () Bool)

(assert (=> b!389408 (= e!235910 (validKeyInArray!0 (select (arr!11001 lt!182905) #b00000000000000000000000000000000)))))

(declare-fun b!389409 () Bool)

(assert (=> b!389409 (= e!235919 e!235920)))

(declare-fun c!54046 () Bool)

(assert (=> b!389409 (= c!54046 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!72943 c!54048) b!389405))

(assert (= (and d!72943 (not c!54048)) b!389395))

(assert (= (and b!389395 c!54047) b!389398))

(assert (= (and b!389395 (not c!54047)) b!389400))

(assert (= (and b!389400 c!54050) b!389389))

(assert (= (and b!389400 (not c!54050)) b!389393))

(assert (= (or b!389389 b!389393) bm!27420))

(assert (= (or b!389398 bm!27420) bm!27422))

(assert (= (or b!389398 b!389389) bm!27419))

(assert (= (or b!389405 bm!27422) bm!27418))

(assert (= (or b!389405 bm!27419) bm!27424))

(assert (= (and d!72943 res!222752) b!389408))

(assert (= (and d!72943 c!54049) b!389401))

(assert (= (and d!72943 (not c!54049)) b!389394))

(assert (= (and d!72943 res!222753) b!389390))

(assert (= (and b!389390 res!222755) b!389406))

(assert (= (and b!389390 (not res!222756)) b!389399))

(assert (= (and b!389399 res!222749) b!389392))

(assert (= (and b!389390 res!222750) b!389404))

(assert (= (and b!389404 c!54051) b!389391))

(assert (= (and b!389404 (not c!54051)) b!389403))

(assert (= (and b!389391 res!222751) b!389407))

(assert (= (or b!389391 b!389403) bm!27423))

(assert (= (and b!389404 res!222748) b!389409))

(assert (= (and b!389409 c!54046) b!389402))

(assert (= (and b!389409 (not c!54046)) b!389396))

(assert (= (and b!389402 res!222754) b!389397))

(assert (= (or b!389402 b!389396) bm!27421))

(declare-fun b_lambda!8607 () Bool)

(assert (=> (not b_lambda!8607) (not b!389392)))

(assert (=> b!389392 t!11379))

(declare-fun b_and!16219 () Bool)

(assert (= b_and!16217 (and (=> t!11379 result!5711) b_and!16219)))

(assert (=> b!389392 m!385731))

(assert (=> b!389392 m!385661))

(assert (=> b!389392 m!385731))

(assert (=> b!389392 m!385661))

(assert (=> b!389392 m!385733))

(assert (=> b!389392 m!385597))

(assert (=> b!389392 m!385597))

(declare-fun m!385751 () Bool)

(assert (=> b!389392 m!385751))

(declare-fun m!385753 () Bool)

(assert (=> b!389397 m!385753))

(assert (=> b!389408 m!385597))

(assert (=> b!389408 m!385597))

(assert (=> b!389408 m!385599))

(declare-fun m!385755 () Bool)

(assert (=> bm!27423 m!385755))

(declare-fun m!385757 () Bool)

(assert (=> b!389407 m!385757))

(assert (=> d!72943 m!385421))

(assert (=> bm!27418 m!385413))

(declare-fun m!385759 () Bool)

(assert (=> b!389401 m!385759))

(declare-fun m!385761 () Bool)

(assert (=> b!389401 m!385761))

(declare-fun m!385763 () Bool)

(assert (=> b!389401 m!385763))

(assert (=> b!389401 m!385761))

(declare-fun m!385765 () Bool)

(assert (=> b!389401 m!385765))

(declare-fun m!385767 () Bool)

(assert (=> b!389401 m!385767))

(declare-fun m!385769 () Bool)

(assert (=> b!389401 m!385769))

(assert (=> b!389401 m!385413))

(declare-fun m!385771 () Bool)

(assert (=> b!389401 m!385771))

(declare-fun m!385773 () Bool)

(assert (=> b!389401 m!385773))

(declare-fun m!385775 () Bool)

(assert (=> b!389401 m!385775))

(declare-fun m!385777 () Bool)

(assert (=> b!389401 m!385777))

(declare-fun m!385779 () Bool)

(assert (=> b!389401 m!385779))

(declare-fun m!385781 () Bool)

(assert (=> b!389401 m!385781))

(assert (=> b!389401 m!385779))

(declare-fun m!385783 () Bool)

(assert (=> b!389401 m!385783))

(declare-fun m!385785 () Bool)

(assert (=> b!389401 m!385785))

(assert (=> b!389401 m!385597))

(assert (=> b!389401 m!385771))

(assert (=> b!389401 m!385759))

(declare-fun m!385787 () Bool)

(assert (=> b!389401 m!385787))

(assert (=> b!389406 m!385597))

(assert (=> b!389406 m!385597))

(assert (=> b!389406 m!385599))

(assert (=> b!389399 m!385597))

(assert (=> b!389399 m!385597))

(declare-fun m!385789 () Bool)

(assert (=> b!389399 m!385789))

(declare-fun m!385791 () Bool)

(assert (=> bm!27421 m!385791))

(declare-fun m!385793 () Bool)

(assert (=> bm!27424 m!385793))

(declare-fun m!385795 () Bool)

(assert (=> b!389405 m!385795))

(assert (=> b!389113 d!72943))

(declare-fun d!72945 () Bool)

(declare-fun e!235923 () Bool)

(assert (=> d!72945 e!235923))

(declare-fun res!222757 () Bool)

(assert (=> d!72945 (=> (not res!222757) (not e!235923))))

(declare-fun lt!183128 () ListLongMap!5289)

(assert (=> d!72945 (= res!222757 (contains!2425 lt!183128 (_1!3198 (tuple2!6375 k0!778 v!373))))))

(declare-fun lt!183129 () List!6227)

(assert (=> d!72945 (= lt!183128 (ListLongMap!5290 lt!183129))))

(declare-fun lt!183127 () Unit!11895)

(declare-fun lt!183130 () Unit!11895)

(assert (=> d!72945 (= lt!183127 lt!183130)))

(assert (=> d!72945 (= (getValueByKey!358 lt!183129 (_1!3198 (tuple2!6375 k0!778 v!373))) (Some!363 (_2!3198 (tuple2!6375 k0!778 v!373))))))

(assert (=> d!72945 (= lt!183130 (lemmaContainsTupThenGetReturnValue!180 lt!183129 (_1!3198 (tuple2!6375 k0!778 v!373)) (_2!3198 (tuple2!6375 k0!778 v!373))))))

(assert (=> d!72945 (= lt!183129 (insertStrictlySorted!183 (toList!2660 lt!182902) (_1!3198 (tuple2!6375 k0!778 v!373)) (_2!3198 (tuple2!6375 k0!778 v!373))))))

(assert (=> d!72945 (= (+!1014 lt!182902 (tuple2!6375 k0!778 v!373)) lt!183128)))

(declare-fun b!389410 () Bool)

(declare-fun res!222758 () Bool)

(assert (=> b!389410 (=> (not res!222758) (not e!235923))))

(assert (=> b!389410 (= res!222758 (= (getValueByKey!358 (toList!2660 lt!183128) (_1!3198 (tuple2!6375 k0!778 v!373))) (Some!363 (_2!3198 (tuple2!6375 k0!778 v!373)))))))

(declare-fun b!389411 () Bool)

(assert (=> b!389411 (= e!235923 (contains!2426 (toList!2660 lt!183128) (tuple2!6375 k0!778 v!373)))))

(assert (= (and d!72945 res!222757) b!389410))

(assert (= (and b!389410 res!222758) b!389411))

(declare-fun m!385797 () Bool)

(assert (=> d!72945 m!385797))

(declare-fun m!385799 () Bool)

(assert (=> d!72945 m!385799))

(declare-fun m!385801 () Bool)

(assert (=> d!72945 m!385801))

(declare-fun m!385803 () Bool)

(assert (=> d!72945 m!385803))

(declare-fun m!385805 () Bool)

(assert (=> b!389410 m!385805))

(declare-fun m!385807 () Bool)

(assert (=> b!389411 m!385807))

(assert (=> b!389113 d!72945))

(declare-fun b!389418 () Bool)

(declare-fun e!235929 () Bool)

(declare-fun call!27433 () ListLongMap!5289)

(declare-fun call!27432 () ListLongMap!5289)

(assert (=> b!389418 (= e!235929 (= call!27433 call!27432))))

(declare-fun b!389419 () Bool)

(assert (=> b!389419 (= e!235929 (= call!27433 (+!1014 call!27432 (tuple2!6375 k0!778 v!373))))))

(declare-fun bm!27429 () Bool)

(assert (=> bm!27429 (= call!27432 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389420 () Bool)

(declare-fun e!235928 () Bool)

(assert (=> b!389420 (= e!235928 e!235929)))

(declare-fun c!54054 () Bool)

(assert (=> b!389420 (= c!54054 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun bm!27430 () Bool)

(assert (=> bm!27430 (= call!27433 (getCurrentListMapNoExtraKeys!933 (array!23071 (store (arr!11001 _keys!658) i!548 k0!778) (size!11353 _keys!658)) (array!23073 (store (arr!11002 _values!506) i!548 (ValueCellFull!4454 v!373)) (size!11354 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!72947 () Bool)

(assert (=> d!72947 e!235928))

(declare-fun res!222761 () Bool)

(assert (=> d!72947 (=> (not res!222761) (not e!235928))))

(assert (=> d!72947 (= res!222761 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11353 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11354 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11353 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11354 _values!506))))))))

(declare-fun lt!183133 () Unit!11895)

(declare-fun choose!1320 (array!23070 array!23072 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) (_ BitVec 64) V!13899 (_ BitVec 32) Int) Unit!11895)

(assert (=> d!72947 (= lt!183133 (choose!1320 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11353 _keys!658)))))

(assert (=> d!72947 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!235 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183133)))

(assert (= (and d!72947 res!222761) b!389420))

(assert (= (and b!389420 c!54054) b!389419))

(assert (= (and b!389420 (not c!54054)) b!389418))

(assert (= (or b!389419 b!389418) bm!27429))

(assert (= (or b!389419 b!389418) bm!27430))

(declare-fun m!385809 () Bool)

(assert (=> b!389419 m!385809))

(assert (=> bm!27429 m!385401))

(assert (=> bm!27430 m!385437))

(assert (=> bm!27430 m!385409))

(declare-fun m!385811 () Bool)

(assert (=> bm!27430 m!385811))

(declare-fun m!385813 () Bool)

(assert (=> d!72947 m!385813))

(assert (=> b!389113 d!72947))

(declare-fun b!389428 () Bool)

(declare-fun e!235935 () Bool)

(assert (=> b!389428 (= e!235935 tp_is_empty!9595)))

(declare-fun b!389427 () Bool)

(declare-fun e!235934 () Bool)

(assert (=> b!389427 (= e!235934 tp_is_empty!9595)))

(declare-fun mapNonEmpty!15972 () Bool)

(declare-fun mapRes!15972 () Bool)

(declare-fun tp!31542 () Bool)

(assert (=> mapNonEmpty!15972 (= mapRes!15972 (and tp!31542 e!235934))))

(declare-fun mapRest!15972 () (Array (_ BitVec 32) ValueCell!4454))

(declare-fun mapValue!15972 () ValueCell!4454)

(declare-fun mapKey!15972 () (_ BitVec 32))

(assert (=> mapNonEmpty!15972 (= mapRest!15963 (store mapRest!15972 mapKey!15972 mapValue!15972))))

(declare-fun condMapEmpty!15972 () Bool)

(declare-fun mapDefault!15972 () ValueCell!4454)

(assert (=> mapNonEmpty!15963 (= condMapEmpty!15972 (= mapRest!15963 ((as const (Array (_ BitVec 32) ValueCell!4454)) mapDefault!15972)))))

(assert (=> mapNonEmpty!15963 (= tp!31527 (and e!235935 mapRes!15972))))

(declare-fun mapIsEmpty!15972 () Bool)

(assert (=> mapIsEmpty!15972 mapRes!15972))

(assert (= (and mapNonEmpty!15963 condMapEmpty!15972) mapIsEmpty!15972))

(assert (= (and mapNonEmpty!15963 (not condMapEmpty!15972)) mapNonEmpty!15972))

(assert (= (and mapNonEmpty!15972 ((_ is ValueCellFull!4454) mapValue!15972)) b!389427))

(assert (= (and mapNonEmpty!15963 ((_ is ValueCellFull!4454) mapDefault!15972)) b!389428))

(declare-fun m!385815 () Bool)

(assert (=> mapNonEmpty!15972 m!385815))

(declare-fun b_lambda!8609 () Bool)

(assert (= b_lambda!8605 (or (and start!37850 b_free!8923) b_lambda!8609)))

(declare-fun b_lambda!8611 () Bool)

(assert (= b_lambda!8603 (or (and start!37850 b_free!8923) b_lambda!8611)))

(declare-fun b_lambda!8613 () Bool)

(assert (= b_lambda!8599 (or (and start!37850 b_free!8923) b_lambda!8613)))

(declare-fun b_lambda!8615 () Bool)

(assert (= b_lambda!8597 (or (and start!37850 b_free!8923) b_lambda!8615)))

(declare-fun b_lambda!8617 () Bool)

(assert (= b_lambda!8607 (or (and start!37850 b_free!8923) b_lambda!8617)))

(declare-fun b_lambda!8619 () Bool)

(assert (= b_lambda!8601 (or (and start!37850 b_free!8923) b_lambda!8619)))

(check-sat (not bm!27424) (not b!389223) (not b_lambda!8613) (not b!389399) (not mapNonEmpty!15972) (not b_next!8923) (not b!389222) (not b!389243) (not d!72943) (not d!72909) (not b!389397) (not b!389407) (not b!389274) (not b!389225) (not b_lambda!8611) (not b!389266) (not b!389359) (not b!389263) (not d!72947) (not b!389309) (not b!389224) (not b!389268) (not b!389272) (not b!389381) (not b!389410) (not b_lambda!8617) (not b!389240) (not b!389228) (not bm!27392) (not b_lambda!8615) (not bm!27395) (not b!389300) (not bm!27417) (not b!389303) (not d!72931) (not b!389244) (not d!72941) (not bm!27410) (not b!389374) (not b!389271) (not bm!27416) tp_is_empty!9595 (not bm!27423) (not b!389373) (not b!389364) (not d!72913) (not bm!27390) (not bm!27418) (not b!389388) (not b!389392) (not b!389305) (not d!72911) (not b!389375) (not b_lambda!8619) (not b!389386) (not d!72937) (not b!389380) (not b!389270) (not b!389379) (not bm!27429) (not b!389406) (not b!389262) (not d!72945) (not b!389408) (not b!389405) (not b!389401) (not b!389304) (not b!389368) (not b!389311) (not b!389372) (not bm!27430) (not d!72939) (not bm!27387) (not b!389267) (not b!389306) (not bm!27421) (not d!72907) (not bm!27415) (not b!389411) (not b!389383) (not bm!27391) (not b!389255) b_and!16219 (not b!389366) (not b!389377) (not b!389226) (not bm!27413) (not b!389229) (not b!389253) (not b!389227) (not b_lambda!8609) (not d!72933) (not b!389382) (not b!389269) (not b!389419) (not b!389302))
(check-sat b_and!16219 (not b_next!8923))
