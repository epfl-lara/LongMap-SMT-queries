; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3790 () Bool)

(assert start!3790)

(declare-fun res!15729 () Bool)

(declare-fun e!17278 () Bool)

(assert (=> start!3790 (=> (not res!15729) (not e!17278))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3790 (= res!15729 (validMask!0 mask!2294))))

(assert (=> start!3790 e!17278))

(assert (=> start!3790 true))

(declare-datatypes ((V!1307 0))(
  ( (V!1308 (val!582 Int)) )
))
(declare-datatypes ((ValueCell!356 0))(
  ( (ValueCellFull!356 (v!1668 V!1307)) (EmptyCell!356) )
))
(declare-datatypes ((array!1465 0))(
  ( (array!1466 (arr!690 (Array (_ BitVec 32) ValueCell!356)) (size!791 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1465)

(declare-fun e!17279 () Bool)

(declare-fun array_inv!473 (array!1465) Bool)

(assert (=> start!3790 (and (array_inv!473 _values!1501) e!17279)))

(declare-datatypes ((array!1467 0))(
  ( (array!1468 (arr!691 (Array (_ BitVec 32) (_ BitVec 64))) (size!792 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1467)

(declare-fun array_inv!474 (array!1467) Bool)

(assert (=> start!3790 (array_inv!474 _keys!1833)))

(declare-fun mapNonEmpty!1183 () Bool)

(declare-fun mapRes!1183 () Bool)

(declare-fun tp!3703 () Bool)

(declare-fun e!17276 () Bool)

(assert (=> mapNonEmpty!1183 (= mapRes!1183 (and tp!3703 e!17276))))

(declare-fun mapKey!1183 () (_ BitVec 32))

(declare-fun mapValue!1183 () ValueCell!356)

(declare-fun mapRest!1183 () (Array (_ BitVec 32) ValueCell!356))

(assert (=> mapNonEmpty!1183 (= (arr!690 _values!1501) (store mapRest!1183 mapKey!1183 mapValue!1183))))

(declare-fun b!26504 () Bool)

(assert (=> b!26504 (= e!17278 false)))

(declare-fun lt!10376 () Bool)

(declare-datatypes ((List!592 0))(
  ( (Nil!589) (Cons!588 (h!1155 (_ BitVec 64)) (t!3279 List!592)) )
))
(declare-fun arrayNoDuplicates!0 (array!1467 (_ BitVec 32) List!592) Bool)

(assert (=> b!26504 (= lt!10376 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!589))))

(declare-fun b!26505 () Bool)

(declare-fun tp_is_empty!1111 () Bool)

(assert (=> b!26505 (= e!17276 tp_is_empty!1111)))

(declare-fun b!26506 () Bool)

(declare-fun res!15728 () Bool)

(assert (=> b!26506 (=> (not res!15728) (not e!17278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1467 (_ BitVec 32)) Bool)

(assert (=> b!26506 (= res!15728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26507 () Bool)

(declare-fun res!15727 () Bool)

(assert (=> b!26507 (=> (not res!15727) (not e!17278))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26507 (= res!15727 (and (= (size!791 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!792 _keys!1833) (size!791 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1183 () Bool)

(assert (=> mapIsEmpty!1183 mapRes!1183))

(declare-fun b!26508 () Bool)

(declare-fun e!17277 () Bool)

(assert (=> b!26508 (= e!17279 (and e!17277 mapRes!1183))))

(declare-fun condMapEmpty!1183 () Bool)

(declare-fun mapDefault!1183 () ValueCell!356)

