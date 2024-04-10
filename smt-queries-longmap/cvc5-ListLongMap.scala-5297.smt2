; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70986 () Bool)

(assert start!70986)

(declare-fun b_free!13189 () Bool)

(declare-fun b_next!13189 () Bool)

(assert (=> start!70986 (= b_free!13189 (not b_next!13189))))

(declare-fun tp!46320 () Bool)

(declare-fun b_and!22093 () Bool)

(assert (=> start!70986 (= tp!46320 b_and!22093)))

(declare-fun mapNonEmpty!23968 () Bool)

(declare-fun mapRes!23968 () Bool)

(declare-fun tp!46321 () Bool)

(declare-fun e!458586 () Bool)

(assert (=> mapNonEmpty!23968 (= mapRes!23968 (and tp!46321 e!458586))))

(declare-datatypes ((V!24867 0))(
  ( (V!24868 (val!7497 Int)) )
))
(declare-datatypes ((ValueCell!7034 0))(
  ( (ValueCellFull!7034 (v!9930 V!24867)) (EmptyCell!7034) )
))
(declare-fun mapRest!23968 () (Array (_ BitVec 32) ValueCell!7034))

(declare-fun mapKey!23968 () (_ BitVec 32))

(declare-fun mapValue!23968 () ValueCell!7034)

(declare-datatypes ((array!45986 0))(
  ( (array!45987 (arr!22040 (Array (_ BitVec 32) ValueCell!7034)) (size!22461 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45986)

(assert (=> mapNonEmpty!23968 (= (arr!22040 _values!788) (store mapRest!23968 mapKey!23968 mapValue!23968))))

(declare-fun mapIsEmpty!23968 () Bool)

(assert (=> mapIsEmpty!23968 mapRes!23968))

(declare-fun b!824308 () Bool)

(declare-fun res!562001 () Bool)

(declare-fun e!458591 () Bool)

(assert (=> b!824308 (=> (not res!562001) (not e!458591))))

(declare-datatypes ((array!45988 0))(
  ( (array!45989 (arr!22041 (Array (_ BitVec 32) (_ BitVec 64))) (size!22462 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45988)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45988 (_ BitVec 32)) Bool)

(assert (=> b!824308 (= res!562001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824309 () Bool)

(declare-fun res!561999 () Bool)

(assert (=> b!824309 (=> (not res!561999) (not e!458591))))

(declare-datatypes ((List!15731 0))(
  ( (Nil!15728) (Cons!15727 (h!16856 (_ BitVec 64)) (t!22074 List!15731)) )
))
(declare-fun arrayNoDuplicates!0 (array!45988 (_ BitVec 32) List!15731) Bool)

(assert (=> b!824309 (= res!561999 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15728))))

(declare-fun b!824310 () Bool)

(declare-fun e!458590 () Bool)

(declare-fun e!458588 () Bool)

(assert (=> b!824310 (= e!458590 (and e!458588 mapRes!23968))))

(declare-fun condMapEmpty!23968 () Bool)

(declare-fun mapDefault!23968 () ValueCell!7034)

