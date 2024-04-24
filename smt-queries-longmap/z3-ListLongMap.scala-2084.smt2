; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35658 () Bool)

(assert start!35658)

(declare-fun b!358284 () Bool)

(declare-fun e!219279 () Bool)

(declare-fun tp_is_empty!8125 () Bool)

(assert (=> b!358284 (= e!219279 tp_is_empty!8125)))

(declare-fun res!199175 () Bool)

(declare-fun e!219280 () Bool)

(assert (=> start!35658 (=> (not res!199175) (not e!219280))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35658 (= res!199175 (validMask!0 mask!1842))))

(assert (=> start!35658 e!219280))

(assert (=> start!35658 true))

(declare-datatypes ((V!11811 0))(
  ( (V!11812 (val!4107 Int)) )
))
(declare-datatypes ((ValueCell!3719 0))(
  ( (ValueCellFull!3719 (v!6302 V!11811)) (EmptyCell!3719) )
))
(declare-datatypes ((array!19798 0))(
  ( (array!19799 (arr!9392 (Array (_ BitVec 32) ValueCell!3719)) (size!9744 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19798)

(declare-fun e!219281 () Bool)

(declare-fun array_inv!6942 (array!19798) Bool)

(assert (=> start!35658 (and (array_inv!6942 _values!1208) e!219281)))

(declare-datatypes ((array!19800 0))(
  ( (array!19801 (arr!9393 (Array (_ BitVec 32) (_ BitVec 64))) (size!9745 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19800)

(declare-fun array_inv!6943 (array!19800) Bool)

(assert (=> start!35658 (array_inv!6943 _keys!1456)))

(declare-fun mapIsEmpty!13695 () Bool)

(declare-fun mapRes!13695 () Bool)

(assert (=> mapIsEmpty!13695 mapRes!13695))

(declare-fun b!358285 () Bool)

(declare-fun res!199177 () Bool)

(assert (=> b!358285 (=> (not res!199177) (not e!219280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19800 (_ BitVec 32)) Bool)

(assert (=> b!358285 (= res!199177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13695 () Bool)

(declare-fun tp!27753 () Bool)

(assert (=> mapNonEmpty!13695 (= mapRes!13695 (and tp!27753 e!219279))))

(declare-fun mapRest!13695 () (Array (_ BitVec 32) ValueCell!3719))

(declare-fun mapValue!13695 () ValueCell!3719)

(declare-fun mapKey!13695 () (_ BitVec 32))

(assert (=> mapNonEmpty!13695 (= (arr!9392 _values!1208) (store mapRest!13695 mapKey!13695 mapValue!13695))))

(declare-fun b!358286 () Bool)

(declare-fun e!219282 () Bool)

(assert (=> b!358286 (= e!219282 tp_is_empty!8125)))

(declare-fun b!358287 () Bool)

(declare-fun res!199176 () Bool)

(assert (=> b!358287 (=> (not res!199176) (not e!219280))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358287 (= res!199176 (and (= (size!9744 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9745 _keys!1456) (size!9744 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358288 () Bool)

(assert (=> b!358288 (= e!219280 false)))

(declare-fun lt!166193 () Bool)

(declare-datatypes ((List!5337 0))(
  ( (Nil!5334) (Cons!5333 (h!6189 (_ BitVec 64)) (t!10479 List!5337)) )
))
(declare-fun arrayNoDuplicates!0 (array!19800 (_ BitVec 32) List!5337) Bool)

(assert (=> b!358288 (= lt!166193 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5334))))

(declare-fun b!358289 () Bool)

(assert (=> b!358289 (= e!219281 (and e!219282 mapRes!13695))))

(declare-fun condMapEmpty!13695 () Bool)

(declare-fun mapDefault!13695 () ValueCell!3719)

(assert (=> b!358289 (= condMapEmpty!13695 (= (arr!9392 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3719)) mapDefault!13695)))))

(assert (= (and start!35658 res!199175) b!358287))

(assert (= (and b!358287 res!199176) b!358285))

(assert (= (and b!358285 res!199177) b!358288))

(assert (= (and b!358289 condMapEmpty!13695) mapIsEmpty!13695))

(assert (= (and b!358289 (not condMapEmpty!13695)) mapNonEmpty!13695))

(get-info :version)

(assert (= (and mapNonEmpty!13695 ((_ is ValueCellFull!3719) mapValue!13695)) b!358284))

(assert (= (and b!358289 ((_ is ValueCellFull!3719) mapDefault!13695)) b!358286))

(assert (= start!35658 b!358289))

(declare-fun m!356427 () Bool)

(assert (=> start!35658 m!356427))

(declare-fun m!356429 () Bool)

(assert (=> start!35658 m!356429))

(declare-fun m!356431 () Bool)

(assert (=> start!35658 m!356431))

(declare-fun m!356433 () Bool)

(assert (=> b!358285 m!356433))

(declare-fun m!356435 () Bool)

(assert (=> mapNonEmpty!13695 m!356435))

(declare-fun m!356437 () Bool)

(assert (=> b!358288 m!356437))

(check-sat tp_is_empty!8125 (not mapNonEmpty!13695) (not b!358285) (not start!35658) (not b!358288))
(check-sat)
