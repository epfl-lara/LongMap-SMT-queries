; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70764 () Bool)

(assert start!70764)

(declare-fun b_free!13021 () Bool)

(declare-fun b_next!13021 () Bool)

(assert (=> start!70764 (= b_free!13021 (not b_next!13021))))

(declare-fun tp!45807 () Bool)

(declare-fun b_and!21893 () Bool)

(assert (=> start!70764 (= tp!45807 b_and!21893)))

(declare-fun b!821919 () Bool)

(declare-fun e!456871 () Bool)

(declare-fun tp_is_empty!14731 () Bool)

(assert (=> b!821919 (= e!456871 tp_is_empty!14731)))

(declare-fun b!821920 () Bool)

(declare-fun e!456868 () Bool)

(assert (=> b!821920 (= e!456868 true)))

(declare-fun e!456869 () Bool)

(assert (=> b!821920 e!456869))

(declare-fun res!560625 () Bool)

(assert (=> b!821920 (=> (not res!560625) (not e!456869))))

(declare-datatypes ((V!24643 0))(
  ( (V!24644 (val!7413 Int)) )
))
(declare-datatypes ((tuple2!9784 0))(
  ( (tuple2!9785 (_1!4903 (_ BitVec 64)) (_2!4903 V!24643)) )
))
(declare-fun lt!369497 () tuple2!9784)

(declare-datatypes ((List!15600 0))(
  ( (Nil!15597) (Cons!15596 (h!16725 tuple2!9784) (t!21937 List!15600)) )
))
(declare-datatypes ((ListLongMap!8607 0))(
  ( (ListLongMap!8608 (toList!4319 List!15600)) )
))
(declare-fun lt!369501 () ListLongMap!8607)

(declare-fun lt!369498 () ListLongMap!8607)

(declare-fun +!1871 (ListLongMap!8607 tuple2!9784) ListLongMap!8607)

(assert (=> b!821920 (= res!560625 (= lt!369501 (+!1871 lt!369498 lt!369497)))))

(declare-fun minValue!754 () V!24643)

(assert (=> b!821920 (= lt!369497 (tuple2!9785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45658 0))(
  ( (array!45659 (arr!21879 (Array (_ BitVec 32) (_ BitVec 64))) (size!22300 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45658)

(declare-datatypes ((ValueCell!6950 0))(
  ( (ValueCellFull!6950 (v!9844 V!24643)) (EmptyCell!6950) )
))
(declare-datatypes ((array!45660 0))(
  ( (array!45661 (arr!21880 (Array (_ BitVec 32) ValueCell!6950)) (size!22301 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45660)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24643)

(declare-fun lt!369500 () ListLongMap!8607)

(declare-fun getCurrentListMap!2486 (array!45658 array!45660 (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 (_ BitVec 32) Int) ListLongMap!8607)

(assert (=> b!821920 (= lt!369500 (getCurrentListMap!2486 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24643)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821920 (= lt!369501 (getCurrentListMap!2486 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821921 () Bool)

(declare-fun e!456873 () Bool)

(declare-fun e!456872 () Bool)

(declare-fun mapRes!23707 () Bool)

(assert (=> b!821921 (= e!456873 (and e!456872 mapRes!23707))))

(declare-fun condMapEmpty!23707 () Bool)

(declare-fun mapDefault!23707 () ValueCell!6950)

