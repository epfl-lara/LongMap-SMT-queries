; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83276 () Bool)

(assert start!83276)

(declare-fun b_free!19269 () Bool)

(declare-fun b_next!19269 () Bool)

(assert (=> start!83276 (= b_free!19269 (not b_next!19269))))

(declare-fun tp!67085 () Bool)

(declare-fun b_and!30759 () Bool)

(assert (=> start!83276 (= tp!67085 b_and!30759)))

(declare-fun b!971847 () Bool)

(declare-fun e!547824 () Bool)

(declare-fun tp_is_empty!22167 () Bool)

(assert (=> b!971847 (= e!547824 tp_is_empty!22167)))

(declare-fun b!971848 () Bool)

(declare-fun res!650501 () Bool)

(declare-fun e!547820 () Bool)

(assert (=> b!971848 (=> (not res!650501) (not e!547820))))

(declare-datatypes ((array!60381 0))(
  ( (array!60382 (arr!29054 (Array (_ BitVec 32) (_ BitVec 64))) (size!29533 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60381)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60381 (_ BitVec 32)) Bool)

(assert (=> b!971848 (= res!650501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35260 () Bool)

(declare-fun mapRes!35260 () Bool)

(assert (=> mapIsEmpty!35260 mapRes!35260))

(declare-fun b!971849 () Bool)

(declare-fun res!650502 () Bool)

(assert (=> b!971849 (=> (not res!650502) (not e!547820))))

(declare-datatypes ((List!20139 0))(
  ( (Nil!20136) (Cons!20135 (h!21297 (_ BitVec 64)) (t!28506 List!20139)) )
))
(declare-fun arrayNoDuplicates!0 (array!60381 (_ BitVec 32) List!20139) Bool)

(assert (=> b!971849 (= res!650502 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20136))))

(declare-fun b!971850 () Bool)

(declare-fun e!547825 () Bool)

(assert (=> b!971850 (= e!547825 (and e!547824 mapRes!35260))))

(declare-fun condMapEmpty!35260 () Bool)

(declare-datatypes ((V!34539 0))(
  ( (V!34540 (val!11134 Int)) )
))
(declare-datatypes ((ValueCell!10602 0))(
  ( (ValueCellFull!10602 (v!13693 V!34539)) (EmptyCell!10602) )
))
(declare-datatypes ((array!60383 0))(
  ( (array!60384 (arr!29055 (Array (_ BitVec 32) ValueCell!10602)) (size!29534 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60383)

(declare-fun mapDefault!35260 () ValueCell!10602)

(assert (=> b!971850 (= condMapEmpty!35260 (= (arr!29055 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10602)) mapDefault!35260)))))

(declare-fun b!971851 () Bool)

(declare-fun e!547822 () Bool)

(assert (=> b!971851 (= e!547822 (not true))))

(declare-fun zeroValue!1367 () V!34539)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34539)

(declare-fun lt!431885 () (_ BitVec 64))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14274 0))(
  ( (tuple2!14275 (_1!7148 (_ BitVec 64)) (_2!7148 V!34539)) )
))
(declare-datatypes ((List!20140 0))(
  ( (Nil!20137) (Cons!20136 (h!21298 tuple2!14274) (t!28507 List!20140)) )
))
(declare-datatypes ((ListLongMap!12971 0))(
  ( (ListLongMap!12972 (toList!6501 List!20140)) )
))
(declare-fun lt!431884 () ListLongMap!12971)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun +!2875 (ListLongMap!12971 tuple2!14274) ListLongMap!12971)

(declare-fun getCurrentListMap!3734 (array!60381 array!60383 (_ BitVec 32) (_ BitVec 32) V!34539 V!34539 (_ BitVec 32) Int) ListLongMap!12971)

(declare-fun get!15044 (ValueCell!10602 V!34539) V!34539)

(declare-fun dynLambda!1664 (Int (_ BitVec 64)) V!34539)

(assert (=> b!971851 (= lt!431884 (+!2875 (getCurrentListMap!3734 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14275 lt!431885 (get!15044 (select (arr!29055 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1664 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32371 0))(
  ( (Unit!32372) )
))
(declare-fun lt!431883 () Unit!32371)

(declare-fun lemmaListMapRecursiveValidKeyArray!241 (array!60381 array!60383 (_ BitVec 32) (_ BitVec 32) V!34539 V!34539 (_ BitVec 32) Int) Unit!32371)

(assert (=> b!971851 (= lt!431883 (lemmaListMapRecursiveValidKeyArray!241 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971852 () Bool)

(declare-fun res!650503 () Bool)

(assert (=> b!971852 (=> (not res!650503) (not e!547820))))

(assert (=> b!971852 (= res!650503 (and (= (size!29534 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29533 _keys!1717) (size!29534 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971853 () Bool)

(declare-fun res!650506 () Bool)

(assert (=> b!971853 (=> (not res!650506) (not e!547820))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5600 (ListLongMap!12971 (_ BitVec 64)) Bool)

(assert (=> b!971853 (= res!650506 (contains!5600 (getCurrentListMap!3734 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29054 _keys!1717) i!822)))))

(declare-fun b!971854 () Bool)

(assert (=> b!971854 (= e!547820 e!547822)))

(declare-fun res!650505 () Bool)

(assert (=> b!971854 (=> (not res!650505) (not e!547822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971854 (= res!650505 (validKeyInArray!0 lt!431885))))

(assert (=> b!971854 (= lt!431885 (select (arr!29054 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!971854 (= lt!431884 (getCurrentListMap!3734 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971855 () Bool)

(declare-fun res!650508 () Bool)

(assert (=> b!971855 (=> (not res!650508) (not e!547820))))

(assert (=> b!971855 (= res!650508 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29533 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29533 _keys!1717))))))

(declare-fun b!971846 () Bool)

(declare-fun e!547823 () Bool)

(assert (=> b!971846 (= e!547823 tp_is_empty!22167)))

(declare-fun res!650507 () Bool)

(assert (=> start!83276 (=> (not res!650507) (not e!547820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83276 (= res!650507 (validMask!0 mask!2147))))

(assert (=> start!83276 e!547820))

(assert (=> start!83276 true))

(declare-fun array_inv!22479 (array!60383) Bool)

(assert (=> start!83276 (and (array_inv!22479 _values!1425) e!547825)))

(assert (=> start!83276 tp_is_empty!22167))

(assert (=> start!83276 tp!67085))

(declare-fun array_inv!22480 (array!60381) Bool)

(assert (=> start!83276 (array_inv!22480 _keys!1717)))

(declare-fun mapNonEmpty!35260 () Bool)

(declare-fun tp!67086 () Bool)

(assert (=> mapNonEmpty!35260 (= mapRes!35260 (and tp!67086 e!547823))))

(declare-fun mapRest!35260 () (Array (_ BitVec 32) ValueCell!10602))

(declare-fun mapValue!35260 () ValueCell!10602)

(declare-fun mapKey!35260 () (_ BitVec 32))

(assert (=> mapNonEmpty!35260 (= (arr!29055 _values!1425) (store mapRest!35260 mapKey!35260 mapValue!35260))))

(declare-fun b!971856 () Bool)

(declare-fun res!650504 () Bool)

(assert (=> b!971856 (=> (not res!650504) (not e!547820))))

(assert (=> b!971856 (= res!650504 (validKeyInArray!0 (select (arr!29054 _keys!1717) i!822)))))

(assert (= (and start!83276 res!650507) b!971852))

(assert (= (and b!971852 res!650503) b!971848))

(assert (= (and b!971848 res!650501) b!971849))

(assert (= (and b!971849 res!650502) b!971855))

(assert (= (and b!971855 res!650508) b!971856))

(assert (= (and b!971856 res!650504) b!971853))

(assert (= (and b!971853 res!650506) b!971854))

(assert (= (and b!971854 res!650505) b!971851))

(assert (= (and b!971850 condMapEmpty!35260) mapIsEmpty!35260))

(assert (= (and b!971850 (not condMapEmpty!35260)) mapNonEmpty!35260))

(get-info :version)

(assert (= (and mapNonEmpty!35260 ((_ is ValueCellFull!10602) mapValue!35260)) b!971846))

(assert (= (and b!971850 ((_ is ValueCellFull!10602) mapDefault!35260)) b!971847))

(assert (= start!83276 b!971850))

(declare-fun b_lambda!14433 () Bool)

(assert (=> (not b_lambda!14433) (not b!971851)))

(declare-fun t!28505 () Bool)

(declare-fun tb!6217 () Bool)

(assert (=> (and start!83276 (= defaultEntry!1428 defaultEntry!1428) t!28505) tb!6217))

(declare-fun result!12411 () Bool)

(assert (=> tb!6217 (= result!12411 tp_is_empty!22167)))

(assert (=> b!971851 t!28505))

(declare-fun b_and!30761 () Bool)

(assert (= b_and!30759 (and (=> t!28505 result!12411) b_and!30761)))

(declare-fun m!899205 () Bool)

(assert (=> b!971851 m!899205))

(declare-fun m!899207 () Bool)

(assert (=> b!971851 m!899207))

(assert (=> b!971851 m!899205))

(assert (=> b!971851 m!899207))

(declare-fun m!899209 () Bool)

(assert (=> b!971851 m!899209))

(declare-fun m!899211 () Bool)

(assert (=> b!971851 m!899211))

(declare-fun m!899213 () Bool)

(assert (=> b!971851 m!899213))

(assert (=> b!971851 m!899213))

(declare-fun m!899215 () Bool)

(assert (=> b!971851 m!899215))

(declare-fun m!899217 () Bool)

(assert (=> b!971853 m!899217))

(declare-fun m!899219 () Bool)

(assert (=> b!971853 m!899219))

(assert (=> b!971853 m!899217))

(assert (=> b!971853 m!899219))

(declare-fun m!899221 () Bool)

(assert (=> b!971853 m!899221))

(declare-fun m!899223 () Bool)

(assert (=> b!971848 m!899223))

(declare-fun m!899225 () Bool)

(assert (=> b!971854 m!899225))

(declare-fun m!899227 () Bool)

(assert (=> b!971854 m!899227))

(declare-fun m!899229 () Bool)

(assert (=> b!971854 m!899229))

(declare-fun m!899231 () Bool)

(assert (=> mapNonEmpty!35260 m!899231))

(assert (=> b!971856 m!899219))

(assert (=> b!971856 m!899219))

(declare-fun m!899233 () Bool)

(assert (=> b!971856 m!899233))

(declare-fun m!899235 () Bool)

(assert (=> b!971849 m!899235))

(declare-fun m!899237 () Bool)

(assert (=> start!83276 m!899237))

(declare-fun m!899239 () Bool)

(assert (=> start!83276 m!899239))

(declare-fun m!899241 () Bool)

(assert (=> start!83276 m!899241))

(check-sat (not start!83276) (not b_lambda!14433) (not b!971849) (not b!971853) (not b!971854) (not mapNonEmpty!35260) (not b!971856) (not b_next!19269) tp_is_empty!22167 (not b!971851) b_and!30761 (not b!971848))
(check-sat b_and!30761 (not b_next!19269))
