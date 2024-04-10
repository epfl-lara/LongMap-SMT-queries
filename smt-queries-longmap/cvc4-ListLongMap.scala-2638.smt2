; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39650 () Bool)

(assert start!39650)

(declare-fun b_free!9917 () Bool)

(declare-fun b_next!9917 () Bool)

(assert (=> start!39650 (= b_free!9917 (not b_next!9917))))

(declare-fun tp!35280 () Bool)

(declare-fun b_and!17573 () Bool)

(assert (=> start!39650 (= tp!35280 b_and!17573)))

(declare-fun b!425423 () Bool)

(declare-fun res!249081 () Bool)

(declare-fun e!252559 () Bool)

(assert (=> b!425423 (=> (not res!249081) (not e!252559))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425423 (= res!249081 (bvsle from!863 i!563))))

(declare-fun b!425424 () Bool)

(declare-fun res!249073 () Bool)

(declare-fun e!252555 () Bool)

(assert (=> b!425424 (=> (not res!249073) (not e!252555))))

(declare-datatypes ((array!25977 0))(
  ( (array!25978 (arr!12438 (Array (_ BitVec 32) (_ BitVec 64))) (size!12790 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25977)

(assert (=> b!425424 (= res!249073 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12790 _keys!709))))))

(declare-fun b!425425 () Bool)

(declare-fun res!249084 () Bool)

(assert (=> b!425425 (=> (not res!249084) (not e!252555))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425425 (= res!249084 (validMask!0 mask!1025))))

(declare-fun b!425426 () Bool)

(declare-fun res!249080 () Bool)

(assert (=> b!425426 (=> (not res!249080) (not e!252555))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15863 0))(
  ( (V!15864 (val!5579 Int)) )
))
(declare-datatypes ((ValueCell!5191 0))(
  ( (ValueCellFull!5191 (v!7826 V!15863)) (EmptyCell!5191) )
))
(declare-datatypes ((array!25979 0))(
  ( (array!25980 (arr!12439 (Array (_ BitVec 32) ValueCell!5191)) (size!12791 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25979)

(assert (=> b!425426 (= res!249080 (and (= (size!12791 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12790 _keys!709) (size!12791 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!249075 () Bool)

(assert (=> start!39650 (=> (not res!249075) (not e!252555))))

(assert (=> start!39650 (= res!249075 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12790 _keys!709))))))

(assert (=> start!39650 e!252555))

(declare-fun tp_is_empty!11069 () Bool)

(assert (=> start!39650 tp_is_empty!11069))

(assert (=> start!39650 tp!35280))

(assert (=> start!39650 true))

(declare-fun e!252560 () Bool)

(declare-fun array_inv!9064 (array!25979) Bool)

(assert (=> start!39650 (and (array_inv!9064 _values!549) e!252560)))

(declare-fun array_inv!9065 (array!25977) Bool)

(assert (=> start!39650 (array_inv!9065 _keys!709)))

(declare-fun b!425427 () Bool)

(declare-fun res!249077 () Bool)

(assert (=> b!425427 (=> (not res!249077) (not e!252555))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425427 (= res!249077 (validKeyInArray!0 k!794))))

(declare-fun b!425428 () Bool)

(assert (=> b!425428 (= e!252555 e!252559)))

(declare-fun res!249074 () Bool)

(assert (=> b!425428 (=> (not res!249074) (not e!252559))))

(declare-fun lt!194648 () array!25977)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25977 (_ BitVec 32)) Bool)

(assert (=> b!425428 (= res!249074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194648 mask!1025))))

(assert (=> b!425428 (= lt!194648 (array!25978 (store (arr!12438 _keys!709) i!563 k!794) (size!12790 _keys!709)))))

(declare-fun mapIsEmpty!18225 () Bool)

(declare-fun mapRes!18225 () Bool)

(assert (=> mapIsEmpty!18225 mapRes!18225))

(declare-fun b!425429 () Bool)

(declare-fun res!249082 () Bool)

(assert (=> b!425429 (=> (not res!249082) (not e!252555))))

(assert (=> b!425429 (= res!249082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18225 () Bool)

(declare-fun tp!35279 () Bool)

(declare-fun e!252557 () Bool)

(assert (=> mapNonEmpty!18225 (= mapRes!18225 (and tp!35279 e!252557))))

(declare-fun mapValue!18225 () ValueCell!5191)

(declare-fun mapRest!18225 () (Array (_ BitVec 32) ValueCell!5191))

(declare-fun mapKey!18225 () (_ BitVec 32))

(assert (=> mapNonEmpty!18225 (= (arr!12439 _values!549) (store mapRest!18225 mapKey!18225 mapValue!18225))))

(declare-fun b!425430 () Bool)

(declare-fun res!249076 () Bool)

(assert (=> b!425430 (=> (not res!249076) (not e!252555))))

(declare-datatypes ((List!7338 0))(
  ( (Nil!7335) (Cons!7334 (h!8190 (_ BitVec 64)) (t!12782 List!7338)) )
))
(declare-fun arrayNoDuplicates!0 (array!25977 (_ BitVec 32) List!7338) Bool)

(assert (=> b!425430 (= res!249076 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7335))))

(declare-fun b!425431 () Bool)

(declare-fun res!249079 () Bool)

(assert (=> b!425431 (=> (not res!249079) (not e!252559))))

(assert (=> b!425431 (= res!249079 (arrayNoDuplicates!0 lt!194648 #b00000000000000000000000000000000 Nil!7335))))

(declare-fun b!425432 () Bool)

(assert (=> b!425432 (= e!252557 tp_is_empty!11069)))

(declare-fun b!425433 () Bool)

(declare-fun e!252561 () Bool)

(assert (=> b!425433 (= e!252559 e!252561)))

(declare-fun res!249078 () Bool)

(assert (=> b!425433 (=> (not res!249078) (not e!252561))))

(assert (=> b!425433 (= res!249078 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15863)

(declare-fun lt!194646 () array!25979)

(declare-datatypes ((tuple2!7326 0))(
  ( (tuple2!7327 (_1!3674 (_ BitVec 64)) (_2!3674 V!15863)) )
))
(declare-datatypes ((List!7339 0))(
  ( (Nil!7336) (Cons!7335 (h!8191 tuple2!7326) (t!12783 List!7339)) )
))
(declare-datatypes ((ListLongMap!6239 0))(
  ( (ListLongMap!6240 (toList!3135 List!7339)) )
))
(declare-fun lt!194645 () ListLongMap!6239)

(declare-fun minValue!515 () V!15863)

(declare-fun getCurrentListMapNoExtraKeys!1339 (array!25977 array!25979 (_ BitVec 32) (_ BitVec 32) V!15863 V!15863 (_ BitVec 32) Int) ListLongMap!6239)

(assert (=> b!425433 (= lt!194645 (getCurrentListMapNoExtraKeys!1339 lt!194648 lt!194646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15863)

(assert (=> b!425433 (= lt!194646 (array!25980 (store (arr!12439 _values!549) i!563 (ValueCellFull!5191 v!412)) (size!12791 _values!549)))))

(declare-fun lt!194644 () ListLongMap!6239)

(assert (=> b!425433 (= lt!194644 (getCurrentListMapNoExtraKeys!1339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425434 () Bool)

(declare-fun res!249083 () Bool)

(assert (=> b!425434 (=> (not res!249083) (not e!252555))))

(declare-fun arrayContainsKey!0 (array!25977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425434 (= res!249083 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425435 () Bool)

(declare-fun e!252556 () Bool)

(assert (=> b!425435 (= e!252556 tp_is_empty!11069)))

(declare-fun b!425436 () Bool)

(assert (=> b!425436 (= e!252561 (not true))))

(declare-fun +!1293 (ListLongMap!6239 tuple2!7326) ListLongMap!6239)

(assert (=> b!425436 (= (getCurrentListMapNoExtraKeys!1339 lt!194648 lt!194646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1293 (getCurrentListMapNoExtraKeys!1339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7327 k!794 v!412)))))

(declare-datatypes ((Unit!12488 0))(
  ( (Unit!12489) )
))
(declare-fun lt!194647 () Unit!12488)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!488 (array!25977 array!25979 (_ BitVec 32) (_ BitVec 32) V!15863 V!15863 (_ BitVec 32) (_ BitVec 64) V!15863 (_ BitVec 32) Int) Unit!12488)

(assert (=> b!425436 (= lt!194647 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!488 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425437 () Bool)

(assert (=> b!425437 (= e!252560 (and e!252556 mapRes!18225))))

(declare-fun condMapEmpty!18225 () Bool)

(declare-fun mapDefault!18225 () ValueCell!5191)

