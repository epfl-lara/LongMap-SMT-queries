; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70648 () Bool)

(assert start!70648)

(declare-fun b_free!12935 () Bool)

(declare-fun b_next!12935 () Bool)

(assert (=> start!70648 (= b_free!12935 (not b_next!12935))))

(declare-fun tp!45543 () Bool)

(declare-fun b_and!21789 () Bool)

(assert (=> start!70648 (= tp!45543 b_and!21789)))

(declare-fun b!820698 () Bool)

(declare-fun e!455990 () Bool)

(declare-fun tp_is_empty!14645 () Bool)

(assert (=> b!820698 (= e!455990 tp_is_empty!14645)))

(declare-fun b!820699 () Bool)

(declare-fun res!559935 () Bool)

(declare-fun e!455988 () Bool)

(assert (=> b!820699 (=> (not res!559935) (not e!455988))))

(declare-datatypes ((array!45484 0))(
  ( (array!45485 (arr!21794 (Array (_ BitVec 32) (_ BitVec 64))) (size!22215 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45484)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45484 (_ BitVec 32)) Bool)

(assert (=> b!820699 (= res!559935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!559936 () Bool)

(assert (=> start!70648 (=> (not res!559936) (not e!455988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70648 (= res!559936 (validMask!0 mask!1312))))

(assert (=> start!70648 e!455988))

(assert (=> start!70648 tp_is_empty!14645))

(declare-fun array_inv!17419 (array!45484) Bool)

(assert (=> start!70648 (array_inv!17419 _keys!976)))

(assert (=> start!70648 true))

(declare-datatypes ((V!24527 0))(
  ( (V!24528 (val!7370 Int)) )
))
(declare-datatypes ((ValueCell!6907 0))(
  ( (ValueCellFull!6907 (v!9801 V!24527)) (EmptyCell!6907) )
))
(declare-datatypes ((array!45486 0))(
  ( (array!45487 (arr!21795 (Array (_ BitVec 32) ValueCell!6907)) (size!22216 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45486)

(declare-fun e!455989 () Bool)

(declare-fun array_inv!17420 (array!45486) Bool)

(assert (=> start!70648 (and (array_inv!17420 _values!788) e!455989)))

(assert (=> start!70648 tp!45543))

(declare-fun b!820700 () Bool)

(declare-fun res!559934 () Bool)

(assert (=> b!820700 (=> (not res!559934) (not e!455988))))

(declare-datatypes ((List!15531 0))(
  ( (Nil!15528) (Cons!15527 (h!16656 (_ BitVec 64)) (t!21864 List!15531)) )
))
(declare-fun arrayNoDuplicates!0 (array!45484 (_ BitVec 32) List!15531) Bool)

(assert (=> b!820700 (= res!559934 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15528))))

(declare-fun b!820701 () Bool)

(declare-fun res!559933 () Bool)

(assert (=> b!820701 (=> (not res!559933) (not e!455988))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820701 (= res!559933 (and (= (size!22216 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22215 _keys!976) (size!22216 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820702 () Bool)

(declare-fun mapRes!23572 () Bool)

(assert (=> b!820702 (= e!455989 (and e!455990 mapRes!23572))))

(declare-fun condMapEmpty!23572 () Bool)

(declare-fun mapDefault!23572 () ValueCell!6907)

