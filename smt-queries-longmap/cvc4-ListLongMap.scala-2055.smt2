; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35502 () Bool)

(assert start!35502)

(declare-fun mapIsEmpty!13440 () Bool)

(declare-fun mapRes!13440 () Bool)

(assert (=> mapIsEmpty!13440 mapRes!13440))

(declare-fun b!355790 () Bool)

(declare-fun e!217961 () Bool)

(declare-fun tp_is_empty!7955 () Bool)

(assert (=> b!355790 (= e!217961 tp_is_empty!7955)))

(declare-fun res!197397 () Bool)

(declare-fun e!217959 () Bool)

(assert (=> start!35502 (=> (not res!197397) (not e!217959))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35502 (= res!197397 (validMask!0 mask!1842))))

(assert (=> start!35502 e!217959))

(assert (=> start!35502 true))

(declare-datatypes ((V!11583 0))(
  ( (V!11584 (val!4022 Int)) )
))
(declare-datatypes ((ValueCell!3634 0))(
  ( (ValueCellFull!3634 (v!6216 V!11583)) (EmptyCell!3634) )
))
(declare-datatypes ((array!19487 0))(
  ( (array!19488 (arr!9237 (Array (_ BitVec 32) ValueCell!3634)) (size!9589 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19487)

(declare-fun e!217960 () Bool)

(declare-fun array_inv!6790 (array!19487) Bool)

(assert (=> start!35502 (and (array_inv!6790 _values!1208) e!217960)))

(declare-datatypes ((array!19489 0))(
  ( (array!19490 (arr!9238 (Array (_ BitVec 32) (_ BitVec 64))) (size!9590 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19489)

(declare-fun array_inv!6791 (array!19489) Bool)

(assert (=> start!35502 (array_inv!6791 _keys!1456)))

(declare-fun b!355791 () Bool)

(declare-fun res!197398 () Bool)

(assert (=> b!355791 (=> (not res!197398) (not e!217959))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355791 (= res!197398 (and (= (size!9589 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9590 _keys!1456) (size!9589 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355792 () Bool)

(declare-fun res!197396 () Bool)

(assert (=> b!355792 (=> (not res!197396) (not e!217959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19489 (_ BitVec 32)) Bool)

(assert (=> b!355792 (= res!197396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13440 () Bool)

(declare-fun tp!27417 () Bool)

(assert (=> mapNonEmpty!13440 (= mapRes!13440 (and tp!27417 e!217961))))

(declare-fun mapKey!13440 () (_ BitVec 32))

(declare-fun mapValue!13440 () ValueCell!3634)

(declare-fun mapRest!13440 () (Array (_ BitVec 32) ValueCell!3634))

(assert (=> mapNonEmpty!13440 (= (arr!9237 _values!1208) (store mapRest!13440 mapKey!13440 mapValue!13440))))

(declare-fun b!355793 () Bool)

(declare-fun e!217957 () Bool)

(assert (=> b!355793 (= e!217960 (and e!217957 mapRes!13440))))

(declare-fun condMapEmpty!13440 () Bool)

(declare-fun mapDefault!13440 () ValueCell!3634)

