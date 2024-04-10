; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84516 () Bool)

(assert start!84516)

(declare-fun b_free!20011 () Bool)

(declare-fun b_next!20011 () Bool)

(assert (=> start!84516 (= b_free!20011 (not b_next!20011))))

(declare-fun tp!69817 () Bool)

(declare-fun b_and!32105 () Bool)

(assert (=> start!84516 (= tp!69817 b_and!32105)))

(declare-fun b!988492 () Bool)

(declare-fun e!557404 () Bool)

(assert (=> b!988492 (= e!557404 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35953 0))(
  ( (V!35954 (val!11664 Int)) )
))
(declare-fun minValue!1220 () V!35953)

(declare-datatypes ((ValueCell!11132 0))(
  ( (ValueCellFull!11132 (v!14231 V!35953)) (EmptyCell!11132) )
))
(declare-datatypes ((array!62413 0))(
  ( (array!62414 (arr!30061 (Array (_ BitVec 32) ValueCell!11132)) (size!30540 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62413)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35953)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14860 0))(
  ( (tuple2!14861 (_1!7441 (_ BitVec 64)) (_2!7441 V!35953)) )
))
(declare-datatypes ((List!20791 0))(
  ( (Nil!20788) (Cons!20787 (h!21949 tuple2!14860) (t!29728 List!20791)) )
))
(declare-datatypes ((ListLongMap!13557 0))(
  ( (ListLongMap!13558 (toList!6794 List!20791)) )
))
(declare-fun lt!438523 () ListLongMap!13557)

(declare-datatypes ((array!62415 0))(
  ( (array!62416 (arr!30062 (Array (_ BitVec 32) (_ BitVec 64))) (size!30541 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62415)

(declare-fun getCurrentListMapNoExtraKeys!3485 (array!62415 array!62413 (_ BitVec 32) (_ BitVec 32) V!35953 V!35953 (_ BitVec 32) Int) ListLongMap!13557)

(assert (=> b!988492 (= lt!438523 (getCurrentListMapNoExtraKeys!3485 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!661138 () Bool)

(assert (=> start!84516 (=> (not res!661138) (not e!557404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84516 (= res!661138 (validMask!0 mask!1948))))

(assert (=> start!84516 e!557404))

(assert (=> start!84516 true))

(declare-fun tp_is_empty!23227 () Bool)

(assert (=> start!84516 tp_is_empty!23227))

(declare-fun e!557400 () Bool)

(declare-fun array_inv!23229 (array!62413) Bool)

(assert (=> start!84516 (and (array_inv!23229 _values!1278) e!557400)))

(assert (=> start!84516 tp!69817))

(declare-fun array_inv!23230 (array!62415) Bool)

(assert (=> start!84516 (array_inv!23230 _keys!1544)))

(declare-fun mapIsEmpty!36879 () Bool)

(declare-fun mapRes!36879 () Bool)

(assert (=> mapIsEmpty!36879 mapRes!36879))

(declare-fun b!988493 () Bool)

(declare-fun e!557403 () Bool)

(assert (=> b!988493 (= e!557403 tp_is_empty!23227)))

(declare-fun b!988494 () Bool)

(declare-fun e!557402 () Bool)

(assert (=> b!988494 (= e!557402 tp_is_empty!23227)))

(declare-fun mapNonEmpty!36879 () Bool)

(declare-fun tp!69818 () Bool)

(assert (=> mapNonEmpty!36879 (= mapRes!36879 (and tp!69818 e!557403))))

(declare-fun mapRest!36879 () (Array (_ BitVec 32) ValueCell!11132))

(declare-fun mapValue!36879 () ValueCell!11132)

(declare-fun mapKey!36879 () (_ BitVec 32))

(assert (=> mapNonEmpty!36879 (= (arr!30061 _values!1278) (store mapRest!36879 mapKey!36879 mapValue!36879))))

(declare-fun b!988495 () Bool)

(declare-fun res!661137 () Bool)

(assert (=> b!988495 (=> (not res!661137) (not e!557404))))

(assert (=> b!988495 (= res!661137 (and (= (size!30540 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30541 _keys!1544) (size!30540 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988496 () Bool)

(declare-fun res!661135 () Bool)

(assert (=> b!988496 (=> (not res!661135) (not e!557404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988496 (= res!661135 (validKeyInArray!0 (select (arr!30062 _keys!1544) from!1932)))))

(declare-fun b!988497 () Bool)

(declare-fun res!661136 () Bool)

(assert (=> b!988497 (=> (not res!661136) (not e!557404))))

(assert (=> b!988497 (= res!661136 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30541 _keys!1544))))))

(declare-fun b!988498 () Bool)

(declare-fun res!661134 () Bool)

(assert (=> b!988498 (=> (not res!661134) (not e!557404))))

(declare-datatypes ((List!20792 0))(
  ( (Nil!20789) (Cons!20788 (h!21950 (_ BitVec 64)) (t!29729 List!20792)) )
))
(declare-fun arrayNoDuplicates!0 (array!62415 (_ BitVec 32) List!20792) Bool)

(assert (=> b!988498 (= res!661134 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20789))))

(declare-fun b!988499 () Bool)

(declare-fun res!661140 () Bool)

(assert (=> b!988499 (=> (not res!661140) (not e!557404))))

(assert (=> b!988499 (= res!661140 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988500 () Bool)

(declare-fun res!661139 () Bool)

(assert (=> b!988500 (=> (not res!661139) (not e!557404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62415 (_ BitVec 32)) Bool)

(assert (=> b!988500 (= res!661139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988501 () Bool)

(assert (=> b!988501 (= e!557400 (and e!557402 mapRes!36879))))

(declare-fun condMapEmpty!36879 () Bool)

(declare-fun mapDefault!36879 () ValueCell!11132)

