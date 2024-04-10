; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84144 () Bool)

(assert start!84144)

(declare-fun b_free!19845 () Bool)

(declare-fun b_next!19845 () Bool)

(assert (=> start!84144 (= b_free!19845 (not b_next!19845))))

(declare-fun tp!69139 () Bool)

(declare-fun b_and!31771 () Bool)

(assert (=> start!84144 (= tp!69139 b_and!31771)))

(declare-fun res!658319 () Bool)

(declare-fun e!554655 () Bool)

(assert (=> start!84144 (=> (not res!658319) (not e!554655))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84144 (= res!658319 (validMask!0 mask!1948))))

(assert (=> start!84144 e!554655))

(assert (=> start!84144 true))

(declare-fun tp_is_empty!22947 () Bool)

(assert (=> start!84144 tp_is_empty!22947))

(declare-datatypes ((V!35579 0))(
  ( (V!35580 (val!11524 Int)) )
))
(declare-datatypes ((ValueCell!10992 0))(
  ( (ValueCellFull!10992 (v!14086 V!35579)) (EmptyCell!10992) )
))
(declare-datatypes ((array!61877 0))(
  ( (array!61878 (arr!29796 (Array (_ BitVec 32) ValueCell!10992)) (size!30275 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61877)

(declare-fun e!554654 () Bool)

(declare-fun array_inv!23039 (array!61877) Bool)

(assert (=> start!84144 (and (array_inv!23039 _values!1278) e!554654)))

(assert (=> start!84144 tp!69139))

(declare-datatypes ((array!61879 0))(
  ( (array!61880 (arr!29797 (Array (_ BitVec 32) (_ BitVec 64))) (size!30276 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61879)

(declare-fun array_inv!23040 (array!61879) Bool)

(assert (=> start!84144 (array_inv!23040 _keys!1544)))

(declare-fun mapNonEmpty!36449 () Bool)

(declare-fun mapRes!36449 () Bool)

(declare-fun tp!69138 () Bool)

(declare-fun e!554652 () Bool)

(assert (=> mapNonEmpty!36449 (= mapRes!36449 (and tp!69138 e!554652))))

(declare-fun mapValue!36449 () ValueCell!10992)

(declare-fun mapKey!36449 () (_ BitVec 32))

(declare-fun mapRest!36449 () (Array (_ BitVec 32) ValueCell!10992))

(assert (=> mapNonEmpty!36449 (= (arr!29796 _values!1278) (store mapRest!36449 mapKey!36449 mapValue!36449))))

(declare-fun b!983835 () Bool)

(declare-fun res!658322 () Bool)

(assert (=> b!983835 (=> (not res!658322) (not e!554655))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983835 (= res!658322 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983836 () Bool)

(declare-fun res!658317 () Bool)

(assert (=> b!983836 (=> (not res!658317) (not e!554655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61879 (_ BitVec 32)) Bool)

(assert (=> b!983836 (= res!658317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983837 () Bool)

(declare-fun e!554651 () Bool)

(assert (=> b!983837 (= e!554651 tp_is_empty!22947)))

(declare-fun b!983838 () Bool)

(assert (=> b!983838 (= e!554652 tp_is_empty!22947)))

(declare-fun b!983839 () Bool)

(assert (=> b!983839 (= e!554655 false)))

(declare-fun minValue!1220 () V!35579)

(declare-datatypes ((tuple2!14734 0))(
  ( (tuple2!14735 (_1!7378 (_ BitVec 64)) (_2!7378 V!35579)) )
))
(declare-datatypes ((List!20626 0))(
  ( (Nil!20623) (Cons!20622 (h!21784 tuple2!14734) (t!29417 List!20626)) )
))
(declare-datatypes ((ListLongMap!13431 0))(
  ( (ListLongMap!13432 (toList!6731 List!20626)) )
))
(declare-fun lt!436568 () ListLongMap!13431)

(declare-fun zeroValue!1220 () V!35579)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3426 (array!61879 array!61877 (_ BitVec 32) (_ BitVec 32) V!35579 V!35579 (_ BitVec 32) Int) ListLongMap!13431)

(assert (=> b!983839 (= lt!436568 (getCurrentListMapNoExtraKeys!3426 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36449 () Bool)

(assert (=> mapIsEmpty!36449 mapRes!36449))

(declare-fun b!983840 () Bool)

(declare-fun res!658320 () Bool)

(assert (=> b!983840 (=> (not res!658320) (not e!554655))))

(assert (=> b!983840 (= res!658320 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30276 _keys!1544))))))

(declare-fun b!983841 () Bool)

(declare-fun res!658318 () Bool)

(assert (=> b!983841 (=> (not res!658318) (not e!554655))))

(assert (=> b!983841 (= res!658318 (and (= (size!30275 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30276 _keys!1544) (size!30275 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983842 () Bool)

(assert (=> b!983842 (= e!554654 (and e!554651 mapRes!36449))))

(declare-fun condMapEmpty!36449 () Bool)

(declare-fun mapDefault!36449 () ValueCell!10992)

(assert (=> b!983842 (= condMapEmpty!36449 (= (arr!29796 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10992)) mapDefault!36449)))))

(declare-fun b!983843 () Bool)

(declare-fun res!658316 () Bool)

(assert (=> b!983843 (=> (not res!658316) (not e!554655))))

(declare-datatypes ((List!20627 0))(
  ( (Nil!20624) (Cons!20623 (h!21785 (_ BitVec 64)) (t!29418 List!20627)) )
))
(declare-fun arrayNoDuplicates!0 (array!61879 (_ BitVec 32) List!20627) Bool)

(assert (=> b!983843 (= res!658316 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20624))))

(declare-fun b!983844 () Bool)

(declare-fun res!658321 () Bool)

(assert (=> b!983844 (=> (not res!658321) (not e!554655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983844 (= res!658321 (validKeyInArray!0 (select (arr!29797 _keys!1544) from!1932)))))

(assert (= (and start!84144 res!658319) b!983841))

(assert (= (and b!983841 res!658318) b!983836))

(assert (= (and b!983836 res!658317) b!983843))

(assert (= (and b!983843 res!658316) b!983840))

(assert (= (and b!983840 res!658320) b!983844))

(assert (= (and b!983844 res!658321) b!983835))

(assert (= (and b!983835 res!658322) b!983839))

(assert (= (and b!983842 condMapEmpty!36449) mapIsEmpty!36449))

(assert (= (and b!983842 (not condMapEmpty!36449)) mapNonEmpty!36449))

(get-info :version)

(assert (= (and mapNonEmpty!36449 ((_ is ValueCellFull!10992) mapValue!36449)) b!983838))

(assert (= (and b!983842 ((_ is ValueCellFull!10992) mapDefault!36449)) b!983837))

(assert (= start!84144 b!983842))

(declare-fun m!910963 () Bool)

(assert (=> b!983839 m!910963))

(declare-fun m!910965 () Bool)

(assert (=> start!84144 m!910965))

(declare-fun m!910967 () Bool)

(assert (=> start!84144 m!910967))

(declare-fun m!910969 () Bool)

(assert (=> start!84144 m!910969))

(declare-fun m!910971 () Bool)

(assert (=> b!983844 m!910971))

(assert (=> b!983844 m!910971))

(declare-fun m!910973 () Bool)

(assert (=> b!983844 m!910973))

(declare-fun m!910975 () Bool)

(assert (=> mapNonEmpty!36449 m!910975))

(declare-fun m!910977 () Bool)

(assert (=> b!983843 m!910977))

(declare-fun m!910979 () Bool)

(assert (=> b!983836 m!910979))

(check-sat (not b_next!19845) (not mapNonEmpty!36449) (not b!983839) (not b!983836) (not start!84144) (not b!983844) b_and!31771 (not b!983843) tp_is_empty!22947)
(check-sat b_and!31771 (not b_next!19845))
