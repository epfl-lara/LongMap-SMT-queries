; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37710 () Bool)

(assert start!37710)

(declare-fun b_free!8813 () Bool)

(declare-fun b_next!8813 () Bool)

(assert (=> start!37710 (= b_free!8813 (not b_next!8813))))

(declare-fun tp!31191 () Bool)

(declare-fun b_and!16055 () Bool)

(assert (=> start!37710 (= tp!31191 b_and!16055)))

(declare-fun b!386558 () Bool)

(declare-fun res!220697 () Bool)

(declare-fun e!234485 () Bool)

(assert (=> b!386558 (=> (not res!220697) (not e!234485))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386558 (= res!220697 (validKeyInArray!0 k!778))))

(declare-fun b!386559 () Bool)

(declare-fun res!220698 () Bool)

(declare-fun e!234483 () Bool)

(assert (=> b!386559 (=> (not res!220698) (not e!234483))))

(declare-datatypes ((array!22865 0))(
  ( (array!22866 (arr!10901 (Array (_ BitVec 32) (_ BitVec 64))) (size!11253 (_ BitVec 32))) )
))
(declare-fun lt!181834 () array!22865)

(declare-datatypes ((List!6283 0))(
  ( (Nil!6280) (Cons!6279 (h!7135 (_ BitVec 64)) (t!11433 List!6283)) )
))
(declare-fun arrayNoDuplicates!0 (array!22865 (_ BitVec 32) List!6283) Bool)

(assert (=> b!386559 (= res!220698 (arrayNoDuplicates!0 lt!181834 #b00000000000000000000000000000000 Nil!6280))))

(declare-fun b!386560 () Bool)

(declare-fun res!220700 () Bool)

(assert (=> b!386560 (=> (not res!220700) (not e!234485))))

(declare-fun _keys!658 () array!22865)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22865 (_ BitVec 32)) Bool)

(assert (=> b!386560 (= res!220700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386561 () Bool)

(declare-fun res!220703 () Bool)

(assert (=> b!386561 (=> (not res!220703) (not e!234485))))

(assert (=> b!386561 (= res!220703 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6280))))

(declare-fun res!220699 () Bool)

(assert (=> start!37710 (=> (not res!220699) (not e!234485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37710 (= res!220699 (validMask!0 mask!970))))

(assert (=> start!37710 e!234485))

(declare-datatypes ((V!13751 0))(
  ( (V!13752 (val!4787 Int)) )
))
(declare-datatypes ((ValueCell!4399 0))(
  ( (ValueCellFull!4399 (v!6984 V!13751)) (EmptyCell!4399) )
))
(declare-datatypes ((array!22867 0))(
  ( (array!22868 (arr!10902 (Array (_ BitVec 32) ValueCell!4399)) (size!11254 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22867)

(declare-fun e!234487 () Bool)

(declare-fun array_inv!8020 (array!22867) Bool)

(assert (=> start!37710 (and (array_inv!8020 _values!506) e!234487)))

(assert (=> start!37710 tp!31191))

(assert (=> start!37710 true))

(declare-fun tp_is_empty!9485 () Bool)

(assert (=> start!37710 tp_is_empty!9485))

(declare-fun array_inv!8021 (array!22865) Bool)

(assert (=> start!37710 (array_inv!8021 _keys!658)))

(declare-fun mapIsEmpty!15792 () Bool)

(declare-fun mapRes!15792 () Bool)

(assert (=> mapIsEmpty!15792 mapRes!15792))

(declare-fun b!386562 () Bool)

(declare-fun e!234484 () Bool)

(assert (=> b!386562 (= e!234484 tp_is_empty!9485)))

(declare-fun b!386563 () Bool)

(declare-fun e!234486 () Bool)

(assert (=> b!386563 (= e!234487 (and e!234486 mapRes!15792))))

(declare-fun condMapEmpty!15792 () Bool)

(declare-fun mapDefault!15792 () ValueCell!4399)

