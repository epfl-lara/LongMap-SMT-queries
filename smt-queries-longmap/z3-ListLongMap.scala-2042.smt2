; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35406 () Bool)

(assert start!35406)

(declare-fun mapIsEmpty!13317 () Bool)

(declare-fun mapRes!13317 () Bool)

(assert (=> mapIsEmpty!13317 mapRes!13317))

(declare-fun b!354291 () Bool)

(declare-fun res!196414 () Bool)

(declare-fun e!217169 () Bool)

(assert (=> b!354291 (=> (not res!196414) (not e!217169))))

(declare-datatypes ((array!19313 0))(
  ( (array!19314 (arr!9150 (Array (_ BitVec 32) (_ BitVec 64))) (size!9503 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19313)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19313 (_ BitVec 32)) Bool)

(assert (=> b!354291 (= res!196414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354292 () Bool)

(declare-fun e!217166 () Bool)

(declare-fun e!217167 () Bool)

(assert (=> b!354292 (= e!217166 (and e!217167 mapRes!13317))))

(declare-fun condMapEmpty!13317 () Bool)

(declare-datatypes ((V!11475 0))(
  ( (V!11476 (val!3981 Int)) )
))
(declare-datatypes ((ValueCell!3593 0))(
  ( (ValueCellFull!3593 (v!6169 V!11475)) (EmptyCell!3593) )
))
(declare-datatypes ((array!19315 0))(
  ( (array!19316 (arr!9151 (Array (_ BitVec 32) ValueCell!3593)) (size!9504 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19315)

(declare-fun mapDefault!13317 () ValueCell!3593)

(assert (=> b!354292 (= condMapEmpty!13317 (= (arr!9151 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3593)) mapDefault!13317)))))

(declare-fun b!354293 () Bool)

(declare-fun res!196412 () Bool)

(assert (=> b!354293 (=> (not res!196412) (not e!217169))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354293 (= res!196412 (and (= (size!9504 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9503 _keys!1456) (size!9504 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!196413 () Bool)

(assert (=> start!35406 (=> (not res!196413) (not e!217169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35406 (= res!196413 (validMask!0 mask!1842))))

(assert (=> start!35406 e!217169))

(assert (=> start!35406 true))

(declare-fun array_inv!6778 (array!19315) Bool)

(assert (=> start!35406 (and (array_inv!6778 _values!1208) e!217166)))

(declare-fun array_inv!6779 (array!19313) Bool)

(assert (=> start!35406 (array_inv!6779 _keys!1456)))

(declare-fun b!354294 () Bool)

(declare-fun tp_is_empty!7873 () Bool)

(assert (=> b!354294 (= e!217167 tp_is_empty!7873)))

(declare-fun b!354295 () Bool)

(assert (=> b!354295 (= e!217169 false)))

(declare-fun lt!165490 () Bool)

(declare-datatypes ((List!5273 0))(
  ( (Nil!5270) (Cons!5269 (h!6125 (_ BitVec 64)) (t!10414 List!5273)) )
))
(declare-fun arrayNoDuplicates!0 (array!19313 (_ BitVec 32) List!5273) Bool)

(assert (=> b!354295 (= lt!165490 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5270))))

(declare-fun mapNonEmpty!13317 () Bool)

(declare-fun tp!27213 () Bool)

(declare-fun e!217170 () Bool)

(assert (=> mapNonEmpty!13317 (= mapRes!13317 (and tp!27213 e!217170))))

(declare-fun mapKey!13317 () (_ BitVec 32))

(declare-fun mapRest!13317 () (Array (_ BitVec 32) ValueCell!3593))

(declare-fun mapValue!13317 () ValueCell!3593)

(assert (=> mapNonEmpty!13317 (= (arr!9151 _values!1208) (store mapRest!13317 mapKey!13317 mapValue!13317))))

(declare-fun b!354296 () Bool)

(assert (=> b!354296 (= e!217170 tp_is_empty!7873)))

(assert (= (and start!35406 res!196413) b!354293))

(assert (= (and b!354293 res!196412) b!354291))

(assert (= (and b!354291 res!196414) b!354295))

(assert (= (and b!354292 condMapEmpty!13317) mapIsEmpty!13317))

(assert (= (and b!354292 (not condMapEmpty!13317)) mapNonEmpty!13317))

(get-info :version)

(assert (= (and mapNonEmpty!13317 ((_ is ValueCellFull!3593) mapValue!13317)) b!354296))

(assert (= (and b!354292 ((_ is ValueCellFull!3593) mapDefault!13317)) b!354294))

(assert (= start!35406 b!354292))

(declare-fun m!352809 () Bool)

(assert (=> b!354291 m!352809))

(declare-fun m!352811 () Bool)

(assert (=> start!35406 m!352811))

(declare-fun m!352813 () Bool)

(assert (=> start!35406 m!352813))

(declare-fun m!352815 () Bool)

(assert (=> start!35406 m!352815))

(declare-fun m!352817 () Bool)

(assert (=> b!354295 m!352817))

(declare-fun m!352819 () Bool)

(assert (=> mapNonEmpty!13317 m!352819))

(check-sat (not start!35406) tp_is_empty!7873 (not b!354291) (not mapNonEmpty!13317) (not b!354295))
(check-sat)
