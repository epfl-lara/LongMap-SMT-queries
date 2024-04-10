; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43388 () Bool)

(assert start!43388)

(declare-fun b_free!12215 () Bool)

(declare-fun b_next!12215 () Bool)

(assert (=> start!43388 (= b_free!12215 (not b_next!12215))))

(declare-fun tp!42922 () Bool)

(declare-fun b_and!20971 () Bool)

(assert (=> start!43388 (= tp!42922 b_and!20971)))

(declare-fun b!480759 () Bool)

(declare-fun e!282869 () Bool)

(declare-fun tp_is_empty!13727 () Bool)

(assert (=> b!480759 (= e!282869 tp_is_empty!13727)))

(declare-fun b!480760 () Bool)

(declare-fun res!286692 () Bool)

(declare-fun e!282868 () Bool)

(assert (=> b!480760 (=> (not res!286692) (not e!282868))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19373 0))(
  ( (V!19374 (val!6911 Int)) )
))
(declare-fun minValue!1458 () V!19373)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19373)

(declare-datatypes ((ValueCell!6502 0))(
  ( (ValueCellFull!6502 (v!9202 V!19373)) (EmptyCell!6502) )
))
(declare-datatypes ((array!31119 0))(
  ( (array!31120 (arr!14964 (Array (_ BitVec 32) ValueCell!6502)) (size!15322 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31119)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31121 0))(
  ( (array!31122 (arr!14965 (Array (_ BitVec 32) (_ BitVec 64))) (size!15323 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31121)

(declare-datatypes ((tuple2!9070 0))(
  ( (tuple2!9071 (_1!4546 (_ BitVec 64)) (_2!4546 V!19373)) )
))
(declare-datatypes ((List!9147 0))(
  ( (Nil!9144) (Cons!9143 (h!9999 tuple2!9070) (t!15357 List!9147)) )
))
(declare-datatypes ((ListLongMap!7983 0))(
  ( (ListLongMap!7984 (toList!4007 List!9147)) )
))
(declare-fun contains!2619 (ListLongMap!7983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2326 (array!31121 array!31119 (_ BitVec 32) (_ BitVec 32) V!19373 V!19373 (_ BitVec 32) Int) ListLongMap!7983)

(assert (=> b!480760 (= res!286692 (contains!2619 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapNonEmpty!22294 () Bool)

(declare-fun mapRes!22294 () Bool)

(declare-fun tp!42921 () Bool)

(declare-fun e!282870 () Bool)

(assert (=> mapNonEmpty!22294 (= mapRes!22294 (and tp!42921 e!282870))))

(declare-fun mapRest!22294 () (Array (_ BitVec 32) ValueCell!6502))

(declare-fun mapKey!22294 () (_ BitVec 32))

(declare-fun mapValue!22294 () ValueCell!6502)

(assert (=> mapNonEmpty!22294 (= (arr!14964 _values!1516) (store mapRest!22294 mapKey!22294 mapValue!22294))))

(declare-fun res!286695 () Bool)

(assert (=> start!43388 (=> (not res!286695) (not e!282868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43388 (= res!286695 (validMask!0 mask!2352))))

(assert (=> start!43388 e!282868))

(assert (=> start!43388 true))

(assert (=> start!43388 tp_is_empty!13727))

(declare-fun e!282873 () Bool)

(declare-fun array_inv!10792 (array!31119) Bool)

(assert (=> start!43388 (and (array_inv!10792 _values!1516) e!282873)))

(assert (=> start!43388 tp!42922))

(declare-fun array_inv!10793 (array!31121) Bool)

(assert (=> start!43388 (array_inv!10793 _keys!1874)))

(declare-fun b!480761 () Bool)

(assert (=> b!480761 (= e!282868 (not true))))

(declare-fun lt!218217 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31121 (_ BitVec 32)) Bool)

(assert (=> b!480761 (arrayForallSeekEntryOrOpenFound!0 lt!218217 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14098 0))(
  ( (Unit!14099) )
))
(declare-fun lt!218216 () Unit!14098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14098)

(assert (=> b!480761 (= lt!218216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218217))))

(declare-fun arrayScanForKey!0 (array!31121 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480761 (= lt!218217 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!282872 () Bool)

(assert (=> b!480761 e!282872))

(declare-fun c!57808 () Bool)

(assert (=> b!480761 (= c!57808 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218218 () Unit!14098)

(declare-fun lemmaKeyInListMapIsInArray!122 (array!31121 array!31119 (_ BitVec 32) (_ BitVec 32) V!19373 V!19373 (_ BitVec 64) Int) Unit!14098)

(assert (=> b!480761 (= lt!218218 (lemmaKeyInListMapIsInArray!122 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!480762 () Bool)

(declare-fun arrayContainsKey!0 (array!31121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480762 (= e!282872 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!480763 () Bool)

(declare-fun res!286691 () Bool)

(assert (=> b!480763 (=> (not res!286691) (not e!282868))))

(assert (=> b!480763 (= res!286691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480764 () Bool)

(declare-fun res!286694 () Bool)

(assert (=> b!480764 (=> (not res!286694) (not e!282868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480764 (= res!286694 (validKeyInArray!0 k!1332))))

(declare-fun b!480765 () Bool)

(assert (=> b!480765 (= e!282870 tp_is_empty!13727)))

(declare-fun b!480766 () Bool)

(declare-fun res!286693 () Bool)

(assert (=> b!480766 (=> (not res!286693) (not e!282868))))

(declare-datatypes ((List!9148 0))(
  ( (Nil!9145) (Cons!9144 (h!10000 (_ BitVec 64)) (t!15358 List!9148)) )
))
(declare-fun arrayNoDuplicates!0 (array!31121 (_ BitVec 32) List!9148) Bool)

(assert (=> b!480766 (= res!286693 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9145))))

(declare-fun b!480767 () Bool)

(assert (=> b!480767 (= e!282873 (and e!282869 mapRes!22294))))

(declare-fun condMapEmpty!22294 () Bool)

(declare-fun mapDefault!22294 () ValueCell!6502)

