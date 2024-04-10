; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70774 () Bool)

(assert start!70774)

(declare-fun b_free!13031 () Bool)

(declare-fun b_next!13031 () Bool)

(assert (=> start!70774 (= b_free!13031 (not b_next!13031))))

(declare-fun tp!45838 () Bool)

(declare-fun b_and!21903 () Bool)

(assert (=> start!70774 (= tp!45838 b_and!21903)))

(declare-fun mapIsEmpty!23722 () Bool)

(declare-fun mapRes!23722 () Bool)

(assert (=> mapIsEmpty!23722 mapRes!23722))

(declare-fun b!822046 () Bool)

(declare-fun res!560705 () Bool)

(declare-fun e!456968 () Bool)

(assert (=> b!822046 (=> (not res!560705) (not e!456968))))

(declare-datatypes ((array!45678 0))(
  ( (array!45679 (arr!21889 (Array (_ BitVec 32) (_ BitVec 64))) (size!22310 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45678)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45678 (_ BitVec 32)) Bool)

(assert (=> b!822046 (= res!560705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822047 () Bool)

(declare-fun e!456966 () Bool)

(declare-fun tp_is_empty!14741 () Bool)

(assert (=> b!822047 (= e!456966 tp_is_empty!14741)))

(declare-fun res!560706 () Bool)

(assert (=> start!70774 (=> (not res!560706) (not e!456968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70774 (= res!560706 (validMask!0 mask!1312))))

(assert (=> start!70774 e!456968))

(assert (=> start!70774 tp_is_empty!14741))

(declare-fun array_inv!17485 (array!45678) Bool)

(assert (=> start!70774 (array_inv!17485 _keys!976)))

(assert (=> start!70774 true))

(declare-datatypes ((V!24655 0))(
  ( (V!24656 (val!7418 Int)) )
))
(declare-datatypes ((ValueCell!6955 0))(
  ( (ValueCellFull!6955 (v!9849 V!24655)) (EmptyCell!6955) )
))
(declare-datatypes ((array!45680 0))(
  ( (array!45681 (arr!21890 (Array (_ BitVec 32) ValueCell!6955)) (size!22311 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45680)

(declare-fun e!456967 () Bool)

(declare-fun array_inv!17486 (array!45680) Bool)

(assert (=> start!70774 (and (array_inv!17486 _values!788) e!456967)))

(assert (=> start!70774 tp!45838))

(declare-fun b!822048 () Bool)

(declare-fun e!456965 () Bool)

(assert (=> b!822048 (= e!456965 tp_is_empty!14741)))

(declare-fun b!822049 () Bool)

(declare-fun res!560707 () Bool)

(assert (=> b!822049 (=> (not res!560707) (not e!456968))))

(declare-datatypes ((List!15609 0))(
  ( (Nil!15606) (Cons!15605 (h!16734 (_ BitVec 64)) (t!21946 List!15609)) )
))
(declare-fun arrayNoDuplicates!0 (array!45678 (_ BitVec 32) List!15609) Bool)

(assert (=> b!822049 (= res!560707 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15606))))

(declare-fun b!822050 () Bool)

(declare-fun res!560709 () Bool)

(assert (=> b!822050 (=> (not res!560709) (not e!456968))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822050 (= res!560709 (and (= (size!22311 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22310 _keys!976) (size!22311 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822051 () Bool)

(assert (=> b!822051 (= e!456967 (and e!456965 mapRes!23722))))

(declare-fun condMapEmpty!23722 () Bool)

(declare-fun mapDefault!23722 () ValueCell!6955)

