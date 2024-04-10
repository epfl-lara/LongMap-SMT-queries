; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77922 () Bool)

(assert start!77922)

(declare-fun b_free!16465 () Bool)

(declare-fun b_next!16465 () Bool)

(assert (=> start!77922 (= b_free!16465 (not b_next!16465))))

(declare-fun tp!57663 () Bool)

(declare-fun b_and!27035 () Bool)

(assert (=> start!77922 (= tp!57663 b_and!27035)))

(declare-fun res!613990 () Bool)

(declare-fun e!509999 () Bool)

(assert (=> start!77922 (=> (not res!613990) (not e!509999))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77922 (= res!613990 (validMask!0 mask!1756))))

(assert (=> start!77922 e!509999))

(declare-datatypes ((V!30143 0))(
  ( (V!30144 (val!9492 Int)) )
))
(declare-datatypes ((ValueCell!8960 0))(
  ( (ValueCellFull!8960 (v!12000 V!30143)) (EmptyCell!8960) )
))
(declare-datatypes ((array!53790 0))(
  ( (array!53791 (arr!25852 (Array (_ BitVec 32) ValueCell!8960)) (size!26311 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53790)

(declare-fun e!510002 () Bool)

(declare-fun array_inv!20222 (array!53790) Bool)

(assert (=> start!77922 (and (array_inv!20222 _values!1152) e!510002)))

(assert (=> start!77922 tp!57663))

(assert (=> start!77922 true))

(declare-fun tp_is_empty!18883 () Bool)

(assert (=> start!77922 tp_is_empty!18883))

(declare-datatypes ((array!53792 0))(
  ( (array!53793 (arr!25853 (Array (_ BitVec 32) (_ BitVec 64))) (size!26312 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53792)

(declare-fun array_inv!20223 (array!53792) Bool)

(assert (=> start!77922 (array_inv!20223 _keys!1386)))

(declare-fun b!909770 () Bool)

(declare-fun res!613991 () Bool)

(assert (=> b!909770 (=> (not res!613991) (not e!509999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53792 (_ BitVec 32)) Bool)

(assert (=> b!909770 (= res!613991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30043 () Bool)

(declare-fun mapRes!30043 () Bool)

(assert (=> mapIsEmpty!30043 mapRes!30043))

(declare-fun b!909771 () Bool)

(declare-fun e!510000 () Bool)

(assert (=> b!909771 (= e!510000 tp_is_empty!18883)))

(declare-fun b!909772 () Bool)

(declare-fun res!613989 () Bool)

(assert (=> b!909772 (=> (not res!613989) (not e!509999))))

(declare-datatypes ((List!18162 0))(
  ( (Nil!18159) (Cons!18158 (h!19304 (_ BitVec 64)) (t!25745 List!18162)) )
))
(declare-fun arrayNoDuplicates!0 (array!53792 (_ BitVec 32) List!18162) Bool)

(assert (=> b!909772 (= res!613989 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18159))))

(declare-fun mapNonEmpty!30043 () Bool)

(declare-fun tp!57662 () Bool)

(assert (=> mapNonEmpty!30043 (= mapRes!30043 (and tp!57662 e!510000))))

(declare-fun mapRest!30043 () (Array (_ BitVec 32) ValueCell!8960))

(declare-fun mapValue!30043 () ValueCell!8960)

(declare-fun mapKey!30043 () (_ BitVec 32))

(assert (=> mapNonEmpty!30043 (= (arr!25852 _values!1152) (store mapRest!30043 mapKey!30043 mapValue!30043))))

(declare-fun b!909773 () Bool)

(declare-fun e!510003 () Bool)

(assert (=> b!909773 (= e!510002 (and e!510003 mapRes!30043))))

(declare-fun condMapEmpty!30043 () Bool)

(declare-fun mapDefault!30043 () ValueCell!8960)

