; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35684 () Bool)

(assert start!35684)

(declare-fun b!358446 () Bool)

(declare-fun res!199233 () Bool)

(declare-fun e!219404 () Bool)

(assert (=> b!358446 (=> (not res!199233) (not e!219404))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19839 0))(
  ( (array!19840 (arr!9413 (Array (_ BitVec 32) (_ BitVec 64))) (size!9765 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19839)

(declare-datatypes ((V!11827 0))(
  ( (V!11828 (val!4113 Int)) )
))
(declare-datatypes ((ValueCell!3725 0))(
  ( (ValueCellFull!3725 (v!6307 V!11827)) (EmptyCell!3725) )
))
(declare-datatypes ((array!19841 0))(
  ( (array!19842 (arr!9414 (Array (_ BitVec 32) ValueCell!3725)) (size!9766 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19841)

(assert (=> b!358446 (= res!199233 (and (= (size!9766 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9765 _keys!1456) (size!9766 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13713 () Bool)

(declare-fun mapRes!13713 () Bool)

(declare-fun tp!27771 () Bool)

(declare-fun e!219403 () Bool)

(assert (=> mapNonEmpty!13713 (= mapRes!13713 (and tp!27771 e!219403))))

(declare-fun mapRest!13713 () (Array (_ BitVec 32) ValueCell!3725))

(declare-fun mapKey!13713 () (_ BitVec 32))

(declare-fun mapValue!13713 () ValueCell!3725)

(assert (=> mapNonEmpty!13713 (= (arr!9414 _values!1208) (store mapRest!13713 mapKey!13713 mapValue!13713))))

(declare-fun b!358447 () Bool)

(declare-fun e!219406 () Bool)

(declare-fun tp_is_empty!8137 () Bool)

(assert (=> b!358447 (= e!219406 tp_is_empty!8137)))

(declare-fun b!358448 () Bool)

(assert (=> b!358448 (= e!219403 tp_is_empty!8137)))

(declare-fun mapIsEmpty!13713 () Bool)

(assert (=> mapIsEmpty!13713 mapRes!13713))

(declare-fun res!199232 () Bool)

(assert (=> start!35684 (=> (not res!199232) (not e!219404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35684 (= res!199232 (validMask!0 mask!1842))))

(assert (=> start!35684 e!219404))

(assert (=> start!35684 true))

(declare-fun e!219405 () Bool)

(declare-fun array_inv!6920 (array!19841) Bool)

(assert (=> start!35684 (and (array_inv!6920 _values!1208) e!219405)))

(declare-fun array_inv!6921 (array!19839) Bool)

(assert (=> start!35684 (array_inv!6921 _keys!1456)))

(declare-fun b!358445 () Bool)

(declare-fun res!199234 () Bool)

(assert (=> b!358445 (=> (not res!199234) (not e!219404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19839 (_ BitVec 32)) Bool)

(assert (=> b!358445 (= res!199234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358449 () Bool)

(assert (=> b!358449 (= e!219404 false)))

(declare-fun lt!166193 () Bool)

(declare-datatypes ((List!5431 0))(
  ( (Nil!5428) (Cons!5427 (h!6283 (_ BitVec 64)) (t!10581 List!5431)) )
))
(declare-fun arrayNoDuplicates!0 (array!19839 (_ BitVec 32) List!5431) Bool)

(assert (=> b!358449 (= lt!166193 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5428))))

(declare-fun b!358450 () Bool)

(assert (=> b!358450 (= e!219405 (and e!219406 mapRes!13713))))

(declare-fun condMapEmpty!13713 () Bool)

(declare-fun mapDefault!13713 () ValueCell!3725)

