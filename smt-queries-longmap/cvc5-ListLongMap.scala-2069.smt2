; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35582 () Bool)

(assert start!35582)

(declare-fun mapNonEmpty!13560 () Bool)

(declare-fun mapRes!13560 () Bool)

(declare-fun tp!27537 () Bool)

(declare-fun e!218561 () Bool)

(assert (=> mapNonEmpty!13560 (= mapRes!13560 (and tp!27537 e!218561))))

(declare-fun mapKey!13560 () (_ BitVec 32))

(declare-datatypes ((V!11691 0))(
  ( (V!11692 (val!4062 Int)) )
))
(declare-datatypes ((ValueCell!3674 0))(
  ( (ValueCellFull!3674 (v!6256 V!11691)) (EmptyCell!3674) )
))
(declare-fun mapRest!13560 () (Array (_ BitVec 32) ValueCell!3674))

(declare-fun mapValue!13560 () ValueCell!3674)

(declare-datatypes ((array!19639 0))(
  ( (array!19640 (arr!9313 (Array (_ BitVec 32) ValueCell!3674)) (size!9665 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19639)

(assert (=> mapNonEmpty!13560 (= (arr!9313 _values!1208) (store mapRest!13560 mapKey!13560 mapValue!13560))))

(declare-fun res!198040 () Bool)

(declare-fun e!218558 () Bool)

(assert (=> start!35582 (=> (not res!198040) (not e!218558))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35582 (= res!198040 (validMask!0 mask!1842))))

(assert (=> start!35582 e!218558))

(declare-fun tp_is_empty!8035 () Bool)

(assert (=> start!35582 tp_is_empty!8035))

(assert (=> start!35582 true))

(declare-datatypes ((array!19641 0))(
  ( (array!19642 (arr!9314 (Array (_ BitVec 32) (_ BitVec 64))) (size!9666 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19641)

(declare-fun array_inv!6846 (array!19641) Bool)

(assert (=> start!35582 (array_inv!6846 _keys!1456)))

(declare-fun e!218560 () Bool)

(declare-fun array_inv!6847 (array!19639) Bool)

(assert (=> start!35582 (and (array_inv!6847 _values!1208) e!218560)))

(declare-fun b!356790 () Bool)

(declare-fun res!198042 () Bool)

(assert (=> b!356790 (=> (not res!198042) (not e!218558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19641 (_ BitVec 32)) Bool)

(assert (=> b!356790 (= res!198042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356791 () Bool)

(declare-fun e!218559 () Bool)

(assert (=> b!356791 (= e!218560 (and e!218559 mapRes!13560))))

(declare-fun condMapEmpty!13560 () Bool)

(declare-fun mapDefault!13560 () ValueCell!3674)

