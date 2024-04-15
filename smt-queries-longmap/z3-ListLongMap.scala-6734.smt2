; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84358 () Bool)

(assert start!84358)

(declare-fun b_free!19963 () Bool)

(declare-fun b_next!19963 () Bool)

(assert (=> start!84358 (= b_free!19963 (not b_next!19963))))

(declare-fun tp!69665 () Bool)

(declare-fun b_and!31971 () Bool)

(assert (=> start!84358 (= tp!69665 b_and!31971)))

(declare-fun mapNonEmpty!36797 () Bool)

(declare-fun mapRes!36797 () Bool)

(declare-fun tp!69664 () Bool)

(declare-fun e!556406 () Bool)

(assert (=> mapNonEmpty!36797 (= mapRes!36797 (and tp!69664 e!556406))))

(declare-datatypes ((V!35889 0))(
  ( (V!35890 (val!11640 Int)) )
))
(declare-datatypes ((ValueCell!11108 0))(
  ( (ValueCellFull!11108 (v!14201 V!35889)) (EmptyCell!11108) )
))
(declare-datatypes ((array!62246 0))(
  ( (array!62247 (arr!29981 (Array (_ BitVec 32) ValueCell!11108)) (size!30462 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62246)

(declare-fun mapKey!36797 () (_ BitVec 32))

(declare-fun mapValue!36797 () ValueCell!11108)

(declare-fun mapRest!36797 () (Array (_ BitVec 32) ValueCell!11108))

(assert (=> mapNonEmpty!36797 (= (arr!29981 _values!1278) (store mapRest!36797 mapKey!36797 mapValue!36797))))

(declare-fun b!986716 () Bool)

(declare-fun res!660176 () Bool)

(declare-fun e!556407 () Bool)

(assert (=> b!986716 (=> (not res!660176) (not e!556407))))

(declare-datatypes ((array!62248 0))(
  ( (array!62249 (arr!29982 (Array (_ BitVec 32) (_ BitVec 64))) (size!30463 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62248)

(declare-datatypes ((List!20792 0))(
  ( (Nil!20789) (Cons!20788 (h!21950 (_ BitVec 64)) (t!29682 List!20792)) )
))
(declare-fun arrayNoDuplicates!0 (array!62248 (_ BitVec 32) List!20792) Bool)

(assert (=> b!986716 (= res!660176 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20789))))

(declare-fun b!986717 () Bool)

(declare-fun res!660174 () Bool)

(assert (=> b!986717 (=> (not res!660174) (not e!556407))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62248 (_ BitVec 32)) Bool)

(assert (=> b!986717 (= res!660174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986718 () Bool)

(declare-fun e!556409 () Bool)

(declare-fun e!556408 () Bool)

(assert (=> b!986718 (= e!556409 (and e!556408 mapRes!36797))))

(declare-fun condMapEmpty!36797 () Bool)

(declare-fun mapDefault!36797 () ValueCell!11108)

(assert (=> b!986718 (= condMapEmpty!36797 (= (arr!29981 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11108)) mapDefault!36797)))))

(declare-fun b!986719 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986719 (= e!556407 (bvsge from!1932 (size!30462 _values!1278)))))

(declare-fun minValue!1220 () V!35889)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35889)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14906 0))(
  ( (tuple2!14907 (_1!7464 (_ BitVec 64)) (_2!7464 V!35889)) )
))
(declare-datatypes ((List!20793 0))(
  ( (Nil!20790) (Cons!20789 (h!21951 tuple2!14906) (t!29683 List!20793)) )
))
(declare-datatypes ((ListLongMap!13593 0))(
  ( (ListLongMap!13594 (toList!6812 List!20793)) )
))
(declare-fun lt!437328 () ListLongMap!13593)

(declare-fun +!3088 (ListLongMap!13593 tuple2!14906) ListLongMap!13593)

(declare-fun getCurrentListMapNoExtraKeys!3516 (array!62248 array!62246 (_ BitVec 32) (_ BitVec 32) V!35889 V!35889 (_ BitVec 32) Int) ListLongMap!13593)

(assert (=> b!986719 (= lt!437328 (+!3088 (getCurrentListMapNoExtraKeys!3516 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14907 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986720 () Bool)

(declare-fun res!660175 () Bool)

(assert (=> b!986720 (=> (not res!660175) (not e!556407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986720 (= res!660175 (validKeyInArray!0 (select (arr!29982 _keys!1544) from!1932)))))

(declare-fun b!986721 () Bool)

(declare-fun tp_is_empty!23179 () Bool)

(assert (=> b!986721 (= e!556406 tp_is_empty!23179)))

(declare-fun res!660179 () Bool)

(assert (=> start!84358 (=> (not res!660179) (not e!556407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84358 (= res!660179 (validMask!0 mask!1948))))

(assert (=> start!84358 e!556407))

(assert (=> start!84358 true))

(assert (=> start!84358 tp_is_empty!23179))

(declare-fun array_inv!23177 (array!62246) Bool)

(assert (=> start!84358 (and (array_inv!23177 _values!1278) e!556409)))

(assert (=> start!84358 tp!69665))

(declare-fun array_inv!23178 (array!62248) Bool)

(assert (=> start!84358 (array_inv!23178 _keys!1544)))

(declare-fun mapIsEmpty!36797 () Bool)

(assert (=> mapIsEmpty!36797 mapRes!36797))

(declare-fun b!986722 () Bool)

(declare-fun res!660177 () Bool)

(assert (=> b!986722 (=> (not res!660177) (not e!556407))))

(assert (=> b!986722 (= res!660177 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986723 () Bool)

(assert (=> b!986723 (= e!556408 tp_is_empty!23179)))

(declare-fun b!986724 () Bool)

(declare-fun res!660178 () Bool)

(assert (=> b!986724 (=> (not res!660178) (not e!556407))))

(assert (=> b!986724 (= res!660178 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30463 _keys!1544))))))

(declare-fun b!986725 () Bool)

(declare-fun res!660180 () Bool)

(assert (=> b!986725 (=> (not res!660180) (not e!556407))))

(assert (=> b!986725 (= res!660180 (and (= (size!30462 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30463 _keys!1544) (size!30462 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84358 res!660179) b!986725))

(assert (= (and b!986725 res!660180) b!986717))

(assert (= (and b!986717 res!660174) b!986716))

(assert (= (and b!986716 res!660176) b!986724))

(assert (= (and b!986724 res!660178) b!986720))

(assert (= (and b!986720 res!660175) b!986722))

(assert (= (and b!986722 res!660177) b!986719))

(assert (= (and b!986718 condMapEmpty!36797) mapIsEmpty!36797))

(assert (= (and b!986718 (not condMapEmpty!36797)) mapNonEmpty!36797))

(get-info :version)

(assert (= (and mapNonEmpty!36797 ((_ is ValueCellFull!11108) mapValue!36797)) b!986721))

(assert (= (and b!986718 ((_ is ValueCellFull!11108) mapDefault!36797)) b!986723))

(assert (= start!84358 b!986718))

(declare-fun m!912845 () Bool)

(assert (=> b!986717 m!912845))

(declare-fun m!912847 () Bool)

(assert (=> start!84358 m!912847))

(declare-fun m!912849 () Bool)

(assert (=> start!84358 m!912849))

(declare-fun m!912851 () Bool)

(assert (=> start!84358 m!912851))

(declare-fun m!912853 () Bool)

(assert (=> b!986719 m!912853))

(assert (=> b!986719 m!912853))

(declare-fun m!912855 () Bool)

(assert (=> b!986719 m!912855))

(declare-fun m!912857 () Bool)

(assert (=> b!986720 m!912857))

(assert (=> b!986720 m!912857))

(declare-fun m!912859 () Bool)

(assert (=> b!986720 m!912859))

(declare-fun m!912861 () Bool)

(assert (=> mapNonEmpty!36797 m!912861))

(declare-fun m!912863 () Bool)

(assert (=> b!986716 m!912863))

(check-sat (not b!986719) (not b_next!19963) b_and!31971 (not mapNonEmpty!36797) (not b!986717) (not start!84358) (not b!986720) tp_is_empty!23179 (not b!986716))
(check-sat b_and!31971 (not b_next!19963))
