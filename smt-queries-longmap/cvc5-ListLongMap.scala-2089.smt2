; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35702 () Bool)

(assert start!35702)

(declare-fun res!199313 () Bool)

(declare-fun e!219541 () Bool)

(assert (=> start!35702 (=> (not res!199313) (not e!219541))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35702 (= res!199313 (validMask!0 mask!1842))))

(assert (=> start!35702 e!219541))

(assert (=> start!35702 true))

(declare-datatypes ((V!11851 0))(
  ( (V!11852 (val!4122 Int)) )
))
(declare-datatypes ((ValueCell!3734 0))(
  ( (ValueCellFull!3734 (v!6316 V!11851)) (EmptyCell!3734) )
))
(declare-datatypes ((array!19875 0))(
  ( (array!19876 (arr!9431 (Array (_ BitVec 32) ValueCell!3734)) (size!9783 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19875)

(declare-fun e!219538 () Bool)

(declare-fun array_inv!6936 (array!19875) Bool)

(assert (=> start!35702 (and (array_inv!6936 _values!1208) e!219538)))

(declare-datatypes ((array!19877 0))(
  ( (array!19878 (arr!9432 (Array (_ BitVec 32) (_ BitVec 64))) (size!9784 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19877)

(declare-fun array_inv!6937 (array!19877) Bool)

(assert (=> start!35702 (array_inv!6937 _keys!1456)))

(declare-fun b!358607 () Bool)

(assert (=> b!358607 (= e!219541 false)))

(declare-fun lt!166220 () Bool)

(declare-datatypes ((List!5438 0))(
  ( (Nil!5435) (Cons!5434 (h!6290 (_ BitVec 64)) (t!10588 List!5438)) )
))
(declare-fun arrayNoDuplicates!0 (array!19877 (_ BitVec 32) List!5438) Bool)

(assert (=> b!358607 (= lt!166220 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5435))))

(declare-fun mapNonEmpty!13740 () Bool)

(declare-fun mapRes!13740 () Bool)

(declare-fun tp!27798 () Bool)

(declare-fun e!219539 () Bool)

(assert (=> mapNonEmpty!13740 (= mapRes!13740 (and tp!27798 e!219539))))

(declare-fun mapValue!13740 () ValueCell!3734)

(declare-fun mapRest!13740 () (Array (_ BitVec 32) ValueCell!3734))

(declare-fun mapKey!13740 () (_ BitVec 32))

(assert (=> mapNonEmpty!13740 (= (arr!9431 _values!1208) (store mapRest!13740 mapKey!13740 mapValue!13740))))

(declare-fun b!358608 () Bool)

(declare-fun res!199314 () Bool)

(assert (=> b!358608 (=> (not res!199314) (not e!219541))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358608 (= res!199314 (and (= (size!9783 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9784 _keys!1456) (size!9783 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358609 () Bool)

(declare-fun tp_is_empty!8155 () Bool)

(assert (=> b!358609 (= e!219539 tp_is_empty!8155)))

(declare-fun b!358610 () Bool)

(declare-fun e!219542 () Bool)

(assert (=> b!358610 (= e!219538 (and e!219542 mapRes!13740))))

(declare-fun condMapEmpty!13740 () Bool)

(declare-fun mapDefault!13740 () ValueCell!3734)

