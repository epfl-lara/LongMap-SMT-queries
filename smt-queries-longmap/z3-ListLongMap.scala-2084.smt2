; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35674 () Bool)

(assert start!35674)

(declare-fun b!358355 () Bool)

(declare-fun e!219332 () Bool)

(assert (=> b!358355 (= e!219332 false)))

(declare-fun lt!166178 () Bool)

(declare-datatypes ((array!19819 0))(
  ( (array!19820 (arr!9403 (Array (_ BitVec 32) (_ BitVec 64))) (size!9755 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19819)

(declare-datatypes ((List!5427 0))(
  ( (Nil!5424) (Cons!5423 (h!6279 (_ BitVec 64)) (t!10577 List!5427)) )
))
(declare-fun arrayNoDuplicates!0 (array!19819 (_ BitVec 32) List!5427) Bool)

(assert (=> b!358355 (= lt!166178 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5424))))

(declare-fun b!358356 () Bool)

(declare-fun e!219328 () Bool)

(declare-fun tp_is_empty!8127 () Bool)

(assert (=> b!358356 (= e!219328 tp_is_empty!8127)))

(declare-fun b!358357 () Bool)

(declare-fun res!199188 () Bool)

(assert (=> b!358357 (=> (not res!199188) (not e!219332))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11813 0))(
  ( (V!11814 (val!4108 Int)) )
))
(declare-datatypes ((ValueCell!3720 0))(
  ( (ValueCellFull!3720 (v!6302 V!11813)) (EmptyCell!3720) )
))
(declare-datatypes ((array!19821 0))(
  ( (array!19822 (arr!9404 (Array (_ BitVec 32) ValueCell!3720)) (size!9756 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19821)

(assert (=> b!358357 (= res!199188 (and (= (size!9756 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9755 _keys!1456) (size!9756 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13698 () Bool)

(declare-fun mapRes!13698 () Bool)

(declare-fun tp!27756 () Bool)

(assert (=> mapNonEmpty!13698 (= mapRes!13698 (and tp!27756 e!219328))))

(declare-fun mapRest!13698 () (Array (_ BitVec 32) ValueCell!3720))

(declare-fun mapKey!13698 () (_ BitVec 32))

(declare-fun mapValue!13698 () ValueCell!3720)

(assert (=> mapNonEmpty!13698 (= (arr!9404 _values!1208) (store mapRest!13698 mapKey!13698 mapValue!13698))))

(declare-fun b!358358 () Bool)

(declare-fun e!219331 () Bool)

(assert (=> b!358358 (= e!219331 tp_is_empty!8127)))

(declare-fun res!199189 () Bool)

(assert (=> start!35674 (=> (not res!199189) (not e!219332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35674 (= res!199189 (validMask!0 mask!1842))))

(assert (=> start!35674 e!219332))

(assert (=> start!35674 true))

(declare-fun e!219330 () Bool)

(declare-fun array_inv!6912 (array!19821) Bool)

(assert (=> start!35674 (and (array_inv!6912 _values!1208) e!219330)))

(declare-fun array_inv!6913 (array!19819) Bool)

(assert (=> start!35674 (array_inv!6913 _keys!1456)))

(declare-fun mapIsEmpty!13698 () Bool)

(assert (=> mapIsEmpty!13698 mapRes!13698))

(declare-fun b!358359 () Bool)

(assert (=> b!358359 (= e!219330 (and e!219331 mapRes!13698))))

(declare-fun condMapEmpty!13698 () Bool)

(declare-fun mapDefault!13698 () ValueCell!3720)

(assert (=> b!358359 (= condMapEmpty!13698 (= (arr!9404 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3720)) mapDefault!13698)))))

(declare-fun b!358360 () Bool)

(declare-fun res!199187 () Bool)

(assert (=> b!358360 (=> (not res!199187) (not e!219332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19819 (_ BitVec 32)) Bool)

(assert (=> b!358360 (= res!199187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35674 res!199189) b!358357))

(assert (= (and b!358357 res!199188) b!358360))

(assert (= (and b!358360 res!199187) b!358355))

(assert (= (and b!358359 condMapEmpty!13698) mapIsEmpty!13698))

(assert (= (and b!358359 (not condMapEmpty!13698)) mapNonEmpty!13698))

(get-info :version)

(assert (= (and mapNonEmpty!13698 ((_ is ValueCellFull!3720) mapValue!13698)) b!358356))

(assert (= (and b!358359 ((_ is ValueCellFull!3720) mapDefault!13698)) b!358358))

(assert (= start!35674 b!358359))

(declare-fun m!356215 () Bool)

(assert (=> b!358355 m!356215))

(declare-fun m!356217 () Bool)

(assert (=> mapNonEmpty!13698 m!356217))

(declare-fun m!356219 () Bool)

(assert (=> start!35674 m!356219))

(declare-fun m!356221 () Bool)

(assert (=> start!35674 m!356221))

(declare-fun m!356223 () Bool)

(assert (=> start!35674 m!356223))

(declare-fun m!356225 () Bool)

(assert (=> b!358360 m!356225))

(check-sat tp_is_empty!8127 (not b!358355) (not start!35674) (not b!358360) (not mapNonEmpty!13698))
(check-sat)
