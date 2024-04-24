; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84400 () Bool)

(assert start!84400)

(declare-fun b_free!19933 () Bool)

(declare-fun b_next!19933 () Bool)

(assert (=> start!84400 (= b_free!19933 (not b_next!19933))))

(declare-fun tp!69404 () Bool)

(declare-fun b_and!31953 () Bool)

(assert (=> start!84400 (= tp!69404 b_and!31953)))

(declare-fun b!986270 () Bool)

(declare-fun res!659716 () Bool)

(declare-fun e!556026 () Bool)

(assert (=> b!986270 (=> (not res!659716) (not e!556026))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35697 0))(
  ( (V!35698 (val!11568 Int)) )
))
(declare-datatypes ((ValueCell!11036 0))(
  ( (ValueCellFull!11036 (v!14127 V!35697)) (EmptyCell!11036) )
))
(declare-datatypes ((array!62086 0))(
  ( (array!62087 (arr!29896 (Array (_ BitVec 32) ValueCell!11036)) (size!30376 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62086)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62088 0))(
  ( (array!62089 (arr!29897 (Array (_ BitVec 32) (_ BitVec 64))) (size!30377 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62088)

(assert (=> b!986270 (= res!659716 (and (= (size!30376 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30377 _keys!1544) (size!30376 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986271 () Bool)

(declare-fun res!659712 () Bool)

(assert (=> b!986271 (=> (not res!659712) (not e!556026))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986271 (= res!659712 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30377 _keys!1544))))))

(declare-fun b!986272 () Bool)

(declare-fun e!556023 () Bool)

(declare-fun tp_is_empty!23035 () Bool)

(assert (=> b!986272 (= e!556023 tp_is_empty!23035)))

(declare-fun b!986273 () Bool)

(declare-fun e!556022 () Bool)

(assert (=> b!986273 (= e!556026 e!556022)))

(declare-fun res!659718 () Bool)

(assert (=> b!986273 (=> (not res!659718) (not e!556022))))

(assert (=> b!986273 (= res!659718 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29897 _keys!1544) from!1932))))))

(declare-fun lt!437575 () V!35697)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15543 (ValueCell!11036 V!35697) V!35697)

(declare-fun dynLambda!1866 (Int (_ BitVec 64)) V!35697)

(assert (=> b!986273 (= lt!437575 (get!15543 (select (arr!29896 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35697)

(declare-fun zeroValue!1220 () V!35697)

(declare-datatypes ((tuple2!14822 0))(
  ( (tuple2!14823 (_1!7422 (_ BitVec 64)) (_2!7422 V!35697)) )
))
(declare-datatypes ((List!20700 0))(
  ( (Nil!20697) (Cons!20696 (h!21864 tuple2!14822) (t!29569 List!20700)) )
))
(declare-datatypes ((ListLongMap!13521 0))(
  ( (ListLongMap!13522 (toList!6776 List!20700)) )
))
(declare-fun lt!437573 () ListLongMap!13521)

(declare-fun getCurrentListMapNoExtraKeys!3509 (array!62088 array!62086 (_ BitVec 32) (_ BitVec 32) V!35697 V!35697 (_ BitVec 32) Int) ListLongMap!13521)

(assert (=> b!986273 (= lt!437573 (getCurrentListMapNoExtraKeys!3509 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!659719 () Bool)

(assert (=> start!84400 (=> (not res!659719) (not e!556026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84400 (= res!659719 (validMask!0 mask!1948))))

(assert (=> start!84400 e!556026))

(assert (=> start!84400 true))

(assert (=> start!84400 tp_is_empty!23035))

(declare-fun e!556024 () Bool)

(declare-fun array_inv!23125 (array!62086) Bool)

(assert (=> start!84400 (and (array_inv!23125 _values!1278) e!556024)))

(assert (=> start!84400 tp!69404))

(declare-fun array_inv!23126 (array!62088) Bool)

(assert (=> start!84400 (array_inv!23126 _keys!1544)))

(declare-fun mapIsEmpty!36581 () Bool)

(declare-fun mapRes!36581 () Bool)

(assert (=> mapIsEmpty!36581 mapRes!36581))

(declare-fun b!986274 () Bool)

(declare-fun res!659714 () Bool)

(assert (=> b!986274 (=> (not res!659714) (not e!556026))))

(declare-datatypes ((List!20701 0))(
  ( (Nil!20698) (Cons!20697 (h!21865 (_ BitVec 64)) (t!29570 List!20701)) )
))
(declare-fun arrayNoDuplicates!0 (array!62088 (_ BitVec 32) List!20701) Bool)

(assert (=> b!986274 (= res!659714 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20698))))

(declare-fun b!986275 () Bool)

(declare-fun e!556025 () Bool)

(assert (=> b!986275 (= e!556024 (and e!556025 mapRes!36581))))

(declare-fun condMapEmpty!36581 () Bool)

(declare-fun mapDefault!36581 () ValueCell!11036)

(assert (=> b!986275 (= condMapEmpty!36581 (= (arr!29896 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11036)) mapDefault!36581)))))

(declare-fun b!986276 () Bool)

(declare-fun res!659715 () Bool)

(assert (=> b!986276 (=> (not res!659715) (not e!556026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986276 (= res!659715 (validKeyInArray!0 (select (arr!29897 _keys!1544) from!1932)))))

(declare-fun b!986277 () Bool)

(assert (=> b!986277 (= e!556022 (not true))))

(declare-fun lt!437576 () tuple2!14822)

(declare-fun lt!437577 () tuple2!14822)

(declare-fun +!3075 (ListLongMap!13521 tuple2!14822) ListLongMap!13521)

(assert (=> b!986277 (= (+!3075 (+!3075 lt!437573 lt!437576) lt!437577) (+!3075 (+!3075 lt!437573 lt!437577) lt!437576))))

(assert (=> b!986277 (= lt!437577 (tuple2!14823 (select (arr!29897 _keys!1544) from!1932) lt!437575))))

(assert (=> b!986277 (= lt!437576 (tuple2!14823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32730 0))(
  ( (Unit!32731) )
))
(declare-fun lt!437574 () Unit!32730)

(declare-fun addCommutativeForDiffKeys!682 (ListLongMap!13521 (_ BitVec 64) V!35697 (_ BitVec 64) V!35697) Unit!32730)

(assert (=> b!986277 (= lt!437574 (addCommutativeForDiffKeys!682 lt!437573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29897 _keys!1544) from!1932) lt!437575))))

(declare-fun b!986278 () Bool)

(declare-fun res!659713 () Bool)

(assert (=> b!986278 (=> (not res!659713) (not e!556026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62088 (_ BitVec 32)) Bool)

(assert (=> b!986278 (= res!659713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986279 () Bool)

(declare-fun res!659717 () Bool)

(assert (=> b!986279 (=> (not res!659717) (not e!556026))))

(assert (=> b!986279 (= res!659717 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36581 () Bool)

(declare-fun tp!69403 () Bool)

(assert (=> mapNonEmpty!36581 (= mapRes!36581 (and tp!69403 e!556023))))

(declare-fun mapValue!36581 () ValueCell!11036)

(declare-fun mapKey!36581 () (_ BitVec 32))

(declare-fun mapRest!36581 () (Array (_ BitVec 32) ValueCell!11036))

(assert (=> mapNonEmpty!36581 (= (arr!29896 _values!1278) (store mapRest!36581 mapKey!36581 mapValue!36581))))

(declare-fun b!986280 () Bool)

(assert (=> b!986280 (= e!556025 tp_is_empty!23035)))

(assert (= (and start!84400 res!659719) b!986270))

(assert (= (and b!986270 res!659716) b!986278))

(assert (= (and b!986278 res!659713) b!986274))

(assert (= (and b!986274 res!659714) b!986271))

(assert (= (and b!986271 res!659712) b!986276))

(assert (= (and b!986276 res!659715) b!986279))

(assert (= (and b!986279 res!659717) b!986273))

(assert (= (and b!986273 res!659718) b!986277))

(assert (= (and b!986275 condMapEmpty!36581) mapIsEmpty!36581))

(assert (= (and b!986275 (not condMapEmpty!36581)) mapNonEmpty!36581))

(get-info :version)

(assert (= (and mapNonEmpty!36581 ((_ is ValueCellFull!11036) mapValue!36581)) b!986272))

(assert (= (and b!986275 ((_ is ValueCellFull!11036) mapDefault!36581)) b!986280))

(assert (= start!84400 b!986275))

(declare-fun b_lambda!14979 () Bool)

(assert (=> (not b_lambda!14979) (not b!986273)))

(declare-fun t!29568 () Bool)

(declare-fun tb!6719 () Bool)

(assert (=> (and start!84400 (= defaultEntry!1281 defaultEntry!1281) t!29568) tb!6719))

(declare-fun result!13435 () Bool)

(assert (=> tb!6719 (= result!13435 tp_is_empty!23035)))

(assert (=> b!986273 t!29568))

(declare-fun b_and!31955 () Bool)

(assert (= b_and!31953 (and (=> t!29568 result!13435) b_and!31955)))

(declare-fun m!913721 () Bool)

(assert (=> b!986274 m!913721))

(declare-fun m!913723 () Bool)

(assert (=> mapNonEmpty!36581 m!913723))

(declare-fun m!913725 () Bool)

(assert (=> b!986278 m!913725))

(declare-fun m!913727 () Bool)

(assert (=> b!986277 m!913727))

(declare-fun m!913729 () Bool)

(assert (=> b!986277 m!913729))

(assert (=> b!986277 m!913729))

(declare-fun m!913731 () Bool)

(assert (=> b!986277 m!913731))

(declare-fun m!913733 () Bool)

(assert (=> b!986277 m!913733))

(declare-fun m!913735 () Bool)

(assert (=> b!986277 m!913735))

(assert (=> b!986277 m!913727))

(declare-fun m!913737 () Bool)

(assert (=> b!986277 m!913737))

(assert (=> b!986277 m!913733))

(assert (=> b!986273 m!913727))

(declare-fun m!913739 () Bool)

(assert (=> b!986273 m!913739))

(declare-fun m!913741 () Bool)

(assert (=> b!986273 m!913741))

(declare-fun m!913743 () Bool)

(assert (=> b!986273 m!913743))

(assert (=> b!986273 m!913739))

(assert (=> b!986273 m!913743))

(declare-fun m!913745 () Bool)

(assert (=> b!986273 m!913745))

(assert (=> b!986276 m!913727))

(assert (=> b!986276 m!913727))

(declare-fun m!913747 () Bool)

(assert (=> b!986276 m!913747))

(declare-fun m!913749 () Bool)

(assert (=> start!84400 m!913749))

(declare-fun m!913751 () Bool)

(assert (=> start!84400 m!913751))

(declare-fun m!913753 () Bool)

(assert (=> start!84400 m!913753))

(check-sat (not mapNonEmpty!36581) (not b_lambda!14979) (not b_next!19933) (not b!986276) tp_is_empty!23035 (not b!986278) (not b!986277) (not b!986273) (not b!986274) b_and!31955 (not start!84400))
(check-sat b_and!31955 (not b_next!19933))
