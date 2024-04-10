; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20586 () Bool)

(assert start!20586)

(declare-fun b_free!5245 () Bool)

(declare-fun b_next!5245 () Bool)

(assert (=> start!20586 (= b_free!5245 (not b_next!5245))))

(declare-fun tp!18766 () Bool)

(declare-fun b_and!11991 () Bool)

(assert (=> start!20586 (= tp!18766 b_and!11991)))

(declare-fun b!205056 () Bool)

(declare-fun res!98976 () Bool)

(declare-fun e!134120 () Bool)

(assert (=> b!205056 (=> (not res!98976) (not e!134120))))

(declare-datatypes ((array!9415 0))(
  ( (array!9416 (arr!4458 (Array (_ BitVec 32) (_ BitVec 64))) (size!4783 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9415)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205056 (= res!98976 (= (select (arr!4458 _keys!825) i!601) k!843))))

(declare-fun b!205057 () Bool)

(declare-fun res!98975 () Bool)

(assert (=> b!205057 (=> (not res!98975) (not e!134120))))

(declare-datatypes ((List!2832 0))(
  ( (Nil!2829) (Cons!2828 (h!3470 (_ BitVec 64)) (t!7763 List!2832)) )
))
(declare-fun arrayNoDuplicates!0 (array!9415 (_ BitVec 32) List!2832) Bool)

(assert (=> b!205057 (= res!98975 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2829))))

(declare-fun b!205058 () Bool)

(declare-fun e!134126 () Bool)

(assert (=> b!205058 (= e!134126 true)))

(declare-datatypes ((V!6449 0))(
  ( (V!6450 (val!2595 Int)) )
))
(declare-datatypes ((tuple2!3932 0))(
  ( (tuple2!3933 (_1!1977 (_ BitVec 64)) (_2!1977 V!6449)) )
))
(declare-datatypes ((List!2833 0))(
  ( (Nil!2830) (Cons!2829 (h!3471 tuple2!3932) (t!7764 List!2833)) )
))
(declare-datatypes ((ListLongMap!2845 0))(
  ( (ListLongMap!2846 (toList!1438 List!2833)) )
))
(declare-fun lt!104190 () ListLongMap!2845)

(declare-fun lt!104194 () ListLongMap!2845)

(declare-fun lt!104199 () tuple2!3932)

(declare-fun +!465 (ListLongMap!2845 tuple2!3932) ListLongMap!2845)

(assert (=> b!205058 (= lt!104190 (+!465 lt!104194 lt!104199))))

(declare-fun minValue!615 () V!6449)

(declare-fun lt!104191 () ListLongMap!2845)

(declare-fun v!520 () V!6449)

(declare-datatypes ((Unit!6222 0))(
  ( (Unit!6223) )
))
(declare-fun lt!104195 () Unit!6222)

(declare-fun addCommutativeForDiffKeys!170 (ListLongMap!2845 (_ BitVec 64) V!6449 (_ BitVec 64) V!6449) Unit!6222)

(assert (=> b!205058 (= lt!104195 (addCommutativeForDiffKeys!170 lt!104191 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205059 () Bool)

(declare-fun res!98971 () Bool)

(assert (=> b!205059 (=> (not res!98971) (not e!134120))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9415 (_ BitVec 32)) Bool)

(assert (=> b!205059 (= res!98971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205060 () Bool)

(declare-fun e!134125 () Bool)

(declare-fun e!134124 () Bool)

(declare-fun mapRes!8720 () Bool)

(assert (=> b!205060 (= e!134125 (and e!134124 mapRes!8720))))

(declare-fun condMapEmpty!8720 () Bool)

(declare-datatypes ((ValueCell!2207 0))(
  ( (ValueCellFull!2207 (v!4565 V!6449)) (EmptyCell!2207) )
))
(declare-datatypes ((array!9417 0))(
  ( (array!9418 (arr!4459 (Array (_ BitVec 32) ValueCell!2207)) (size!4784 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9417)

(declare-fun mapDefault!8720 () ValueCell!2207)

