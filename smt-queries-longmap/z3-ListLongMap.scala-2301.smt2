; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37270 () Bool)

(assert start!37270)

(declare-fun b_free!8397 () Bool)

(declare-fun b_next!8397 () Bool)

(assert (=> start!37270 (= b_free!8397 (not b_next!8397))))

(declare-fun tp!29906 () Bool)

(declare-fun b_and!15639 () Bool)

(assert (=> start!37270 (= tp!29906 b_and!15639)))

(declare-fun b!377376 () Bool)

(declare-fun e!229764 () Bool)

(declare-fun e!229766 () Bool)

(assert (=> b!377376 (= e!229764 e!229766)))

(declare-fun res!213500 () Bool)

(assert (=> b!377376 (=> res!213500 e!229766)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!377376 (= res!213500 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13165 0))(
  ( (V!13166 (val!4567 Int)) )
))
(declare-datatypes ((tuple2!6088 0))(
  ( (tuple2!6089 (_1!3055 (_ BitVec 64)) (_2!3055 V!13165)) )
))
(declare-datatypes ((List!5929 0))(
  ( (Nil!5926) (Cons!5925 (h!6781 tuple2!6088) (t!11079 List!5929)) )
))
(declare-datatypes ((ListLongMap!5001 0))(
  ( (ListLongMap!5002 (toList!2516 List!5929)) )
))
(declare-fun lt!175451 () ListLongMap!5001)

(declare-fun lt!175443 () ListLongMap!5001)

(assert (=> b!377376 (= lt!175451 lt!175443)))

(declare-fun lt!175450 () ListLongMap!5001)

(declare-fun lt!175442 () tuple2!6088)

(declare-fun +!862 (ListLongMap!5001 tuple2!6088) ListLongMap!5001)

(assert (=> b!377376 (= lt!175443 (+!862 lt!175450 lt!175442))))

(declare-fun lt!175444 () ListLongMap!5001)

(declare-fun lt!175441 () ListLongMap!5001)

(assert (=> b!377376 (= lt!175444 lt!175441)))

(declare-fun lt!175449 () ListLongMap!5001)

(assert (=> b!377376 (= lt!175441 (+!862 lt!175449 lt!175442))))

(declare-fun lt!175446 () ListLongMap!5001)

(assert (=> b!377376 (= lt!175451 (+!862 lt!175446 lt!175442))))

(declare-fun zeroValue!472 () V!13165)

(assert (=> b!377376 (= lt!175442 (tuple2!6089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377377 () Bool)

(declare-fun e!229765 () Bool)

(assert (=> b!377377 (= e!229765 (not e!229764))))

(declare-fun res!213497 () Bool)

(assert (=> b!377377 (=> res!213497 e!229764)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377377 (= res!213497 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4179 0))(
  ( (ValueCellFull!4179 (v!6764 V!13165)) (EmptyCell!4179) )
))
(declare-datatypes ((array!22019 0))(
  ( (array!22020 (arr!10478 (Array (_ BitVec 32) ValueCell!4179)) (size!10830 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22019)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!22021 0))(
  ( (array!22022 (arr!10479 (Array (_ BitVec 32) (_ BitVec 64))) (size!10831 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22021)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13165)

(declare-fun getCurrentListMap!1947 (array!22021 array!22019 (_ BitVec 32) (_ BitVec 32) V!13165 V!13165 (_ BitVec 32) Int) ListLongMap!5001)

(assert (=> b!377377 (= lt!175444 (getCurrentListMap!1947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175452 () array!22021)

(declare-fun lt!175440 () array!22019)

(assert (=> b!377377 (= lt!175451 (getCurrentListMap!1947 lt!175452 lt!175440 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377377 (and (= lt!175446 lt!175450) (= lt!175450 lt!175446))))

(declare-fun lt!175448 () tuple2!6088)

(assert (=> b!377377 (= lt!175450 (+!862 lt!175449 lt!175448))))

(declare-fun v!373 () V!13165)

(assert (=> b!377377 (= lt!175448 (tuple2!6089 k0!778 v!373))))

(declare-datatypes ((Unit!11628 0))(
  ( (Unit!11629) )
))
(declare-fun lt!175445 () Unit!11628)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!105 (array!22021 array!22019 (_ BitVec 32) (_ BitVec 32) V!13165 V!13165 (_ BitVec 32) (_ BitVec 64) V!13165 (_ BitVec 32) Int) Unit!11628)

(assert (=> b!377377 (= lt!175445 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!105 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!781 (array!22021 array!22019 (_ BitVec 32) (_ BitVec 32) V!13165 V!13165 (_ BitVec 32) Int) ListLongMap!5001)

(assert (=> b!377377 (= lt!175446 (getCurrentListMapNoExtraKeys!781 lt!175452 lt!175440 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377377 (= lt!175440 (array!22020 (store (arr!10478 _values!506) i!548 (ValueCellFull!4179 v!373)) (size!10830 _values!506)))))

(assert (=> b!377377 (= lt!175449 (getCurrentListMapNoExtraKeys!781 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377378 () Bool)

(declare-fun res!213503 () Bool)

(declare-fun e!229759 () Bool)

(assert (=> b!377378 (=> (not res!213503) (not e!229759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22021 (_ BitVec 32)) Bool)

(assert (=> b!377378 (= res!213503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377379 () Bool)

(declare-fun res!213496 () Bool)

(assert (=> b!377379 (=> (not res!213496) (not e!229759))))

(assert (=> b!377379 (= res!213496 (and (= (size!10830 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10831 _keys!658) (size!10830 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377380 () Bool)

(declare-fun res!213506 () Bool)

(assert (=> b!377380 (=> (not res!213506) (not e!229759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377380 (= res!213506 (validKeyInArray!0 k0!778))))

(declare-fun b!377382 () Bool)

(declare-fun res!213498 () Bool)

(assert (=> b!377382 (=> (not res!213498) (not e!229759))))

(declare-datatypes ((List!5930 0))(
  ( (Nil!5927) (Cons!5926 (h!6782 (_ BitVec 64)) (t!11080 List!5930)) )
))
(declare-fun arrayNoDuplicates!0 (array!22021 (_ BitVec 32) List!5930) Bool)

(assert (=> b!377382 (= res!213498 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5927))))

(declare-fun b!377383 () Bool)

(assert (=> b!377383 (= e!229766 true)))

(assert (=> b!377383 (= lt!175443 (+!862 lt!175441 lt!175448))))

(declare-fun lt!175447 () Unit!11628)

(declare-fun addCommutativeForDiffKeys!272 (ListLongMap!5001 (_ BitVec 64) V!13165 (_ BitVec 64) V!13165) Unit!11628)

(assert (=> b!377383 (= lt!175447 (addCommutativeForDiffKeys!272 lt!175449 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377384 () Bool)

(declare-fun e!229761 () Bool)

(declare-fun tp_is_empty!9045 () Bool)

(assert (=> b!377384 (= e!229761 tp_is_empty!9045)))

(declare-fun b!377385 () Bool)

(assert (=> b!377385 (= e!229759 e!229765)))

(declare-fun res!213502 () Bool)

(assert (=> b!377385 (=> (not res!213502) (not e!229765))))

(assert (=> b!377385 (= res!213502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175452 mask!970))))

(assert (=> b!377385 (= lt!175452 (array!22022 (store (arr!10479 _keys!658) i!548 k0!778) (size!10831 _keys!658)))))

(declare-fun mapNonEmpty!15132 () Bool)

(declare-fun mapRes!15132 () Bool)

(declare-fun tp!29907 () Bool)

(assert (=> mapNonEmpty!15132 (= mapRes!15132 (and tp!29907 e!229761))))

(declare-fun mapValue!15132 () ValueCell!4179)

(declare-fun mapKey!15132 () (_ BitVec 32))

(declare-fun mapRest!15132 () (Array (_ BitVec 32) ValueCell!4179))

(assert (=> mapNonEmpty!15132 (= (arr!10478 _values!506) (store mapRest!15132 mapKey!15132 mapValue!15132))))

(declare-fun b!377381 () Bool)

(declare-fun res!213504 () Bool)

(assert (=> b!377381 (=> (not res!213504) (not e!229759))))

(assert (=> b!377381 (= res!213504 (or (= (select (arr!10479 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10479 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!213495 () Bool)

(assert (=> start!37270 (=> (not res!213495) (not e!229759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37270 (= res!213495 (validMask!0 mask!970))))

(assert (=> start!37270 e!229759))

(declare-fun e!229762 () Bool)

(declare-fun array_inv!7722 (array!22019) Bool)

(assert (=> start!37270 (and (array_inv!7722 _values!506) e!229762)))

(assert (=> start!37270 tp!29906))

(assert (=> start!37270 true))

(assert (=> start!37270 tp_is_empty!9045))

(declare-fun array_inv!7723 (array!22021) Bool)

(assert (=> start!37270 (array_inv!7723 _keys!658)))

(declare-fun b!377386 () Bool)

(declare-fun e!229763 () Bool)

(assert (=> b!377386 (= e!229762 (and e!229763 mapRes!15132))))

(declare-fun condMapEmpty!15132 () Bool)

(declare-fun mapDefault!15132 () ValueCell!4179)

(assert (=> b!377386 (= condMapEmpty!15132 (= (arr!10478 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4179)) mapDefault!15132)))))

(declare-fun b!377387 () Bool)

(assert (=> b!377387 (= e!229763 tp_is_empty!9045)))

(declare-fun mapIsEmpty!15132 () Bool)

(assert (=> mapIsEmpty!15132 mapRes!15132))

(declare-fun b!377388 () Bool)

(declare-fun res!213501 () Bool)

(assert (=> b!377388 (=> (not res!213501) (not e!229759))))

(declare-fun arrayContainsKey!0 (array!22021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377388 (= res!213501 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377389 () Bool)

(declare-fun res!213505 () Bool)

(assert (=> b!377389 (=> (not res!213505) (not e!229765))))

(assert (=> b!377389 (= res!213505 (arrayNoDuplicates!0 lt!175452 #b00000000000000000000000000000000 Nil!5927))))

(declare-fun b!377390 () Bool)

(declare-fun res!213499 () Bool)

(assert (=> b!377390 (=> (not res!213499) (not e!229759))))

(assert (=> b!377390 (= res!213499 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10831 _keys!658))))))

(assert (= (and start!37270 res!213495) b!377379))

(assert (= (and b!377379 res!213496) b!377378))

(assert (= (and b!377378 res!213503) b!377382))

(assert (= (and b!377382 res!213498) b!377390))

(assert (= (and b!377390 res!213499) b!377380))

(assert (= (and b!377380 res!213506) b!377381))

(assert (= (and b!377381 res!213504) b!377388))

(assert (= (and b!377388 res!213501) b!377385))

(assert (= (and b!377385 res!213502) b!377389))

(assert (= (and b!377389 res!213505) b!377377))

(assert (= (and b!377377 (not res!213497)) b!377376))

(assert (= (and b!377376 (not res!213500)) b!377383))

(assert (= (and b!377386 condMapEmpty!15132) mapIsEmpty!15132))

(assert (= (and b!377386 (not condMapEmpty!15132)) mapNonEmpty!15132))

(get-info :version)

(assert (= (and mapNonEmpty!15132 ((_ is ValueCellFull!4179) mapValue!15132)) b!377384))

(assert (= (and b!377386 ((_ is ValueCellFull!4179) mapDefault!15132)) b!377387))

(assert (= start!37270 b!377386))

(declare-fun m!374139 () Bool)

(assert (=> b!377382 m!374139))

(declare-fun m!374141 () Bool)

(assert (=> mapNonEmpty!15132 m!374141))

(declare-fun m!374143 () Bool)

(assert (=> b!377389 m!374143))

(declare-fun m!374145 () Bool)

(assert (=> b!377376 m!374145))

(declare-fun m!374147 () Bool)

(assert (=> b!377376 m!374147))

(declare-fun m!374149 () Bool)

(assert (=> b!377376 m!374149))

(declare-fun m!374151 () Bool)

(assert (=> b!377381 m!374151))

(declare-fun m!374153 () Bool)

(assert (=> b!377383 m!374153))

(declare-fun m!374155 () Bool)

(assert (=> b!377383 m!374155))

(declare-fun m!374157 () Bool)

(assert (=> b!377380 m!374157))

(declare-fun m!374159 () Bool)

(assert (=> b!377378 m!374159))

(declare-fun m!374161 () Bool)

(assert (=> b!377377 m!374161))

(declare-fun m!374163 () Bool)

(assert (=> b!377377 m!374163))

(declare-fun m!374165 () Bool)

(assert (=> b!377377 m!374165))

(declare-fun m!374167 () Bool)

(assert (=> b!377377 m!374167))

(declare-fun m!374169 () Bool)

(assert (=> b!377377 m!374169))

(declare-fun m!374171 () Bool)

(assert (=> b!377377 m!374171))

(declare-fun m!374173 () Bool)

(assert (=> b!377377 m!374173))

(declare-fun m!374175 () Bool)

(assert (=> b!377388 m!374175))

(declare-fun m!374177 () Bool)

(assert (=> start!37270 m!374177))

(declare-fun m!374179 () Bool)

(assert (=> start!37270 m!374179))

(declare-fun m!374181 () Bool)

(assert (=> start!37270 m!374181))

(declare-fun m!374183 () Bool)

(assert (=> b!377385 m!374183))

(declare-fun m!374185 () Bool)

(assert (=> b!377385 m!374185))

(check-sat (not b_next!8397) (not b!377388) (not start!37270) (not mapNonEmpty!15132) (not b!377376) (not b!377378) b_and!15639 (not b!377383) tp_is_empty!9045 (not b!377380) (not b!377385) (not b!377377) (not b!377389) (not b!377382))
(check-sat b_and!15639 (not b_next!8397))
