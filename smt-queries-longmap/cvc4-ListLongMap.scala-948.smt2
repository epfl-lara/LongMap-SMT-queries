; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20788 () Bool)

(assert start!20788)

(declare-fun b_free!5441 () Bool)

(declare-fun b_next!5441 () Bool)

(assert (=> start!20788 (= b_free!5441 (not b_next!5441))))

(declare-fun tp!19364 () Bool)

(declare-fun b_and!12187 () Bool)

(assert (=> start!20788 (= tp!19364 b_and!12187)))

(declare-fun b!208280 () Bool)

(declare-fun e!135869 () Bool)

(declare-datatypes ((array!9811 0))(
  ( (array!9812 (arr!4656 (Array (_ BitVec 32) (_ BitVec 64))) (size!4981 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9811)

(assert (=> b!208280 (= e!135869 (bvsgt #b00000000000000000000000000000000 (size!4981 _keys!825)))))

(declare-datatypes ((V!6717 0))(
  ( (V!6718 (val!2696 Int)) )
))
(declare-datatypes ((ValueCell!2308 0))(
  ( (ValueCellFull!2308 (v!4666 V!6717)) (EmptyCell!2308) )
))
(declare-datatypes ((array!9813 0))(
  ( (array!9814 (arr!4657 (Array (_ BitVec 32) ValueCell!2308)) (size!4982 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9813)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6717)

(declare-datatypes ((tuple2!4086 0))(
  ( (tuple2!4087 (_1!2054 (_ BitVec 64)) (_2!2054 V!6717)) )
))
(declare-datatypes ((List!2982 0))(
  ( (Nil!2979) (Cons!2978 (h!3620 tuple2!4086) (t!7913 List!2982)) )
))
(declare-datatypes ((ListLongMap!2999 0))(
  ( (ListLongMap!3000 (toList!1515 List!2982)) )
))
(declare-fun lt!106755 () ListLongMap!2999)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6717)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6717)

(declare-fun getCurrentListMapNoExtraKeys!456 (array!9811 array!9813 (_ BitVec 32) (_ BitVec 32) V!6717 V!6717 (_ BitVec 32) Int) ListLongMap!2999)

(assert (=> b!208280 (= lt!106755 (getCurrentListMapNoExtraKeys!456 _keys!825 (array!9814 (store (arr!4657 _values!649) i!601 (ValueCellFull!2308 v!520)) (size!4982 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106754 () ListLongMap!2999)

(assert (=> b!208280 (= lt!106754 (getCurrentListMapNoExtraKeys!456 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208281 () Bool)

(declare-fun e!135867 () Bool)

(declare-fun tp_is_empty!5303 () Bool)

(assert (=> b!208281 (= e!135867 tp_is_empty!5303)))

(declare-fun b!208282 () Bool)

(declare-fun res!101287 () Bool)

(assert (=> b!208282 (=> (not res!101287) (not e!135869))))

(assert (=> b!208282 (= res!101287 (and (= (size!4982 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4981 _keys!825) (size!4982 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!101284 () Bool)

(assert (=> start!20788 (=> (not res!101284) (not e!135869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20788 (= res!101284 (validMask!0 mask!1149))))

(assert (=> start!20788 e!135869))

(declare-fun e!135865 () Bool)

(declare-fun array_inv!3087 (array!9813) Bool)

(assert (=> start!20788 (and (array_inv!3087 _values!649) e!135865)))

(assert (=> start!20788 true))

(assert (=> start!20788 tp_is_empty!5303))

(declare-fun array_inv!3088 (array!9811) Bool)

(assert (=> start!20788 (array_inv!3088 _keys!825)))

(assert (=> start!20788 tp!19364))

(declare-fun b!208283 () Bool)

(declare-fun res!101289 () Bool)

(assert (=> b!208283 (=> (not res!101289) (not e!135869))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208283 (= res!101289 (validKeyInArray!0 k!843))))

(declare-fun b!208284 () Bool)

(declare-fun res!101290 () Bool)

(assert (=> b!208284 (=> (not res!101290) (not e!135869))))

(declare-datatypes ((List!2983 0))(
  ( (Nil!2980) (Cons!2979 (h!3621 (_ BitVec 64)) (t!7914 List!2983)) )
))
(declare-fun arrayNoDuplicates!0 (array!9811 (_ BitVec 32) List!2983) Bool)

(assert (=> b!208284 (= res!101290 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2980))))

(declare-fun b!208285 () Bool)

(declare-fun e!135868 () Bool)

(declare-fun mapRes!9023 () Bool)

(assert (=> b!208285 (= e!135865 (and e!135868 mapRes!9023))))

(declare-fun condMapEmpty!9023 () Bool)

(declare-fun mapDefault!9023 () ValueCell!2308)

