; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111064 () Bool)

(assert start!111064)

(declare-fun b_free!29899 () Bool)

(declare-fun b_next!29899 () Bool)

(assert (=> start!111064 (= b_free!29899 (not b_next!29899))))

(declare-fun tp!105018 () Bool)

(declare-fun b_and!48107 () Bool)

(assert (=> start!111064 (= tp!105018 b_and!48107)))

(declare-fun b!1314962 () Bool)

(declare-fun e!750105 () Bool)

(declare-fun tp_is_empty!35629 () Bool)

(assert (=> b!1314962 (= e!750105 tp_is_empty!35629)))

(declare-fun mapIsEmpty!55072 () Bool)

(declare-fun mapRes!55072 () Bool)

(assert (=> mapIsEmpty!55072 mapRes!55072))

(declare-fun b!1314963 () Bool)

(declare-fun res!872961 () Bool)

(declare-fun e!750104 () Bool)

(assert (=> b!1314963 (=> (not res!872961) (not e!750104))))

(declare-datatypes ((array!88222 0))(
  ( (array!88223 (arr!42591 (Array (_ BitVec 32) (_ BitVec 64))) (size!43141 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88222)

(declare-datatypes ((List!30208 0))(
  ( (Nil!30205) (Cons!30204 (h!31413 (_ BitVec 64)) (t!43814 List!30208)) )
))
(declare-fun arrayNoDuplicates!0 (array!88222 (_ BitVec 32) List!30208) Bool)

(assert (=> b!1314963 (= res!872961 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30205))))

(declare-fun b!1314964 () Bool)

(declare-fun e!750103 () Bool)

(assert (=> b!1314964 (= e!750103 tp_is_empty!35629)))

(declare-fun b!1314965 () Bool)

(declare-fun res!872962 () Bool)

(assert (=> b!1314965 (=> (not res!872962) (not e!750104))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52609 0))(
  ( (V!52610 (val!17889 Int)) )
))
(declare-datatypes ((ValueCell!16916 0))(
  ( (ValueCellFull!16916 (v!20516 V!52609)) (EmptyCell!16916) )
))
(declare-datatypes ((array!88224 0))(
  ( (array!88225 (arr!42592 (Array (_ BitVec 32) ValueCell!16916)) (size!43142 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88224)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314965 (= res!872962 (and (= (size!43142 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43141 _keys!1628) (size!43142 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55072 () Bool)

(declare-fun tp!105019 () Bool)

(assert (=> mapNonEmpty!55072 (= mapRes!55072 (and tp!105019 e!750103))))

(declare-fun mapRest!55072 () (Array (_ BitVec 32) ValueCell!16916))

(declare-fun mapKey!55072 () (_ BitVec 32))

(declare-fun mapValue!55072 () ValueCell!16916)

(assert (=> mapNonEmpty!55072 (= (arr!42592 _values!1354) (store mapRest!55072 mapKey!55072 mapValue!55072))))

(declare-fun res!872964 () Bool)

(assert (=> start!111064 (=> (not res!872964) (not e!750104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111064 (= res!872964 (validMask!0 mask!2040))))

(assert (=> start!111064 e!750104))

(assert (=> start!111064 tp!105018))

(declare-fun array_inv!32165 (array!88222) Bool)

(assert (=> start!111064 (array_inv!32165 _keys!1628)))

(assert (=> start!111064 true))

(assert (=> start!111064 tp_is_empty!35629))

(declare-fun e!750106 () Bool)

(declare-fun array_inv!32166 (array!88224) Bool)

(assert (=> start!111064 (and (array_inv!32166 _values!1354) e!750106)))

(declare-fun b!1314966 () Bool)

(declare-fun res!872963 () Bool)

(assert (=> b!1314966 (=> (not res!872963) (not e!750104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88222 (_ BitVec 32)) Bool)

(assert (=> b!1314966 (= res!872963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314967 () Bool)

(assert (=> b!1314967 (= e!750106 (and e!750105 mapRes!55072))))

(declare-fun condMapEmpty!55072 () Bool)

(declare-fun mapDefault!55072 () ValueCell!16916)

