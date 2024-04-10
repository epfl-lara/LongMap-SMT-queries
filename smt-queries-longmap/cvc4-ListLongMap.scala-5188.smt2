; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70132 () Bool)

(assert start!70132)

(declare-fun b_free!12539 () Bool)

(declare-fun b_next!12539 () Bool)

(assert (=> start!70132 (= b_free!12539 (not b_next!12539))))

(declare-fun tp!44335 () Bool)

(declare-fun b_and!21319 () Bool)

(assert (=> start!70132 (= tp!44335 b_and!21319)))

(declare-fun b!814899 () Bool)

(declare-fun res!556522 () Bool)

(declare-fun e!451783 () Bool)

(assert (=> b!814899 (=> (not res!556522) (not e!451783))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23999 0))(
  ( (V!24000 (val!7172 Int)) )
))
(declare-datatypes ((ValueCell!6709 0))(
  ( (ValueCellFull!6709 (v!9599 V!23999)) (EmptyCell!6709) )
))
(declare-datatypes ((array!44702 0))(
  ( (array!44703 (arr!21410 (Array (_ BitVec 32) ValueCell!6709)) (size!21831 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44702)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!44704 0))(
  ( (array!44705 (arr!21411 (Array (_ BitVec 32) (_ BitVec 64))) (size!21832 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44704)

(assert (=> b!814899 (= res!556522 (and (= (size!21831 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21832 _keys!976) (size!21831 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556525 () Bool)

(assert (=> start!70132 (=> (not res!556525) (not e!451783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70132 (= res!556525 (validMask!0 mask!1312))))

(assert (=> start!70132 e!451783))

(declare-fun tp_is_empty!14249 () Bool)

(assert (=> start!70132 tp_is_empty!14249))

(declare-fun array_inv!17129 (array!44704) Bool)

(assert (=> start!70132 (array_inv!17129 _keys!976)))

(assert (=> start!70132 true))

(declare-fun e!451780 () Bool)

(declare-fun array_inv!17130 (array!44702) Bool)

(assert (=> start!70132 (and (array_inv!17130 _values!788) e!451780)))

(assert (=> start!70132 tp!44335))

(declare-fun b!814900 () Bool)

(declare-fun e!451781 () Bool)

(declare-fun mapRes!22957 () Bool)

(assert (=> b!814900 (= e!451780 (and e!451781 mapRes!22957))))

(declare-fun condMapEmpty!22957 () Bool)

(declare-fun mapDefault!22957 () ValueCell!6709)

