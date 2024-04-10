; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39948 () Bool)

(assert start!39948)

(declare-fun b_free!10215 () Bool)

(declare-fun b_next!10215 () Bool)

(assert (=> start!39948 (= b_free!10215 (not b_next!10215))))

(declare-fun tp!36174 () Bool)

(declare-fun b_and!18089 () Bool)

(assert (=> start!39948 (= tp!36174 b_and!18089)))

(declare-fun mapNonEmpty!18672 () Bool)

(declare-fun mapRes!18672 () Bool)

(declare-fun tp!36173 () Bool)

(declare-fun e!256486 () Bool)

(assert (=> mapNonEmpty!18672 (= mapRes!18672 (and tp!36173 e!256486))))

(declare-datatypes ((V!16261 0))(
  ( (V!16262 (val!5728 Int)) )
))
(declare-datatypes ((ValueCell!5340 0))(
  ( (ValueCellFull!5340 (v!7975 V!16261)) (EmptyCell!5340) )
))
(declare-fun mapValue!18672 () ValueCell!5340)

(declare-fun mapRest!18672 () (Array (_ BitVec 32) ValueCell!5340))

(declare-fun mapKey!18672 () (_ BitVec 32))

(declare-datatypes ((array!26567 0))(
  ( (array!26568 (arr!12733 (Array (_ BitVec 32) ValueCell!5340)) (size!13085 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26567)

(assert (=> mapNonEmpty!18672 (= (arr!12733 _values!549) (store mapRest!18672 mapKey!18672 mapValue!18672))))

(declare-fun b!433866 () Bool)

(declare-fun e!256490 () Bool)

(declare-fun e!256485 () Bool)

(assert (=> b!433866 (= e!256490 e!256485)))

(declare-fun res!255414 () Bool)

(assert (=> b!433866 (=> (not res!255414) (not e!256485))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433866 (= res!255414 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16261)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!26569 0))(
  ( (array!26570 (arr!12734 (Array (_ BitVec 32) (_ BitVec 64))) (size!13086 (_ BitVec 32))) )
))
(declare-fun lt!199347 () array!26569)

(declare-fun zeroValue!515 () V!16261)

(declare-fun lt!199346 () array!26567)

(declare-datatypes ((tuple2!7574 0))(
  ( (tuple2!7575 (_1!3798 (_ BitVec 64)) (_2!3798 V!16261)) )
))
(declare-datatypes ((List!7581 0))(
  ( (Nil!7578) (Cons!7577 (h!8433 tuple2!7574) (t!13245 List!7581)) )
))
(declare-datatypes ((ListLongMap!6487 0))(
  ( (ListLongMap!6488 (toList!3259 List!7581)) )
))
(declare-fun lt!199341 () ListLongMap!6487)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1453 (array!26569 array!26567 (_ BitVec 32) (_ BitVec 32) V!16261 V!16261 (_ BitVec 32) Int) ListLongMap!6487)

(assert (=> b!433866 (= lt!199341 (getCurrentListMapNoExtraKeys!1453 lt!199347 lt!199346 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16261)

(assert (=> b!433866 (= lt!199346 (array!26568 (store (arr!12733 _values!549) i!563 (ValueCellFull!5340 v!412)) (size!13085 _values!549)))))

(declare-fun lt!199348 () ListLongMap!6487)

(declare-fun _keys!709 () array!26569)

(assert (=> b!433866 (= lt!199348 (getCurrentListMapNoExtraKeys!1453 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433867 () Bool)

(declare-fun res!255415 () Bool)

(declare-fun e!256482 () Bool)

(assert (=> b!433867 (=> (not res!255415) (not e!256482))))

(declare-datatypes ((List!7582 0))(
  ( (Nil!7579) (Cons!7578 (h!8434 (_ BitVec 64)) (t!13246 List!7582)) )
))
(declare-fun arrayNoDuplicates!0 (array!26569 (_ BitVec 32) List!7582) Bool)

(assert (=> b!433867 (= res!255415 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7579))))

(declare-fun b!433869 () Bool)

(declare-fun res!255416 () Bool)

(assert (=> b!433869 (=> (not res!255416) (not e!256482))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433869 (= res!255416 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18672 () Bool)

(assert (=> mapIsEmpty!18672 mapRes!18672))

(declare-fun b!433870 () Bool)

(declare-fun e!256487 () Bool)

(assert (=> b!433870 (= e!256487 true)))

(declare-fun lt!199343 () ListLongMap!6487)

(declare-fun lt!199352 () tuple2!7574)

(declare-fun lt!199349 () ListLongMap!6487)

(declare-fun lt!199344 () tuple2!7574)

(declare-fun +!1407 (ListLongMap!6487 tuple2!7574) ListLongMap!6487)

(assert (=> b!433870 (= lt!199343 (+!1407 (+!1407 lt!199349 lt!199344) lt!199352))))

(declare-fun lt!199345 () V!16261)

(declare-datatypes ((Unit!12853 0))(
  ( (Unit!12854) )
))
(declare-fun lt!199342 () Unit!12853)

(declare-fun addCommutativeForDiffKeys!395 (ListLongMap!6487 (_ BitVec 64) V!16261 (_ BitVec 64) V!16261) Unit!12853)

(assert (=> b!433870 (= lt!199342 (addCommutativeForDiffKeys!395 lt!199349 k0!794 v!412 (select (arr!12734 _keys!709) from!863) lt!199345))))

(declare-fun b!433871 () Bool)

(declare-fun res!255412 () Bool)

(assert (=> b!433871 (=> (not res!255412) (not e!256482))))

(declare-fun arrayContainsKey!0 (array!26569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433871 (= res!255412 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433872 () Bool)

(declare-fun e!256491 () Unit!12853)

(declare-fun Unit!12855 () Unit!12853)

(assert (=> b!433872 (= e!256491 Unit!12855)))

(declare-fun b!433873 () Bool)

(declare-fun res!255413 () Bool)

(assert (=> b!433873 (=> (not res!255413) (not e!256482))))

(assert (=> b!433873 (= res!255413 (and (= (size!13085 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13086 _keys!709) (size!13085 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433874 () Bool)

(declare-fun e!256489 () Bool)

(declare-fun tp_is_empty!11367 () Bool)

(assert (=> b!433874 (= e!256489 tp_is_empty!11367)))

(declare-fun b!433875 () Bool)

(declare-fun e!256484 () Bool)

(assert (=> b!433875 (= e!256484 e!256487)))

(declare-fun res!255406 () Bool)

(assert (=> b!433875 (=> res!255406 e!256487)))

(assert (=> b!433875 (= res!255406 (= k0!794 (select (arr!12734 _keys!709) from!863)))))

(assert (=> b!433875 (not (= (select (arr!12734 _keys!709) from!863) k0!794))))

(declare-fun lt!199351 () Unit!12853)

(assert (=> b!433875 (= lt!199351 e!256491)))

(declare-fun c!55658 () Bool)

(assert (=> b!433875 (= c!55658 (= (select (arr!12734 _keys!709) from!863) k0!794))))

(assert (=> b!433875 (= lt!199341 lt!199343)))

(declare-fun lt!199350 () ListLongMap!6487)

(assert (=> b!433875 (= lt!199343 (+!1407 lt!199350 lt!199344))))

(assert (=> b!433875 (= lt!199344 (tuple2!7575 (select (arr!12734 _keys!709) from!863) lt!199345))))

(declare-fun get!6338 (ValueCell!5340 V!16261) V!16261)

(declare-fun dynLambda!819 (Int (_ BitVec 64)) V!16261)

(assert (=> b!433875 (= lt!199345 (get!6338 (select (arr!12733 _values!549) from!863) (dynLambda!819 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433876 () Bool)

(assert (=> b!433876 (= e!256485 (not e!256484))))

(declare-fun res!255418 () Bool)

(assert (=> b!433876 (=> res!255418 e!256484)))

(assert (=> b!433876 (= res!255418 (not (validKeyInArray!0 (select (arr!12734 _keys!709) from!863))))))

(declare-fun lt!199354 () ListLongMap!6487)

(assert (=> b!433876 (= lt!199354 lt!199350)))

(assert (=> b!433876 (= lt!199350 (+!1407 lt!199349 lt!199352))))

(assert (=> b!433876 (= lt!199354 (getCurrentListMapNoExtraKeys!1453 lt!199347 lt!199346 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433876 (= lt!199352 (tuple2!7575 k0!794 v!412))))

(assert (=> b!433876 (= lt!199349 (getCurrentListMapNoExtraKeys!1453 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199355 () Unit!12853)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!585 (array!26569 array!26567 (_ BitVec 32) (_ BitVec 32) V!16261 V!16261 (_ BitVec 32) (_ BitVec 64) V!16261 (_ BitVec 32) Int) Unit!12853)

(assert (=> b!433876 (= lt!199355 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433877 () Bool)

(declare-fun e!256488 () Bool)

(assert (=> b!433877 (= e!256488 (and e!256489 mapRes!18672))))

(declare-fun condMapEmpty!18672 () Bool)

(declare-fun mapDefault!18672 () ValueCell!5340)

(assert (=> b!433877 (= condMapEmpty!18672 (= (arr!12733 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5340)) mapDefault!18672)))))

(declare-fun b!433878 () Bool)

(declare-fun res!255407 () Bool)

(assert (=> b!433878 (=> (not res!255407) (not e!256482))))

(assert (=> b!433878 (= res!255407 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13086 _keys!709))))))

(declare-fun b!433879 () Bool)

(assert (=> b!433879 (= e!256482 e!256490)))

(declare-fun res!255419 () Bool)

(assert (=> b!433879 (=> (not res!255419) (not e!256490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26569 (_ BitVec 32)) Bool)

(assert (=> b!433879 (= res!255419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199347 mask!1025))))

(assert (=> b!433879 (= lt!199347 (array!26570 (store (arr!12734 _keys!709) i!563 k0!794) (size!13086 _keys!709)))))

(declare-fun b!433880 () Bool)

(declare-fun res!255420 () Bool)

(assert (=> b!433880 (=> (not res!255420) (not e!256490))))

(assert (=> b!433880 (= res!255420 (bvsle from!863 i!563))))

(declare-fun b!433881 () Bool)

(assert (=> b!433881 (= e!256486 tp_is_empty!11367)))

(declare-fun b!433882 () Bool)

(declare-fun res!255409 () Bool)

(assert (=> b!433882 (=> (not res!255409) (not e!256490))))

(assert (=> b!433882 (= res!255409 (arrayNoDuplicates!0 lt!199347 #b00000000000000000000000000000000 Nil!7579))))

(declare-fun b!433883 () Bool)

(declare-fun Unit!12856 () Unit!12853)

(assert (=> b!433883 (= e!256491 Unit!12856)))

(declare-fun lt!199353 () Unit!12853)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12853)

(assert (=> b!433883 (= lt!199353 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433883 false))

(declare-fun b!433868 () Bool)

(declare-fun res!255411 () Bool)

(assert (=> b!433868 (=> (not res!255411) (not e!256482))))

(assert (=> b!433868 (= res!255411 (or (= (select (arr!12734 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12734 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!255410 () Bool)

(assert (=> start!39948 (=> (not res!255410) (not e!256482))))

(assert (=> start!39948 (= res!255410 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13086 _keys!709))))))

(assert (=> start!39948 e!256482))

(assert (=> start!39948 tp_is_empty!11367))

(assert (=> start!39948 tp!36174))

(assert (=> start!39948 true))

(declare-fun array_inv!9264 (array!26567) Bool)

(assert (=> start!39948 (and (array_inv!9264 _values!549) e!256488)))

(declare-fun array_inv!9265 (array!26569) Bool)

(assert (=> start!39948 (array_inv!9265 _keys!709)))

(declare-fun b!433884 () Bool)

(declare-fun res!255417 () Bool)

(assert (=> b!433884 (=> (not res!255417) (not e!256482))))

(assert (=> b!433884 (= res!255417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433885 () Bool)

(declare-fun res!255408 () Bool)

(assert (=> b!433885 (=> (not res!255408) (not e!256482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433885 (= res!255408 (validMask!0 mask!1025))))

(assert (= (and start!39948 res!255410) b!433885))

(assert (= (and b!433885 res!255408) b!433873))

(assert (= (and b!433873 res!255413) b!433884))

(assert (= (and b!433884 res!255417) b!433867))

(assert (= (and b!433867 res!255415) b!433878))

(assert (= (and b!433878 res!255407) b!433869))

(assert (= (and b!433869 res!255416) b!433868))

(assert (= (and b!433868 res!255411) b!433871))

(assert (= (and b!433871 res!255412) b!433879))

(assert (= (and b!433879 res!255419) b!433882))

(assert (= (and b!433882 res!255409) b!433880))

(assert (= (and b!433880 res!255420) b!433866))

(assert (= (and b!433866 res!255414) b!433876))

(assert (= (and b!433876 (not res!255418)) b!433875))

(assert (= (and b!433875 c!55658) b!433883))

(assert (= (and b!433875 (not c!55658)) b!433872))

(assert (= (and b!433875 (not res!255406)) b!433870))

(assert (= (and b!433877 condMapEmpty!18672) mapIsEmpty!18672))

(assert (= (and b!433877 (not condMapEmpty!18672)) mapNonEmpty!18672))

(get-info :version)

(assert (= (and mapNonEmpty!18672 ((_ is ValueCellFull!5340) mapValue!18672)) b!433881))

(assert (= (and b!433877 ((_ is ValueCellFull!5340) mapDefault!18672)) b!433874))

(assert (= start!39948 b!433877))

(declare-fun b_lambda!9303 () Bool)

(assert (=> (not b_lambda!9303) (not b!433875)))

(declare-fun t!13244 () Bool)

(declare-fun tb!3621 () Bool)

(assert (=> (and start!39948 (= defaultEntry!557 defaultEntry!557) t!13244) tb!3621))

(declare-fun result!6769 () Bool)

(assert (=> tb!3621 (= result!6769 tp_is_empty!11367)))

(assert (=> b!433875 t!13244))

(declare-fun b_and!18091 () Bool)

(assert (= b_and!18089 (and (=> t!13244 result!6769) b_and!18091)))

(declare-fun m!421855 () Bool)

(assert (=> b!433875 m!421855))

(declare-fun m!421857 () Bool)

(assert (=> b!433875 m!421857))

(declare-fun m!421859 () Bool)

(assert (=> b!433875 m!421859))

(declare-fun m!421861 () Bool)

(assert (=> b!433875 m!421861))

(assert (=> b!433875 m!421861))

(assert (=> b!433875 m!421857))

(declare-fun m!421863 () Bool)

(assert (=> b!433875 m!421863))

(declare-fun m!421865 () Bool)

(assert (=> b!433885 m!421865))

(declare-fun m!421867 () Bool)

(assert (=> b!433869 m!421867))

(declare-fun m!421869 () Bool)

(assert (=> b!433876 m!421869))

(declare-fun m!421871 () Bool)

(assert (=> b!433876 m!421871))

(assert (=> b!433876 m!421855))

(declare-fun m!421873 () Bool)

(assert (=> b!433876 m!421873))

(declare-fun m!421875 () Bool)

(assert (=> b!433876 m!421875))

(assert (=> b!433876 m!421855))

(declare-fun m!421877 () Bool)

(assert (=> b!433876 m!421877))

(declare-fun m!421879 () Bool)

(assert (=> b!433866 m!421879))

(declare-fun m!421881 () Bool)

(assert (=> b!433866 m!421881))

(declare-fun m!421883 () Bool)

(assert (=> b!433866 m!421883))

(declare-fun m!421885 () Bool)

(assert (=> b!433882 m!421885))

(declare-fun m!421887 () Bool)

(assert (=> start!39948 m!421887))

(declare-fun m!421889 () Bool)

(assert (=> start!39948 m!421889))

(declare-fun m!421891 () Bool)

(assert (=> b!433870 m!421891))

(assert (=> b!433870 m!421891))

(declare-fun m!421893 () Bool)

(assert (=> b!433870 m!421893))

(assert (=> b!433870 m!421855))

(assert (=> b!433870 m!421855))

(declare-fun m!421895 () Bool)

(assert (=> b!433870 m!421895))

(declare-fun m!421897 () Bool)

(assert (=> b!433871 m!421897))

(declare-fun m!421899 () Bool)

(assert (=> b!433884 m!421899))

(declare-fun m!421901 () Bool)

(assert (=> b!433879 m!421901))

(declare-fun m!421903 () Bool)

(assert (=> b!433879 m!421903))

(declare-fun m!421905 () Bool)

(assert (=> b!433883 m!421905))

(declare-fun m!421907 () Bool)

(assert (=> mapNonEmpty!18672 m!421907))

(declare-fun m!421909 () Bool)

(assert (=> b!433867 m!421909))

(declare-fun m!421911 () Bool)

(assert (=> b!433868 m!421911))

(check-sat tp_is_empty!11367 (not b!433870) (not b!433876) (not b!433882) (not b!433866) (not b!433871) (not b_next!10215) (not b!433885) b_and!18091 (not b_lambda!9303) (not b!433879) (not start!39948) (not b!433883) (not b!433869) (not b!433867) (not b!433875) (not b!433884) (not mapNonEmpty!18672))
(check-sat b_and!18091 (not b_next!10215))
