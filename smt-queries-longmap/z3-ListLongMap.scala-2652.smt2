; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39732 () Bool)

(assert start!39732)

(declare-fun b_free!9999 () Bool)

(declare-fun b_next!9999 () Bool)

(assert (=> start!39732 (= b_free!9999 (not b_next!9999))))

(declare-fun tp!35526 () Bool)

(declare-fun b_and!17657 () Bool)

(assert (=> start!39732 (= tp!35526 b_and!17657)))

(declare-fun b!427407 () Bool)

(declare-fun res!250697 () Bool)

(declare-fun e!253431 () Bool)

(assert (=> b!427407 (=> (not res!250697) (not e!253431))))

(declare-datatypes ((array!26139 0))(
  ( (array!26140 (arr!12519 (Array (_ BitVec 32) (_ BitVec 64))) (size!12871 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26139)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427407 (= res!250697 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427408 () Bool)

(declare-fun res!250692 () Bool)

(assert (=> b!427408 (=> (not res!250692) (not e!253431))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427408 (= res!250692 (or (= (select (arr!12519 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12519 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427409 () Bool)

(declare-fun e!253434 () Bool)

(declare-fun e!253432 () Bool)

(declare-fun mapRes!18348 () Bool)

(assert (=> b!427409 (= e!253434 (and e!253432 mapRes!18348))))

(declare-fun condMapEmpty!18348 () Bool)

(declare-datatypes ((V!15973 0))(
  ( (V!15974 (val!5620 Int)) )
))
(declare-datatypes ((ValueCell!5232 0))(
  ( (ValueCellFull!5232 (v!7867 V!15973)) (EmptyCell!5232) )
))
(declare-datatypes ((array!26141 0))(
  ( (array!26142 (arr!12520 (Array (_ BitVec 32) ValueCell!5232)) (size!12872 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26141)

(declare-fun mapDefault!18348 () ValueCell!5232)

(assert (=> b!427409 (= condMapEmpty!18348 (= (arr!12520 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5232)) mapDefault!18348)))))

(declare-fun b!427410 () Bool)

(declare-fun res!250685 () Bool)

(assert (=> b!427410 (=> (not res!250685) (not e!253431))))

(declare-datatypes ((List!7401 0))(
  ( (Nil!7398) (Cons!7397 (h!8253 (_ BitVec 64)) (t!12849 List!7401)) )
))
(declare-fun arrayNoDuplicates!0 (array!26139 (_ BitVec 32) List!7401) Bool)

(assert (=> b!427410 (= res!250685 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7398))))

(declare-fun b!427411 () Bool)

(declare-fun res!250693 () Bool)

(assert (=> b!427411 (=> (not res!250693) (not e!253431))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26139 (_ BitVec 32)) Bool)

(assert (=> b!427411 (= res!250693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427412 () Bool)

(declare-fun res!250698 () Bool)

(declare-fun e!253435 () Bool)

(assert (=> b!427412 (=> (not res!250698) (not e!253435))))

(declare-fun lt!195277 () array!26139)

(assert (=> b!427412 (= res!250698 (arrayNoDuplicates!0 lt!195277 #b00000000000000000000000000000000 Nil!7398))))

(declare-fun res!250686 () Bool)

(assert (=> start!39732 (=> (not res!250686) (not e!253431))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39732 (= res!250686 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12871 _keys!709))))))

(assert (=> start!39732 e!253431))

(declare-fun tp_is_empty!11151 () Bool)

(assert (=> start!39732 tp_is_empty!11151))

(assert (=> start!39732 tp!35526))

(assert (=> start!39732 true))

(declare-fun array_inv!9124 (array!26141) Bool)

(assert (=> start!39732 (and (array_inv!9124 _values!549) e!253434)))

(declare-fun array_inv!9125 (array!26139) Bool)

(assert (=> start!39732 (array_inv!9125 _keys!709)))

(declare-fun mapNonEmpty!18348 () Bool)

(declare-fun tp!35525 () Bool)

(declare-fun e!253437 () Bool)

(assert (=> mapNonEmpty!18348 (= mapRes!18348 (and tp!35525 e!253437))))

(declare-fun mapKey!18348 () (_ BitVec 32))

(declare-fun mapValue!18348 () ValueCell!5232)

(declare-fun mapRest!18348 () (Array (_ BitVec 32) ValueCell!5232))

(assert (=> mapNonEmpty!18348 (= (arr!12520 _values!549) (store mapRest!18348 mapKey!18348 mapValue!18348))))

(declare-fun b!427413 () Bool)

(declare-fun res!250691 () Bool)

(assert (=> b!427413 (=> (not res!250691) (not e!253431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427413 (= res!250691 (validKeyInArray!0 k0!794))))

(declare-fun b!427414 () Bool)

(assert (=> b!427414 (= e!253431 e!253435)))

(declare-fun res!250694 () Bool)

(assert (=> b!427414 (=> (not res!250694) (not e!253435))))

(assert (=> b!427414 (= res!250694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195277 mask!1025))))

(assert (=> b!427414 (= lt!195277 (array!26140 (store (arr!12519 _keys!709) i!563 k0!794) (size!12871 _keys!709)))))

(declare-fun b!427415 () Bool)

(declare-fun res!250695 () Bool)

(assert (=> b!427415 (=> (not res!250695) (not e!253431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427415 (= res!250695 (validMask!0 mask!1025))))

(declare-fun b!427416 () Bool)

(declare-fun res!250687 () Bool)

(assert (=> b!427416 (=> (not res!250687) (not e!253435))))

(assert (=> b!427416 (= res!250687 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18348 () Bool)

(assert (=> mapIsEmpty!18348 mapRes!18348))

(declare-fun b!427417 () Bool)

(declare-fun e!253433 () Bool)

(assert (=> b!427417 (= e!253435 e!253433)))

(declare-fun res!250689 () Bool)

(assert (=> b!427417 (=> (not res!250689) (not e!253433))))

(assert (=> b!427417 (= res!250689 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15973)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15973)

(declare-datatypes ((tuple2!7386 0))(
  ( (tuple2!7387 (_1!3704 (_ BitVec 64)) (_2!3704 V!15973)) )
))
(declare-datatypes ((List!7402 0))(
  ( (Nil!7399) (Cons!7398 (h!8254 tuple2!7386) (t!12850 List!7402)) )
))
(declare-datatypes ((ListLongMap!6299 0))(
  ( (ListLongMap!6300 (toList!3165 List!7402)) )
))
(declare-fun lt!195281 () ListLongMap!6299)

(declare-fun lt!195279 () array!26141)

(declare-fun getCurrentListMapNoExtraKeys!1369 (array!26139 array!26141 (_ BitVec 32) (_ BitVec 32) V!15973 V!15973 (_ BitVec 32) Int) ListLongMap!6299)

(assert (=> b!427417 (= lt!195281 (getCurrentListMapNoExtraKeys!1369 lt!195277 lt!195279 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15973)

(assert (=> b!427417 (= lt!195279 (array!26142 (store (arr!12520 _values!549) i!563 (ValueCellFull!5232 v!412)) (size!12872 _values!549)))))

(declare-fun lt!195276 () ListLongMap!6299)

(assert (=> b!427417 (= lt!195276 (getCurrentListMapNoExtraKeys!1369 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427418 () Bool)

(assert (=> b!427418 (= e!253437 tp_is_empty!11151)))

(declare-fun b!427419 () Bool)

(declare-fun e!253436 () Bool)

(assert (=> b!427419 (= e!253433 (not e!253436))))

(declare-fun res!250690 () Bool)

(assert (=> b!427419 (=> res!250690 e!253436)))

(assert (=> b!427419 (= res!250690 (not (validKeyInArray!0 (select (arr!12519 _keys!709) from!863))))))

(declare-fun lt!195280 () ListLongMap!6299)

(declare-fun lt!195274 () ListLongMap!6299)

(assert (=> b!427419 (= lt!195280 lt!195274)))

(declare-fun lt!195275 () ListLongMap!6299)

(declare-fun +!1320 (ListLongMap!6299 tuple2!7386) ListLongMap!6299)

(assert (=> b!427419 (= lt!195274 (+!1320 lt!195275 (tuple2!7387 k0!794 v!412)))))

(assert (=> b!427419 (= lt!195280 (getCurrentListMapNoExtraKeys!1369 lt!195277 lt!195279 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427419 (= lt!195275 (getCurrentListMapNoExtraKeys!1369 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12542 0))(
  ( (Unit!12543) )
))
(declare-fun lt!195278 () Unit!12542)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!515 (array!26139 array!26141 (_ BitVec 32) (_ BitVec 32) V!15973 V!15973 (_ BitVec 32) (_ BitVec 64) V!15973 (_ BitVec 32) Int) Unit!12542)

(assert (=> b!427419 (= lt!195278 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!515 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427420 () Bool)

(assert (=> b!427420 (= e!253432 tp_is_empty!11151)))

(declare-fun b!427421 () Bool)

(declare-fun res!250696 () Bool)

(assert (=> b!427421 (=> (not res!250696) (not e!253431))))

(assert (=> b!427421 (= res!250696 (and (= (size!12872 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12871 _keys!709) (size!12872 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427422 () Bool)

(assert (=> b!427422 (= e!253436 true)))

(declare-fun get!6196 (ValueCell!5232 V!15973) V!15973)

(declare-fun dynLambda!749 (Int (_ BitVec 64)) V!15973)

(assert (=> b!427422 (= lt!195281 (+!1320 lt!195274 (tuple2!7387 (select (arr!12519 _keys!709) from!863) (get!6196 (select (arr!12520 _values!549) from!863) (dynLambda!749 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427423 () Bool)

(declare-fun res!250688 () Bool)

(assert (=> b!427423 (=> (not res!250688) (not e!253431))))

(assert (=> b!427423 (= res!250688 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12871 _keys!709))))))

(assert (= (and start!39732 res!250686) b!427415))

(assert (= (and b!427415 res!250695) b!427421))

(assert (= (and b!427421 res!250696) b!427411))

(assert (= (and b!427411 res!250693) b!427410))

(assert (= (and b!427410 res!250685) b!427423))

(assert (= (and b!427423 res!250688) b!427413))

(assert (= (and b!427413 res!250691) b!427408))

(assert (= (and b!427408 res!250692) b!427407))

(assert (= (and b!427407 res!250697) b!427414))

(assert (= (and b!427414 res!250694) b!427412))

(assert (= (and b!427412 res!250698) b!427416))

(assert (= (and b!427416 res!250687) b!427417))

(assert (= (and b!427417 res!250689) b!427419))

(assert (= (and b!427419 (not res!250690)) b!427422))

(assert (= (and b!427409 condMapEmpty!18348) mapIsEmpty!18348))

(assert (= (and b!427409 (not condMapEmpty!18348)) mapNonEmpty!18348))

(get-info :version)

(assert (= (and mapNonEmpty!18348 ((_ is ValueCellFull!5232) mapValue!18348)) b!427418))

(assert (= (and b!427409 ((_ is ValueCellFull!5232) mapDefault!18348)) b!427420))

(assert (= start!39732 b!427409))

(declare-fun b_lambda!9087 () Bool)

(assert (=> (not b_lambda!9087) (not b!427422)))

(declare-fun t!12848 () Bool)

(declare-fun tb!3405 () Bool)

(assert (=> (and start!39732 (= defaultEntry!557 defaultEntry!557) t!12848) tb!3405))

(declare-fun result!6337 () Bool)

(assert (=> tb!3405 (= result!6337 tp_is_empty!11151)))

(assert (=> b!427422 t!12848))

(declare-fun b_and!17659 () Bool)

(assert (= b_and!17657 (and (=> t!12848 result!6337) b_and!17659)))

(declare-fun m!415907 () Bool)

(assert (=> b!427412 m!415907))

(declare-fun m!415909 () Bool)

(assert (=> b!427407 m!415909))

(declare-fun m!415911 () Bool)

(assert (=> b!427410 m!415911))

(declare-fun m!415913 () Bool)

(assert (=> b!427414 m!415913))

(declare-fun m!415915 () Bool)

(assert (=> b!427414 m!415915))

(declare-fun m!415917 () Bool)

(assert (=> mapNonEmpty!18348 m!415917))

(declare-fun m!415919 () Bool)

(assert (=> b!427413 m!415919))

(declare-fun m!415921 () Bool)

(assert (=> b!427422 m!415921))

(declare-fun m!415923 () Bool)

(assert (=> b!427422 m!415923))

(declare-fun m!415925 () Bool)

(assert (=> b!427422 m!415925))

(declare-fun m!415927 () Bool)

(assert (=> b!427422 m!415927))

(assert (=> b!427422 m!415925))

(assert (=> b!427422 m!415923))

(declare-fun m!415929 () Bool)

(assert (=> b!427422 m!415929))

(declare-fun m!415931 () Bool)

(assert (=> b!427415 m!415931))

(declare-fun m!415933 () Bool)

(assert (=> start!39732 m!415933))

(declare-fun m!415935 () Bool)

(assert (=> start!39732 m!415935))

(declare-fun m!415937 () Bool)

(assert (=> b!427408 m!415937))

(declare-fun m!415939 () Bool)

(assert (=> b!427411 m!415939))

(declare-fun m!415941 () Bool)

(assert (=> b!427417 m!415941))

(declare-fun m!415943 () Bool)

(assert (=> b!427417 m!415943))

(declare-fun m!415945 () Bool)

(assert (=> b!427417 m!415945))

(assert (=> b!427419 m!415921))

(declare-fun m!415947 () Bool)

(assert (=> b!427419 m!415947))

(declare-fun m!415949 () Bool)

(assert (=> b!427419 m!415949))

(assert (=> b!427419 m!415921))

(declare-fun m!415951 () Bool)

(assert (=> b!427419 m!415951))

(declare-fun m!415953 () Bool)

(assert (=> b!427419 m!415953))

(declare-fun m!415955 () Bool)

(assert (=> b!427419 m!415955))

(check-sat (not b!427413) (not b!427411) (not b_lambda!9087) b_and!17659 (not b!427410) (not b!427414) (not b!427417) tp_is_empty!11151 (not b!427415) (not b!427407) (not b!427412) (not b!427419) (not b!427422) (not mapNonEmpty!18348) (not b_next!9999) (not start!39732))
(check-sat b_and!17659 (not b_next!9999))
