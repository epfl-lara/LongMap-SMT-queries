; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35778 () Bool)

(assert start!35778)

(declare-fun mapNonEmpty!13875 () Bool)

(declare-fun mapRes!13875 () Bool)

(declare-fun tp!27942 () Bool)

(declare-fun e!220037 () Bool)

(assert (=> mapNonEmpty!13875 (= mapRes!13875 (and tp!27942 e!220037))))

(declare-datatypes ((V!11971 0))(
  ( (V!11972 (val!4167 Int)) )
))
(declare-datatypes ((ValueCell!3779 0))(
  ( (ValueCellFull!3779 (v!6355 V!11971)) (EmptyCell!3779) )
))
(declare-fun mapRest!13875 () (Array (_ BitVec 32) ValueCell!3779))

(declare-fun mapKey!13875 () (_ BitVec 32))

(declare-fun mapValue!13875 () ValueCell!3779)

(declare-datatypes ((array!20021 0))(
  ( (array!20022 (arr!9504 (Array (_ BitVec 32) ValueCell!3779)) (size!9857 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20021)

(assert (=> mapNonEmpty!13875 (= (arr!9504 _values!1208) (store mapRest!13875 mapKey!13875 mapValue!13875))))

(declare-fun b!359241 () Bool)

(declare-fun tp_is_empty!8245 () Bool)

(assert (=> b!359241 (= e!220037 tp_is_empty!8245)))

(declare-fun b!359242 () Bool)

(declare-fun res!199688 () Bool)

(declare-fun e!220038 () Bool)

(assert (=> b!359242 (=> (not res!199688) (not e!220038))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20023 0))(
  ( (array!20024 (arr!9505 (Array (_ BitVec 32) (_ BitVec 64))) (size!9858 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20023)

(assert (=> b!359242 (= res!199688 (and (= (size!9857 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9858 _keys!1456) (size!9857 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199689 () Bool)

(assert (=> start!35778 (=> (not res!199689) (not e!220038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35778 (= res!199689 (validMask!0 mask!1842))))

(assert (=> start!35778 e!220038))

(assert (=> start!35778 true))

(declare-fun e!220041 () Bool)

(declare-fun array_inv!7014 (array!20021) Bool)

(assert (=> start!35778 (and (array_inv!7014 _values!1208) e!220041)))

(declare-fun array_inv!7015 (array!20023) Bool)

(assert (=> start!35778 (array_inv!7015 _keys!1456)))

(declare-fun b!359243 () Bool)

(declare-fun e!220040 () Bool)

(assert (=> b!359243 (= e!220040 tp_is_empty!8245)))

(declare-fun mapIsEmpty!13875 () Bool)

(assert (=> mapIsEmpty!13875 mapRes!13875))

(declare-fun b!359244 () Bool)

(declare-fun res!199690 () Bool)

(assert (=> b!359244 (=> (not res!199690) (not e!220038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20023 (_ BitVec 32)) Bool)

(assert (=> b!359244 (= res!199690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359245 () Bool)

(assert (=> b!359245 (= e!220038 false)))

(declare-fun lt!166120 () Bool)

(declare-datatypes ((List!5435 0))(
  ( (Nil!5432) (Cons!5431 (h!6287 (_ BitVec 64)) (t!10576 List!5435)) )
))
(declare-fun arrayNoDuplicates!0 (array!20023 (_ BitVec 32) List!5435) Bool)

(assert (=> b!359245 (= lt!166120 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5432))))

(declare-fun b!359246 () Bool)

(assert (=> b!359246 (= e!220041 (and e!220040 mapRes!13875))))

(declare-fun condMapEmpty!13875 () Bool)

(declare-fun mapDefault!13875 () ValueCell!3779)

(assert (=> b!359246 (= condMapEmpty!13875 (= (arr!9504 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3779)) mapDefault!13875)))))

(assert (= (and start!35778 res!199689) b!359242))

(assert (= (and b!359242 res!199688) b!359244))

(assert (= (and b!359244 res!199690) b!359245))

(assert (= (and b!359246 condMapEmpty!13875) mapIsEmpty!13875))

(assert (= (and b!359246 (not condMapEmpty!13875)) mapNonEmpty!13875))

(get-info :version)

(assert (= (and mapNonEmpty!13875 ((_ is ValueCellFull!3779) mapValue!13875)) b!359241))

(assert (= (and b!359246 ((_ is ValueCellFull!3779) mapDefault!13875)) b!359243))

(assert (= start!35778 b!359246))

(declare-fun m!356265 () Bool)

(assert (=> mapNonEmpty!13875 m!356265))

(declare-fun m!356267 () Bool)

(assert (=> start!35778 m!356267))

(declare-fun m!356269 () Bool)

(assert (=> start!35778 m!356269))

(declare-fun m!356271 () Bool)

(assert (=> start!35778 m!356271))

(declare-fun m!356273 () Bool)

(assert (=> b!359244 m!356273))

(declare-fun m!356275 () Bool)

(assert (=> b!359245 m!356275))

(check-sat (not b!359244) (not start!35778) tp_is_empty!8245 (not b!359245) (not mapNonEmpty!13875))
(check-sat)
