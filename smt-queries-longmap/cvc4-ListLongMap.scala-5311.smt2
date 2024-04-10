; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71090 () Bool)

(assert start!71090)

(declare-fun b_free!13277 () Bool)

(declare-fun b_next!13277 () Bool)

(assert (=> start!71090 (= b_free!13277 (not b_next!13277))))

(declare-fun tp!46587 () Bool)

(declare-fun b_and!22191 () Bool)

(assert (=> start!71090 (= tp!46587 b_and!22191)))

(declare-fun b!825618 () Bool)

(declare-fun e!459579 () Bool)

(declare-fun e!459580 () Bool)

(assert (=> b!825618 (= e!459579 (not e!459580))))

(declare-fun res!562828 () Bool)

(assert (=> b!825618 (=> res!562828 e!459580)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825618 (= res!562828 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24983 0))(
  ( (V!24984 (val!7541 Int)) )
))
(declare-datatypes ((tuple2!9984 0))(
  ( (tuple2!9985 (_1!5003 (_ BitVec 64)) (_2!5003 V!24983)) )
))
(declare-datatypes ((List!15788 0))(
  ( (Nil!15785) (Cons!15784 (h!16913 tuple2!9984) (t!22133 List!15788)) )
))
(declare-datatypes ((ListLongMap!8807 0))(
  ( (ListLongMap!8808 (toList!4419 List!15788)) )
))
(declare-fun lt!372931 () ListLongMap!8807)

(declare-fun lt!372923 () ListLongMap!8807)

(assert (=> b!825618 (= lt!372931 lt!372923)))

(declare-fun zeroValueBefore!34 () V!24983)

(declare-datatypes ((array!46156 0))(
  ( (array!46157 (arr!22124 (Array (_ BitVec 32) (_ BitVec 64))) (size!22545 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46156)

(declare-fun zeroValueAfter!34 () V!24983)

(declare-fun minValue!754 () V!24983)

(declare-datatypes ((ValueCell!7078 0))(
  ( (ValueCellFull!7078 (v!9974 V!24983)) (EmptyCell!7078) )
))
(declare-datatypes ((array!46158 0))(
  ( (array!46159 (arr!22125 (Array (_ BitVec 32) ValueCell!7078)) (size!22546 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46158)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28299 0))(
  ( (Unit!28300) )
))
(declare-fun lt!372933 () Unit!28299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!539 (array!46156 array!46158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24983 V!24983 V!24983 V!24983 (_ BitVec 32) Int) Unit!28299)

(assert (=> b!825618 (= lt!372933 (lemmaNoChangeToArrayThenSameMapNoExtras!539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2429 (array!46156 array!46158 (_ BitVec 32) (_ BitVec 32) V!24983 V!24983 (_ BitVec 32) Int) ListLongMap!8807)

(assert (=> b!825618 (= lt!372923 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825618 (= lt!372931 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372934 () tuple2!9984)

(declare-fun e!459578 () Bool)

(declare-fun b!825619 () Bool)

(declare-fun lt!372932 () ListLongMap!8807)

(declare-fun +!1926 (ListLongMap!8807 tuple2!9984) ListLongMap!8807)

(assert (=> b!825619 (= e!459578 (= lt!372932 (+!1926 (+!1926 lt!372923 (tuple2!9985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372934)))))

(declare-fun b!825620 () Bool)

(declare-fun lt!372936 () tuple2!9984)

(declare-fun e!459585 () Bool)

(assert (=> b!825620 (= e!459585 (= lt!372932 (+!1926 (+!1926 lt!372923 lt!372934) lt!372936)))))

(declare-fun res!562823 () Bool)

(assert (=> start!71090 (=> (not res!562823) (not e!459579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71090 (= res!562823 (validMask!0 mask!1312))))

(assert (=> start!71090 e!459579))

(declare-fun tp_is_empty!14987 () Bool)

(assert (=> start!71090 tp_is_empty!14987))

(declare-fun array_inv!17637 (array!46156) Bool)

(assert (=> start!71090 (array_inv!17637 _keys!976)))

(assert (=> start!71090 true))

(declare-fun e!459583 () Bool)

(declare-fun array_inv!17638 (array!46158) Bool)

(assert (=> start!71090 (and (array_inv!17638 _values!788) e!459583)))

(assert (=> start!71090 tp!46587))

(declare-fun b!825621 () Bool)

(declare-fun res!562822 () Bool)

(assert (=> b!825621 (=> (not res!562822) (not e!459579))))

(assert (=> b!825621 (= res!562822 (and (= (size!22546 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22545 _keys!976) (size!22546 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825622 () Bool)

(declare-fun e!459582 () Bool)

(assert (=> b!825622 (= e!459582 tp_is_empty!14987)))

(declare-fun b!825623 () Bool)

(declare-fun e!459581 () Bool)

(declare-fun mapRes!24103 () Bool)

(assert (=> b!825623 (= e!459583 (and e!459581 mapRes!24103))))

(declare-fun condMapEmpty!24103 () Bool)

(declare-fun mapDefault!24103 () ValueCell!7078)

