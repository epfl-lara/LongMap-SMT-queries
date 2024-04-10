; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107172 () Bool)

(assert start!107172)

(declare-fun mapNonEmpty!50872 () Bool)

(declare-fun mapRes!50872 () Bool)

(declare-fun tp!97213 () Bool)

(declare-fun e!724291 () Bool)

(assert (=> mapNonEmpty!50872 (= mapRes!50872 (and tp!97213 e!724291))))

(declare-datatypes ((V!49007 0))(
  ( (V!49008 (val!16505 Int)) )
))
(declare-datatypes ((ValueCell!15577 0))(
  ( (ValueCellFull!15577 (v!19142 V!49007)) (EmptyCell!15577) )
))
(declare-datatypes ((array!82982 0))(
  ( (array!82983 (arr!40028 (Array (_ BitVec 32) ValueCell!15577)) (size!40564 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82982)

(declare-fun mapValue!50872 () ValueCell!15577)

(declare-fun mapKey!50872 () (_ BitVec 32))

(declare-fun mapRest!50872 () (Array (_ BitVec 32) ValueCell!15577))

(assert (=> mapNonEmpty!50872 (= (arr!40028 _values!1134) (store mapRest!50872 mapKey!50872 mapValue!50872))))

(declare-fun b!1270571 () Bool)

(declare-fun e!724289 () Bool)

(assert (=> b!1270571 (= e!724289 false)))

(declare-fun lt!574728 () Bool)

(declare-datatypes ((array!82984 0))(
  ( (array!82985 (arr!40029 (Array (_ BitVec 32) (_ BitVec 64))) (size!40565 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82984)

(declare-datatypes ((List!28493 0))(
  ( (Nil!28490) (Cons!28489 (h!29698 (_ BitVec 64)) (t!42022 List!28493)) )
))
(declare-fun arrayNoDuplicates!0 (array!82984 (_ BitVec 32) List!28493) Bool)

(assert (=> b!1270571 (= lt!574728 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28490))))

(declare-fun b!1270572 () Bool)

(declare-fun res!845478 () Bool)

(assert (=> b!1270572 (=> (not res!845478) (not e!724289))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82984 (_ BitVec 32)) Bool)

(assert (=> b!1270572 (= res!845478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270573 () Bool)

(declare-fun res!845479 () Bool)

(assert (=> b!1270573 (=> (not res!845479) (not e!724289))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270573 (= res!845479 (and (= (size!40564 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40565 _keys!1364) (size!40564 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845480 () Bool)

(assert (=> start!107172 (=> (not res!845480) (not e!724289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107172 (= res!845480 (validMask!0 mask!1730))))

(assert (=> start!107172 e!724289))

(declare-fun e!724293 () Bool)

(declare-fun array_inv!30447 (array!82982) Bool)

(assert (=> start!107172 (and (array_inv!30447 _values!1134) e!724293)))

(assert (=> start!107172 true))

(declare-fun array_inv!30448 (array!82984) Bool)

(assert (=> start!107172 (array_inv!30448 _keys!1364)))

(declare-fun mapIsEmpty!50872 () Bool)

(assert (=> mapIsEmpty!50872 mapRes!50872))

(declare-fun b!1270574 () Bool)

(declare-fun e!724292 () Bool)

(assert (=> b!1270574 (= e!724293 (and e!724292 mapRes!50872))))

(declare-fun condMapEmpty!50872 () Bool)

(declare-fun mapDefault!50872 () ValueCell!15577)

