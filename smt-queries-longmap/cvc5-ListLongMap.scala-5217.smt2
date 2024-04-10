; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70352 () Bool)

(assert start!70352)

(declare-fun b_free!12709 () Bool)

(declare-fun b_next!12709 () Bool)

(assert (=> start!70352 (= b_free!12709 (not b_next!12709))))

(declare-fun tp!44853 () Bool)

(declare-fun b_and!21521 () Bool)

(assert (=> start!70352 (= tp!44853 b_and!21521)))

(declare-fun res!557901 () Bool)

(declare-fun e!453491 () Bool)

(assert (=> start!70352 (=> (not res!557901) (not e!453491))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70352 (= res!557901 (validMask!0 mask!1312))))

(assert (=> start!70352 e!453491))

(declare-fun tp_is_empty!14419 () Bool)

(assert (=> start!70352 tp_is_empty!14419))

(declare-datatypes ((array!45038 0))(
  ( (array!45039 (arr!21575 (Array (_ BitVec 32) (_ BitVec 64))) (size!21996 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45038)

(declare-fun array_inv!17263 (array!45038) Bool)

(assert (=> start!70352 (array_inv!17263 _keys!976)))

(assert (=> start!70352 true))

(declare-datatypes ((V!24227 0))(
  ( (V!24228 (val!7257 Int)) )
))
(declare-datatypes ((ValueCell!6794 0))(
  ( (ValueCellFull!6794 (v!9686 V!24227)) (EmptyCell!6794) )
))
(declare-datatypes ((array!45040 0))(
  ( (array!45041 (arr!21576 (Array (_ BitVec 32) ValueCell!6794)) (size!21997 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45040)

(declare-fun e!453492 () Bool)

(declare-fun array_inv!17264 (array!45040) Bool)

(assert (=> start!70352 (and (array_inv!17264 _values!788) e!453492)))

(assert (=> start!70352 tp!44853))

(declare-fun b!817299 () Bool)

(declare-fun e!453495 () Bool)

(assert (=> b!817299 (= e!453495 tp_is_empty!14419)))

(declare-fun mapNonEmpty!23221 () Bool)

(declare-fun mapRes!23221 () Bool)

(declare-fun tp!44854 () Bool)

(assert (=> mapNonEmpty!23221 (= mapRes!23221 (and tp!44854 e!453495))))

(declare-fun mapRest!23221 () (Array (_ BitVec 32) ValueCell!6794))

(declare-fun mapValue!23221 () ValueCell!6794)

(declare-fun mapKey!23221 () (_ BitVec 32))

(assert (=> mapNonEmpty!23221 (= (arr!21576 _values!788) (store mapRest!23221 mapKey!23221 mapValue!23221))))

(declare-fun b!817300 () Bool)

(declare-fun res!557902 () Bool)

(assert (=> b!817300 (=> (not res!557902) (not e!453491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45038 (_ BitVec 32)) Bool)

(assert (=> b!817300 (= res!557902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817301 () Bool)

(declare-fun e!453494 () Bool)

(assert (=> b!817301 (= e!453492 (and e!453494 mapRes!23221))))

(declare-fun condMapEmpty!23221 () Bool)

(declare-fun mapDefault!23221 () ValueCell!6794)

