; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71442 () Bool)

(assert start!71442)

(declare-fun b_free!13487 () Bool)

(declare-fun b_next!13487 () Bool)

(assert (=> start!71442 (= b_free!13487 (not b_next!13487))))

(declare-fun tp!47241 () Bool)

(declare-fun b_and!22493 () Bool)

(assert (=> start!71442 (= tp!47241 b_and!22493)))

(declare-fun b!829698 () Bool)

(declare-fun res!565191 () Bool)

(declare-fun e!462523 () Bool)

(assert (=> b!829698 (=> (not res!565191) (not e!462523))))

(declare-datatypes ((array!46560 0))(
  ( (array!46561 (arr!22318 (Array (_ BitVec 32) (_ BitVec 64))) (size!22739 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46560)

(declare-datatypes ((V!25263 0))(
  ( (V!25264 (val!7646 Int)) )
))
(declare-datatypes ((ValueCell!7183 0))(
  ( (ValueCellFull!7183 (v!10086 V!25263)) (EmptyCell!7183) )
))
(declare-datatypes ((array!46562 0))(
  ( (array!46563 (arr!22319 (Array (_ BitVec 32) ValueCell!7183)) (size!22740 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46562)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829698 (= res!565191 (and (= (size!22740 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22739 _keys!976) (size!22740 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24442 () Bool)

(declare-fun mapRes!24442 () Bool)

(assert (=> mapIsEmpty!24442 mapRes!24442))

(declare-fun b!829700 () Bool)

(declare-fun res!565189 () Bool)

(assert (=> b!829700 (=> (not res!565189) (not e!462523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46560 (_ BitVec 32)) Bool)

(assert (=> b!829700 (= res!565189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829701 () Bool)

(declare-fun e!462522 () Bool)

(declare-fun tp_is_empty!15197 () Bool)

(assert (=> b!829701 (= e!462522 tp_is_empty!15197)))

(declare-fun b!829702 () Bool)

(declare-fun res!565193 () Bool)

(assert (=> b!829702 (=> (not res!565193) (not e!462523))))

(declare-datatypes ((List!15935 0))(
  ( (Nil!15932) (Cons!15931 (h!17060 (_ BitVec 64)) (t!22296 List!15935)) )
))
(declare-fun arrayNoDuplicates!0 (array!46560 (_ BitVec 32) List!15935) Bool)

(assert (=> b!829702 (= res!565193 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15932))))

(declare-fun b!829703 () Bool)

(declare-fun e!462519 () Bool)

(assert (=> b!829703 (= e!462519 (and e!462522 mapRes!24442))))

(declare-fun condMapEmpty!24442 () Bool)

(declare-fun mapDefault!24442 () ValueCell!7183)

