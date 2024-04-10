; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110810 () Bool)

(assert start!110810)

(declare-fun b_free!29645 () Bool)

(declare-fun b_next!29645 () Bool)

(assert (=> start!110810 (= b_free!29645 (not b_next!29645))))

(declare-fun tp!104256 () Bool)

(declare-fun b_and!47853 () Bool)

(assert (=> start!110810 (= tp!104256 b_and!47853)))

(declare-fun b!1311527 () Bool)

(declare-fun e!748202 () Bool)

(declare-fun tp_is_empty!35375 () Bool)

(assert (=> b!1311527 (= e!748202 tp_is_empty!35375)))

(declare-fun res!870672 () Bool)

(declare-fun e!748199 () Bool)

(assert (=> start!110810 (=> (not res!870672) (not e!748199))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110810 (= res!870672 (validMask!0 mask!2040))))

(assert (=> start!110810 e!748199))

(assert (=> start!110810 tp!104256))

(declare-datatypes ((array!87738 0))(
  ( (array!87739 (arr!42349 (Array (_ BitVec 32) (_ BitVec 64))) (size!42899 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87738)

(declare-fun array_inv!32003 (array!87738) Bool)

(assert (=> start!110810 (array_inv!32003 _keys!1628)))

(assert (=> start!110810 true))

(assert (=> start!110810 tp_is_empty!35375))

(declare-datatypes ((V!52269 0))(
  ( (V!52270 (val!17762 Int)) )
))
(declare-datatypes ((ValueCell!16789 0))(
  ( (ValueCellFull!16789 (v!20389 V!52269)) (EmptyCell!16789) )
))
(declare-datatypes ((array!87740 0))(
  ( (array!87741 (arr!42350 (Array (_ BitVec 32) ValueCell!16789)) (size!42900 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87740)

(declare-fun e!748198 () Bool)

(declare-fun array_inv!32004 (array!87740) Bool)

(assert (=> start!110810 (and (array_inv!32004 _values!1354) e!748198)))

(declare-fun mapNonEmpty!54691 () Bool)

(declare-fun mapRes!54691 () Bool)

(declare-fun tp!104257 () Bool)

(declare-fun e!748201 () Bool)

(assert (=> mapNonEmpty!54691 (= mapRes!54691 (and tp!104257 e!748201))))

(declare-fun mapRest!54691 () (Array (_ BitVec 32) ValueCell!16789))

(declare-fun mapValue!54691 () ValueCell!16789)

(declare-fun mapKey!54691 () (_ BitVec 32))

(assert (=> mapNonEmpty!54691 (= (arr!42350 _values!1354) (store mapRest!54691 mapKey!54691 mapValue!54691))))

(declare-fun b!1311528 () Bool)

(declare-fun res!870671 () Bool)

(assert (=> b!1311528 (=> (not res!870671) (not e!748199))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311528 (= res!870671 (and (= (size!42900 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42899 _keys!1628) (size!42900 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311529 () Bool)

(assert (=> b!1311529 (= e!748199 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun lt!585486 () Bool)

(declare-fun zeroValue!1296 () V!52269)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52269)

(declare-datatypes ((tuple2!22888 0))(
  ( (tuple2!22889 (_1!11455 (_ BitVec 64)) (_2!11455 V!52269)) )
))
(declare-datatypes ((List!30031 0))(
  ( (Nil!30028) (Cons!30027 (h!31236 tuple2!22888) (t!43637 List!30031)) )
))
(declare-datatypes ((ListLongMap!20545 0))(
  ( (ListLongMap!20546 (toList!10288 List!30031)) )
))
(declare-fun contains!8438 (ListLongMap!20545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5301 (array!87738 array!87740 (_ BitVec 32) (_ BitVec 32) V!52269 V!52269 (_ BitVec 32) Int) ListLongMap!20545)

(assert (=> b!1311529 (= lt!585486 (contains!8438 (getCurrentListMap!5301 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311530 () Bool)

(assert (=> b!1311530 (= e!748198 (and e!748202 mapRes!54691))))

(declare-fun condMapEmpty!54691 () Bool)

(declare-fun mapDefault!54691 () ValueCell!16789)

