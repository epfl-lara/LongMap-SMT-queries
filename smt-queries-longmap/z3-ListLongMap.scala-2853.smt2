; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41134 () Bool)

(assert start!41134)

(declare-fun b_free!11017 () Bool)

(declare-fun b_next!11017 () Bool)

(assert (=> start!41134 (= b_free!11017 (not b_next!11017))))

(declare-fun tp!38886 () Bool)

(declare-fun b_and!19247 () Bool)

(assert (=> start!41134 (= tp!38886 b_and!19247)))

(declare-fun b!459071 () Bool)

(declare-fun e!267939 () Bool)

(declare-fun tp_is_empty!12355 () Bool)

(assert (=> b!459071 (= e!267939 tp_is_empty!12355)))

(declare-fun b!459072 () Bool)

(declare-fun res!274371 () Bool)

(declare-fun e!267933 () Bool)

(assert (=> b!459072 (=> (not res!274371) (not e!267933))))

(declare-datatypes ((array!28507 0))(
  ( (array!28508 (arr!13694 (Array (_ BitVec 32) (_ BitVec 64))) (size!14047 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28507)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459072 (= res!274371 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459073 () Bool)

(declare-fun res!274373 () Bool)

(assert (=> b!459073 (=> (not res!274373) (not e!267933))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459073 (= res!274373 (or (= (select (arr!13694 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13694 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459075 () Bool)

(declare-fun res!274375 () Bool)

(assert (=> b!459075 (=> (not res!274375) (not e!267933))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17579 0))(
  ( (V!17580 (val!6222 Int)) )
))
(declare-datatypes ((ValueCell!5834 0))(
  ( (ValueCellFull!5834 (v!8494 V!17579)) (EmptyCell!5834) )
))
(declare-datatypes ((array!28509 0))(
  ( (array!28510 (arr!13695 (Array (_ BitVec 32) ValueCell!5834)) (size!14048 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28509)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!459075 (= res!274375 (and (= (size!14048 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14047 _keys!709) (size!14048 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459076 () Bool)

(declare-fun e!267938 () Bool)

(declare-fun e!267936 () Bool)

(assert (=> b!459076 (= e!267938 (not e!267936))))

(declare-fun res!274376 () Bool)

(assert (=> b!459076 (=> res!274376 e!267936)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459076 (= res!274376 (not (validKeyInArray!0 (select (arr!13694 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8228 0))(
  ( (tuple2!8229 (_1!4125 (_ BitVec 64)) (_2!4125 V!17579)) )
))
(declare-datatypes ((List!8291 0))(
  ( (Nil!8288) (Cons!8287 (h!9143 tuple2!8228) (t!14178 List!8291)) )
))
(declare-datatypes ((ListLongMap!7131 0))(
  ( (ListLongMap!7132 (toList!3581 List!8291)) )
))
(declare-fun lt!207580 () ListLongMap!7131)

(declare-fun lt!207583 () ListLongMap!7131)

(assert (=> b!459076 (= lt!207580 lt!207583)))

(declare-fun lt!207581 () ListLongMap!7131)

(declare-fun v!412 () V!17579)

(declare-fun +!1633 (ListLongMap!7131 tuple2!8228) ListLongMap!7131)

(assert (=> b!459076 (= lt!207583 (+!1633 lt!207581 (tuple2!8229 k0!794 v!412)))))

(declare-fun minValue!515 () V!17579)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207587 () array!28509)

(declare-fun zeroValue!515 () V!17579)

(declare-fun lt!207584 () array!28507)

(declare-fun getCurrentListMapNoExtraKeys!1775 (array!28507 array!28509 (_ BitVec 32) (_ BitVec 32) V!17579 V!17579 (_ BitVec 32) Int) ListLongMap!7131)

(assert (=> b!459076 (= lt!207580 (getCurrentListMapNoExtraKeys!1775 lt!207584 lt!207587 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459076 (= lt!207581 (getCurrentListMapNoExtraKeys!1775 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13315 0))(
  ( (Unit!13316) )
))
(declare-fun lt!207582 () Unit!13315)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!767 (array!28507 array!28509 (_ BitVec 32) (_ BitVec 32) V!17579 V!17579 (_ BitVec 32) (_ BitVec 64) V!17579 (_ BitVec 32) Int) Unit!13315)

(assert (=> b!459076 (= lt!207582 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459077 () Bool)

(declare-fun e!267932 () Bool)

(assert (=> b!459077 (= e!267932 e!267938)))

(declare-fun res!274374 () Bool)

(assert (=> b!459077 (=> (not res!274374) (not e!267938))))

(assert (=> b!459077 (= res!274374 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207579 () ListLongMap!7131)

(assert (=> b!459077 (= lt!207579 (getCurrentListMapNoExtraKeys!1775 lt!207584 lt!207587 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459077 (= lt!207587 (array!28510 (store (arr!13695 _values!549) i!563 (ValueCellFull!5834 v!412)) (size!14048 _values!549)))))

(declare-fun lt!207578 () ListLongMap!7131)

(assert (=> b!459077 (= lt!207578 (getCurrentListMapNoExtraKeys!1775 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459078 () Bool)

(declare-fun e!267935 () Bool)

(assert (=> b!459078 (= e!267935 tp_is_empty!12355)))

(declare-fun mapNonEmpty!20182 () Bool)

(declare-fun mapRes!20182 () Bool)

(declare-fun tp!38887 () Bool)

(assert (=> mapNonEmpty!20182 (= mapRes!20182 (and tp!38887 e!267935))))

(declare-fun mapValue!20182 () ValueCell!5834)

(declare-fun mapRest!20182 () (Array (_ BitVec 32) ValueCell!5834))

(declare-fun mapKey!20182 () (_ BitVec 32))

(assert (=> mapNonEmpty!20182 (= (arr!13695 _values!549) (store mapRest!20182 mapKey!20182 mapValue!20182))))

(declare-fun b!459079 () Bool)

(declare-fun res!274370 () Bool)

(assert (=> b!459079 (=> (not res!274370) (not e!267933))))

(declare-datatypes ((List!8292 0))(
  ( (Nil!8289) (Cons!8288 (h!9144 (_ BitVec 64)) (t!14179 List!8292)) )
))
(declare-fun arrayNoDuplicates!0 (array!28507 (_ BitVec 32) List!8292) Bool)

(assert (=> b!459079 (= res!274370 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8289))))

(declare-fun b!459080 () Bool)

(assert (=> b!459080 (= e!267936 (bvslt from!863 (size!14047 _keys!709)))))

(assert (=> b!459080 (not (= (select (arr!13694 _keys!709) from!863) k0!794))))

(declare-fun lt!207586 () Unit!13315)

(declare-fun e!267931 () Unit!13315)

(assert (=> b!459080 (= lt!207586 e!267931)))

(declare-fun c!56403 () Bool)

(assert (=> b!459080 (= c!56403 (= (select (arr!13694 _keys!709) from!863) k0!794))))

(declare-fun get!6757 (ValueCell!5834 V!17579) V!17579)

(declare-fun dynLambda!894 (Int (_ BitVec 64)) V!17579)

(assert (=> b!459080 (= lt!207579 (+!1633 lt!207583 (tuple2!8229 (select (arr!13694 _keys!709) from!863) (get!6757 (select (arr!13695 _values!549) from!863) (dynLambda!894 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459081 () Bool)

(declare-fun res!274369 () Bool)

(assert (=> b!459081 (=> (not res!274369) (not e!267933))))

(assert (=> b!459081 (= res!274369 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14047 _keys!709))))))

(declare-fun b!459082 () Bool)

(declare-fun e!267934 () Bool)

(assert (=> b!459082 (= e!267934 (and e!267939 mapRes!20182))))

(declare-fun condMapEmpty!20182 () Bool)

(declare-fun mapDefault!20182 () ValueCell!5834)

(assert (=> b!459082 (= condMapEmpty!20182 (= (arr!13695 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5834)) mapDefault!20182)))))

(declare-fun b!459083 () Bool)

(assert (=> b!459083 (= e!267933 e!267932)))

(declare-fun res!274378 () Bool)

(assert (=> b!459083 (=> (not res!274378) (not e!267932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28507 (_ BitVec 32)) Bool)

(assert (=> b!459083 (= res!274378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207584 mask!1025))))

(assert (=> b!459083 (= lt!207584 (array!28508 (store (arr!13694 _keys!709) i!563 k0!794) (size!14047 _keys!709)))))

(declare-fun mapIsEmpty!20182 () Bool)

(assert (=> mapIsEmpty!20182 mapRes!20182))

(declare-fun b!459084 () Bool)

(declare-fun res!274381 () Bool)

(assert (=> b!459084 (=> (not res!274381) (not e!267933))))

(assert (=> b!459084 (= res!274381 (validKeyInArray!0 k0!794))))

(declare-fun b!459085 () Bool)

(declare-fun Unit!13317 () Unit!13315)

(assert (=> b!459085 (= e!267931 Unit!13317)))

(declare-fun res!274379 () Bool)

(assert (=> start!41134 (=> (not res!274379) (not e!267933))))

(assert (=> start!41134 (= res!274379 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14047 _keys!709))))))

(assert (=> start!41134 e!267933))

(assert (=> start!41134 tp_is_empty!12355))

(assert (=> start!41134 tp!38886))

(assert (=> start!41134 true))

(declare-fun array_inv!9972 (array!28509) Bool)

(assert (=> start!41134 (and (array_inv!9972 _values!549) e!267934)))

(declare-fun array_inv!9973 (array!28507) Bool)

(assert (=> start!41134 (array_inv!9973 _keys!709)))

(declare-fun b!459074 () Bool)

(declare-fun res!274372 () Bool)

(assert (=> b!459074 (=> (not res!274372) (not e!267933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459074 (= res!274372 (validMask!0 mask!1025))))

(declare-fun b!459086 () Bool)

(declare-fun res!274368 () Bool)

(assert (=> b!459086 (=> (not res!274368) (not e!267933))))

(assert (=> b!459086 (= res!274368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459087 () Bool)

(declare-fun res!274377 () Bool)

(assert (=> b!459087 (=> (not res!274377) (not e!267932))))

(assert (=> b!459087 (= res!274377 (bvsle from!863 i!563))))

(declare-fun b!459088 () Bool)

(declare-fun res!274380 () Bool)

(assert (=> b!459088 (=> (not res!274380) (not e!267932))))

(assert (=> b!459088 (= res!274380 (arrayNoDuplicates!0 lt!207584 #b00000000000000000000000000000000 Nil!8289))))

(declare-fun b!459089 () Bool)

(declare-fun Unit!13318 () Unit!13315)

(assert (=> b!459089 (= e!267931 Unit!13318)))

(declare-fun lt!207585 () Unit!13315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13315)

(assert (=> b!459089 (= lt!207585 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459089 false))

(assert (= (and start!41134 res!274379) b!459074))

(assert (= (and b!459074 res!274372) b!459075))

(assert (= (and b!459075 res!274375) b!459086))

(assert (= (and b!459086 res!274368) b!459079))

(assert (= (and b!459079 res!274370) b!459081))

(assert (= (and b!459081 res!274369) b!459084))

(assert (= (and b!459084 res!274381) b!459073))

(assert (= (and b!459073 res!274373) b!459072))

(assert (= (and b!459072 res!274371) b!459083))

(assert (= (and b!459083 res!274378) b!459088))

(assert (= (and b!459088 res!274380) b!459087))

(assert (= (and b!459087 res!274377) b!459077))

(assert (= (and b!459077 res!274374) b!459076))

(assert (= (and b!459076 (not res!274376)) b!459080))

(assert (= (and b!459080 c!56403) b!459089))

(assert (= (and b!459080 (not c!56403)) b!459085))

(assert (= (and b!459082 condMapEmpty!20182) mapIsEmpty!20182))

(assert (= (and b!459082 (not condMapEmpty!20182)) mapNonEmpty!20182))

(get-info :version)

(assert (= (and mapNonEmpty!20182 ((_ is ValueCellFull!5834) mapValue!20182)) b!459078))

(assert (= (and b!459082 ((_ is ValueCellFull!5834) mapDefault!20182)) b!459071))

(assert (= start!41134 b!459082))

(declare-fun b_lambda!9833 () Bool)

(assert (=> (not b_lambda!9833) (not b!459080)))

(declare-fun t!14177 () Bool)

(declare-fun tb!3845 () Bool)

(assert (=> (and start!41134 (= defaultEntry!557 defaultEntry!557) t!14177) tb!3845))

(declare-fun result!7243 () Bool)

(assert (=> tb!3845 (= result!7243 tp_is_empty!12355)))

(assert (=> b!459080 t!14177))

(declare-fun b_and!19249 () Bool)

(assert (= b_and!19247 (and (=> t!14177 result!7243) b_and!19249)))

(declare-fun m!441901 () Bool)

(assert (=> b!459073 m!441901))

(declare-fun m!441903 () Bool)

(assert (=> b!459089 m!441903))

(declare-fun m!441905 () Bool)

(assert (=> b!459084 m!441905))

(declare-fun m!441907 () Bool)

(assert (=> b!459080 m!441907))

(declare-fun m!441909 () Bool)

(assert (=> b!459080 m!441909))

(declare-fun m!441911 () Bool)

(assert (=> b!459080 m!441911))

(declare-fun m!441913 () Bool)

(assert (=> b!459080 m!441913))

(assert (=> b!459080 m!441911))

(assert (=> b!459080 m!441909))

(declare-fun m!441915 () Bool)

(assert (=> b!459080 m!441915))

(declare-fun m!441917 () Bool)

(assert (=> b!459074 m!441917))

(declare-fun m!441919 () Bool)

(assert (=> b!459088 m!441919))

(assert (=> b!459076 m!441907))

(declare-fun m!441921 () Bool)

(assert (=> b!459076 m!441921))

(declare-fun m!441923 () Bool)

(assert (=> b!459076 m!441923))

(declare-fun m!441925 () Bool)

(assert (=> b!459076 m!441925))

(assert (=> b!459076 m!441907))

(declare-fun m!441927 () Bool)

(assert (=> b!459076 m!441927))

(declare-fun m!441929 () Bool)

(assert (=> b!459076 m!441929))

(declare-fun m!441931 () Bool)

(assert (=> b!459077 m!441931))

(declare-fun m!441933 () Bool)

(assert (=> b!459077 m!441933))

(declare-fun m!441935 () Bool)

(assert (=> b!459077 m!441935))

(declare-fun m!441937 () Bool)

(assert (=> start!41134 m!441937))

(declare-fun m!441939 () Bool)

(assert (=> start!41134 m!441939))

(declare-fun m!441941 () Bool)

(assert (=> b!459083 m!441941))

(declare-fun m!441943 () Bool)

(assert (=> b!459083 m!441943))

(declare-fun m!441945 () Bool)

(assert (=> mapNonEmpty!20182 m!441945))

(declare-fun m!441947 () Bool)

(assert (=> b!459086 m!441947))

(declare-fun m!441949 () Bool)

(assert (=> b!459079 m!441949))

(declare-fun m!441951 () Bool)

(assert (=> b!459072 m!441951))

(check-sat b_and!19249 (not b!459080) (not b_next!11017) (not b!459077) (not b_lambda!9833) (not b!459086) (not b!459072) (not b!459076) (not b!459083) (not b!459084) (not mapNonEmpty!20182) (not b!459079) (not b!459074) (not b!459089) (not b!459088) (not start!41134) tp_is_empty!12355)
(check-sat b_and!19249 (not b_next!11017))
