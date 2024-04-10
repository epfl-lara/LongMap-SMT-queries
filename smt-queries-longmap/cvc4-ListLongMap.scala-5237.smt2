; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70506 () Bool)

(assert start!70506)

(declare-fun b_free!12833 () Bool)

(declare-fun b_next!12833 () Bool)

(assert (=> start!70506 (= b_free!12833 (not b_next!12833))))

(declare-fun tp!45232 () Bool)

(declare-fun b_and!21663 () Bool)

(assert (=> start!70506 (= tp!45232 b_and!21663)))

(declare-datatypes ((V!24391 0))(
  ( (V!24392 (val!7319 Int)) )
))
(declare-datatypes ((tuple2!9624 0))(
  ( (tuple2!9625 (_1!4823 (_ BitVec 64)) (_2!4823 V!24391)) )
))
(declare-datatypes ((List!15455 0))(
  ( (Nil!15452) (Cons!15451 (h!16580 tuple2!9624) (t!21784 List!15455)) )
))
(declare-datatypes ((ListLongMap!8447 0))(
  ( (ListLongMap!8448 (toList!4239 List!15455)) )
))
(declare-fun lt!367286 () ListLongMap!8447)

(declare-fun zeroValueAfter!34 () V!24391)

(declare-fun b!819003 () Bool)

(declare-fun lt!367292 () ListLongMap!8447)

(declare-fun e!454744 () Bool)

(declare-fun +!1836 (ListLongMap!8447 tuple2!9624) ListLongMap!8447)

(assert (=> b!819003 (= e!454744 (= lt!367292 (+!1836 lt!367286 (tuple2!9625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapNonEmpty!23413 () Bool)

(declare-fun mapRes!23413 () Bool)

(declare-fun tp!45231 () Bool)

(declare-fun e!454739 () Bool)

(assert (=> mapNonEmpty!23413 (= mapRes!23413 (and tp!45231 e!454739))))

(declare-datatypes ((ValueCell!6856 0))(
  ( (ValueCellFull!6856 (v!9748 V!24391)) (EmptyCell!6856) )
))
(declare-fun mapRest!23413 () (Array (_ BitVec 32) ValueCell!6856))

(declare-datatypes ((array!45284 0))(
  ( (array!45285 (arr!21696 (Array (_ BitVec 32) ValueCell!6856)) (size!22117 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45284)

(declare-fun mapValue!23413 () ValueCell!6856)

(declare-fun mapKey!23413 () (_ BitVec 32))

(assert (=> mapNonEmpty!23413 (= (arr!21696 _values!788) (store mapRest!23413 mapKey!23413 mapValue!23413))))

(declare-fun b!819004 () Bool)

(declare-fun tp_is_empty!14543 () Bool)

(assert (=> b!819004 (= e!454739 tp_is_empty!14543)))

(declare-fun b!819005 () Bool)

(declare-fun e!454741 () Bool)

(declare-fun e!454742 () Bool)

(assert (=> b!819005 (= e!454741 (and e!454742 mapRes!23413))))

(declare-fun condMapEmpty!23413 () Bool)

(declare-fun mapDefault!23413 () ValueCell!6856)

