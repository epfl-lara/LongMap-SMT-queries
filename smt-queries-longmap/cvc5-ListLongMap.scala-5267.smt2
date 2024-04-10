; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70736 () Bool)

(assert start!70736)

(declare-fun b_free!13009 () Bool)

(declare-fun b_next!13009 () Bool)

(assert (=> start!70736 (= b_free!13009 (not b_next!13009))))

(declare-fun tp!45769 () Bool)

(declare-fun b_and!21871 () Bool)

(assert (=> start!70736 (= tp!45769 b_and!21871)))

(declare-fun b!821625 () Bool)

(declare-fun res!560475 () Bool)

(declare-fun e!456664 () Bool)

(assert (=> b!821625 (=> (not res!560475) (not e!456664))))

(declare-datatypes ((array!45634 0))(
  ( (array!45635 (arr!21868 (Array (_ BitVec 32) (_ BitVec 64))) (size!22289 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45634)

(declare-datatypes ((List!15591 0))(
  ( (Nil!15588) (Cons!15587 (h!16716 (_ BitVec 64)) (t!21926 List!15591)) )
))
(declare-fun arrayNoDuplicates!0 (array!45634 (_ BitVec 32) List!15591) Bool)

(assert (=> b!821625 (= res!560475 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15588))))

(declare-fun b!821626 () Bool)

(declare-fun e!456667 () Bool)

(declare-fun tp_is_empty!14719 () Bool)

(assert (=> b!821626 (= e!456667 tp_is_empty!14719)))

(declare-fun b!821627 () Bool)

(declare-fun res!560477 () Bool)

(assert (=> b!821627 (=> (not res!560477) (not e!456664))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45634 (_ BitVec 32)) Bool)

(assert (=> b!821627 (= res!560477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821628 () Bool)

(declare-fun e!456663 () Bool)

(declare-fun e!456665 () Bool)

(declare-fun mapRes!23686 () Bool)

(assert (=> b!821628 (= e!456663 (and e!456665 mapRes!23686))))

(declare-fun condMapEmpty!23686 () Bool)

(declare-datatypes ((V!24627 0))(
  ( (V!24628 (val!7407 Int)) )
))
(declare-datatypes ((ValueCell!6944 0))(
  ( (ValueCellFull!6944 (v!9838 V!24627)) (EmptyCell!6944) )
))
(declare-datatypes ((array!45636 0))(
  ( (array!45637 (arr!21869 (Array (_ BitVec 32) ValueCell!6944)) (size!22290 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45636)

(declare-fun mapDefault!23686 () ValueCell!6944)

