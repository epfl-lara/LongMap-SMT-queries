; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35682 () Bool)

(assert start!35682)

(declare-fun res!199158 () Bool)

(declare-fun e!219320 () Bool)

(assert (=> start!35682 (=> (not res!199158) (not e!219320))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35682 (= res!199158 (validMask!0 mask!1842))))

(assert (=> start!35682 e!219320))

(assert (=> start!35682 true))

(declare-datatypes ((V!11843 0))(
  ( (V!11844 (val!4119 Int)) )
))
(declare-datatypes ((ValueCell!3731 0))(
  ( (ValueCellFull!3731 (v!6307 V!11843)) (EmptyCell!3731) )
))
(declare-datatypes ((array!19845 0))(
  ( (array!19846 (arr!9416 (Array (_ BitVec 32) ValueCell!3731)) (size!9769 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19845)

(declare-fun e!219318 () Bool)

(declare-fun array_inv!6948 (array!19845) Bool)

(assert (=> start!35682 (and (array_inv!6948 _values!1208) e!219318)))

(declare-datatypes ((array!19847 0))(
  ( (array!19848 (arr!9417 (Array (_ BitVec 32) (_ BitVec 64))) (size!9770 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19847)

(declare-fun array_inv!6949 (array!19847) Bool)

(assert (=> start!35682 (array_inv!6949 _keys!1456)))

(declare-fun b!358278 () Bool)

(assert (=> b!358278 (= e!219320 false)))

(declare-fun lt!165976 () Bool)

(declare-datatypes ((List!5400 0))(
  ( (Nil!5397) (Cons!5396 (h!6252 (_ BitVec 64)) (t!10541 List!5400)) )
))
(declare-fun arrayNoDuplicates!0 (array!19847 (_ BitVec 32) List!5400) Bool)

(assert (=> b!358278 (= lt!165976 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5397))))

(declare-fun mapNonEmpty!13731 () Bool)

(declare-fun mapRes!13731 () Bool)

(declare-fun tp!27789 () Bool)

(declare-fun e!219317 () Bool)

(assert (=> mapNonEmpty!13731 (= mapRes!13731 (and tp!27789 e!219317))))

(declare-fun mapValue!13731 () ValueCell!3731)

(declare-fun mapRest!13731 () (Array (_ BitVec 32) ValueCell!3731))

(declare-fun mapKey!13731 () (_ BitVec 32))

(assert (=> mapNonEmpty!13731 (= (arr!9416 _values!1208) (store mapRest!13731 mapKey!13731 mapValue!13731))))

(declare-fun b!358279 () Bool)

(declare-fun res!199157 () Bool)

(assert (=> b!358279 (=> (not res!199157) (not e!219320))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358279 (= res!199157 (and (= (size!9769 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9770 _keys!1456) (size!9769 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358280 () Bool)

(declare-fun e!219321 () Bool)

(assert (=> b!358280 (= e!219318 (and e!219321 mapRes!13731))))

(declare-fun condMapEmpty!13731 () Bool)

(declare-fun mapDefault!13731 () ValueCell!3731)

(assert (=> b!358280 (= condMapEmpty!13731 (= (arr!9416 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3731)) mapDefault!13731)))))

(declare-fun b!358281 () Bool)

(declare-fun tp_is_empty!8149 () Bool)

(assert (=> b!358281 (= e!219317 tp_is_empty!8149)))

(declare-fun mapIsEmpty!13731 () Bool)

(assert (=> mapIsEmpty!13731 mapRes!13731))

(declare-fun b!358282 () Bool)

(declare-fun res!199159 () Bool)

(assert (=> b!358282 (=> (not res!199159) (not e!219320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19847 (_ BitVec 32)) Bool)

(assert (=> b!358282 (= res!199159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358283 () Bool)

(assert (=> b!358283 (= e!219321 tp_is_empty!8149)))

(assert (= (and start!35682 res!199158) b!358279))

(assert (= (and b!358279 res!199157) b!358282))

(assert (= (and b!358282 res!199159) b!358278))

(assert (= (and b!358280 condMapEmpty!13731) mapIsEmpty!13731))

(assert (= (and b!358280 (not condMapEmpty!13731)) mapNonEmpty!13731))

(get-info :version)

(assert (= (and mapNonEmpty!13731 ((_ is ValueCellFull!3731) mapValue!13731)) b!358281))

(assert (= (and b!358280 ((_ is ValueCellFull!3731) mapDefault!13731)) b!358283))

(assert (= start!35682 b!358280))

(declare-fun m!355617 () Bool)

(assert (=> start!35682 m!355617))

(declare-fun m!355619 () Bool)

(assert (=> start!35682 m!355619))

(declare-fun m!355621 () Bool)

(assert (=> start!35682 m!355621))

(declare-fun m!355623 () Bool)

(assert (=> b!358278 m!355623))

(declare-fun m!355625 () Bool)

(assert (=> mapNonEmpty!13731 m!355625))

(declare-fun m!355627 () Bool)

(assert (=> b!358282 m!355627))

(check-sat (not mapNonEmpty!13731) (not b!358282) (not b!358278) (not start!35682) tp_is_empty!8149)
(check-sat)
