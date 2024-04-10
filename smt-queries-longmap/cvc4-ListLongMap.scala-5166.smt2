; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69974 () Bool)

(assert start!69974)

(declare-fun b_free!12407 () Bool)

(declare-fun b_next!12407 () Bool)

(assert (=> start!69974 (= b_free!12407 (not b_next!12407))))

(declare-fun tp!43932 () Bool)

(declare-fun b_and!21175 () Bool)

(assert (=> start!69974 (= tp!43932 b_and!21175)))

(declare-fun mapIsEmpty!22753 () Bool)

(declare-fun mapRes!22753 () Bool)

(assert (=> mapIsEmpty!22753 mapRes!22753))

(declare-fun mapNonEmpty!22753 () Bool)

(declare-fun tp!43933 () Bool)

(declare-fun e!450690 () Bool)

(assert (=> mapNonEmpty!22753 (= mapRes!22753 (and tp!43933 e!450690))))

(declare-fun mapKey!22753 () (_ BitVec 32))

(declare-datatypes ((V!23823 0))(
  ( (V!23824 (val!7106 Int)) )
))
(declare-datatypes ((ValueCell!6643 0))(
  ( (ValueCellFull!6643 (v!9533 V!23823)) (EmptyCell!6643) )
))
(declare-datatypes ((array!44442 0))(
  ( (array!44443 (arr!21282 (Array (_ BitVec 32) ValueCell!6643)) (size!21703 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44442)

(declare-fun mapRest!22753 () (Array (_ BitVec 32) ValueCell!6643))

(declare-fun mapValue!22753 () ValueCell!6643)

(assert (=> mapNonEmpty!22753 (= (arr!21282 _values!788) (store mapRest!22753 mapKey!22753 mapValue!22753))))

(declare-fun res!555672 () Bool)

(declare-fun e!450689 () Bool)

(assert (=> start!69974 (=> (not res!555672) (not e!450689))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69974 (= res!555672 (validMask!0 mask!1312))))

(assert (=> start!69974 e!450689))

(declare-fun tp_is_empty!14117 () Bool)

(assert (=> start!69974 tp_is_empty!14117))

(declare-datatypes ((array!44444 0))(
  ( (array!44445 (arr!21283 (Array (_ BitVec 32) (_ BitVec 64))) (size!21704 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44444)

(declare-fun array_inv!17043 (array!44444) Bool)

(assert (=> start!69974 (array_inv!17043 _keys!976)))

(assert (=> start!69974 true))

(declare-fun e!450687 () Bool)

(declare-fun array_inv!17044 (array!44442) Bool)

(assert (=> start!69974 (and (array_inv!17044 _values!788) e!450687)))

(assert (=> start!69974 tp!43932))

(declare-fun b!813355 () Bool)

(declare-fun e!450686 () Bool)

(assert (=> b!813355 (= e!450687 (and e!450686 mapRes!22753))))

(declare-fun condMapEmpty!22753 () Bool)

(declare-fun mapDefault!22753 () ValueCell!6643)

