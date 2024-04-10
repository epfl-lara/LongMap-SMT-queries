; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70150 () Bool)

(assert start!70150)

(declare-fun b_free!12557 () Bool)

(declare-fun b_next!12557 () Bool)

(assert (=> start!70150 (= b_free!12557 (not b_next!12557))))

(declare-fun tp!44388 () Bool)

(declare-fun b_and!21337 () Bool)

(assert (=> start!70150 (= tp!44388 b_and!21337)))

(declare-fun mapNonEmpty!22984 () Bool)

(declare-fun mapRes!22984 () Bool)

(declare-fun tp!44389 () Bool)

(declare-fun e!451916 () Bool)

(assert (=> mapNonEmpty!22984 (= mapRes!22984 (and tp!44389 e!451916))))

(declare-datatypes ((V!24023 0))(
  ( (V!24024 (val!7181 Int)) )
))
(declare-datatypes ((ValueCell!6718 0))(
  ( (ValueCellFull!6718 (v!9608 V!24023)) (EmptyCell!6718) )
))
(declare-fun mapValue!22984 () ValueCell!6718)

(declare-fun mapRest!22984 () (Array (_ BitVec 32) ValueCell!6718))

(declare-datatypes ((array!44738 0))(
  ( (array!44739 (arr!21428 (Array (_ BitVec 32) ValueCell!6718)) (size!21849 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44738)

(declare-fun mapKey!22984 () (_ BitVec 32))

(assert (=> mapNonEmpty!22984 (= (arr!21428 _values!788) (store mapRest!22984 mapKey!22984 mapValue!22984))))

(declare-fun b!815088 () Bool)

(declare-fun e!451914 () Bool)

(assert (=> b!815088 (= e!451914 (not true))))

(declare-datatypes ((tuple2!9416 0))(
  ( (tuple2!9417 (_1!4719 (_ BitVec 64)) (_2!4719 V!24023)) )
))
(declare-datatypes ((List!15248 0))(
  ( (Nil!15245) (Cons!15244 (h!16373 tuple2!9416) (t!21567 List!15248)) )
))
(declare-datatypes ((ListLongMap!8239 0))(
  ( (ListLongMap!8240 (toList!4135 List!15248)) )
))
(declare-fun lt!364900 () ListLongMap!8239)

(declare-fun lt!364899 () ListLongMap!8239)

(assert (=> b!815088 (= lt!364900 lt!364899)))

(declare-fun zeroValueBefore!34 () V!24023)

(declare-datatypes ((array!44740 0))(
  ( (array!44741 (arr!21429 (Array (_ BitVec 32) (_ BitVec 64))) (size!21850 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44740)

(declare-fun zeroValueAfter!34 () V!24023)

(declare-fun minValue!754 () V!24023)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27768 0))(
  ( (Unit!27769) )
))
(declare-fun lt!364898 () Unit!27768)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!295 (array!44740 array!44738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24023 V!24023 V!24023 V!24023 (_ BitVec 32) Int) Unit!27768)

(assert (=> b!815088 (= lt!364898 (lemmaNoChangeToArrayThenSameMapNoExtras!295 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2185 (array!44740 array!44738 (_ BitVec 32) (_ BitVec 32) V!24023 V!24023 (_ BitVec 32) Int) ListLongMap!8239)

(assert (=> b!815088 (= lt!364899 (getCurrentListMapNoExtraKeys!2185 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815088 (= lt!364900 (getCurrentListMapNoExtraKeys!2185 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815089 () Bool)

(declare-fun res!556631 () Bool)

(assert (=> b!815089 (=> (not res!556631) (not e!451914))))

(assert (=> b!815089 (= res!556631 (and (= (size!21849 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21850 _keys!976) (size!21849 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815090 () Bool)

(declare-fun e!451917 () Bool)

(declare-fun e!451915 () Bool)

(assert (=> b!815090 (= e!451917 (and e!451915 mapRes!22984))))

(declare-fun condMapEmpty!22984 () Bool)

(declare-fun mapDefault!22984 () ValueCell!6718)

