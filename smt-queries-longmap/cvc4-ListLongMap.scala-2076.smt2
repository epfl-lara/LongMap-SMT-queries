; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35628 () Bool)

(assert start!35628)

(declare-fun b_free!7883 () Bool)

(declare-fun b_next!7883 () Bool)

(assert (=> start!35628 (= b_free!7883 (not b_next!7883))))

(declare-fun tp!27633 () Bool)

(declare-fun b_and!15125 () Bool)

(assert (=> start!35628 (= tp!27633 b_and!15125)))

(declare-fun mapNonEmpty!13629 () Bool)

(declare-fun mapRes!13629 () Bool)

(declare-fun tp!27632 () Bool)

(declare-fun e!218931 () Bool)

(assert (=> mapNonEmpty!13629 (= mapRes!13629 (and tp!27632 e!218931))))

(declare-datatypes ((V!11751 0))(
  ( (V!11752 (val!4085 Int)) )
))
(declare-datatypes ((ValueCell!3697 0))(
  ( (ValueCellFull!3697 (v!6279 V!11751)) (EmptyCell!3697) )
))
(declare-fun mapRest!13629 () (Array (_ BitVec 32) ValueCell!3697))

(declare-fun mapKey!13629 () (_ BitVec 32))

(declare-datatypes ((array!19729 0))(
  ( (array!19730 (arr!9358 (Array (_ BitVec 32) ValueCell!3697)) (size!9710 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19729)

(declare-fun mapValue!13629 () ValueCell!3697)

(assert (=> mapNonEmpty!13629 (= (arr!9358 _values!1208) (store mapRest!13629 mapKey!13629 mapValue!13629))))

(declare-fun b!357575 () Bool)

(declare-fun res!198619 () Bool)

(declare-fun e!218928 () Bool)

(assert (=> b!357575 (=> (not res!198619) (not e!218928))))

(declare-datatypes ((array!19731 0))(
  ( (array!19732 (arr!9359 (Array (_ BitVec 32) (_ BitVec 64))) (size!9711 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19731)

(declare-datatypes ((List!5401 0))(
  ( (Nil!5398) (Cons!5397 (h!6253 (_ BitVec 64)) (t!10551 List!5401)) )
))
(declare-fun arrayNoDuplicates!0 (array!19731 (_ BitVec 32) List!5401) Bool)

(assert (=> b!357575 (= res!198619 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5398))))

(declare-fun b!357576 () Bool)

(declare-fun res!198614 () Bool)

(assert (=> b!357576 (=> (not res!198614) (not e!218928))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357576 (= res!198614 (validKeyInArray!0 k!1077))))

(declare-fun b!357577 () Bool)

(declare-fun tp_is_empty!8081 () Bool)

(assert (=> b!357577 (= e!218931 tp_is_empty!8081)))

(declare-fun b!357578 () Bool)

(declare-fun res!198617 () Bool)

(assert (=> b!357578 (=> (not res!198617) (not e!218928))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!357578 (= res!198617 (and (= (size!9710 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9711 _keys!1456) (size!9710 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357579 () Bool)

(declare-fun e!218932 () Bool)

(assert (=> b!357579 (= e!218932 tp_is_empty!8081)))

(declare-fun b!357580 () Bool)

(declare-fun e!218933 () Bool)

(assert (=> b!357580 (= e!218933 (and e!218932 mapRes!13629))))

(declare-fun condMapEmpty!13629 () Bool)

(declare-fun mapDefault!13629 () ValueCell!3697)

