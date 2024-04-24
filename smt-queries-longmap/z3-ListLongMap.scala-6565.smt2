; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83442 () Bool)

(assert start!83442)

(declare-fun b_free!19267 () Bool)

(declare-fun b_next!19267 () Bool)

(assert (=> start!83442 (= b_free!19267 (not b_next!19267))))

(declare-fun tp!67080 () Bool)

(declare-fun b_and!30765 () Bool)

(assert (=> start!83442 (= tp!67080 b_and!30765)))

(declare-fun b!972715 () Bool)

(declare-fun res!650825 () Bool)

(declare-fun e!548385 () Bool)

(assert (=> b!972715 (=> (not res!650825) (not e!548385))))

(declare-datatypes ((V!34537 0))(
  ( (V!34538 (val!11133 Int)) )
))
(declare-datatypes ((ValueCell!10601 0))(
  ( (ValueCellFull!10601 (v!13689 V!34537)) (EmptyCell!10601) )
))
(declare-datatypes ((array!60402 0))(
  ( (array!60403 (arr!29060 (Array (_ BitVec 32) ValueCell!10601)) (size!29540 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60402)

(declare-fun zeroValue!1367 () V!34537)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34537)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60404 0))(
  ( (array!60405 (arr!29061 (Array (_ BitVec 32) (_ BitVec 64))) (size!29541 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60404)

(declare-datatypes ((tuple2!14278 0))(
  ( (tuple2!14279 (_1!7150 (_ BitVec 64)) (_2!7150 V!34537)) )
))
(declare-datatypes ((List!20130 0))(
  ( (Nil!20127) (Cons!20126 (h!21294 tuple2!14278) (t!28487 List!20130)) )
))
(declare-datatypes ((ListLongMap!12977 0))(
  ( (ListLongMap!12978 (toList!6504 List!20130)) )
))
(declare-fun contains!5617 (ListLongMap!12977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3737 (array!60404 array!60402 (_ BitVec 32) (_ BitVec 32) V!34537 V!34537 (_ BitVec 32) Int) ListLongMap!12977)

(assert (=> b!972715 (= res!650825 (contains!5617 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29061 _keys!1717) i!822)))))

(declare-fun b!972716 () Bool)

(declare-fun e!548389 () Bool)

(declare-fun tp_is_empty!22165 () Bool)

(assert (=> b!972716 (= e!548389 tp_is_empty!22165)))

(declare-fun b!972717 () Bool)

(declare-fun res!650828 () Bool)

(assert (=> b!972717 (=> (not res!650828) (not e!548385))))

(assert (=> b!972717 (= res!650828 (and (= (size!29540 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29541 _keys!1717) (size!29540 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972718 () Bool)

(declare-fun res!650823 () Bool)

(assert (=> b!972718 (=> (not res!650823) (not e!548385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972718 (= res!650823 (validKeyInArray!0 (select (arr!29061 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35257 () Bool)

(declare-fun mapRes!35257 () Bool)

(declare-fun tp!67081 () Bool)

(declare-fun e!548384 () Bool)

(assert (=> mapNonEmpty!35257 (= mapRes!35257 (and tp!67081 e!548384))))

(declare-fun mapRest!35257 () (Array (_ BitVec 32) ValueCell!10601))

(declare-fun mapValue!35257 () ValueCell!10601)

(declare-fun mapKey!35257 () (_ BitVec 32))

(assert (=> mapNonEmpty!35257 (= (arr!29060 _values!1425) (store mapRest!35257 mapKey!35257 mapValue!35257))))

(declare-fun b!972719 () Bool)

(declare-fun e!548387 () Bool)

(assert (=> b!972719 (= e!548385 e!548387)))

(declare-fun res!650824 () Bool)

(assert (=> b!972719 (=> (not res!650824) (not e!548387))))

(declare-fun lt!432237 () (_ BitVec 64))

(assert (=> b!972719 (= res!650824 (validKeyInArray!0 lt!432237))))

(assert (=> b!972719 (= lt!432237 (select (arr!29061 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432235 () ListLongMap!12977)

(assert (=> b!972719 (= lt!432235 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972720 () Bool)

(declare-fun res!650827 () Bool)

(assert (=> b!972720 (=> (not res!650827) (not e!548385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60404 (_ BitVec 32)) Bool)

(assert (=> b!972720 (= res!650827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35257 () Bool)

(assert (=> mapIsEmpty!35257 mapRes!35257))

(declare-fun b!972721 () Bool)

(declare-fun e!548386 () Bool)

(assert (=> b!972721 (= e!548386 (and e!548389 mapRes!35257))))

(declare-fun condMapEmpty!35257 () Bool)

(declare-fun mapDefault!35257 () ValueCell!10601)

(assert (=> b!972721 (= condMapEmpty!35257 (= (arr!29060 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10601)) mapDefault!35257)))))

(declare-fun b!972722 () Bool)

(assert (=> b!972722 (= e!548387 (not true))))

(declare-fun +!2885 (ListLongMap!12977 tuple2!14278) ListLongMap!12977)

(declare-fun get!15066 (ValueCell!10601 V!34537) V!34537)

(declare-fun dynLambda!1682 (Int (_ BitVec 64)) V!34537)

(assert (=> b!972722 (= lt!432235 (+!2885 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14279 lt!432237 (get!15066 (select (arr!29060 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1682 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32334 0))(
  ( (Unit!32335) )
))
(declare-fun lt!432236 () Unit!32334)

(declare-fun lemmaListMapRecursiveValidKeyArray!241 (array!60404 array!60402 (_ BitVec 32) (_ BitVec 32) V!34537 V!34537 (_ BitVec 32) Int) Unit!32334)

(assert (=> b!972722 (= lt!432236 (lemmaListMapRecursiveValidKeyArray!241 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!650822 () Bool)

(assert (=> start!83442 (=> (not res!650822) (not e!548385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83442 (= res!650822 (validMask!0 mask!2147))))

(assert (=> start!83442 e!548385))

(assert (=> start!83442 true))

(declare-fun array_inv!22537 (array!60402) Bool)

(assert (=> start!83442 (and (array_inv!22537 _values!1425) e!548386)))

(assert (=> start!83442 tp_is_empty!22165))

(assert (=> start!83442 tp!67080))

(declare-fun array_inv!22538 (array!60404) Bool)

(assert (=> start!83442 (array_inv!22538 _keys!1717)))

(declare-fun b!972714 () Bool)

(declare-fun res!650826 () Bool)

(assert (=> b!972714 (=> (not res!650826) (not e!548385))))

(assert (=> b!972714 (= res!650826 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29541 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29541 _keys!1717))))))

(declare-fun b!972723 () Bool)

(assert (=> b!972723 (= e!548384 tp_is_empty!22165)))

(declare-fun b!972724 () Bool)

(declare-fun res!650821 () Bool)

(assert (=> b!972724 (=> (not res!650821) (not e!548385))))

(declare-datatypes ((List!20131 0))(
  ( (Nil!20128) (Cons!20127 (h!21295 (_ BitVec 64)) (t!28488 List!20131)) )
))
(declare-fun arrayNoDuplicates!0 (array!60404 (_ BitVec 32) List!20131) Bool)

(assert (=> b!972724 (= res!650821 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20128))))

(assert (= (and start!83442 res!650822) b!972717))

(assert (= (and b!972717 res!650828) b!972720))

(assert (= (and b!972720 res!650827) b!972724))

(assert (= (and b!972724 res!650821) b!972714))

(assert (= (and b!972714 res!650826) b!972718))

(assert (= (and b!972718 res!650823) b!972715))

(assert (= (and b!972715 res!650825) b!972719))

(assert (= (and b!972719 res!650824) b!972722))

(assert (= (and b!972721 condMapEmpty!35257) mapIsEmpty!35257))

(assert (= (and b!972721 (not condMapEmpty!35257)) mapNonEmpty!35257))

(get-info :version)

(assert (= (and mapNonEmpty!35257 ((_ is ValueCellFull!10601) mapValue!35257)) b!972723))

(assert (= (and b!972721 ((_ is ValueCellFull!10601) mapDefault!35257)) b!972716))

(assert (= start!83442 b!972721))

(declare-fun b_lambda!14445 () Bool)

(assert (=> (not b_lambda!14445) (not b!972722)))

(declare-fun t!28486 () Bool)

(declare-fun tb!6207 () Bool)

(assert (=> (and start!83442 (= defaultEntry!1428 defaultEntry!1428) t!28486) tb!6207))

(declare-fun result!12399 () Bool)

(assert (=> tb!6207 (= result!12399 tp_is_empty!22165)))

(assert (=> b!972722 t!28486))

(declare-fun b_and!30767 () Bool)

(assert (= b_and!30765 (and (=> t!28486 result!12399) b_and!30767)))

(declare-fun m!900461 () Bool)

(assert (=> b!972715 m!900461))

(declare-fun m!900463 () Bool)

(assert (=> b!972715 m!900463))

(assert (=> b!972715 m!900461))

(assert (=> b!972715 m!900463))

(declare-fun m!900465 () Bool)

(assert (=> b!972715 m!900465))

(declare-fun m!900467 () Bool)

(assert (=> mapNonEmpty!35257 m!900467))

(declare-fun m!900469 () Bool)

(assert (=> b!972720 m!900469))

(declare-fun m!900471 () Bool)

(assert (=> start!83442 m!900471))

(declare-fun m!900473 () Bool)

(assert (=> start!83442 m!900473))

(declare-fun m!900475 () Bool)

(assert (=> start!83442 m!900475))

(declare-fun m!900477 () Bool)

(assert (=> b!972719 m!900477))

(declare-fun m!900479 () Bool)

(assert (=> b!972719 m!900479))

(declare-fun m!900481 () Bool)

(assert (=> b!972719 m!900481))

(declare-fun m!900483 () Bool)

(assert (=> b!972722 m!900483))

(declare-fun m!900485 () Bool)

(assert (=> b!972722 m!900485))

(declare-fun m!900487 () Bool)

(assert (=> b!972722 m!900487))

(assert (=> b!972722 m!900483))

(declare-fun m!900489 () Bool)

(assert (=> b!972722 m!900489))

(assert (=> b!972722 m!900487))

(assert (=> b!972722 m!900489))

(declare-fun m!900491 () Bool)

(assert (=> b!972722 m!900491))

(declare-fun m!900493 () Bool)

(assert (=> b!972722 m!900493))

(assert (=> b!972718 m!900463))

(assert (=> b!972718 m!900463))

(declare-fun m!900495 () Bool)

(assert (=> b!972718 m!900495))

(declare-fun m!900497 () Bool)

(assert (=> b!972724 m!900497))

(check-sat (not b!972718) b_and!30767 (not b!972719) (not b!972722) (not b!972724) (not b!972715) tp_is_empty!22165 (not start!83442) (not b_lambda!14445) (not b!972720) (not b_next!19267) (not mapNonEmpty!35257))
(check-sat b_and!30767 (not b_next!19267))
