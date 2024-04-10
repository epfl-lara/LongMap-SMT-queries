; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39940 () Bool)

(assert start!39940)

(declare-fun b_free!10207 () Bool)

(declare-fun b_next!10207 () Bool)

(assert (=> start!39940 (= b_free!10207 (not b_next!10207))))

(declare-fun tp!36150 () Bool)

(declare-fun b_and!18073 () Bool)

(assert (=> start!39940 (= tp!36150 b_and!18073)))

(declare-fun mapNonEmpty!18660 () Bool)

(declare-fun mapRes!18660 () Bool)

(declare-fun tp!36149 () Bool)

(declare-fun e!256363 () Bool)

(assert (=> mapNonEmpty!18660 (= mapRes!18660 (and tp!36149 e!256363))))

(declare-datatypes ((V!16251 0))(
  ( (V!16252 (val!5724 Int)) )
))
(declare-datatypes ((ValueCell!5336 0))(
  ( (ValueCellFull!5336 (v!7971 V!16251)) (EmptyCell!5336) )
))
(declare-fun mapRest!18660 () (Array (_ BitVec 32) ValueCell!5336))

(declare-fun mapKey!18660 () (_ BitVec 32))

(declare-datatypes ((array!26551 0))(
  ( (array!26552 (arr!12725 (Array (_ BitVec 32) ValueCell!5336)) (size!13077 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26551)

(declare-fun mapValue!18660 () ValueCell!5336)

(assert (=> mapNonEmpty!18660 (= (arr!12725 _values!549) (store mapRest!18660 mapKey!18660 mapValue!18660))))

(declare-fun b!433618 () Bool)

(declare-fun res!255240 () Bool)

(declare-fun e!256368 () Bool)

(assert (=> b!433618 (=> (not res!255240) (not e!256368))))

(declare-datatypes ((array!26553 0))(
  ( (array!26554 (arr!12726 (Array (_ BitVec 32) (_ BitVec 64))) (size!13078 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26553)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433618 (= res!255240 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433619 () Bool)

(declare-fun res!255235 () Bool)

(assert (=> b!433619 (=> (not res!255235) (not e!256368))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!433619 (= res!255235 (and (= (size!13077 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13078 _keys!709) (size!13077 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433621 () Bool)

(declare-fun res!255226 () Bool)

(assert (=> b!433621 (=> (not res!255226) (not e!256368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433621 (= res!255226 (validMask!0 mask!1025))))

(declare-fun b!433622 () Bool)

(declare-fun e!256362 () Bool)

(declare-fun tp_is_empty!11359 () Bool)

(assert (=> b!433622 (= e!256362 tp_is_empty!11359)))

(declare-fun b!433623 () Bool)

(declare-datatypes ((Unit!12840 0))(
  ( (Unit!12841) )
))
(declare-fun e!256364 () Unit!12840)

(declare-fun Unit!12842 () Unit!12840)

(assert (=> b!433623 (= e!256364 Unit!12842)))

(declare-fun b!433624 () Bool)

(declare-fun res!255230 () Bool)

(assert (=> b!433624 (=> (not res!255230) (not e!256368))))

(declare-datatypes ((List!7574 0))(
  ( (Nil!7571) (Cons!7570 (h!8426 (_ BitVec 64)) (t!13230 List!7574)) )
))
(declare-fun arrayNoDuplicates!0 (array!26553 (_ BitVec 32) List!7574) Bool)

(assert (=> b!433624 (= res!255230 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7571))))

(declare-fun b!433625 () Bool)

(declare-fun e!256366 () Bool)

(assert (=> b!433625 (= e!256368 e!256366)))

(declare-fun res!255238 () Bool)

(assert (=> b!433625 (=> (not res!255238) (not e!256366))))

(declare-fun lt!199168 () array!26553)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26553 (_ BitVec 32)) Bool)

(assert (=> b!433625 (= res!255238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199168 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433625 (= lt!199168 (array!26554 (store (arr!12726 _keys!709) i!563 k!794) (size!13078 _keys!709)))))

(declare-fun b!433626 () Bool)

(assert (=> b!433626 (= e!256363 tp_is_empty!11359)))

(declare-fun b!433627 () Bool)

(declare-fun e!256371 () Bool)

(declare-fun e!256367 () Bool)

(assert (=> b!433627 (= e!256371 (not e!256367))))

(declare-fun res!255229 () Bool)

(assert (=> b!433627 (=> res!255229 e!256367)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433627 (= res!255229 (not (validKeyInArray!0 (select (arr!12726 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7566 0))(
  ( (tuple2!7567 (_1!3794 (_ BitVec 64)) (_2!3794 V!16251)) )
))
(declare-datatypes ((List!7575 0))(
  ( (Nil!7572) (Cons!7571 (h!8427 tuple2!7566) (t!13231 List!7575)) )
))
(declare-datatypes ((ListLongMap!6479 0))(
  ( (ListLongMap!6480 (toList!3255 List!7575)) )
))
(declare-fun lt!199174 () ListLongMap!6479)

(declare-fun lt!199175 () ListLongMap!6479)

(assert (=> b!433627 (= lt!199174 lt!199175)))

(declare-fun lt!199163 () ListLongMap!6479)

(declare-fun lt!199164 () tuple2!7566)

(declare-fun +!1403 (ListLongMap!6479 tuple2!7566) ListLongMap!6479)

(assert (=> b!433627 (= lt!199175 (+!1403 lt!199163 lt!199164))))

(declare-fun minValue!515 () V!16251)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!199167 () array!26551)

(declare-fun zeroValue!515 () V!16251)

(declare-fun getCurrentListMapNoExtraKeys!1450 (array!26553 array!26551 (_ BitVec 32) (_ BitVec 32) V!16251 V!16251 (_ BitVec 32) Int) ListLongMap!6479)

(assert (=> b!433627 (= lt!199174 (getCurrentListMapNoExtraKeys!1450 lt!199168 lt!199167 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16251)

(assert (=> b!433627 (= lt!199164 (tuple2!7567 k!794 v!412))))

(assert (=> b!433627 (= lt!199163 (getCurrentListMapNoExtraKeys!1450 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199169 () Unit!12840)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!582 (array!26553 array!26551 (_ BitVec 32) (_ BitVec 32) V!16251 V!16251 (_ BitVec 32) (_ BitVec 64) V!16251 (_ BitVec 32) Int) Unit!12840)

(assert (=> b!433627 (= lt!199169 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!582 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433628 () Bool)

(declare-fun e!256370 () Bool)

(assert (=> b!433628 (= e!256370 (and e!256362 mapRes!18660))))

(declare-fun condMapEmpty!18660 () Bool)

(declare-fun mapDefault!18660 () ValueCell!5336)

