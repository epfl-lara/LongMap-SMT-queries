; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82790 () Bool)

(assert start!82790)

(declare-fun mapNonEmpty!34582 () Bool)

(declare-fun mapRes!34582 () Bool)

(declare-fun tp!65880 () Bool)

(declare-fun e!544390 () Bool)

(assert (=> mapNonEmpty!34582 (= mapRes!34582 (and tp!65880 e!544390))))

(declare-datatypes ((V!33949 0))(
  ( (V!33950 (val!10913 Int)) )
))
(declare-datatypes ((ValueCell!10381 0))(
  ( (ValueCellFull!10381 (v!13471 V!33949)) (EmptyCell!10381) )
))
(declare-fun mapValue!34582 () ValueCell!10381)

(declare-datatypes ((array!59535 0))(
  ( (array!59536 (arr!28636 (Array (_ BitVec 32) ValueCell!10381)) (size!29115 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59535)

(declare-fun mapRest!34582 () (Array (_ BitVec 32) ValueCell!10381))

(declare-fun mapKey!34582 () (_ BitVec 32))

(assert (=> mapNonEmpty!34582 (= (arr!28636 _values!1400) (store mapRest!34582 mapKey!34582 mapValue!34582))))

(declare-fun b!965698 () Bool)

(declare-fun res!646409 () Bool)

(declare-fun e!544388 () Bool)

(assert (=> b!965698 (=> (not res!646409) (not e!544388))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59537 0))(
  ( (array!59538 (arr!28637 (Array (_ BitVec 32) (_ BitVec 64))) (size!29116 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59537)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965698 (= res!646409 (and (= (size!29115 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29116 _keys!1686) (size!29115 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!646408 () Bool)

(assert (=> start!82790 (=> (not res!646408) (not e!544388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82790 (= res!646408 (validMask!0 mask!2110))))

(assert (=> start!82790 e!544388))

(assert (=> start!82790 true))

(declare-fun e!544389 () Bool)

(declare-fun array_inv!22177 (array!59535) Bool)

(assert (=> start!82790 (and (array_inv!22177 _values!1400) e!544389)))

(declare-fun array_inv!22178 (array!59537) Bool)

(assert (=> start!82790 (array_inv!22178 _keys!1686)))

(declare-fun b!965699 () Bool)

(declare-fun res!646410 () Bool)

(assert (=> b!965699 (=> (not res!646410) (not e!544388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59537 (_ BitVec 32)) Bool)

(assert (=> b!965699 (= res!646410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965700 () Bool)

(declare-fun e!544387 () Bool)

(assert (=> b!965700 (= e!544389 (and e!544387 mapRes!34582))))

(declare-fun condMapEmpty!34582 () Bool)

(declare-fun mapDefault!34582 () ValueCell!10381)

