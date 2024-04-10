; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104880 () Bool)

(assert start!104880)

(declare-fun b_free!26671 () Bool)

(declare-fun b_next!26671 () Bool)

(assert (=> start!104880 (= b_free!26671 (not b_next!26671))))

(declare-fun tp!93505 () Bool)

(declare-fun b_and!44447 () Bool)

(assert (=> start!104880 (= tp!93505 b_and!44447)))

(declare-fun b!1250051 () Bool)

(declare-fun e!709578 () Bool)

(declare-fun tp_is_empty!31573 () Bool)

(assert (=> b!1250051 (= e!709578 tp_is_empty!31573)))

(declare-fun b!1250052 () Bool)

(declare-fun e!709575 () Bool)

(declare-fun e!709577 () Bool)

(assert (=> b!1250052 (= e!709575 e!709577)))

(declare-fun res!833812 () Bool)

(assert (=> b!1250052 (=> res!833812 e!709577)))

(declare-datatypes ((V!47463 0))(
  ( (V!47464 (val!15849 Int)) )
))
(declare-datatypes ((tuple2!20414 0))(
  ( (tuple2!20415 (_1!10218 (_ BitVec 64)) (_2!10218 V!47463)) )
))
(declare-datatypes ((List!27658 0))(
  ( (Nil!27655) (Cons!27654 (h!28863 tuple2!20414) (t!41131 List!27658)) )
))
(declare-datatypes ((ListLongMap!18287 0))(
  ( (ListLongMap!18288 (toList!9159 List!27658)) )
))
(declare-fun lt!564016 () ListLongMap!18287)

(declare-fun contains!7475 (ListLongMap!18287 (_ BitVec 64)) Bool)

(assert (=> b!1250052 (= res!833812 (contains!7475 lt!564016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80816 0))(
  ( (array!80817 (arr!38974 (Array (_ BitVec 32) (_ BitVec 64))) (size!39510 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80816)

(declare-datatypes ((ValueCell!15023 0))(
  ( (ValueCellFull!15023 (v!18545 V!47463)) (EmptyCell!15023) )
))
(declare-datatypes ((array!80818 0))(
  ( (array!80819 (arr!38975 (Array (_ BitVec 32) ValueCell!15023)) (size!39511 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80818)

(declare-fun minValueBefore!43 () V!47463)

(declare-fun zeroValue!871 () V!47463)

(declare-fun getCurrentListMap!4436 (array!80816 array!80818 (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 (_ BitVec 32) Int) ListLongMap!18287)

(assert (=> b!1250052 (= lt!564016 (getCurrentListMap!4436 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250053 () Bool)

(declare-fun e!709580 () Bool)

(assert (=> b!1250053 (= e!709580 (not e!709575))))

(declare-fun res!833815 () Bool)

(assert (=> b!1250053 (=> res!833815 e!709575)))

(assert (=> b!1250053 (= res!833815 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564015 () ListLongMap!18287)

(declare-fun lt!564017 () ListLongMap!18287)

(assert (=> b!1250053 (= lt!564015 lt!564017)))

(declare-datatypes ((Unit!41515 0))(
  ( (Unit!41516) )
))
(declare-fun lt!564013 () Unit!41515)

(declare-fun minValueAfter!43 () V!47463)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!930 (array!80816 array!80818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 V!47463 V!47463 (_ BitVec 32) Int) Unit!41515)

(assert (=> b!1250053 (= lt!564013 (lemmaNoChangeToArrayThenSameMapNoExtras!930 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5566 (array!80816 array!80818 (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 (_ BitVec 32) Int) ListLongMap!18287)

(assert (=> b!1250053 (= lt!564017 (getCurrentListMapNoExtraKeys!5566 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250053 (= lt!564015 (getCurrentListMapNoExtraKeys!5566 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250054 () Bool)

(assert (=> b!1250054 (= e!709577 true)))

(declare-fun -!1990 (ListLongMap!18287 (_ BitVec 64)) ListLongMap!18287)

(assert (=> b!1250054 (= (-!1990 lt!564016 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564016)))

(declare-fun lt!564014 () Unit!41515)

(declare-fun removeNotPresentStillSame!85 (ListLongMap!18287 (_ BitVec 64)) Unit!41515)

(assert (=> b!1250054 (= lt!564014 (removeNotPresentStillSame!85 lt!564016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250055 () Bool)

(declare-fun e!709576 () Bool)

(assert (=> b!1250055 (= e!709576 tp_is_empty!31573)))

(declare-fun mapIsEmpty!49123 () Bool)

(declare-fun mapRes!49123 () Bool)

(assert (=> mapIsEmpty!49123 mapRes!49123))

(declare-fun b!1250056 () Bool)

(declare-fun res!833814 () Bool)

(assert (=> b!1250056 (=> (not res!833814) (not e!709580))))

(declare-datatypes ((List!27659 0))(
  ( (Nil!27656) (Cons!27655 (h!28864 (_ BitVec 64)) (t!41132 List!27659)) )
))
(declare-fun arrayNoDuplicates!0 (array!80816 (_ BitVec 32) List!27659) Bool)

(assert (=> b!1250056 (= res!833814 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27656))))

(declare-fun b!1250057 () Bool)

(declare-fun res!833811 () Bool)

(assert (=> b!1250057 (=> (not res!833811) (not e!709580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80816 (_ BitVec 32)) Bool)

(assert (=> b!1250057 (= res!833811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833810 () Bool)

(assert (=> start!104880 (=> (not res!833810) (not e!709580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104880 (= res!833810 (validMask!0 mask!1466))))

(assert (=> start!104880 e!709580))

(assert (=> start!104880 true))

(assert (=> start!104880 tp!93505))

(assert (=> start!104880 tp_is_empty!31573))

(declare-fun array_inv!29737 (array!80816) Bool)

(assert (=> start!104880 (array_inv!29737 _keys!1118)))

(declare-fun e!709574 () Bool)

(declare-fun array_inv!29738 (array!80818) Bool)

(assert (=> start!104880 (and (array_inv!29738 _values!914) e!709574)))

(declare-fun b!1250058 () Bool)

(assert (=> b!1250058 (= e!709574 (and e!709578 mapRes!49123))))

(declare-fun condMapEmpty!49123 () Bool)

(declare-fun mapDefault!49123 () ValueCell!15023)

