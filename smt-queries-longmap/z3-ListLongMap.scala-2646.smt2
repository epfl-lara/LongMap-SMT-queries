; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39680 () Bool)

(assert start!39680)

(declare-fun b_free!9961 () Bool)

(declare-fun b_next!9961 () Bool)

(assert (=> start!39680 (= b_free!9961 (not b_next!9961))))

(declare-fun tp!35411 () Bool)

(declare-fun b_and!17631 () Bool)

(assert (=> start!39680 (= tp!35411 b_and!17631)))

(declare-fun mapIsEmpty!18291 () Bool)

(declare-fun mapRes!18291 () Bool)

(assert (=> mapIsEmpty!18291 mapRes!18291))

(declare-fun b!426430 () Bool)

(declare-fun e!252988 () Bool)

(declare-fun tp_is_empty!11113 () Bool)

(assert (=> b!426430 (= e!252988 tp_is_empty!11113)))

(declare-fun res!249932 () Bool)

(declare-fun e!252985 () Bool)

(assert (=> start!39680 (=> (not res!249932) (not e!252985))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26072 0))(
  ( (array!26073 (arr!12485 (Array (_ BitVec 32) (_ BitVec 64))) (size!12837 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26072)

(assert (=> start!39680 (= res!249932 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12837 _keys!709))))))

(assert (=> start!39680 e!252985))

(assert (=> start!39680 tp_is_empty!11113))

(assert (=> start!39680 tp!35411))

(assert (=> start!39680 true))

(declare-datatypes ((V!15923 0))(
  ( (V!15924 (val!5601 Int)) )
))
(declare-datatypes ((ValueCell!5213 0))(
  ( (ValueCellFull!5213 (v!7849 V!15923)) (EmptyCell!5213) )
))
(declare-datatypes ((array!26074 0))(
  ( (array!26075 (arr!12486 (Array (_ BitVec 32) ValueCell!5213)) (size!12838 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26074)

(declare-fun e!252987 () Bool)

(declare-fun array_inv!9168 (array!26074) Bool)

(assert (=> start!39680 (and (array_inv!9168 _values!549) e!252987)))

(declare-fun array_inv!9169 (array!26072) Bool)

(assert (=> start!39680 (array_inv!9169 _keys!709)))

(declare-fun b!426431 () Bool)

(declare-fun e!252990 () Bool)

(declare-fun e!252989 () Bool)

(assert (=> b!426431 (= e!252990 e!252989)))

(declare-fun res!249931 () Bool)

(assert (=> b!426431 (=> (not res!249931) (not e!252989))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426431 (= res!249931 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15923)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7258 0))(
  ( (tuple2!7259 (_1!3640 (_ BitVec 64)) (_2!3640 V!15923)) )
))
(declare-datatypes ((List!7264 0))(
  ( (Nil!7261) (Cons!7260 (h!8116 tuple2!7258) (t!12700 List!7264)) )
))
(declare-datatypes ((ListLongMap!6173 0))(
  ( (ListLongMap!6174 (toList!3102 List!7264)) )
))
(declare-fun lt!194995 () ListLongMap!6173)

(declare-fun zeroValue!515 () V!15923)

(declare-fun lt!194996 () array!26072)

(declare-fun lt!194994 () array!26074)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1348 (array!26072 array!26074 (_ BitVec 32) (_ BitVec 32) V!15923 V!15923 (_ BitVec 32) Int) ListLongMap!6173)

(assert (=> b!426431 (= lt!194995 (getCurrentListMapNoExtraKeys!1348 lt!194996 lt!194994 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15923)

(assert (=> b!426431 (= lt!194994 (array!26075 (store (arr!12486 _values!549) i!563 (ValueCellFull!5213 v!412)) (size!12838 _values!549)))))

(declare-fun lt!194993 () ListLongMap!6173)

(assert (=> b!426431 (= lt!194993 (getCurrentListMapNoExtraKeys!1348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426432 () Bool)

(declare-fun res!249936 () Bool)

(assert (=> b!426432 (=> (not res!249936) (not e!252990))))

(assert (=> b!426432 (= res!249936 (bvsle from!863 i!563))))

(declare-fun b!426433 () Bool)

(declare-fun res!249939 () Bool)

(assert (=> b!426433 (=> (not res!249939) (not e!252985))))

(assert (=> b!426433 (= res!249939 (or (= (select (arr!12485 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12485 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426434 () Bool)

(declare-fun e!252991 () Bool)

(assert (=> b!426434 (= e!252991 tp_is_empty!11113)))

(declare-fun b!426435 () Bool)

(declare-fun res!249934 () Bool)

(assert (=> b!426435 (=> (not res!249934) (not e!252985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26072 (_ BitVec 32)) Bool)

(assert (=> b!426435 (= res!249934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426436 () Bool)

(assert (=> b!426436 (= e!252985 e!252990)))

(declare-fun res!249933 () Bool)

(assert (=> b!426436 (=> (not res!249933) (not e!252990))))

(assert (=> b!426436 (= res!249933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194996 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!426436 (= lt!194996 (array!26073 (store (arr!12485 _keys!709) i!563 k0!794) (size!12837 _keys!709)))))

(declare-fun b!426437 () Bool)

(declare-fun res!249929 () Bool)

(assert (=> b!426437 (=> (not res!249929) (not e!252985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426437 (= res!249929 (validMask!0 mask!1025))))

(declare-fun b!426438 () Bool)

(declare-fun res!249927 () Bool)

(assert (=> b!426438 (=> (not res!249927) (not e!252985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426438 (= res!249927 (validKeyInArray!0 k0!794))))

(declare-fun b!426439 () Bool)

(assert (=> b!426439 (= e!252989 (not true))))

(declare-fun +!1315 (ListLongMap!6173 tuple2!7258) ListLongMap!6173)

(assert (=> b!426439 (= (getCurrentListMapNoExtraKeys!1348 lt!194996 lt!194994 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1315 (getCurrentListMapNoExtraKeys!1348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7259 k0!794 v!412)))))

(declare-datatypes ((Unit!12505 0))(
  ( (Unit!12506) )
))
(declare-fun lt!194997 () Unit!12505)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!499 (array!26072 array!26074 (_ BitVec 32) (_ BitVec 32) V!15923 V!15923 (_ BitVec 32) (_ BitVec 64) V!15923 (_ BitVec 32) Int) Unit!12505)

(assert (=> b!426439 (= lt!194997 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426440 () Bool)

(declare-fun res!249937 () Bool)

(assert (=> b!426440 (=> (not res!249937) (not e!252985))))

(assert (=> b!426440 (= res!249937 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12837 _keys!709))))))

(declare-fun b!426441 () Bool)

(assert (=> b!426441 (= e!252987 (and e!252988 mapRes!18291))))

(declare-fun condMapEmpty!18291 () Bool)

(declare-fun mapDefault!18291 () ValueCell!5213)

(assert (=> b!426441 (= condMapEmpty!18291 (= (arr!12486 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5213)) mapDefault!18291)))))

(declare-fun b!426442 () Bool)

(declare-fun res!249935 () Bool)

(assert (=> b!426442 (=> (not res!249935) (not e!252985))))

(declare-datatypes ((List!7265 0))(
  ( (Nil!7262) (Cons!7261 (h!8117 (_ BitVec 64)) (t!12701 List!7265)) )
))
(declare-fun arrayNoDuplicates!0 (array!26072 (_ BitVec 32) List!7265) Bool)

(assert (=> b!426442 (= res!249935 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7262))))

(declare-fun b!426443 () Bool)

(declare-fun res!249930 () Bool)

(assert (=> b!426443 (=> (not res!249930) (not e!252990))))

(assert (=> b!426443 (= res!249930 (arrayNoDuplicates!0 lt!194996 #b00000000000000000000000000000000 Nil!7262))))

(declare-fun b!426444 () Bool)

(declare-fun res!249938 () Bool)

(assert (=> b!426444 (=> (not res!249938) (not e!252985))))

(declare-fun arrayContainsKey!0 (array!26072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426444 (= res!249938 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426445 () Bool)

(declare-fun res!249928 () Bool)

(assert (=> b!426445 (=> (not res!249928) (not e!252985))))

(assert (=> b!426445 (= res!249928 (and (= (size!12838 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12837 _keys!709) (size!12838 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18291 () Bool)

(declare-fun tp!35412 () Bool)

(assert (=> mapNonEmpty!18291 (= mapRes!18291 (and tp!35412 e!252991))))

(declare-fun mapKey!18291 () (_ BitVec 32))

(declare-fun mapValue!18291 () ValueCell!5213)

(declare-fun mapRest!18291 () (Array (_ BitVec 32) ValueCell!5213))

(assert (=> mapNonEmpty!18291 (= (arr!12486 _values!549) (store mapRest!18291 mapKey!18291 mapValue!18291))))

(assert (= (and start!39680 res!249932) b!426437))

(assert (= (and b!426437 res!249929) b!426445))

(assert (= (and b!426445 res!249928) b!426435))

(assert (= (and b!426435 res!249934) b!426442))

(assert (= (and b!426442 res!249935) b!426440))

(assert (= (and b!426440 res!249937) b!426438))

(assert (= (and b!426438 res!249927) b!426433))

(assert (= (and b!426433 res!249939) b!426444))

(assert (= (and b!426444 res!249938) b!426436))

(assert (= (and b!426436 res!249933) b!426443))

(assert (= (and b!426443 res!249930) b!426432))

(assert (= (and b!426432 res!249936) b!426431))

(assert (= (and b!426431 res!249931) b!426439))

(assert (= (and b!426441 condMapEmpty!18291) mapIsEmpty!18291))

(assert (= (and b!426441 (not condMapEmpty!18291)) mapNonEmpty!18291))

(get-info :version)

(assert (= (and mapNonEmpty!18291 ((_ is ValueCellFull!5213) mapValue!18291)) b!426434))

(assert (= (and b!426441 ((_ is ValueCellFull!5213) mapDefault!18291)) b!426430))

(assert (= start!39680 b!426441))

(declare-fun m!415379 () Bool)

(assert (=> b!426439 m!415379))

(declare-fun m!415381 () Bool)

(assert (=> b!426439 m!415381))

(assert (=> b!426439 m!415381))

(declare-fun m!415383 () Bool)

(assert (=> b!426439 m!415383))

(declare-fun m!415385 () Bool)

(assert (=> b!426439 m!415385))

(declare-fun m!415387 () Bool)

(assert (=> mapNonEmpty!18291 m!415387))

(declare-fun m!415389 () Bool)

(assert (=> b!426444 m!415389))

(declare-fun m!415391 () Bool)

(assert (=> b!426442 m!415391))

(declare-fun m!415393 () Bool)

(assert (=> b!426438 m!415393))

(declare-fun m!415395 () Bool)

(assert (=> start!39680 m!415395))

(declare-fun m!415397 () Bool)

(assert (=> start!39680 m!415397))

(declare-fun m!415399 () Bool)

(assert (=> b!426435 m!415399))

(declare-fun m!415401 () Bool)

(assert (=> b!426436 m!415401))

(declare-fun m!415403 () Bool)

(assert (=> b!426436 m!415403))

(declare-fun m!415405 () Bool)

(assert (=> b!426431 m!415405))

(declare-fun m!415407 () Bool)

(assert (=> b!426431 m!415407))

(declare-fun m!415409 () Bool)

(assert (=> b!426431 m!415409))

(declare-fun m!415411 () Bool)

(assert (=> b!426433 m!415411))

(declare-fun m!415413 () Bool)

(assert (=> b!426443 m!415413))

(declare-fun m!415415 () Bool)

(assert (=> b!426437 m!415415))

(check-sat (not b_next!9961) (not b!426438) (not b!426442) (not b!426436) (not start!39680) (not b!426439) (not b!426435) tp_is_empty!11113 (not b!426444) (not mapNonEmpty!18291) (not b!426437) (not b!426443) b_and!17631 (not b!426431))
(check-sat b_and!17631 (not b_next!9961))
