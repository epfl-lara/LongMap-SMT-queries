; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71462 () Bool)

(assert start!71462)

(declare-fun b_free!13489 () Bool)

(declare-fun b_next!13489 () Bool)

(assert (=> start!71462 (= b_free!13489 (not b_next!13489))))

(declare-fun tp!47250 () Bool)

(declare-fun b_and!22507 () Bool)

(assert (=> start!71462 (= tp!47250 b_and!22507)))

(declare-fun b!829903 () Bool)

(declare-fun e!462652 () Bool)

(declare-fun e!462655 () Bool)

(assert (=> b!829903 (= e!462652 (not e!462655))))

(declare-fun res!565285 () Bool)

(assert (=> b!829903 (=> res!565285 e!462655)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829903 (= res!565285 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462657 () Bool)

(assert (=> b!829903 e!462657))

(declare-fun res!565287 () Bool)

(assert (=> b!829903 (=> (not res!565287) (not e!462657))))

(declare-datatypes ((V!25267 0))(
  ( (V!25268 (val!7647 Int)) )
))
(declare-datatypes ((tuple2!10142 0))(
  ( (tuple2!10143 (_1!5082 (_ BitVec 64)) (_2!5082 V!25267)) )
))
(declare-datatypes ((List!15936 0))(
  ( (Nil!15933) (Cons!15932 (h!17061 tuple2!10142) (t!22299 List!15936)) )
))
(declare-datatypes ((ListLongMap!8965 0))(
  ( (ListLongMap!8966 (toList!4498 List!15936)) )
))
(declare-fun lt!376469 () ListLongMap!8965)

(declare-fun lt!376470 () ListLongMap!8965)

(assert (=> b!829903 (= res!565287 (= lt!376469 lt!376470))))

(declare-fun zeroValueBefore!34 () V!25267)

(declare-datatypes ((array!46566 0))(
  ( (array!46567 (arr!22320 (Array (_ BitVec 32) (_ BitVec 64))) (size!22741 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46566)

(declare-fun zeroValueAfter!34 () V!25267)

(declare-fun minValue!754 () V!25267)

(declare-datatypes ((ValueCell!7184 0))(
  ( (ValueCellFull!7184 (v!10088 V!25267)) (EmptyCell!7184) )
))
(declare-datatypes ((array!46568 0))(
  ( (array!46569 (arr!22321 (Array (_ BitVec 32) ValueCell!7184)) (size!22742 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46568)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28419 0))(
  ( (Unit!28420) )
))
(declare-fun lt!376471 () Unit!28419)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!585 (array!46566 array!46568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 V!25267 V!25267 (_ BitVec 32) Int) Unit!28419)

(assert (=> b!829903 (= lt!376471 (lemmaNoChangeToArrayThenSameMapNoExtras!585 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2497 (array!46566 array!46568 (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 (_ BitVec 32) Int) ListLongMap!8965)

(assert (=> b!829903 (= lt!376470 (getCurrentListMapNoExtraKeys!2497 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829903 (= lt!376469 (getCurrentListMapNoExtraKeys!2497 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829904 () Bool)

(declare-fun res!565286 () Bool)

(assert (=> b!829904 (=> (not res!565286) (not e!462652))))

(declare-datatypes ((List!15937 0))(
  ( (Nil!15934) (Cons!15933 (h!17062 (_ BitVec 64)) (t!22300 List!15937)) )
))
(declare-fun arrayNoDuplicates!0 (array!46566 (_ BitVec 32) List!15937) Bool)

(assert (=> b!829904 (= res!565286 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15934))))

(declare-fun b!829905 () Bool)

(declare-fun e!462658 () Bool)

(declare-fun tp_is_empty!15199 () Bool)

(assert (=> b!829905 (= e!462658 tp_is_empty!15199)))

(declare-fun b!829906 () Bool)

(declare-fun e!462651 () Bool)

(assert (=> b!829906 (= e!462651 tp_is_empty!15199)))

(declare-fun res!565288 () Bool)

(assert (=> start!71462 (=> (not res!565288) (not e!462652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71462 (= res!565288 (validMask!0 mask!1312))))

(assert (=> start!71462 e!462652))

(assert (=> start!71462 tp_is_empty!15199))

(declare-fun array_inv!17775 (array!46566) Bool)

(assert (=> start!71462 (array_inv!17775 _keys!976)))

(assert (=> start!71462 true))

(declare-fun e!462656 () Bool)

(declare-fun array_inv!17776 (array!46568) Bool)

(assert (=> start!71462 (and (array_inv!17776 _values!788) e!462656)))

(assert (=> start!71462 tp!47250))

(declare-fun b!829907 () Bool)

(declare-fun res!565283 () Bool)

(assert (=> b!829907 (=> (not res!565283) (not e!462652))))

(assert (=> b!829907 (= res!565283 (and (= (size!22742 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22741 _keys!976) (size!22742 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829908 () Bool)

(declare-fun e!462654 () Bool)

(declare-fun getCurrentListMap!2595 (array!46566 array!46568 (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 (_ BitVec 32) Int) ListLongMap!8965)

(declare-fun +!1977 (ListLongMap!8965 tuple2!10142) ListLongMap!8965)

(assert (=> b!829908 (= e!462654 (= (getCurrentListMap!2595 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1977 (+!1977 lt!376469 (tuple2!10143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829909 () Bool)

(assert (=> b!829909 (= e!462655 (= (getCurrentListMap!2595 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1977 (+!1977 lt!376470 (tuple2!10143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun mapIsEmpty!24448 () Bool)

(declare-fun mapRes!24448 () Bool)

(assert (=> mapIsEmpty!24448 mapRes!24448))

(declare-fun b!829910 () Bool)

(assert (=> b!829910 (= e!462657 e!462654)))

(declare-fun res!565284 () Bool)

(assert (=> b!829910 (=> res!565284 e!462654)))

(assert (=> b!829910 (= res!565284 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829911 () Bool)

(assert (=> b!829911 (= e!462656 (and e!462658 mapRes!24448))))

(declare-fun condMapEmpty!24448 () Bool)

(declare-fun mapDefault!24448 () ValueCell!7184)

