; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70514 () Bool)

(assert start!70514)

(declare-fun b_free!12841 () Bool)

(declare-fun b_next!12841 () Bool)

(assert (=> start!70514 (= b_free!12841 (not b_next!12841))))

(declare-fun tp!45256 () Bool)

(declare-fun b_and!21671 () Bool)

(assert (=> start!70514 (= tp!45256 b_and!21671)))

(declare-fun b!819111 () Bool)

(declare-fun e!454825 () Bool)

(declare-fun tp_is_empty!14551 () Bool)

(assert (=> b!819111 (= e!454825 tp_is_empty!14551)))

(declare-fun res!558977 () Bool)

(declare-fun e!454824 () Bool)

(assert (=> start!70514 (=> (not res!558977) (not e!454824))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70514 (= res!558977 (validMask!0 mask!1312))))

(assert (=> start!70514 e!454824))

(assert (=> start!70514 tp_is_empty!14551))

(declare-datatypes ((array!45298 0))(
  ( (array!45299 (arr!21703 (Array (_ BitVec 32) (_ BitVec 64))) (size!22124 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45298)

(declare-fun array_inv!17349 (array!45298) Bool)

(assert (=> start!70514 (array_inv!17349 _keys!976)))

(assert (=> start!70514 true))

(declare-datatypes ((V!24403 0))(
  ( (V!24404 (val!7323 Int)) )
))
(declare-datatypes ((ValueCell!6860 0))(
  ( (ValueCellFull!6860 (v!9752 V!24403)) (EmptyCell!6860) )
))
(declare-datatypes ((array!45300 0))(
  ( (array!45301 (arr!21704 (Array (_ BitVec 32) ValueCell!6860)) (size!22125 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45300)

(declare-fun e!454827 () Bool)

(declare-fun array_inv!17350 (array!45300) Bool)

(assert (=> start!70514 (and (array_inv!17350 _values!788) e!454827)))

(assert (=> start!70514 tp!45256))

(declare-fun mapNonEmpty!23425 () Bool)

(declare-fun mapRes!23425 () Bool)

(declare-fun tp!45255 () Bool)

(declare-fun e!454829 () Bool)

(assert (=> mapNonEmpty!23425 (= mapRes!23425 (and tp!45255 e!454829))))

(declare-fun mapRest!23425 () (Array (_ BitVec 32) ValueCell!6860))

(declare-fun mapKey!23425 () (_ BitVec 32))

(declare-fun mapValue!23425 () ValueCell!6860)

(assert (=> mapNonEmpty!23425 (= (arr!21704 _values!788) (store mapRest!23425 mapKey!23425 mapValue!23425))))

(declare-fun mapIsEmpty!23425 () Bool)

(assert (=> mapIsEmpty!23425 mapRes!23425))

(declare-fun b!819112 () Bool)

(declare-fun res!558974 () Bool)

(assert (=> b!819112 (=> (not res!558974) (not e!454824))))

(declare-datatypes ((List!15461 0))(
  ( (Nil!15458) (Cons!15457 (h!16586 (_ BitVec 64)) (t!21790 List!15461)) )
))
(declare-fun arrayNoDuplicates!0 (array!45298 (_ BitVec 32) List!15461) Bool)

(assert (=> b!819112 (= res!558974 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15458))))

(declare-fun b!819113 () Bool)

(assert (=> b!819113 (= e!454827 (and e!454825 mapRes!23425))))

(declare-fun condMapEmpty!23425 () Bool)

(declare-fun mapDefault!23425 () ValueCell!6860)

