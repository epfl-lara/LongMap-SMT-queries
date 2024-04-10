; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35430 () Bool)

(assert start!35430)

(declare-fun b_free!7817 () Bool)

(declare-fun b_next!7817 () Bool)

(assert (=> start!35430 (= b_free!7817 (not b_next!7817))))

(declare-fun tp!27237 () Bool)

(declare-fun b_and!15059 () Bool)

(assert (=> start!35430 (= tp!27237 b_and!15059)))

(declare-fun mapNonEmpty!13332 () Bool)

(declare-fun mapRes!13332 () Bool)

(declare-fun tp!27236 () Bool)

(declare-fun e!217417 () Bool)

(assert (=> mapNonEmpty!13332 (= mapRes!13332 (and tp!27236 e!217417))))

(declare-fun mapKey!13332 () (_ BitVec 32))

(declare-datatypes ((V!11487 0))(
  ( (V!11488 (val!3986 Int)) )
))
(declare-datatypes ((ValueCell!3598 0))(
  ( (ValueCellFull!3598 (v!6180 V!11487)) (EmptyCell!3598) )
))
(declare-fun mapRest!13332 () (Array (_ BitVec 32) ValueCell!3598))

(declare-datatypes ((array!19347 0))(
  ( (array!19348 (arr!9167 (Array (_ BitVec 32) ValueCell!3598)) (size!9519 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19347)

(declare-fun mapValue!13332 () ValueCell!3598)

(assert (=> mapNonEmpty!13332 (= (arr!9167 _values!1208) (store mapRest!13332 mapKey!13332 mapValue!13332))))

(declare-fun b!354704 () Bool)

(declare-fun res!196642 () Bool)

(declare-fun e!217419 () Bool)

(assert (=> b!354704 (=> (not res!196642) (not e!217419))))

(declare-datatypes ((array!19349 0))(
  ( (array!19350 (arr!9168 (Array (_ BitVec 32) (_ BitVec 64))) (size!9520 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19349)

(declare-datatypes ((List!5307 0))(
  ( (Nil!5304) (Cons!5303 (h!6159 (_ BitVec 64)) (t!10457 List!5307)) )
))
(declare-fun arrayNoDuplicates!0 (array!19349 (_ BitVec 32) List!5307) Bool)

(assert (=> b!354704 (= res!196642 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5304))))

(declare-fun b!354705 () Bool)

(declare-fun res!196638 () Bool)

(assert (=> b!354705 (=> (not res!196638) (not e!217419))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!354705 (= res!196638 (= (select (arr!9168 _keys!1456) from!1805) k!1077))))

(declare-fun b!354706 () Bool)

(declare-fun e!217418 () Bool)

(declare-fun e!217420 () Bool)

(assert (=> b!354706 (= e!217418 (and e!217420 mapRes!13332))))

(declare-fun condMapEmpty!13332 () Bool)

(declare-fun mapDefault!13332 () ValueCell!3598)

