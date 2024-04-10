; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35570 () Bool)

(assert start!35570)

(declare-fun b!356592 () Bool)

(declare-fun res!197895 () Bool)

(declare-fun e!218470 () Bool)

(assert (=> b!356592 (=> (not res!197895) (not e!218470))))

(declare-datatypes ((array!19615 0))(
  ( (array!19616 (arr!9301 (Array (_ BitVec 32) (_ BitVec 64))) (size!9653 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19615)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!356592 (= res!197895 (not (= (select (arr!9301 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13542 () Bool)

(declare-fun mapRes!13542 () Bool)

(declare-fun tp!27519 () Bool)

(declare-fun e!218469 () Bool)

(assert (=> mapNonEmpty!13542 (= mapRes!13542 (and tp!27519 e!218469))))

(declare-fun mapKey!13542 () (_ BitVec 32))

(declare-datatypes ((V!11675 0))(
  ( (V!11676 (val!4056 Int)) )
))
(declare-datatypes ((ValueCell!3668 0))(
  ( (ValueCellFull!3668 (v!6250 V!11675)) (EmptyCell!3668) )
))
(declare-fun mapValue!13542 () ValueCell!3668)

(declare-fun mapRest!13542 () (Array (_ BitVec 32) ValueCell!3668))

(declare-datatypes ((array!19617 0))(
  ( (array!19618 (arr!9302 (Array (_ BitVec 32) ValueCell!3668)) (size!9654 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19617)

(assert (=> mapNonEmpty!13542 (= (arr!9302 _values!1208) (store mapRest!13542 mapKey!13542 mapValue!13542))))

(declare-fun b!356593 () Bool)

(declare-fun e!218471 () Bool)

(declare-fun tp_is_empty!8023 () Bool)

(assert (=> b!356593 (= e!218471 tp_is_empty!8023)))

(declare-fun b!356595 () Bool)

(declare-fun res!197894 () Bool)

(assert (=> b!356595 (=> (not res!197894) (not e!218470))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19615 (_ BitVec 32)) Bool)

(assert (=> b!356595 (= res!197894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356596 () Bool)

(declare-fun res!197897 () Bool)

(assert (=> b!356596 (=> (not res!197897) (not e!218470))))

(assert (=> b!356596 (= res!197897 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9653 _keys!1456))))))

(declare-fun b!356597 () Bool)

(declare-fun res!197899 () Bool)

(assert (=> b!356597 (=> (not res!197899) (not e!218470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356597 (= res!197899 (validKeyInArray!0 k!1077))))

(declare-fun b!356598 () Bool)

(assert (=> b!356598 (= e!218470 (not true))))

(declare-fun arrayContainsKey!0 (array!19615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356598 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11675)

(declare-datatypes ((Unit!10978 0))(
  ( (Unit!10979) )
))
(declare-fun lt!165950 () Unit!10978)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11675)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!8 (array!19615 array!19617 (_ BitVec 32) (_ BitVec 32) V!11675 V!11675 (_ BitVec 64) (_ BitVec 32)) Unit!10978)

(assert (=> b!356598 (= lt!165950 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!8 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!356599 () Bool)

(declare-fun res!197892 () Bool)

(assert (=> b!356599 (=> (not res!197892) (not e!218470))))

(assert (=> b!356599 (= res!197892 (and (= (size!9654 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9653 _keys!1456) (size!9654 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!197896 () Bool)

(assert (=> start!35570 (=> (not res!197896) (not e!218470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35570 (= res!197896 (validMask!0 mask!1842))))

(assert (=> start!35570 e!218470))

(assert (=> start!35570 tp_is_empty!8023))

(assert (=> start!35570 true))

(declare-fun array_inv!6834 (array!19615) Bool)

(assert (=> start!35570 (array_inv!6834 _keys!1456)))

(declare-fun e!218468 () Bool)

(declare-fun array_inv!6835 (array!19617) Bool)

(assert (=> start!35570 (and (array_inv!6835 _values!1208) e!218468)))

(declare-fun b!356594 () Bool)

(declare-fun res!197898 () Bool)

(assert (=> b!356594 (=> (not res!197898) (not e!218470))))

(assert (=> b!356594 (= res!197898 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun mapIsEmpty!13542 () Bool)

(assert (=> mapIsEmpty!13542 mapRes!13542))

(declare-fun b!356600 () Bool)

(declare-fun res!197893 () Bool)

(assert (=> b!356600 (=> (not res!197893) (not e!218470))))

(declare-datatypes ((List!5373 0))(
  ( (Nil!5370) (Cons!5369 (h!6225 (_ BitVec 64)) (t!10523 List!5373)) )
))
(declare-fun arrayNoDuplicates!0 (array!19615 (_ BitVec 32) List!5373) Bool)

(assert (=> b!356600 (= res!197893 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5370))))

(declare-fun b!356601 () Bool)

(assert (=> b!356601 (= e!218469 tp_is_empty!8023)))

(declare-fun b!356602 () Bool)

(assert (=> b!356602 (= e!218468 (and e!218471 mapRes!13542))))

(declare-fun condMapEmpty!13542 () Bool)

(declare-fun mapDefault!13542 () ValueCell!3668)

