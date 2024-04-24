; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83526 () Bool)

(assert start!83526)

(declare-fun b_free!19351 () Bool)

(declare-fun b_next!19351 () Bool)

(assert (=> start!83526 (= b_free!19351 (not b_next!19351))))

(declare-fun tp!67333 () Bool)

(declare-fun b_and!30933 () Bool)

(assert (=> start!83526 (= tp!67333 b_and!30933)))

(declare-fun b!974184 () Bool)

(declare-fun res!651830 () Bool)

(declare-fun e!549180 () Bool)

(assert (=> b!974184 (=> (not res!651830) (not e!549180))))

(declare-datatypes ((array!60570 0))(
  ( (array!60571 (arr!29144 (Array (_ BitVec 32) (_ BitVec 64))) (size!29624 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60570)

(declare-datatypes ((List!20199 0))(
  ( (Nil!20196) (Cons!20195 (h!21363 (_ BitVec 64)) (t!28640 List!20199)) )
))
(declare-fun arrayNoDuplicates!0 (array!60570 (_ BitVec 32) List!20199) Bool)

(assert (=> b!974184 (= res!651830 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20196))))

(declare-fun b!974185 () Bool)

(declare-fun e!549184 () Bool)

(assert (=> b!974185 (= e!549180 e!549184)))

(declare-fun res!651831 () Bool)

(assert (=> b!974185 (=> (not res!651831) (not e!549184))))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((V!34649 0))(
  ( (V!34650 (val!11175 Int)) )
))
(declare-datatypes ((tuple2!14350 0))(
  ( (tuple2!14351 (_1!7186 (_ BitVec 64)) (_2!7186 V!34649)) )
))
(declare-datatypes ((List!20200 0))(
  ( (Nil!20197) (Cons!20196 (h!21364 tuple2!14350) (t!28641 List!20200)) )
))
(declare-datatypes ((ListLongMap!13049 0))(
  ( (ListLongMap!13050 (toList!6540 List!20200)) )
))
(declare-fun lt!432769 () ListLongMap!13049)

(declare-fun contains!5647 (ListLongMap!13049 (_ BitVec 64)) Bool)

(assert (=> b!974185 (= res!651831 (contains!5647 lt!432769 (select (arr!29144 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34649)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34649)

(declare-datatypes ((ValueCell!10643 0))(
  ( (ValueCellFull!10643 (v!13731 V!34649)) (EmptyCell!10643) )
))
(declare-datatypes ((array!60572 0))(
  ( (array!60573 (arr!29145 (Array (_ BitVec 32) ValueCell!10643)) (size!29625 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60572)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3773 (array!60570 array!60572 (_ BitVec 32) (_ BitVec 32) V!34649 V!34649 (_ BitVec 32) Int) ListLongMap!13049)

(assert (=> b!974185 (= lt!432769 (getCurrentListMap!3773 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974186 () Bool)

(declare-fun res!651829 () Bool)

(assert (=> b!974186 (=> (not res!651829) (not e!549180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60570 (_ BitVec 32)) Bool)

(assert (=> b!974186 (= res!651829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974187 () Bool)

(declare-fun e!549182 () Bool)

(declare-fun tp_is_empty!22249 () Bool)

(assert (=> b!974187 (= e!549182 tp_is_empty!22249)))

(declare-fun res!651832 () Bool)

(assert (=> start!83526 (=> (not res!651832) (not e!549180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83526 (= res!651832 (validMask!0 mask!2147))))

(assert (=> start!83526 e!549180))

(assert (=> start!83526 true))

(declare-fun e!549179 () Bool)

(declare-fun array_inv!22601 (array!60572) Bool)

(assert (=> start!83526 (and (array_inv!22601 _values!1425) e!549179)))

(assert (=> start!83526 tp_is_empty!22249))

(assert (=> start!83526 tp!67333))

(declare-fun array_inv!22602 (array!60570) Bool)

(assert (=> start!83526 (array_inv!22602 _keys!1717)))

(declare-fun b!974188 () Bool)

(declare-fun e!549183 () Bool)

(assert (=> b!974188 (= e!549183 (not true))))

(declare-fun lt!432771 () tuple2!14350)

(declare-fun +!2915 (ListLongMap!13049 tuple2!14350) ListLongMap!13049)

(assert (=> b!974188 (contains!5647 (+!2915 lt!432769 lt!432771) (select (arr!29144 _keys!1717) i!822))))

(declare-fun lt!432765 () V!34649)

(declare-datatypes ((Unit!32394 0))(
  ( (Unit!32395) )
))
(declare-fun lt!432767 () Unit!32394)

(declare-fun lt!432770 () (_ BitVec 64))

(declare-fun addStillContains!597 (ListLongMap!13049 (_ BitVec 64) V!34649 (_ BitVec 64)) Unit!32394)

(assert (=> b!974188 (= lt!432767 (addStillContains!597 lt!432769 lt!432770 lt!432765 (select (arr!29144 _keys!1717) i!822)))))

(declare-fun lt!432768 () ListLongMap!13049)

(assert (=> b!974188 (= lt!432768 (+!2915 (getCurrentListMap!3773 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432771))))

(assert (=> b!974188 (= lt!432771 (tuple2!14351 lt!432770 lt!432765))))

(declare-fun get!15124 (ValueCell!10643 V!34649) V!34649)

(declare-fun dynLambda!1712 (Int (_ BitVec 64)) V!34649)

(assert (=> b!974188 (= lt!432765 (get!15124 (select (arr!29145 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1712 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432766 () Unit!32394)

(declare-fun lemmaListMapRecursiveValidKeyArray!271 (array!60570 array!60572 (_ BitVec 32) (_ BitVec 32) V!34649 V!34649 (_ BitVec 32) Int) Unit!32394)

(assert (=> b!974188 (= lt!432766 (lemmaListMapRecursiveValidKeyArray!271 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974189 () Bool)

(declare-fun e!549181 () Bool)

(declare-fun mapRes!35383 () Bool)

(assert (=> b!974189 (= e!549179 (and e!549181 mapRes!35383))))

(declare-fun condMapEmpty!35383 () Bool)

(declare-fun mapDefault!35383 () ValueCell!10643)

(assert (=> b!974189 (= condMapEmpty!35383 (= (arr!29145 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10643)) mapDefault!35383)))))

(declare-fun mapNonEmpty!35383 () Bool)

(declare-fun tp!67332 () Bool)

(assert (=> mapNonEmpty!35383 (= mapRes!35383 (and tp!67332 e!549182))))

(declare-fun mapKey!35383 () (_ BitVec 32))

(declare-fun mapValue!35383 () ValueCell!10643)

(declare-fun mapRest!35383 () (Array (_ BitVec 32) ValueCell!10643))

(assert (=> mapNonEmpty!35383 (= (arr!29145 _values!1425) (store mapRest!35383 mapKey!35383 mapValue!35383))))

(declare-fun b!974190 () Bool)

(declare-fun res!651833 () Bool)

(assert (=> b!974190 (=> (not res!651833) (not e!549180))))

(assert (=> b!974190 (= res!651833 (and (= (size!29625 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29624 _keys!1717) (size!29625 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35383 () Bool)

(assert (=> mapIsEmpty!35383 mapRes!35383))

(declare-fun b!974191 () Bool)

(assert (=> b!974191 (= e!549184 e!549183)))

(declare-fun res!651834 () Bool)

(assert (=> b!974191 (=> (not res!651834) (not e!549183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974191 (= res!651834 (validKeyInArray!0 lt!432770))))

(assert (=> b!974191 (= lt!432770 (select (arr!29144 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!974191 (= lt!432768 (getCurrentListMap!3773 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974192 () Bool)

(declare-fun res!651836 () Bool)

(assert (=> b!974192 (=> (not res!651836) (not e!549180))))

(assert (=> b!974192 (= res!651836 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29624 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29624 _keys!1717))))))

(declare-fun b!974193 () Bool)

(assert (=> b!974193 (= e!549181 tp_is_empty!22249)))

(declare-fun b!974194 () Bool)

(declare-fun res!651835 () Bool)

(assert (=> b!974194 (=> (not res!651835) (not e!549180))))

(assert (=> b!974194 (= res!651835 (validKeyInArray!0 (select (arr!29144 _keys!1717) i!822)))))

(assert (= (and start!83526 res!651832) b!974190))

(assert (= (and b!974190 res!651833) b!974186))

(assert (= (and b!974186 res!651829) b!974184))

(assert (= (and b!974184 res!651830) b!974192))

(assert (= (and b!974192 res!651836) b!974194))

(assert (= (and b!974194 res!651835) b!974185))

(assert (= (and b!974185 res!651831) b!974191))

(assert (= (and b!974191 res!651834) b!974188))

(assert (= (and b!974189 condMapEmpty!35383) mapIsEmpty!35383))

(assert (= (and b!974189 (not condMapEmpty!35383)) mapNonEmpty!35383))

(get-info :version)

(assert (= (and mapNonEmpty!35383 ((_ is ValueCellFull!10643) mapValue!35383)) b!974187))

(assert (= (and b!974189 ((_ is ValueCellFull!10643) mapDefault!35383)) b!974193))

(assert (= start!83526 b!974189))

(declare-fun b_lambda!14529 () Bool)

(assert (=> (not b_lambda!14529) (not b!974188)))

(declare-fun t!28639 () Bool)

(declare-fun tb!6291 () Bool)

(assert (=> (and start!83526 (= defaultEntry!1428 defaultEntry!1428) t!28639) tb!6291))

(declare-fun result!12567 () Bool)

(assert (=> tb!6291 (= result!12567 tp_is_empty!22249)))

(assert (=> b!974188 t!28639))

(declare-fun b_and!30935 () Bool)

(assert (= b_and!30933 (and (=> t!28639 result!12567) b_and!30935)))

(declare-fun m!902129 () Bool)

(assert (=> b!974194 m!902129))

(assert (=> b!974194 m!902129))

(declare-fun m!902131 () Bool)

(assert (=> b!974194 m!902131))

(declare-fun m!902133 () Bool)

(assert (=> b!974191 m!902133))

(declare-fun m!902135 () Bool)

(assert (=> b!974191 m!902135))

(declare-fun m!902137 () Bool)

(assert (=> b!974191 m!902137))

(declare-fun m!902139 () Bool)

(assert (=> start!83526 m!902139))

(declare-fun m!902141 () Bool)

(assert (=> start!83526 m!902141))

(declare-fun m!902143 () Bool)

(assert (=> start!83526 m!902143))

(declare-fun m!902145 () Bool)

(assert (=> b!974184 m!902145))

(declare-fun m!902147 () Bool)

(assert (=> b!974188 m!902147))

(assert (=> b!974188 m!902129))

(declare-fun m!902149 () Bool)

(assert (=> b!974188 m!902149))

(assert (=> b!974188 m!902147))

(declare-fun m!902151 () Bool)

(assert (=> b!974188 m!902151))

(declare-fun m!902153 () Bool)

(assert (=> b!974188 m!902153))

(assert (=> b!974188 m!902129))

(declare-fun m!902155 () Bool)

(assert (=> b!974188 m!902155))

(assert (=> b!974188 m!902149))

(declare-fun m!902157 () Bool)

(assert (=> b!974188 m!902157))

(declare-fun m!902159 () Bool)

(assert (=> b!974188 m!902159))

(assert (=> b!974188 m!902157))

(assert (=> b!974188 m!902129))

(declare-fun m!902161 () Bool)

(assert (=> b!974188 m!902161))

(assert (=> b!974188 m!902153))

(declare-fun m!902163 () Bool)

(assert (=> b!974188 m!902163))

(declare-fun m!902165 () Bool)

(assert (=> b!974186 m!902165))

(declare-fun m!902167 () Bool)

(assert (=> mapNonEmpty!35383 m!902167))

(assert (=> b!974185 m!902129))

(assert (=> b!974185 m!902129))

(declare-fun m!902169 () Bool)

(assert (=> b!974185 m!902169))

(declare-fun m!902171 () Bool)

(assert (=> b!974185 m!902171))

(check-sat tp_is_empty!22249 (not b!974184) (not mapNonEmpty!35383) (not b!974194) b_and!30935 (not b_lambda!14529) (not b!974186) (not start!83526) (not b!974191) (not b_next!19351) (not b!974188) (not b!974185))
(check-sat b_and!30935 (not b_next!19351))
