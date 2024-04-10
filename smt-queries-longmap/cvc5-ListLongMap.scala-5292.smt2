; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70942 () Bool)

(assert start!70942)

(declare-fun b_free!13159 () Bool)

(declare-fun b_next!13159 () Bool)

(assert (=> start!70942 (= b_free!13159 (not b_next!13159))))

(declare-fun tp!46227 () Bool)

(declare-fun b_and!22055 () Bool)

(assert (=> start!70942 (= tp!46227 b_and!22055)))

(declare-fun b!823906 () Bool)

(declare-fun res!561786 () Bool)

(declare-fun e!458308 () Bool)

(assert (=> b!823906 (=> (not res!561786) (not e!458308))))

(declare-datatypes ((array!45928 0))(
  ( (array!45929 (arr!22012 (Array (_ BitVec 32) (_ BitVec 64))) (size!22433 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45928)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24827 0))(
  ( (V!24828 (val!7482 Int)) )
))
(declare-datatypes ((ValueCell!7019 0))(
  ( (ValueCellFull!7019 (v!9915 V!24827)) (EmptyCell!7019) )
))
(declare-datatypes ((array!45930 0))(
  ( (array!45931 (arr!22013 (Array (_ BitVec 32) ValueCell!7019)) (size!22434 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45930)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823906 (= res!561786 (and (= (size!22434 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22433 _keys!976) (size!22434 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23920 () Bool)

(declare-fun mapRes!23920 () Bool)

(declare-fun tp!46228 () Bool)

(declare-fun e!458306 () Bool)

(assert (=> mapNonEmpty!23920 (= mapRes!23920 (and tp!46228 e!458306))))

(declare-fun mapValue!23920 () ValueCell!7019)

(declare-fun mapKey!23920 () (_ BitVec 32))

(declare-fun mapRest!23920 () (Array (_ BitVec 32) ValueCell!7019))

(assert (=> mapNonEmpty!23920 (= (arr!22013 _values!788) (store mapRest!23920 mapKey!23920 mapValue!23920))))

(declare-fun b!823907 () Bool)

(declare-fun e!458305 () Bool)

(declare-fun e!458304 () Bool)

(assert (=> b!823907 (= e!458305 (and e!458304 mapRes!23920))))

(declare-fun condMapEmpty!23920 () Bool)

(declare-fun mapDefault!23920 () ValueCell!7019)

