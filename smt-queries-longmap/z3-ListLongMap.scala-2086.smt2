; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35670 () Bool)

(assert start!35670)

(declare-fun b!358392 () Bool)

(declare-fun res!199229 () Bool)

(declare-fun e!219369 () Bool)

(assert (=> b!358392 (=> (not res!199229) (not e!219369))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19822 0))(
  ( (array!19823 (arr!9404 (Array (_ BitVec 32) (_ BitVec 64))) (size!9756 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19822)

(declare-datatypes ((V!11827 0))(
  ( (V!11828 (val!4113 Int)) )
))
(declare-datatypes ((ValueCell!3725 0))(
  ( (ValueCellFull!3725 (v!6308 V!11827)) (EmptyCell!3725) )
))
(declare-datatypes ((array!19824 0))(
  ( (array!19825 (arr!9405 (Array (_ BitVec 32) ValueCell!3725)) (size!9757 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19824)

(assert (=> b!358392 (= res!199229 (and (= (size!9757 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9756 _keys!1456) (size!9757 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358393 () Bool)

(declare-fun e!219371 () Bool)

(declare-fun tp_is_empty!8137 () Bool)

(assert (=> b!358393 (= e!219371 tp_is_empty!8137)))

(declare-fun b!358394 () Bool)

(declare-fun res!199230 () Bool)

(assert (=> b!358394 (=> (not res!199230) (not e!219369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19822 (_ BitVec 32)) Bool)

(assert (=> b!358394 (= res!199230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358395 () Bool)

(declare-fun e!219373 () Bool)

(assert (=> b!358395 (= e!219373 tp_is_empty!8137)))

(declare-fun mapIsEmpty!13713 () Bool)

(declare-fun mapRes!13713 () Bool)

(assert (=> mapIsEmpty!13713 mapRes!13713))

(declare-fun b!358396 () Bool)

(declare-fun e!219370 () Bool)

(assert (=> b!358396 (= e!219370 (and e!219371 mapRes!13713))))

(declare-fun condMapEmpty!13713 () Bool)

(declare-fun mapDefault!13713 () ValueCell!3725)

(assert (=> b!358396 (= condMapEmpty!13713 (= (arr!9405 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3725)) mapDefault!13713)))))

(declare-fun res!199231 () Bool)

(assert (=> start!35670 (=> (not res!199231) (not e!219369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35670 (= res!199231 (validMask!0 mask!1842))))

(assert (=> start!35670 e!219369))

(assert (=> start!35670 true))

(declare-fun array_inv!6950 (array!19824) Bool)

(assert (=> start!35670 (and (array_inv!6950 _values!1208) e!219370)))

(declare-fun array_inv!6951 (array!19822) Bool)

(assert (=> start!35670 (array_inv!6951 _keys!1456)))

(declare-fun b!358397 () Bool)

(assert (=> b!358397 (= e!219369 false)))

(declare-fun lt!166211 () Bool)

(declare-datatypes ((List!5341 0))(
  ( (Nil!5338) (Cons!5337 (h!6193 (_ BitVec 64)) (t!10483 List!5341)) )
))
(declare-fun arrayNoDuplicates!0 (array!19822 (_ BitVec 32) List!5341) Bool)

(assert (=> b!358397 (= lt!166211 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5338))))

(declare-fun mapNonEmpty!13713 () Bool)

(declare-fun tp!27771 () Bool)

(assert (=> mapNonEmpty!13713 (= mapRes!13713 (and tp!27771 e!219373))))

(declare-fun mapRest!13713 () (Array (_ BitVec 32) ValueCell!3725))

(declare-fun mapKey!13713 () (_ BitVec 32))

(declare-fun mapValue!13713 () ValueCell!3725)

(assert (=> mapNonEmpty!13713 (= (arr!9405 _values!1208) (store mapRest!13713 mapKey!13713 mapValue!13713))))

(assert (= (and start!35670 res!199231) b!358392))

(assert (= (and b!358392 res!199229) b!358394))

(assert (= (and b!358394 res!199230) b!358397))

(assert (= (and b!358396 condMapEmpty!13713) mapIsEmpty!13713))

(assert (= (and b!358396 (not condMapEmpty!13713)) mapNonEmpty!13713))

(get-info :version)

(assert (= (and mapNonEmpty!13713 ((_ is ValueCellFull!3725) mapValue!13713)) b!358395))

(assert (= (and b!358396 ((_ is ValueCellFull!3725) mapDefault!13713)) b!358393))

(assert (= start!35670 b!358396))

(declare-fun m!356499 () Bool)

(assert (=> b!358394 m!356499))

(declare-fun m!356501 () Bool)

(assert (=> start!35670 m!356501))

(declare-fun m!356503 () Bool)

(assert (=> start!35670 m!356503))

(declare-fun m!356505 () Bool)

(assert (=> start!35670 m!356505))

(declare-fun m!356507 () Bool)

(assert (=> b!358397 m!356507))

(declare-fun m!356509 () Bool)

(assert (=> mapNonEmpty!13713 m!356509))

(check-sat (not b!358397) tp_is_empty!8137 (not mapNonEmpty!13713) (not start!35670) (not b!358394))
(check-sat)
