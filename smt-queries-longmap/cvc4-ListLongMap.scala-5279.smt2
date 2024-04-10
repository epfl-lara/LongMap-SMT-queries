; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70848 () Bool)

(assert start!70848)

(declare-fun b_free!13085 () Bool)

(declare-fun b_next!13085 () Bool)

(assert (=> start!70848 (= b_free!13085 (not b_next!13085))))

(declare-fun tp!46003 () Bool)

(declare-fun b_and!21969 () Bool)

(assert (=> start!70848 (= tp!46003 b_and!21969)))

(declare-fun b!822875 () Bool)

(declare-fun e!457568 () Bool)

(declare-fun e!457564 () Bool)

(assert (=> b!822875 (= e!457568 (not e!457564))))

(declare-fun res!561190 () Bool)

(assert (=> b!822875 (=> res!561190 e!457564)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822875 (= res!561190 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24727 0))(
  ( (V!24728 (val!7445 Int)) )
))
(declare-datatypes ((tuple2!9836 0))(
  ( (tuple2!9837 (_1!4929 (_ BitVec 64)) (_2!4929 V!24727)) )
))
(declare-datatypes ((List!15651 0))(
  ( (Nil!15648) (Cons!15647 (h!16776 tuple2!9836) (t!21990 List!15651)) )
))
(declare-datatypes ((ListLongMap!8659 0))(
  ( (ListLongMap!8660 (toList!4345 List!15651)) )
))
(declare-fun lt!370585 () ListLongMap!8659)

(declare-fun lt!370583 () ListLongMap!8659)

(assert (=> b!822875 (= lt!370585 lt!370583)))

(declare-fun zeroValueBefore!34 () V!24727)

(declare-fun zeroValueAfter!34 () V!24727)

(declare-fun minValue!754 () V!24727)

(declare-datatypes ((ValueCell!6982 0))(
  ( (ValueCellFull!6982 (v!9877 V!24727)) (EmptyCell!6982) )
))
(declare-datatypes ((array!45784 0))(
  ( (array!45785 (arr!21941 (Array (_ BitVec 32) ValueCell!6982)) (size!22362 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45784)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28156 0))(
  ( (Unit!28157) )
))
(declare-fun lt!370587 () Unit!28156)

(declare-datatypes ((array!45786 0))(
  ( (array!45787 (arr!21942 (Array (_ BitVec 32) (_ BitVec 64))) (size!22363 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45786)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!473 (array!45786 array!45784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24727 V!24727 V!24727 V!24727 (_ BitVec 32) Int) Unit!28156)

(assert (=> b!822875 (= lt!370587 (lemmaNoChangeToArrayThenSameMapNoExtras!473 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2363 (array!45786 array!45784 (_ BitVec 32) (_ BitVec 32) V!24727 V!24727 (_ BitVec 32) Int) ListLongMap!8659)

(assert (=> b!822875 (= lt!370583 (getCurrentListMapNoExtraKeys!2363 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822875 (= lt!370585 (getCurrentListMapNoExtraKeys!2363 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822876 () Bool)

(declare-fun res!561191 () Bool)

(assert (=> b!822876 (=> (not res!561191) (not e!457568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45786 (_ BitVec 32)) Bool)

(assert (=> b!822876 (= res!561191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23806 () Bool)

(declare-fun mapRes!23806 () Bool)

(assert (=> mapIsEmpty!23806 mapRes!23806))

(declare-fun b!822877 () Bool)

(declare-fun e!457563 () Bool)

(declare-fun e!457566 () Bool)

(assert (=> b!822877 (= e!457563 (and e!457566 mapRes!23806))))

(declare-fun condMapEmpty!23806 () Bool)

(declare-fun mapDefault!23806 () ValueCell!6982)

