; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43252 () Bool)

(assert start!43252)

(declare-fun b_free!12119 () Bool)

(declare-fun b_next!12119 () Bool)

(assert (=> start!43252 (= b_free!12119 (not b_next!12119))))

(declare-fun tp!42628 () Bool)

(declare-fun b_and!20871 () Bool)

(assert (=> start!43252 (= tp!42628 b_and!20871)))

(declare-fun b!479216 () Bool)

(declare-fun res!285861 () Bool)

(declare-fun e!281908 () Bool)

(assert (=> b!479216 (=> (not res!285861) (not e!281908))))

(declare-datatypes ((array!30935 0))(
  ( (array!30936 (arr!14874 (Array (_ BitVec 32) (_ BitVec 64))) (size!15232 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30935)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30935 (_ BitVec 32)) Bool)

(assert (=> b!479216 (= res!285861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285864 () Bool)

(assert (=> start!43252 (=> (not res!285864) (not e!281908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43252 (= res!285864 (validMask!0 mask!2352))))

(assert (=> start!43252 e!281908))

(assert (=> start!43252 true))

(declare-fun tp_is_empty!13631 () Bool)

(assert (=> start!43252 tp_is_empty!13631))

(declare-datatypes ((V!19245 0))(
  ( (V!19246 (val!6863 Int)) )
))
(declare-datatypes ((ValueCell!6454 0))(
  ( (ValueCellFull!6454 (v!9152 V!19245)) (EmptyCell!6454) )
))
(declare-datatypes ((array!30937 0))(
  ( (array!30938 (arr!14875 (Array (_ BitVec 32) ValueCell!6454)) (size!15233 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30937)

(declare-fun e!281909 () Bool)

(declare-fun array_inv!10732 (array!30937) Bool)

(assert (=> start!43252 (and (array_inv!10732 _values!1516) e!281909)))

(assert (=> start!43252 tp!42628))

(declare-fun array_inv!10733 (array!30935) Bool)

(assert (=> start!43252 (array_inv!10733 _keys!1874)))

(declare-fun b!479217 () Bool)

(declare-fun res!285862 () Bool)

(assert (=> b!479217 (=> (not res!285862) (not e!281908))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479217 (= res!285862 (and (= (size!15233 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15232 _keys!1874) (size!15233 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22144 () Bool)

(declare-fun mapRes!22144 () Bool)

(assert (=> mapIsEmpty!22144 mapRes!22144))

(declare-fun mapNonEmpty!22144 () Bool)

(declare-fun tp!42627 () Bool)

(declare-fun e!281906 () Bool)

(assert (=> mapNonEmpty!22144 (= mapRes!22144 (and tp!42627 e!281906))))

(declare-fun mapValue!22144 () ValueCell!6454)

(declare-fun mapRest!22144 () (Array (_ BitVec 32) ValueCell!6454))

(declare-fun mapKey!22144 () (_ BitVec 32))

(assert (=> mapNonEmpty!22144 (= (arr!14875 _values!1516) (store mapRest!22144 mapKey!22144 mapValue!22144))))

(declare-fun b!479218 () Bool)

(declare-fun e!281907 () Bool)

(assert (=> b!479218 (= e!281907 tp_is_empty!13631)))

(declare-fun b!479219 () Bool)

(declare-fun res!285863 () Bool)

(assert (=> b!479219 (=> (not res!285863) (not e!281908))))

(declare-datatypes ((List!9085 0))(
  ( (Nil!9082) (Cons!9081 (h!9937 (_ BitVec 64)) (t!15291 List!9085)) )
))
(declare-fun arrayNoDuplicates!0 (array!30935 (_ BitVec 32) List!9085) Bool)

(assert (=> b!479219 (= res!285863 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9082))))

(declare-fun b!479220 () Bool)

(assert (=> b!479220 (= e!281908 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!217831 () Bool)

(declare-fun minValue!1458 () V!19245)

(declare-fun zeroValue!1458 () V!19245)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9006 0))(
  ( (tuple2!9007 (_1!4514 (_ BitVec 64)) (_2!4514 V!19245)) )
))
(declare-datatypes ((List!9086 0))(
  ( (Nil!9083) (Cons!9082 (h!9938 tuple2!9006) (t!15292 List!9086)) )
))
(declare-datatypes ((ListLongMap!7919 0))(
  ( (ListLongMap!7920 (toList!3975 List!9086)) )
))
(declare-fun contains!2585 (ListLongMap!7919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2294 (array!30935 array!30937 (_ BitVec 32) (_ BitVec 32) V!19245 V!19245 (_ BitVec 32) Int) ListLongMap!7919)

(assert (=> b!479220 (= lt!217831 (contains!2585 (getCurrentListMap!2294 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479221 () Bool)

(assert (=> b!479221 (= e!281906 tp_is_empty!13631)))

(declare-fun b!479222 () Bool)

(assert (=> b!479222 (= e!281909 (and e!281907 mapRes!22144))))

(declare-fun condMapEmpty!22144 () Bool)

(declare-fun mapDefault!22144 () ValueCell!6454)

