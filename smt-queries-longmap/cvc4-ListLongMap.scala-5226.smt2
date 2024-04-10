; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70424 () Bool)

(assert start!70424)

(declare-fun b_free!12767 () Bool)

(declare-fun b_next!12767 () Bool)

(assert (=> start!70424 (= b_free!12767 (not b_next!12767))))

(declare-fun tp!45030 () Bool)

(declare-fun b_and!21587 () Bool)

(assert (=> start!70424 (= tp!45030 b_and!21587)))

(declare-fun mapNonEmpty!23311 () Bool)

(declare-fun mapRes!23311 () Bool)

(declare-fun tp!45031 () Bool)

(declare-fun e!454010 () Bool)

(assert (=> mapNonEmpty!23311 (= mapRes!23311 (and tp!45031 e!454010))))

(declare-datatypes ((V!24303 0))(
  ( (V!24304 (val!7286 Int)) )
))
(declare-datatypes ((ValueCell!6823 0))(
  ( (ValueCellFull!6823 (v!9715 V!24303)) (EmptyCell!6823) )
))
(declare-fun mapValue!23311 () ValueCell!6823)

(declare-datatypes ((array!45154 0))(
  ( (array!45155 (arr!21632 (Array (_ BitVec 32) ValueCell!6823)) (size!22053 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45154)

(declare-fun mapKey!23311 () (_ BitVec 32))

(declare-fun mapRest!23311 () (Array (_ BitVec 32) ValueCell!6823))

(assert (=> mapNonEmpty!23311 (= (arr!21632 _values!788) (store mapRest!23311 mapKey!23311 mapValue!23311))))

(declare-fun b!818019 () Bool)

(declare-fun tp_is_empty!14477 () Bool)

(assert (=> b!818019 (= e!454010 tp_is_empty!14477)))

(declare-fun b!818020 () Bool)

(declare-fun res!558306 () Bool)

(declare-fun e!454007 () Bool)

(assert (=> b!818020 (=> (not res!558306) (not e!454007))))

(declare-datatypes ((array!45156 0))(
  ( (array!45157 (arr!21633 (Array (_ BitVec 32) (_ BitVec 64))) (size!22054 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45156)

(declare-datatypes ((List!15406 0))(
  ( (Nil!15403) (Cons!15402 (h!16531 (_ BitVec 64)) (t!21733 List!15406)) )
))
(declare-fun arrayNoDuplicates!0 (array!45156 (_ BitVec 32) List!15406) Bool)

(assert (=> b!818020 (= res!558306 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15403))))

(declare-fun b!818021 () Bool)

(declare-fun e!454009 () Bool)

(declare-fun e!454012 () Bool)

(assert (=> b!818021 (= e!454009 (and e!454012 mapRes!23311))))

(declare-fun condMapEmpty!23311 () Bool)

(declare-fun mapDefault!23311 () ValueCell!6823)

