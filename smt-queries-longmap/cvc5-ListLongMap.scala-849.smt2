; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20190 () Bool)

(assert start!20190)

(declare-fun b_free!4849 () Bool)

(declare-fun b_next!4849 () Bool)

(assert (=> start!20190 (= b_free!4849 (not b_next!4849))))

(declare-fun tp!17579 () Bool)

(declare-fun b_and!11595 () Bool)

(assert (=> start!20190 (= tp!17579 b_and!11595)))

(declare-fun b!198284 () Bool)

(declare-fun e!130347 () Bool)

(declare-fun tp_is_empty!4705 () Bool)

(assert (=> b!198284 (= e!130347 tp_is_empty!4705)))

(declare-fun b!198285 () Bool)

(declare-fun e!130345 () Bool)

(assert (=> b!198285 (= e!130345 tp_is_empty!4705)))

(declare-fun b!198286 () Bool)

(declare-fun e!130348 () Bool)

(assert (=> b!198286 (= e!130348 false)))

(declare-datatypes ((V!5921 0))(
  ( (V!5922 (val!2397 Int)) )
))
(declare-datatypes ((tuple2!3636 0))(
  ( (tuple2!3637 (_1!1829 (_ BitVec 64)) (_2!1829 V!5921)) )
))
(declare-datatypes ((List!2551 0))(
  ( (Nil!2548) (Cons!2547 (h!3189 tuple2!3636) (t!7482 List!2551)) )
))
(declare-datatypes ((ListLongMap!2549 0))(
  ( (ListLongMap!2550 (toList!1290 List!2551)) )
))
(declare-fun lt!97887 () ListLongMap!2549)

(declare-datatypes ((ValueCell!2009 0))(
  ( (ValueCellFull!2009 (v!4367 V!5921)) (EmptyCell!2009) )
))
(declare-datatypes ((array!8659 0))(
  ( (array!8660 (arr!4080 (Array (_ BitVec 32) ValueCell!2009)) (size!4405 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8659)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5921)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5921)

(declare-datatypes ((array!8661 0))(
  ( (array!8662 (arr!4081 (Array (_ BitVec 32) (_ BitVec 64))) (size!4406 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8661)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5921)

(declare-fun getCurrentListMapNoExtraKeys!255 (array!8661 array!8659 (_ BitVec 32) (_ BitVec 32) V!5921 V!5921 (_ BitVec 32) Int) ListLongMap!2549)

(assert (=> b!198286 (= lt!97887 (getCurrentListMapNoExtraKeys!255 _keys!825 (array!8660 (store (arr!4080 _values!649) i!601 (ValueCellFull!2009 v!520)) (size!4405 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97886 () ListLongMap!2549)

(assert (=> b!198286 (= lt!97886 (getCurrentListMapNoExtraKeys!255 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198287 () Bool)

(declare-fun res!93980 () Bool)

(assert (=> b!198287 (=> (not res!93980) (not e!130348))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198287 (= res!93980 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8126 () Bool)

(declare-fun mapRes!8126 () Bool)

(declare-fun tp!17578 () Bool)

(assert (=> mapNonEmpty!8126 (= mapRes!8126 (and tp!17578 e!130347))))

(declare-fun mapValue!8126 () ValueCell!2009)

(declare-fun mapKey!8126 () (_ BitVec 32))

(declare-fun mapRest!8126 () (Array (_ BitVec 32) ValueCell!2009))

(assert (=> mapNonEmpty!8126 (= (arr!4080 _values!649) (store mapRest!8126 mapKey!8126 mapValue!8126))))

(declare-fun b!198288 () Bool)

(declare-fun res!93985 () Bool)

(assert (=> b!198288 (=> (not res!93985) (not e!130348))))

(assert (=> b!198288 (= res!93985 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4406 _keys!825))))))

(declare-fun b!198289 () Bool)

(declare-fun res!93979 () Bool)

(assert (=> b!198289 (=> (not res!93979) (not e!130348))))

(assert (=> b!198289 (= res!93979 (= (select (arr!4081 _keys!825) i!601) k!843))))

(declare-fun res!93982 () Bool)

(assert (=> start!20190 (=> (not res!93982) (not e!130348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20190 (= res!93982 (validMask!0 mask!1149))))

(assert (=> start!20190 e!130348))

(declare-fun e!130346 () Bool)

(declare-fun array_inv!2669 (array!8659) Bool)

(assert (=> start!20190 (and (array_inv!2669 _values!649) e!130346)))

(assert (=> start!20190 true))

(assert (=> start!20190 tp_is_empty!4705))

(declare-fun array_inv!2670 (array!8661) Bool)

(assert (=> start!20190 (array_inv!2670 _keys!825)))

(assert (=> start!20190 tp!17579))

(declare-fun b!198290 () Bool)

(declare-fun res!93984 () Bool)

(assert (=> b!198290 (=> (not res!93984) (not e!130348))))

(assert (=> b!198290 (= res!93984 (and (= (size!4405 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4406 _keys!825) (size!4405 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198291 () Bool)

(assert (=> b!198291 (= e!130346 (and e!130345 mapRes!8126))))

(declare-fun condMapEmpty!8126 () Bool)

(declare-fun mapDefault!8126 () ValueCell!2009)

