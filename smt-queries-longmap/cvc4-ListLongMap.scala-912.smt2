; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20572 () Bool)

(assert start!20572)

(declare-fun b_free!5231 () Bool)

(declare-fun b_next!5231 () Bool)

(assert (=> start!20572 (= b_free!5231 (not b_next!5231))))

(declare-fun tp!18725 () Bool)

(declare-fun b_and!11977 () Bool)

(assert (=> start!20572 (= tp!18725 b_and!11977)))

(declare-fun b!204804 () Bool)

(declare-fun res!98784 () Bool)

(declare-fun e!133977 () Bool)

(assert (=> b!204804 (=> (not res!98784) (not e!133977))))

(declare-datatypes ((array!9389 0))(
  ( (array!9390 (arr!4445 (Array (_ BitVec 32) (_ BitVec 64))) (size!4770 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9389)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204804 (= res!98784 (= (select (arr!4445 _keys!825) i!601) k!843))))

(declare-fun b!204805 () Bool)

(declare-fun e!133979 () Bool)

(assert (=> b!204805 (= e!133977 (not e!133979))))

(declare-fun res!98788 () Bool)

(assert (=> b!204805 (=> res!98788 e!133979)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204805 (= res!98788 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6429 0))(
  ( (V!6430 (val!2588 Int)) )
))
(declare-datatypes ((tuple2!3924 0))(
  ( (tuple2!3925 (_1!1973 (_ BitVec 64)) (_2!1973 V!6429)) )
))
(declare-datatypes ((List!2822 0))(
  ( (Nil!2819) (Cons!2818 (h!3460 tuple2!3924) (t!7753 List!2822)) )
))
(declare-datatypes ((ListLongMap!2837 0))(
  ( (ListLongMap!2838 (toList!1434 List!2822)) )
))
(declare-fun lt!103939 () ListLongMap!2837)

(declare-datatypes ((ValueCell!2200 0))(
  ( (ValueCellFull!2200 (v!4558 V!6429)) (EmptyCell!2200) )
))
(declare-datatypes ((array!9391 0))(
  ( (array!9392 (arr!4446 (Array (_ BitVec 32) ValueCell!2200)) (size!4771 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9391)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6429)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6429)

(declare-fun getCurrentListMap!1007 (array!9389 array!9391 (_ BitVec 32) (_ BitVec 32) V!6429 V!6429 (_ BitVec 32) Int) ListLongMap!2837)

(assert (=> b!204805 (= lt!103939 (getCurrentListMap!1007 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103945 () array!9391)

(declare-fun lt!103942 () ListLongMap!2837)

(assert (=> b!204805 (= lt!103942 (getCurrentListMap!1007 _keys!825 lt!103945 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103944 () ListLongMap!2837)

(declare-fun lt!103941 () ListLongMap!2837)

(assert (=> b!204805 (and (= lt!103944 lt!103941) (= lt!103941 lt!103944))))

(declare-fun lt!103947 () ListLongMap!2837)

(declare-fun lt!103940 () tuple2!3924)

(declare-fun +!461 (ListLongMap!2837 tuple2!3924) ListLongMap!2837)

(assert (=> b!204805 (= lt!103941 (+!461 lt!103947 lt!103940))))

(declare-fun v!520 () V!6429)

(assert (=> b!204805 (= lt!103940 (tuple2!3925 k!843 v!520))))

(declare-datatypes ((Unit!6214 0))(
  ( (Unit!6215) )
))
(declare-fun lt!103937 () Unit!6214)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!120 (array!9389 array!9391 (_ BitVec 32) (_ BitVec 32) V!6429 V!6429 (_ BitVec 32) (_ BitVec 64) V!6429 (_ BitVec 32) Int) Unit!6214)

(assert (=> b!204805 (= lt!103937 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!120 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!381 (array!9389 array!9391 (_ BitVec 32) (_ BitVec 32) V!6429 V!6429 (_ BitVec 32) Int) ListLongMap!2837)

(assert (=> b!204805 (= lt!103944 (getCurrentListMapNoExtraKeys!381 _keys!825 lt!103945 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204805 (= lt!103945 (array!9392 (store (arr!4446 _values!649) i!601 (ValueCellFull!2200 v!520)) (size!4771 _values!649)))))

(assert (=> b!204805 (= lt!103947 (getCurrentListMapNoExtraKeys!381 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204806 () Bool)

(declare-fun res!98787 () Bool)

(assert (=> b!204806 (=> (not res!98787) (not e!133977))))

(declare-datatypes ((List!2823 0))(
  ( (Nil!2820) (Cons!2819 (h!3461 (_ BitVec 64)) (t!7754 List!2823)) )
))
(declare-fun arrayNoDuplicates!0 (array!9389 (_ BitVec 32) List!2823) Bool)

(assert (=> b!204806 (= res!98787 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2820))))

(declare-fun b!204807 () Bool)

(declare-fun e!133975 () Bool)

(declare-fun tp_is_empty!5087 () Bool)

(assert (=> b!204807 (= e!133975 tp_is_empty!5087)))

(declare-fun b!204808 () Bool)

(declare-fun e!133973 () Bool)

(declare-fun e!133978 () Bool)

(declare-fun mapRes!8699 () Bool)

(assert (=> b!204808 (= e!133973 (and e!133978 mapRes!8699))))

(declare-fun condMapEmpty!8699 () Bool)

(declare-fun mapDefault!8699 () ValueCell!2200)

