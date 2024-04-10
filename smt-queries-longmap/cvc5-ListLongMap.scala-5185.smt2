; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70096 () Bool)

(assert start!70096)

(declare-fun b_free!12517 () Bool)

(declare-fun b_next!12517 () Bool)

(assert (=> start!70096 (= b_free!12517 (not b_next!12517))))

(declare-fun tp!44265 () Bool)

(declare-fun b_and!21289 () Bool)

(assert (=> start!70096 (= tp!44265 b_and!21289)))

(declare-fun b!814583 () Bool)

(declare-fun e!451561 () Bool)

(declare-fun tp_is_empty!14227 () Bool)

(assert (=> b!814583 (= e!451561 tp_is_empty!14227)))

(declare-fun b!814584 () Bool)

(declare-fun res!556361 () Bool)

(declare-fun e!451562 () Bool)

(assert (=> b!814584 (=> (not res!556361) (not e!451562))))

(declare-datatypes ((array!44656 0))(
  ( (array!44657 (arr!21388 (Array (_ BitVec 32) (_ BitVec 64))) (size!21809 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44656)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!23971 0))(
  ( (V!23972 (val!7161 Int)) )
))
(declare-datatypes ((ValueCell!6698 0))(
  ( (ValueCellFull!6698 (v!9588 V!23971)) (EmptyCell!6698) )
))
(declare-datatypes ((array!44658 0))(
  ( (array!44659 (arr!21389 (Array (_ BitVec 32) ValueCell!6698)) (size!21810 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44658)

(assert (=> b!814584 (= res!556361 (and (= (size!21810 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21809 _keys!976) (size!21810 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814585 () Bool)

(declare-fun res!556360 () Bool)

(assert (=> b!814585 (=> (not res!556360) (not e!451562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44656 (_ BitVec 32)) Bool)

(assert (=> b!814585 (= res!556360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556359 () Bool)

(assert (=> start!70096 (=> (not res!556359) (not e!451562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70096 (= res!556359 (validMask!0 mask!1312))))

(assert (=> start!70096 e!451562))

(assert (=> start!70096 tp_is_empty!14227))

(declare-fun array_inv!17115 (array!44656) Bool)

(assert (=> start!70096 (array_inv!17115 _keys!976)))

(assert (=> start!70096 true))

(declare-fun e!451563 () Bool)

(declare-fun array_inv!17116 (array!44658) Bool)

(assert (=> start!70096 (and (array_inv!17116 _values!788) e!451563)))

(assert (=> start!70096 tp!44265))

(declare-fun b!814586 () Bool)

(declare-fun mapRes!22921 () Bool)

(assert (=> b!814586 (= e!451563 (and e!451561 mapRes!22921))))

(declare-fun condMapEmpty!22921 () Bool)

(declare-fun mapDefault!22921 () ValueCell!6698)

