; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84372 () Bool)

(assert start!84372)

(declare-fun b_free!19959 () Bool)

(declare-fun b_next!19959 () Bool)

(assert (=> start!84372 (= b_free!19959 (not b_next!19959))))

(declare-fun tp!69651 () Bool)

(declare-fun b_and!31993 () Bool)

(assert (=> start!84372 (= tp!69651 b_and!31993)))

(declare-fun res!660246 () Bool)

(declare-fun e!556527 () Bool)

(assert (=> start!84372 (=> (not res!660246) (not e!556527))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84372 (= res!660246 (validMask!0 mask!1948))))

(assert (=> start!84372 e!556527))

(assert (=> start!84372 true))

(declare-fun tp_is_empty!23175 () Bool)

(assert (=> start!84372 tp_is_empty!23175))

(declare-datatypes ((V!35883 0))(
  ( (V!35884 (val!11638 Int)) )
))
(declare-datatypes ((ValueCell!11106 0))(
  ( (ValueCellFull!11106 (v!14200 V!35883)) (EmptyCell!11106) )
))
(declare-datatypes ((array!62309 0))(
  ( (array!62310 (arr!30012 (Array (_ BitVec 32) ValueCell!11106)) (size!30491 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62309)

(declare-fun e!556526 () Bool)

(declare-fun array_inv!23191 (array!62309) Bool)

(assert (=> start!84372 (and (array_inv!23191 _values!1278) e!556526)))

(assert (=> start!84372 tp!69651))

(declare-datatypes ((array!62311 0))(
  ( (array!62312 (arr!30013 (Array (_ BitVec 32) (_ BitVec 64))) (size!30492 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62311)

(declare-fun array_inv!23192 (array!62311) Bool)

(assert (=> start!84372 (array_inv!23192 _keys!1544)))

(declare-fun b!986895 () Bool)

(declare-fun res!660242 () Bool)

(assert (=> b!986895 (=> (not res!660242) (not e!556527))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986895 (= res!660242 (and (= (size!30491 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30492 _keys!1544) (size!30491 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986896 () Bool)

(declare-fun res!660245 () Bool)

(assert (=> b!986896 (=> (not res!660245) (not e!556527))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986896 (= res!660245 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30492 _keys!1544))))))

(declare-fun b!986897 () Bool)

(declare-fun res!660243 () Bool)

(assert (=> b!986897 (=> (not res!660243) (not e!556527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62311 (_ BitVec 32)) Bool)

(assert (=> b!986897 (= res!660243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36791 () Bool)

(declare-fun mapRes!36791 () Bool)

(assert (=> mapIsEmpty!36791 mapRes!36791))

(declare-fun b!986898 () Bool)

(assert (=> b!986898 (= e!556527 false)))

(declare-fun minValue!1220 () V!35883)

(declare-datatypes ((tuple2!14824 0))(
  ( (tuple2!14825 (_1!7423 (_ BitVec 64)) (_2!7423 V!35883)) )
))
(declare-datatypes ((List!20755 0))(
  ( (Nil!20752) (Cons!20751 (h!21913 tuple2!14824) (t!29654 List!20755)) )
))
(declare-datatypes ((ListLongMap!13521 0))(
  ( (ListLongMap!13522 (toList!6776 List!20755)) )
))
(declare-fun lt!437558 () ListLongMap!13521)

(declare-fun zeroValue!1220 () V!35883)

(declare-fun defaultEntry!1281 () Int)

(declare-fun +!3061 (ListLongMap!13521 tuple2!14824) ListLongMap!13521)

(declare-fun getCurrentListMapNoExtraKeys!3467 (array!62311 array!62309 (_ BitVec 32) (_ BitVec 32) V!35883 V!35883 (_ BitVec 32) Int) ListLongMap!13521)

(assert (=> b!986898 (= lt!437558 (+!3061 (getCurrentListMapNoExtraKeys!3467 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986899 () Bool)

(declare-fun e!556524 () Bool)

(assert (=> b!986899 (= e!556524 tp_is_empty!23175)))

(declare-fun b!986900 () Bool)

(assert (=> b!986900 (= e!556526 (and e!556524 mapRes!36791))))

(declare-fun condMapEmpty!36791 () Bool)

(declare-fun mapDefault!36791 () ValueCell!11106)

(assert (=> b!986900 (= condMapEmpty!36791 (= (arr!30012 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11106)) mapDefault!36791)))))

(declare-fun mapNonEmpty!36791 () Bool)

(declare-fun tp!69652 () Bool)

(declare-fun e!556523 () Bool)

(assert (=> mapNonEmpty!36791 (= mapRes!36791 (and tp!69652 e!556523))))

(declare-fun mapValue!36791 () ValueCell!11106)

(declare-fun mapKey!36791 () (_ BitVec 32))

(declare-fun mapRest!36791 () (Array (_ BitVec 32) ValueCell!11106))

(assert (=> mapNonEmpty!36791 (= (arr!30012 _values!1278) (store mapRest!36791 mapKey!36791 mapValue!36791))))

(declare-fun b!986901 () Bool)

(declare-fun res!660248 () Bool)

(assert (=> b!986901 (=> (not res!660248) (not e!556527))))

(declare-datatypes ((List!20756 0))(
  ( (Nil!20753) (Cons!20752 (h!21914 (_ BitVec 64)) (t!29655 List!20756)) )
))
(declare-fun arrayNoDuplicates!0 (array!62311 (_ BitVec 32) List!20756) Bool)

(assert (=> b!986901 (= res!660248 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20753))))

(declare-fun b!986902 () Bool)

(assert (=> b!986902 (= e!556523 tp_is_empty!23175)))

(declare-fun b!986903 () Bool)

(declare-fun res!660247 () Bool)

(assert (=> b!986903 (=> (not res!660247) (not e!556527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986903 (= res!660247 (validKeyInArray!0 (select (arr!30013 _keys!1544) from!1932)))))

(declare-fun b!986904 () Bool)

(declare-fun res!660244 () Bool)

(assert (=> b!986904 (=> (not res!660244) (not e!556527))))

(assert (=> b!986904 (= res!660244 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84372 res!660246) b!986895))

(assert (= (and b!986895 res!660242) b!986897))

(assert (= (and b!986897 res!660243) b!986901))

(assert (= (and b!986901 res!660248) b!986896))

(assert (= (and b!986896 res!660245) b!986903))

(assert (= (and b!986903 res!660247) b!986904))

(assert (= (and b!986904 res!660244) b!986898))

(assert (= (and b!986900 condMapEmpty!36791) mapIsEmpty!36791))

(assert (= (and b!986900 (not condMapEmpty!36791)) mapNonEmpty!36791))

(get-info :version)

(assert (= (and mapNonEmpty!36791 ((_ is ValueCellFull!11106) mapValue!36791)) b!986902))

(assert (= (and b!986900 ((_ is ValueCellFull!11106) mapDefault!36791)) b!986899))

(assert (= start!84372 b!986900))

(declare-fun m!913563 () Bool)

(assert (=> start!84372 m!913563))

(declare-fun m!913565 () Bool)

(assert (=> start!84372 m!913565))

(declare-fun m!913567 () Bool)

(assert (=> start!84372 m!913567))

(declare-fun m!913569 () Bool)

(assert (=> mapNonEmpty!36791 m!913569))

(declare-fun m!913571 () Bool)

(assert (=> b!986901 m!913571))

(declare-fun m!913573 () Bool)

(assert (=> b!986903 m!913573))

(assert (=> b!986903 m!913573))

(declare-fun m!913575 () Bool)

(assert (=> b!986903 m!913575))

(declare-fun m!913577 () Bool)

(assert (=> b!986898 m!913577))

(assert (=> b!986898 m!913577))

(declare-fun m!913579 () Bool)

(assert (=> b!986898 m!913579))

(declare-fun m!913581 () Bool)

(assert (=> b!986897 m!913581))

(check-sat tp_is_empty!23175 (not b!986898) (not b!986903) (not start!84372) (not b!986901) b_and!31993 (not mapNonEmpty!36791) (not b!986897) (not b_next!19959))
(check-sat b_and!31993 (not b_next!19959))
