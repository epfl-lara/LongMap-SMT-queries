; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37044 () Bool)

(assert start!37044)

(declare-fun b_free!8171 () Bool)

(declare-fun b_next!8171 () Bool)

(assert (=> start!37044 (= b_free!8171 (not b_next!8171))))

(declare-fun tp!29229 () Bool)

(declare-fun b_and!15413 () Bool)

(assert (=> start!37044 (= tp!29229 b_and!15413)))

(declare-fun mapIsEmpty!14793 () Bool)

(declare-fun mapRes!14793 () Bool)

(assert (=> mapIsEmpty!14793 mapRes!14793))

(declare-fun b!372374 () Bool)

(declare-fun res!209511 () Bool)

(declare-fun e!227151 () Bool)

(assert (=> b!372374 (=> (not res!209511) (not e!227151))))

(declare-datatypes ((array!21579 0))(
  ( (array!21580 (arr!10258 (Array (_ BitVec 32) (_ BitVec 64))) (size!10610 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21579)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372374 (= res!209511 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14793 () Bool)

(declare-fun tp!29228 () Bool)

(declare-fun e!227149 () Bool)

(assert (=> mapNonEmpty!14793 (= mapRes!14793 (and tp!29228 e!227149))))

(declare-datatypes ((V!12863 0))(
  ( (V!12864 (val!4454 Int)) )
))
(declare-datatypes ((ValueCell!4066 0))(
  ( (ValueCellFull!4066 (v!6651 V!12863)) (EmptyCell!4066) )
))
(declare-fun mapValue!14793 () ValueCell!4066)

(declare-datatypes ((array!21581 0))(
  ( (array!21582 (arr!10259 (Array (_ BitVec 32) ValueCell!4066)) (size!10611 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21581)

(declare-fun mapRest!14793 () (Array (_ BitVec 32) ValueCell!4066))

(declare-fun mapKey!14793 () (_ BitVec 32))

(assert (=> mapNonEmpty!14793 (= (arr!10259 _values!506) (store mapRest!14793 mapKey!14793 mapValue!14793))))

(declare-fun b!372376 () Bool)

(declare-fun tp_is_empty!8819 () Bool)

(assert (=> b!372376 (= e!227149 tp_is_empty!8819)))

(declare-fun b!372377 () Bool)

(declare-fun e!227152 () Bool)

(declare-fun e!227148 () Bool)

(assert (=> b!372377 (= e!227152 (and e!227148 mapRes!14793))))

(declare-fun condMapEmpty!14793 () Bool)

(declare-fun mapDefault!14793 () ValueCell!4066)

