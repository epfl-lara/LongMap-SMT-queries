; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71466 () Bool)

(assert start!71466)

(declare-fun b_free!13493 () Bool)

(declare-fun b_next!13493 () Bool)

(assert (=> start!71466 (= b_free!13493 (not b_next!13493))))

(declare-fun tp!47263 () Bool)

(declare-fun b_and!22511 () Bool)

(assert (=> start!71466 (= tp!47263 b_and!22511)))

(declare-fun b!829963 () Bool)

(declare-fun res!565329 () Bool)

(declare-fun e!462706 () Bool)

(assert (=> b!829963 (=> (not res!565329) (not e!462706))))

(declare-datatypes ((array!46574 0))(
  ( (array!46575 (arr!22324 (Array (_ BitVec 32) (_ BitVec 64))) (size!22745 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46574)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46574 (_ BitVec 32)) Bool)

(assert (=> b!829963 (= res!565329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829964 () Bool)

(declare-fun e!462700 () Bool)

(assert (=> b!829964 (= e!462706 (not e!462700))))

(declare-fun res!565326 () Bool)

(assert (=> b!829964 (=> res!565326 e!462700)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829964 (= res!565326 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462704 () Bool)

(assert (=> b!829964 e!462704))

(declare-fun res!565331 () Bool)

(assert (=> b!829964 (=> (not res!565331) (not e!462704))))

(declare-datatypes ((V!25271 0))(
  ( (V!25272 (val!7649 Int)) )
))
(declare-datatypes ((tuple2!10146 0))(
  ( (tuple2!10147 (_1!5084 (_ BitVec 64)) (_2!5084 V!25271)) )
))
(declare-datatypes ((List!15940 0))(
  ( (Nil!15937) (Cons!15936 (h!17065 tuple2!10146) (t!22303 List!15940)) )
))
(declare-datatypes ((ListLongMap!8969 0))(
  ( (ListLongMap!8970 (toList!4500 List!15940)) )
))
(declare-fun lt!376488 () ListLongMap!8969)

(declare-fun lt!376489 () ListLongMap!8969)

(assert (=> b!829964 (= res!565331 (= lt!376488 lt!376489))))

(declare-fun zeroValueAfter!34 () V!25271)

(declare-fun minValue!754 () V!25271)

(declare-datatypes ((ValueCell!7186 0))(
  ( (ValueCellFull!7186 (v!10090 V!25271)) (EmptyCell!7186) )
))
(declare-datatypes ((array!46576 0))(
  ( (array!46577 (arr!22325 (Array (_ BitVec 32) ValueCell!7186)) (size!22746 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46576)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!25271)

(declare-datatypes ((Unit!28423 0))(
  ( (Unit!28424) )
))
(declare-fun lt!376487 () Unit!28423)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!587 (array!46574 array!46576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25271 V!25271 V!25271 V!25271 (_ BitVec 32) Int) Unit!28423)

(assert (=> b!829964 (= lt!376487 (lemmaNoChangeToArrayThenSameMapNoExtras!587 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2499 (array!46574 array!46576 (_ BitVec 32) (_ BitVec 32) V!25271 V!25271 (_ BitVec 32) Int) ListLongMap!8969)

(assert (=> b!829964 (= lt!376489 (getCurrentListMapNoExtraKeys!2499 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829964 (= lt!376488 (getCurrentListMapNoExtraKeys!2499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829965 () Bool)

(declare-fun res!565325 () Bool)

(assert (=> b!829965 (=> (not res!565325) (not e!462706))))

(declare-datatypes ((List!15941 0))(
  ( (Nil!15938) (Cons!15937 (h!17066 (_ BitVec 64)) (t!22304 List!15941)) )
))
(declare-fun arrayNoDuplicates!0 (array!46574 (_ BitVec 32) List!15941) Bool)

(assert (=> b!829965 (= res!565325 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15938))))

(declare-fun mapIsEmpty!24454 () Bool)

(declare-fun mapRes!24454 () Bool)

(assert (=> mapIsEmpty!24454 mapRes!24454))

(declare-fun b!829966 () Bool)

(declare-fun e!462701 () Bool)

(declare-fun tp_is_empty!15203 () Bool)

(assert (=> b!829966 (= e!462701 tp_is_empty!15203)))

(declare-fun b!829967 () Bool)

(declare-fun e!462699 () Bool)

(assert (=> b!829967 (= e!462704 e!462699)))

(declare-fun res!565330 () Bool)

(assert (=> b!829967 (=> res!565330 e!462699)))

(assert (=> b!829967 (= res!565330 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!565327 () Bool)

(assert (=> start!71466 (=> (not res!565327) (not e!462706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71466 (= res!565327 (validMask!0 mask!1312))))

(assert (=> start!71466 e!462706))

(assert (=> start!71466 tp_is_empty!15203))

(declare-fun array_inv!17779 (array!46574) Bool)

(assert (=> start!71466 (array_inv!17779 _keys!976)))

(assert (=> start!71466 true))

(declare-fun e!462703 () Bool)

(declare-fun array_inv!17780 (array!46576) Bool)

(assert (=> start!71466 (and (array_inv!17780 _values!788) e!462703)))

(assert (=> start!71466 tp!47263))

(declare-fun b!829968 () Bool)

(declare-fun e!462705 () Bool)

(assert (=> b!829968 (= e!462705 tp_is_empty!15203)))

(declare-fun b!829969 () Bool)

(assert (=> b!829969 (= e!462703 (and e!462701 mapRes!24454))))

(declare-fun condMapEmpty!24454 () Bool)

(declare-fun mapDefault!24454 () ValueCell!7186)

