; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107096 () Bool)

(assert start!107096)

(declare-fun b_free!27601 () Bool)

(declare-fun b_next!27601 () Bool)

(assert (=> start!107096 (= b_free!27601 (not b_next!27601))))

(declare-fun tp!97030 () Bool)

(declare-fun b_and!45633 () Bool)

(assert (=> start!107096 (= tp!97030 b_and!45633)))

(declare-fun b!1269747 () Bool)

(declare-fun res!844996 () Bool)

(declare-fun e!723722 () Bool)

(assert (=> b!1269747 (=> (not res!844996) (not e!723722))))

(declare-datatypes ((array!82832 0))(
  ( (array!82833 (arr!39953 (Array (_ BitVec 32) (_ BitVec 64))) (size!40489 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82832)

(declare-datatypes ((List!28446 0))(
  ( (Nil!28443) (Cons!28442 (h!29651 (_ BitVec 64)) (t!41975 List!28446)) )
))
(declare-fun arrayNoDuplicates!0 (array!82832 (_ BitVec 32) List!28446) Bool)

(assert (=> b!1269747 (= res!844996 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28443))))

(declare-fun res!845000 () Bool)

(assert (=> start!107096 (=> (not res!845000) (not e!723722))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107096 (= res!845000 (validMask!0 mask!1730))))

(assert (=> start!107096 e!723722))

(declare-datatypes ((V!48907 0))(
  ( (V!48908 (val!16467 Int)) )
))
(declare-datatypes ((ValueCell!15539 0))(
  ( (ValueCellFull!15539 (v!19104 V!48907)) (EmptyCell!15539) )
))
(declare-datatypes ((array!82834 0))(
  ( (array!82835 (arr!39954 (Array (_ BitVec 32) ValueCell!15539)) (size!40490 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82834)

(declare-fun e!723720 () Bool)

(declare-fun array_inv!30391 (array!82834) Bool)

(assert (=> start!107096 (and (array_inv!30391 _values!1134) e!723720)))

(assert (=> start!107096 true))

(declare-fun array_inv!30392 (array!82832) Bool)

(assert (=> start!107096 (array_inv!30392 _keys!1364)))

(declare-fun tp_is_empty!32785 () Bool)

(assert (=> start!107096 tp_is_empty!32785))

(assert (=> start!107096 tp!97030))

(declare-fun b!1269748 () Bool)

(declare-fun e!723721 () Bool)

(declare-fun mapRes!50758 () Bool)

(assert (=> b!1269748 (= e!723720 (and e!723721 mapRes!50758))))

(declare-fun condMapEmpty!50758 () Bool)

(declare-fun mapDefault!50758 () ValueCell!15539)

