; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20794 () Bool)

(assert start!20794)

(declare-fun b_free!5447 () Bool)

(declare-fun b_next!5447 () Bool)

(assert (=> start!20794 (= b_free!5447 (not b_next!5447))))

(declare-fun tp!19382 () Bool)

(declare-fun b_and!12193 () Bool)

(assert (=> start!20794 (= tp!19382 b_and!12193)))

(declare-fun b!208370 () Bool)

(declare-fun e!135911 () Bool)

(assert (=> b!208370 (= e!135911 false)))

(declare-datatypes ((V!6725 0))(
  ( (V!6726 (val!2699 Int)) )
))
(declare-datatypes ((tuple2!4090 0))(
  ( (tuple2!4091 (_1!2056 (_ BitVec 64)) (_2!2056 V!6725)) )
))
(declare-datatypes ((List!2986 0))(
  ( (Nil!2983) (Cons!2982 (h!3624 tuple2!4090) (t!7917 List!2986)) )
))
(declare-datatypes ((ListLongMap!3003 0))(
  ( (ListLongMap!3004 (toList!1517 List!2986)) )
))
(declare-fun lt!106773 () ListLongMap!3003)

(declare-datatypes ((ValueCell!2311 0))(
  ( (ValueCellFull!2311 (v!4669 V!6725)) (EmptyCell!2311) )
))
(declare-datatypes ((array!9821 0))(
  ( (array!9822 (arr!4661 (Array (_ BitVec 32) ValueCell!2311)) (size!4986 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9821)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6725)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6725)

(declare-datatypes ((array!9823 0))(
  ( (array!9824 (arr!4662 (Array (_ BitVec 32) (_ BitVec 64))) (size!4987 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9823)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6725)

(declare-fun getCurrentListMapNoExtraKeys!458 (array!9823 array!9821 (_ BitVec 32) (_ BitVec 32) V!6725 V!6725 (_ BitVec 32) Int) ListLongMap!3003)

(assert (=> b!208370 (= lt!106773 (getCurrentListMapNoExtraKeys!458 _keys!825 (array!9822 (store (arr!4661 _values!649) i!601 (ValueCellFull!2311 v!520)) (size!4986 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106772 () ListLongMap!3003)

(assert (=> b!208370 (= lt!106772 (getCurrentListMapNoExtraKeys!458 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9032 () Bool)

(declare-fun mapRes!9032 () Bool)

(declare-fun tp!19381 () Bool)

(declare-fun e!135912 () Bool)

(assert (=> mapNonEmpty!9032 (= mapRes!9032 (and tp!19381 e!135912))))

(declare-fun mapValue!9032 () ValueCell!2311)

(declare-fun mapKey!9032 () (_ BitVec 32))

(declare-fun mapRest!9032 () (Array (_ BitVec 32) ValueCell!2311))

(assert (=> mapNonEmpty!9032 (= (arr!4661 _values!649) (store mapRest!9032 mapKey!9032 mapValue!9032))))

(declare-fun b!208371 () Bool)

(declare-fun res!101349 () Bool)

(assert (=> b!208371 (=> (not res!101349) (not e!135911))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!208371 (= res!101349 (= (select (arr!4662 _keys!825) i!601) k!843))))

(declare-fun res!101347 () Bool)

(assert (=> start!20794 (=> (not res!101347) (not e!135911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20794 (= res!101347 (validMask!0 mask!1149))))

(assert (=> start!20794 e!135911))

(declare-fun e!135914 () Bool)

(declare-fun array_inv!3091 (array!9821) Bool)

(assert (=> start!20794 (and (array_inv!3091 _values!649) e!135914)))

(assert (=> start!20794 true))

(declare-fun tp_is_empty!5309 () Bool)

(assert (=> start!20794 tp_is_empty!5309))

(declare-fun array_inv!3092 (array!9823) Bool)

(assert (=> start!20794 (array_inv!3092 _keys!825)))

(assert (=> start!20794 tp!19382))

(declare-fun b!208372 () Bool)

(declare-fun e!135910 () Bool)

(assert (=> b!208372 (= e!135914 (and e!135910 mapRes!9032))))

(declare-fun condMapEmpty!9032 () Bool)

(declare-fun mapDefault!9032 () ValueCell!2311)

