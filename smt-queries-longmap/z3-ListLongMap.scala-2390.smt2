; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37788 () Bool)

(assert start!37788)

(declare-fun b_free!8905 () Bool)

(declare-fun b_next!8905 () Bool)

(assert (=> start!37788 (= b_free!8905 (not b_next!8905))))

(declare-fun tp!31466 () Bool)

(declare-fun b_and!16121 () Bool)

(assert (=> start!37788 (= tp!31466 b_and!16121)))

(declare-fun b!388083 () Bool)

(declare-fun e!235141 () Bool)

(declare-fun e!235140 () Bool)

(declare-fun mapRes!15930 () Bool)

(assert (=> b!388083 (= e!235141 (and e!235140 mapRes!15930))))

(declare-fun condMapEmpty!15930 () Bool)

(declare-datatypes ((V!13875 0))(
  ( (V!13876 (val!4833 Int)) )
))
(declare-datatypes ((ValueCell!4445 0))(
  ( (ValueCellFull!4445 (v!7024 V!13875)) (EmptyCell!4445) )
))
(declare-datatypes ((array!23033 0))(
  ( (array!23034 (arr!10985 (Array (_ BitVec 32) ValueCell!4445)) (size!11338 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23033)

(declare-fun mapDefault!15930 () ValueCell!4445)

(assert (=> b!388083 (= condMapEmpty!15930 (= (arr!10985 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4445)) mapDefault!15930)))))

(declare-fun b!388084 () Bool)

(declare-fun res!221956 () Bool)

(declare-fun e!235144 () Bool)

(assert (=> b!388084 (=> (not res!221956) (not e!235144))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!23035 0))(
  ( (array!23036 (arr!10986 (Array (_ BitVec 32) (_ BitVec 64))) (size!11339 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23035)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!388084 (= res!221956 (and (= (size!11338 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11339 _keys!658) (size!11338 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388085 () Bool)

(declare-fun res!221958 () Bool)

(assert (=> b!388085 (=> (not res!221958) (not e!235144))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388085 (= res!221958 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15930 () Bool)

(assert (=> mapIsEmpty!15930 mapRes!15930))

(declare-fun b!388086 () Bool)

(declare-fun tp_is_empty!9577 () Bool)

(assert (=> b!388086 (= e!235140 tp_is_empty!9577)))

(declare-fun b!388087 () Bool)

(declare-fun res!221957 () Bool)

(assert (=> b!388087 (=> (not res!221957) (not e!235144))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388087 (= res!221957 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11339 _keys!658))))))

(declare-fun b!388088 () Bool)

(declare-fun e!235139 () Bool)

(declare-fun e!235142 () Bool)

(assert (=> b!388088 (= e!235139 (not e!235142))))

(declare-fun res!221954 () Bool)

(assert (=> b!388088 (=> res!221954 e!235142)))

(assert (=> b!388088 (= res!221954 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6476 0))(
  ( (tuple2!6477 (_1!3249 (_ BitVec 64)) (_2!3249 V!13875)) )
))
(declare-datatypes ((List!6320 0))(
  ( (Nil!6317) (Cons!6316 (h!7172 tuple2!6476) (t!11461 List!6320)) )
))
(declare-datatypes ((ListLongMap!5379 0))(
  ( (ListLongMap!5380 (toList!2705 List!6320)) )
))
(declare-fun lt!182085 () ListLongMap!5379)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13875)

(declare-fun minValue!472 () V!13875)

(declare-fun getCurrentListMap!2035 (array!23035 array!23033 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) Int) ListLongMap!5379)

(assert (=> b!388088 (= lt!182085 (getCurrentListMap!2035 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182084 () array!23033)

(declare-fun lt!182080 () ListLongMap!5379)

(declare-fun lt!182081 () array!23035)

(assert (=> b!388088 (= lt!182080 (getCurrentListMap!2035 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182083 () ListLongMap!5379)

(declare-fun lt!182079 () ListLongMap!5379)

(assert (=> b!388088 (and (= lt!182083 lt!182079) (= lt!182079 lt!182083))))

(declare-fun v!373 () V!13875)

(declare-fun lt!182078 () ListLongMap!5379)

(declare-fun +!1025 (ListLongMap!5379 tuple2!6476) ListLongMap!5379)

(assert (=> b!388088 (= lt!182079 (+!1025 lt!182078 (tuple2!6477 k0!778 v!373)))))

(declare-datatypes ((Unit!11892 0))(
  ( (Unit!11893) )
))
(declare-fun lt!182082 () Unit!11892)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!236 (array!23035 array!23033 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) (_ BitVec 64) V!13875 (_ BitVec 32) Int) Unit!11892)

(assert (=> b!388088 (= lt!182082 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!236 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!945 (array!23035 array!23033 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) Int) ListLongMap!5379)

(assert (=> b!388088 (= lt!182083 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388088 (= lt!182084 (array!23034 (store (arr!10985 _values!506) i!548 (ValueCellFull!4445 v!373)) (size!11338 _values!506)))))

(assert (=> b!388088 (= lt!182078 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388089 () Bool)

(declare-fun e!235145 () Bool)

(assert (=> b!388089 (= e!235145 tp_is_empty!9577)))

(declare-fun b!388090 () Bool)

(assert (=> b!388090 (= e!235144 e!235139)))

(declare-fun res!221952 () Bool)

(assert (=> b!388090 (=> (not res!221952) (not e!235139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23035 (_ BitVec 32)) Bool)

(assert (=> b!388090 (= res!221952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182081 mask!970))))

(assert (=> b!388090 (= lt!182081 (array!23036 (store (arr!10986 _keys!658) i!548 k0!778) (size!11339 _keys!658)))))

(declare-fun b!388091 () Bool)

(declare-fun res!221955 () Bool)

(assert (=> b!388091 (=> (not res!221955) (not e!235144))))

(assert (=> b!388091 (= res!221955 (or (= (select (arr!10986 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10986 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388092 () Bool)

(declare-fun res!221951 () Bool)

(assert (=> b!388092 (=> (not res!221951) (not e!235144))))

(assert (=> b!388092 (= res!221951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!221950 () Bool)

(assert (=> start!37788 (=> (not res!221950) (not e!235144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37788 (= res!221950 (validMask!0 mask!970))))

(assert (=> start!37788 e!235144))

(declare-fun array_inv!8078 (array!23033) Bool)

(assert (=> start!37788 (and (array_inv!8078 _values!506) e!235141)))

(assert (=> start!37788 tp!31466))

(assert (=> start!37788 true))

(assert (=> start!37788 tp_is_empty!9577))

(declare-fun array_inv!8079 (array!23035) Bool)

(assert (=> start!37788 (array_inv!8079 _keys!658)))

(declare-fun b!388093 () Bool)

(declare-fun res!221959 () Bool)

(assert (=> b!388093 (=> (not res!221959) (not e!235139))))

(declare-datatypes ((List!6321 0))(
  ( (Nil!6318) (Cons!6317 (h!7173 (_ BitVec 64)) (t!11462 List!6321)) )
))
(declare-fun arrayNoDuplicates!0 (array!23035 (_ BitVec 32) List!6321) Bool)

(assert (=> b!388093 (= res!221959 (arrayNoDuplicates!0 lt!182081 #b00000000000000000000000000000000 Nil!6318))))

(declare-fun b!388094 () Bool)

(declare-fun res!221960 () Bool)

(assert (=> b!388094 (=> (not res!221960) (not e!235144))))

(declare-fun arrayContainsKey!0 (array!23035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388094 (= res!221960 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388095 () Bool)

(declare-fun res!221953 () Bool)

(assert (=> b!388095 (=> (not res!221953) (not e!235144))))

(assert (=> b!388095 (= res!221953 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6318))))

(declare-fun mapNonEmpty!15930 () Bool)

(declare-fun tp!31467 () Bool)

(assert (=> mapNonEmpty!15930 (= mapRes!15930 (and tp!31467 e!235145))))

(declare-fun mapKey!15930 () (_ BitVec 32))

(declare-fun mapValue!15930 () ValueCell!4445)

(declare-fun mapRest!15930 () (Array (_ BitVec 32) ValueCell!4445))

(assert (=> mapNonEmpty!15930 (= (arr!10985 _values!506) (store mapRest!15930 mapKey!15930 mapValue!15930))))

(declare-fun b!388096 () Bool)

(assert (=> b!388096 (= e!235142 (= lt!182080 (+!1025 (+!1025 lt!182083 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (= (and start!37788 res!221950) b!388084))

(assert (= (and b!388084 res!221956) b!388092))

(assert (= (and b!388092 res!221951) b!388095))

(assert (= (and b!388095 res!221953) b!388087))

(assert (= (and b!388087 res!221957) b!388085))

(assert (= (and b!388085 res!221958) b!388091))

(assert (= (and b!388091 res!221955) b!388094))

(assert (= (and b!388094 res!221960) b!388090))

(assert (= (and b!388090 res!221952) b!388093))

(assert (= (and b!388093 res!221959) b!388088))

(assert (= (and b!388088 (not res!221954)) b!388096))

(assert (= (and b!388083 condMapEmpty!15930) mapIsEmpty!15930))

(assert (= (and b!388083 (not condMapEmpty!15930)) mapNonEmpty!15930))

(get-info :version)

(assert (= (and mapNonEmpty!15930 ((_ is ValueCellFull!4445) mapValue!15930)) b!388089))

(assert (= (and b!388083 ((_ is ValueCellFull!4445) mapDefault!15930)) b!388086))

(assert (= start!37788 b!388083))

(declare-fun m!383567 () Bool)

(assert (=> b!388095 m!383567))

(declare-fun m!383569 () Bool)

(assert (=> b!388085 m!383569))

(declare-fun m!383571 () Bool)

(assert (=> mapNonEmpty!15930 m!383571))

(declare-fun m!383573 () Bool)

(assert (=> b!388090 m!383573))

(declare-fun m!383575 () Bool)

(assert (=> b!388090 m!383575))

(declare-fun m!383577 () Bool)

(assert (=> b!388093 m!383577))

(declare-fun m!383579 () Bool)

(assert (=> b!388092 m!383579))

(declare-fun m!383581 () Bool)

(assert (=> b!388088 m!383581))

(declare-fun m!383583 () Bool)

(assert (=> b!388088 m!383583))

(declare-fun m!383585 () Bool)

(assert (=> b!388088 m!383585))

(declare-fun m!383587 () Bool)

(assert (=> b!388088 m!383587))

(declare-fun m!383589 () Bool)

(assert (=> b!388088 m!383589))

(declare-fun m!383591 () Bool)

(assert (=> b!388088 m!383591))

(declare-fun m!383593 () Bool)

(assert (=> b!388088 m!383593))

(declare-fun m!383595 () Bool)

(assert (=> start!37788 m!383595))

(declare-fun m!383597 () Bool)

(assert (=> start!37788 m!383597))

(declare-fun m!383599 () Bool)

(assert (=> start!37788 m!383599))

(declare-fun m!383601 () Bool)

(assert (=> b!388094 m!383601))

(declare-fun m!383603 () Bool)

(assert (=> b!388091 m!383603))

(declare-fun m!383605 () Bool)

(assert (=> b!388096 m!383605))

(assert (=> b!388096 m!383605))

(declare-fun m!383607 () Bool)

(assert (=> b!388096 m!383607))

(check-sat (not mapNonEmpty!15930) (not b!388095) tp_is_empty!9577 (not b!388092) (not b!388090) (not b!388085) (not b_next!8905) (not start!37788) (not b!388094) b_and!16121 (not b!388093) (not b!388088) (not b!388096))
(check-sat b_and!16121 (not b_next!8905))
(get-model)

(declare-fun bm!27283 () Bool)

(declare-fun call!27286 () Bool)

(declare-fun c!53856 () Bool)

(assert (=> bm!27283 (= call!27286 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53856 (Cons!6317 (select (arr!10986 _keys!658) #b00000000000000000000000000000000) Nil!6318) Nil!6318)))))

(declare-fun b!388191 () Bool)

(declare-fun e!235196 () Bool)

(assert (=> b!388191 (= e!235196 call!27286)))

(declare-fun b!388192 () Bool)

(declare-fun e!235198 () Bool)

(declare-fun contains!2430 (List!6321 (_ BitVec 64)) Bool)

(assert (=> b!388192 (= e!235198 (contains!2430 Nil!6318 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72595 () Bool)

(declare-fun res!222033 () Bool)

(declare-fun e!235199 () Bool)

(assert (=> d!72595 (=> res!222033 e!235199)))

(assert (=> d!72595 (= res!222033 (bvsge #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(assert (=> d!72595 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6318) e!235199)))

(declare-fun b!388193 () Bool)

(declare-fun e!235197 () Bool)

(assert (=> b!388193 (= e!235197 e!235196)))

(assert (=> b!388193 (= c!53856 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388194 () Bool)

(assert (=> b!388194 (= e!235199 e!235197)))

(declare-fun res!222035 () Bool)

(assert (=> b!388194 (=> (not res!222035) (not e!235197))))

(assert (=> b!388194 (= res!222035 (not e!235198))))

(declare-fun res!222034 () Bool)

(assert (=> b!388194 (=> (not res!222034) (not e!235198))))

(assert (=> b!388194 (= res!222034 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388195 () Bool)

(assert (=> b!388195 (= e!235196 call!27286)))

(assert (= (and d!72595 (not res!222033)) b!388194))

(assert (= (and b!388194 res!222034) b!388192))

(assert (= (and b!388194 res!222035) b!388193))

(assert (= (and b!388193 c!53856) b!388195))

(assert (= (and b!388193 (not c!53856)) b!388191))

(assert (= (or b!388195 b!388191) bm!27283))

(declare-fun m!383693 () Bool)

(assert (=> bm!27283 m!383693))

(declare-fun m!383695 () Bool)

(assert (=> bm!27283 m!383695))

(assert (=> b!388192 m!383693))

(assert (=> b!388192 m!383693))

(declare-fun m!383697 () Bool)

(assert (=> b!388192 m!383697))

(assert (=> b!388193 m!383693))

(assert (=> b!388193 m!383693))

(declare-fun m!383699 () Bool)

(assert (=> b!388193 m!383699))

(assert (=> b!388194 m!383693))

(assert (=> b!388194 m!383693))

(assert (=> b!388194 m!383699))

(assert (=> b!388095 d!72595))

(declare-fun d!72597 () Bool)

(assert (=> d!72597 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388085 d!72597))

(declare-fun bm!27286 () Bool)

(declare-fun call!27289 () Bool)

(assert (=> bm!27286 (= call!27289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182081 mask!970))))

(declare-fun b!388204 () Bool)

(declare-fun e!235208 () Bool)

(assert (=> b!388204 (= e!235208 call!27289)))

(declare-fun b!388205 () Bool)

(declare-fun e!235206 () Bool)

(assert (=> b!388205 (= e!235206 e!235208)))

(declare-fun c!53859 () Bool)

(assert (=> b!388205 (= c!53859 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun b!388206 () Bool)

(declare-fun e!235207 () Bool)

(assert (=> b!388206 (= e!235207 call!27289)))

(declare-fun d!72599 () Bool)

(declare-fun res!222041 () Bool)

(assert (=> d!72599 (=> res!222041 e!235206)))

(assert (=> d!72599 (= res!222041 (bvsge #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(assert (=> d!72599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182081 mask!970) e!235206)))

(declare-fun b!388207 () Bool)

(assert (=> b!388207 (= e!235208 e!235207)))

(declare-fun lt!182142 () (_ BitVec 64))

(assert (=> b!388207 (= lt!182142 (select (arr!10986 lt!182081) #b00000000000000000000000000000000))))

(declare-fun lt!182141 () Unit!11892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23035 (_ BitVec 64) (_ BitVec 32)) Unit!11892)

(assert (=> b!388207 (= lt!182141 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182081 lt!182142 #b00000000000000000000000000000000))))

(assert (=> b!388207 (arrayContainsKey!0 lt!182081 lt!182142 #b00000000000000000000000000000000)))

(declare-fun lt!182140 () Unit!11892)

(assert (=> b!388207 (= lt!182140 lt!182141)))

(declare-fun res!222040 () Bool)

(declare-datatypes ((SeekEntryResult!3503 0))(
  ( (MissingZero!3503 (index!16191 (_ BitVec 32))) (Found!3503 (index!16192 (_ BitVec 32))) (Intermediate!3503 (undefined!4315 Bool) (index!16193 (_ BitVec 32)) (x!38171 (_ BitVec 32))) (Undefined!3503) (MissingVacant!3503 (index!16194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23035 (_ BitVec 32)) SeekEntryResult!3503)

(assert (=> b!388207 (= res!222040 (= (seekEntryOrOpen!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000) lt!182081 mask!970) (Found!3503 #b00000000000000000000000000000000)))))

(assert (=> b!388207 (=> (not res!222040) (not e!235207))))

(assert (= (and d!72599 (not res!222041)) b!388205))

(assert (= (and b!388205 c!53859) b!388207))

(assert (= (and b!388205 (not c!53859)) b!388204))

(assert (= (and b!388207 res!222040) b!388206))

(assert (= (or b!388206 b!388204) bm!27286))

(declare-fun m!383701 () Bool)

(assert (=> bm!27286 m!383701))

(declare-fun m!383703 () Bool)

(assert (=> b!388205 m!383703))

(assert (=> b!388205 m!383703))

(declare-fun m!383705 () Bool)

(assert (=> b!388205 m!383705))

(assert (=> b!388207 m!383703))

(declare-fun m!383707 () Bool)

(assert (=> b!388207 m!383707))

(declare-fun m!383709 () Bool)

(assert (=> b!388207 m!383709))

(assert (=> b!388207 m!383703))

(declare-fun m!383711 () Bool)

(assert (=> b!388207 m!383711))

(assert (=> b!388090 d!72599))

(declare-fun d!72601 () Bool)

(declare-fun e!235211 () Bool)

(assert (=> d!72601 e!235211))

(declare-fun res!222046 () Bool)

(assert (=> d!72601 (=> (not res!222046) (not e!235211))))

(declare-fun lt!182152 () ListLongMap!5379)

(declare-fun contains!2431 (ListLongMap!5379 (_ BitVec 64)) Bool)

(assert (=> d!72601 (= res!222046 (contains!2431 lt!182152 (_1!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lt!182154 () List!6320)

(assert (=> d!72601 (= lt!182152 (ListLongMap!5380 lt!182154))))

(declare-fun lt!182153 () Unit!11892)

(declare-fun lt!182151 () Unit!11892)

(assert (=> d!72601 (= lt!182153 lt!182151)))

(declare-datatypes ((Option!359 0))(
  ( (Some!358 (v!7030 V!13875)) (None!357) )
))
(declare-fun getValueByKey!353 (List!6320 (_ BitVec 64)) Option!359)

(assert (=> d!72601 (= (getValueByKey!353 lt!182154 (_1!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!358 (_2!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lemmaContainsTupThenGetReturnValue!178 (List!6320 (_ BitVec 64) V!13875) Unit!11892)

(assert (=> d!72601 (= lt!182151 (lemmaContainsTupThenGetReturnValue!178 lt!182154 (_1!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun insertStrictlySorted!181 (List!6320 (_ BitVec 64) V!13875) List!6320)

(assert (=> d!72601 (= lt!182154 (insertStrictlySorted!181 (toList!2705 (+!1025 lt!182083 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (_1!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72601 (= (+!1025 (+!1025 lt!182083 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) lt!182152)))

(declare-fun b!388212 () Bool)

(declare-fun res!222047 () Bool)

(assert (=> b!388212 (=> (not res!222047) (not e!235211))))

(assert (=> b!388212 (= res!222047 (= (getValueByKey!353 (toList!2705 lt!182152) (_1!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!358 (_2!3249 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))))

(declare-fun b!388213 () Bool)

(declare-fun contains!2432 (List!6320 tuple2!6476) Bool)

(assert (=> b!388213 (= e!235211 (contains!2432 (toList!2705 lt!182152) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72601 res!222046) b!388212))

(assert (= (and b!388212 res!222047) b!388213))

(declare-fun m!383713 () Bool)

(assert (=> d!72601 m!383713))

(declare-fun m!383715 () Bool)

(assert (=> d!72601 m!383715))

(declare-fun m!383717 () Bool)

(assert (=> d!72601 m!383717))

(declare-fun m!383719 () Bool)

(assert (=> d!72601 m!383719))

(declare-fun m!383721 () Bool)

(assert (=> b!388212 m!383721))

(declare-fun m!383723 () Bool)

(assert (=> b!388213 m!383723))

(assert (=> b!388096 d!72601))

(declare-fun d!72603 () Bool)

(declare-fun e!235212 () Bool)

(assert (=> d!72603 e!235212))

(declare-fun res!222048 () Bool)

(assert (=> d!72603 (=> (not res!222048) (not e!235212))))

(declare-fun lt!182156 () ListLongMap!5379)

(assert (=> d!72603 (= res!222048 (contains!2431 lt!182156 (_1!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lt!182158 () List!6320)

(assert (=> d!72603 (= lt!182156 (ListLongMap!5380 lt!182158))))

(declare-fun lt!182157 () Unit!11892)

(declare-fun lt!182155 () Unit!11892)

(assert (=> d!72603 (= lt!182157 lt!182155)))

(assert (=> d!72603 (= (getValueByKey!353 lt!182158 (_1!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!358 (_2!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72603 (= lt!182155 (lemmaContainsTupThenGetReturnValue!178 lt!182158 (_1!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72603 (= lt!182158 (insertStrictlySorted!181 (toList!2705 lt!182083) (_1!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72603 (= (+!1025 lt!182083 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) lt!182156)))

(declare-fun b!388214 () Bool)

(declare-fun res!222049 () Bool)

(assert (=> b!388214 (=> (not res!222049) (not e!235212))))

(assert (=> b!388214 (= res!222049 (= (getValueByKey!353 (toList!2705 lt!182156) (_1!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!358 (_2!3249 (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))))

(declare-fun b!388215 () Bool)

(assert (=> b!388215 (= e!235212 (contains!2432 (toList!2705 lt!182156) (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))

(assert (= (and d!72603 res!222048) b!388214))

(assert (= (and b!388214 res!222049) b!388215))

(declare-fun m!383725 () Bool)

(assert (=> d!72603 m!383725))

(declare-fun m!383727 () Bool)

(assert (=> d!72603 m!383727))

(declare-fun m!383729 () Bool)

(assert (=> d!72603 m!383729))

(declare-fun m!383731 () Bool)

(assert (=> d!72603 m!383731))

(declare-fun m!383733 () Bool)

(assert (=> b!388214 m!383733))

(declare-fun m!383735 () Bool)

(assert (=> b!388215 m!383735))

(assert (=> b!388096 d!72603))

(declare-fun bm!27287 () Bool)

(declare-fun call!27290 () Bool)

(assert (=> bm!27287 (= call!27290 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!388216 () Bool)

(declare-fun e!235215 () Bool)

(assert (=> b!388216 (= e!235215 call!27290)))

(declare-fun b!388217 () Bool)

(declare-fun e!235213 () Bool)

(assert (=> b!388217 (= e!235213 e!235215)))

(declare-fun c!53860 () Bool)

(assert (=> b!388217 (= c!53860 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388218 () Bool)

(declare-fun e!235214 () Bool)

(assert (=> b!388218 (= e!235214 call!27290)))

(declare-fun d!72605 () Bool)

(declare-fun res!222051 () Bool)

(assert (=> d!72605 (=> res!222051 e!235213)))

(assert (=> d!72605 (= res!222051 (bvsge #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(assert (=> d!72605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235213)))

(declare-fun b!388219 () Bool)

(assert (=> b!388219 (= e!235215 e!235214)))

(declare-fun lt!182161 () (_ BitVec 64))

(assert (=> b!388219 (= lt!182161 (select (arr!10986 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182160 () Unit!11892)

(assert (=> b!388219 (= lt!182160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182161 #b00000000000000000000000000000000))))

(assert (=> b!388219 (arrayContainsKey!0 _keys!658 lt!182161 #b00000000000000000000000000000000)))

(declare-fun lt!182159 () Unit!11892)

(assert (=> b!388219 (= lt!182159 lt!182160)))

(declare-fun res!222050 () Bool)

(assert (=> b!388219 (= res!222050 (= (seekEntryOrOpen!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3503 #b00000000000000000000000000000000)))))

(assert (=> b!388219 (=> (not res!222050) (not e!235214))))

(assert (= (and d!72605 (not res!222051)) b!388217))

(assert (= (and b!388217 c!53860) b!388219))

(assert (= (and b!388217 (not c!53860)) b!388216))

(assert (= (and b!388219 res!222050) b!388218))

(assert (= (or b!388218 b!388216) bm!27287))

(declare-fun m!383737 () Bool)

(assert (=> bm!27287 m!383737))

(assert (=> b!388217 m!383693))

(assert (=> b!388217 m!383693))

(assert (=> b!388217 m!383699))

(assert (=> b!388219 m!383693))

(declare-fun m!383739 () Bool)

(assert (=> b!388219 m!383739))

(declare-fun m!383741 () Bool)

(assert (=> b!388219 m!383741))

(assert (=> b!388219 m!383693))

(declare-fun m!383743 () Bool)

(assert (=> b!388219 m!383743))

(assert (=> b!388092 d!72605))

(declare-fun bm!27288 () Bool)

(declare-fun call!27291 () Bool)

(declare-fun c!53861 () Bool)

(assert (=> bm!27288 (= call!27291 (arrayNoDuplicates!0 lt!182081 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53861 (Cons!6317 (select (arr!10986 lt!182081) #b00000000000000000000000000000000) Nil!6318) Nil!6318)))))

(declare-fun b!388220 () Bool)

(declare-fun e!235216 () Bool)

(assert (=> b!388220 (= e!235216 call!27291)))

(declare-fun b!388221 () Bool)

(declare-fun e!235218 () Bool)

(assert (=> b!388221 (= e!235218 (contains!2430 Nil!6318 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun d!72607 () Bool)

(declare-fun res!222052 () Bool)

(declare-fun e!235219 () Bool)

(assert (=> d!72607 (=> res!222052 e!235219)))

(assert (=> d!72607 (= res!222052 (bvsge #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(assert (=> d!72607 (= (arrayNoDuplicates!0 lt!182081 #b00000000000000000000000000000000 Nil!6318) e!235219)))

(declare-fun b!388222 () Bool)

(declare-fun e!235217 () Bool)

(assert (=> b!388222 (= e!235217 e!235216)))

(assert (=> b!388222 (= c!53861 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun b!388223 () Bool)

(assert (=> b!388223 (= e!235219 e!235217)))

(declare-fun res!222054 () Bool)

(assert (=> b!388223 (=> (not res!222054) (not e!235217))))

(assert (=> b!388223 (= res!222054 (not e!235218))))

(declare-fun res!222053 () Bool)

(assert (=> b!388223 (=> (not res!222053) (not e!235218))))

(assert (=> b!388223 (= res!222053 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun b!388224 () Bool)

(assert (=> b!388224 (= e!235216 call!27291)))

(assert (= (and d!72607 (not res!222052)) b!388223))

(assert (= (and b!388223 res!222053) b!388221))

(assert (= (and b!388223 res!222054) b!388222))

(assert (= (and b!388222 c!53861) b!388224))

(assert (= (and b!388222 (not c!53861)) b!388220))

(assert (= (or b!388224 b!388220) bm!27288))

(assert (=> bm!27288 m!383703))

(declare-fun m!383745 () Bool)

(assert (=> bm!27288 m!383745))

(assert (=> b!388221 m!383703))

(assert (=> b!388221 m!383703))

(declare-fun m!383747 () Bool)

(assert (=> b!388221 m!383747))

(assert (=> b!388222 m!383703))

(assert (=> b!388222 m!383703))

(assert (=> b!388222 m!383705))

(assert (=> b!388223 m!383703))

(assert (=> b!388223 m!383703))

(assert (=> b!388223 m!383705))

(assert (=> b!388093 d!72607))

(declare-fun b!388249 () Bool)

(declare-fun e!235236 () Bool)

(declare-fun e!235237 () Bool)

(assert (=> b!388249 (= e!235236 e!235237)))

(declare-fun c!53871 () Bool)

(assert (=> b!388249 (= c!53871 (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(declare-fun b!388250 () Bool)

(declare-fun e!235238 () Bool)

(assert (=> b!388250 (= e!235238 e!235236)))

(declare-fun c!53872 () Bool)

(declare-fun e!235235 () Bool)

(assert (=> b!388250 (= c!53872 e!235235)))

(declare-fun res!222066 () Bool)

(assert (=> b!388250 (=> (not res!222066) (not e!235235))))

(assert (=> b!388250 (= res!222066 (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(declare-fun b!388251 () Bool)

(assert (=> b!388251 (= e!235235 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388251 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388252 () Bool)

(assert (=> b!388252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(assert (=> b!388252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11338 _values!506)))))

(declare-fun e!235240 () Bool)

(declare-fun lt!182176 () ListLongMap!5379)

(declare-fun apply!297 (ListLongMap!5379 (_ BitVec 64)) V!13875)

(declare-fun get!5557 (ValueCell!4445 V!13875) V!13875)

(declare-fun dynLambda!631 (Int (_ BitVec 64)) V!13875)

(assert (=> b!388252 (= e!235240 (= (apply!297 lt!182176 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)) (get!5557 (select (arr!10985 _values!506) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!27291 () Bool)

(declare-fun call!27294 () ListLongMap!5379)

(assert (=> bm!27291 (= call!27294 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun d!72609 () Bool)

(assert (=> d!72609 e!235238))

(declare-fun res!222065 () Bool)

(assert (=> d!72609 (=> (not res!222065) (not e!235238))))

(assert (=> d!72609 (= res!222065 (not (contains!2431 lt!182176 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235239 () ListLongMap!5379)

(assert (=> d!72609 (= lt!182176 e!235239)))

(declare-fun c!53873 () Bool)

(assert (=> d!72609 (= c!53873 (bvsge #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(assert (=> d!72609 (validMask!0 mask!970)))

(assert (=> d!72609 (= (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182176)))

(declare-fun b!388253 () Bool)

(declare-fun isEmpty!547 (ListLongMap!5379) Bool)

(assert (=> b!388253 (= e!235237 (isEmpty!547 lt!182176))))

(declare-fun b!388254 () Bool)

(assert (=> b!388254 (= e!235237 (= lt!182176 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388255 () Bool)

(assert (=> b!388255 (= e!235236 e!235240)))

(assert (=> b!388255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(declare-fun res!222063 () Bool)

(assert (=> b!388255 (= res!222063 (contains!2431 lt!182176 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388255 (=> (not res!222063) (not e!235240))))

(declare-fun b!388256 () Bool)

(declare-fun e!235234 () ListLongMap!5379)

(assert (=> b!388256 (= e!235239 e!235234)))

(declare-fun c!53870 () Bool)

(assert (=> b!388256 (= c!53870 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388257 () Bool)

(assert (=> b!388257 (= e!235239 (ListLongMap!5380 Nil!6317))))

(declare-fun b!388258 () Bool)

(declare-fun res!222064 () Bool)

(assert (=> b!388258 (=> (not res!222064) (not e!235238))))

(assert (=> b!388258 (= res!222064 (not (contains!2431 lt!182176 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388259 () Bool)

(declare-fun lt!182180 () Unit!11892)

(declare-fun lt!182181 () Unit!11892)

(assert (=> b!388259 (= lt!182180 lt!182181)))

(declare-fun lt!182178 () V!13875)

(declare-fun lt!182179 () (_ BitVec 64))

(declare-fun lt!182177 () (_ BitVec 64))

(declare-fun lt!182182 () ListLongMap!5379)

(assert (=> b!388259 (not (contains!2431 (+!1025 lt!182182 (tuple2!6477 lt!182179 lt!182178)) lt!182177))))

(declare-fun addStillNotContains!131 (ListLongMap!5379 (_ BitVec 64) V!13875 (_ BitVec 64)) Unit!11892)

(assert (=> b!388259 (= lt!182181 (addStillNotContains!131 lt!182182 lt!182179 lt!182178 lt!182177))))

(assert (=> b!388259 (= lt!182177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388259 (= lt!182178 (get!5557 (select (arr!10985 _values!506) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388259 (= lt!182179 (select (arr!10986 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388259 (= lt!182182 call!27294)))

(assert (=> b!388259 (= e!235234 (+!1025 call!27294 (tuple2!6477 (select (arr!10986 _keys!658) #b00000000000000000000000000000000) (get!5557 (select (arr!10985 _values!506) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!388260 () Bool)

(assert (=> b!388260 (= e!235234 call!27294)))

(assert (= (and d!72609 c!53873) b!388257))

(assert (= (and d!72609 (not c!53873)) b!388256))

(assert (= (and b!388256 c!53870) b!388259))

(assert (= (and b!388256 (not c!53870)) b!388260))

(assert (= (or b!388259 b!388260) bm!27291))

(assert (= (and d!72609 res!222065) b!388258))

(assert (= (and b!388258 res!222064) b!388250))

(assert (= (and b!388250 res!222066) b!388251))

(assert (= (and b!388250 c!53872) b!388255))

(assert (= (and b!388250 (not c!53872)) b!388249))

(assert (= (and b!388255 res!222063) b!388252))

(assert (= (and b!388249 c!53871) b!388254))

(assert (= (and b!388249 (not c!53871)) b!388253))

(declare-fun b_lambda!8509 () Bool)

(assert (=> (not b_lambda!8509) (not b!388252)))

(declare-fun t!11465 () Bool)

(declare-fun tb!3101 () Bool)

(assert (=> (and start!37788 (= defaultEntry!514 defaultEntry!514) t!11465) tb!3101))

(declare-fun result!5699 () Bool)

(assert (=> tb!3101 (= result!5699 tp_is_empty!9577)))

(assert (=> b!388252 t!11465))

(declare-fun b_and!16127 () Bool)

(assert (= b_and!16121 (and (=> t!11465 result!5699) b_and!16127)))

(declare-fun b_lambda!8511 () Bool)

(assert (=> (not b_lambda!8511) (not b!388259)))

(assert (=> b!388259 t!11465))

(declare-fun b_and!16129 () Bool)

(assert (= b_and!16127 (and (=> t!11465 result!5699) b_and!16129)))

(assert (=> b!388256 m!383693))

(assert (=> b!388256 m!383693))

(assert (=> b!388256 m!383699))

(declare-fun m!383749 () Bool)

(assert (=> bm!27291 m!383749))

(declare-fun m!383751 () Bool)

(assert (=> d!72609 m!383751))

(assert (=> d!72609 m!383595))

(declare-fun m!383753 () Bool)

(assert (=> b!388253 m!383753))

(assert (=> b!388254 m!383749))

(assert (=> b!388252 m!383693))

(declare-fun m!383755 () Bool)

(assert (=> b!388252 m!383755))

(declare-fun m!383757 () Bool)

(assert (=> b!388252 m!383757))

(declare-fun m!383759 () Bool)

(assert (=> b!388252 m!383759))

(declare-fun m!383761 () Bool)

(assert (=> b!388252 m!383761))

(assert (=> b!388252 m!383759))

(assert (=> b!388252 m!383693))

(assert (=> b!388252 m!383757))

(assert (=> b!388255 m!383693))

(assert (=> b!388255 m!383693))

(declare-fun m!383763 () Bool)

(assert (=> b!388255 m!383763))

(assert (=> b!388251 m!383693))

(assert (=> b!388251 m!383693))

(assert (=> b!388251 m!383699))

(declare-fun m!383765 () Bool)

(assert (=> b!388258 m!383765))

(declare-fun m!383767 () Bool)

(assert (=> b!388259 m!383767))

(assert (=> b!388259 m!383757))

(assert (=> b!388259 m!383759))

(assert (=> b!388259 m!383761))

(assert (=> b!388259 m!383759))

(declare-fun m!383769 () Bool)

(assert (=> b!388259 m!383769))

(assert (=> b!388259 m!383693))

(assert (=> b!388259 m!383769))

(declare-fun m!383771 () Bool)

(assert (=> b!388259 m!383771))

(assert (=> b!388259 m!383757))

(declare-fun m!383773 () Bool)

(assert (=> b!388259 m!383773))

(assert (=> b!388088 d!72609))

(declare-fun b!388305 () Bool)

(declare-fun e!235269 () Bool)

(assert (=> b!388305 (= e!235269 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388306 () Bool)

(declare-fun e!235277 () ListLongMap!5379)

(declare-fun e!235272 () ListLongMap!5379)

(assert (=> b!388306 (= e!235277 e!235272)))

(declare-fun c!53887 () Bool)

(assert (=> b!388306 (= c!53887 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388307 () Bool)

(declare-fun e!235278 () Bool)

(declare-fun lt!182240 () ListLongMap!5379)

(assert (=> b!388307 (= e!235278 (= (apply!297 lt!182240 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun call!27311 () ListLongMap!5379)

(declare-fun bm!27306 () Bool)

(assert (=> bm!27306 (= call!27311 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388308 () Bool)

(declare-fun e!235275 () Bool)

(assert (=> b!388308 (= e!235275 (validKeyInArray!0 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388309 () Bool)

(declare-fun call!27309 () ListLongMap!5379)

(assert (=> b!388309 (= e!235272 call!27309)))

(declare-fun b!388310 () Bool)

(declare-fun e!235267 () Bool)

(declare-fun call!27312 () Bool)

(assert (=> b!388310 (= e!235267 (not call!27312))))

(declare-fun b!388311 () Bool)

(declare-fun call!27310 () ListLongMap!5379)

(assert (=> b!388311 (= e!235277 (+!1025 call!27310 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388312 () Bool)

(declare-fun res!222092 () Bool)

(declare-fun e!235271 () Bool)

(assert (=> b!388312 (=> (not res!222092) (not e!235271))))

(assert (=> b!388312 (= res!222092 e!235267)))

(declare-fun c!53889 () Bool)

(assert (=> b!388312 (= c!53889 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388313 () Bool)

(declare-fun e!235273 () Bool)

(declare-fun e!235276 () Bool)

(assert (=> b!388313 (= e!235273 e!235276)))

(declare-fun res!222089 () Bool)

(assert (=> b!388313 (=> (not res!222089) (not e!235276))))

(assert (=> b!388313 (= res!222089 (contains!2431 lt!182240 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(declare-fun b!388314 () Bool)

(declare-fun e!235268 () ListLongMap!5379)

(assert (=> b!388314 (= e!235268 call!27309)))

(declare-fun b!388315 () Bool)

(declare-fun c!53890 () Bool)

(assert (=> b!388315 (= c!53890 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388315 (= e!235272 e!235268)))

(declare-fun b!388316 () Bool)

(declare-fun call!27313 () ListLongMap!5379)

(assert (=> b!388316 (= e!235268 call!27313)))

(declare-fun b!388318 () Bool)

(declare-fun e!235270 () Bool)

(declare-fun call!27315 () Bool)

(assert (=> b!388318 (= e!235270 (not call!27315))))

(declare-fun bm!27307 () Bool)

(declare-fun call!27314 () ListLongMap!5379)

(assert (=> bm!27307 (= call!27314 call!27311)))

(declare-fun b!388319 () Bool)

(declare-fun e!235279 () Bool)

(assert (=> b!388319 (= e!235279 (= (apply!297 lt!182240 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388320 () Bool)

(declare-fun e!235274 () Unit!11892)

(declare-fun lt!182232 () Unit!11892)

(assert (=> b!388320 (= e!235274 lt!182232)))

(declare-fun lt!182233 () ListLongMap!5379)

(assert (=> b!388320 (= lt!182233 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182245 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182236 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182236 (select (arr!10986 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182248 () Unit!11892)

(declare-fun addStillContains!273 (ListLongMap!5379 (_ BitVec 64) V!13875 (_ BitVec 64)) Unit!11892)

(assert (=> b!388320 (= lt!182248 (addStillContains!273 lt!182233 lt!182245 zeroValue!472 lt!182236))))

(assert (=> b!388320 (contains!2431 (+!1025 lt!182233 (tuple2!6477 lt!182245 zeroValue!472)) lt!182236)))

(declare-fun lt!182239 () Unit!11892)

(assert (=> b!388320 (= lt!182239 lt!182248)))

(declare-fun lt!182241 () ListLongMap!5379)

(assert (=> b!388320 (= lt!182241 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182229 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182237 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182237 (select (arr!10986 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182230 () Unit!11892)

(declare-fun addApplyDifferent!273 (ListLongMap!5379 (_ BitVec 64) V!13875 (_ BitVec 64)) Unit!11892)

(assert (=> b!388320 (= lt!182230 (addApplyDifferent!273 lt!182241 lt!182229 minValue!472 lt!182237))))

(assert (=> b!388320 (= (apply!297 (+!1025 lt!182241 (tuple2!6477 lt!182229 minValue!472)) lt!182237) (apply!297 lt!182241 lt!182237))))

(declare-fun lt!182234 () Unit!11892)

(assert (=> b!388320 (= lt!182234 lt!182230)))

(declare-fun lt!182246 () ListLongMap!5379)

(assert (=> b!388320 (= lt!182246 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182235 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182242 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182242 (select (arr!10986 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182228 () Unit!11892)

(assert (=> b!388320 (= lt!182228 (addApplyDifferent!273 lt!182246 lt!182235 zeroValue!472 lt!182242))))

(assert (=> b!388320 (= (apply!297 (+!1025 lt!182246 (tuple2!6477 lt!182235 zeroValue!472)) lt!182242) (apply!297 lt!182246 lt!182242))))

(declare-fun lt!182243 () Unit!11892)

(assert (=> b!388320 (= lt!182243 lt!182228)))

(declare-fun lt!182244 () ListLongMap!5379)

(assert (=> b!388320 (= lt!182244 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182227 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182227 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182247 () (_ BitVec 64))

(assert (=> b!388320 (= lt!182247 (select (arr!10986 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388320 (= lt!182232 (addApplyDifferent!273 lt!182244 lt!182227 minValue!472 lt!182247))))

(assert (=> b!388320 (= (apply!297 (+!1025 lt!182244 (tuple2!6477 lt!182227 minValue!472)) lt!182247) (apply!297 lt!182244 lt!182247))))

(declare-fun b!388321 () Bool)

(assert (=> b!388321 (= e!235271 e!235270)))

(declare-fun c!53888 () Bool)

(assert (=> b!388321 (= c!53888 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388322 () Bool)

(assert (=> b!388322 (= e!235267 e!235279)))

(declare-fun res!222088 () Bool)

(assert (=> b!388322 (= res!222088 call!27312)))

(assert (=> b!388322 (=> (not res!222088) (not e!235279))))

(declare-fun b!388323 () Bool)

(assert (=> b!388323 (= e!235270 e!235278)))

(declare-fun res!222087 () Bool)

(assert (=> b!388323 (= res!222087 call!27315)))

(assert (=> b!388323 (=> (not res!222087) (not e!235278))))

(declare-fun b!388324 () Bool)

(declare-fun res!222085 () Bool)

(assert (=> b!388324 (=> (not res!222085) (not e!235271))))

(assert (=> b!388324 (= res!222085 e!235273)))

(declare-fun res!222090 () Bool)

(assert (=> b!388324 (=> res!222090 e!235273)))

(assert (=> b!388324 (= res!222090 (not e!235275))))

(declare-fun res!222086 () Bool)

(assert (=> b!388324 (=> (not res!222086) (not e!235275))))

(assert (=> b!388324 (= res!222086 (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(declare-fun b!388325 () Bool)

(assert (=> b!388325 (= e!235276 (= (apply!297 lt!182240 (select (arr!10986 _keys!658) #b00000000000000000000000000000000)) (get!5557 (select (arr!10985 _values!506) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11338 _values!506)))))

(assert (=> b!388325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(declare-fun bm!27308 () Bool)

(assert (=> bm!27308 (= call!27309 call!27310)))

(declare-fun bm!27309 () Bool)

(assert (=> bm!27309 (= call!27313 call!27314)))

(declare-fun bm!27310 () Bool)

(assert (=> bm!27310 (= call!27315 (contains!2431 lt!182240 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!72611 () Bool)

(assert (=> d!72611 e!235271))

(declare-fun res!222091 () Bool)

(assert (=> d!72611 (=> (not res!222091) (not e!235271))))

(assert (=> d!72611 (= res!222091 (or (bvsge #b00000000000000000000000000000000 (size!11339 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))))

(declare-fun lt!182231 () ListLongMap!5379)

(assert (=> d!72611 (= lt!182240 lt!182231)))

(declare-fun lt!182238 () Unit!11892)

(assert (=> d!72611 (= lt!182238 e!235274)))

(declare-fun c!53886 () Bool)

(assert (=> d!72611 (= c!53886 e!235269)))

(declare-fun res!222093 () Bool)

(assert (=> d!72611 (=> (not res!222093) (not e!235269))))

(assert (=> d!72611 (= res!222093 (bvslt #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(assert (=> d!72611 (= lt!182231 e!235277)))

(declare-fun c!53891 () Bool)

(assert (=> d!72611 (= c!53891 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72611 (validMask!0 mask!970)))

(assert (=> d!72611 (= (getCurrentListMap!2035 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182240)))

(declare-fun b!388317 () Bool)

(declare-fun Unit!11894 () Unit!11892)

(assert (=> b!388317 (= e!235274 Unit!11894)))

(declare-fun bm!27311 () Bool)

(assert (=> bm!27311 (= call!27312 (contains!2431 lt!182240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27312 () Bool)

(assert (=> bm!27312 (= call!27310 (+!1025 (ite c!53891 call!27311 (ite c!53887 call!27314 call!27313)) (ite (or c!53891 c!53887) (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (= (and d!72611 c!53891) b!388311))

(assert (= (and d!72611 (not c!53891)) b!388306))

(assert (= (and b!388306 c!53887) b!388309))

(assert (= (and b!388306 (not c!53887)) b!388315))

(assert (= (and b!388315 c!53890) b!388314))

(assert (= (and b!388315 (not c!53890)) b!388316))

(assert (= (or b!388314 b!388316) bm!27309))

(assert (= (or b!388309 bm!27309) bm!27307))

(assert (= (or b!388309 b!388314) bm!27308))

(assert (= (or b!388311 bm!27307) bm!27306))

(assert (= (or b!388311 bm!27308) bm!27312))

(assert (= (and d!72611 res!222093) b!388305))

(assert (= (and d!72611 c!53886) b!388320))

(assert (= (and d!72611 (not c!53886)) b!388317))

(assert (= (and d!72611 res!222091) b!388324))

(assert (= (and b!388324 res!222086) b!388308))

(assert (= (and b!388324 (not res!222090)) b!388313))

(assert (= (and b!388313 res!222089) b!388325))

(assert (= (and b!388324 res!222085) b!388312))

(assert (= (and b!388312 c!53889) b!388322))

(assert (= (and b!388312 (not c!53889)) b!388310))

(assert (= (and b!388322 res!222088) b!388319))

(assert (= (or b!388322 b!388310) bm!27311))

(assert (= (and b!388312 res!222092) b!388321))

(assert (= (and b!388321 c!53888) b!388323))

(assert (= (and b!388321 (not c!53888)) b!388318))

(assert (= (and b!388323 res!222087) b!388307))

(assert (= (or b!388323 b!388318) bm!27310))

(declare-fun b_lambda!8513 () Bool)

(assert (=> (not b_lambda!8513) (not b!388325)))

(assert (=> b!388325 t!11465))

(declare-fun b_and!16131 () Bool)

(assert (= b_and!16129 (and (=> t!11465 result!5699) b_and!16131)))

(declare-fun m!383775 () Bool)

(assert (=> bm!27311 m!383775))

(assert (=> b!388325 m!383693))

(assert (=> b!388325 m!383757))

(assert (=> b!388325 m!383759))

(assert (=> b!388325 m!383693))

(declare-fun m!383777 () Bool)

(assert (=> b!388325 m!383777))

(assert (=> b!388325 m!383757))

(assert (=> b!388325 m!383759))

(assert (=> b!388325 m!383761))

(assert (=> d!72611 m!383595))

(assert (=> b!388308 m!383693))

(assert (=> b!388308 m!383693))

(assert (=> b!388308 m!383699))

(assert (=> bm!27306 m!383581))

(declare-fun m!383779 () Bool)

(assert (=> bm!27312 m!383779))

(declare-fun m!383781 () Bool)

(assert (=> b!388307 m!383781))

(declare-fun m!383783 () Bool)

(assert (=> b!388320 m!383783))

(declare-fun m!383785 () Bool)

(assert (=> b!388320 m!383785))

(declare-fun m!383787 () Bool)

(assert (=> b!388320 m!383787))

(declare-fun m!383789 () Bool)

(assert (=> b!388320 m!383789))

(declare-fun m!383791 () Bool)

(assert (=> b!388320 m!383791))

(declare-fun m!383793 () Bool)

(assert (=> b!388320 m!383793))

(assert (=> b!388320 m!383581))

(declare-fun m!383795 () Bool)

(assert (=> b!388320 m!383795))

(declare-fun m!383797 () Bool)

(assert (=> b!388320 m!383797))

(declare-fun m!383799 () Bool)

(assert (=> b!388320 m!383799))

(assert (=> b!388320 m!383795))

(declare-fun m!383801 () Bool)

(assert (=> b!388320 m!383801))

(assert (=> b!388320 m!383797))

(assert (=> b!388320 m!383693))

(declare-fun m!383803 () Bool)

(assert (=> b!388320 m!383803))

(declare-fun m!383805 () Bool)

(assert (=> b!388320 m!383805))

(declare-fun m!383807 () Bool)

(assert (=> b!388320 m!383807))

(assert (=> b!388320 m!383789))

(declare-fun m!383809 () Bool)

(assert (=> b!388320 m!383809))

(assert (=> b!388320 m!383805))

(declare-fun m!383811 () Bool)

(assert (=> b!388320 m!383811))

(declare-fun m!383813 () Bool)

(assert (=> bm!27310 m!383813))

(declare-fun m!383815 () Bool)

(assert (=> b!388319 m!383815))

(assert (=> b!388313 m!383693))

(assert (=> b!388313 m!383693))

(declare-fun m!383817 () Bool)

(assert (=> b!388313 m!383817))

(declare-fun m!383819 () Bool)

(assert (=> b!388311 m!383819))

(assert (=> b!388305 m!383693))

(assert (=> b!388305 m!383693))

(assert (=> b!388305 m!383699))

(assert (=> b!388088 d!72611))

(declare-fun b!388326 () Bool)

(declare-fun e!235282 () Bool)

(declare-fun e!235283 () Bool)

(assert (=> b!388326 (= e!235282 e!235283)))

(declare-fun c!53893 () Bool)

(assert (=> b!388326 (= c!53893 (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(declare-fun b!388327 () Bool)

(declare-fun e!235284 () Bool)

(assert (=> b!388327 (= e!235284 e!235282)))

(declare-fun c!53894 () Bool)

(declare-fun e!235281 () Bool)

(assert (=> b!388327 (= c!53894 e!235281)))

(declare-fun res!222097 () Bool)

(assert (=> b!388327 (=> (not res!222097) (not e!235281))))

(assert (=> b!388327 (= res!222097 (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(declare-fun b!388328 () Bool)

(assert (=> b!388328 (= e!235281 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(assert (=> b!388328 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388329 () Bool)

(assert (=> b!388329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(assert (=> b!388329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11338 lt!182084)))))

(declare-fun e!235286 () Bool)

(declare-fun lt!182249 () ListLongMap!5379)

(assert (=> b!388329 (= e!235286 (= (apply!297 lt!182249 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)) (get!5557 (select (arr!10985 lt!182084) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!27316 () ListLongMap!5379)

(declare-fun bm!27313 () Bool)

(assert (=> bm!27313 (= call!27316 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun d!72613 () Bool)

(assert (=> d!72613 e!235284))

(declare-fun res!222096 () Bool)

(assert (=> d!72613 (=> (not res!222096) (not e!235284))))

(assert (=> d!72613 (= res!222096 (not (contains!2431 lt!182249 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235285 () ListLongMap!5379)

(assert (=> d!72613 (= lt!182249 e!235285)))

(declare-fun c!53895 () Bool)

(assert (=> d!72613 (= c!53895 (bvsge #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(assert (=> d!72613 (validMask!0 mask!970)))

(assert (=> d!72613 (= (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182249)))

(declare-fun b!388330 () Bool)

(assert (=> b!388330 (= e!235283 (isEmpty!547 lt!182249))))

(declare-fun b!388331 () Bool)

(assert (=> b!388331 (= e!235283 (= lt!182249 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388332 () Bool)

(assert (=> b!388332 (= e!235282 e!235286)))

(assert (=> b!388332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(declare-fun res!222094 () Bool)

(assert (=> b!388332 (= res!222094 (contains!2431 lt!182249 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(assert (=> b!388332 (=> (not res!222094) (not e!235286))))

(declare-fun b!388333 () Bool)

(declare-fun e!235280 () ListLongMap!5379)

(assert (=> b!388333 (= e!235285 e!235280)))

(declare-fun c!53892 () Bool)

(assert (=> b!388333 (= c!53892 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun b!388334 () Bool)

(assert (=> b!388334 (= e!235285 (ListLongMap!5380 Nil!6317))))

(declare-fun b!388335 () Bool)

(declare-fun res!222095 () Bool)

(assert (=> b!388335 (=> (not res!222095) (not e!235284))))

(assert (=> b!388335 (= res!222095 (not (contains!2431 lt!182249 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388336 () Bool)

(declare-fun lt!182253 () Unit!11892)

(declare-fun lt!182254 () Unit!11892)

(assert (=> b!388336 (= lt!182253 lt!182254)))

(declare-fun lt!182255 () ListLongMap!5379)

(declare-fun lt!182250 () (_ BitVec 64))

(declare-fun lt!182251 () V!13875)

(declare-fun lt!182252 () (_ BitVec 64))

(assert (=> b!388336 (not (contains!2431 (+!1025 lt!182255 (tuple2!6477 lt!182252 lt!182251)) lt!182250))))

(assert (=> b!388336 (= lt!182254 (addStillNotContains!131 lt!182255 lt!182252 lt!182251 lt!182250))))

(assert (=> b!388336 (= lt!182250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388336 (= lt!182251 (get!5557 (select (arr!10985 lt!182084) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388336 (= lt!182252 (select (arr!10986 lt!182081) #b00000000000000000000000000000000))))

(assert (=> b!388336 (= lt!182255 call!27316)))

(assert (=> b!388336 (= e!235280 (+!1025 call!27316 (tuple2!6477 (select (arr!10986 lt!182081) #b00000000000000000000000000000000) (get!5557 (select (arr!10985 lt!182084) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!388337 () Bool)

(assert (=> b!388337 (= e!235280 call!27316)))

(assert (= (and d!72613 c!53895) b!388334))

(assert (= (and d!72613 (not c!53895)) b!388333))

(assert (= (and b!388333 c!53892) b!388336))

(assert (= (and b!388333 (not c!53892)) b!388337))

(assert (= (or b!388336 b!388337) bm!27313))

(assert (= (and d!72613 res!222096) b!388335))

(assert (= (and b!388335 res!222095) b!388327))

(assert (= (and b!388327 res!222097) b!388328))

(assert (= (and b!388327 c!53894) b!388332))

(assert (= (and b!388327 (not c!53894)) b!388326))

(assert (= (and b!388332 res!222094) b!388329))

(assert (= (and b!388326 c!53893) b!388331))

(assert (= (and b!388326 (not c!53893)) b!388330))

(declare-fun b_lambda!8515 () Bool)

(assert (=> (not b_lambda!8515) (not b!388329)))

(assert (=> b!388329 t!11465))

(declare-fun b_and!16133 () Bool)

(assert (= b_and!16131 (and (=> t!11465 result!5699) b_and!16133)))

(declare-fun b_lambda!8517 () Bool)

(assert (=> (not b_lambda!8517) (not b!388336)))

(assert (=> b!388336 t!11465))

(declare-fun b_and!16135 () Bool)

(assert (= b_and!16133 (and (=> t!11465 result!5699) b_and!16135)))

(assert (=> b!388333 m!383703))

(assert (=> b!388333 m!383703))

(assert (=> b!388333 m!383705))

(declare-fun m!383821 () Bool)

(assert (=> bm!27313 m!383821))

(declare-fun m!383823 () Bool)

(assert (=> d!72613 m!383823))

(assert (=> d!72613 m!383595))

(declare-fun m!383825 () Bool)

(assert (=> b!388330 m!383825))

(assert (=> b!388331 m!383821))

(assert (=> b!388329 m!383703))

(declare-fun m!383827 () Bool)

(assert (=> b!388329 m!383827))

(declare-fun m!383829 () Bool)

(assert (=> b!388329 m!383829))

(assert (=> b!388329 m!383759))

(declare-fun m!383831 () Bool)

(assert (=> b!388329 m!383831))

(assert (=> b!388329 m!383759))

(assert (=> b!388329 m!383703))

(assert (=> b!388329 m!383829))

(assert (=> b!388332 m!383703))

(assert (=> b!388332 m!383703))

(declare-fun m!383833 () Bool)

(assert (=> b!388332 m!383833))

(assert (=> b!388328 m!383703))

(assert (=> b!388328 m!383703))

(assert (=> b!388328 m!383705))

(declare-fun m!383835 () Bool)

(assert (=> b!388335 m!383835))

(declare-fun m!383837 () Bool)

(assert (=> b!388336 m!383837))

(assert (=> b!388336 m!383829))

(assert (=> b!388336 m!383759))

(assert (=> b!388336 m!383831))

(assert (=> b!388336 m!383759))

(declare-fun m!383839 () Bool)

(assert (=> b!388336 m!383839))

(assert (=> b!388336 m!383703))

(assert (=> b!388336 m!383839))

(declare-fun m!383841 () Bool)

(assert (=> b!388336 m!383841))

(assert (=> b!388336 m!383829))

(declare-fun m!383843 () Bool)

(assert (=> b!388336 m!383843))

(assert (=> b!388088 d!72613))

(declare-fun b!388338 () Bool)

(declare-fun e!235289 () Bool)

(assert (=> b!388338 (= e!235289 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun b!388339 () Bool)

(declare-fun e!235297 () ListLongMap!5379)

(declare-fun e!235292 () ListLongMap!5379)

(assert (=> b!388339 (= e!235297 e!235292)))

(declare-fun c!53897 () Bool)

(assert (=> b!388339 (= c!53897 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388340 () Bool)

(declare-fun e!235298 () Bool)

(declare-fun lt!182269 () ListLongMap!5379)

(assert (=> b!388340 (= e!235298 (= (apply!297 lt!182269 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27314 () Bool)

(declare-fun call!27319 () ListLongMap!5379)

(assert (=> bm!27314 (= call!27319 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388341 () Bool)

(declare-fun e!235295 () Bool)

(assert (=> b!388341 (= e!235295 (validKeyInArray!0 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(declare-fun b!388342 () Bool)

(declare-fun call!27317 () ListLongMap!5379)

(assert (=> b!388342 (= e!235292 call!27317)))

(declare-fun b!388343 () Bool)

(declare-fun e!235287 () Bool)

(declare-fun call!27320 () Bool)

(assert (=> b!388343 (= e!235287 (not call!27320))))

(declare-fun b!388344 () Bool)

(declare-fun call!27318 () ListLongMap!5379)

(assert (=> b!388344 (= e!235297 (+!1025 call!27318 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388345 () Bool)

(declare-fun res!222105 () Bool)

(declare-fun e!235291 () Bool)

(assert (=> b!388345 (=> (not res!222105) (not e!235291))))

(assert (=> b!388345 (= res!222105 e!235287)))

(declare-fun c!53899 () Bool)

(assert (=> b!388345 (= c!53899 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388346 () Bool)

(declare-fun e!235293 () Bool)

(declare-fun e!235296 () Bool)

(assert (=> b!388346 (= e!235293 e!235296)))

(declare-fun res!222102 () Bool)

(assert (=> b!388346 (=> (not res!222102) (not e!235296))))

(assert (=> b!388346 (= res!222102 (contains!2431 lt!182269 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)))))

(assert (=> b!388346 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(declare-fun b!388347 () Bool)

(declare-fun e!235288 () ListLongMap!5379)

(assert (=> b!388347 (= e!235288 call!27317)))

(declare-fun b!388348 () Bool)

(declare-fun c!53900 () Bool)

(assert (=> b!388348 (= c!53900 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388348 (= e!235292 e!235288)))

(declare-fun b!388349 () Bool)

(declare-fun call!27321 () ListLongMap!5379)

(assert (=> b!388349 (= e!235288 call!27321)))

(declare-fun b!388351 () Bool)

(declare-fun e!235290 () Bool)

(declare-fun call!27323 () Bool)

(assert (=> b!388351 (= e!235290 (not call!27323))))

(declare-fun bm!27315 () Bool)

(declare-fun call!27322 () ListLongMap!5379)

(assert (=> bm!27315 (= call!27322 call!27319)))

(declare-fun b!388352 () Bool)

(declare-fun e!235299 () Bool)

(assert (=> b!388352 (= e!235299 (= (apply!297 lt!182269 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388353 () Bool)

(declare-fun e!235294 () Unit!11892)

(declare-fun lt!182261 () Unit!11892)

(assert (=> b!388353 (= e!235294 lt!182261)))

(declare-fun lt!182262 () ListLongMap!5379)

(assert (=> b!388353 (= lt!182262 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182274 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182265 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182265 (select (arr!10986 lt!182081) #b00000000000000000000000000000000))))

(declare-fun lt!182277 () Unit!11892)

(assert (=> b!388353 (= lt!182277 (addStillContains!273 lt!182262 lt!182274 zeroValue!472 lt!182265))))

(assert (=> b!388353 (contains!2431 (+!1025 lt!182262 (tuple2!6477 lt!182274 zeroValue!472)) lt!182265)))

(declare-fun lt!182268 () Unit!11892)

(assert (=> b!388353 (= lt!182268 lt!182277)))

(declare-fun lt!182270 () ListLongMap!5379)

(assert (=> b!388353 (= lt!182270 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182258 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182258 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182266 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182266 (select (arr!10986 lt!182081) #b00000000000000000000000000000000))))

(declare-fun lt!182259 () Unit!11892)

(assert (=> b!388353 (= lt!182259 (addApplyDifferent!273 lt!182270 lt!182258 minValue!472 lt!182266))))

(assert (=> b!388353 (= (apply!297 (+!1025 lt!182270 (tuple2!6477 lt!182258 minValue!472)) lt!182266) (apply!297 lt!182270 lt!182266))))

(declare-fun lt!182263 () Unit!11892)

(assert (=> b!388353 (= lt!182263 lt!182259)))

(declare-fun lt!182275 () ListLongMap!5379)

(assert (=> b!388353 (= lt!182275 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182264 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182271 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182271 (select (arr!10986 lt!182081) #b00000000000000000000000000000000))))

(declare-fun lt!182257 () Unit!11892)

(assert (=> b!388353 (= lt!182257 (addApplyDifferent!273 lt!182275 lt!182264 zeroValue!472 lt!182271))))

(assert (=> b!388353 (= (apply!297 (+!1025 lt!182275 (tuple2!6477 lt!182264 zeroValue!472)) lt!182271) (apply!297 lt!182275 lt!182271))))

(declare-fun lt!182272 () Unit!11892)

(assert (=> b!388353 (= lt!182272 lt!182257)))

(declare-fun lt!182273 () ListLongMap!5379)

(assert (=> b!388353 (= lt!182273 (getCurrentListMapNoExtraKeys!945 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182256 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182256 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182276 () (_ BitVec 64))

(assert (=> b!388353 (= lt!182276 (select (arr!10986 lt!182081) #b00000000000000000000000000000000))))

(assert (=> b!388353 (= lt!182261 (addApplyDifferent!273 lt!182273 lt!182256 minValue!472 lt!182276))))

(assert (=> b!388353 (= (apply!297 (+!1025 lt!182273 (tuple2!6477 lt!182256 minValue!472)) lt!182276) (apply!297 lt!182273 lt!182276))))

(declare-fun b!388354 () Bool)

(assert (=> b!388354 (= e!235291 e!235290)))

(declare-fun c!53898 () Bool)

(assert (=> b!388354 (= c!53898 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388355 () Bool)

(assert (=> b!388355 (= e!235287 e!235299)))

(declare-fun res!222101 () Bool)

(assert (=> b!388355 (= res!222101 call!27320)))

(assert (=> b!388355 (=> (not res!222101) (not e!235299))))

(declare-fun b!388356 () Bool)

(assert (=> b!388356 (= e!235290 e!235298)))

(declare-fun res!222100 () Bool)

(assert (=> b!388356 (= res!222100 call!27323)))

(assert (=> b!388356 (=> (not res!222100) (not e!235298))))

(declare-fun b!388357 () Bool)

(declare-fun res!222098 () Bool)

(assert (=> b!388357 (=> (not res!222098) (not e!235291))))

(assert (=> b!388357 (= res!222098 e!235293)))

(declare-fun res!222103 () Bool)

(assert (=> b!388357 (=> res!222103 e!235293)))

(assert (=> b!388357 (= res!222103 (not e!235295))))

(declare-fun res!222099 () Bool)

(assert (=> b!388357 (=> (not res!222099) (not e!235295))))

(assert (=> b!388357 (= res!222099 (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(declare-fun b!388358 () Bool)

(assert (=> b!388358 (= e!235296 (= (apply!297 lt!182269 (select (arr!10986 lt!182081) #b00000000000000000000000000000000)) (get!5557 (select (arr!10985 lt!182084) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11338 lt!182084)))))

(assert (=> b!388358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(declare-fun bm!27316 () Bool)

(assert (=> bm!27316 (= call!27317 call!27318)))

(declare-fun bm!27317 () Bool)

(assert (=> bm!27317 (= call!27321 call!27322)))

(declare-fun bm!27318 () Bool)

(assert (=> bm!27318 (= call!27323 (contains!2431 lt!182269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!72615 () Bool)

(assert (=> d!72615 e!235291))

(declare-fun res!222104 () Bool)

(assert (=> d!72615 (=> (not res!222104) (not e!235291))))

(assert (=> d!72615 (= res!222104 (or (bvsge #b00000000000000000000000000000000 (size!11339 lt!182081)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))))

(declare-fun lt!182260 () ListLongMap!5379)

(assert (=> d!72615 (= lt!182269 lt!182260)))

(declare-fun lt!182267 () Unit!11892)

(assert (=> d!72615 (= lt!182267 e!235294)))

(declare-fun c!53896 () Bool)

(assert (=> d!72615 (= c!53896 e!235289)))

(declare-fun res!222106 () Bool)

(assert (=> d!72615 (=> (not res!222106) (not e!235289))))

(assert (=> d!72615 (= res!222106 (bvslt #b00000000000000000000000000000000 (size!11339 lt!182081)))))

(assert (=> d!72615 (= lt!182260 e!235297)))

(declare-fun c!53901 () Bool)

(assert (=> d!72615 (= c!53901 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72615 (validMask!0 mask!970)))

(assert (=> d!72615 (= (getCurrentListMap!2035 lt!182081 lt!182084 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182269)))

(declare-fun b!388350 () Bool)

(declare-fun Unit!11895 () Unit!11892)

(assert (=> b!388350 (= e!235294 Unit!11895)))

(declare-fun bm!27319 () Bool)

(assert (=> bm!27319 (= call!27320 (contains!2431 lt!182269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27320 () Bool)

(assert (=> bm!27320 (= call!27318 (+!1025 (ite c!53901 call!27319 (ite c!53897 call!27322 call!27321)) (ite (or c!53901 c!53897) (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (= (and d!72615 c!53901) b!388344))

(assert (= (and d!72615 (not c!53901)) b!388339))

(assert (= (and b!388339 c!53897) b!388342))

(assert (= (and b!388339 (not c!53897)) b!388348))

(assert (= (and b!388348 c!53900) b!388347))

(assert (= (and b!388348 (not c!53900)) b!388349))

(assert (= (or b!388347 b!388349) bm!27317))

(assert (= (or b!388342 bm!27317) bm!27315))

(assert (= (or b!388342 b!388347) bm!27316))

(assert (= (or b!388344 bm!27315) bm!27314))

(assert (= (or b!388344 bm!27316) bm!27320))

(assert (= (and d!72615 res!222106) b!388338))

(assert (= (and d!72615 c!53896) b!388353))

(assert (= (and d!72615 (not c!53896)) b!388350))

(assert (= (and d!72615 res!222104) b!388357))

(assert (= (and b!388357 res!222099) b!388341))

(assert (= (and b!388357 (not res!222103)) b!388346))

(assert (= (and b!388346 res!222102) b!388358))

(assert (= (and b!388357 res!222098) b!388345))

(assert (= (and b!388345 c!53899) b!388355))

(assert (= (and b!388345 (not c!53899)) b!388343))

(assert (= (and b!388355 res!222101) b!388352))

(assert (= (or b!388355 b!388343) bm!27319))

(assert (= (and b!388345 res!222105) b!388354))

(assert (= (and b!388354 c!53898) b!388356))

(assert (= (and b!388354 (not c!53898)) b!388351))

(assert (= (and b!388356 res!222100) b!388340))

(assert (= (or b!388356 b!388351) bm!27318))

(declare-fun b_lambda!8519 () Bool)

(assert (=> (not b_lambda!8519) (not b!388358)))

(assert (=> b!388358 t!11465))

(declare-fun b_and!16137 () Bool)

(assert (= b_and!16135 (and (=> t!11465 result!5699) b_and!16137)))

(declare-fun m!383845 () Bool)

(assert (=> bm!27319 m!383845))

(assert (=> b!388358 m!383703))

(assert (=> b!388358 m!383829))

(assert (=> b!388358 m!383759))

(assert (=> b!388358 m!383703))

(declare-fun m!383847 () Bool)

(assert (=> b!388358 m!383847))

(assert (=> b!388358 m!383829))

(assert (=> b!388358 m!383759))

(assert (=> b!388358 m!383831))

(assert (=> d!72615 m!383595))

(assert (=> b!388341 m!383703))

(assert (=> b!388341 m!383703))

(assert (=> b!388341 m!383705))

(assert (=> bm!27314 m!383587))

(declare-fun m!383849 () Bool)

(assert (=> bm!27320 m!383849))

(declare-fun m!383851 () Bool)

(assert (=> b!388340 m!383851))

(declare-fun m!383853 () Bool)

(assert (=> b!388353 m!383853))

(declare-fun m!383855 () Bool)

(assert (=> b!388353 m!383855))

(declare-fun m!383857 () Bool)

(assert (=> b!388353 m!383857))

(declare-fun m!383859 () Bool)

(assert (=> b!388353 m!383859))

(declare-fun m!383861 () Bool)

(assert (=> b!388353 m!383861))

(declare-fun m!383863 () Bool)

(assert (=> b!388353 m!383863))

(assert (=> b!388353 m!383587))

(declare-fun m!383865 () Bool)

(assert (=> b!388353 m!383865))

(declare-fun m!383867 () Bool)

(assert (=> b!388353 m!383867))

(declare-fun m!383869 () Bool)

(assert (=> b!388353 m!383869))

(assert (=> b!388353 m!383865))

(declare-fun m!383871 () Bool)

(assert (=> b!388353 m!383871))

(assert (=> b!388353 m!383867))

(assert (=> b!388353 m!383703))

(declare-fun m!383873 () Bool)

(assert (=> b!388353 m!383873))

(declare-fun m!383875 () Bool)

(assert (=> b!388353 m!383875))

(declare-fun m!383877 () Bool)

(assert (=> b!388353 m!383877))

(assert (=> b!388353 m!383859))

(declare-fun m!383879 () Bool)

(assert (=> b!388353 m!383879))

(assert (=> b!388353 m!383875))

(declare-fun m!383881 () Bool)

(assert (=> b!388353 m!383881))

(declare-fun m!383883 () Bool)

(assert (=> bm!27318 m!383883))

(declare-fun m!383885 () Bool)

(assert (=> b!388352 m!383885))

(assert (=> b!388346 m!383703))

(assert (=> b!388346 m!383703))

(declare-fun m!383887 () Bool)

(assert (=> b!388346 m!383887))

(declare-fun m!383889 () Bool)

(assert (=> b!388344 m!383889))

(assert (=> b!388338 m!383703))

(assert (=> b!388338 m!383703))

(assert (=> b!388338 m!383705))

(assert (=> b!388088 d!72615))

(declare-fun d!72617 () Bool)

(declare-fun e!235304 () Bool)

(assert (=> d!72617 e!235304))

(declare-fun res!222109 () Bool)

(assert (=> d!72617 (=> (not res!222109) (not e!235304))))

(assert (=> d!72617 (= res!222109 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11339 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11338 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11339 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11338 _values!506))))))))

(declare-fun lt!182280 () Unit!11892)

(declare-fun choose!1318 (array!23035 array!23033 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) (_ BitVec 64) V!13875 (_ BitVec 32) Int) Unit!11892)

(assert (=> d!72617 (= lt!182280 (choose!1318 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72617 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11339 _keys!658)))))

(assert (=> d!72617 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!236 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182280)))

(declare-fun bm!27325 () Bool)

(declare-fun call!27328 () ListLongMap!5379)

(assert (=> bm!27325 (= call!27328 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388365 () Bool)

(declare-fun call!27329 () ListLongMap!5379)

(declare-fun e!235305 () Bool)

(assert (=> b!388365 (= e!235305 (= call!27329 (+!1025 call!27328 (tuple2!6477 k0!778 v!373))))))

(declare-fun b!388366 () Bool)

(assert (=> b!388366 (= e!235304 e!235305)))

(declare-fun c!53904 () Bool)

(assert (=> b!388366 (= c!53904 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!388367 () Bool)

(assert (=> b!388367 (= e!235305 (= call!27329 call!27328))))

(declare-fun bm!27326 () Bool)

(assert (=> bm!27326 (= call!27329 (getCurrentListMapNoExtraKeys!945 (array!23036 (store (arr!10986 _keys!658) i!548 k0!778) (size!11339 _keys!658)) (array!23034 (store (arr!10985 _values!506) i!548 (ValueCellFull!4445 v!373)) (size!11338 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72617 res!222109) b!388366))

(assert (= (and b!388366 c!53904) b!388365))

(assert (= (and b!388366 (not c!53904)) b!388367))

(assert (= (or b!388365 b!388367) bm!27325))

(assert (= (or b!388365 b!388367) bm!27326))

(declare-fun m!383891 () Bool)

(assert (=> d!72617 m!383891))

(assert (=> bm!27325 m!383581))

(declare-fun m!383893 () Bool)

(assert (=> b!388365 m!383893))

(assert (=> bm!27326 m!383575))

(assert (=> bm!27326 m!383591))

(declare-fun m!383895 () Bool)

(assert (=> bm!27326 m!383895))

(assert (=> b!388088 d!72617))

(declare-fun d!72619 () Bool)

(declare-fun e!235306 () Bool)

(assert (=> d!72619 e!235306))

(declare-fun res!222110 () Bool)

(assert (=> d!72619 (=> (not res!222110) (not e!235306))))

(declare-fun lt!182282 () ListLongMap!5379)

(assert (=> d!72619 (= res!222110 (contains!2431 lt!182282 (_1!3249 (tuple2!6477 k0!778 v!373))))))

(declare-fun lt!182284 () List!6320)

(assert (=> d!72619 (= lt!182282 (ListLongMap!5380 lt!182284))))

(declare-fun lt!182283 () Unit!11892)

(declare-fun lt!182281 () Unit!11892)

(assert (=> d!72619 (= lt!182283 lt!182281)))

(assert (=> d!72619 (= (getValueByKey!353 lt!182284 (_1!3249 (tuple2!6477 k0!778 v!373))) (Some!358 (_2!3249 (tuple2!6477 k0!778 v!373))))))

(assert (=> d!72619 (= lt!182281 (lemmaContainsTupThenGetReturnValue!178 lt!182284 (_1!3249 (tuple2!6477 k0!778 v!373)) (_2!3249 (tuple2!6477 k0!778 v!373))))))

(assert (=> d!72619 (= lt!182284 (insertStrictlySorted!181 (toList!2705 lt!182078) (_1!3249 (tuple2!6477 k0!778 v!373)) (_2!3249 (tuple2!6477 k0!778 v!373))))))

(assert (=> d!72619 (= (+!1025 lt!182078 (tuple2!6477 k0!778 v!373)) lt!182282)))

(declare-fun b!388368 () Bool)

(declare-fun res!222111 () Bool)

(assert (=> b!388368 (=> (not res!222111) (not e!235306))))

(assert (=> b!388368 (= res!222111 (= (getValueByKey!353 (toList!2705 lt!182282) (_1!3249 (tuple2!6477 k0!778 v!373))) (Some!358 (_2!3249 (tuple2!6477 k0!778 v!373)))))))

(declare-fun b!388369 () Bool)

(assert (=> b!388369 (= e!235306 (contains!2432 (toList!2705 lt!182282) (tuple2!6477 k0!778 v!373)))))

(assert (= (and d!72619 res!222110) b!388368))

(assert (= (and b!388368 res!222111) b!388369))

(declare-fun m!383897 () Bool)

(assert (=> d!72619 m!383897))

(declare-fun m!383899 () Bool)

(assert (=> d!72619 m!383899))

(declare-fun m!383901 () Bool)

(assert (=> d!72619 m!383901))

(declare-fun m!383903 () Bool)

(assert (=> d!72619 m!383903))

(declare-fun m!383905 () Bool)

(assert (=> b!388368 m!383905))

(declare-fun m!383907 () Bool)

(assert (=> b!388369 m!383907))

(assert (=> b!388088 d!72619))

(declare-fun d!72621 () Bool)

(assert (=> d!72621 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37788 d!72621))

(declare-fun d!72623 () Bool)

(assert (=> d!72623 (= (array_inv!8078 _values!506) (bvsge (size!11338 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37788 d!72623))

(declare-fun d!72625 () Bool)

(assert (=> d!72625 (= (array_inv!8079 _keys!658) (bvsge (size!11339 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37788 d!72625))

(declare-fun d!72627 () Bool)

(declare-fun res!222116 () Bool)

(declare-fun e!235311 () Bool)

(assert (=> d!72627 (=> res!222116 e!235311)))

(assert (=> d!72627 (= res!222116 (= (select (arr!10986 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72627 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235311)))

(declare-fun b!388374 () Bool)

(declare-fun e!235312 () Bool)

(assert (=> b!388374 (= e!235311 e!235312)))

(declare-fun res!222117 () Bool)

(assert (=> b!388374 (=> (not res!222117) (not e!235312))))

(assert (=> b!388374 (= res!222117 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11339 _keys!658)))))

(declare-fun b!388375 () Bool)

(assert (=> b!388375 (= e!235312 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72627 (not res!222116)) b!388374))

(assert (= (and b!388374 res!222117) b!388375))

(assert (=> d!72627 m!383693))

(declare-fun m!383909 () Bool)

(assert (=> b!388375 m!383909))

(assert (=> b!388094 d!72627))

(declare-fun mapIsEmpty!15939 () Bool)

(declare-fun mapRes!15939 () Bool)

(assert (=> mapIsEmpty!15939 mapRes!15939))

(declare-fun condMapEmpty!15939 () Bool)

(declare-fun mapDefault!15939 () ValueCell!4445)

(assert (=> mapNonEmpty!15930 (= condMapEmpty!15939 (= mapRest!15930 ((as const (Array (_ BitVec 32) ValueCell!4445)) mapDefault!15939)))))

(declare-fun e!235317 () Bool)

(assert (=> mapNonEmpty!15930 (= tp!31467 (and e!235317 mapRes!15939))))

(declare-fun b!388383 () Bool)

(assert (=> b!388383 (= e!235317 tp_is_empty!9577)))

(declare-fun b!388382 () Bool)

(declare-fun e!235318 () Bool)

(assert (=> b!388382 (= e!235318 tp_is_empty!9577)))

(declare-fun mapNonEmpty!15939 () Bool)

(declare-fun tp!31482 () Bool)

(assert (=> mapNonEmpty!15939 (= mapRes!15939 (and tp!31482 e!235318))))

(declare-fun mapRest!15939 () (Array (_ BitVec 32) ValueCell!4445))

(declare-fun mapValue!15939 () ValueCell!4445)

(declare-fun mapKey!15939 () (_ BitVec 32))

(assert (=> mapNonEmpty!15939 (= mapRest!15930 (store mapRest!15939 mapKey!15939 mapValue!15939))))

(assert (= (and mapNonEmpty!15930 condMapEmpty!15939) mapIsEmpty!15939))

(assert (= (and mapNonEmpty!15930 (not condMapEmpty!15939)) mapNonEmpty!15939))

(assert (= (and mapNonEmpty!15939 ((_ is ValueCellFull!4445) mapValue!15939)) b!388382))

(assert (= (and mapNonEmpty!15930 ((_ is ValueCellFull!4445) mapDefault!15939)) b!388383))

(declare-fun m!383911 () Bool)

(assert (=> mapNonEmpty!15939 m!383911))

(declare-fun b_lambda!8521 () Bool)

(assert (= b_lambda!8509 (or (and start!37788 b_free!8905) b_lambda!8521)))

(declare-fun b_lambda!8523 () Bool)

(assert (= b_lambda!8515 (or (and start!37788 b_free!8905) b_lambda!8523)))

(declare-fun b_lambda!8525 () Bool)

(assert (= b_lambda!8517 (or (and start!37788 b_free!8905) b_lambda!8525)))

(declare-fun b_lambda!8527 () Bool)

(assert (= b_lambda!8511 (or (and start!37788 b_free!8905) b_lambda!8527)))

(declare-fun b_lambda!8529 () Bool)

(assert (= b_lambda!8519 (or (and start!37788 b_free!8905) b_lambda!8529)))

(declare-fun b_lambda!8531 () Bool)

(assert (= b_lambda!8513 (or (and start!37788 b_free!8905) b_lambda!8531)))

(check-sat (not b!388253) (not b!388258) (not bm!27325) (not b!388307) (not b!388328) (not b!388335) (not b!388205) (not b!388332) (not b!388256) (not b!388346) (not mapNonEmpty!15939) (not b!388212) (not bm!27306) (not b!388330) (not d!72615) (not bm!27311) (not b!388215) (not b_lambda!8521) (not d!72601) (not b!388325) (not bm!27312) (not bm!27314) (not b!388259) (not bm!27310) (not b_lambda!8523) b_and!16137 (not b!388375) (not d!72611) (not b!388252) (not bm!27291) (not b!388341) (not bm!27287) (not d!72617) (not b!388194) tp_is_empty!9577 (not bm!27313) (not bm!27319) (not b!388223) (not b!388222) (not b_lambda!8527) (not b!388333) (not b_lambda!8531) (not b!388338) (not b!388313) (not b!388193) (not b!388254) (not b!388369) (not bm!27326) (not b_lambda!8525) (not bm!27288) (not b!388192) (not b!388344) (not b!388221) (not b!388217) (not b_next!8905) (not d!72603) (not d!72613) (not b!388340) (not bm!27318) (not b!388336) (not bm!27286) (not b!388368) (not b!388329) (not b!388308) (not b!388358) (not b!388331) (not b!388214) (not b!388353) (not b!388255) (not b!388365) (not b!388305) (not b_lambda!8529) (not b!388311) (not b!388319) (not b!388213) (not b!388219) (not b!388251) (not bm!27320) (not b!388320) (not d!72609) (not d!72619) (not b!388207) (not bm!27283) (not b!388352))
(check-sat b_and!16137 (not b_next!8905))
