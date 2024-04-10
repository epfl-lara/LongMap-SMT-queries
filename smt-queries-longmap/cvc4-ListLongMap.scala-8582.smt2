; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104714 () Bool)

(assert start!104714)

(declare-fun b_free!26531 () Bool)

(declare-fun b_next!26531 () Bool)

(assert (=> start!104714 (= b_free!26531 (not b_next!26531))))

(declare-fun tp!93080 () Bool)

(declare-fun b_and!44295 () Bool)

(assert (=> start!104714 (= tp!93080 b_and!44295)))

(declare-fun b!1248392 () Bool)

(declare-fun e!708392 () Bool)

(declare-fun tp_is_empty!31433 () Bool)

(assert (=> b!1248392 (= e!708392 tp_is_empty!31433)))

(declare-fun mapNonEmpty!48907 () Bool)

(declare-fun mapRes!48907 () Bool)

(declare-fun tp!93079 () Bool)

(declare-fun e!708390 () Bool)

(assert (=> mapNonEmpty!48907 (= mapRes!48907 (and tp!93079 e!708390))))

(declare-datatypes ((V!47275 0))(
  ( (V!47276 (val!15779 Int)) )
))
(declare-datatypes ((ValueCell!14953 0))(
  ( (ValueCellFull!14953 (v!18475 V!47275)) (EmptyCell!14953) )
))
(declare-fun mapValue!48907 () ValueCell!14953)

(declare-fun mapKey!48907 () (_ BitVec 32))

(declare-fun mapRest!48907 () (Array (_ BitVec 32) ValueCell!14953))

(declare-datatypes ((array!80558 0))(
  ( (array!80559 (arr!38847 (Array (_ BitVec 32) ValueCell!14953)) (size!39383 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80558)

(assert (=> mapNonEmpty!48907 (= (arr!38847 _values!914) (store mapRest!48907 mapKey!48907 mapValue!48907))))

(declare-fun b!1248393 () Bool)

(declare-fun res!832883 () Bool)

(declare-fun e!708391 () Bool)

(assert (=> b!1248393 (=> (not res!832883) (not e!708391))))

(declare-datatypes ((array!80560 0))(
  ( (array!80561 (arr!38848 (Array (_ BitVec 32) (_ BitVec 64))) (size!39384 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80560)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80560 (_ BitVec 32)) Bool)

(assert (=> b!1248393 (= res!832883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248394 () Bool)

(declare-fun e!708394 () Bool)

(assert (=> b!1248394 (= e!708394 (and e!708392 mapRes!48907))))

(declare-fun condMapEmpty!48907 () Bool)

(declare-fun mapDefault!48907 () ValueCell!14953)

