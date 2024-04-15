; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39848 () Bool)

(assert start!39848)

(declare-fun b_free!10129 () Bool)

(declare-fun b_next!10129 () Bool)

(assert (=> start!39848 (= b_free!10129 (not b_next!10129))))

(declare-fun tp!35916 () Bool)

(declare-fun b_and!17891 () Bool)

(assert (=> start!39848 (= tp!35916 b_and!17891)))

(declare-fun b!430929 () Bool)

(declare-fun res!253349 () Bool)

(declare-fun e!255023 () Bool)

(assert (=> b!430929 (=> (not res!253349) (not e!255023))))

(declare-datatypes ((array!26389 0))(
  ( (array!26390 (arr!12644 (Array (_ BitVec 32) (_ BitVec 64))) (size!12997 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26389)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26389 (_ BitVec 32)) Bool)

(assert (=> b!430929 (= res!253349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430930 () Bool)

(declare-fun res!253343 () Bool)

(assert (=> b!430930 (=> (not res!253343) (not e!255023))))

(declare-datatypes ((List!7499 0))(
  ( (Nil!7496) (Cons!7495 (h!8351 (_ BitVec 64)) (t!13068 List!7499)) )
))
(declare-fun arrayNoDuplicates!0 (array!26389 (_ BitVec 32) List!7499) Bool)

(assert (=> b!430930 (= res!253343 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7496))))

(declare-fun b!430931 () Bool)

(declare-fun res!253355 () Bool)

(assert (=> b!430931 (=> (not res!253355) (not e!255023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430931 (= res!253355 (validMask!0 mask!1025))))

(declare-fun b!430933 () Bool)

(declare-fun e!255025 () Bool)

(declare-fun e!255018 () Bool)

(assert (=> b!430933 (= e!255025 e!255018)))

(declare-fun res!253348 () Bool)

(assert (=> b!430933 (=> (not res!253348) (not e!255018))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430933 (= res!253348 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16147 0))(
  ( (V!16148 (val!5685 Int)) )
))
(declare-fun minValue!515 () V!16147)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16147)

(declare-datatypes ((ValueCell!5297 0))(
  ( (ValueCellFull!5297 (v!7926 V!16147)) (EmptyCell!5297) )
))
(declare-datatypes ((array!26391 0))(
  ( (array!26392 (arr!12645 (Array (_ BitVec 32) ValueCell!5297)) (size!12998 (_ BitVec 32))) )
))
(declare-fun lt!197184 () array!26391)

(declare-fun lt!197175 () array!26389)

(declare-datatypes ((tuple2!7502 0))(
  ( (tuple2!7503 (_1!3762 (_ BitVec 64)) (_2!3762 V!16147)) )
))
(declare-datatypes ((List!7500 0))(
  ( (Nil!7497) (Cons!7496 (h!8352 tuple2!7502) (t!13069 List!7500)) )
))
(declare-datatypes ((ListLongMap!6405 0))(
  ( (ListLongMap!6406 (toList!3218 List!7500)) )
))
(declare-fun lt!197172 () ListLongMap!6405)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1424 (array!26389 array!26391 (_ BitVec 32) (_ BitVec 32) V!16147 V!16147 (_ BitVec 32) Int) ListLongMap!6405)

(assert (=> b!430933 (= lt!197172 (getCurrentListMapNoExtraKeys!1424 lt!197175 lt!197184 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26391)

(declare-fun v!412 () V!16147)

(assert (=> b!430933 (= lt!197184 (array!26392 (store (arr!12645 _values!549) i!563 (ValueCellFull!5297 v!412)) (size!12998 _values!549)))))

(declare-fun lt!197186 () ListLongMap!6405)

(assert (=> b!430933 (= lt!197186 (getCurrentListMapNoExtraKeys!1424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430934 () Bool)

(declare-fun e!255019 () Bool)

(declare-fun tp_is_empty!11281 () Bool)

(assert (=> b!430934 (= e!255019 tp_is_empty!11281)))

(declare-fun b!430935 () Bool)

(declare-fun res!253342 () Bool)

(assert (=> b!430935 (=> (not res!253342) (not e!255025))))

(assert (=> b!430935 (= res!253342 (arrayNoDuplicates!0 lt!197175 #b00000000000000000000000000000000 Nil!7496))))

(declare-fun mapIsEmpty!18543 () Bool)

(declare-fun mapRes!18543 () Bool)

(assert (=> mapIsEmpty!18543 mapRes!18543))

(declare-fun b!430936 () Bool)

(declare-fun e!255024 () Bool)

(declare-fun e!255021 () Bool)

(assert (=> b!430936 (= e!255024 e!255021)))

(declare-fun res!253351 () Bool)

(assert (=> b!430936 (=> res!253351 e!255021)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!430936 (= res!253351 (= k0!794 (select (arr!12644 _keys!709) from!863)))))

(assert (=> b!430936 (not (= (select (arr!12644 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12690 0))(
  ( (Unit!12691) )
))
(declare-fun lt!197173 () Unit!12690)

(declare-fun e!255026 () Unit!12690)

(assert (=> b!430936 (= lt!197173 e!255026)))

(declare-fun c!55458 () Bool)

(assert (=> b!430936 (= c!55458 (= (select (arr!12644 _keys!709) from!863) k0!794))))

(declare-fun lt!197178 () ListLongMap!6405)

(assert (=> b!430936 (= lt!197172 lt!197178)))

(declare-fun lt!197182 () ListLongMap!6405)

(declare-fun lt!197181 () tuple2!7502)

(declare-fun +!1394 (ListLongMap!6405 tuple2!7502) ListLongMap!6405)

(assert (=> b!430936 (= lt!197178 (+!1394 lt!197182 lt!197181))))

(declare-fun lt!197174 () V!16147)

(assert (=> b!430936 (= lt!197181 (tuple2!7503 (select (arr!12644 _keys!709) from!863) lt!197174))))

(declare-fun get!6277 (ValueCell!5297 V!16147) V!16147)

(declare-fun dynLambda!783 (Int (_ BitVec 64)) V!16147)

(assert (=> b!430936 (= lt!197174 (get!6277 (select (arr!12645 _values!549) from!863) (dynLambda!783 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430937 () Bool)

(declare-fun e!255022 () Bool)

(assert (=> b!430937 (= e!255022 tp_is_empty!11281)))

(declare-fun b!430938 () Bool)

(declare-fun res!253352 () Bool)

(assert (=> b!430938 (=> (not res!253352) (not e!255023))))

(declare-fun arrayContainsKey!0 (array!26389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430938 (= res!253352 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18543 () Bool)

(declare-fun tp!35915 () Bool)

(assert (=> mapNonEmpty!18543 (= mapRes!18543 (and tp!35915 e!255019))))

(declare-fun mapValue!18543 () ValueCell!5297)

(declare-fun mapKey!18543 () (_ BitVec 32))

(declare-fun mapRest!18543 () (Array (_ BitVec 32) ValueCell!5297))

(assert (=> mapNonEmpty!18543 (= (arr!12645 _values!549) (store mapRest!18543 mapKey!18543 mapValue!18543))))

(declare-fun b!430939 () Bool)

(declare-fun res!253356 () Bool)

(assert (=> b!430939 (=> (not res!253356) (not e!255023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430939 (= res!253356 (validKeyInArray!0 k0!794))))

(declare-fun b!430940 () Bool)

(declare-fun res!253344 () Bool)

(assert (=> b!430940 (=> (not res!253344) (not e!255023))))

(assert (=> b!430940 (= res!253344 (or (= (select (arr!12644 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12644 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430941 () Bool)

(assert (=> b!430941 (= e!255023 e!255025)))

(declare-fun res!253353 () Bool)

(assert (=> b!430941 (=> (not res!253353) (not e!255025))))

(assert (=> b!430941 (= res!253353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197175 mask!1025))))

(assert (=> b!430941 (= lt!197175 (array!26390 (store (arr!12644 _keys!709) i!563 k0!794) (size!12997 _keys!709)))))

(declare-fun b!430942 () Bool)

(declare-fun res!253345 () Bool)

(assert (=> b!430942 (=> (not res!253345) (not e!255023))))

(assert (=> b!430942 (= res!253345 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12997 _keys!709))))))

(declare-fun res!253346 () Bool)

(assert (=> start!39848 (=> (not res!253346) (not e!255023))))

(assert (=> start!39848 (= res!253346 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12997 _keys!709))))))

(assert (=> start!39848 e!255023))

(assert (=> start!39848 tp_is_empty!11281))

(assert (=> start!39848 tp!35916))

(assert (=> start!39848 true))

(declare-fun e!255020 () Bool)

(declare-fun array_inv!9236 (array!26391) Bool)

(assert (=> start!39848 (and (array_inv!9236 _values!549) e!255020)))

(declare-fun array_inv!9237 (array!26389) Bool)

(assert (=> start!39848 (array_inv!9237 _keys!709)))

(declare-fun b!430932 () Bool)

(declare-fun res!253354 () Bool)

(assert (=> b!430932 (=> (not res!253354) (not e!255023))))

(assert (=> b!430932 (= res!253354 (and (= (size!12998 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12997 _keys!709) (size!12998 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430943 () Bool)

(declare-fun Unit!12692 () Unit!12690)

(assert (=> b!430943 (= e!255026 Unit!12692)))

(declare-fun lt!197179 () Unit!12690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12690)

(assert (=> b!430943 (= lt!197179 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430943 false))

(declare-fun b!430944 () Bool)

(declare-fun Unit!12693 () Unit!12690)

(assert (=> b!430944 (= e!255026 Unit!12693)))

(declare-fun b!430945 () Bool)

(assert (=> b!430945 (= e!255020 (and e!255022 mapRes!18543))))

(declare-fun condMapEmpty!18543 () Bool)

(declare-fun mapDefault!18543 () ValueCell!5297)

(assert (=> b!430945 (= condMapEmpty!18543 (= (arr!12645 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5297)) mapDefault!18543)))))

(declare-fun b!430946 () Bool)

(declare-fun res!253347 () Bool)

(assert (=> b!430946 (=> (not res!253347) (not e!255025))))

(assert (=> b!430946 (= res!253347 (bvsle from!863 i!563))))

(declare-fun b!430947 () Bool)

(assert (=> b!430947 (= e!255018 (not e!255024))))

(declare-fun res!253350 () Bool)

(assert (=> b!430947 (=> res!253350 e!255024)))

(assert (=> b!430947 (= res!253350 (not (validKeyInArray!0 (select (arr!12644 _keys!709) from!863))))))

(declare-fun lt!197180 () ListLongMap!6405)

(assert (=> b!430947 (= lt!197180 lt!197182)))

(declare-fun lt!197183 () ListLongMap!6405)

(declare-fun lt!197177 () tuple2!7502)

(assert (=> b!430947 (= lt!197182 (+!1394 lt!197183 lt!197177))))

(assert (=> b!430947 (= lt!197180 (getCurrentListMapNoExtraKeys!1424 lt!197175 lt!197184 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430947 (= lt!197177 (tuple2!7503 k0!794 v!412))))

(assert (=> b!430947 (= lt!197183 (getCurrentListMapNoExtraKeys!1424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197185 () Unit!12690)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!555 (array!26389 array!26391 (_ BitVec 32) (_ BitVec 32) V!16147 V!16147 (_ BitVec 32) (_ BitVec 64) V!16147 (_ BitVec 32) Int) Unit!12690)

(assert (=> b!430947 (= lt!197185 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!555 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430948 () Bool)

(assert (=> b!430948 (= e!255021 true)))

(assert (=> b!430948 (= lt!197178 (+!1394 (+!1394 lt!197183 lt!197181) lt!197177))))

(declare-fun lt!197176 () Unit!12690)

(declare-fun addCommutativeForDiffKeys!357 (ListLongMap!6405 (_ BitVec 64) V!16147 (_ BitVec 64) V!16147) Unit!12690)

(assert (=> b!430948 (= lt!197176 (addCommutativeForDiffKeys!357 lt!197183 k0!794 v!412 (select (arr!12644 _keys!709) from!863) lt!197174))))

(assert (= (and start!39848 res!253346) b!430931))

(assert (= (and b!430931 res!253355) b!430932))

(assert (= (and b!430932 res!253354) b!430929))

(assert (= (and b!430929 res!253349) b!430930))

(assert (= (and b!430930 res!253343) b!430942))

(assert (= (and b!430942 res!253345) b!430939))

(assert (= (and b!430939 res!253356) b!430940))

(assert (= (and b!430940 res!253344) b!430938))

(assert (= (and b!430938 res!253352) b!430941))

(assert (= (and b!430941 res!253353) b!430935))

(assert (= (and b!430935 res!253342) b!430946))

(assert (= (and b!430946 res!253347) b!430933))

(assert (= (and b!430933 res!253348) b!430947))

(assert (= (and b!430947 (not res!253350)) b!430936))

(assert (= (and b!430936 c!55458) b!430943))

(assert (= (and b!430936 (not c!55458)) b!430944))

(assert (= (and b!430936 (not res!253351)) b!430948))

(assert (= (and b!430945 condMapEmpty!18543) mapIsEmpty!18543))

(assert (= (and b!430945 (not condMapEmpty!18543)) mapNonEmpty!18543))

(get-info :version)

(assert (= (and mapNonEmpty!18543 ((_ is ValueCellFull!5297) mapValue!18543)) b!430934))

(assert (= (and b!430945 ((_ is ValueCellFull!5297) mapDefault!18543)) b!430937))

(assert (= start!39848 b!430945))

(declare-fun b_lambda!9199 () Bool)

(assert (=> (not b_lambda!9199) (not b!430936)))

(declare-fun t!13067 () Bool)

(declare-fun tb!3527 () Bool)

(assert (=> (and start!39848 (= defaultEntry!557 defaultEntry!557) t!13067) tb!3527))

(declare-fun result!6589 () Bool)

(assert (=> tb!3527 (= result!6589 tp_is_empty!11281)))

(assert (=> b!430936 t!13067))

(declare-fun b_and!17893 () Bool)

(assert (= b_and!17891 (and (=> t!13067 result!6589) b_and!17893)))

(declare-fun m!418629 () Bool)

(assert (=> b!430939 m!418629))

(declare-fun m!418631 () Bool)

(assert (=> b!430930 m!418631))

(declare-fun m!418633 () Bool)

(assert (=> b!430947 m!418633))

(declare-fun m!418635 () Bool)

(assert (=> b!430947 m!418635))

(declare-fun m!418637 () Bool)

(assert (=> b!430947 m!418637))

(declare-fun m!418639 () Bool)

(assert (=> b!430947 m!418639))

(assert (=> b!430947 m!418633))

(declare-fun m!418641 () Bool)

(assert (=> b!430947 m!418641))

(declare-fun m!418643 () Bool)

(assert (=> b!430947 m!418643))

(declare-fun m!418645 () Bool)

(assert (=> b!430941 m!418645))

(declare-fun m!418647 () Bool)

(assert (=> b!430941 m!418647))

(declare-fun m!418649 () Bool)

(assert (=> b!430940 m!418649))

(declare-fun m!418651 () Bool)

(assert (=> b!430938 m!418651))

(declare-fun m!418653 () Bool)

(assert (=> b!430933 m!418653))

(declare-fun m!418655 () Bool)

(assert (=> b!430933 m!418655))

(declare-fun m!418657 () Bool)

(assert (=> b!430933 m!418657))

(assert (=> b!430936 m!418633))

(declare-fun m!418659 () Bool)

(assert (=> b!430936 m!418659))

(declare-fun m!418661 () Bool)

(assert (=> b!430936 m!418661))

(declare-fun m!418663 () Bool)

(assert (=> b!430936 m!418663))

(assert (=> b!430936 m!418661))

(assert (=> b!430936 m!418659))

(declare-fun m!418665 () Bool)

(assert (=> b!430936 m!418665))

(declare-fun m!418667 () Bool)

(assert (=> b!430943 m!418667))

(declare-fun m!418669 () Bool)

(assert (=> start!39848 m!418669))

(declare-fun m!418671 () Bool)

(assert (=> start!39848 m!418671))

(declare-fun m!418673 () Bool)

(assert (=> b!430948 m!418673))

(assert (=> b!430948 m!418673))

(declare-fun m!418675 () Bool)

(assert (=> b!430948 m!418675))

(assert (=> b!430948 m!418633))

(assert (=> b!430948 m!418633))

(declare-fun m!418677 () Bool)

(assert (=> b!430948 m!418677))

(declare-fun m!418679 () Bool)

(assert (=> b!430929 m!418679))

(declare-fun m!418681 () Bool)

(assert (=> mapNonEmpty!18543 m!418681))

(declare-fun m!418683 () Bool)

(assert (=> b!430931 m!418683))

(declare-fun m!418685 () Bool)

(assert (=> b!430935 m!418685))

(check-sat (not b!430947) (not b!430933) (not b!430936) b_and!17893 (not b!430948) (not b!430930) (not b!430935) (not b_lambda!9199) (not b_next!10129) (not start!39848) (not b!430939) (not b!430929) (not b!430938) tp_is_empty!11281 (not b!430941) (not b!430943) (not mapNonEmpty!18543) (not b!430931))
(check-sat b_and!17893 (not b_next!10129))
