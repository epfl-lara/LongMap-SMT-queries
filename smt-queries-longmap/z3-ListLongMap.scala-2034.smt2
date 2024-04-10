; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35374 () Bool)

(assert start!35374)

(declare-fun mapNonEmpty!13248 () Bool)

(declare-fun mapRes!13248 () Bool)

(declare-fun tp!27144 () Bool)

(declare-fun e!216997 () Bool)

(assert (=> mapNonEmpty!13248 (= mapRes!13248 (and tp!27144 e!216997))))

(declare-fun mapKey!13248 () (_ BitVec 32))

(declare-datatypes ((V!11413 0))(
  ( (V!11414 (val!3958 Int)) )
))
(declare-datatypes ((ValueCell!3570 0))(
  ( (ValueCellFull!3570 (v!6152 V!11413)) (EmptyCell!3570) )
))
(declare-fun mapValue!13248 () ValueCell!3570)

(declare-fun mapRest!13248 () (Array (_ BitVec 32) ValueCell!3570))

(declare-datatypes ((array!19241 0))(
  ( (array!19242 (arr!9114 (Array (_ BitVec 32) ValueCell!3570)) (size!9466 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19241)

(assert (=> mapNonEmpty!13248 (= (arr!9114 _values!1208) (store mapRest!13248 mapKey!13248 mapValue!13248))))

(declare-fun b!354152 () Bool)

(declare-fun e!217000 () Bool)

(declare-fun e!216999 () Bool)

(assert (=> b!354152 (= e!217000 (and e!216999 mapRes!13248))))

(declare-fun condMapEmpty!13248 () Bool)

(declare-fun mapDefault!13248 () ValueCell!3570)

(assert (=> b!354152 (= condMapEmpty!13248 (= (arr!9114 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3570)) mapDefault!13248)))))

(declare-fun b!354153 () Bool)

(declare-fun e!216998 () Bool)

(assert (=> b!354153 (= e!216998 false)))

(declare-fun lt!165656 () Bool)

(declare-datatypes ((array!19243 0))(
  ( (array!19244 (arr!9115 (Array (_ BitVec 32) (_ BitVec 64))) (size!9467 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19243)

(declare-datatypes ((List!5288 0))(
  ( (Nil!5285) (Cons!5284 (h!6140 (_ BitVec 64)) (t!10438 List!5288)) )
))
(declare-fun arrayNoDuplicates!0 (array!19243 (_ BitVec 32) List!5288) Bool)

(assert (=> b!354153 (= lt!165656 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5285))))

(declare-fun res!196335 () Bool)

(assert (=> start!35374 (=> (not res!196335) (not e!216998))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35374 (= res!196335 (validMask!0 mask!1842))))

(assert (=> start!35374 e!216998))

(assert (=> start!35374 true))

(declare-fun array_inv!6706 (array!19241) Bool)

(assert (=> start!35374 (and (array_inv!6706 _values!1208) e!217000)))

(declare-fun array_inv!6707 (array!19243) Bool)

(assert (=> start!35374 (array_inv!6707 _keys!1456)))

(declare-fun b!354154 () Bool)

(declare-fun res!196336 () Bool)

(assert (=> b!354154 (=> (not res!196336) (not e!216998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19243 (_ BitVec 32)) Bool)

(assert (=> b!354154 (= res!196336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354155 () Bool)

(declare-fun tp_is_empty!7827 () Bool)

(assert (=> b!354155 (= e!216999 tp_is_empty!7827)))

(declare-fun mapIsEmpty!13248 () Bool)

(assert (=> mapIsEmpty!13248 mapRes!13248))

(declare-fun b!354156 () Bool)

(declare-fun res!196334 () Bool)

(assert (=> b!354156 (=> (not res!196334) (not e!216998))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354156 (= res!196334 (and (= (size!9466 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9467 _keys!1456) (size!9466 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354157 () Bool)

(assert (=> b!354157 (= e!216997 tp_is_empty!7827)))

(assert (= (and start!35374 res!196335) b!354156))

(assert (= (and b!354156 res!196334) b!354154))

(assert (= (and b!354154 res!196336) b!354153))

(assert (= (and b!354152 condMapEmpty!13248) mapIsEmpty!13248))

(assert (= (and b!354152 (not condMapEmpty!13248)) mapNonEmpty!13248))

(get-info :version)

(assert (= (and mapNonEmpty!13248 ((_ is ValueCellFull!3570) mapValue!13248)) b!354157))

(assert (= (and b!354152 ((_ is ValueCellFull!3570) mapDefault!13248)) b!354155))

(assert (= start!35374 b!354152))

(declare-fun m!353263 () Bool)

(assert (=> mapNonEmpty!13248 m!353263))

(declare-fun m!353265 () Bool)

(assert (=> b!354153 m!353265))

(declare-fun m!353267 () Bool)

(assert (=> start!35374 m!353267))

(declare-fun m!353269 () Bool)

(assert (=> start!35374 m!353269))

(declare-fun m!353271 () Bool)

(assert (=> start!35374 m!353271))

(declare-fun m!353273 () Bool)

(assert (=> b!354154 m!353273))

(check-sat (not start!35374) tp_is_empty!7827 (not b!354154) (not b!354153) (not mapNonEmpty!13248))
(check-sat)
