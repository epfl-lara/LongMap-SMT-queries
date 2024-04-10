; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70698 () Bool)

(assert start!70698)

(declare-fun b_free!12971 () Bool)

(declare-fun b_next!12971 () Bool)

(assert (=> start!70698 (= b_free!12971 (not b_next!12971))))

(declare-fun tp!45655 () Bool)

(declare-fun b_and!21833 () Bool)

(assert (=> start!70698 (= tp!45655 b_and!21833)))

(declare-fun res!560189 () Bool)

(declare-fun e!456326 () Bool)

(assert (=> start!70698 (=> (not res!560189) (not e!456326))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70698 (= res!560189 (validMask!0 mask!1312))))

(assert (=> start!70698 e!456326))

(declare-fun tp_is_empty!14681 () Bool)

(assert (=> start!70698 tp_is_empty!14681))

(declare-datatypes ((array!45558 0))(
  ( (array!45559 (arr!21830 (Array (_ BitVec 32) (_ BitVec 64))) (size!22251 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45558)

(declare-fun array_inv!17449 (array!45558) Bool)

(assert (=> start!70698 (array_inv!17449 _keys!976)))

(assert (=> start!70698 true))

(declare-datatypes ((V!24575 0))(
  ( (V!24576 (val!7388 Int)) )
))
(declare-datatypes ((ValueCell!6925 0))(
  ( (ValueCellFull!6925 (v!9819 V!24575)) (EmptyCell!6925) )
))
(declare-datatypes ((array!45560 0))(
  ( (array!45561 (arr!21831 (Array (_ BitVec 32) ValueCell!6925)) (size!22252 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45560)

(declare-fun e!456323 () Bool)

(declare-fun array_inv!17450 (array!45560) Bool)

(assert (=> start!70698 (and (array_inv!17450 _values!788) e!456323)))

(assert (=> start!70698 tp!45655))

(declare-fun mapNonEmpty!23629 () Bool)

(declare-fun mapRes!23629 () Bool)

(declare-fun tp!45654 () Bool)

(declare-fun e!456322 () Bool)

(assert (=> mapNonEmpty!23629 (= mapRes!23629 (and tp!45654 e!456322))))

(declare-fun mapRest!23629 () (Array (_ BitVec 32) ValueCell!6925))

(declare-fun mapKey!23629 () (_ BitVec 32))

(declare-fun mapValue!23629 () ValueCell!6925)

(assert (=> mapNonEmpty!23629 (= (arr!21831 _values!788) (store mapRest!23629 mapKey!23629 mapValue!23629))))

(declare-fun b!821169 () Bool)

(assert (=> b!821169 (= e!456322 tp_is_empty!14681)))

(declare-fun b!821170 () Bool)

(declare-fun e!456321 () Bool)

(assert (=> b!821170 (= e!456323 (and e!456321 mapRes!23629))))

(declare-fun condMapEmpty!23629 () Bool)

(declare-fun mapDefault!23629 () ValueCell!6925)

