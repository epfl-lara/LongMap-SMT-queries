; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84860 () Bool)

(assert start!84860)

(declare-fun mapNonEmpty!37095 () Bool)

(declare-fun mapRes!37095 () Bool)

(declare-fun tp!70166 () Bool)

(declare-fun e!559396 () Bool)

(assert (=> mapNonEmpty!37095 (= mapRes!37095 (and tp!70166 e!559396))))

(declare-fun mapKey!37095 () (_ BitVec 32))

(declare-datatypes ((V!36117 0))(
  ( (V!36118 (val!11726 Int)) )
))
(declare-datatypes ((ValueCell!11194 0))(
  ( (ValueCellFull!11194 (v!14302 V!36117)) (EmptyCell!11194) )
))
(declare-fun mapRest!37095 () (Array (_ BitVec 32) ValueCell!11194))

(declare-fun mapValue!37095 () ValueCell!11194)

(declare-datatypes ((array!62671 0))(
  ( (array!62672 (arr!30181 (Array (_ BitVec 32) ValueCell!11194)) (size!30660 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62671)

(assert (=> mapNonEmpty!37095 (= (arr!30181 _values!1551) (store mapRest!37095 mapKey!37095 mapValue!37095))))

(declare-fun mapIsEmpty!37095 () Bool)

(assert (=> mapIsEmpty!37095 mapRes!37095))

(declare-fun b!991791 () Bool)

(declare-fun e!559394 () Bool)

(declare-fun e!559399 () Bool)

(assert (=> b!991791 (= e!559394 e!559399)))

(declare-fun res!662927 () Bool)

(assert (=> b!991791 (=> res!662927 e!559399)))

(declare-datatypes ((List!20863 0))(
  ( (Nil!20860) (Cons!20859 (h!22021 (_ BitVec 64)) (t!29846 List!20863)) )
))
(declare-fun contains!5731 (List!20863 (_ BitVec 64)) Bool)

(assert (=> b!991791 (= res!662927 (contains!5731 Nil!20860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991792 () Bool)

(declare-fun res!662925 () Bool)

(assert (=> b!991792 (=> (not res!662925) (not e!559394))))

(declare-datatypes ((array!62673 0))(
  ( (array!62674 (arr!30182 (Array (_ BitVec 32) (_ BitVec 64))) (size!30661 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62673)

(assert (=> b!991792 (= res!662925 (and (bvsle #b00000000000000000000000000000000 (size!30661 _keys!1945)) (bvslt (size!30661 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!991793 () Bool)

(declare-fun res!662924 () Bool)

(assert (=> b!991793 (=> (not res!662924) (not e!559394))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(assert (=> b!991793 (= res!662924 (and (= (size!30660 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30661 _keys!1945) (size!30660 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991794 () Bool)

(declare-fun res!662926 () Bool)

(assert (=> b!991794 (=> (not res!662926) (not e!559394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62673 (_ BitVec 32)) Bool)

(assert (=> b!991794 (= res!662926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991795 () Bool)

(declare-fun tp_is_empty!23351 () Bool)

(assert (=> b!991795 (= e!559396 tp_is_empty!23351)))

(declare-fun b!991796 () Bool)

(declare-fun e!559395 () Bool)

(assert (=> b!991796 (= e!559395 tp_is_empty!23351)))

(declare-fun b!991797 () Bool)

(assert (=> b!991797 (= e!559399 (contains!5731 Nil!20860 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991798 () Bool)

(declare-fun res!662928 () Bool)

(assert (=> b!991798 (=> (not res!662928) (not e!559394))))

(declare-fun noDuplicate!1381 (List!20863) Bool)

(assert (=> b!991798 (= res!662928 (noDuplicate!1381 Nil!20860))))

(declare-fun res!662929 () Bool)

(assert (=> start!84860 (=> (not res!662929) (not e!559394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84860 (= res!662929 (validMask!0 mask!2471))))

(assert (=> start!84860 e!559394))

(assert (=> start!84860 true))

(declare-fun e!559397 () Bool)

(declare-fun array_inv!23309 (array!62671) Bool)

(assert (=> start!84860 (and (array_inv!23309 _values!1551) e!559397)))

(declare-fun array_inv!23310 (array!62673) Bool)

(assert (=> start!84860 (array_inv!23310 _keys!1945)))

(declare-fun b!991790 () Bool)

(assert (=> b!991790 (= e!559397 (and e!559395 mapRes!37095))))

(declare-fun condMapEmpty!37095 () Bool)

(declare-fun mapDefault!37095 () ValueCell!11194)

