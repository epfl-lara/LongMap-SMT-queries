; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77870 () Bool)

(assert start!77870)

(declare-fun b_free!16429 () Bool)

(declare-fun b_next!16429 () Bool)

(assert (=> start!77870 (= b_free!16429 (not b_next!16429))))

(declare-fun tp!57551 () Bool)

(declare-fun b_and!26997 () Bool)

(assert (=> start!77870 (= tp!57551 b_and!26997)))

(declare-fun b!909265 () Bool)

(declare-fun e!509658 () Bool)

(assert (=> b!909265 (= e!509658 false)))

(declare-datatypes ((V!30095 0))(
  ( (V!30096 (val!9474 Int)) )
))
(declare-datatypes ((ValueCell!8942 0))(
  ( (ValueCellFull!8942 (v!11981 V!30095)) (EmptyCell!8942) )
))
(declare-datatypes ((array!53722 0))(
  ( (array!53723 (arr!25819 (Array (_ BitVec 32) ValueCell!8942)) (size!26278 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53722)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30095)

(declare-datatypes ((array!53724 0))(
  ( (array!53725 (arr!25820 (Array (_ BitVec 32) (_ BitVec 64))) (size!26279 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53724)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30095)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!409970 () Bool)

(declare-datatypes ((tuple2!12350 0))(
  ( (tuple2!12351 (_1!6186 (_ BitVec 64)) (_2!6186 V!30095)) )
))
(declare-datatypes ((List!18142 0))(
  ( (Nil!18139) (Cons!18138 (h!19284 tuple2!12350) (t!25723 List!18142)) )
))
(declare-datatypes ((ListLongMap!11047 0))(
  ( (ListLongMap!11048 (toList!5539 List!18142)) )
))
(declare-fun contains!4581 (ListLongMap!11047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2801 (array!53724 array!53722 (_ BitVec 32) (_ BitVec 32) V!30095 V!30095 (_ BitVec 32) Int) ListLongMap!11047)

(assert (=> b!909265 (= lt!409970 (contains!4581 (getCurrentListMap!2801 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909266 () Bool)

(declare-fun res!613712 () Bool)

(assert (=> b!909266 (=> (not res!613712) (not e!509658))))

(assert (=> b!909266 (= res!613712 (and (= (size!26278 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26279 _keys!1386) (size!26278 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!613710 () Bool)

(assert (=> start!77870 (=> (not res!613710) (not e!509658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77870 (= res!613710 (validMask!0 mask!1756))))

(assert (=> start!77870 e!509658))

(declare-fun e!509661 () Bool)

(declare-fun array_inv!20202 (array!53722) Bool)

(assert (=> start!77870 (and (array_inv!20202 _values!1152) e!509661)))

(assert (=> start!77870 tp!57551))

(assert (=> start!77870 true))

(declare-fun tp_is_empty!18847 () Bool)

(assert (=> start!77870 tp_is_empty!18847))

(declare-fun array_inv!20203 (array!53724) Bool)

(assert (=> start!77870 (array_inv!20203 _keys!1386)))

(declare-fun mapIsEmpty!29986 () Bool)

(declare-fun mapRes!29986 () Bool)

(assert (=> mapIsEmpty!29986 mapRes!29986))

(declare-fun b!909267 () Bool)

(declare-fun e!509657 () Bool)

(assert (=> b!909267 (= e!509657 tp_is_empty!18847)))

(declare-fun b!909268 () Bool)

(declare-fun e!509659 () Bool)

(assert (=> b!909268 (= e!509661 (and e!509659 mapRes!29986))))

(declare-fun condMapEmpty!29986 () Bool)

(declare-fun mapDefault!29986 () ValueCell!8942)

