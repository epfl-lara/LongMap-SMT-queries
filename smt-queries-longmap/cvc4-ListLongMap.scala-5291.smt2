; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70940 () Bool)

(assert start!70940)

(declare-fun b_free!13157 () Bool)

(declare-fun b_next!13157 () Bool)

(assert (=> start!70940 (= b_free!13157 (not b_next!13157))))

(declare-fun tp!46221 () Bool)

(declare-fun b_and!22053 () Bool)

(assert (=> start!70940 (= tp!46221 b_and!22053)))

(declare-fun b!823885 () Bool)

(declare-fun e!458293 () Bool)

(declare-fun tp_is_empty!14867 () Bool)

(assert (=> b!823885 (= e!458293 tp_is_empty!14867)))

(declare-fun b!823886 () Bool)

(declare-fun e!458289 () Bool)

(assert (=> b!823886 (= e!458289 (not true))))

(declare-datatypes ((V!24823 0))(
  ( (V!24824 (val!7481 Int)) )
))
(declare-datatypes ((tuple2!9896 0))(
  ( (tuple2!9897 (_1!4959 (_ BitVec 64)) (_2!4959 V!24823)) )
))
(declare-datatypes ((List!15707 0))(
  ( (Nil!15704) (Cons!15703 (h!16832 tuple2!9896) (t!22048 List!15707)) )
))
(declare-datatypes ((ListLongMap!8719 0))(
  ( (ListLongMap!8720 (toList!4375 List!15707)) )
))
(declare-fun lt!371575 () ListLongMap!8719)

(declare-fun lt!371574 () ListLongMap!8719)

(assert (=> b!823886 (= lt!371575 lt!371574)))

(declare-fun zeroValueBefore!34 () V!24823)

(declare-datatypes ((Unit!28218 0))(
  ( (Unit!28219) )
))
(declare-fun lt!371573 () Unit!28218)

(declare-datatypes ((array!45924 0))(
  ( (array!45925 (arr!22010 (Array (_ BitVec 32) (_ BitVec 64))) (size!22431 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45924)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24823)

(declare-fun minValue!754 () V!24823)

(declare-datatypes ((ValueCell!7018 0))(
  ( (ValueCellFull!7018 (v!9914 V!24823)) (EmptyCell!7018) )
))
(declare-datatypes ((array!45926 0))(
  ( (array!45927 (arr!22011 (Array (_ BitVec 32) ValueCell!7018)) (size!22432 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45926)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!500 (array!45924 array!45926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24823 V!24823 V!24823 V!24823 (_ BitVec 32) Int) Unit!28218)

(assert (=> b!823886 (= lt!371573 (lemmaNoChangeToArrayThenSameMapNoExtras!500 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2390 (array!45924 array!45926 (_ BitVec 32) (_ BitVec 32) V!24823 V!24823 (_ BitVec 32) Int) ListLongMap!8719)

(assert (=> b!823886 (= lt!371574 (getCurrentListMapNoExtraKeys!2390 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823886 (= lt!371575 (getCurrentListMapNoExtraKeys!2390 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23917 () Bool)

(declare-fun mapRes!23917 () Bool)

(declare-fun tp!46222 () Bool)

(assert (=> mapNonEmpty!23917 (= mapRes!23917 (and tp!46222 e!458293))))

(declare-fun mapRest!23917 () (Array (_ BitVec 32) ValueCell!7018))

(declare-fun mapValue!23917 () ValueCell!7018)

(declare-fun mapKey!23917 () (_ BitVec 32))

(assert (=> mapNonEmpty!23917 (= (arr!22011 _values!788) (store mapRest!23917 mapKey!23917 mapValue!23917))))

(declare-fun res!561773 () Bool)

(assert (=> start!70940 (=> (not res!561773) (not e!458289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70940 (= res!561773 (validMask!0 mask!1312))))

(assert (=> start!70940 e!458289))

(assert (=> start!70940 tp_is_empty!14867))

(declare-fun array_inv!17565 (array!45924) Bool)

(assert (=> start!70940 (array_inv!17565 _keys!976)))

(assert (=> start!70940 true))

(declare-fun e!458290 () Bool)

(declare-fun array_inv!17566 (array!45926) Bool)

(assert (=> start!70940 (and (array_inv!17566 _values!788) e!458290)))

(assert (=> start!70940 tp!46221))

(declare-fun b!823887 () Bool)

(declare-fun res!561775 () Bool)

(assert (=> b!823887 (=> (not res!561775) (not e!458289))))

(assert (=> b!823887 (= res!561775 (and (= (size!22432 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22431 _keys!976) (size!22432 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823888 () Bool)

(declare-fun res!561774 () Bool)

(assert (=> b!823888 (=> (not res!561774) (not e!458289))))

(declare-datatypes ((List!15708 0))(
  ( (Nil!15705) (Cons!15704 (h!16833 (_ BitVec 64)) (t!22049 List!15708)) )
))
(declare-fun arrayNoDuplicates!0 (array!45924 (_ BitVec 32) List!15708) Bool)

(assert (=> b!823888 (= res!561774 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15705))))

(declare-fun mapIsEmpty!23917 () Bool)

(assert (=> mapIsEmpty!23917 mapRes!23917))

(declare-fun b!823889 () Bool)

(declare-fun res!561776 () Bool)

(assert (=> b!823889 (=> (not res!561776) (not e!458289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45924 (_ BitVec 32)) Bool)

(assert (=> b!823889 (= res!561776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823890 () Bool)

(declare-fun e!458292 () Bool)

(assert (=> b!823890 (= e!458290 (and e!458292 mapRes!23917))))

(declare-fun condMapEmpty!23917 () Bool)

(declare-fun mapDefault!23917 () ValueCell!7018)

