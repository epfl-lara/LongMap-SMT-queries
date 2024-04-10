; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35514 () Bool)

(assert start!35514)

(declare-fun mapNonEmpty!13458 () Bool)

(declare-fun mapRes!13458 () Bool)

(declare-fun tp!27435 () Bool)

(declare-fun e!218048 () Bool)

(assert (=> mapNonEmpty!13458 (= mapRes!13458 (and tp!27435 e!218048))))

(declare-fun mapKey!13458 () (_ BitVec 32))

(declare-datatypes ((V!11599 0))(
  ( (V!11600 (val!4028 Int)) )
))
(declare-datatypes ((ValueCell!3640 0))(
  ( (ValueCellFull!3640 (v!6222 V!11599)) (EmptyCell!3640) )
))
(declare-fun mapRest!13458 () (Array (_ BitVec 32) ValueCell!3640))

(declare-datatypes ((array!19511 0))(
  ( (array!19512 (arr!9249 (Array (_ BitVec 32) ValueCell!3640)) (size!9601 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19511)

(declare-fun mapValue!13458 () ValueCell!3640)

(assert (=> mapNonEmpty!13458 (= (arr!9249 _values!1208) (store mapRest!13458 mapKey!13458 mapValue!13458))))

(declare-fun b!355898 () Bool)

(declare-fun res!197450 () Bool)

(declare-fun e!218051 () Bool)

(assert (=> b!355898 (=> (not res!197450) (not e!218051))))

(declare-datatypes ((array!19513 0))(
  ( (array!19514 (arr!9250 (Array (_ BitVec 32) (_ BitVec 64))) (size!9602 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19513)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19513 (_ BitVec 32)) Bool)

(assert (=> b!355898 (= res!197450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355899 () Bool)

(declare-fun e!218049 () Bool)

(declare-fun tp_is_empty!7967 () Bool)

(assert (=> b!355899 (= e!218049 tp_is_empty!7967)))

(declare-fun b!355900 () Bool)

(assert (=> b!355900 (= e!218051 false)))

(declare-fun lt!165866 () Bool)

(declare-datatypes ((List!5352 0))(
  ( (Nil!5349) (Cons!5348 (h!6204 (_ BitVec 64)) (t!10502 List!5352)) )
))
(declare-fun arrayNoDuplicates!0 (array!19513 (_ BitVec 32) List!5352) Bool)

(assert (=> b!355900 (= lt!165866 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5349))))

(declare-fun b!355901 () Bool)

(assert (=> b!355901 (= e!218048 tp_is_empty!7967)))

(declare-fun res!197452 () Bool)

(assert (=> start!35514 (=> (not res!197452) (not e!218051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35514 (= res!197452 (validMask!0 mask!1842))))

(assert (=> start!35514 e!218051))

(assert (=> start!35514 true))

(declare-fun e!218047 () Bool)

(declare-fun array_inv!6798 (array!19511) Bool)

(assert (=> start!35514 (and (array_inv!6798 _values!1208) e!218047)))

(declare-fun array_inv!6799 (array!19513) Bool)

(assert (=> start!35514 (array_inv!6799 _keys!1456)))

(declare-fun b!355902 () Bool)

(declare-fun res!197451 () Bool)

(assert (=> b!355902 (=> (not res!197451) (not e!218051))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355902 (= res!197451 (and (= (size!9601 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9602 _keys!1456) (size!9601 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13458 () Bool)

(assert (=> mapIsEmpty!13458 mapRes!13458))

(declare-fun b!355903 () Bool)

(assert (=> b!355903 (= e!218047 (and e!218049 mapRes!13458))))

(declare-fun condMapEmpty!13458 () Bool)

(declare-fun mapDefault!13458 () ValueCell!3640)

