; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106982 () Bool)

(assert start!106982)

(declare-fun res!844299 () Bool)

(declare-fun e!722868 () Bool)

(assert (=> start!106982 (=> (not res!844299) (not e!722868))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106982 (= res!844299 (validMask!0 mask!1730))))

(assert (=> start!106982 e!722868))

(declare-datatypes ((V!48755 0))(
  ( (V!48756 (val!16410 Int)) )
))
(declare-datatypes ((ValueCell!15482 0))(
  ( (ValueCellFull!15482 (v!19047 V!48755)) (EmptyCell!15482) )
))
(declare-datatypes ((array!82616 0))(
  ( (array!82617 (arr!39845 (Array (_ BitVec 32) ValueCell!15482)) (size!40381 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82616)

(declare-fun e!722865 () Bool)

(declare-fun array_inv!30317 (array!82616) Bool)

(assert (=> start!106982 (and (array_inv!30317 _values!1134) e!722865)))

(assert (=> start!106982 true))

(declare-datatypes ((array!82618 0))(
  ( (array!82619 (arr!39846 (Array (_ BitVec 32) (_ BitVec 64))) (size!40382 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82618)

(declare-fun array_inv!30318 (array!82618) Bool)

(assert (=> start!106982 (array_inv!30318 _keys!1364)))

(declare-fun b!1268537 () Bool)

(declare-fun res!844301 () Bool)

(assert (=> b!1268537 (=> (not res!844301) (not e!722868))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268537 (= res!844301 (and (= (size!40381 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40382 _keys!1364) (size!40381 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268538 () Bool)

(declare-fun e!722866 () Bool)

(declare-fun mapRes!50587 () Bool)

(assert (=> b!1268538 (= e!722865 (and e!722866 mapRes!50587))))

(declare-fun condMapEmpty!50587 () Bool)

(declare-fun mapDefault!50587 () ValueCell!15482)

