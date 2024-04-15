; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35394 () Bool)

(assert start!35394)

(declare-fun b!354183 () Bool)

(declare-fun e!217077 () Bool)

(declare-fun tp_is_empty!7861 () Bool)

(assert (=> b!354183 (= e!217077 tp_is_empty!7861)))

(declare-fun mapIsEmpty!13299 () Bool)

(declare-fun mapRes!13299 () Bool)

(assert (=> mapIsEmpty!13299 mapRes!13299))

(declare-fun b!354184 () Bool)

(declare-fun e!217080 () Bool)

(assert (=> b!354184 (= e!217080 false)))

(declare-fun lt!165472 () Bool)

(declare-datatypes ((array!19289 0))(
  ( (array!19290 (arr!9138 (Array (_ BitVec 32) (_ BitVec 64))) (size!9491 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19289)

(declare-datatypes ((List!5270 0))(
  ( (Nil!5267) (Cons!5266 (h!6122 (_ BitVec 64)) (t!10411 List!5270)) )
))
(declare-fun arrayNoDuplicates!0 (array!19289 (_ BitVec 32) List!5270) Bool)

(assert (=> b!354184 (= lt!165472 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5267))))

(declare-fun b!354185 () Bool)

(declare-fun res!196359 () Bool)

(assert (=> b!354185 (=> (not res!196359) (not e!217080))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11459 0))(
  ( (V!11460 (val!3975 Int)) )
))
(declare-datatypes ((ValueCell!3587 0))(
  ( (ValueCellFull!3587 (v!6163 V!11459)) (EmptyCell!3587) )
))
(declare-datatypes ((array!19291 0))(
  ( (array!19292 (arr!9139 (Array (_ BitVec 32) ValueCell!3587)) (size!9492 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19291)

(assert (=> b!354185 (= res!196359 (and (= (size!9492 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9491 _keys!1456) (size!9492 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354186 () Bool)

(declare-fun res!196360 () Bool)

(assert (=> b!354186 (=> (not res!196360) (not e!217080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19289 (_ BitVec 32)) Bool)

(assert (=> b!354186 (= res!196360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354187 () Bool)

(declare-fun e!217079 () Bool)

(declare-fun e!217078 () Bool)

(assert (=> b!354187 (= e!217079 (and e!217078 mapRes!13299))))

(declare-fun condMapEmpty!13299 () Bool)

(declare-fun mapDefault!13299 () ValueCell!3587)

(assert (=> b!354187 (= condMapEmpty!13299 (= (arr!9139 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3587)) mapDefault!13299)))))

(declare-fun b!354188 () Bool)

(assert (=> b!354188 (= e!217078 tp_is_empty!7861)))

(declare-fun mapNonEmpty!13299 () Bool)

(declare-fun tp!27195 () Bool)

(assert (=> mapNonEmpty!13299 (= mapRes!13299 (and tp!27195 e!217077))))

(declare-fun mapRest!13299 () (Array (_ BitVec 32) ValueCell!3587))

(declare-fun mapValue!13299 () ValueCell!3587)

(declare-fun mapKey!13299 () (_ BitVec 32))

(assert (=> mapNonEmpty!13299 (= (arr!9139 _values!1208) (store mapRest!13299 mapKey!13299 mapValue!13299))))

(declare-fun res!196358 () Bool)

(assert (=> start!35394 (=> (not res!196358) (not e!217080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35394 (= res!196358 (validMask!0 mask!1842))))

(assert (=> start!35394 e!217080))

(assert (=> start!35394 true))

(declare-fun array_inv!6768 (array!19291) Bool)

(assert (=> start!35394 (and (array_inv!6768 _values!1208) e!217079)))

(declare-fun array_inv!6769 (array!19289) Bool)

(assert (=> start!35394 (array_inv!6769 _keys!1456)))

(assert (= (and start!35394 res!196358) b!354185))

(assert (= (and b!354185 res!196359) b!354186))

(assert (= (and b!354186 res!196360) b!354184))

(assert (= (and b!354187 condMapEmpty!13299) mapIsEmpty!13299))

(assert (= (and b!354187 (not condMapEmpty!13299)) mapNonEmpty!13299))

(get-info :version)

(assert (= (and mapNonEmpty!13299 ((_ is ValueCellFull!3587) mapValue!13299)) b!354183))

(assert (= (and b!354187 ((_ is ValueCellFull!3587) mapDefault!13299)) b!354188))

(assert (= start!35394 b!354187))

(declare-fun m!352737 () Bool)

(assert (=> b!354184 m!352737))

(declare-fun m!352739 () Bool)

(assert (=> b!354186 m!352739))

(declare-fun m!352741 () Bool)

(assert (=> mapNonEmpty!13299 m!352741))

(declare-fun m!352743 () Bool)

(assert (=> start!35394 m!352743))

(declare-fun m!352745 () Bool)

(assert (=> start!35394 m!352745))

(declare-fun m!352747 () Bool)

(assert (=> start!35394 m!352747))

(check-sat (not mapNonEmpty!13299) (not start!35394) (not b!354184) tp_is_empty!7861 (not b!354186))
(check-sat)
