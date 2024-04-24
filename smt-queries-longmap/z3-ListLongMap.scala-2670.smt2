; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39824 () Bool)

(assert start!39824)

(declare-fun b_free!10105 () Bool)

(declare-fun b_next!10105 () Bool)

(assert (=> start!39824 (= b_free!10105 (not b_next!10105))))

(declare-fun tp!35844 () Bool)

(declare-fun b_and!17883 () Bool)

(assert (=> start!39824 (= tp!35844 b_and!17883)))

(declare-fun b!430407 () Bool)

(declare-fun e!254804 () Bool)

(declare-fun e!254803 () Bool)

(declare-fun mapRes!18507 () Bool)

(assert (=> b!430407 (= e!254804 (and e!254803 mapRes!18507))))

(declare-fun condMapEmpty!18507 () Bool)

(declare-datatypes ((V!16115 0))(
  ( (V!16116 (val!5673 Int)) )
))
(declare-datatypes ((ValueCell!5285 0))(
  ( (ValueCellFull!5285 (v!7921 V!16115)) (EmptyCell!5285) )
))
(declare-datatypes ((array!26354 0))(
  ( (array!26355 (arr!12626 (Array (_ BitVec 32) ValueCell!5285)) (size!12978 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26354)

(declare-fun mapDefault!18507 () ValueCell!5285)

(assert (=> b!430407 (= condMapEmpty!18507 (= (arr!12626 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5285)) mapDefault!18507)))))

(declare-fun b!430408 () Bool)

(declare-fun e!254809 () Bool)

(declare-fun e!254802 () Bool)

(assert (=> b!430408 (= e!254809 (not e!254802))))

(declare-fun res!252942 () Bool)

(assert (=> b!430408 (=> res!252942 e!254802)))

(declare-datatypes ((array!26356 0))(
  ( (array!26357 (arr!12627 (Array (_ BitVec 32) (_ BitVec 64))) (size!12979 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26356)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430408 (= res!252942 (not (validKeyInArray!0 (select (arr!12627 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7380 0))(
  ( (tuple2!7381 (_1!3701 (_ BitVec 64)) (_2!3701 V!16115)) )
))
(declare-datatypes ((List!7377 0))(
  ( (Nil!7374) (Cons!7373 (h!8229 tuple2!7380) (t!12923 List!7377)) )
))
(declare-datatypes ((ListLongMap!6295 0))(
  ( (ListLongMap!6296 (toList!3163 List!7377)) )
))
(declare-fun lt!196899 () ListLongMap!6295)

(declare-fun lt!196885 () ListLongMap!6295)

(assert (=> b!430408 (= lt!196899 lt!196885)))

(declare-fun lt!196897 () ListLongMap!6295)

(declare-fun lt!196891 () tuple2!7380)

(declare-fun +!1374 (ListLongMap!6295 tuple2!7380) ListLongMap!6295)

(assert (=> b!430408 (= lt!196885 (+!1374 lt!196897 lt!196891))))

(declare-fun minValue!515 () V!16115)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!196889 () array!26354)

(declare-fun zeroValue!515 () V!16115)

(declare-fun lt!196886 () array!26356)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1406 (array!26356 array!26354 (_ BitVec 32) (_ BitVec 32) V!16115 V!16115 (_ BitVec 32) Int) ListLongMap!6295)

(assert (=> b!430408 (= lt!196899 (getCurrentListMapNoExtraKeys!1406 lt!196886 lt!196889 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16115)

(assert (=> b!430408 (= lt!196891 (tuple2!7381 k0!794 v!412))))

(assert (=> b!430408 (= lt!196897 (getCurrentListMapNoExtraKeys!1406 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12669 0))(
  ( (Unit!12670) )
))
(declare-fun lt!196898 () Unit!12669)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!551 (array!26356 array!26354 (_ BitVec 32) (_ BitVec 32) V!16115 V!16115 (_ BitVec 32) (_ BitVec 64) V!16115 (_ BitVec 32) Int) Unit!12669)

(assert (=> b!430408 (= lt!196898 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!551 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!252935 () Bool)

(declare-fun e!254807 () Bool)

(assert (=> start!39824 (=> (not res!252935) (not e!254807))))

(assert (=> start!39824 (= res!252935 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12979 _keys!709))))))

(assert (=> start!39824 e!254807))

(declare-fun tp_is_empty!11257 () Bool)

(assert (=> start!39824 tp_is_empty!11257))

(assert (=> start!39824 tp!35844))

(assert (=> start!39824 true))

(declare-fun array_inv!9256 (array!26354) Bool)

(assert (=> start!39824 (and (array_inv!9256 _values!549) e!254804)))

(declare-fun array_inv!9257 (array!26356) Bool)

(assert (=> start!39824 (array_inv!9257 _keys!709)))

(declare-fun mapNonEmpty!18507 () Bool)

(declare-fun tp!35843 () Bool)

(declare-fun e!254805 () Bool)

(assert (=> mapNonEmpty!18507 (= mapRes!18507 (and tp!35843 e!254805))))

(declare-fun mapValue!18507 () ValueCell!5285)

(declare-fun mapRest!18507 () (Array (_ BitVec 32) ValueCell!5285))

(declare-fun mapKey!18507 () (_ BitVec 32))

(assert (=> mapNonEmpty!18507 (= (arr!12626 _values!549) (store mapRest!18507 mapKey!18507 mapValue!18507))))

(declare-fun b!430409 () Bool)

(declare-fun e!254800 () Bool)

(assert (=> b!430409 (= e!254800 e!254809)))

(declare-fun res!252929 () Bool)

(assert (=> b!430409 (=> (not res!252929) (not e!254809))))

(assert (=> b!430409 (= res!252929 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196896 () ListLongMap!6295)

(assert (=> b!430409 (= lt!196896 (getCurrentListMapNoExtraKeys!1406 lt!196886 lt!196889 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430409 (= lt!196889 (array!26355 (store (arr!12626 _values!549) i!563 (ValueCellFull!5285 v!412)) (size!12978 _values!549)))))

(declare-fun lt!196894 () ListLongMap!6295)

(assert (=> b!430409 (= lt!196894 (getCurrentListMapNoExtraKeys!1406 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430410 () Bool)

(assert (=> b!430410 (= e!254803 tp_is_empty!11257)))

(declare-fun b!430411 () Bool)

(declare-fun e!254806 () Unit!12669)

(declare-fun Unit!12671 () Unit!12669)

(assert (=> b!430411 (= e!254806 Unit!12671)))

(declare-fun b!430412 () Bool)

(declare-fun res!252932 () Bool)

(assert (=> b!430412 (=> (not res!252932) (not e!254807))))

(assert (=> b!430412 (= res!252932 (validKeyInArray!0 k0!794))))

(declare-fun b!430413 () Bool)

(declare-fun e!254808 () Bool)

(assert (=> b!430413 (= e!254808 true)))

(declare-fun lt!196887 () tuple2!7380)

(declare-fun lt!196893 () ListLongMap!6295)

(assert (=> b!430413 (= lt!196893 (+!1374 (+!1374 lt!196897 lt!196887) lt!196891))))

(declare-fun lt!196890 () V!16115)

(declare-fun lt!196888 () Unit!12669)

(declare-fun addCommutativeForDiffKeys!355 (ListLongMap!6295 (_ BitVec 64) V!16115 (_ BitVec 64) V!16115) Unit!12669)

(assert (=> b!430413 (= lt!196888 (addCommutativeForDiffKeys!355 lt!196897 k0!794 v!412 (select (arr!12627 _keys!709) from!863) lt!196890))))

(declare-fun b!430414 () Bool)

(declare-fun res!252937 () Bool)

(assert (=> b!430414 (=> (not res!252937) (not e!254800))))

(declare-datatypes ((List!7378 0))(
  ( (Nil!7375) (Cons!7374 (h!8230 (_ BitVec 64)) (t!12924 List!7378)) )
))
(declare-fun arrayNoDuplicates!0 (array!26356 (_ BitVec 32) List!7378) Bool)

(assert (=> b!430414 (= res!252937 (arrayNoDuplicates!0 lt!196886 #b00000000000000000000000000000000 Nil!7375))))

(declare-fun b!430415 () Bool)

(declare-fun res!252939 () Bool)

(assert (=> b!430415 (=> (not res!252939) (not e!254807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26356 (_ BitVec 32)) Bool)

(assert (=> b!430415 (= res!252939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430416 () Bool)

(declare-fun res!252933 () Bool)

(assert (=> b!430416 (=> (not res!252933) (not e!254807))))

(assert (=> b!430416 (= res!252933 (and (= (size!12978 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12979 _keys!709) (size!12978 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430417 () Bool)

(assert (=> b!430417 (= e!254807 e!254800)))

(declare-fun res!252940 () Bool)

(assert (=> b!430417 (=> (not res!252940) (not e!254800))))

(assert (=> b!430417 (= res!252940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196886 mask!1025))))

(assert (=> b!430417 (= lt!196886 (array!26357 (store (arr!12627 _keys!709) i!563 k0!794) (size!12979 _keys!709)))))

(declare-fun b!430418 () Bool)

(declare-fun res!252936 () Bool)

(assert (=> b!430418 (=> (not res!252936) (not e!254807))))

(assert (=> b!430418 (= res!252936 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7375))))

(declare-fun b!430419 () Bool)

(declare-fun res!252938 () Bool)

(assert (=> b!430419 (=> (not res!252938) (not e!254800))))

(assert (=> b!430419 (= res!252938 (bvsle from!863 i!563))))

(declare-fun b!430420 () Bool)

(declare-fun res!252934 () Bool)

(assert (=> b!430420 (=> (not res!252934) (not e!254807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430420 (= res!252934 (validMask!0 mask!1025))))

(declare-fun b!430421 () Bool)

(assert (=> b!430421 (= e!254802 e!254808)))

(declare-fun res!252931 () Bool)

(assert (=> b!430421 (=> res!252931 e!254808)))

(assert (=> b!430421 (= res!252931 (= k0!794 (select (arr!12627 _keys!709) from!863)))))

(assert (=> b!430421 (not (= (select (arr!12627 _keys!709) from!863) k0!794))))

(declare-fun lt!196892 () Unit!12669)

(assert (=> b!430421 (= lt!196892 e!254806)))

(declare-fun c!55470 () Bool)

(assert (=> b!430421 (= c!55470 (= (select (arr!12627 _keys!709) from!863) k0!794))))

(assert (=> b!430421 (= lt!196896 lt!196893)))

(assert (=> b!430421 (= lt!196893 (+!1374 lt!196885 lt!196887))))

(assert (=> b!430421 (= lt!196887 (tuple2!7381 (select (arr!12627 _keys!709) from!863) lt!196890))))

(declare-fun get!6276 (ValueCell!5285 V!16115) V!16115)

(declare-fun dynLambda!787 (Int (_ BitVec 64)) V!16115)

(assert (=> b!430421 (= lt!196890 (get!6276 (select (arr!12626 _values!549) from!863) (dynLambda!787 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18507 () Bool)

(assert (=> mapIsEmpty!18507 mapRes!18507))

(declare-fun b!430422 () Bool)

(declare-fun res!252928 () Bool)

(assert (=> b!430422 (=> (not res!252928) (not e!254807))))

(declare-fun arrayContainsKey!0 (array!26356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430422 (= res!252928 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430423 () Bool)

(assert (=> b!430423 (= e!254805 tp_is_empty!11257)))

(declare-fun b!430424 () Bool)

(declare-fun Unit!12672 () Unit!12669)

(assert (=> b!430424 (= e!254806 Unit!12672)))

(declare-fun lt!196895 () Unit!12669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12669)

(assert (=> b!430424 (= lt!196895 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430424 false))

(declare-fun b!430425 () Bool)

(declare-fun res!252941 () Bool)

(assert (=> b!430425 (=> (not res!252941) (not e!254807))))

(assert (=> b!430425 (= res!252941 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12979 _keys!709))))))

(declare-fun b!430426 () Bool)

(declare-fun res!252930 () Bool)

(assert (=> b!430426 (=> (not res!252930) (not e!254807))))

(assert (=> b!430426 (= res!252930 (or (= (select (arr!12627 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12627 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39824 res!252935) b!430420))

(assert (= (and b!430420 res!252934) b!430416))

(assert (= (and b!430416 res!252933) b!430415))

(assert (= (and b!430415 res!252939) b!430418))

(assert (= (and b!430418 res!252936) b!430425))

(assert (= (and b!430425 res!252941) b!430412))

(assert (= (and b!430412 res!252932) b!430426))

(assert (= (and b!430426 res!252930) b!430422))

(assert (= (and b!430422 res!252928) b!430417))

(assert (= (and b!430417 res!252940) b!430414))

(assert (= (and b!430414 res!252937) b!430419))

(assert (= (and b!430419 res!252938) b!430409))

(assert (= (and b!430409 res!252929) b!430408))

(assert (= (and b!430408 (not res!252942)) b!430421))

(assert (= (and b!430421 c!55470) b!430424))

(assert (= (and b!430421 (not c!55470)) b!430411))

(assert (= (and b!430421 (not res!252931)) b!430413))

(assert (= (and b!430407 condMapEmpty!18507) mapIsEmpty!18507))

(assert (= (and b!430407 (not condMapEmpty!18507)) mapNonEmpty!18507))

(get-info :version)

(assert (= (and mapNonEmpty!18507 ((_ is ValueCellFull!5285) mapValue!18507)) b!430423))

(assert (= (and b!430407 ((_ is ValueCellFull!5285) mapDefault!18507)) b!430410))

(assert (= start!39824 b!430407))

(declare-fun b_lambda!9215 () Bool)

(assert (=> (not b_lambda!9215) (not b!430421)))

(declare-fun t!12922 () Bool)

(declare-fun tb!3503 () Bool)

(assert (=> (and start!39824 (= defaultEntry!557 defaultEntry!557) t!12922) tb!3503))

(declare-fun result!6541 () Bool)

(assert (=> tb!3503 (= result!6541 tp_is_empty!11257)))

(assert (=> b!430421 t!12922))

(declare-fun b_and!17885 () Bool)

(assert (= b_and!17883 (and (=> t!12922 result!6541) b_and!17885)))

(declare-fun m!418883 () Bool)

(assert (=> b!430414 m!418883))

(declare-fun m!418885 () Bool)

(assert (=> start!39824 m!418885))

(declare-fun m!418887 () Bool)

(assert (=> start!39824 m!418887))

(declare-fun m!418889 () Bool)

(assert (=> b!430418 m!418889))

(declare-fun m!418891 () Bool)

(assert (=> b!430424 m!418891))

(declare-fun m!418893 () Bool)

(assert (=> b!430426 m!418893))

(declare-fun m!418895 () Bool)

(assert (=> b!430420 m!418895))

(declare-fun m!418897 () Bool)

(assert (=> b!430409 m!418897))

(declare-fun m!418899 () Bool)

(assert (=> b!430409 m!418899))

(declare-fun m!418901 () Bool)

(assert (=> b!430409 m!418901))

(declare-fun m!418903 () Bool)

(assert (=> b!430415 m!418903))

(declare-fun m!418905 () Bool)

(assert (=> b!430413 m!418905))

(assert (=> b!430413 m!418905))

(declare-fun m!418907 () Bool)

(assert (=> b!430413 m!418907))

(declare-fun m!418909 () Bool)

(assert (=> b!430413 m!418909))

(assert (=> b!430413 m!418909))

(declare-fun m!418911 () Bool)

(assert (=> b!430413 m!418911))

(declare-fun m!418913 () Bool)

(assert (=> mapNonEmpty!18507 m!418913))

(assert (=> b!430408 m!418909))

(declare-fun m!418915 () Bool)

(assert (=> b!430408 m!418915))

(declare-fun m!418917 () Bool)

(assert (=> b!430408 m!418917))

(declare-fun m!418919 () Bool)

(assert (=> b!430408 m!418919))

(assert (=> b!430408 m!418909))

(declare-fun m!418921 () Bool)

(assert (=> b!430408 m!418921))

(declare-fun m!418923 () Bool)

(assert (=> b!430408 m!418923))

(declare-fun m!418925 () Bool)

(assert (=> b!430417 m!418925))

(declare-fun m!418927 () Bool)

(assert (=> b!430417 m!418927))

(declare-fun m!418929 () Bool)

(assert (=> b!430412 m!418929))

(assert (=> b!430421 m!418909))

(declare-fun m!418931 () Bool)

(assert (=> b!430421 m!418931))

(declare-fun m!418933 () Bool)

(assert (=> b!430421 m!418933))

(declare-fun m!418935 () Bool)

(assert (=> b!430421 m!418935))

(assert (=> b!430421 m!418935))

(assert (=> b!430421 m!418933))

(declare-fun m!418937 () Bool)

(assert (=> b!430421 m!418937))

(declare-fun m!418939 () Bool)

(assert (=> b!430422 m!418939))

(check-sat (not b_next!10105) (not b!430418) (not b!430415) (not b!430412) (not b!430414) (not b!430424) (not b!430422) (not b!430408) (not b!430421) (not b!430420) (not b!430413) (not mapNonEmpty!18507) (not start!39824) (not b!430409) b_and!17885 (not b_lambda!9215) (not b!430417) tp_is_empty!11257)
(check-sat b_and!17885 (not b_next!10105))
