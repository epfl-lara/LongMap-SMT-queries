; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20304 () Bool)

(assert start!20304)

(declare-fun b_free!4963 () Bool)

(declare-fun b_next!4963 () Bool)

(assert (=> start!20304 (= b_free!4963 (not b_next!4963))))

(declare-fun tp!17921 () Bool)

(declare-fun b_and!11709 () Bool)

(assert (=> start!20304 (= tp!17921 b_and!11709)))

(declare-fun b!199994 () Bool)

(declare-fun res!95180 () Bool)

(declare-fun e!131204 () Bool)

(assert (=> b!199994 (=> (not res!95180) (not e!131204))))

(declare-datatypes ((array!8875 0))(
  ( (array!8876 (arr!4188 (Array (_ BitVec 32) (_ BitVec 64))) (size!4513 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8875)

(declare-datatypes ((V!6073 0))(
  ( (V!6074 (val!2454 Int)) )
))
(declare-datatypes ((ValueCell!2066 0))(
  ( (ValueCellFull!2066 (v!4424 V!6073)) (EmptyCell!2066) )
))
(declare-datatypes ((array!8877 0))(
  ( (array!8878 (arr!4189 (Array (_ BitVec 32) ValueCell!2066)) (size!4514 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8877)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199994 (= res!95180 (and (= (size!4514 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4513 _keys!825) (size!4514 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199995 () Bool)

(declare-fun res!95178 () Bool)

(assert (=> b!199995 (=> (not res!95178) (not e!131204))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199995 (= res!95178 (= (select (arr!4188 _keys!825) i!601) k!843))))

(declare-fun b!199996 () Bool)

(declare-fun e!131201 () Bool)

(declare-fun tp_is_empty!4819 () Bool)

(assert (=> b!199996 (= e!131201 tp_is_empty!4819)))

(declare-fun b!199997 () Bool)

(declare-fun res!95177 () Bool)

(assert (=> b!199997 (=> (not res!95177) (not e!131204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199997 (= res!95177 (validKeyInArray!0 k!843))))

(declare-fun b!199998 () Bool)

(declare-fun res!95179 () Bool)

(assert (=> b!199998 (=> (not res!95179) (not e!131204))))

(declare-datatypes ((List!2625 0))(
  ( (Nil!2622) (Cons!2621 (h!3263 (_ BitVec 64)) (t!7556 List!2625)) )
))
(declare-fun arrayNoDuplicates!0 (array!8875 (_ BitVec 32) List!2625) Bool)

(assert (=> b!199998 (= res!95179 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2622))))

(declare-fun res!95176 () Bool)

(assert (=> start!20304 (=> (not res!95176) (not e!131204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20304 (= res!95176 (validMask!0 mask!1149))))

(assert (=> start!20304 e!131204))

(declare-fun e!131203 () Bool)

(declare-fun array_inv!2755 (array!8877) Bool)

(assert (=> start!20304 (and (array_inv!2755 _values!649) e!131203)))

(assert (=> start!20304 true))

(assert (=> start!20304 tp_is_empty!4819))

(declare-fun array_inv!2756 (array!8875) Bool)

(assert (=> start!20304 (array_inv!2756 _keys!825)))

(assert (=> start!20304 tp!17921))

(declare-fun b!199999 () Bool)

(declare-fun res!95182 () Bool)

(assert (=> b!199999 (=> (not res!95182) (not e!131204))))

(assert (=> b!199999 (= res!95182 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4513 _keys!825))))))

(declare-fun b!200000 () Bool)

(declare-fun e!131200 () Bool)

(assert (=> b!200000 (= e!131200 tp_is_empty!4819)))

(declare-fun mapIsEmpty!8297 () Bool)

(declare-fun mapRes!8297 () Bool)

(assert (=> mapIsEmpty!8297 mapRes!8297))

(declare-fun b!200001 () Bool)

(assert (=> b!200001 (= e!131204 (not true))))

(declare-fun lt!98653 () array!8877)

(declare-datatypes ((tuple2!3708 0))(
  ( (tuple2!3709 (_1!1865 (_ BitVec 64)) (_2!1865 V!6073)) )
))
(declare-datatypes ((List!2626 0))(
  ( (Nil!2623) (Cons!2622 (h!3264 tuple2!3708) (t!7557 List!2626)) )
))
(declare-datatypes ((ListLongMap!2621 0))(
  ( (ListLongMap!2622 (toList!1326 List!2626)) )
))
(declare-fun lt!98652 () ListLongMap!2621)

(declare-fun zeroValue!615 () V!6073)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6073)

(declare-fun getCurrentListMap!917 (array!8875 array!8877 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) Int) ListLongMap!2621)

(assert (=> b!200001 (= lt!98652 (getCurrentListMap!917 _keys!825 lt!98653 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98650 () ListLongMap!2621)

(declare-fun lt!98654 () ListLongMap!2621)

(assert (=> b!200001 (and (= lt!98650 lt!98654) (= lt!98654 lt!98650))))

(declare-fun v!520 () V!6073)

(declare-fun lt!98655 () ListLongMap!2621)

(declare-fun +!353 (ListLongMap!2621 tuple2!3708) ListLongMap!2621)

(assert (=> b!200001 (= lt!98654 (+!353 lt!98655 (tuple2!3709 k!843 v!520)))))

(declare-datatypes ((Unit!6008 0))(
  ( (Unit!6009) )
))
(declare-fun lt!98651 () Unit!6008)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!30 (array!8875 array!8877 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) (_ BitVec 64) V!6073 (_ BitVec 32) Int) Unit!6008)

(assert (=> b!200001 (= lt!98651 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!30 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!291 (array!8875 array!8877 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) Int) ListLongMap!2621)

(assert (=> b!200001 (= lt!98650 (getCurrentListMapNoExtraKeys!291 _keys!825 lt!98653 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200001 (= lt!98653 (array!8878 (store (arr!4189 _values!649) i!601 (ValueCellFull!2066 v!520)) (size!4514 _values!649)))))

(assert (=> b!200001 (= lt!98655 (getCurrentListMapNoExtraKeys!291 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200002 () Bool)

(declare-fun res!95181 () Bool)

(assert (=> b!200002 (=> (not res!95181) (not e!131204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8875 (_ BitVec 32)) Bool)

(assert (=> b!200002 (= res!95181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8297 () Bool)

(declare-fun tp!17920 () Bool)

(assert (=> mapNonEmpty!8297 (= mapRes!8297 (and tp!17920 e!131201))))

(declare-fun mapRest!8297 () (Array (_ BitVec 32) ValueCell!2066))

(declare-fun mapKey!8297 () (_ BitVec 32))

(declare-fun mapValue!8297 () ValueCell!2066)

(assert (=> mapNonEmpty!8297 (= (arr!4189 _values!649) (store mapRest!8297 mapKey!8297 mapValue!8297))))

(declare-fun b!200003 () Bool)

(assert (=> b!200003 (= e!131203 (and e!131200 mapRes!8297))))

(declare-fun condMapEmpty!8297 () Bool)

(declare-fun mapDefault!8297 () ValueCell!2066)

