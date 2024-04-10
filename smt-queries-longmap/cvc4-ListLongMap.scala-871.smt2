; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20326 () Bool)

(assert start!20326)

(declare-fun b_free!4985 () Bool)

(declare-fun b_next!4985 () Bool)

(assert (=> start!20326 (= b_free!4985 (not b_next!4985))))

(declare-fun tp!17987 () Bool)

(declare-fun b_and!11731 () Bool)

(assert (=> start!20326 (= tp!17987 b_and!11731)))

(declare-fun b!200360 () Bool)

(declare-fun res!95442 () Bool)

(declare-fun e!131396 () Bool)

(assert (=> b!200360 (=> (not res!95442) (not e!131396))))

(declare-datatypes ((array!8913 0))(
  ( (array!8914 (arr!4207 (Array (_ BitVec 32) (_ BitVec 64))) (size!4532 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8913)

(declare-datatypes ((List!2640 0))(
  ( (Nil!2637) (Cons!2636 (h!3278 (_ BitVec 64)) (t!7571 List!2640)) )
))
(declare-fun arrayNoDuplicates!0 (array!8913 (_ BitVec 32) List!2640) Bool)

(assert (=> b!200360 (= res!95442 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2637))))

(declare-fun b!200361 () Bool)

(declare-fun res!95445 () Bool)

(assert (=> b!200361 (=> (not res!95445) (not e!131396))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200361 (= res!95445 (= (select (arr!4207 _keys!825) i!601) k!843))))

(declare-fun b!200362 () Bool)

(declare-fun e!131395 () Bool)

(assert (=> b!200362 (= e!131396 (not e!131395))))

(declare-fun res!95444 () Bool)

(assert (=> b!200362 (=> res!95444 e!131395)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200362 (= res!95444 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6101 0))(
  ( (V!6102 (val!2465 Int)) )
))
(declare-datatypes ((tuple2!3724 0))(
  ( (tuple2!3725 (_1!1873 (_ BitVec 64)) (_2!1873 V!6101)) )
))
(declare-datatypes ((List!2641 0))(
  ( (Nil!2638) (Cons!2637 (h!3279 tuple2!3724) (t!7572 List!2641)) )
))
(declare-datatypes ((ListLongMap!2637 0))(
  ( (ListLongMap!2638 (toList!1334 List!2641)) )
))
(declare-fun lt!98932 () ListLongMap!2637)

(declare-datatypes ((ValueCell!2077 0))(
  ( (ValueCellFull!2077 (v!4435 V!6101)) (EmptyCell!2077) )
))
(declare-datatypes ((array!8915 0))(
  ( (array!8916 (arr!4208 (Array (_ BitVec 32) ValueCell!2077)) (size!4533 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8915)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6101)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6101)

(declare-fun getCurrentListMap!924 (array!8913 array!8915 (_ BitVec 32) (_ BitVec 32) V!6101 V!6101 (_ BitVec 32) Int) ListLongMap!2637)

(assert (=> b!200362 (= lt!98932 (getCurrentListMap!924 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98943 () ListLongMap!2637)

(declare-fun lt!98941 () array!8915)

(assert (=> b!200362 (= lt!98943 (getCurrentListMap!924 _keys!825 lt!98941 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98931 () ListLongMap!2637)

(declare-fun lt!98942 () ListLongMap!2637)

(assert (=> b!200362 (and (= lt!98931 lt!98942) (= lt!98942 lt!98931))))

(declare-fun lt!98938 () ListLongMap!2637)

(declare-fun lt!98939 () tuple2!3724)

(declare-fun +!361 (ListLongMap!2637 tuple2!3724) ListLongMap!2637)

(assert (=> b!200362 (= lt!98942 (+!361 lt!98938 lt!98939))))

(declare-fun v!520 () V!6101)

(assert (=> b!200362 (= lt!98939 (tuple2!3725 k!843 v!520))))

(declare-datatypes ((Unit!6022 0))(
  ( (Unit!6023) )
))
(declare-fun lt!98936 () Unit!6022)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!37 (array!8913 array!8915 (_ BitVec 32) (_ BitVec 32) V!6101 V!6101 (_ BitVec 32) (_ BitVec 64) V!6101 (_ BitVec 32) Int) Unit!6022)

(assert (=> b!200362 (= lt!98936 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!37 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!298 (array!8913 array!8915 (_ BitVec 32) (_ BitVec 32) V!6101 V!6101 (_ BitVec 32) Int) ListLongMap!2637)

(assert (=> b!200362 (= lt!98931 (getCurrentListMapNoExtraKeys!298 _keys!825 lt!98941 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200362 (= lt!98941 (array!8916 (store (arr!4208 _values!649) i!601 (ValueCellFull!2077 v!520)) (size!4533 _values!649)))))

(assert (=> b!200362 (= lt!98938 (getCurrentListMapNoExtraKeys!298 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200363 () Bool)

(declare-fun e!131392 () Bool)

(declare-fun e!131393 () Bool)

(declare-fun mapRes!8330 () Bool)

(assert (=> b!200363 (= e!131392 (and e!131393 mapRes!8330))))

(declare-fun condMapEmpty!8330 () Bool)

(declare-fun mapDefault!8330 () ValueCell!2077)

