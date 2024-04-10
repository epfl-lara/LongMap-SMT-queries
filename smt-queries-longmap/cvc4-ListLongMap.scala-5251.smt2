; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70630 () Bool)

(assert start!70630)

(declare-fun b_free!12917 () Bool)

(declare-fun b_next!12917 () Bool)

(assert (=> start!70630 (= b_free!12917 (not b_next!12917))))

(declare-fun tp!45490 () Bool)

(declare-fun b_and!21771 () Bool)

(assert (=> start!70630 (= tp!45490 b_and!21771)))

(declare-fun b!820509 () Bool)

(declare-fun res!559826 () Bool)

(declare-fun e!455854 () Bool)

(assert (=> b!820509 (=> (not res!559826) (not e!455854))))

(declare-datatypes ((array!45448 0))(
  ( (array!45449 (arr!21776 (Array (_ BitVec 32) (_ BitVec 64))) (size!22197 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45448)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24503 0))(
  ( (V!24504 (val!7361 Int)) )
))
(declare-datatypes ((ValueCell!6898 0))(
  ( (ValueCellFull!6898 (v!9792 V!24503)) (EmptyCell!6898) )
))
(declare-datatypes ((array!45450 0))(
  ( (array!45451 (arr!21777 (Array (_ BitVec 32) ValueCell!6898)) (size!22198 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45450)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820509 (= res!559826 (and (= (size!22198 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22197 _keys!976) (size!22198 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820510 () Bool)

(declare-fun e!455853 () Bool)

(declare-fun tp_is_empty!14627 () Bool)

(assert (=> b!820510 (= e!455853 tp_is_empty!14627)))

(declare-fun mapNonEmpty!23545 () Bool)

(declare-fun mapRes!23545 () Bool)

(declare-fun tp!45489 () Bool)

(assert (=> mapNonEmpty!23545 (= mapRes!23545 (and tp!45489 e!455853))))

(declare-fun mapKey!23545 () (_ BitVec 32))

(declare-fun mapValue!23545 () ValueCell!6898)

(declare-fun mapRest!23545 () (Array (_ BitVec 32) ValueCell!6898))

(assert (=> mapNonEmpty!23545 (= (arr!21777 _values!788) (store mapRest!23545 mapKey!23545 mapValue!23545))))

(declare-fun b!820511 () Bool)

(declare-fun e!455855 () Bool)

(declare-fun e!455857 () Bool)

(assert (=> b!820511 (= e!455855 (and e!455857 mapRes!23545))))

(declare-fun condMapEmpty!23545 () Bool)

(declare-fun mapDefault!23545 () ValueCell!6898)

