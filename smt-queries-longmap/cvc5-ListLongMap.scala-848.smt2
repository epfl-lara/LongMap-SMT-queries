; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20184 () Bool)

(assert start!20184)

(declare-fun b_free!4843 () Bool)

(declare-fun b_next!4843 () Bool)

(assert (=> start!20184 (= b_free!4843 (not b_next!4843))))

(declare-fun tp!17561 () Bool)

(declare-fun b_and!11589 () Bool)

(assert (=> start!20184 (= tp!17561 b_and!11589)))

(declare-fun mapNonEmpty!8117 () Bool)

(declare-fun mapRes!8117 () Bool)

(declare-fun tp!17560 () Bool)

(declare-fun e!130301 () Bool)

(assert (=> mapNonEmpty!8117 (= mapRes!8117 (and tp!17560 e!130301))))

(declare-datatypes ((V!5913 0))(
  ( (V!5914 (val!2394 Int)) )
))
(declare-datatypes ((ValueCell!2006 0))(
  ( (ValueCellFull!2006 (v!4364 V!5913)) (EmptyCell!2006) )
))
(declare-fun mapValue!8117 () ValueCell!2006)

(declare-datatypes ((array!8647 0))(
  ( (array!8648 (arr!4074 (Array (_ BitVec 32) ValueCell!2006)) (size!4399 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8647)

(declare-fun mapKey!8117 () (_ BitVec 32))

(declare-fun mapRest!8117 () (Array (_ BitVec 32) ValueCell!2006))

(assert (=> mapNonEmpty!8117 (= (arr!4074 _values!649) (store mapRest!8117 mapKey!8117 mapValue!8117))))

(declare-fun res!93920 () Bool)

(declare-fun e!130304 () Bool)

(assert (=> start!20184 (=> (not res!93920) (not e!130304))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20184 (= res!93920 (validMask!0 mask!1149))))

(assert (=> start!20184 e!130304))

(declare-fun e!130302 () Bool)

(declare-fun array_inv!2663 (array!8647) Bool)

(assert (=> start!20184 (and (array_inv!2663 _values!649) e!130302)))

(assert (=> start!20184 true))

(declare-fun tp_is_empty!4699 () Bool)

(assert (=> start!20184 tp_is_empty!4699))

(declare-datatypes ((array!8649 0))(
  ( (array!8650 (arr!4075 (Array (_ BitVec 32) (_ BitVec 64))) (size!4400 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8649)

(declare-fun array_inv!2664 (array!8649) Bool)

(assert (=> start!20184 (array_inv!2664 _keys!825)))

(assert (=> start!20184 tp!17561))

(declare-fun b!198194 () Bool)

(declare-fun res!93917 () Bool)

(assert (=> b!198194 (=> (not res!93917) (not e!130304))))

(declare-datatypes ((List!2545 0))(
  ( (Nil!2542) (Cons!2541 (h!3183 (_ BitVec 64)) (t!7476 List!2545)) )
))
(declare-fun arrayNoDuplicates!0 (array!8649 (_ BitVec 32) List!2545) Bool)

(assert (=> b!198194 (= res!93917 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2542))))

(declare-fun b!198195 () Bool)

(declare-fun res!93916 () Bool)

(assert (=> b!198195 (=> (not res!93916) (not e!130304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8649 (_ BitVec 32)) Bool)

(assert (=> b!198195 (= res!93916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198196 () Bool)

(declare-fun res!93918 () Bool)

(assert (=> b!198196 (=> (not res!93918) (not e!130304))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198196 (= res!93918 (validKeyInArray!0 k!843))))

(declare-fun b!198197 () Bool)

(declare-fun e!130303 () Bool)

(assert (=> b!198197 (= e!130303 tp_is_empty!4699)))

(declare-fun mapIsEmpty!8117 () Bool)

(assert (=> mapIsEmpty!8117 mapRes!8117))

(declare-fun b!198198 () Bool)

(declare-fun res!93921 () Bool)

(assert (=> b!198198 (=> (not res!93921) (not e!130304))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198198 (= res!93921 (= (select (arr!4075 _keys!825) i!601) k!843))))

(declare-fun b!198199 () Bool)

(declare-fun res!93919 () Bool)

(assert (=> b!198199 (=> (not res!93919) (not e!130304))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198199 (= res!93919 (and (= (size!4399 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4400 _keys!825) (size!4399 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198200 () Bool)

(assert (=> b!198200 (= e!130304 false)))

(declare-datatypes ((tuple2!3630 0))(
  ( (tuple2!3631 (_1!1826 (_ BitVec 64)) (_2!1826 V!5913)) )
))
(declare-datatypes ((List!2546 0))(
  ( (Nil!2543) (Cons!2542 (h!3184 tuple2!3630) (t!7477 List!2546)) )
))
(declare-datatypes ((ListLongMap!2543 0))(
  ( (ListLongMap!2544 (toList!1287 List!2546)) )
))
(declare-fun lt!97869 () ListLongMap!2543)

(declare-fun v!520 () V!5913)

(declare-fun zeroValue!615 () V!5913)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5913)

(declare-fun getCurrentListMapNoExtraKeys!252 (array!8649 array!8647 (_ BitVec 32) (_ BitVec 32) V!5913 V!5913 (_ BitVec 32) Int) ListLongMap!2543)

(assert (=> b!198200 (= lt!97869 (getCurrentListMapNoExtraKeys!252 _keys!825 (array!8648 (store (arr!4074 _values!649) i!601 (ValueCellFull!2006 v!520)) (size!4399 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97868 () ListLongMap!2543)

(assert (=> b!198200 (= lt!97868 (getCurrentListMapNoExtraKeys!252 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198201 () Bool)

(assert (=> b!198201 (= e!130301 tp_is_empty!4699)))

(declare-fun b!198202 () Bool)

(assert (=> b!198202 (= e!130302 (and e!130303 mapRes!8117))))

(declare-fun condMapEmpty!8117 () Bool)

(declare-fun mapDefault!8117 () ValueCell!2006)

