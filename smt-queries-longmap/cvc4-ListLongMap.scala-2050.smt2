; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35472 () Bool)

(assert start!35472)

(declare-fun b_free!7859 () Bool)

(declare-fun b_next!7859 () Bool)

(assert (=> start!35472 (= b_free!7859 (not b_next!7859))))

(declare-fun tp!27363 () Bool)

(declare-fun b_and!15101 () Bool)

(assert (=> start!35472 (= tp!27363 b_and!15101)))

(declare-fun b!355460 () Bool)

(declare-fun res!197207 () Bool)

(declare-fun e!217732 () Bool)

(assert (=> b!355460 (=> (not res!197207) (not e!217732))))

(declare-datatypes ((array!19429 0))(
  ( (array!19430 (arr!9208 (Array (_ BitVec 32) (_ BitVec 64))) (size!9560 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19429)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355460 (= res!197207 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!355461 () Bool)

(declare-fun e!217736 () Bool)

(declare-fun tp_is_empty!7925 () Bool)

(assert (=> b!355461 (= e!217736 tp_is_empty!7925)))

(declare-fun b!355462 () Bool)

(declare-fun res!197202 () Bool)

(assert (=> b!355462 (=> (not res!197202) (not e!217732))))

(assert (=> b!355462 (= res!197202 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9560 _keys!1456))))))

(declare-fun b!355463 () Bool)

(declare-fun res!197206 () Bool)

(assert (=> b!355463 (=> (not res!197206) (not e!217732))))

(assert (=> b!355463 (= res!197206 (= (select (arr!9208 _keys!1456) from!1805) k!1077))))

(declare-fun mapIsEmpty!13395 () Bool)

(declare-fun mapRes!13395 () Bool)

(assert (=> mapIsEmpty!13395 mapRes!13395))

(declare-fun b!355464 () Bool)

(declare-fun res!197205 () Bool)

(assert (=> b!355464 (=> (not res!197205) (not e!217732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355464 (= res!197205 (validKeyInArray!0 k!1077))))

(declare-fun res!197204 () Bool)

(assert (=> start!35472 (=> (not res!197204) (not e!217732))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35472 (= res!197204 (validMask!0 mask!1842))))

(assert (=> start!35472 e!217732))

(assert (=> start!35472 tp_is_empty!7925))

(assert (=> start!35472 true))

(assert (=> start!35472 tp!27363))

(declare-fun array_inv!6766 (array!19429) Bool)

(assert (=> start!35472 (array_inv!6766 _keys!1456)))

(declare-datatypes ((V!11543 0))(
  ( (V!11544 (val!4007 Int)) )
))
(declare-datatypes ((ValueCell!3619 0))(
  ( (ValueCellFull!3619 (v!6201 V!11543)) (EmptyCell!3619) )
))
(declare-datatypes ((array!19431 0))(
  ( (array!19432 (arr!9209 (Array (_ BitVec 32) ValueCell!3619)) (size!9561 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19431)

(declare-fun e!217733 () Bool)

(declare-fun array_inv!6767 (array!19431) Bool)

(assert (=> start!35472 (and (array_inv!6767 _values!1208) e!217733)))

(declare-fun b!355465 () Bool)

(declare-fun res!197203 () Bool)

(assert (=> b!355465 (=> (not res!197203) (not e!217732))))

(assert (=> b!355465 (= res!197203 (validKeyInArray!0 (select (arr!9208 _keys!1456) from!1805)))))

(declare-fun mapNonEmpty!13395 () Bool)

(declare-fun tp!27362 () Bool)

(declare-fun e!217734 () Bool)

(assert (=> mapNonEmpty!13395 (= mapRes!13395 (and tp!27362 e!217734))))

(declare-fun mapRest!13395 () (Array (_ BitVec 32) ValueCell!3619))

(declare-fun mapValue!13395 () ValueCell!3619)

(declare-fun mapKey!13395 () (_ BitVec 32))

(assert (=> mapNonEmpty!13395 (= (arr!9209 _values!1208) (store mapRest!13395 mapKey!13395 mapValue!13395))))

(declare-fun b!355466 () Bool)

(assert (=> b!355466 (= e!217733 (and e!217736 mapRes!13395))))

(declare-fun condMapEmpty!13395 () Bool)

(declare-fun mapDefault!13395 () ValueCell!3619)

