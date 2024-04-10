; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3802 () Bool)

(assert start!3802)

(declare-fun mapNonEmpty!1201 () Bool)

(declare-fun mapRes!1201 () Bool)

(declare-fun tp!3721 () Bool)

(declare-fun e!17369 () Bool)

(assert (=> mapNonEmpty!1201 (= mapRes!1201 (and tp!3721 e!17369))))

(declare-datatypes ((V!1323 0))(
  ( (V!1324 (val!588 Int)) )
))
(declare-datatypes ((ValueCell!362 0))(
  ( (ValueCellFull!362 (v!1674 V!1323)) (EmptyCell!362) )
))
(declare-datatypes ((array!1485 0))(
  ( (array!1486 (arr!700 (Array (_ BitVec 32) ValueCell!362)) (size!801 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1485)

(declare-fun mapValue!1201 () ValueCell!362)

(declare-fun mapRest!1201 () (Array (_ BitVec 32) ValueCell!362))

(declare-fun mapKey!1201 () (_ BitVec 32))

(assert (=> mapNonEmpty!1201 (= (arr!700 _values!1501) (store mapRest!1201 mapKey!1201 mapValue!1201))))

(declare-fun res!15785 () Bool)

(declare-fun e!17365 () Bool)

(assert (=> start!3802 (=> (not res!15785) (not e!17365))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3802 (= res!15785 (validMask!0 mask!2294))))

(assert (=> start!3802 e!17365))

(assert (=> start!3802 true))

(declare-fun e!17366 () Bool)

(declare-fun array_inv!481 (array!1485) Bool)

(assert (=> start!3802 (and (array_inv!481 _values!1501) e!17366)))

(declare-datatypes ((array!1487 0))(
  ( (array!1488 (arr!701 (Array (_ BitVec 32) (_ BitVec 64))) (size!802 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1487)

(declare-fun array_inv!482 (array!1487) Bool)

(assert (=> start!3802 (array_inv!482 _keys!1833)))

(declare-fun mapIsEmpty!1201 () Bool)

(assert (=> mapIsEmpty!1201 mapRes!1201))

(declare-fun b!26616 () Bool)

(declare-fun res!15788 () Bool)

(assert (=> b!26616 (=> (not res!15788) (not e!17365))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26616 (= res!15788 (validKeyInArray!0 k!1304))))

(declare-fun b!26617 () Bool)

(declare-fun e!17367 () Bool)

(declare-fun tp_is_empty!1123 () Bool)

(assert (=> b!26617 (= e!17367 tp_is_empty!1123)))

(declare-fun b!26618 () Bool)

(declare-fun res!15786 () Bool)

(assert (=> b!26618 (=> (not res!15786) (not e!17365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1487 (_ BitVec 32)) Bool)

(assert (=> b!26618 (= res!15786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26619 () Bool)

(declare-fun res!15787 () Bool)

(assert (=> b!26619 (=> (not res!15787) (not e!17365))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26619 (= res!15787 (and (= (size!801 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!802 _keys!1833) (size!801 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26620 () Bool)

(assert (=> b!26620 (= e!17365 (bvsgt #b00000000000000000000000000000000 (size!802 _keys!1833)))))

(declare-fun b!26621 () Bool)

(declare-fun res!15789 () Bool)

(assert (=> b!26621 (=> (not res!15789) (not e!17365))))

(declare-datatypes ((List!596 0))(
  ( (Nil!593) (Cons!592 (h!1159 (_ BitVec 64)) (t!3283 List!596)) )
))
(declare-fun arrayNoDuplicates!0 (array!1487 (_ BitVec 32) List!596) Bool)

(assert (=> b!26621 (= res!15789 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!593))))

(declare-fun b!26622 () Bool)

(assert (=> b!26622 (= e!17366 (and e!17367 mapRes!1201))))

(declare-fun condMapEmpty!1201 () Bool)

(declare-fun mapDefault!1201 () ValueCell!362)

