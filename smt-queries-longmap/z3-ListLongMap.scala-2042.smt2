; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35422 () Bool)

(assert start!35422)

(declare-fun b!354584 () Bool)

(declare-fun e!217358 () Bool)

(declare-fun tp_is_empty!7875 () Bool)

(assert (=> b!354584 (= e!217358 tp_is_empty!7875)))

(declare-fun res!196551 () Bool)

(declare-fun e!217359 () Bool)

(assert (=> start!35422 (=> (not res!196551) (not e!217359))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35422 (= res!196551 (validMask!0 mask!1842))))

(assert (=> start!35422 e!217359))

(assert (=> start!35422 true))

(declare-datatypes ((V!11477 0))(
  ( (V!11478 (val!3982 Int)) )
))
(declare-datatypes ((ValueCell!3594 0))(
  ( (ValueCellFull!3594 (v!6176 V!11477)) (EmptyCell!3594) )
))
(declare-datatypes ((array!19331 0))(
  ( (array!19332 (arr!9159 (Array (_ BitVec 32) ValueCell!3594)) (size!9511 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19331)

(declare-fun e!217360 () Bool)

(declare-fun array_inv!6734 (array!19331) Bool)

(assert (=> start!35422 (and (array_inv!6734 _values!1208) e!217360)))

(declare-datatypes ((array!19333 0))(
  ( (array!19334 (arr!9160 (Array (_ BitVec 32) (_ BitVec 64))) (size!9512 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19333)

(declare-fun array_inv!6735 (array!19333) Bool)

(assert (=> start!35422 (array_inv!6735 _keys!1456)))

(declare-fun b!354585 () Bool)

(declare-fun e!217357 () Bool)

(declare-fun mapRes!13320 () Bool)

(assert (=> b!354585 (= e!217360 (and e!217357 mapRes!13320))))

(declare-fun condMapEmpty!13320 () Bool)

(declare-fun mapDefault!13320 () ValueCell!3594)

(assert (=> b!354585 (= condMapEmpty!13320 (= (arr!9159 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3594)) mapDefault!13320)))))

(declare-fun b!354586 () Bool)

(declare-fun res!196550 () Bool)

(assert (=> b!354586 (=> (not res!196550) (not e!217359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19333 (_ BitVec 32)) Bool)

(assert (=> b!354586 (= res!196550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354587 () Bool)

(assert (=> b!354587 (= e!217357 tp_is_empty!7875)))

(declare-fun b!354588 () Bool)

(declare-fun res!196552 () Bool)

(assert (=> b!354588 (=> (not res!196552) (not e!217359))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354588 (= res!196552 (and (= (size!9511 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9512 _keys!1456) (size!9511 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13320 () Bool)

(assert (=> mapIsEmpty!13320 mapRes!13320))

(declare-fun b!354589 () Bool)

(assert (=> b!354589 (= e!217359 false)))

(declare-fun lt!165728 () Bool)

(declare-datatypes ((List!5302 0))(
  ( (Nil!5299) (Cons!5298 (h!6154 (_ BitVec 64)) (t!10452 List!5302)) )
))
(declare-fun arrayNoDuplicates!0 (array!19333 (_ BitVec 32) List!5302) Bool)

(assert (=> b!354589 (= lt!165728 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5299))))

(declare-fun mapNonEmpty!13320 () Bool)

(declare-fun tp!27216 () Bool)

(assert (=> mapNonEmpty!13320 (= mapRes!13320 (and tp!27216 e!217358))))

(declare-fun mapRest!13320 () (Array (_ BitVec 32) ValueCell!3594))

(declare-fun mapKey!13320 () (_ BitVec 32))

(declare-fun mapValue!13320 () ValueCell!3594)

(assert (=> mapNonEmpty!13320 (= (arr!9159 _values!1208) (store mapRest!13320 mapKey!13320 mapValue!13320))))

(assert (= (and start!35422 res!196551) b!354588))

(assert (= (and b!354588 res!196552) b!354586))

(assert (= (and b!354586 res!196550) b!354589))

(assert (= (and b!354585 condMapEmpty!13320) mapIsEmpty!13320))

(assert (= (and b!354585 (not condMapEmpty!13320)) mapNonEmpty!13320))

(get-info :version)

(assert (= (and mapNonEmpty!13320 ((_ is ValueCellFull!3594) mapValue!13320)) b!354584))

(assert (= (and b!354585 ((_ is ValueCellFull!3594) mapDefault!13320)) b!354587))

(assert (= start!35422 b!354585))

(declare-fun m!353551 () Bool)

(assert (=> start!35422 m!353551))

(declare-fun m!353553 () Bool)

(assert (=> start!35422 m!353553))

(declare-fun m!353555 () Bool)

(assert (=> start!35422 m!353555))

(declare-fun m!353557 () Bool)

(assert (=> b!354586 m!353557))

(declare-fun m!353559 () Bool)

(assert (=> b!354589 m!353559))

(declare-fun m!353561 () Bool)

(assert (=> mapNonEmpty!13320 m!353561))

(check-sat (not start!35422) tp_is_empty!7875 (not mapNonEmpty!13320) (not b!354586) (not b!354589))
(check-sat)
