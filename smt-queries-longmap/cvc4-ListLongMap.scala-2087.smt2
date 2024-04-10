; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35694 () Bool)

(assert start!35694)

(declare-fun res!199277 () Bool)

(declare-fun e!219478 () Bool)

(assert (=> start!35694 (=> (not res!199277) (not e!219478))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35694 (= res!199277 (validMask!0 mask!1842))))

(assert (=> start!35694 e!219478))

(assert (=> start!35694 true))

(declare-datatypes ((V!11839 0))(
  ( (V!11840 (val!4118 Int)) )
))
(declare-datatypes ((ValueCell!3730 0))(
  ( (ValueCellFull!3730 (v!6312 V!11839)) (EmptyCell!3730) )
))
(declare-datatypes ((array!19859 0))(
  ( (array!19860 (arr!9423 (Array (_ BitVec 32) ValueCell!3730)) (size!9775 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19859)

(declare-fun e!219481 () Bool)

(declare-fun array_inv!6928 (array!19859) Bool)

(assert (=> start!35694 (and (array_inv!6928 _values!1208) e!219481)))

(declare-datatypes ((array!19861 0))(
  ( (array!19862 (arr!9424 (Array (_ BitVec 32) (_ BitVec 64))) (size!9776 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19861)

(declare-fun array_inv!6929 (array!19861) Bool)

(assert (=> start!35694 (array_inv!6929 _keys!1456)))

(declare-fun b!358535 () Bool)

(declare-fun e!219480 () Bool)

(declare-fun tp_is_empty!8147 () Bool)

(assert (=> b!358535 (= e!219480 tp_is_empty!8147)))

(declare-fun b!358536 () Bool)

(assert (=> b!358536 (= e!219478 false)))

(declare-fun lt!166208 () Bool)

(declare-datatypes ((List!5435 0))(
  ( (Nil!5432) (Cons!5431 (h!6287 (_ BitVec 64)) (t!10585 List!5435)) )
))
(declare-fun arrayNoDuplicates!0 (array!19861 (_ BitVec 32) List!5435) Bool)

(assert (=> b!358536 (= lt!166208 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5432))))

(declare-fun b!358537 () Bool)

(declare-fun res!199279 () Bool)

(assert (=> b!358537 (=> (not res!199279) (not e!219478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19861 (_ BitVec 32)) Bool)

(assert (=> b!358537 (= res!199279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13728 () Bool)

(declare-fun mapRes!13728 () Bool)

(declare-fun tp!27786 () Bool)

(declare-fun e!219479 () Bool)

(assert (=> mapNonEmpty!13728 (= mapRes!13728 (and tp!27786 e!219479))))

(declare-fun mapRest!13728 () (Array (_ BitVec 32) ValueCell!3730))

(declare-fun mapValue!13728 () ValueCell!3730)

(declare-fun mapKey!13728 () (_ BitVec 32))

(assert (=> mapNonEmpty!13728 (= (arr!9423 _values!1208) (store mapRest!13728 mapKey!13728 mapValue!13728))))

(declare-fun b!358538 () Bool)

(assert (=> b!358538 (= e!219481 (and e!219480 mapRes!13728))))

(declare-fun condMapEmpty!13728 () Bool)

(declare-fun mapDefault!13728 () ValueCell!3730)

