; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70728 () Bool)

(assert start!70728)

(declare-fun b_free!13001 () Bool)

(declare-fun b_next!13001 () Bool)

(assert (=> start!70728 (= b_free!13001 (not b_next!13001))))

(declare-fun tp!45744 () Bool)

(declare-fun b_and!21863 () Bool)

(assert (=> start!70728 (= tp!45744 b_and!21863)))

(declare-fun b!821529 () Bool)

(declare-fun e!456593 () Bool)

(assert (=> b!821529 (= e!456593 true)))

(declare-datatypes ((V!24615 0))(
  ( (V!24616 (val!7403 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24615)

(declare-datatypes ((array!45618 0))(
  ( (array!45619 (arr!21860 (Array (_ BitVec 32) (_ BitVec 64))) (size!22281 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45618)

(declare-datatypes ((tuple2!9768 0))(
  ( (tuple2!9769 (_1!4895 (_ BitVec 64)) (_2!4895 V!24615)) )
))
(declare-datatypes ((List!15586 0))(
  ( (Nil!15583) (Cons!15582 (h!16711 tuple2!9768) (t!21921 List!15586)) )
))
(declare-datatypes ((ListLongMap!8591 0))(
  ( (ListLongMap!8592 (toList!4311 List!15586)) )
))
(declare-fun lt!369267 () ListLongMap!8591)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24615)

(declare-datatypes ((ValueCell!6940 0))(
  ( (ValueCellFull!6940 (v!9834 V!24615)) (EmptyCell!6940) )
))
(declare-datatypes ((array!45620 0))(
  ( (array!45621 (arr!21861 (Array (_ BitVec 32) ValueCell!6940)) (size!22282 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45620)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2480 (array!45618 array!45620 (_ BitVec 32) (_ BitVec 32) V!24615 V!24615 (_ BitVec 32) Int) ListLongMap!8591)

(assert (=> b!821529 (= lt!369267 (getCurrentListMap!2480 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560417 () Bool)

(declare-fun e!456595 () Bool)

(assert (=> start!70728 (=> (not res!560417) (not e!456595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70728 (= res!560417 (validMask!0 mask!1312))))

(assert (=> start!70728 e!456595))

(declare-fun tp_is_empty!14711 () Bool)

(assert (=> start!70728 tp_is_empty!14711))

(declare-fun array_inv!17467 (array!45618) Bool)

(assert (=> start!70728 (array_inv!17467 _keys!976)))

(assert (=> start!70728 true))

(declare-fun e!456596 () Bool)

(declare-fun array_inv!17468 (array!45620) Bool)

(assert (=> start!70728 (and (array_inv!17468 _values!788) e!456596)))

(assert (=> start!70728 tp!45744))

(declare-fun b!821530 () Bool)

(declare-fun res!560415 () Bool)

(assert (=> b!821530 (=> (not res!560415) (not e!456595))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821530 (= res!560415 (and (= (size!22282 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22281 _keys!976) (size!22282 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821531 () Bool)

(declare-fun e!456592 () Bool)

(assert (=> b!821531 (= e!456592 tp_is_empty!14711)))

(declare-fun b!821532 () Bool)

(declare-fun e!456591 () Bool)

(declare-fun mapRes!23674 () Bool)

(assert (=> b!821532 (= e!456596 (and e!456591 mapRes!23674))))

(declare-fun condMapEmpty!23674 () Bool)

(declare-fun mapDefault!23674 () ValueCell!6940)

