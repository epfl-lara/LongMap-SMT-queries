; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35690 () Bool)

(assert start!35690)

(declare-fun res!199260 () Bool)

(declare-fun e!219451 () Bool)

(assert (=> start!35690 (=> (not res!199260) (not e!219451))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35690 (= res!199260 (validMask!0 mask!1842))))

(assert (=> start!35690 e!219451))

(assert (=> start!35690 true))

(declare-datatypes ((V!11835 0))(
  ( (V!11836 (val!4116 Int)) )
))
(declare-datatypes ((ValueCell!3728 0))(
  ( (ValueCellFull!3728 (v!6310 V!11835)) (EmptyCell!3728) )
))
(declare-datatypes ((array!19851 0))(
  ( (array!19852 (arr!9419 (Array (_ BitVec 32) ValueCell!3728)) (size!9771 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19851)

(declare-fun e!219449 () Bool)

(declare-fun array_inv!6924 (array!19851) Bool)

(assert (=> start!35690 (and (array_inv!6924 _values!1208) e!219449)))

(declare-datatypes ((array!19853 0))(
  ( (array!19854 (arr!9420 (Array (_ BitVec 32) (_ BitVec 64))) (size!9772 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19853)

(declare-fun array_inv!6925 (array!19853) Bool)

(assert (=> start!35690 (array_inv!6925 _keys!1456)))

(declare-fun b!358499 () Bool)

(declare-fun e!219452 () Bool)

(declare-fun tp_is_empty!8143 () Bool)

(assert (=> b!358499 (= e!219452 tp_is_empty!8143)))

(declare-fun mapNonEmpty!13722 () Bool)

(declare-fun mapRes!13722 () Bool)

(declare-fun tp!27780 () Bool)

(declare-fun e!219450 () Bool)

(assert (=> mapNonEmpty!13722 (= mapRes!13722 (and tp!27780 e!219450))))

(declare-fun mapKey!13722 () (_ BitVec 32))

(declare-fun mapRest!13722 () (Array (_ BitVec 32) ValueCell!3728))

(declare-fun mapValue!13722 () ValueCell!3728)

(assert (=> mapNonEmpty!13722 (= (arr!9419 _values!1208) (store mapRest!13722 mapKey!13722 mapValue!13722))))

(declare-fun b!358500 () Bool)

(declare-fun res!199261 () Bool)

(assert (=> b!358500 (=> (not res!199261) (not e!219451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19853 (_ BitVec 32)) Bool)

(assert (=> b!358500 (= res!199261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358501 () Bool)

(assert (=> b!358501 (= e!219449 (and e!219452 mapRes!13722))))

(declare-fun condMapEmpty!13722 () Bool)

(declare-fun mapDefault!13722 () ValueCell!3728)

