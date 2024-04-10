; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35486 () Bool)

(assert start!35486)

(declare-fun res!197326 () Bool)

(declare-fun e!217838 () Bool)

(assert (=> start!35486 (=> (not res!197326) (not e!217838))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35486 (= res!197326 (validMask!0 mask!1842))))

(assert (=> start!35486 e!217838))

(assert (=> start!35486 true))

(declare-datatypes ((V!11563 0))(
  ( (V!11564 (val!4014 Int)) )
))
(declare-datatypes ((ValueCell!3626 0))(
  ( (ValueCellFull!3626 (v!6208 V!11563)) (EmptyCell!3626) )
))
(declare-datatypes ((array!19457 0))(
  ( (array!19458 (arr!9222 (Array (_ BitVec 32) ValueCell!3626)) (size!9574 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19457)

(declare-fun e!217840 () Bool)

(declare-fun array_inv!6776 (array!19457) Bool)

(assert (=> start!35486 (and (array_inv!6776 _values!1208) e!217840)))

(declare-datatypes ((array!19459 0))(
  ( (array!19460 (arr!9223 (Array (_ BitVec 32) (_ BitVec 64))) (size!9575 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19459)

(declare-fun array_inv!6777 (array!19459) Bool)

(assert (=> start!35486 (array_inv!6777 _keys!1456)))

(declare-fun b!355646 () Bool)

(declare-fun e!217837 () Bool)

(declare-fun tp_is_empty!7939 () Bool)

(assert (=> b!355646 (= e!217837 tp_is_empty!7939)))

(declare-fun mapNonEmpty!13416 () Bool)

(declare-fun mapRes!13416 () Bool)

(declare-fun tp!27393 () Bool)

(assert (=> mapNonEmpty!13416 (= mapRes!13416 (and tp!27393 e!217837))))

(declare-fun mapKey!13416 () (_ BitVec 32))

(declare-fun mapRest!13416 () (Array (_ BitVec 32) ValueCell!3626))

(declare-fun mapValue!13416 () ValueCell!3626)

(assert (=> mapNonEmpty!13416 (= (arr!9222 _values!1208) (store mapRest!13416 mapKey!13416 mapValue!13416))))

(declare-fun b!355647 () Bool)

(declare-fun res!197325 () Bool)

(assert (=> b!355647 (=> (not res!197325) (not e!217838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19459 (_ BitVec 32)) Bool)

(assert (=> b!355647 (= res!197325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355648 () Bool)

(assert (=> b!355648 (= e!217838 false)))

(declare-fun lt!165824 () Bool)

(declare-datatypes ((List!5343 0))(
  ( (Nil!5340) (Cons!5339 (h!6195 (_ BitVec 64)) (t!10493 List!5343)) )
))
(declare-fun arrayNoDuplicates!0 (array!19459 (_ BitVec 32) List!5343) Bool)

(assert (=> b!355648 (= lt!165824 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5340))))

(declare-fun b!355649 () Bool)

(declare-fun e!217839 () Bool)

(assert (=> b!355649 (= e!217839 tp_is_empty!7939)))

(declare-fun b!355650 () Bool)

(declare-fun res!197324 () Bool)

(assert (=> b!355650 (=> (not res!197324) (not e!217838))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355650 (= res!197324 (and (= (size!9574 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9575 _keys!1456) (size!9574 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13416 () Bool)

(assert (=> mapIsEmpty!13416 mapRes!13416))

(declare-fun b!355651 () Bool)

(assert (=> b!355651 (= e!217840 (and e!217839 mapRes!13416))))

(declare-fun condMapEmpty!13416 () Bool)

(declare-fun mapDefault!13416 () ValueCell!3626)

