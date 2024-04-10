; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20196 () Bool)

(assert start!20196)

(declare-fun b_free!4855 () Bool)

(declare-fun b_next!4855 () Bool)

(assert (=> start!20196 (= b_free!4855 (not b_next!4855))))

(declare-fun tp!17596 () Bool)

(declare-fun b_and!11601 () Bool)

(assert (=> start!20196 (= tp!17596 b_and!11601)))

(declare-fun b!198374 () Bool)

(declare-fun res!94045 () Bool)

(declare-fun e!130390 () Bool)

(assert (=> b!198374 (=> (not res!94045) (not e!130390))))

(declare-datatypes ((array!8671 0))(
  ( (array!8672 (arr!4086 (Array (_ BitVec 32) (_ BitVec 64))) (size!4411 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8671)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198374 (= res!94045 (= (select (arr!4086 _keys!825) i!601) k!843))))

(declare-fun res!94043 () Bool)

(assert (=> start!20196 (=> (not res!94043) (not e!130390))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20196 (= res!94043 (validMask!0 mask!1149))))

(assert (=> start!20196 e!130390))

(declare-datatypes ((V!5929 0))(
  ( (V!5930 (val!2400 Int)) )
))
(declare-datatypes ((ValueCell!2012 0))(
  ( (ValueCellFull!2012 (v!4370 V!5929)) (EmptyCell!2012) )
))
(declare-datatypes ((array!8673 0))(
  ( (array!8674 (arr!4087 (Array (_ BitVec 32) ValueCell!2012)) (size!4412 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8673)

(declare-fun e!130391 () Bool)

(declare-fun array_inv!2675 (array!8673) Bool)

(assert (=> start!20196 (and (array_inv!2675 _values!649) e!130391)))

(assert (=> start!20196 true))

(declare-fun tp_is_empty!4711 () Bool)

(assert (=> start!20196 tp_is_empty!4711))

(declare-fun array_inv!2676 (array!8671) Bool)

(assert (=> start!20196 (array_inv!2676 _keys!825)))

(assert (=> start!20196 tp!17596))

(declare-fun mapIsEmpty!8135 () Bool)

(declare-fun mapRes!8135 () Bool)

(assert (=> mapIsEmpty!8135 mapRes!8135))

(declare-fun b!198375 () Bool)

(declare-fun e!130394 () Bool)

(assert (=> b!198375 (= e!130394 tp_is_empty!4711)))

(declare-fun b!198376 () Bool)

(declare-fun res!94044 () Bool)

(assert (=> b!198376 (=> (not res!94044) (not e!130390))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198376 (= res!94044 (and (= (size!4412 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4411 _keys!825) (size!4412 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198377 () Bool)

(declare-fun res!94046 () Bool)

(assert (=> b!198377 (=> (not res!94046) (not e!130390))))

(assert (=> b!198377 (= res!94046 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4411 _keys!825))))))

(declare-fun b!198378 () Bool)

(declare-fun res!94042 () Bool)

(assert (=> b!198378 (=> (not res!94042) (not e!130390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198378 (= res!94042 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8135 () Bool)

(declare-fun tp!17597 () Bool)

(declare-fun e!130392 () Bool)

(assert (=> mapNonEmpty!8135 (= mapRes!8135 (and tp!17597 e!130392))))

(declare-fun mapKey!8135 () (_ BitVec 32))

(declare-fun mapValue!8135 () ValueCell!2012)

(declare-fun mapRest!8135 () (Array (_ BitVec 32) ValueCell!2012))

(assert (=> mapNonEmpty!8135 (= (arr!4087 _values!649) (store mapRest!8135 mapKey!8135 mapValue!8135))))

(declare-fun b!198379 () Bool)

(assert (=> b!198379 (= e!130390 false)))

(declare-datatypes ((tuple2!3642 0))(
  ( (tuple2!3643 (_1!1832 (_ BitVec 64)) (_2!1832 V!5929)) )
))
(declare-datatypes ((List!2556 0))(
  ( (Nil!2553) (Cons!2552 (h!3194 tuple2!3642) (t!7487 List!2556)) )
))
(declare-datatypes ((ListLongMap!2555 0))(
  ( (ListLongMap!2556 (toList!1293 List!2556)) )
))
(declare-fun lt!97904 () ListLongMap!2555)

(declare-fun v!520 () V!5929)

(declare-fun zeroValue!615 () V!5929)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5929)

(declare-fun getCurrentListMapNoExtraKeys!258 (array!8671 array!8673 (_ BitVec 32) (_ BitVec 32) V!5929 V!5929 (_ BitVec 32) Int) ListLongMap!2555)

(assert (=> b!198379 (= lt!97904 (getCurrentListMapNoExtraKeys!258 _keys!825 (array!8674 (store (arr!4087 _values!649) i!601 (ValueCellFull!2012 v!520)) (size!4412 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97905 () ListLongMap!2555)

(assert (=> b!198379 (= lt!97905 (getCurrentListMapNoExtraKeys!258 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198380 () Bool)

(assert (=> b!198380 (= e!130391 (and e!130394 mapRes!8135))))

(declare-fun condMapEmpty!8135 () Bool)

(declare-fun mapDefault!8135 () ValueCell!2012)

