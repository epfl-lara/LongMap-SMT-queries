; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70806 () Bool)

(assert start!70806)

(declare-fun b_free!13063 () Bool)

(declare-fun b_next!13063 () Bool)

(assert (=> start!70806 (= b_free!13063 (not b_next!13063))))

(declare-fun tp!45933 () Bool)

(declare-fun b_and!21935 () Bool)

(assert (=> start!70806 (= tp!45933 b_and!21935)))

(declare-fun b!822430 () Bool)

(declare-fun e!457254 () Bool)

(declare-fun e!457256 () Bool)

(assert (=> b!822430 (= e!457254 (not e!457256))))

(declare-fun res!560947 () Bool)

(assert (=> b!822430 (=> res!560947 e!457256)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822430 (= res!560947 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24699 0))(
  ( (V!24700 (val!7434 Int)) )
))
(declare-datatypes ((tuple2!9818 0))(
  ( (tuple2!9819 (_1!4920 (_ BitVec 64)) (_2!4920 V!24699)) )
))
(declare-datatypes ((List!15633 0))(
  ( (Nil!15630) (Cons!15629 (h!16758 tuple2!9818) (t!21970 List!15633)) )
))
(declare-datatypes ((ListLongMap!8641 0))(
  ( (ListLongMap!8642 (toList!4336 List!15633)) )
))
(declare-fun lt!370102 () ListLongMap!8641)

(declare-fun lt!370100 () ListLongMap!8641)

(assert (=> b!822430 (= lt!370102 lt!370100)))

(declare-fun zeroValueBefore!34 () V!24699)

(declare-fun zeroValueAfter!34 () V!24699)

(declare-fun minValue!754 () V!24699)

(declare-datatypes ((ValueCell!6971 0))(
  ( (ValueCellFull!6971 (v!9865 V!24699)) (EmptyCell!6971) )
))
(declare-datatypes ((array!45738 0))(
  ( (array!45739 (arr!21919 (Array (_ BitVec 32) ValueCell!6971)) (size!22340 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45738)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!45740 0))(
  ( (array!45741 (arr!21920 (Array (_ BitVec 32) (_ BitVec 64))) (size!22341 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45740)

(declare-datatypes ((Unit!28136 0))(
  ( (Unit!28137) )
))
(declare-fun lt!370099 () Unit!28136)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!465 (array!45740 array!45738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 V!24699 V!24699 (_ BitVec 32) Int) Unit!28136)

(assert (=> b!822430 (= lt!370099 (lemmaNoChangeToArrayThenSameMapNoExtras!465 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2355 (array!45740 array!45738 (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 (_ BitVec 32) Int) ListLongMap!8641)

(assert (=> b!822430 (= lt!370100 (getCurrentListMapNoExtraKeys!2355 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822430 (= lt!370102 (getCurrentListMapNoExtraKeys!2355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822431 () Bool)

(declare-fun res!560948 () Bool)

(assert (=> b!822431 (=> (not res!560948) (not e!457254))))

(declare-datatypes ((List!15634 0))(
  ( (Nil!15631) (Cons!15630 (h!16759 (_ BitVec 64)) (t!21971 List!15634)) )
))
(declare-fun arrayNoDuplicates!0 (array!45740 (_ BitVec 32) List!15634) Bool)

(assert (=> b!822431 (= res!560948 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15631))))

(declare-fun mapNonEmpty!23770 () Bool)

(declare-fun mapRes!23770 () Bool)

(declare-fun tp!45934 () Bool)

(declare-fun e!457252 () Bool)

(assert (=> mapNonEmpty!23770 (= mapRes!23770 (and tp!45934 e!457252))))

(declare-fun mapValue!23770 () ValueCell!6971)

(declare-fun mapKey!23770 () (_ BitVec 32))

(declare-fun mapRest!23770 () (Array (_ BitVec 32) ValueCell!6971))

(assert (=> mapNonEmpty!23770 (= (arr!21919 _values!788) (store mapRest!23770 mapKey!23770 mapValue!23770))))

(declare-fun b!822432 () Bool)

(declare-fun e!457253 () Bool)

(declare-fun tp_is_empty!14773 () Bool)

(assert (=> b!822432 (= e!457253 tp_is_empty!14773)))

(declare-fun b!822433 () Bool)

(declare-fun res!560946 () Bool)

(assert (=> b!822433 (=> (not res!560946) (not e!457254))))

(assert (=> b!822433 (= res!560946 (and (= (size!22340 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22341 _keys!976) (size!22340 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822434 () Bool)

(declare-fun res!560945 () Bool)

(assert (=> b!822434 (=> (not res!560945) (not e!457254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45740 (_ BitVec 32)) Bool)

(assert (=> b!822434 (= res!560945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560949 () Bool)

(assert (=> start!70806 (=> (not res!560949) (not e!457254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70806 (= res!560949 (validMask!0 mask!1312))))

(assert (=> start!70806 e!457254))

(assert (=> start!70806 tp_is_empty!14773))

(declare-fun array_inv!17507 (array!45740) Bool)

(assert (=> start!70806 (array_inv!17507 _keys!976)))

(assert (=> start!70806 true))

(declare-fun e!457255 () Bool)

(declare-fun array_inv!17508 (array!45738) Bool)

(assert (=> start!70806 (and (array_inv!17508 _values!788) e!457255)))

(assert (=> start!70806 tp!45933))

(declare-fun b!822435 () Bool)

(assert (=> b!822435 (= e!457256 true)))

(declare-fun lt!370106 () ListLongMap!8641)

(declare-fun lt!370098 () ListLongMap!8641)

(declare-fun lt!370105 () tuple2!9818)

(declare-fun +!1886 (ListLongMap!8641 tuple2!9818) ListLongMap!8641)

(assert (=> b!822435 (= lt!370106 (+!1886 lt!370098 lt!370105))))

(declare-fun lt!370101 () Unit!28136)

(declare-fun addCommutativeForDiffKeys!449 (ListLongMap!8641 (_ BitVec 64) V!24699 (_ BitVec 64) V!24699) Unit!28136)

(assert (=> b!822435 (= lt!370101 (addCommutativeForDiffKeys!449 lt!370102 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370104 () ListLongMap!8641)

(assert (=> b!822435 (= lt!370104 lt!370106)))

(declare-fun lt!370103 () tuple2!9818)

(assert (=> b!822435 (= lt!370106 (+!1886 (+!1886 lt!370102 lt!370105) lt!370103))))

(assert (=> b!822435 (= lt!370105 (tuple2!9819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370107 () ListLongMap!8641)

(assert (=> b!822435 (= lt!370107 lt!370098)))

(assert (=> b!822435 (= lt!370098 (+!1886 lt!370102 lt!370103))))

(assert (=> b!822435 (= lt!370103 (tuple2!9819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2500 (array!45740 array!45738 (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 (_ BitVec 32) Int) ListLongMap!8641)

(assert (=> b!822435 (= lt!370104 (getCurrentListMap!2500 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822435 (= lt!370107 (getCurrentListMap!2500 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23770 () Bool)

(assert (=> mapIsEmpty!23770 mapRes!23770))

(declare-fun b!822436 () Bool)

(assert (=> b!822436 (= e!457252 tp_is_empty!14773)))

(declare-fun b!822437 () Bool)

(assert (=> b!822437 (= e!457255 (and e!457253 mapRes!23770))))

(declare-fun condMapEmpty!23770 () Bool)

(declare-fun mapDefault!23770 () ValueCell!6971)

