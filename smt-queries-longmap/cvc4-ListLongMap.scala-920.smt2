; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20620 () Bool)

(assert start!20620)

(declare-fun b_free!5279 () Bool)

(declare-fun b_next!5279 () Bool)

(assert (=> start!20620 (= b_free!5279 (not b_next!5279))))

(declare-fun tp!18868 () Bool)

(declare-fun b_and!12025 () Bool)

(assert (=> start!20620 (= tp!18868 b_and!12025)))

(declare-fun b!205668 () Bool)

(declare-fun e!134478 () Bool)

(declare-fun tp_is_empty!5135 () Bool)

(assert (=> b!205668 (= e!134478 tp_is_empty!5135)))

(declare-fun b!205669 () Bool)

(declare-fun res!99436 () Bool)

(declare-fun e!134483 () Bool)

(assert (=> b!205669 (=> (not res!99436) (not e!134483))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205669 (= res!99436 (validKeyInArray!0 k!843))))

(declare-fun b!205670 () Bool)

(declare-fun res!99431 () Bool)

(assert (=> b!205670 (=> (not res!99431) (not e!134483))))

(declare-datatypes ((array!9483 0))(
  ( (array!9484 (arr!4492 (Array (_ BitVec 32) (_ BitVec 64))) (size!4817 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9483)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6493 0))(
  ( (V!6494 (val!2612 Int)) )
))
(declare-datatypes ((ValueCell!2224 0))(
  ( (ValueCellFull!2224 (v!4582 V!6493)) (EmptyCell!2224) )
))
(declare-datatypes ((array!9485 0))(
  ( (array!9486 (arr!4493 (Array (_ BitVec 32) ValueCell!2224)) (size!4818 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9485)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205670 (= res!99431 (and (= (size!4818 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4817 _keys!825) (size!4818 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205671 () Bool)

(declare-fun e!134480 () Bool)

(declare-fun e!134477 () Bool)

(assert (=> b!205671 (= e!134480 e!134477)))

(declare-fun res!99430 () Bool)

(assert (=> b!205671 (=> res!99430 e!134477)))

(assert (=> b!205671 (= res!99430 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3964 0))(
  ( (tuple2!3965 (_1!1993 (_ BitVec 64)) (_2!1993 V!6493)) )
))
(declare-datatypes ((List!2860 0))(
  ( (Nil!2857) (Cons!2856 (h!3498 tuple2!3964) (t!7791 List!2860)) )
))
(declare-datatypes ((ListLongMap!2877 0))(
  ( (ListLongMap!2878 (toList!1454 List!2860)) )
))
(declare-fun lt!104801 () ListLongMap!2877)

(declare-fun lt!104810 () ListLongMap!2877)

(assert (=> b!205671 (= lt!104801 lt!104810)))

(declare-fun lt!104803 () ListLongMap!2877)

(declare-fun lt!104805 () tuple2!3964)

(declare-fun +!481 (ListLongMap!2877 tuple2!3964) ListLongMap!2877)

(assert (=> b!205671 (= lt!104810 (+!481 lt!104803 lt!104805))))

(declare-fun lt!104808 () ListLongMap!2877)

(declare-fun lt!104804 () ListLongMap!2877)

(assert (=> b!205671 (= lt!104808 lt!104804)))

(declare-fun lt!104809 () ListLongMap!2877)

(assert (=> b!205671 (= lt!104804 (+!481 lt!104809 lt!104805))))

(declare-fun lt!104800 () ListLongMap!2877)

(assert (=> b!205671 (= lt!104808 (+!481 lt!104800 lt!104805))))

(declare-fun minValue!615 () V!6493)

(assert (=> b!205671 (= lt!104805 (tuple2!3965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8771 () Bool)

(declare-fun mapRes!8771 () Bool)

(declare-fun tp!18869 () Bool)

(assert (=> mapNonEmpty!8771 (= mapRes!8771 (and tp!18869 e!134478))))

(declare-fun mapRest!8771 () (Array (_ BitVec 32) ValueCell!2224))

(declare-fun mapKey!8771 () (_ BitVec 32))

(declare-fun mapValue!8771 () ValueCell!2224)

(assert (=> mapNonEmpty!8771 (= (arr!4493 _values!649) (store mapRest!8771 mapKey!8771 mapValue!8771))))

(declare-fun mapIsEmpty!8771 () Bool)

(assert (=> mapIsEmpty!8771 mapRes!8771))

(declare-fun b!205672 () Bool)

(declare-fun res!99429 () Bool)

(assert (=> b!205672 (=> (not res!99429) (not e!134483))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205672 (= res!99429 (= (select (arr!4492 _keys!825) i!601) k!843))))

(declare-fun b!205673 () Bool)

(declare-fun e!134482 () Bool)

(declare-fun e!134479 () Bool)

(assert (=> b!205673 (= e!134482 (and e!134479 mapRes!8771))))

(declare-fun condMapEmpty!8771 () Bool)

(declare-fun mapDefault!8771 () ValueCell!2224)

