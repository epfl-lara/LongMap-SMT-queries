; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83280 () Bool)

(assert start!83280)

(declare-fun b_free!19291 () Bool)

(declare-fun b_next!19291 () Bool)

(assert (=> start!83280 (= b_free!19291 (not b_next!19291))))

(declare-fun tp!67152 () Bool)

(declare-fun b_and!30777 () Bool)

(assert (=> start!83280 (= tp!67152 b_and!30777)))

(declare-fun b!971992 () Bool)

(declare-fun e!547874 () Bool)

(declare-fun tp_is_empty!22189 () Bool)

(assert (=> b!971992 (= e!547874 tp_is_empty!22189)))

(declare-fun res!650660 () Bool)

(declare-fun e!547871 () Bool)

(assert (=> start!83280 (=> (not res!650660) (not e!547871))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83280 (= res!650660 (validMask!0 mask!2147))))

(assert (=> start!83280 e!547871))

(assert (=> start!83280 true))

(declare-datatypes ((V!34569 0))(
  ( (V!34570 (val!11145 Int)) )
))
(declare-datatypes ((ValueCell!10613 0))(
  ( (ValueCellFull!10613 (v!13703 V!34569)) (EmptyCell!10613) )
))
(declare-datatypes ((array!60358 0))(
  ( (array!60359 (arr!29043 (Array (_ BitVec 32) ValueCell!10613)) (size!29524 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60358)

(declare-fun e!547873 () Bool)

(declare-fun array_inv!22531 (array!60358) Bool)

(assert (=> start!83280 (and (array_inv!22531 _values!1425) e!547873)))

(assert (=> start!83280 tp_is_empty!22189))

(assert (=> start!83280 tp!67152))

(declare-datatypes ((array!60360 0))(
  ( (array!60361 (arr!29044 (Array (_ BitVec 32) (_ BitVec 64))) (size!29525 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60360)

(declare-fun array_inv!22532 (array!60360) Bool)

(assert (=> start!83280 (array_inv!22532 _keys!1717)))

(declare-fun b!971993 () Bool)

(declare-fun e!547875 () Bool)

(declare-fun mapRes!35293 () Bool)

(assert (=> b!971993 (= e!547873 (and e!547875 mapRes!35293))))

(declare-fun condMapEmpty!35293 () Bool)

(declare-fun mapDefault!35293 () ValueCell!10613)

(assert (=> b!971993 (= condMapEmpty!35293 (= (arr!29043 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10613)) mapDefault!35293)))))

(declare-fun b!971994 () Bool)

(declare-fun res!650658 () Bool)

(assert (=> b!971994 (=> (not res!650658) (not e!547871))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971994 (= res!650658 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29525 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29525 _keys!1717))))))

(declare-fun b!971995 () Bool)

(declare-fun e!547872 () Bool)

(assert (=> b!971995 (= e!547871 e!547872)))

(declare-fun res!650662 () Bool)

(assert (=> b!971995 (=> (not res!650662) (not e!547872))))

(declare-fun lt!431746 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971995 (= res!650662 (validKeyInArray!0 lt!431746))))

(assert (=> b!971995 (= lt!431746 (select (arr!29044 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14374 0))(
  ( (tuple2!14375 (_1!7198 (_ BitVec 64)) (_2!7198 V!34569)) )
))
(declare-datatypes ((List!20185 0))(
  ( (Nil!20182) (Cons!20181 (h!21343 tuple2!14374) (t!28565 List!20185)) )
))
(declare-datatypes ((ListLongMap!13061 0))(
  ( (ListLongMap!13062 (toList!6546 List!20185)) )
))
(declare-fun lt!431747 () ListLongMap!13061)

(declare-fun zeroValue!1367 () V!34569)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34569)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3708 (array!60360 array!60358 (_ BitVec 32) (_ BitVec 32) V!34569 V!34569 (_ BitVec 32) Int) ListLongMap!13061)

(assert (=> b!971995 (= lt!431747 (getCurrentListMap!3708 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971996 () Bool)

(assert (=> b!971996 (= e!547875 tp_is_empty!22189)))

(declare-fun b!971997 () Bool)

(declare-fun res!650659 () Bool)

(assert (=> b!971997 (=> (not res!650659) (not e!547871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60360 (_ BitVec 32)) Bool)

(assert (=> b!971997 (= res!650659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971998 () Bool)

(declare-fun res!650661 () Bool)

(assert (=> b!971998 (=> (not res!650661) (not e!547871))))

(assert (=> b!971998 (= res!650661 (and (= (size!29524 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29525 _keys!1717) (size!29524 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971999 () Bool)

(declare-fun res!650655 () Bool)

(assert (=> b!971999 (=> (not res!650655) (not e!547871))))

(assert (=> b!971999 (= res!650655 (validKeyInArray!0 (select (arr!29044 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35293 () Bool)

(assert (=> mapIsEmpty!35293 mapRes!35293))

(declare-fun b!972000 () Bool)

(declare-fun res!650656 () Bool)

(assert (=> b!972000 (=> (not res!650656) (not e!547871))))

(declare-fun contains!5587 (ListLongMap!13061 (_ BitVec 64)) Bool)

(assert (=> b!972000 (= res!650656 (contains!5587 (getCurrentListMap!3708 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29044 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35293 () Bool)

(declare-fun tp!67153 () Bool)

(assert (=> mapNonEmpty!35293 (= mapRes!35293 (and tp!67153 e!547874))))

(declare-fun mapRest!35293 () (Array (_ BitVec 32) ValueCell!10613))

(declare-fun mapKey!35293 () (_ BitVec 32))

(declare-fun mapValue!35293 () ValueCell!10613)

(assert (=> mapNonEmpty!35293 (= (arr!29043 _values!1425) (store mapRest!35293 mapKey!35293 mapValue!35293))))

(declare-fun b!972001 () Bool)

(assert (=> b!972001 (= e!547872 (not true))))

(declare-fun +!2900 (ListLongMap!13061 tuple2!14374) ListLongMap!13061)

(declare-fun get!15049 (ValueCell!10613 V!34569) V!34569)

(declare-fun dynLambda!1656 (Int (_ BitVec 64)) V!34569)

(assert (=> b!972001 (= lt!431747 (+!2900 (getCurrentListMap!3708 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14375 lt!431746 (get!15049 (select (arr!29043 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1656 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32252 0))(
  ( (Unit!32253) )
))
(declare-fun lt!431748 () Unit!32252)

(declare-fun lemmaListMapRecursiveValidKeyArray!240 (array!60360 array!60358 (_ BitVec 32) (_ BitVec 32) V!34569 V!34569 (_ BitVec 32) Int) Unit!32252)

(assert (=> b!972001 (= lt!431748 (lemmaListMapRecursiveValidKeyArray!240 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972002 () Bool)

(declare-fun res!650657 () Bool)

(assert (=> b!972002 (=> (not res!650657) (not e!547871))))

(declare-datatypes ((List!20186 0))(
  ( (Nil!20183) (Cons!20182 (h!21344 (_ BitVec 64)) (t!28566 List!20186)) )
))
(declare-fun arrayNoDuplicates!0 (array!60360 (_ BitVec 32) List!20186) Bool)

(assert (=> b!972002 (= res!650657 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20183))))

(assert (= (and start!83280 res!650660) b!971998))

(assert (= (and b!971998 res!650661) b!971997))

(assert (= (and b!971997 res!650659) b!972002))

(assert (= (and b!972002 res!650657) b!971994))

(assert (= (and b!971994 res!650658) b!971999))

(assert (= (and b!971999 res!650655) b!972000))

(assert (= (and b!972000 res!650656) b!971995))

(assert (= (and b!971995 res!650662) b!972001))

(assert (= (and b!971993 condMapEmpty!35293) mapIsEmpty!35293))

(assert (= (and b!971993 (not condMapEmpty!35293)) mapNonEmpty!35293))

(get-info :version)

(assert (= (and mapNonEmpty!35293 ((_ is ValueCellFull!10613) mapValue!35293)) b!971992))

(assert (= (and b!971993 ((_ is ValueCellFull!10613) mapDefault!35293)) b!971996))

(assert (= start!83280 b!971993))

(declare-fun b_lambda!14437 () Bool)

(assert (=> (not b_lambda!14437) (not b!972001)))

(declare-fun t!28564 () Bool)

(declare-fun tb!6231 () Bool)

(assert (=> (and start!83280 (= defaultEntry!1428 defaultEntry!1428) t!28564) tb!6231))

(declare-fun result!12447 () Bool)

(assert (=> tb!6231 (= result!12447 tp_is_empty!22189)))

(assert (=> b!972001 t!28564))

(declare-fun b_and!30779 () Bool)

(assert (= b_and!30777 (and (=> t!28564 result!12447) b_and!30779)))

(declare-fun m!898865 () Bool)

(assert (=> b!972002 m!898865))

(declare-fun m!898867 () Bool)

(assert (=> b!972000 m!898867))

(declare-fun m!898869 () Bool)

(assert (=> b!972000 m!898869))

(assert (=> b!972000 m!898867))

(assert (=> b!972000 m!898869))

(declare-fun m!898871 () Bool)

(assert (=> b!972000 m!898871))

(declare-fun m!898873 () Bool)

(assert (=> b!971995 m!898873))

(declare-fun m!898875 () Bool)

(assert (=> b!971995 m!898875))

(declare-fun m!898877 () Bool)

(assert (=> b!971995 m!898877))

(declare-fun m!898879 () Bool)

(assert (=> b!971997 m!898879))

(declare-fun m!898881 () Bool)

(assert (=> start!83280 m!898881))

(declare-fun m!898883 () Bool)

(assert (=> start!83280 m!898883))

(declare-fun m!898885 () Bool)

(assert (=> start!83280 m!898885))

(declare-fun m!898887 () Bool)

(assert (=> mapNonEmpty!35293 m!898887))

(assert (=> b!971999 m!898869))

(assert (=> b!971999 m!898869))

(declare-fun m!898889 () Bool)

(assert (=> b!971999 m!898889))

(declare-fun m!898891 () Bool)

(assert (=> b!972001 m!898891))

(declare-fun m!898893 () Bool)

(assert (=> b!972001 m!898893))

(declare-fun m!898895 () Bool)

(assert (=> b!972001 m!898895))

(assert (=> b!972001 m!898891))

(declare-fun m!898897 () Bool)

(assert (=> b!972001 m!898897))

(assert (=> b!972001 m!898895))

(assert (=> b!972001 m!898897))

(declare-fun m!898899 () Bool)

(assert (=> b!972001 m!898899))

(declare-fun m!898901 () Bool)

(assert (=> b!972001 m!898901))

(check-sat (not b!972000) (not b_lambda!14437) (not b!971997) (not mapNonEmpty!35293) tp_is_empty!22189 (not b!972002) (not b!971999) (not start!83280) b_and!30779 (not b!971995) (not b_next!19291) (not b!972001))
(check-sat b_and!30779 (not b_next!19291))
