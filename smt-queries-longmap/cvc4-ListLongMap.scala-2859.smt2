; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41188 () Bool)

(assert start!41188)

(declare-fun b_free!11057 () Bool)

(declare-fun b_next!11057 () Bool)

(assert (=> start!41188 (= b_free!11057 (not b_next!11057))))

(declare-fun tp!39006 () Bool)

(declare-fun b_and!19353 () Bool)

(assert (=> start!41188 (= tp!39006 b_and!19353)))

(declare-fun b!460557 () Bool)

(declare-datatypes ((Unit!13408 0))(
  ( (Unit!13409) )
))
(declare-fun e!268682 () Unit!13408)

(declare-fun Unit!13410 () Unit!13408)

(assert (=> b!460557 (= e!268682 Unit!13410)))

(declare-fun b!460558 () Bool)

(declare-fun e!268686 () Bool)

(assert (=> b!460558 (= e!268686 true)))

(declare-datatypes ((V!17631 0))(
  ( (V!17632 (val!6242 Int)) )
))
(declare-datatypes ((tuple2!8234 0))(
  ( (tuple2!8235 (_1!4128 (_ BitVec 64)) (_2!4128 V!17631)) )
))
(declare-fun lt!208601 () tuple2!8234)

(declare-fun lt!208590 () tuple2!8234)

(declare-datatypes ((List!8305 0))(
  ( (Nil!8302) (Cons!8301 (h!9157 tuple2!8234) (t!14241 List!8305)) )
))
(declare-datatypes ((ListLongMap!7147 0))(
  ( (ListLongMap!7148 (toList!3589 List!8305)) )
))
(declare-fun lt!208593 () ListLongMap!7147)

(declare-fun lt!208587 () ListLongMap!7147)

(declare-fun +!1625 (ListLongMap!7147 tuple2!8234) ListLongMap!7147)

(assert (=> b!460558 (= lt!208587 (+!1625 (+!1625 lt!208593 lt!208601) lt!208590))))

(declare-fun lt!208597 () Unit!13408)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17631)

(declare-fun lt!208596 () V!17631)

(declare-datatypes ((array!28589 0))(
  ( (array!28590 (arr!13735 (Array (_ BitVec 32) (_ BitVec 64))) (size!14087 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28589)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!433 (ListLongMap!7147 (_ BitVec 64) V!17631 (_ BitVec 64) V!17631) Unit!13408)

(assert (=> b!460558 (= lt!208597 (addCommutativeForDiffKeys!433 lt!208593 k!794 v!412 (select (arr!13735 _keys!709) from!863) lt!208596))))

(declare-fun b!460559 () Bool)

(declare-fun res!275379 () Bool)

(declare-fun e!268680 () Bool)

(assert (=> b!460559 (=> (not res!275379) (not e!268680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460559 (= res!275379 (validKeyInArray!0 k!794))))

(declare-fun b!460560 () Bool)

(declare-fun res!275383 () Bool)

(assert (=> b!460560 (=> (not res!275383) (not e!268680))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28589 (_ BitVec 32)) Bool)

(assert (=> b!460560 (= res!275383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460561 () Bool)

(declare-fun res!275386 () Bool)

(assert (=> b!460561 (=> (not res!275386) (not e!268680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460561 (= res!275386 (validMask!0 mask!1025))))

(declare-fun b!460562 () Bool)

(declare-fun res!275377 () Bool)

(assert (=> b!460562 (=> (not res!275377) (not e!268680))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460562 (= res!275377 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14087 _keys!709))))))

(declare-fun mapIsEmpty!20242 () Bool)

(declare-fun mapRes!20242 () Bool)

(assert (=> mapIsEmpty!20242 mapRes!20242))

(declare-fun b!460563 () Bool)

(declare-fun res!275385 () Bool)

(assert (=> b!460563 (=> (not res!275385) (not e!268680))))

(assert (=> b!460563 (= res!275385 (or (= (select (arr!13735 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13735 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460565 () Bool)

(declare-fun e!268685 () Bool)

(declare-fun e!268681 () Bool)

(assert (=> b!460565 (= e!268685 e!268681)))

(declare-fun res!275380 () Bool)

(assert (=> b!460565 (=> (not res!275380) (not e!268681))))

(assert (=> b!460565 (= res!275380 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17631)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208595 () array!28589)

(declare-fun zeroValue!515 () V!17631)

(declare-datatypes ((ValueCell!5854 0))(
  ( (ValueCellFull!5854 (v!8520 V!17631)) (EmptyCell!5854) )
))
(declare-datatypes ((array!28591 0))(
  ( (array!28592 (arr!13736 (Array (_ BitVec 32) ValueCell!5854)) (size!14088 (_ BitVec 32))) )
))
(declare-fun lt!208592 () array!28591)

(declare-fun lt!208600 () ListLongMap!7147)

(declare-fun getCurrentListMapNoExtraKeys!1769 (array!28589 array!28591 (_ BitVec 32) (_ BitVec 32) V!17631 V!17631 (_ BitVec 32) Int) ListLongMap!7147)

(assert (=> b!460565 (= lt!208600 (getCurrentListMapNoExtraKeys!1769 lt!208595 lt!208592 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28591)

(assert (=> b!460565 (= lt!208592 (array!28592 (store (arr!13736 _values!549) i!563 (ValueCellFull!5854 v!412)) (size!14088 _values!549)))))

(declare-fun lt!208599 () ListLongMap!7147)

(assert (=> b!460565 (= lt!208599 (getCurrentListMapNoExtraKeys!1769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460566 () Bool)

(declare-fun res!275375 () Bool)

(assert (=> b!460566 (=> (not res!275375) (not e!268680))))

(declare-datatypes ((List!8306 0))(
  ( (Nil!8303) (Cons!8302 (h!9158 (_ BitVec 64)) (t!14242 List!8306)) )
))
(declare-fun arrayNoDuplicates!0 (array!28589 (_ BitVec 32) List!8306) Bool)

(assert (=> b!460566 (= res!275375 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8303))))

(declare-fun b!460567 () Bool)

(declare-fun e!268687 () Bool)

(declare-fun tp_is_empty!12395 () Bool)

(assert (=> b!460567 (= e!268687 tp_is_empty!12395)))

(declare-fun b!460568 () Bool)

(declare-fun e!268684 () Bool)

(assert (=> b!460568 (= e!268681 (not e!268684))))

(declare-fun res!275376 () Bool)

(assert (=> b!460568 (=> res!275376 e!268684)))

(assert (=> b!460568 (= res!275376 (not (validKeyInArray!0 (select (arr!13735 _keys!709) from!863))))))

(declare-fun lt!208598 () ListLongMap!7147)

(declare-fun lt!208589 () ListLongMap!7147)

(assert (=> b!460568 (= lt!208598 lt!208589)))

(assert (=> b!460568 (= lt!208589 (+!1625 lt!208593 lt!208590))))

(assert (=> b!460568 (= lt!208598 (getCurrentListMapNoExtraKeys!1769 lt!208595 lt!208592 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460568 (= lt!208590 (tuple2!8235 k!794 v!412))))

(assert (=> b!460568 (= lt!208593 (getCurrentListMapNoExtraKeys!1769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208594 () Unit!13408)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!781 (array!28589 array!28591 (_ BitVec 32) (_ BitVec 32) V!17631 V!17631 (_ BitVec 32) (_ BitVec 64) V!17631 (_ BitVec 32) Int) Unit!13408)

(assert (=> b!460568 (= lt!208594 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460569 () Bool)

(declare-fun res!275381 () Bool)

(assert (=> b!460569 (=> (not res!275381) (not e!268685))))

(assert (=> b!460569 (= res!275381 (bvsle from!863 i!563))))

(declare-fun b!460570 () Bool)

(declare-fun res!275372 () Bool)

(assert (=> b!460570 (=> (not res!275372) (not e!268685))))

(assert (=> b!460570 (= res!275372 (arrayNoDuplicates!0 lt!208595 #b00000000000000000000000000000000 Nil!8303))))

(declare-fun b!460571 () Bool)

(declare-fun res!275373 () Bool)

(assert (=> b!460571 (=> (not res!275373) (not e!268680))))

(assert (=> b!460571 (= res!275373 (and (= (size!14088 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14087 _keys!709) (size!14088 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460572 () Bool)

(declare-fun e!268688 () Bool)

(assert (=> b!460572 (= e!268688 tp_is_empty!12395)))

(declare-fun b!460573 () Bool)

(assert (=> b!460573 (= e!268684 e!268686)))

(declare-fun res!275378 () Bool)

(assert (=> b!460573 (=> res!275378 e!268686)))

(assert (=> b!460573 (= res!275378 (= k!794 (select (arr!13735 _keys!709) from!863)))))

(assert (=> b!460573 (not (= (select (arr!13735 _keys!709) from!863) k!794))))

(declare-fun lt!208591 () Unit!13408)

(assert (=> b!460573 (= lt!208591 e!268682)))

(declare-fun c!56534 () Bool)

(assert (=> b!460573 (= c!56534 (= (select (arr!13735 _keys!709) from!863) k!794))))

(assert (=> b!460573 (= lt!208600 lt!208587)))

(assert (=> b!460573 (= lt!208587 (+!1625 lt!208589 lt!208601))))

(assert (=> b!460573 (= lt!208601 (tuple2!8235 (select (arr!13735 _keys!709) from!863) lt!208596))))

(declare-fun get!6781 (ValueCell!5854 V!17631) V!17631)

(declare-fun dynLambda!909 (Int (_ BitVec 64)) V!17631)

(assert (=> b!460573 (= lt!208596 (get!6781 (select (arr!13736 _values!549) from!863) (dynLambda!909 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460574 () Bool)

(declare-fun Unit!13411 () Unit!13408)

(assert (=> b!460574 (= e!268682 Unit!13411)))

(declare-fun lt!208588 () Unit!13408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13408)

(assert (=> b!460574 (= lt!208588 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460574 false))

(declare-fun mapNonEmpty!20242 () Bool)

(declare-fun tp!39007 () Bool)

(assert (=> mapNonEmpty!20242 (= mapRes!20242 (and tp!39007 e!268688))))

(declare-fun mapValue!20242 () ValueCell!5854)

(declare-fun mapRest!20242 () (Array (_ BitVec 32) ValueCell!5854))

(declare-fun mapKey!20242 () (_ BitVec 32))

(assert (=> mapNonEmpty!20242 (= (arr!13736 _values!549) (store mapRest!20242 mapKey!20242 mapValue!20242))))

(declare-fun b!460575 () Bool)

(assert (=> b!460575 (= e!268680 e!268685)))

(declare-fun res!275382 () Bool)

(assert (=> b!460575 (=> (not res!275382) (not e!268685))))

(assert (=> b!460575 (= res!275382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208595 mask!1025))))

(assert (=> b!460575 (= lt!208595 (array!28590 (store (arr!13735 _keys!709) i!563 k!794) (size!14087 _keys!709)))))

(declare-fun b!460576 () Bool)

(declare-fun e!268683 () Bool)

(assert (=> b!460576 (= e!268683 (and e!268687 mapRes!20242))))

(declare-fun condMapEmpty!20242 () Bool)

(declare-fun mapDefault!20242 () ValueCell!5854)

