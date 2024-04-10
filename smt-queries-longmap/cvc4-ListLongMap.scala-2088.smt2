; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35700 () Bool)

(assert start!35700)

(declare-fun mapNonEmpty!13737 () Bool)

(declare-fun mapRes!13737 () Bool)

(declare-fun tp!27795 () Bool)

(declare-fun e!219527 () Bool)

(assert (=> mapNonEmpty!13737 (= mapRes!13737 (and tp!27795 e!219527))))

(declare-datatypes ((V!11847 0))(
  ( (V!11848 (val!4121 Int)) )
))
(declare-datatypes ((ValueCell!3733 0))(
  ( (ValueCellFull!3733 (v!6315 V!11847)) (EmptyCell!3733) )
))
(declare-fun mapValue!13737 () ValueCell!3733)

(declare-fun mapKey!13737 () (_ BitVec 32))

(declare-datatypes ((array!19871 0))(
  ( (array!19872 (arr!9429 (Array (_ BitVec 32) ValueCell!3733)) (size!9781 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19871)

(declare-fun mapRest!13737 () (Array (_ BitVec 32) ValueCell!3733))

(assert (=> mapNonEmpty!13737 (= (arr!9429 _values!1208) (store mapRest!13737 mapKey!13737 mapValue!13737))))

(declare-fun b!358589 () Bool)

(declare-fun e!219525 () Bool)

(declare-fun tp_is_empty!8153 () Bool)

(assert (=> b!358589 (= e!219525 tp_is_empty!8153)))

(declare-fun b!358590 () Bool)

(assert (=> b!358590 (= e!219527 tp_is_empty!8153)))

(declare-fun b!358591 () Bool)

(declare-fun res!199306 () Bool)

(declare-fun e!219524 () Bool)

(assert (=> b!358591 (=> (not res!199306) (not e!219524))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19873 0))(
  ( (array!19874 (arr!9430 (Array (_ BitVec 32) (_ BitVec 64))) (size!9782 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19873)

(assert (=> b!358591 (= res!199306 (and (= (size!9781 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9782 _keys!1456) (size!9781 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358592 () Bool)

(assert (=> b!358592 (= e!219524 false)))

(declare-fun lt!166217 () Bool)

(declare-datatypes ((List!5437 0))(
  ( (Nil!5434) (Cons!5433 (h!6289 (_ BitVec 64)) (t!10587 List!5437)) )
))
(declare-fun arrayNoDuplicates!0 (array!19873 (_ BitVec 32) List!5437) Bool)

(assert (=> b!358592 (= lt!166217 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5434))))

(declare-fun b!358593 () Bool)

(declare-fun res!199305 () Bool)

(assert (=> b!358593 (=> (not res!199305) (not e!219524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19873 (_ BitVec 32)) Bool)

(assert (=> b!358593 (= res!199305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199304 () Bool)

(assert (=> start!35700 (=> (not res!199304) (not e!219524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35700 (= res!199304 (validMask!0 mask!1842))))

(assert (=> start!35700 e!219524))

(assert (=> start!35700 true))

(declare-fun e!219526 () Bool)

(declare-fun array_inv!6934 (array!19871) Bool)

(assert (=> start!35700 (and (array_inv!6934 _values!1208) e!219526)))

(declare-fun array_inv!6935 (array!19873) Bool)

(assert (=> start!35700 (array_inv!6935 _keys!1456)))

(declare-fun b!358594 () Bool)

(assert (=> b!358594 (= e!219526 (and e!219525 mapRes!13737))))

(declare-fun condMapEmpty!13737 () Bool)

(declare-fun mapDefault!13737 () ValueCell!3733)

