; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71666 () Bool)

(assert start!71666)

(declare-fun b_free!13519 () Bool)

(declare-fun b_next!13519 () Bool)

(assert (=> start!71666 (= b_free!13519 (not b_next!13519))))

(declare-fun tp!47353 () Bool)

(declare-fun b_and!22579 () Bool)

(assert (=> start!71666 (= tp!47353 b_and!22579)))

(declare-fun b!833429 () Bool)

(declare-fun res!566771 () Bool)

(declare-fun e!464925 () Bool)

(assert (=> b!833429 (=> (not res!566771) (not e!464925))))

(declare-datatypes ((array!46603 0))(
  ( (array!46604 (arr!22336 (Array (_ BitVec 32) (_ BitVec 64))) (size!22757 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46603)

(declare-datatypes ((List!15963 0))(
  ( (Nil!15960) (Cons!15959 (h!17090 (_ BitVec 64)) (t!22325 List!15963)) )
))
(declare-fun arrayNoDuplicates!0 (array!46603 (_ BitVec 32) List!15963) Bool)

(assert (=> b!833429 (= res!566771 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15960))))

(declare-fun b!833430 () Bool)

(declare-fun e!464931 () Bool)

(declare-fun e!464927 () Bool)

(declare-fun mapRes!24506 () Bool)

(assert (=> b!833430 (= e!464931 (and e!464927 mapRes!24506))))

(declare-fun condMapEmpty!24506 () Bool)

(declare-datatypes ((V!25307 0))(
  ( (V!25308 (val!7662 Int)) )
))
(declare-datatypes ((ValueCell!7199 0))(
  ( (ValueCellFull!7199 (v!10104 V!25307)) (EmptyCell!7199) )
))
(declare-datatypes ((array!46605 0))(
  ( (array!46606 (arr!22337 (Array (_ BitVec 32) ValueCell!7199)) (size!22758 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46605)

(declare-fun mapDefault!24506 () ValueCell!7199)

(assert (=> b!833430 (= condMapEmpty!24506 (= (arr!22337 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7199)) mapDefault!24506)))))

(declare-fun res!566774 () Bool)

(assert (=> start!71666 (=> (not res!566774) (not e!464925))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71666 (= res!566774 (validMask!0 mask!1312))))

(assert (=> start!71666 e!464925))

(declare-fun tp_is_empty!15229 () Bool)

(assert (=> start!71666 tp_is_empty!15229))

(declare-fun array_inv!17851 (array!46603) Bool)

(assert (=> start!71666 (array_inv!17851 _keys!976)))

(assert (=> start!71666 true))

(declare-fun array_inv!17852 (array!46605) Bool)

(assert (=> start!71666 (and (array_inv!17852 _values!788) e!464931)))

(assert (=> start!71666 tp!47353))

(declare-datatypes ((tuple2!10182 0))(
  ( (tuple2!10183 (_1!5102 (_ BitVec 64)) (_2!5102 V!25307)) )
))
(declare-datatypes ((List!15964 0))(
  ( (Nil!15961) (Cons!15960 (h!17091 tuple2!10182) (t!22326 List!15964)) )
))
(declare-datatypes ((ListLongMap!8995 0))(
  ( (ListLongMap!8996 (toList!4513 List!15964)) )
))
(declare-fun lt!378191 () ListLongMap!8995)

(declare-fun zeroValueAfter!34 () V!25307)

(declare-fun lt!378181 () ListLongMap!8995)

(declare-fun e!464929 () Bool)

(declare-fun b!833431 () Bool)

(declare-fun lt!378189 () tuple2!10182)

(declare-fun +!2021 (ListLongMap!8995 tuple2!10182) ListLongMap!8995)

(assert (=> b!833431 (= e!464929 (= lt!378181 (+!2021 (+!2021 lt!378191 (tuple2!10183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378189)))))

(declare-fun b!833432 () Bool)

(declare-fun e!464926 () Bool)

(declare-fun lt!378192 () ListLongMap!8995)

(declare-fun lt!378190 () tuple2!10182)

(assert (=> b!833432 (= e!464926 (= lt!378181 (+!2021 (+!2021 lt!378192 lt!378190) lt!378189)))))

(declare-fun lt!378183 () ListLongMap!8995)

(declare-fun lt!378184 () ListLongMap!8995)

(assert (=> b!833432 (and (= lt!378183 lt!378184) (= lt!378181 lt!378184) (= lt!378181 lt!378183))))

(declare-fun lt!378187 () ListLongMap!8995)

(assert (=> b!833432 (= lt!378184 (+!2021 lt!378187 lt!378190))))

(declare-fun lt!378193 () ListLongMap!8995)

(assert (=> b!833432 (= lt!378183 (+!2021 lt!378193 lt!378190))))

(declare-datatypes ((Unit!28519 0))(
  ( (Unit!28520) )
))
(declare-fun lt!378186 () Unit!28519)

(declare-fun zeroValueBefore!34 () V!25307)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!253 (ListLongMap!8995 (_ BitVec 64) V!25307 V!25307) Unit!28519)

(assert (=> b!833432 (= lt!378186 (addSameAsAddTwiceSameKeyDiffValues!253 lt!378193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!464930 () Bool)

(assert (=> b!833432 e!464930))

(declare-fun res!566770 () Bool)

(assert (=> b!833432 (=> (not res!566770) (not e!464930))))

(declare-fun lt!378185 () ListLongMap!8995)

(assert (=> b!833432 (= res!566770 (= lt!378185 lt!378187))))

(declare-fun lt!378182 () tuple2!10182)

(assert (=> b!833432 (= lt!378187 (+!2021 lt!378193 lt!378182))))

(assert (=> b!833432 (= lt!378193 (+!2021 lt!378192 lt!378189))))

(assert (=> b!833432 (= lt!378190 (tuple2!10183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!833432 e!464929))

(declare-fun res!566776 () Bool)

(assert (=> b!833432 (=> (not res!566776) (not e!464929))))

(assert (=> b!833432 (= res!566776 (= lt!378185 (+!2021 (+!2021 lt!378192 lt!378182) lt!378189)))))

(declare-fun minValue!754 () V!25307)

(assert (=> b!833432 (= lt!378189 (tuple2!10183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833432 (= lt!378182 (tuple2!10183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2560 (array!46603 array!46605 (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 (_ BitVec 32) Int) ListLongMap!8995)

(assert (=> b!833432 (= lt!378181 (getCurrentListMap!2560 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833432 (= lt!378185 (getCurrentListMap!2560 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833433 () Bool)

(declare-fun e!464924 () Bool)

(assert (=> b!833433 (= e!464924 tp_is_empty!15229)))

(declare-fun b!833434 () Bool)

(declare-fun res!566775 () Bool)

(assert (=> b!833434 (=> (not res!566775) (not e!464925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46603 (_ BitVec 32)) Bool)

(assert (=> b!833434 (= res!566775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833435 () Bool)

(declare-fun res!566772 () Bool)

(assert (=> b!833435 (=> (not res!566772) (not e!464925))))

(assert (=> b!833435 (= res!566772 (and (= (size!22758 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22757 _keys!976) (size!22758 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24506 () Bool)

(declare-fun tp!47354 () Bool)

(assert (=> mapNonEmpty!24506 (= mapRes!24506 (and tp!47354 e!464924))))

(declare-fun mapRest!24506 () (Array (_ BitVec 32) ValueCell!7199))

(declare-fun mapValue!24506 () ValueCell!7199)

(declare-fun mapKey!24506 () (_ BitVec 32))

(assert (=> mapNonEmpty!24506 (= (arr!22337 _values!788) (store mapRest!24506 mapKey!24506 mapValue!24506))))

(declare-fun mapIsEmpty!24506 () Bool)

(assert (=> mapIsEmpty!24506 mapRes!24506))

(declare-fun b!833436 () Bool)

(assert (=> b!833436 (= e!464927 tp_is_empty!15229)))

(declare-fun b!833437 () Bool)

(assert (=> b!833437 (= e!464930 (= lt!378181 (+!2021 (+!2021 lt!378191 lt!378189) lt!378190)))))

(declare-fun b!833438 () Bool)

(assert (=> b!833438 (= e!464925 (not e!464926))))

(declare-fun res!566773 () Bool)

(assert (=> b!833438 (=> res!566773 e!464926)))

(assert (=> b!833438 (= res!566773 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!833438 (= lt!378192 lt!378191)))

(declare-fun lt!378188 () Unit!28519)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!608 (array!46603 array!46605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 V!25307 V!25307 (_ BitVec 32) Int) Unit!28519)

(assert (=> b!833438 (= lt!378188 (lemmaNoChangeToArrayThenSameMapNoExtras!608 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2538 (array!46603 array!46605 (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 (_ BitVec 32) Int) ListLongMap!8995)

(assert (=> b!833438 (= lt!378191 (getCurrentListMapNoExtraKeys!2538 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833438 (= lt!378192 (getCurrentListMapNoExtraKeys!2538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71666 res!566774) b!833435))

(assert (= (and b!833435 res!566772) b!833434))

(assert (= (and b!833434 res!566775) b!833429))

(assert (= (and b!833429 res!566771) b!833438))

(assert (= (and b!833438 (not res!566773)) b!833432))

(assert (= (and b!833432 res!566776) b!833431))

(assert (= (and b!833432 res!566770) b!833437))

(assert (= (and b!833430 condMapEmpty!24506) mapIsEmpty!24506))

(assert (= (and b!833430 (not condMapEmpty!24506)) mapNonEmpty!24506))

(get-info :version)

(assert (= (and mapNonEmpty!24506 ((_ is ValueCellFull!7199) mapValue!24506)) b!833433))

(assert (= (and b!833430 ((_ is ValueCellFull!7199) mapDefault!24506)) b!833436))

(assert (= start!71666 b!833430))

(declare-fun m!777791 () Bool)

(assert (=> b!833431 m!777791))

(assert (=> b!833431 m!777791))

(declare-fun m!777793 () Bool)

(assert (=> b!833431 m!777793))

(declare-fun m!777795 () Bool)

(assert (=> b!833438 m!777795))

(declare-fun m!777797 () Bool)

(assert (=> b!833438 m!777797))

(declare-fun m!777799 () Bool)

(assert (=> b!833438 m!777799))

(declare-fun m!777801 () Bool)

(assert (=> mapNonEmpty!24506 m!777801))

(declare-fun m!777803 () Bool)

(assert (=> b!833432 m!777803))

(declare-fun m!777805 () Bool)

(assert (=> b!833432 m!777805))

(declare-fun m!777807 () Bool)

(assert (=> b!833432 m!777807))

(declare-fun m!777809 () Bool)

(assert (=> b!833432 m!777809))

(assert (=> b!833432 m!777807))

(declare-fun m!777811 () Bool)

(assert (=> b!833432 m!777811))

(declare-fun m!777813 () Bool)

(assert (=> b!833432 m!777813))

(declare-fun m!777815 () Bool)

(assert (=> b!833432 m!777815))

(declare-fun m!777817 () Bool)

(assert (=> b!833432 m!777817))

(declare-fun m!777819 () Bool)

(assert (=> b!833432 m!777819))

(declare-fun m!777821 () Bool)

(assert (=> b!833432 m!777821))

(assert (=> b!833432 m!777821))

(declare-fun m!777823 () Bool)

(assert (=> b!833432 m!777823))

(declare-fun m!777825 () Bool)

(assert (=> b!833429 m!777825))

(declare-fun m!777827 () Bool)

(assert (=> b!833437 m!777827))

(assert (=> b!833437 m!777827))

(declare-fun m!777829 () Bool)

(assert (=> b!833437 m!777829))

(declare-fun m!777831 () Bool)

(assert (=> b!833434 m!777831))

(declare-fun m!777833 () Bool)

(assert (=> start!71666 m!777833))

(declare-fun m!777835 () Bool)

(assert (=> start!71666 m!777835))

(declare-fun m!777837 () Bool)

(assert (=> start!71666 m!777837))

(check-sat (not b!833429) (not b!833434) (not mapNonEmpty!24506) (not start!71666) (not b!833432) b_and!22579 (not b!833438) (not b!833431) (not b_next!13519) (not b!833437) tp_is_empty!15229)
(check-sat b_and!22579 (not b_next!13519))
