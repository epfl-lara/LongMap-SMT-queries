; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83268 () Bool)

(assert start!83268)

(declare-fun b_free!19279 () Bool)

(declare-fun b_next!19279 () Bool)

(assert (=> start!83268 (= b_free!19279 (not b_next!19279))))

(declare-fun tp!67117 () Bool)

(declare-fun b_and!30753 () Bool)

(assert (=> start!83268 (= tp!67117 b_and!30753)))

(declare-fun b!971782 () Bool)

(declare-fun res!650514 () Bool)

(declare-fun e!547763 () Bool)

(assert (=> b!971782 (=> (not res!650514) (not e!547763))))

(declare-datatypes ((array!60336 0))(
  ( (array!60337 (arr!29032 (Array (_ BitVec 32) (_ BitVec 64))) (size!29513 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60336)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60336 (_ BitVec 32)) Bool)

(assert (=> b!971782 (= res!650514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971783 () Bool)

(declare-fun res!650511 () Bool)

(assert (=> b!971783 (=> (not res!650511) (not e!547763))))

(declare-datatypes ((List!20179 0))(
  ( (Nil!20176) (Cons!20175 (h!21337 (_ BitVec 64)) (t!28547 List!20179)) )
))
(declare-fun arrayNoDuplicates!0 (array!60336 (_ BitVec 32) List!20179) Bool)

(assert (=> b!971783 (= res!650511 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20176))))

(declare-fun b!971784 () Bool)

(declare-fun e!547764 () Bool)

(declare-fun tp_is_empty!22177 () Bool)

(assert (=> b!971784 (= e!547764 tp_is_empty!22177)))

(declare-fun b!971785 () Bool)

(declare-fun e!547762 () Bool)

(declare-fun e!547767 () Bool)

(declare-fun mapRes!35275 () Bool)

(assert (=> b!971785 (= e!547762 (and e!547767 mapRes!35275))))

(declare-fun condMapEmpty!35275 () Bool)

(declare-datatypes ((V!34553 0))(
  ( (V!34554 (val!11139 Int)) )
))
(declare-datatypes ((ValueCell!10607 0))(
  ( (ValueCellFull!10607 (v!13697 V!34553)) (EmptyCell!10607) )
))
(declare-datatypes ((array!60338 0))(
  ( (array!60339 (arr!29033 (Array (_ BitVec 32) ValueCell!10607)) (size!29514 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60338)

(declare-fun mapDefault!35275 () ValueCell!10607)

(assert (=> b!971785 (= condMapEmpty!35275 (= (arr!29033 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10607)) mapDefault!35275)))))

(declare-fun b!971786 () Bool)

(assert (=> b!971786 (= e!547767 tp_is_empty!22177)))

(declare-fun b!971787 () Bool)

(declare-fun res!650512 () Bool)

(assert (=> b!971787 (=> (not res!650512) (not e!547763))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971787 (= res!650512 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29513 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29513 _keys!1717))))))

(declare-fun mapNonEmpty!35275 () Bool)

(declare-fun tp!67116 () Bool)

(assert (=> mapNonEmpty!35275 (= mapRes!35275 (and tp!67116 e!547764))))

(declare-fun mapRest!35275 () (Array (_ BitVec 32) ValueCell!10607))

(declare-fun mapKey!35275 () (_ BitVec 32))

(declare-fun mapValue!35275 () ValueCell!10607)

(assert (=> mapNonEmpty!35275 (= (arr!29033 _values!1425) (store mapRest!35275 mapKey!35275 mapValue!35275))))

(declare-fun b!971788 () Bool)

(declare-fun res!650515 () Bool)

(assert (=> b!971788 (=> (not res!650515) (not e!547763))))

(declare-fun zeroValue!1367 () V!34553)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34553)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14368 0))(
  ( (tuple2!14369 (_1!7195 (_ BitVec 64)) (_2!7195 V!34553)) )
))
(declare-datatypes ((List!20180 0))(
  ( (Nil!20177) (Cons!20176 (h!21338 tuple2!14368) (t!28548 List!20180)) )
))
(declare-datatypes ((ListLongMap!13055 0))(
  ( (ListLongMap!13056 (toList!6543 List!20180)) )
))
(declare-fun contains!5584 (ListLongMap!13055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3705 (array!60336 array!60338 (_ BitVec 32) (_ BitVec 32) V!34553 V!34553 (_ BitVec 32) Int) ListLongMap!13055)

(assert (=> b!971788 (= res!650515 (contains!5584 (getCurrentListMap!3705 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29032 _keys!1717) i!822)))))

(declare-fun b!971789 () Bool)

(declare-fun e!547765 () Bool)

(assert (=> b!971789 (= e!547765 (not true))))

(declare-fun lt!431692 () (_ BitVec 64))

(declare-fun lt!431693 () ListLongMap!13055)

(declare-fun +!2897 (ListLongMap!13055 tuple2!14368) ListLongMap!13055)

(declare-fun get!15042 (ValueCell!10607 V!34553) V!34553)

(declare-fun dynLambda!1653 (Int (_ BitVec 64)) V!34553)

(assert (=> b!971789 (= lt!431693 (+!2897 (getCurrentListMap!3705 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14369 lt!431692 (get!15042 (select (arr!29033 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32246 0))(
  ( (Unit!32247) )
))
(declare-fun lt!431694 () Unit!32246)

(declare-fun lemmaListMapRecursiveValidKeyArray!237 (array!60336 array!60338 (_ BitVec 32) (_ BitVec 32) V!34553 V!34553 (_ BitVec 32) Int) Unit!32246)

(assert (=> b!971789 (= lt!431694 (lemmaListMapRecursiveValidKeyArray!237 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971790 () Bool)

(declare-fun res!650517 () Bool)

(assert (=> b!971790 (=> (not res!650517) (not e!547763))))

(assert (=> b!971790 (= res!650517 (and (= (size!29514 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29513 _keys!1717) (size!29514 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35275 () Bool)

(assert (=> mapIsEmpty!35275 mapRes!35275))

(declare-fun res!650516 () Bool)

(assert (=> start!83268 (=> (not res!650516) (not e!547763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83268 (= res!650516 (validMask!0 mask!2147))))

(assert (=> start!83268 e!547763))

(assert (=> start!83268 true))

(declare-fun array_inv!22523 (array!60338) Bool)

(assert (=> start!83268 (and (array_inv!22523 _values!1425) e!547762)))

(assert (=> start!83268 tp_is_empty!22177))

(assert (=> start!83268 tp!67117))

(declare-fun array_inv!22524 (array!60336) Bool)

(assert (=> start!83268 (array_inv!22524 _keys!1717)))

(declare-fun b!971791 () Bool)

(declare-fun res!650513 () Bool)

(assert (=> b!971791 (=> (not res!650513) (not e!547763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971791 (= res!650513 (validKeyInArray!0 (select (arr!29032 _keys!1717) i!822)))))

(declare-fun b!971792 () Bool)

(assert (=> b!971792 (= e!547763 e!547765)))

(declare-fun res!650518 () Bool)

(assert (=> b!971792 (=> (not res!650518) (not e!547765))))

(assert (=> b!971792 (= res!650518 (validKeyInArray!0 lt!431692))))

(assert (=> b!971792 (= lt!431692 (select (arr!29032 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!971792 (= lt!431693 (getCurrentListMap!3705 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83268 res!650516) b!971790))

(assert (= (and b!971790 res!650517) b!971782))

(assert (= (and b!971782 res!650514) b!971783))

(assert (= (and b!971783 res!650511) b!971787))

(assert (= (and b!971787 res!650512) b!971791))

(assert (= (and b!971791 res!650513) b!971788))

(assert (= (and b!971788 res!650515) b!971792))

(assert (= (and b!971792 res!650518) b!971789))

(assert (= (and b!971785 condMapEmpty!35275) mapIsEmpty!35275))

(assert (= (and b!971785 (not condMapEmpty!35275)) mapNonEmpty!35275))

(get-info :version)

(assert (= (and mapNonEmpty!35275 ((_ is ValueCellFull!10607) mapValue!35275)) b!971784))

(assert (= (and b!971785 ((_ is ValueCellFull!10607) mapDefault!35275)) b!971786))

(assert (= start!83268 b!971785))

(declare-fun b_lambda!14425 () Bool)

(assert (=> (not b_lambda!14425) (not b!971789)))

(declare-fun t!28546 () Bool)

(declare-fun tb!6219 () Bool)

(assert (=> (and start!83268 (= defaultEntry!1428 defaultEntry!1428) t!28546) tb!6219))

(declare-fun result!12423 () Bool)

(assert (=> tb!6219 (= result!12423 tp_is_empty!22177)))

(assert (=> b!971789 t!28546))

(declare-fun b_and!30755 () Bool)

(assert (= b_and!30753 (and (=> t!28546 result!12423) b_and!30755)))

(declare-fun m!898637 () Bool)

(assert (=> b!971783 m!898637))

(declare-fun m!898639 () Bool)

(assert (=> mapNonEmpty!35275 m!898639))

(declare-fun m!898641 () Bool)

(assert (=> b!971782 m!898641))

(declare-fun m!898643 () Bool)

(assert (=> start!83268 m!898643))

(declare-fun m!898645 () Bool)

(assert (=> start!83268 m!898645))

(declare-fun m!898647 () Bool)

(assert (=> start!83268 m!898647))

(declare-fun m!898649 () Bool)

(assert (=> b!971788 m!898649))

(declare-fun m!898651 () Bool)

(assert (=> b!971788 m!898651))

(assert (=> b!971788 m!898649))

(assert (=> b!971788 m!898651))

(declare-fun m!898653 () Bool)

(assert (=> b!971788 m!898653))

(assert (=> b!971791 m!898651))

(assert (=> b!971791 m!898651))

(declare-fun m!898655 () Bool)

(assert (=> b!971791 m!898655))

(declare-fun m!898657 () Bool)

(assert (=> b!971789 m!898657))

(declare-fun m!898659 () Bool)

(assert (=> b!971789 m!898659))

(declare-fun m!898661 () Bool)

(assert (=> b!971789 m!898661))

(assert (=> b!971789 m!898659))

(declare-fun m!898663 () Bool)

(assert (=> b!971789 m!898663))

(assert (=> b!971789 m!898657))

(assert (=> b!971789 m!898661))

(declare-fun m!898665 () Bool)

(assert (=> b!971789 m!898665))

(declare-fun m!898667 () Bool)

(assert (=> b!971789 m!898667))

(declare-fun m!898669 () Bool)

(assert (=> b!971792 m!898669))

(declare-fun m!898671 () Bool)

(assert (=> b!971792 m!898671))

(declare-fun m!898673 () Bool)

(assert (=> b!971792 m!898673))

(check-sat b_and!30755 (not b!971791) (not mapNonEmpty!35275) (not b!971792) (not b!971782) (not b!971789) (not b_lambda!14425) (not b!971788) (not b!971783) tp_is_empty!22177 (not b_next!19279) (not start!83268))
(check-sat b_and!30755 (not b_next!19279))
