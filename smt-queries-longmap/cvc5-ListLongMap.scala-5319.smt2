; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71154 () Bool)

(assert start!71154)

(declare-fun b_free!13321 () Bool)

(declare-fun b_next!13321 () Bool)

(assert (=> start!71154 (= b_free!13321 (not b_next!13321))))

(declare-fun tp!46722 () Bool)

(declare-fun b_and!22247 () Bool)

(assert (=> start!71154 (= tp!46722 b_and!22247)))

(declare-fun b!826484 () Bool)

(declare-fun e!460239 () Bool)

(declare-fun tp_is_empty!15031 () Bool)

(assert (=> b!826484 (= e!460239 tp_is_empty!15031)))

(declare-fun b!826485 () Bool)

(declare-fun res!563392 () Bool)

(declare-fun e!460236 () Bool)

(assert (=> b!826485 (=> (not res!563392) (not e!460236))))

(declare-datatypes ((array!46242 0))(
  ( (array!46243 (arr!22166 (Array (_ BitVec 32) (_ BitVec 64))) (size!22587 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46242)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46242 (_ BitVec 32)) Bool)

(assert (=> b!826485 (= res!563392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563391 () Bool)

(assert (=> start!71154 (=> (not res!563391) (not e!460236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71154 (= res!563391 (validMask!0 mask!1312))))

(assert (=> start!71154 e!460236))

(assert (=> start!71154 tp_is_empty!15031))

(declare-fun array_inv!17669 (array!46242) Bool)

(assert (=> start!71154 (array_inv!17669 _keys!976)))

(assert (=> start!71154 true))

(declare-datatypes ((V!25043 0))(
  ( (V!25044 (val!7563 Int)) )
))
(declare-datatypes ((ValueCell!7100 0))(
  ( (ValueCellFull!7100 (v!9997 V!25043)) (EmptyCell!7100) )
))
(declare-datatypes ((array!46244 0))(
  ( (array!46245 (arr!22167 (Array (_ BitVec 32) ValueCell!7100)) (size!22588 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46244)

(declare-fun e!460237 () Bool)

(declare-fun array_inv!17670 (array!46244) Bool)

(assert (=> start!71154 (and (array_inv!17670 _values!788) e!460237)))

(assert (=> start!71154 tp!46722))

(declare-fun mapIsEmpty!24172 () Bool)

(declare-fun mapRes!24172 () Bool)

(assert (=> mapIsEmpty!24172 mapRes!24172))

(declare-fun b!826486 () Bool)

(assert (=> b!826486 (= e!460237 (and e!460239 mapRes!24172))))

(declare-fun condMapEmpty!24172 () Bool)

(declare-fun mapDefault!24172 () ValueCell!7100)

