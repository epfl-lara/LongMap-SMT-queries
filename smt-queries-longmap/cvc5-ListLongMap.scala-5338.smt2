; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71318 () Bool)

(assert start!71318)

(declare-fun b_free!13435 () Bool)

(declare-fun b_next!13435 () Bool)

(assert (=> start!71318 (= b_free!13435 (not b_next!13435))))

(declare-fun tp!47073 () Bool)

(declare-fun b_and!22393 () Bool)

(assert (=> start!71318 (= tp!47073 b_and!22393)))

(declare-fun b!828296 () Bool)

(declare-fun e!461535 () Bool)

(declare-fun tp_is_empty!15145 () Bool)

(assert (=> b!828296 (= e!461535 tp_is_empty!15145)))

(declare-fun res!564433 () Bool)

(declare-fun e!461538 () Bool)

(assert (=> start!71318 (=> (not res!564433) (not e!461538))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71318 (= res!564433 (validMask!0 mask!1312))))

(assert (=> start!71318 e!461538))

(assert (=> start!71318 tp_is_empty!15145))

(declare-datatypes ((array!46454 0))(
  ( (array!46455 (arr!22269 (Array (_ BitVec 32) (_ BitVec 64))) (size!22690 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46454)

(declare-fun array_inv!17739 (array!46454) Bool)

(assert (=> start!71318 (array_inv!17739 _keys!976)))

(assert (=> start!71318 true))

(declare-datatypes ((V!25195 0))(
  ( (V!25196 (val!7620 Int)) )
))
(declare-datatypes ((ValueCell!7157 0))(
  ( (ValueCellFull!7157 (v!10056 V!25195)) (EmptyCell!7157) )
))
(declare-datatypes ((array!46456 0))(
  ( (array!46457 (arr!22270 (Array (_ BitVec 32) ValueCell!7157)) (size!22691 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46456)

(declare-fun e!461540 () Bool)

(declare-fun array_inv!17740 (array!46456) Bool)

(assert (=> start!71318 (and (array_inv!17740 _values!788) e!461540)))

(assert (=> start!71318 tp!47073))

(declare-fun b!828297 () Bool)

(declare-fun res!564431 () Bool)

(assert (=> b!828297 (=> (not res!564431) (not e!461538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46454 (_ BitVec 32)) Bool)

(assert (=> b!828297 (= res!564431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828298 () Bool)

(declare-fun res!564432 () Bool)

(assert (=> b!828298 (=> (not res!564432) (not e!461538))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828298 (= res!564432 (and (= (size!22691 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22690 _keys!976) (size!22691 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828299 () Bool)

(declare-fun res!564430 () Bool)

(assert (=> b!828299 (=> (not res!564430) (not e!461538))))

(declare-datatypes ((List!15895 0))(
  ( (Nil!15892) (Cons!15891 (h!17020 (_ BitVec 64)) (t!22248 List!15895)) )
))
(declare-fun arrayNoDuplicates!0 (array!46454 (_ BitVec 32) List!15895) Bool)

(assert (=> b!828299 (= res!564430 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15892))))

(declare-fun b!828300 () Bool)

(declare-fun mapRes!24352 () Bool)

(assert (=> b!828300 (= e!461540 (and e!461535 mapRes!24352))))

(declare-fun condMapEmpty!24352 () Bool)

(declare-fun mapDefault!24352 () ValueCell!7157)

