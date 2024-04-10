; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83378 () Bool)

(assert start!83378)

(declare-fun b_free!19371 () Bool)

(declare-fun b_next!19371 () Bool)

(assert (=> start!83378 (= b_free!19371 (not b_next!19371))))

(declare-fun tp!67391 () Bool)

(declare-fun b_and!30963 () Bool)

(assert (=> start!83378 (= tp!67391 b_and!30963)))

(declare-fun b!973631 () Bool)

(declare-fun e!548806 () Bool)

(declare-fun e!548810 () Bool)

(declare-fun mapRes!35413 () Bool)

(assert (=> b!973631 (= e!548806 (and e!548810 mapRes!35413))))

(declare-fun condMapEmpty!35413 () Bool)

(declare-datatypes ((V!34675 0))(
  ( (V!34676 (val!11185 Int)) )
))
(declare-datatypes ((ValueCell!10653 0))(
  ( (ValueCellFull!10653 (v!13744 V!34675)) (EmptyCell!10653) )
))
(declare-datatypes ((array!60579 0))(
  ( (array!60580 (arr!29153 (Array (_ BitVec 32) ValueCell!10653)) (size!29632 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60579)

(declare-fun mapDefault!35413 () ValueCell!10653)

(assert (=> b!973631 (= condMapEmpty!35413 (= (arr!29153 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10653)) mapDefault!35413)))))

(declare-fun mapIsEmpty!35413 () Bool)

(assert (=> mapIsEmpty!35413 mapRes!35413))

(declare-fun b!973632 () Bool)

(declare-fun res!651730 () Bool)

(declare-fun e!548812 () Bool)

(assert (=> b!973632 (=> (not res!651730) (not e!548812))))

(declare-datatypes ((array!60581 0))(
  ( (array!60582 (arr!29154 (Array (_ BitVec 32) (_ BitVec 64))) (size!29633 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60581)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973632 (= res!651730 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29633 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29633 _keys!1717))))))

(declare-fun b!973633 () Bool)

(declare-fun res!651727 () Bool)

(assert (=> b!973633 (=> (not res!651727) (not e!548812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973633 (= res!651727 (validKeyInArray!0 (select (arr!29154 _keys!1717) i!822)))))

(declare-fun b!973634 () Bool)

(declare-fun e!548809 () Bool)

(assert (=> b!973634 (= e!548809 (not true))))

(declare-datatypes ((tuple2!14364 0))(
  ( (tuple2!14365 (_1!7193 (_ BitVec 64)) (_2!7193 V!34675)) )
))
(declare-datatypes ((List!20222 0))(
  ( (Nil!20219) (Cons!20218 (h!21380 tuple2!14364) (t!28691 List!20222)) )
))
(declare-datatypes ((ListLongMap!13061 0))(
  ( (ListLongMap!13062 (toList!6546 List!20222)) )
))
(declare-fun lt!432615 () ListLongMap!13061)

(declare-fun lt!432619 () tuple2!14364)

(declare-fun contains!5637 (ListLongMap!13061 (_ BitVec 64)) Bool)

(declare-fun +!2911 (ListLongMap!13061 tuple2!14364) ListLongMap!13061)

(assert (=> b!973634 (contains!5637 (+!2911 lt!432615 lt!432619) (select (arr!29154 _keys!1717) i!822))))

(declare-datatypes ((Unit!32443 0))(
  ( (Unit!32444) )
))
(declare-fun lt!432616 () Unit!32443)

(declare-fun lt!432618 () V!34675)

(declare-fun lt!432614 () (_ BitVec 64))

(declare-fun addStillContains!607 (ListLongMap!13061 (_ BitVec 64) V!34675 (_ BitVec 64)) Unit!32443)

(assert (=> b!973634 (= lt!432616 (addStillContains!607 lt!432615 lt!432614 lt!432618 (select (arr!29154 _keys!1717) i!822)))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34675)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34675)

(declare-fun lt!432620 () ListLongMap!13061)

(declare-fun getCurrentListMap!3779 (array!60581 array!60579 (_ BitVec 32) (_ BitVec 32) V!34675 V!34675 (_ BitVec 32) Int) ListLongMap!13061)

(assert (=> b!973634 (= lt!432620 (+!2911 (getCurrentListMap!3779 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432619))))

(assert (=> b!973634 (= lt!432619 (tuple2!14365 lt!432614 lt!432618))))

(declare-fun get!15114 (ValueCell!10653 V!34675) V!34675)

(declare-fun dynLambda!1700 (Int (_ BitVec 64)) V!34675)

(assert (=> b!973634 (= lt!432618 (get!15114 (select (arr!29153 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1700 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432617 () Unit!32443)

(declare-fun lemmaListMapRecursiveValidKeyArray!277 (array!60581 array!60579 (_ BitVec 32) (_ BitVec 32) V!34675 V!34675 (_ BitVec 32) Int) Unit!32443)

(assert (=> b!973634 (= lt!432617 (lemmaListMapRecursiveValidKeyArray!277 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973636 () Bool)

(declare-fun e!548807 () Bool)

(assert (=> b!973636 (= e!548807 e!548809)))

(declare-fun res!651728 () Bool)

(assert (=> b!973636 (=> (not res!651728) (not e!548809))))

(assert (=> b!973636 (= res!651728 (validKeyInArray!0 lt!432614))))

(assert (=> b!973636 (= lt!432614 (select (arr!29154 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973636 (= lt!432620 (getCurrentListMap!3779 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973637 () Bool)

(declare-fun tp_is_empty!22269 () Bool)

(assert (=> b!973637 (= e!548810 tp_is_empty!22269)))

(declare-fun b!973638 () Bool)

(declare-fun e!548811 () Bool)

(assert (=> b!973638 (= e!548811 tp_is_empty!22269)))

(declare-fun b!973639 () Bool)

(declare-fun res!651725 () Bool)

(assert (=> b!973639 (=> (not res!651725) (not e!548812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60581 (_ BitVec 32)) Bool)

(assert (=> b!973639 (= res!651725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973640 () Bool)

(declare-fun res!651731 () Bool)

(assert (=> b!973640 (=> (not res!651731) (not e!548812))))

(declare-datatypes ((List!20223 0))(
  ( (Nil!20220) (Cons!20219 (h!21381 (_ BitVec 64)) (t!28692 List!20223)) )
))
(declare-fun arrayNoDuplicates!0 (array!60581 (_ BitVec 32) List!20223) Bool)

(assert (=> b!973640 (= res!651731 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20220))))

(declare-fun b!973641 () Bool)

(declare-fun res!651726 () Bool)

(assert (=> b!973641 (=> (not res!651726) (not e!548812))))

(assert (=> b!973641 (= res!651726 (and (= (size!29632 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29633 _keys!1717) (size!29632 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35413 () Bool)

(declare-fun tp!67392 () Bool)

(assert (=> mapNonEmpty!35413 (= mapRes!35413 (and tp!67392 e!548811))))

(declare-fun mapRest!35413 () (Array (_ BitVec 32) ValueCell!10653))

(declare-fun mapValue!35413 () ValueCell!10653)

(declare-fun mapKey!35413 () (_ BitVec 32))

(assert (=> mapNonEmpty!35413 (= (arr!29153 _values!1425) (store mapRest!35413 mapKey!35413 mapValue!35413))))

(declare-fun b!973635 () Bool)

(assert (=> b!973635 (= e!548812 e!548807)))

(declare-fun res!651729 () Bool)

(assert (=> b!973635 (=> (not res!651729) (not e!548807))))

(assert (=> b!973635 (= res!651729 (contains!5637 lt!432615 (select (arr!29154 _keys!1717) i!822)))))

(assert (=> b!973635 (= lt!432615 (getCurrentListMap!3779 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun res!651732 () Bool)

(assert (=> start!83378 (=> (not res!651732) (not e!548812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83378 (= res!651732 (validMask!0 mask!2147))))

(assert (=> start!83378 e!548812))

(assert (=> start!83378 true))

(declare-fun array_inv!22551 (array!60579) Bool)

(assert (=> start!83378 (and (array_inv!22551 _values!1425) e!548806)))

(assert (=> start!83378 tp_is_empty!22269))

(assert (=> start!83378 tp!67391))

(declare-fun array_inv!22552 (array!60581) Bool)

(assert (=> start!83378 (array_inv!22552 _keys!1717)))

(assert (= (and start!83378 res!651732) b!973641))

(assert (= (and b!973641 res!651726) b!973639))

(assert (= (and b!973639 res!651725) b!973640))

(assert (= (and b!973640 res!651731) b!973632))

(assert (= (and b!973632 res!651730) b!973633))

(assert (= (and b!973633 res!651727) b!973635))

(assert (= (and b!973635 res!651729) b!973636))

(assert (= (and b!973636 res!651728) b!973634))

(assert (= (and b!973631 condMapEmpty!35413) mapIsEmpty!35413))

(assert (= (and b!973631 (not condMapEmpty!35413)) mapNonEmpty!35413))

(get-info :version)

(assert (= (and mapNonEmpty!35413 ((_ is ValueCellFull!10653) mapValue!35413)) b!973638))

(assert (= (and b!973631 ((_ is ValueCellFull!10653) mapDefault!35413)) b!973637))

(assert (= start!83378 b!973631))

(declare-fun b_lambda!14535 () Bool)

(assert (=> (not b_lambda!14535) (not b!973634)))

(declare-fun t!28690 () Bool)

(declare-fun tb!6319 () Bool)

(assert (=> (and start!83378 (= defaultEntry!1428 defaultEntry!1428) t!28690) tb!6319))

(declare-fun result!12615 () Bool)

(assert (=> tb!6319 (= result!12615 tp_is_empty!22269)))

(assert (=> b!973634 t!28690))

(declare-fun b_and!30965 () Bool)

(assert (= b_and!30963 (and (=> t!28690 result!12615) b_and!30965)))

(declare-fun m!901275 () Bool)

(assert (=> b!973633 m!901275))

(assert (=> b!973633 m!901275))

(declare-fun m!901277 () Bool)

(assert (=> b!973633 m!901277))

(declare-fun m!901279 () Bool)

(assert (=> b!973634 m!901279))

(declare-fun m!901281 () Bool)

(assert (=> b!973634 m!901281))

(declare-fun m!901283 () Bool)

(assert (=> b!973634 m!901283))

(assert (=> b!973634 m!901279))

(declare-fun m!901285 () Bool)

(assert (=> b!973634 m!901285))

(declare-fun m!901287 () Bool)

(assert (=> b!973634 m!901287))

(assert (=> b!973634 m!901275))

(assert (=> b!973634 m!901283))

(assert (=> b!973634 m!901285))

(declare-fun m!901289 () Bool)

(assert (=> b!973634 m!901289))

(assert (=> b!973634 m!901287))

(assert (=> b!973634 m!901275))

(declare-fun m!901291 () Bool)

(assert (=> b!973634 m!901291))

(assert (=> b!973634 m!901275))

(declare-fun m!901293 () Bool)

(assert (=> b!973634 m!901293))

(declare-fun m!901295 () Bool)

(assert (=> b!973634 m!901295))

(declare-fun m!901297 () Bool)

(assert (=> mapNonEmpty!35413 m!901297))

(declare-fun m!901299 () Bool)

(assert (=> b!973636 m!901299))

(declare-fun m!901301 () Bool)

(assert (=> b!973636 m!901301))

(declare-fun m!901303 () Bool)

(assert (=> b!973636 m!901303))

(declare-fun m!901305 () Bool)

(assert (=> start!83378 m!901305))

(declare-fun m!901307 () Bool)

(assert (=> start!83378 m!901307))

(declare-fun m!901309 () Bool)

(assert (=> start!83378 m!901309))

(declare-fun m!901311 () Bool)

(assert (=> b!973639 m!901311))

(declare-fun m!901313 () Bool)

(assert (=> b!973640 m!901313))

(assert (=> b!973635 m!901275))

(assert (=> b!973635 m!901275))

(declare-fun m!901315 () Bool)

(assert (=> b!973635 m!901315))

(declare-fun m!901317 () Bool)

(assert (=> b!973635 m!901317))

(check-sat (not b!973635) (not b!973633) tp_is_empty!22269 (not b_lambda!14535) (not b!973634) (not mapNonEmpty!35413) (not start!83378) (not b!973639) (not b_next!19371) (not b!973640) b_and!30965 (not b!973636))
(check-sat b_and!30965 (not b_next!19371))
