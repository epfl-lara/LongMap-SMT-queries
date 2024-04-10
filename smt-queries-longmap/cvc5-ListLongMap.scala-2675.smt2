; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39868 () Bool)

(assert start!39868)

(declare-fun b_free!10135 () Bool)

(declare-fun b_next!10135 () Bool)

(assert (=> start!39868 (= b_free!10135 (not b_next!10135))))

(declare-fun tp!35933 () Bool)

(declare-fun b_and!17929 () Bool)

(assert (=> start!39868 (= tp!35933 b_and!17929)))

(declare-fun b!431386 () Bool)

(declare-fun e!255284 () Bool)

(assert (=> b!431386 (= e!255284 true)))

(declare-datatypes ((V!16155 0))(
  ( (V!16156 (val!5688 Int)) )
))
(declare-datatypes ((tuple2!7500 0))(
  ( (tuple2!7501 (_1!3761 (_ BitVec 64)) (_2!3761 V!16155)) )
))
(declare-fun lt!197542 () tuple2!7500)

(declare-fun lt!197554 () tuple2!7500)

(declare-datatypes ((List!7516 0))(
  ( (Nil!7513) (Cons!7512 (h!8368 tuple2!7500) (t!13100 List!7516)) )
))
(declare-datatypes ((ListLongMap!6413 0))(
  ( (ListLongMap!6414 (toList!3222 List!7516)) )
))
(declare-fun lt!197544 () ListLongMap!6413)

(declare-fun lt!197547 () ListLongMap!6413)

(declare-fun +!1370 (ListLongMap!6413 tuple2!7500) ListLongMap!6413)

(assert (=> b!431386 (= lt!197547 (+!1370 (+!1370 lt!197544 lt!197554) lt!197542))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!197545 () V!16155)

(declare-fun v!412 () V!16155)

(declare-datatypes ((array!26409 0))(
  ( (array!26410 (arr!12654 (Array (_ BitVec 32) (_ BitVec 64))) (size!13006 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26409)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((Unit!12714 0))(
  ( (Unit!12715) )
))
(declare-fun lt!197552 () Unit!12714)

(declare-fun addCommutativeForDiffKeys!363 (ListLongMap!6413 (_ BitVec 64) V!16155 (_ BitVec 64) V!16155) Unit!12714)

(assert (=> b!431386 (= lt!197552 (addCommutativeForDiffKeys!363 lt!197544 k!794 v!412 (select (arr!12654 _keys!709) from!863) lt!197545))))

(declare-fun mapIsEmpty!18552 () Bool)

(declare-fun mapRes!18552 () Bool)

(assert (=> mapIsEmpty!18552 mapRes!18552))

(declare-fun b!431387 () Bool)

(declare-fun e!255286 () Unit!12714)

(declare-fun Unit!12716 () Unit!12714)

(assert (=> b!431387 (= e!255286 Unit!12716)))

(declare-fun lt!197548 () Unit!12714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26409 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12714)

(assert (=> b!431387 (= lt!197548 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431387 false))

(declare-fun b!431388 () Bool)

(declare-fun e!255283 () Bool)

(declare-fun e!255288 () Bool)

(assert (=> b!431388 (= e!255283 (and e!255288 mapRes!18552))))

(declare-fun condMapEmpty!18552 () Bool)

(declare-datatypes ((ValueCell!5300 0))(
  ( (ValueCellFull!5300 (v!7935 V!16155)) (EmptyCell!5300) )
))
(declare-datatypes ((array!26411 0))(
  ( (array!26412 (arr!12655 (Array (_ BitVec 32) ValueCell!5300)) (size!13007 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26411)

(declare-fun mapDefault!18552 () ValueCell!5300)

