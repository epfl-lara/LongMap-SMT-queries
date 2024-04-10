; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70934 () Bool)

(assert start!70934)

(declare-fun b_free!13151 () Bool)

(declare-fun b_next!13151 () Bool)

(assert (=> start!70934 (= b_free!13151 (not b_next!13151))))

(declare-fun tp!46203 () Bool)

(declare-fun b_and!22047 () Bool)

(assert (=> start!70934 (= tp!46203 b_and!22047)))

(declare-fun b!823822 () Bool)

(declare-fun e!458244 () Bool)

(declare-fun tp_is_empty!14861 () Bool)

(assert (=> b!823822 (= e!458244 tp_is_empty!14861)))

(declare-fun b!823823 () Bool)

(declare-fun e!458247 () Bool)

(assert (=> b!823823 (= e!458247 tp_is_empty!14861)))

(declare-fun b!823824 () Bool)

(declare-fun res!561740 () Bool)

(declare-fun e!458245 () Bool)

(assert (=> b!823824 (=> (not res!561740) (not e!458245))))

(declare-datatypes ((array!45912 0))(
  ( (array!45913 (arr!22004 (Array (_ BitVec 32) (_ BitVec 64))) (size!22425 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45912)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24815 0))(
  ( (V!24816 (val!7478 Int)) )
))
(declare-datatypes ((ValueCell!7015 0))(
  ( (ValueCellFull!7015 (v!9911 V!24815)) (EmptyCell!7015) )
))
(declare-datatypes ((array!45914 0))(
  ( (array!45915 (arr!22005 (Array (_ BitVec 32) ValueCell!7015)) (size!22426 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45914)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823824 (= res!561740 (and (= (size!22426 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22425 _keys!976) (size!22426 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823825 () Bool)

(assert (=> b!823825 (= e!458245 (not true))))

(declare-datatypes ((tuple2!9890 0))(
  ( (tuple2!9891 (_1!4956 (_ BitVec 64)) (_2!4956 V!24815)) )
))
(declare-datatypes ((List!15702 0))(
  ( (Nil!15699) (Cons!15698 (h!16827 tuple2!9890) (t!22043 List!15702)) )
))
(declare-datatypes ((ListLongMap!8713 0))(
  ( (ListLongMap!8714 (toList!4372 List!15702)) )
))
(declare-fun lt!371546 () ListLongMap!8713)

(declare-fun lt!371547 () ListLongMap!8713)

(assert (=> b!823825 (= lt!371546 lt!371547)))

(declare-fun zeroValueAfter!34 () V!24815)

(declare-fun minValue!754 () V!24815)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28212 0))(
  ( (Unit!28213) )
))
(declare-fun lt!371548 () Unit!28212)

(declare-fun zeroValueBefore!34 () V!24815)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!497 (array!45912 array!45914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24815 V!24815 V!24815 V!24815 (_ BitVec 32) Int) Unit!28212)

(assert (=> b!823825 (= lt!371548 (lemmaNoChangeToArrayThenSameMapNoExtras!497 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2387 (array!45912 array!45914 (_ BitVec 32) (_ BitVec 32) V!24815 V!24815 (_ BitVec 32) Int) ListLongMap!8713)

(assert (=> b!823825 (= lt!371547 (getCurrentListMapNoExtraKeys!2387 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823825 (= lt!371546 (getCurrentListMapNoExtraKeys!2387 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823826 () Bool)

(declare-fun res!561739 () Bool)

(assert (=> b!823826 (=> (not res!561739) (not e!458245))))

(declare-datatypes ((List!15703 0))(
  ( (Nil!15700) (Cons!15699 (h!16828 (_ BitVec 64)) (t!22044 List!15703)) )
))
(declare-fun arrayNoDuplicates!0 (array!45912 (_ BitVec 32) List!15703) Bool)

(assert (=> b!823826 (= res!561739 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15700))))

(declare-fun b!823827 () Bool)

(declare-fun e!458246 () Bool)

(declare-fun mapRes!23908 () Bool)

(assert (=> b!823827 (= e!458246 (and e!458247 mapRes!23908))))

(declare-fun condMapEmpty!23908 () Bool)

(declare-fun mapDefault!23908 () ValueCell!7015)

