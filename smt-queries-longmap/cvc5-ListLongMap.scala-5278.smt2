; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70818 () Bool)

(assert start!70818)

(declare-fun b_free!13075 () Bool)

(declare-fun b_next!13075 () Bool)

(assert (=> start!70818 (= b_free!13075 (not b_next!13075))))

(declare-fun tp!45969 () Bool)

(declare-fun b_and!21947 () Bool)

(assert (=> start!70818 (= tp!45969 b_and!21947)))

(declare-fun b!822574 () Bool)

(declare-fun res!561038 () Bool)

(declare-fun e!457361 () Bool)

(assert (=> b!822574 (=> (not res!561038) (not e!457361))))

(declare-datatypes ((array!45762 0))(
  ( (array!45763 (arr!21931 (Array (_ BitVec 32) (_ BitVec 64))) (size!22352 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45762)

(declare-datatypes ((List!15643 0))(
  ( (Nil!15640) (Cons!15639 (h!16768 (_ BitVec 64)) (t!21980 List!15643)) )
))
(declare-fun arrayNoDuplicates!0 (array!45762 (_ BitVec 32) List!15643) Bool)

(assert (=> b!822574 (= res!561038 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15640))))

(declare-fun b!822576 () Bool)

(declare-fun e!457360 () Bool)

(declare-fun e!457364 () Bool)

(declare-fun mapRes!23788 () Bool)

(assert (=> b!822576 (= e!457360 (and e!457364 mapRes!23788))))

(declare-fun condMapEmpty!23788 () Bool)

(declare-datatypes ((V!24715 0))(
  ( (V!24716 (val!7440 Int)) )
))
(declare-datatypes ((ValueCell!6977 0))(
  ( (ValueCellFull!6977 (v!9871 V!24715)) (EmptyCell!6977) )
))
(declare-datatypes ((array!45764 0))(
  ( (array!45765 (arr!21932 (Array (_ BitVec 32) ValueCell!6977)) (size!22353 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45764)

(declare-fun mapDefault!23788 () ValueCell!6977)

