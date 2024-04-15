; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83728 () Bool)

(assert start!83728)

(declare-fun b_free!19555 () Bool)

(declare-fun b_next!19555 () Bool)

(assert (=> start!83728 (= b_free!19555 (not b_next!19555))))

(declare-fun tp!68107 () Bool)

(declare-fun b_and!31179 () Bool)

(assert (=> start!83728 (= tp!68107 b_and!31179)))

(declare-fun b!977620 () Bool)

(declare-fun res!654302 () Bool)

(declare-fun e!551196 () Bool)

(assert (=> b!977620 (=> (not res!654302) (not e!551196))))

(declare-datatypes ((array!61054 0))(
  ( (array!61055 (arr!29385 (Array (_ BitVec 32) (_ BitVec 64))) (size!29866 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61054)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61054 (_ BitVec 32)) Bool)

(assert (=> b!977620 (= res!654302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35852 () Bool)

(declare-fun mapRes!35852 () Bool)

(declare-fun tp!68108 () Bool)

(declare-fun e!551198 () Bool)

(assert (=> mapNonEmpty!35852 (= mapRes!35852 (and tp!68108 e!551198))))

(declare-datatypes ((V!35049 0))(
  ( (V!35050 (val!11325 Int)) )
))
(declare-datatypes ((ValueCell!10793 0))(
  ( (ValueCellFull!10793 (v!13886 V!35049)) (EmptyCell!10793) )
))
(declare-datatypes ((array!61056 0))(
  ( (array!61057 (arr!29386 (Array (_ BitVec 32) ValueCell!10793)) (size!29867 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61056)

(declare-fun mapValue!35852 () ValueCell!10793)

(declare-fun mapRest!35852 () (Array (_ BitVec 32) ValueCell!10793))

(declare-fun mapKey!35852 () (_ BitVec 32))

(assert (=> mapNonEmpty!35852 (= (arr!29386 _values!1278) (store mapRest!35852 mapKey!35852 mapValue!35852))))

(declare-fun b!977621 () Bool)

(declare-fun res!654303 () Bool)

(assert (=> b!977621 (=> (not res!654303) (not e!551196))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977621 (= res!654303 (validKeyInArray!0 (select (arr!29385 _keys!1544) from!1932)))))

(declare-fun res!654301 () Bool)

(assert (=> start!83728 (=> (not res!654301) (not e!551196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83728 (= res!654301 (validMask!0 mask!1948))))

(assert (=> start!83728 e!551196))

(assert (=> start!83728 true))

(declare-fun tp_is_empty!22549 () Bool)

(assert (=> start!83728 tp_is_empty!22549))

(declare-fun e!551195 () Bool)

(declare-fun array_inv!22755 (array!61056) Bool)

(assert (=> start!83728 (and (array_inv!22755 _values!1278) e!551195)))

(assert (=> start!83728 tp!68107))

(declare-fun array_inv!22756 (array!61054) Bool)

(assert (=> start!83728 (array_inv!22756 _keys!1544)))

(declare-fun b!977622 () Bool)

(declare-fun res!654299 () Bool)

(assert (=> b!977622 (=> (not res!654299) (not e!551196))))

(assert (=> b!977622 (= res!654299 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29866 _keys!1544))))))

(declare-fun b!977623 () Bool)

(declare-fun res!654297 () Bool)

(assert (=> b!977623 (=> (not res!654297) (not e!551196))))

(declare-datatypes ((List!20401 0))(
  ( (Nil!20398) (Cons!20397 (h!21559 (_ BitVec 64)) (t!28907 List!20401)) )
))
(declare-fun arrayNoDuplicates!0 (array!61054 (_ BitVec 32) List!20401) Bool)

(assert (=> b!977623 (= res!654297 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20398))))

(declare-fun b!977624 () Bool)

(assert (=> b!977624 (= e!551196 false)))

(declare-fun minValue!1220 () V!35049)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35049)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14574 0))(
  ( (tuple2!14575 (_1!7298 (_ BitVec 64)) (_2!7298 V!35049)) )
))
(declare-datatypes ((List!20402 0))(
  ( (Nil!20399) (Cons!20398 (h!21560 tuple2!14574) (t!28908 List!20402)) )
))
(declare-datatypes ((ListLongMap!13261 0))(
  ( (ListLongMap!13262 (toList!6646 List!20402)) )
))
(declare-fun lt!433287 () ListLongMap!13261)

(declare-fun +!2946 (ListLongMap!13261 tuple2!14574) ListLongMap!13261)

(declare-fun getCurrentListMapNoExtraKeys!3366 (array!61054 array!61056 (_ BitVec 32) (_ BitVec 32) V!35049 V!35049 (_ BitVec 32) Int) ListLongMap!13261)

(assert (=> b!977624 (= lt!433287 (+!2946 (getCurrentListMapNoExtraKeys!3366 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!977625 () Bool)

(assert (=> b!977625 (= e!551198 tp_is_empty!22549)))

(declare-fun mapIsEmpty!35852 () Bool)

(assert (=> mapIsEmpty!35852 mapRes!35852))

(declare-fun b!977626 () Bool)

(declare-fun res!654300 () Bool)

(assert (=> b!977626 (=> (not res!654300) (not e!551196))))

(assert (=> b!977626 (= res!654300 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!977627 () Bool)

(declare-fun e!551194 () Bool)

(assert (=> b!977627 (= e!551195 (and e!551194 mapRes!35852))))

(declare-fun condMapEmpty!35852 () Bool)

(declare-fun mapDefault!35852 () ValueCell!10793)

(assert (=> b!977627 (= condMapEmpty!35852 (= (arr!29386 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10793)) mapDefault!35852)))))

(declare-fun b!977628 () Bool)

(assert (=> b!977628 (= e!551194 tp_is_empty!22549)))

(declare-fun b!977629 () Bool)

(declare-fun res!654298 () Bool)

(assert (=> b!977629 (=> (not res!654298) (not e!551196))))

(assert (=> b!977629 (= res!654298 (and (= (size!29867 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29866 _keys!1544) (size!29867 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83728 res!654301) b!977629))

(assert (= (and b!977629 res!654298) b!977620))

(assert (= (and b!977620 res!654302) b!977623))

(assert (= (and b!977623 res!654297) b!977622))

(assert (= (and b!977622 res!654299) b!977621))

(assert (= (and b!977621 res!654303) b!977626))

(assert (= (and b!977626 res!654300) b!977624))

(assert (= (and b!977627 condMapEmpty!35852) mapIsEmpty!35852))

(assert (= (and b!977627 (not condMapEmpty!35852)) mapNonEmpty!35852))

(get-info :version)

(assert (= (and mapNonEmpty!35852 ((_ is ValueCellFull!10793) mapValue!35852)) b!977625))

(assert (= (and b!977627 ((_ is ValueCellFull!10793) mapDefault!35852)) b!977628))

(assert (= start!83728 b!977627))

(declare-fun m!904217 () Bool)

(assert (=> b!977624 m!904217))

(assert (=> b!977624 m!904217))

(declare-fun m!904219 () Bool)

(assert (=> b!977624 m!904219))

(declare-fun m!904221 () Bool)

(assert (=> mapNonEmpty!35852 m!904221))

(declare-fun m!904223 () Bool)

(assert (=> b!977623 m!904223))

(declare-fun m!904225 () Bool)

(assert (=> b!977620 m!904225))

(declare-fun m!904227 () Bool)

(assert (=> start!83728 m!904227))

(declare-fun m!904229 () Bool)

(assert (=> start!83728 m!904229))

(declare-fun m!904231 () Bool)

(assert (=> start!83728 m!904231))

(declare-fun m!904233 () Bool)

(assert (=> b!977621 m!904233))

(assert (=> b!977621 m!904233))

(declare-fun m!904235 () Bool)

(assert (=> b!977621 m!904235))

(check-sat (not b!977620) (not b_next!19555) tp_is_empty!22549 (not b!977621) (not mapNonEmpty!35852) (not b!977624) b_and!31179 (not start!83728) (not b!977623))
(check-sat b_and!31179 (not b_next!19555))
