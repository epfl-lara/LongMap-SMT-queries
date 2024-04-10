; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3930 () Bool)

(assert start!3930)

(declare-fun b_free!835 () Bool)

(declare-fun b_next!835 () Bool)

(assert (=> start!3930 (= b_free!835 (not b_next!835))))

(declare-fun tp!3925 () Bool)

(declare-fun b_and!1645 () Bool)

(assert (=> start!3930 (= tp!3925 b_and!1645)))

(declare-fun b!27906 () Bool)

(declare-fun res!16569 () Bool)

(declare-fun e!18113 () Bool)

(assert (=> b!27906 (=> (not res!16569) (not e!18113))))

(declare-datatypes ((array!1619 0))(
  ( (array!1620 (arr!763 (Array (_ BitVec 32) (_ BitVec 64))) (size!864 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1619)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1619 (_ BitVec 32)) Bool)

(assert (=> b!27906 (= res!16569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27907 () Bool)

(assert (=> b!27907 (= e!18113 false)))

(declare-fun lt!10727 () (_ BitVec 32))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1619 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27907 (= lt!10727 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!16571 () Bool)

(assert (=> start!3930 (=> (not res!16571) (not e!18113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3930 (= res!16571 (validMask!0 mask!2294))))

(assert (=> start!3930 e!18113))

(assert (=> start!3930 true))

(assert (=> start!3930 tp!3925))

(declare-datatypes ((V!1411 0))(
  ( (V!1412 (val!621 Int)) )
))
(declare-datatypes ((ValueCell!395 0))(
  ( (ValueCellFull!395 (v!1710 V!1411)) (EmptyCell!395) )
))
(declare-datatypes ((array!1621 0))(
  ( (array!1622 (arr!764 (Array (_ BitVec 32) ValueCell!395)) (size!865 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1621)

(declare-fun e!18110 () Bool)

(declare-fun array_inv!525 (array!1621) Bool)

(assert (=> start!3930 (and (array_inv!525 _values!1501) e!18110)))

(declare-fun array_inv!526 (array!1619) Bool)

(assert (=> start!3930 (array_inv!526 _keys!1833)))

(declare-fun tp_is_empty!1189 () Bool)

(assert (=> start!3930 tp_is_empty!1189))

(declare-fun b!27908 () Bool)

(declare-fun e!18111 () Bool)

(declare-fun mapRes!1312 () Bool)

(assert (=> b!27908 (= e!18110 (and e!18111 mapRes!1312))))

(declare-fun condMapEmpty!1312 () Bool)

(declare-fun mapDefault!1312 () ValueCell!395)

