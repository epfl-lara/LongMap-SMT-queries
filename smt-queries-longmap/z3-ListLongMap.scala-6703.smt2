; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84192 () Bool)

(assert start!84192)

(declare-fun b_free!19893 () Bool)

(declare-fun b_next!19893 () Bool)

(assert (=> start!84192 (= b_free!19893 (not b_next!19893))))

(declare-fun tp!69283 () Bool)

(declare-fun b_and!31863 () Bool)

(assert (=> start!84192 (= tp!69283 b_and!31863)))

(declare-fun b!984667 () Bool)

(declare-fun res!658891 () Bool)

(declare-fun e!555081 () Bool)

(assert (=> b!984667 (=> (not res!658891) (not e!555081))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35643 0))(
  ( (V!35644 (val!11548 Int)) )
))
(declare-datatypes ((ValueCell!11016 0))(
  ( (ValueCellFull!11016 (v!14110 V!35643)) (EmptyCell!11016) )
))
(declare-datatypes ((array!61969 0))(
  ( (array!61970 (arr!29842 (Array (_ BitVec 32) ValueCell!11016)) (size!30321 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61969)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61971 0))(
  ( (array!61972 (arr!29843 (Array (_ BitVec 32) (_ BitVec 64))) (size!30322 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61971)

(assert (=> b!984667 (= res!658891 (and (= (size!30321 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30322 _keys!1544) (size!30321 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984668 () Bool)

(declare-fun res!658888 () Bool)

(assert (=> b!984668 (=> (not res!658888) (not e!555081))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984668 (= res!658888 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30322 _keys!1544))))))

(declare-fun b!984669 () Bool)

(declare-fun e!555080 () Bool)

(declare-fun e!555082 () Bool)

(declare-fun mapRes!36521 () Bool)

(assert (=> b!984669 (= e!555080 (and e!555082 mapRes!36521))))

(declare-fun condMapEmpty!36521 () Bool)

(declare-fun mapDefault!36521 () ValueCell!11016)

(assert (=> b!984669 (= condMapEmpty!36521 (= (arr!29842 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11016)) mapDefault!36521)))))

(declare-fun b!984670 () Bool)

(declare-fun res!658892 () Bool)

(assert (=> b!984670 (=> (not res!658892) (not e!555081))))

(assert (=> b!984670 (= res!658892 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36521 () Bool)

(assert (=> mapIsEmpty!36521 mapRes!36521))

(declare-fun b!984671 () Bool)

(declare-fun res!658890 () Bool)

(assert (=> b!984671 (=> (not res!658890) (not e!555081))))

(declare-datatypes ((List!20662 0))(
  ( (Nil!20659) (Cons!20658 (h!21820 (_ BitVec 64)) (t!29499 List!20662)) )
))
(declare-fun arrayNoDuplicates!0 (array!61971 (_ BitVec 32) List!20662) Bool)

(assert (=> b!984671 (= res!658890 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20659))))

(declare-fun res!658889 () Bool)

(assert (=> start!84192 (=> (not res!658889) (not e!555081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84192 (= res!658889 (validMask!0 mask!1948))))

(assert (=> start!84192 e!555081))

(assert (=> start!84192 true))

(declare-fun tp_is_empty!22995 () Bool)

(assert (=> start!84192 tp_is_empty!22995))

(declare-fun array_inv!23069 (array!61969) Bool)

(assert (=> start!84192 (and (array_inv!23069 _values!1278) e!555080)))

(assert (=> start!84192 tp!69283))

(declare-fun array_inv!23070 (array!61971) Bool)

(assert (=> start!84192 (array_inv!23070 _keys!1544)))

(declare-fun b!984672 () Bool)

(declare-fun e!555079 () Bool)

(assert (=> b!984672 (= e!555081 e!555079)))

(declare-fun res!658893 () Bool)

(assert (=> b!984672 (=> (not res!658893) (not e!555079))))

(assert (=> b!984672 (= res!658893 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29843 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436915 () V!35643)

(declare-fun get!15481 (ValueCell!11016 V!35643) V!35643)

(declare-fun dynLambda!1822 (Int (_ BitVec 64)) V!35643)

(assert (=> b!984672 (= lt!436915 (get!15481 (select (arr!29842 _values!1278) from!1932) (dynLambda!1822 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35643)

(declare-fun zeroValue!1220 () V!35643)

(declare-datatypes ((tuple2!14770 0))(
  ( (tuple2!14771 (_1!7396 (_ BitVec 64)) (_2!7396 V!35643)) )
))
(declare-datatypes ((List!20663 0))(
  ( (Nil!20660) (Cons!20659 (h!21821 tuple2!14770) (t!29500 List!20663)) )
))
(declare-datatypes ((ListLongMap!13467 0))(
  ( (ListLongMap!13468 (toList!6749 List!20663)) )
))
(declare-fun lt!436913 () ListLongMap!13467)

(declare-fun getCurrentListMapNoExtraKeys!3442 (array!61971 array!61969 (_ BitVec 32) (_ BitVec 32) V!35643 V!35643 (_ BitVec 32) Int) ListLongMap!13467)

(assert (=> b!984672 (= lt!436913 (getCurrentListMapNoExtraKeys!3442 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984673 () Bool)

(declare-fun res!658894 () Bool)

(assert (=> b!984673 (=> (not res!658894) (not e!555081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61971 (_ BitVec 32)) Bool)

(assert (=> b!984673 (= res!658894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984674 () Bool)

(assert (=> b!984674 (= e!555079 (not true))))

(declare-fun lt!436912 () tuple2!14770)

(declare-fun lt!436914 () tuple2!14770)

(declare-fun +!3040 (ListLongMap!13467 tuple2!14770) ListLongMap!13467)

(assert (=> b!984674 (= (+!3040 (+!3040 lt!436913 lt!436912) lt!436914) (+!3040 (+!3040 lt!436913 lt!436914) lt!436912))))

(assert (=> b!984674 (= lt!436914 (tuple2!14771 (select (arr!29843 _keys!1544) from!1932) lt!436915))))

(assert (=> b!984674 (= lt!436912 (tuple2!14771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32719 0))(
  ( (Unit!32720) )
))
(declare-fun lt!436916 () Unit!32719)

(declare-fun addCommutativeForDiffKeys!668 (ListLongMap!13467 (_ BitVec 64) V!35643 (_ BitVec 64) V!35643) Unit!32719)

(assert (=> b!984674 (= lt!436916 (addCommutativeForDiffKeys!668 lt!436913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29843 _keys!1544) from!1932) lt!436915))))

(declare-fun b!984675 () Bool)

(declare-fun res!658895 () Bool)

(assert (=> b!984675 (=> (not res!658895) (not e!555081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984675 (= res!658895 (validKeyInArray!0 (select (arr!29843 _keys!1544) from!1932)))))

(declare-fun b!984676 () Bool)

(assert (=> b!984676 (= e!555082 tp_is_empty!22995)))

(declare-fun b!984677 () Bool)

(declare-fun e!555084 () Bool)

(assert (=> b!984677 (= e!555084 tp_is_empty!22995)))

(declare-fun mapNonEmpty!36521 () Bool)

(declare-fun tp!69282 () Bool)

(assert (=> mapNonEmpty!36521 (= mapRes!36521 (and tp!69282 e!555084))))

(declare-fun mapRest!36521 () (Array (_ BitVec 32) ValueCell!11016))

(declare-fun mapKey!36521 () (_ BitVec 32))

(declare-fun mapValue!36521 () ValueCell!11016)

(assert (=> mapNonEmpty!36521 (= (arr!29842 _values!1278) (store mapRest!36521 mapKey!36521 mapValue!36521))))

(assert (= (and start!84192 res!658889) b!984667))

(assert (= (and b!984667 res!658891) b!984673))

(assert (= (and b!984673 res!658894) b!984671))

(assert (= (and b!984671 res!658890) b!984668))

(assert (= (and b!984668 res!658888) b!984675))

(assert (= (and b!984675 res!658895) b!984670))

(assert (= (and b!984670 res!658892) b!984672))

(assert (= (and b!984672 res!658893) b!984674))

(assert (= (and b!984669 condMapEmpty!36521) mapIsEmpty!36521))

(assert (= (and b!984669 (not condMapEmpty!36521)) mapNonEmpty!36521))

(get-info :version)

(assert (= (and mapNonEmpty!36521 ((_ is ValueCellFull!11016) mapValue!36521)) b!984677))

(assert (= (and b!984669 ((_ is ValueCellFull!11016) mapDefault!36521)) b!984676))

(assert (= start!84192 b!984669))

(declare-fun b_lambda!14925 () Bool)

(assert (=> (not b_lambda!14925) (not b!984672)))

(declare-fun t!29498 () Bool)

(declare-fun tb!6687 () Bool)

(assert (=> (and start!84192 (= defaultEntry!1281 defaultEntry!1281) t!29498) tb!6687))

(declare-fun result!13363 () Bool)

(assert (=> tb!6687 (= result!13363 tp_is_empty!22995)))

(assert (=> b!984672 t!29498))

(declare-fun b_and!31865 () Bool)

(assert (= b_and!31863 (and (=> t!29498 result!13363) b_and!31865)))

(declare-fun m!911747 () Bool)

(assert (=> b!984675 m!911747))

(assert (=> b!984675 m!911747))

(declare-fun m!911749 () Bool)

(assert (=> b!984675 m!911749))

(declare-fun m!911751 () Bool)

(assert (=> b!984671 m!911751))

(assert (=> b!984672 m!911747))

(declare-fun m!911753 () Bool)

(assert (=> b!984672 m!911753))

(declare-fun m!911755 () Bool)

(assert (=> b!984672 m!911755))

(declare-fun m!911757 () Bool)

(assert (=> b!984672 m!911757))

(assert (=> b!984672 m!911753))

(assert (=> b!984672 m!911757))

(declare-fun m!911759 () Bool)

(assert (=> b!984672 m!911759))

(declare-fun m!911761 () Bool)

(assert (=> start!84192 m!911761))

(declare-fun m!911763 () Bool)

(assert (=> start!84192 m!911763))

(declare-fun m!911765 () Bool)

(assert (=> start!84192 m!911765))

(declare-fun m!911767 () Bool)

(assert (=> b!984673 m!911767))

(declare-fun m!911769 () Bool)

(assert (=> b!984674 m!911769))

(assert (=> b!984674 m!911747))

(declare-fun m!911771 () Bool)

(assert (=> b!984674 m!911771))

(assert (=> b!984674 m!911747))

(declare-fun m!911773 () Bool)

(assert (=> b!984674 m!911773))

(assert (=> b!984674 m!911769))

(declare-fun m!911775 () Bool)

(assert (=> b!984674 m!911775))

(assert (=> b!984674 m!911771))

(declare-fun m!911777 () Bool)

(assert (=> b!984674 m!911777))

(declare-fun m!911779 () Bool)

(assert (=> mapNonEmpty!36521 m!911779))

(check-sat (not b_next!19893) (not b!984672) (not mapNonEmpty!36521) b_and!31865 (not start!84192) (not b!984675) tp_is_empty!22995 (not b!984673) (not b_lambda!14925) (not b!984671) (not b!984674))
(check-sat b_and!31865 (not b_next!19893))
