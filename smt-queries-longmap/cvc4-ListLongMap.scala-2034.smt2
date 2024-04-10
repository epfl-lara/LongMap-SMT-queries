; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35376 () Bool)

(assert start!35376)

(declare-fun mapNonEmpty!13251 () Bool)

(declare-fun mapRes!13251 () Bool)

(declare-fun tp!27147 () Bool)

(declare-fun e!217016 () Bool)

(assert (=> mapNonEmpty!13251 (= mapRes!13251 (and tp!27147 e!217016))))

(declare-datatypes ((V!11415 0))(
  ( (V!11416 (val!3959 Int)) )
))
(declare-datatypes ((ValueCell!3571 0))(
  ( (ValueCellFull!3571 (v!6153 V!11415)) (EmptyCell!3571) )
))
(declare-fun mapValue!13251 () ValueCell!3571)

(declare-fun mapRest!13251 () (Array (_ BitVec 32) ValueCell!3571))

(declare-datatypes ((array!19245 0))(
  ( (array!19246 (arr!9116 (Array (_ BitVec 32) ValueCell!3571)) (size!9468 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19245)

(declare-fun mapKey!13251 () (_ BitVec 32))

(assert (=> mapNonEmpty!13251 (= (arr!9116 _values!1208) (store mapRest!13251 mapKey!13251 mapValue!13251))))

(declare-fun mapIsEmpty!13251 () Bool)

(assert (=> mapIsEmpty!13251 mapRes!13251))

(declare-fun res!196343 () Bool)

(declare-fun e!217013 () Bool)

(assert (=> start!35376 (=> (not res!196343) (not e!217013))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35376 (= res!196343 (validMask!0 mask!1842))))

(assert (=> start!35376 e!217013))

(assert (=> start!35376 true))

(declare-fun e!217012 () Bool)

(declare-fun array_inv!6708 (array!19245) Bool)

(assert (=> start!35376 (and (array_inv!6708 _values!1208) e!217012)))

(declare-datatypes ((array!19247 0))(
  ( (array!19248 (arr!9117 (Array (_ BitVec 32) (_ BitVec 64))) (size!9469 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19247)

(declare-fun array_inv!6709 (array!19247) Bool)

(assert (=> start!35376 (array_inv!6709 _keys!1456)))

(declare-fun b!354170 () Bool)

(declare-fun res!196345 () Bool)

(assert (=> b!354170 (=> (not res!196345) (not e!217013))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354170 (= res!196345 (and (= (size!9468 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9469 _keys!1456) (size!9468 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354171 () Bool)

(declare-fun e!217015 () Bool)

(assert (=> b!354171 (= e!217012 (and e!217015 mapRes!13251))))

(declare-fun condMapEmpty!13251 () Bool)

(declare-fun mapDefault!13251 () ValueCell!3571)

