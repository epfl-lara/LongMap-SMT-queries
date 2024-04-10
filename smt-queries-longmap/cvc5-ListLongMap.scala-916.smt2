; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20592 () Bool)

(assert start!20592)

(declare-fun b_free!5251 () Bool)

(declare-fun b_next!5251 () Bool)

(assert (=> start!20592 (= b_free!5251 (not b_next!5251))))

(declare-fun tp!18784 () Bool)

(declare-fun b_and!11997 () Bool)

(assert (=> start!20592 (= tp!18784 b_and!11997)))

(declare-fun b!205164 () Bool)

(declare-fun res!99055 () Bool)

(declare-fun e!134183 () Bool)

(assert (=> b!205164 (=> (not res!99055) (not e!134183))))

(declare-datatypes ((array!9427 0))(
  ( (array!9428 (arr!4464 (Array (_ BitVec 32) (_ BitVec 64))) (size!4789 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9427)

(declare-datatypes ((List!2837 0))(
  ( (Nil!2834) (Cons!2833 (h!3475 (_ BitVec 64)) (t!7768 List!2837)) )
))
(declare-fun arrayNoDuplicates!0 (array!9427 (_ BitVec 32) List!2837) Bool)

(assert (=> b!205164 (= res!99055 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2834))))

(declare-fun b!205165 () Bool)

(declare-fun res!99050 () Bool)

(assert (=> b!205165 (=> (not res!99050) (not e!134183))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9427 (_ BitVec 32)) Bool)

(assert (=> b!205165 (= res!99050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205166 () Bool)

(declare-fun e!134186 () Bool)

(assert (=> b!205166 (= e!134186 true)))

(declare-datatypes ((V!6457 0))(
  ( (V!6458 (val!2598 Int)) )
))
(declare-datatypes ((tuple2!3938 0))(
  ( (tuple2!3939 (_1!1980 (_ BitVec 64)) (_2!1980 V!6457)) )
))
(declare-datatypes ((List!2838 0))(
  ( (Nil!2835) (Cons!2834 (h!3476 tuple2!3938) (t!7769 List!2838)) )
))
(declare-datatypes ((ListLongMap!2851 0))(
  ( (ListLongMap!2852 (toList!1441 List!2838)) )
))
(declare-fun lt!104302 () ListLongMap!2851)

(declare-fun lt!104305 () ListLongMap!2851)

(declare-fun lt!104300 () tuple2!3938)

(declare-fun +!468 (ListLongMap!2851 tuple2!3938) ListLongMap!2851)

(assert (=> b!205166 (= lt!104302 (+!468 lt!104305 lt!104300))))

(declare-fun minValue!615 () V!6457)

(declare-datatypes ((Unit!6228 0))(
  ( (Unit!6229) )
))
(declare-fun lt!104297 () Unit!6228)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6457)

(declare-fun lt!104296 () ListLongMap!2851)

(declare-fun addCommutativeForDiffKeys!172 (ListLongMap!2851 (_ BitVec 64) V!6457 (_ BitVec 64) V!6457) Unit!6228)

(assert (=> b!205166 (= lt!104297 (addCommutativeForDiffKeys!172 lt!104296 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205167 () Bool)

(declare-fun e!134184 () Bool)

(assert (=> b!205167 (= e!134184 e!134186)))

(declare-fun res!99056 () Bool)

(assert (=> b!205167 (=> res!99056 e!134186)))

(assert (=> b!205167 (= res!99056 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104299 () ListLongMap!2851)

(assert (=> b!205167 (= lt!104299 lt!104305)))

(declare-fun lt!104304 () tuple2!3938)

(assert (=> b!205167 (= lt!104305 (+!468 lt!104296 lt!104304))))

(declare-fun lt!104298 () ListLongMap!2851)

(assert (=> b!205167 (= lt!104298 lt!104302)))

(declare-fun lt!104306 () ListLongMap!2851)

(assert (=> b!205167 (= lt!104302 (+!468 lt!104306 lt!104304))))

(declare-fun lt!104301 () ListLongMap!2851)

(assert (=> b!205167 (= lt!104298 (+!468 lt!104301 lt!104304))))

(assert (=> b!205167 (= lt!104304 (tuple2!3939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205168 () Bool)

(declare-fun res!99052 () Bool)

(assert (=> b!205168 (=> (not res!99052) (not e!134183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205168 (= res!99052 (validKeyInArray!0 k!843))))

(declare-fun b!205169 () Bool)

(declare-fun e!134188 () Bool)

(declare-fun tp_is_empty!5107 () Bool)

(assert (=> b!205169 (= e!134188 tp_is_empty!5107)))

(declare-fun b!205170 () Bool)

(assert (=> b!205170 (= e!134183 (not e!134184))))

(declare-fun res!99053 () Bool)

(assert (=> b!205170 (=> res!99053 e!134184)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205170 (= res!99053 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2210 0))(
  ( (ValueCellFull!2210 (v!4568 V!6457)) (EmptyCell!2210) )
))
(declare-datatypes ((array!9429 0))(
  ( (array!9430 (arr!4465 (Array (_ BitVec 32) ValueCell!2210)) (size!4790 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9429)

(declare-fun zeroValue!615 () V!6457)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1013 (array!9427 array!9429 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) Int) ListLongMap!2851)

(assert (=> b!205170 (= lt!104299 (getCurrentListMap!1013 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104307 () array!9429)

(assert (=> b!205170 (= lt!104298 (getCurrentListMap!1013 _keys!825 lt!104307 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205170 (and (= lt!104301 lt!104306) (= lt!104306 lt!104301))))

(assert (=> b!205170 (= lt!104306 (+!468 lt!104296 lt!104300))))

(assert (=> b!205170 (= lt!104300 (tuple2!3939 k!843 v!520))))

(declare-fun lt!104303 () Unit!6228)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!126 (array!9427 array!9429 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) (_ BitVec 64) V!6457 (_ BitVec 32) Int) Unit!6228)

(assert (=> b!205170 (= lt!104303 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!126 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!387 (array!9427 array!9429 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) Int) ListLongMap!2851)

(assert (=> b!205170 (= lt!104301 (getCurrentListMapNoExtraKeys!387 _keys!825 lt!104307 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205170 (= lt!104307 (array!9430 (store (arr!4465 _values!649) i!601 (ValueCellFull!2210 v!520)) (size!4790 _values!649)))))

(assert (=> b!205170 (= lt!104296 (getCurrentListMapNoExtraKeys!387 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!99054 () Bool)

(assert (=> start!20592 (=> (not res!99054) (not e!134183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20592 (= res!99054 (validMask!0 mask!1149))))

(assert (=> start!20592 e!134183))

(declare-fun e!134189 () Bool)

(declare-fun array_inv!2949 (array!9429) Bool)

(assert (=> start!20592 (and (array_inv!2949 _values!649) e!134189)))

(assert (=> start!20592 true))

(assert (=> start!20592 tp_is_empty!5107))

(declare-fun array_inv!2950 (array!9427) Bool)

(assert (=> start!20592 (array_inv!2950 _keys!825)))

(assert (=> start!20592 tp!18784))

(declare-fun b!205171 () Bool)

(declare-fun e!134187 () Bool)

(declare-fun mapRes!8729 () Bool)

(assert (=> b!205171 (= e!134189 (and e!134187 mapRes!8729))))

(declare-fun condMapEmpty!8729 () Bool)

(declare-fun mapDefault!8729 () ValueCell!2210)

