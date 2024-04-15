; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78240 () Bool)

(assert start!78240)

(declare-fun b_free!16729 () Bool)

(declare-fun b_next!16729 () Bool)

(assert (=> start!78240 (= b_free!16729 (not b_next!16729))))

(declare-fun tp!58468 () Bool)

(declare-fun b_and!27281 () Bool)

(assert (=> start!78240 (= tp!58468 b_and!27281)))

(declare-fun b!913078 () Bool)

(declare-fun e!512140 () Bool)

(declare-fun e!512141 () Bool)

(declare-fun mapRes!30451 () Bool)

(assert (=> b!913078 (= e!512140 (and e!512141 mapRes!30451))))

(declare-fun condMapEmpty!30451 () Bool)

(declare-datatypes ((V!30495 0))(
  ( (V!30496 (val!9624 Int)) )
))
(declare-datatypes ((ValueCell!9092 0))(
  ( (ValueCellFull!9092 (v!12135 V!30495)) (EmptyCell!9092) )
))
(declare-datatypes ((array!54287 0))(
  ( (array!54288 (arr!26097 (Array (_ BitVec 32) ValueCell!9092)) (size!26558 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54287)

(declare-fun mapDefault!30451 () ValueCell!9092)

(assert (=> b!913078 (= condMapEmpty!30451 (= (arr!26097 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9092)) mapDefault!30451)))))

(declare-fun b!913079 () Bool)

(declare-fun e!512144 () Bool)

(declare-fun tp_is_empty!19147 () Bool)

(assert (=> b!913079 (= e!512144 tp_is_empty!19147)))

(declare-fun b!913080 () Bool)

(declare-fun e!512142 () Bool)

(declare-fun e!512143 () Bool)

(assert (=> b!913080 (= e!512142 (not e!512143))))

(declare-fun res!615969 () Bool)

(assert (=> b!913080 (=> res!615969 e!512143)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54289 0))(
  ( (array!54290 (arr!26098 (Array (_ BitVec 32) (_ BitVec 64))) (size!26559 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54289)

(assert (=> b!913080 (= res!615969 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26559 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913080 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30495)

(declare-datatypes ((Unit!30834 0))(
  ( (Unit!30835) )
))
(declare-fun lt!410598 () Unit!30834)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30495)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lemmaKeyInListMapIsInArray!273 (array!54289 array!54287 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 64) Int) Unit!30834)

(assert (=> b!913080 (= lt!410598 (lemmaKeyInListMapIsInArray!273 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913081 () Bool)

(declare-datatypes ((tuple2!12588 0))(
  ( (tuple2!12589 (_1!6305 (_ BitVec 64)) (_2!6305 V!30495)) )
))
(declare-datatypes ((List!18368 0))(
  ( (Nil!18365) (Cons!18364 (h!19510 tuple2!12588) (t!25950 List!18368)) )
))
(declare-datatypes ((ListLongMap!11275 0))(
  ( (ListLongMap!11276 (toList!5653 List!18368)) )
))
(declare-fun contains!4657 (ListLongMap!11275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2855 (array!54289 array!54287 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 32) Int) ListLongMap!11275)

(assert (=> b!913081 (= e!512143 (contains!4657 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k0!1033))))

(declare-fun b!913082 () Bool)

(declare-fun res!615975 () Bool)

(assert (=> b!913082 (=> (not res!615975) (not e!512142))))

(assert (=> b!913082 (= res!615975 (contains!4657 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30451 () Bool)

(declare-fun tp!58467 () Bool)

(assert (=> mapNonEmpty!30451 (= mapRes!30451 (and tp!58467 e!512144))))

(declare-fun mapRest!30451 () (Array (_ BitVec 32) ValueCell!9092))

(declare-fun mapKey!30451 () (_ BitVec 32))

(declare-fun mapValue!30451 () ValueCell!9092)

(assert (=> mapNonEmpty!30451 (= (arr!26097 _values!1152) (store mapRest!30451 mapKey!30451 mapValue!30451))))

(declare-fun b!913083 () Bool)

(declare-fun res!615971 () Bool)

(assert (=> b!913083 (=> (not res!615971) (not e!512142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54289 (_ BitVec 32)) Bool)

(assert (=> b!913083 (= res!615971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!615974 () Bool)

(assert (=> start!78240 (=> (not res!615974) (not e!512142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78240 (= res!615974 (validMask!0 mask!1756))))

(assert (=> start!78240 e!512142))

(declare-fun array_inv!20460 (array!54287) Bool)

(assert (=> start!78240 (and (array_inv!20460 _values!1152) e!512140)))

(assert (=> start!78240 tp!58468))

(assert (=> start!78240 true))

(assert (=> start!78240 tp_is_empty!19147))

(declare-fun array_inv!20461 (array!54289) Bool)

(assert (=> start!78240 (array_inv!20461 _keys!1386)))

(declare-fun b!913077 () Bool)

(declare-fun res!615973 () Bool)

(assert (=> b!913077 (=> (not res!615973) (not e!512142))))

(assert (=> b!913077 (= res!615973 (and (= (size!26558 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26559 _keys!1386) (size!26558 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913084 () Bool)

(assert (=> b!913084 (= e!512141 tp_is_empty!19147)))

(declare-fun b!913085 () Bool)

(declare-fun res!615972 () Bool)

(assert (=> b!913085 (=> (not res!615972) (not e!512142))))

(assert (=> b!913085 (= res!615972 (and (= (select (arr!26098 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913086 () Bool)

(declare-fun res!615976 () Bool)

(assert (=> b!913086 (=> (not res!615976) (not e!512142))))

(declare-datatypes ((List!18369 0))(
  ( (Nil!18366) (Cons!18365 (h!19511 (_ BitVec 64)) (t!25951 List!18369)) )
))
(declare-fun arrayNoDuplicates!0 (array!54289 (_ BitVec 32) List!18369) Bool)

(assert (=> b!913086 (= res!615976 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18366))))

(declare-fun b!913087 () Bool)

(declare-fun res!615970 () Bool)

(assert (=> b!913087 (=> (not res!615970) (not e!512142))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913087 (= res!615970 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30451 () Bool)

(assert (=> mapIsEmpty!30451 mapRes!30451))

(assert (= (and start!78240 res!615974) b!913077))

(assert (= (and b!913077 res!615973) b!913083))

(assert (= (and b!913083 res!615971) b!913086))

(assert (= (and b!913086 res!615976) b!913082))

(assert (= (and b!913082 res!615975) b!913087))

(assert (= (and b!913087 res!615970) b!913085))

(assert (= (and b!913085 res!615972) b!913080))

(assert (= (and b!913080 (not res!615969)) b!913081))

(assert (= (and b!913078 condMapEmpty!30451) mapIsEmpty!30451))

(assert (= (and b!913078 (not condMapEmpty!30451)) mapNonEmpty!30451))

(get-info :version)

(assert (= (and mapNonEmpty!30451 ((_ is ValueCellFull!9092) mapValue!30451)) b!913079))

(assert (= (and b!913078 ((_ is ValueCellFull!9092) mapDefault!30451)) b!913084))

(assert (= start!78240 b!913078))

(declare-fun m!846873 () Bool)

(assert (=> b!913082 m!846873))

(assert (=> b!913082 m!846873))

(declare-fun m!846875 () Bool)

(assert (=> b!913082 m!846875))

(declare-fun m!846877 () Bool)

(assert (=> b!913086 m!846877))

(declare-fun m!846879 () Bool)

(assert (=> b!913080 m!846879))

(declare-fun m!846881 () Bool)

(assert (=> b!913080 m!846881))

(declare-fun m!846883 () Bool)

(assert (=> b!913083 m!846883))

(declare-fun m!846885 () Bool)

(assert (=> b!913087 m!846885))

(declare-fun m!846887 () Bool)

(assert (=> b!913085 m!846887))

(declare-fun m!846889 () Bool)

(assert (=> start!78240 m!846889))

(declare-fun m!846891 () Bool)

(assert (=> start!78240 m!846891))

(declare-fun m!846893 () Bool)

(assert (=> start!78240 m!846893))

(declare-fun m!846895 () Bool)

(assert (=> b!913081 m!846895))

(assert (=> b!913081 m!846895))

(declare-fun m!846897 () Bool)

(assert (=> b!913081 m!846897))

(declare-fun m!846899 () Bool)

(assert (=> mapNonEmpty!30451 m!846899))

(check-sat b_and!27281 (not b!913087) (not b!913082) tp_is_empty!19147 (not b!913086) (not b!913083) (not b_next!16729) (not mapNonEmpty!30451) (not start!78240) (not b!913081) (not b!913080))
(check-sat b_and!27281 (not b_next!16729))
(get-model)

(declare-fun b!913162 () Bool)

(declare-fun e!512187 () Bool)

(declare-fun e!512189 () Bool)

(assert (=> b!913162 (= e!512187 e!512189)))

(declare-fun lt!410611 () (_ BitVec 64))

(assert (=> b!913162 (= lt!410611 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410612 () Unit!30834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54289 (_ BitVec 64) (_ BitVec 32)) Unit!30834)

(assert (=> b!913162 (= lt!410612 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410611 #b00000000000000000000000000000000))))

(assert (=> b!913162 (arrayContainsKey!0 _keys!1386 lt!410611 #b00000000000000000000000000000000)))

(declare-fun lt!410613 () Unit!30834)

(assert (=> b!913162 (= lt!410613 lt!410612)))

(declare-fun res!616029 () Bool)

(declare-datatypes ((SeekEntryResult!8969 0))(
  ( (MissingZero!8969 (index!38247 (_ BitVec 32))) (Found!8969 (index!38248 (_ BitVec 32))) (Intermediate!8969 (undefined!9781 Bool) (index!38249 (_ BitVec 32)) (x!78133 (_ BitVec 32))) (Undefined!8969) (MissingVacant!8969 (index!38250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54289 (_ BitVec 32)) SeekEntryResult!8969)

(assert (=> b!913162 (= res!616029 (= (seekEntryOrOpen!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8969 #b00000000000000000000000000000000)))))

(assert (=> b!913162 (=> (not res!616029) (not e!512189))))

(declare-fun b!913163 () Bool)

(declare-fun e!512188 () Bool)

(assert (=> b!913163 (= e!512188 e!512187)))

(declare-fun c!95767 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!913163 (= c!95767 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112139 () Bool)

(declare-fun res!616030 () Bool)

(assert (=> d!112139 (=> res!616030 e!512188)))

(assert (=> d!112139 (= res!616030 (bvsge #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(assert (=> d!112139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512188)))

(declare-fun bm!40395 () Bool)

(declare-fun call!40398 () Bool)

(assert (=> bm!40395 (= call!40398 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913164 () Bool)

(assert (=> b!913164 (= e!512189 call!40398)))

(declare-fun b!913165 () Bool)

(assert (=> b!913165 (= e!512187 call!40398)))

(assert (= (and d!112139 (not res!616030)) b!913163))

(assert (= (and b!913163 c!95767) b!913162))

(assert (= (and b!913163 (not c!95767)) b!913165))

(assert (= (and b!913162 res!616029) b!913164))

(assert (= (or b!913164 b!913165) bm!40395))

(declare-fun m!846957 () Bool)

(assert (=> b!913162 m!846957))

(declare-fun m!846959 () Bool)

(assert (=> b!913162 m!846959))

(declare-fun m!846961 () Bool)

(assert (=> b!913162 m!846961))

(assert (=> b!913162 m!846957))

(declare-fun m!846963 () Bool)

(assert (=> b!913162 m!846963))

(assert (=> b!913163 m!846957))

(assert (=> b!913163 m!846957))

(declare-fun m!846965 () Bool)

(assert (=> b!913163 m!846965))

(declare-fun m!846967 () Bool)

(assert (=> bm!40395 m!846967))

(assert (=> b!913083 d!112139))

(declare-fun d!112141 () Bool)

(declare-fun res!616035 () Bool)

(declare-fun e!512194 () Bool)

(assert (=> d!112141 (=> res!616035 e!512194)))

(assert (=> d!112141 (= res!616035 (= (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112141 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512194)))

(declare-fun b!913170 () Bool)

(declare-fun e!512195 () Bool)

(assert (=> b!913170 (= e!512194 e!512195)))

(declare-fun res!616036 () Bool)

(assert (=> b!913170 (=> (not res!616036) (not e!512195))))

(assert (=> b!913170 (= res!616036 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26559 _keys!1386)))))

(declare-fun b!913171 () Bool)

(assert (=> b!913171 (= e!512195 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112141 (not res!616035)) b!913170))

(assert (= (and b!913170 res!616036) b!913171))

(assert (=> d!112141 m!846957))

(declare-fun m!846969 () Bool)

(assert (=> b!913171 m!846969))

(assert (=> b!913080 d!112141))

(declare-fun d!112143 () Bool)

(declare-fun e!512198 () Bool)

(assert (=> d!112143 e!512198))

(declare-fun c!95770 () Bool)

(assert (=> d!112143 (= c!95770 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410616 () Unit!30834)

(declare-fun choose!1540 (array!54289 array!54287 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 64) Int) Unit!30834)

(assert (=> d!112143 (= lt!410616 (choose!1540 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112143 (validMask!0 mask!1756)))

(assert (=> d!112143 (= (lemmaKeyInListMapIsInArray!273 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410616)))

(declare-fun b!913176 () Bool)

(assert (=> b!913176 (= e!512198 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913177 () Bool)

(assert (=> b!913177 (= e!512198 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112143 c!95770) b!913176))

(assert (= (and d!112143 (not c!95770)) b!913177))

(declare-fun m!846971 () Bool)

(assert (=> d!112143 m!846971))

(assert (=> d!112143 m!846889))

(assert (=> b!913176 m!846879))

(assert (=> b!913080 d!112143))

(declare-fun d!112145 () Bool)

(assert (=> d!112145 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78240 d!112145))

(declare-fun d!112147 () Bool)

(assert (=> d!112147 (= (array_inv!20460 _values!1152) (bvsge (size!26558 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78240 d!112147))

(declare-fun d!112149 () Bool)

(assert (=> d!112149 (= (array_inv!20461 _keys!1386) (bvsge (size!26559 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78240 d!112149))

(declare-fun d!112151 () Bool)

(declare-fun e!512204 () Bool)

(assert (=> d!112151 e!512204))

(declare-fun res!616039 () Bool)

(assert (=> d!112151 (=> res!616039 e!512204)))

(declare-fun lt!410627 () Bool)

(assert (=> d!112151 (= res!616039 (not lt!410627))))

(declare-fun lt!410628 () Bool)

(assert (=> d!112151 (= lt!410627 lt!410628)))

(declare-fun lt!410625 () Unit!30834)

(declare-fun e!512203 () Unit!30834)

(assert (=> d!112151 (= lt!410625 e!512203)))

(declare-fun c!95773 () Bool)

(assert (=> d!112151 (= c!95773 lt!410628)))

(declare-fun containsKey!442 (List!18368 (_ BitVec 64)) Bool)

(assert (=> d!112151 (= lt!410628 (containsKey!442 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (=> d!112151 (= (contains!4657 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k0!1033) lt!410627)))

(declare-fun b!913184 () Bool)

(declare-fun lt!410626 () Unit!30834)

(assert (=> b!913184 (= e!512203 lt!410626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!337 (List!18368 (_ BitVec 64)) Unit!30834)

(assert (=> b!913184 (= lt!410626 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!484 0))(
  ( (Some!483 (v!12138 V!30495)) (None!482) )
))
(declare-fun isDefined!350 (Option!484) Bool)

(declare-fun getValueByKey!478 (List!18368 (_ BitVec 64)) Option!484)

(assert (=> b!913184 (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun b!913185 () Bool)

(declare-fun Unit!30838 () Unit!30834)

(assert (=> b!913185 (= e!512203 Unit!30838)))

(declare-fun b!913186 () Bool)

(assert (=> b!913186 (= e!512204 (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112151 c!95773) b!913184))

(assert (= (and d!112151 (not c!95773)) b!913185))

(assert (= (and d!112151 (not res!616039)) b!913186))

(declare-fun m!846973 () Bool)

(assert (=> d!112151 m!846973))

(declare-fun m!846975 () Bool)

(assert (=> b!913184 m!846975))

(declare-fun m!846977 () Bool)

(assert (=> b!913184 m!846977))

(assert (=> b!913184 m!846977))

(declare-fun m!846979 () Bool)

(assert (=> b!913184 m!846979))

(assert (=> b!913186 m!846977))

(assert (=> b!913186 m!846977))

(assert (=> b!913186 m!846979))

(assert (=> b!913081 d!112151))

(declare-fun b!913229 () Bool)

(declare-fun e!512233 () Bool)

(declare-fun e!512240 () Bool)

(assert (=> b!913229 (= e!512233 e!512240)))

(declare-fun c!95786 () Bool)

(assert (=> b!913229 (= c!95786 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40410 () Bool)

(declare-fun call!40415 () ListLongMap!11275)

(declare-fun call!40419 () ListLongMap!11275)

(assert (=> bm!40410 (= call!40415 call!40419)))

(declare-fun b!913230 () Bool)

(declare-fun e!512234 () Bool)

(assert (=> b!913230 (= e!512240 e!512234)))

(declare-fun res!616064 () Bool)

(declare-fun call!40418 () Bool)

(assert (=> b!913230 (= res!616064 call!40418)))

(assert (=> b!913230 (=> (not res!616064) (not e!512234))))

(declare-fun b!913231 () Bool)

(declare-fun e!512235 () Unit!30834)

(declare-fun Unit!30839 () Unit!30834)

(assert (=> b!913231 (= e!512235 Unit!30839)))

(declare-fun b!913232 () Bool)

(assert (=> b!913232 (= e!512240 (not call!40418))))

(declare-fun bm!40412 () Bool)

(declare-fun call!40414 () ListLongMap!11275)

(declare-fun call!40416 () ListLongMap!11275)

(assert (=> bm!40412 (= call!40414 call!40416)))

(declare-fun b!913233 () Bool)

(declare-fun e!512231 () Bool)

(declare-fun e!512237 () Bool)

(assert (=> b!913233 (= e!512231 e!512237)))

(declare-fun res!616062 () Bool)

(declare-fun call!40413 () Bool)

(assert (=> b!913233 (= res!616062 call!40413)))

(assert (=> b!913233 (=> (not res!616062) (not e!512237))))

(declare-fun b!913234 () Bool)

(declare-fun lt!410676 () ListLongMap!11275)

(declare-fun apply!520 (ListLongMap!11275 (_ BitVec 64)) V!30495)

(assert (=> b!913234 (= e!512234 (= (apply!520 lt!410676 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913235 () Bool)

(declare-fun res!616063 () Bool)

(assert (=> b!913235 (=> (not res!616063) (not e!512233))))

(declare-fun e!512236 () Bool)

(assert (=> b!913235 (= res!616063 e!512236)))

(declare-fun res!616060 () Bool)

(assert (=> b!913235 (=> res!616060 e!512236)))

(declare-fun e!512232 () Bool)

(assert (=> b!913235 (= res!616060 (not e!512232))))

(declare-fun res!616059 () Bool)

(assert (=> b!913235 (=> (not res!616059) (not e!512232))))

(assert (=> b!913235 (= res!616059 (bvslt i!717 (size!26559 _keys!1386)))))

(declare-fun b!913236 () Bool)

(declare-fun e!512242 () ListLongMap!11275)

(declare-fun call!40417 () ListLongMap!11275)

(assert (=> b!913236 (= e!512242 call!40417)))

(declare-fun bm!40413 () Bool)

(assert (=> bm!40413 (= call!40418 (contains!4657 lt!410676 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913237 () Bool)

(declare-fun e!512238 () Bool)

(assert (=> b!913237 (= e!512238 (validKeyInArray!0 (select (arr!26098 _keys!1386) i!717)))))

(declare-fun b!913238 () Bool)

(assert (=> b!913238 (= e!512237 (= (apply!520 lt!410676 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!913239 () Bool)

(declare-fun e!512241 () ListLongMap!11275)

(declare-fun +!2634 (ListLongMap!11275 tuple2!12588) ListLongMap!11275)

(assert (=> b!913239 (= e!512241 (+!2634 call!40419 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913240 () Bool)

(declare-fun e!512239 () ListLongMap!11275)

(assert (=> b!913240 (= e!512241 e!512239)))

(declare-fun c!95790 () Bool)

(assert (=> b!913240 (= c!95790 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913241 () Bool)

(declare-fun c!95791 () Bool)

(assert (=> b!913241 (= c!95791 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913241 (= e!512239 e!512242)))

(declare-fun b!913242 () Bool)

(declare-fun lt!410681 () Unit!30834)

(assert (=> b!913242 (= e!512235 lt!410681)))

(declare-fun lt!410688 () ListLongMap!11275)

(declare-fun getCurrentListMapNoExtraKeys!3331 (array!54289 array!54287 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 32) Int) ListLongMap!11275)

(assert (=> b!913242 (= lt!410688 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410689 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410689 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410675 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410675 (select (arr!26098 _keys!1386) i!717))))

(declare-fun lt!410687 () Unit!30834)

(declare-fun addStillContains!349 (ListLongMap!11275 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30834)

(assert (=> b!913242 (= lt!410687 (addStillContains!349 lt!410688 lt!410689 zeroValue!1094 lt!410675))))

(assert (=> b!913242 (contains!4657 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094)) lt!410675)))

(declare-fun lt!410682 () Unit!30834)

(assert (=> b!913242 (= lt!410682 lt!410687)))

(declare-fun lt!410690 () ListLongMap!11275)

(assert (=> b!913242 (= lt!410690 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410678 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410678 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410684 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410684 (select (arr!26098 _keys!1386) i!717))))

(declare-fun lt!410683 () Unit!30834)

(declare-fun addApplyDifferent!349 (ListLongMap!11275 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30834)

(assert (=> b!913242 (= lt!410683 (addApplyDifferent!349 lt!410690 lt!410678 minValue!1094 lt!410684))))

(assert (=> b!913242 (= (apply!520 (+!2634 lt!410690 (tuple2!12589 lt!410678 minValue!1094)) lt!410684) (apply!520 lt!410690 lt!410684))))

(declare-fun lt!410691 () Unit!30834)

(assert (=> b!913242 (= lt!410691 lt!410683)))

(declare-fun lt!410677 () ListLongMap!11275)

(assert (=> b!913242 (= lt!410677 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410692 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410680 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410680 (select (arr!26098 _keys!1386) i!717))))

(declare-fun lt!410693 () Unit!30834)

(assert (=> b!913242 (= lt!410693 (addApplyDifferent!349 lt!410677 lt!410692 zeroValue!1094 lt!410680))))

(assert (=> b!913242 (= (apply!520 (+!2634 lt!410677 (tuple2!12589 lt!410692 zeroValue!1094)) lt!410680) (apply!520 lt!410677 lt!410680))))

(declare-fun lt!410673 () Unit!30834)

(assert (=> b!913242 (= lt!410673 lt!410693)))

(declare-fun lt!410686 () ListLongMap!11275)

(assert (=> b!913242 (= lt!410686 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410685 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410694 () (_ BitVec 64))

(assert (=> b!913242 (= lt!410694 (select (arr!26098 _keys!1386) i!717))))

(assert (=> b!913242 (= lt!410681 (addApplyDifferent!349 lt!410686 lt!410685 minValue!1094 lt!410694))))

(assert (=> b!913242 (= (apply!520 (+!2634 lt!410686 (tuple2!12589 lt!410685 minValue!1094)) lt!410694) (apply!520 lt!410686 lt!410694))))

(declare-fun c!95788 () Bool)

(declare-fun bm!40414 () Bool)

(assert (=> bm!40414 (= call!40419 (+!2634 (ite c!95788 call!40416 (ite c!95790 call!40414 call!40417)) (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913243 () Bool)

(assert (=> b!913243 (= e!512239 call!40415)))

(declare-fun bm!40411 () Bool)

(assert (=> bm!40411 (= call!40417 call!40414)))

(declare-fun d!112153 () Bool)

(assert (=> d!112153 e!512233))

(declare-fun res!616065 () Bool)

(assert (=> d!112153 (=> (not res!616065) (not e!512233))))

(assert (=> d!112153 (= res!616065 (or (bvsge i!717 (size!26559 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26559 _keys!1386)))))))

(declare-fun lt!410679 () ListLongMap!11275)

(assert (=> d!112153 (= lt!410676 lt!410679)))

(declare-fun lt!410674 () Unit!30834)

(assert (=> d!112153 (= lt!410674 e!512235)))

(declare-fun c!95789 () Bool)

(assert (=> d!112153 (= c!95789 e!512238)))

(declare-fun res!616061 () Bool)

(assert (=> d!112153 (=> (not res!616061) (not e!512238))))

(assert (=> d!112153 (= res!616061 (bvslt i!717 (size!26559 _keys!1386)))))

(assert (=> d!112153 (= lt!410679 e!512241)))

(assert (=> d!112153 (= c!95788 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112153 (validMask!0 mask!1756)))

(assert (=> d!112153 (= (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!410676)))

(declare-fun bm!40415 () Bool)

(assert (=> bm!40415 (= call!40413 (contains!4657 lt!410676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913244 () Bool)

(declare-fun res!616058 () Bool)

(assert (=> b!913244 (=> (not res!616058) (not e!512233))))

(assert (=> b!913244 (= res!616058 e!512231)))

(declare-fun c!95787 () Bool)

(assert (=> b!913244 (= c!95787 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40416 () Bool)

(assert (=> bm!40416 (= call!40416 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!913245 () Bool)

(declare-fun e!512243 () Bool)

(declare-fun get!13697 (ValueCell!9092 V!30495) V!30495)

(declare-fun dynLambda!1385 (Int (_ BitVec 64)) V!30495)

(assert (=> b!913245 (= e!512243 (= (apply!520 lt!410676 (select (arr!26098 _keys!1386) i!717)) (get!13697 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913245 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _values!1152)))))

(assert (=> b!913245 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26559 _keys!1386)))))

(declare-fun b!913246 () Bool)

(assert (=> b!913246 (= e!512236 e!512243)))

(declare-fun res!616066 () Bool)

(assert (=> b!913246 (=> (not res!616066) (not e!512243))))

(assert (=> b!913246 (= res!616066 (contains!4657 lt!410676 (select (arr!26098 _keys!1386) i!717)))))

(assert (=> b!913246 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26559 _keys!1386)))))

(declare-fun b!913247 () Bool)

(assert (=> b!913247 (= e!512242 call!40415)))

(declare-fun b!913248 () Bool)

(assert (=> b!913248 (= e!512231 (not call!40413))))

(declare-fun b!913249 () Bool)

(assert (=> b!913249 (= e!512232 (validKeyInArray!0 (select (arr!26098 _keys!1386) i!717)))))

(assert (= (and d!112153 c!95788) b!913239))

(assert (= (and d!112153 (not c!95788)) b!913240))

(assert (= (and b!913240 c!95790) b!913243))

(assert (= (and b!913240 (not c!95790)) b!913241))

(assert (= (and b!913241 c!95791) b!913247))

(assert (= (and b!913241 (not c!95791)) b!913236))

(assert (= (or b!913247 b!913236) bm!40411))

(assert (= (or b!913243 bm!40411) bm!40412))

(assert (= (or b!913243 b!913247) bm!40410))

(assert (= (or b!913239 bm!40412) bm!40416))

(assert (= (or b!913239 bm!40410) bm!40414))

(assert (= (and d!112153 res!616061) b!913237))

(assert (= (and d!112153 c!95789) b!913242))

(assert (= (and d!112153 (not c!95789)) b!913231))

(assert (= (and d!112153 res!616065) b!913235))

(assert (= (and b!913235 res!616059) b!913249))

(assert (= (and b!913235 (not res!616060)) b!913246))

(assert (= (and b!913246 res!616066) b!913245))

(assert (= (and b!913235 res!616063) b!913244))

(assert (= (and b!913244 c!95787) b!913233))

(assert (= (and b!913244 (not c!95787)) b!913248))

(assert (= (and b!913233 res!616062) b!913238))

(assert (= (or b!913233 b!913248) bm!40415))

(assert (= (and b!913244 res!616058) b!913229))

(assert (= (and b!913229 c!95786) b!913230))

(assert (= (and b!913229 (not c!95786)) b!913232))

(assert (= (and b!913230 res!616064) b!913234))

(assert (= (or b!913230 b!913232) bm!40413))

(declare-fun b_lambda!13297 () Bool)

(assert (=> (not b_lambda!13297) (not b!913245)))

(declare-fun t!25956 () Bool)

(declare-fun tb!5435 () Bool)

(assert (=> (and start!78240 (= defaultEntry!1160 defaultEntry!1160) t!25956) tb!5435))

(declare-fun result!10685 () Bool)

(assert (=> tb!5435 (= result!10685 tp_is_empty!19147)))

(assert (=> b!913245 t!25956))

(declare-fun b_and!27287 () Bool)

(assert (= b_and!27281 (and (=> t!25956 result!10685) b_and!27287)))

(declare-fun m!846981 () Bool)

(assert (=> bm!40416 m!846981))

(declare-fun m!846983 () Bool)

(assert (=> b!913239 m!846983))

(declare-fun m!846985 () Bool)

(assert (=> b!913234 m!846985))

(declare-fun m!846987 () Bool)

(assert (=> bm!40413 m!846987))

(assert (=> b!913237 m!846887))

(assert (=> b!913237 m!846887))

(declare-fun m!846989 () Bool)

(assert (=> b!913237 m!846989))

(assert (=> b!913249 m!846887))

(assert (=> b!913249 m!846887))

(assert (=> b!913249 m!846989))

(declare-fun m!846991 () Bool)

(assert (=> bm!40414 m!846991))

(assert (=> d!112153 m!846889))

(assert (=> b!913245 m!846887))

(assert (=> b!913245 m!846887))

(declare-fun m!846993 () Bool)

(assert (=> b!913245 m!846993))

(declare-fun m!846995 () Bool)

(assert (=> b!913245 m!846995))

(declare-fun m!846997 () Bool)

(assert (=> b!913245 m!846997))

(assert (=> b!913245 m!846995))

(assert (=> b!913245 m!846997))

(declare-fun m!846999 () Bool)

(assert (=> b!913245 m!846999))

(declare-fun m!847001 () Bool)

(assert (=> bm!40415 m!847001))

(declare-fun m!847003 () Bool)

(assert (=> b!913238 m!847003))

(assert (=> b!913246 m!846887))

(assert (=> b!913246 m!846887))

(declare-fun m!847005 () Bool)

(assert (=> b!913246 m!847005))

(declare-fun m!847007 () Bool)

(assert (=> b!913242 m!847007))

(declare-fun m!847009 () Bool)

(assert (=> b!913242 m!847009))

(declare-fun m!847011 () Bool)

(assert (=> b!913242 m!847011))

(declare-fun m!847013 () Bool)

(assert (=> b!913242 m!847013))

(declare-fun m!847015 () Bool)

(assert (=> b!913242 m!847015))

(declare-fun m!847017 () Bool)

(assert (=> b!913242 m!847017))

(assert (=> b!913242 m!846887))

(assert (=> b!913242 m!847007))

(assert (=> b!913242 m!846981))

(declare-fun m!847019 () Bool)

(assert (=> b!913242 m!847019))

(assert (=> b!913242 m!847011))

(declare-fun m!847021 () Bool)

(assert (=> b!913242 m!847021))

(declare-fun m!847023 () Bool)

(assert (=> b!913242 m!847023))

(declare-fun m!847025 () Bool)

(assert (=> b!913242 m!847025))

(declare-fun m!847027 () Bool)

(assert (=> b!913242 m!847027))

(declare-fun m!847029 () Bool)

(assert (=> b!913242 m!847029))

(declare-fun m!847031 () Bool)

(assert (=> b!913242 m!847031))

(assert (=> b!913242 m!847025))

(declare-fun m!847033 () Bool)

(assert (=> b!913242 m!847033))

(assert (=> b!913242 m!847017))

(declare-fun m!847035 () Bool)

(assert (=> b!913242 m!847035))

(assert (=> b!913081 d!112153))

(declare-fun b!913262 () Bool)

(declare-fun e!512252 () Bool)

(declare-fun e!512253 () Bool)

(assert (=> b!913262 (= e!512252 e!512253)))

(declare-fun c!95794 () Bool)

(assert (=> b!913262 (= c!95794 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913263 () Bool)

(declare-fun e!512255 () Bool)

(declare-fun contains!4660 (List!18369 (_ BitVec 64)) Bool)

(assert (=> b!913263 (= e!512255 (contains!4660 Nil!18366 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913264 () Bool)

(declare-fun call!40422 () Bool)

(assert (=> b!913264 (= e!512253 call!40422)))

(declare-fun b!913265 () Bool)

(declare-fun e!512254 () Bool)

(assert (=> b!913265 (= e!512254 e!512252)))

(declare-fun res!616075 () Bool)

(assert (=> b!913265 (=> (not res!616075) (not e!512252))))

(assert (=> b!913265 (= res!616075 (not e!512255))))

(declare-fun res!616073 () Bool)

(assert (=> b!913265 (=> (not res!616073) (not e!512255))))

(assert (=> b!913265 (= res!616073 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913266 () Bool)

(assert (=> b!913266 (= e!512253 call!40422)))

(declare-fun bm!40419 () Bool)

(assert (=> bm!40419 (= call!40422 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95794 (Cons!18365 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) Nil!18366) Nil!18366)))))

(declare-fun d!112155 () Bool)

(declare-fun res!616074 () Bool)

(assert (=> d!112155 (=> res!616074 e!512254)))

(assert (=> d!112155 (= res!616074 (bvsge #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(assert (=> d!112155 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18366) e!512254)))

(assert (= (and d!112155 (not res!616074)) b!913265))

(assert (= (and b!913265 res!616073) b!913263))

(assert (= (and b!913265 res!616075) b!913262))

(assert (= (and b!913262 c!95794) b!913264))

(assert (= (and b!913262 (not c!95794)) b!913266))

(assert (= (or b!913264 b!913266) bm!40419))

(assert (=> b!913262 m!846957))

(assert (=> b!913262 m!846957))

(assert (=> b!913262 m!846965))

(assert (=> b!913263 m!846957))

(assert (=> b!913263 m!846957))

(declare-fun m!847037 () Bool)

(assert (=> b!913263 m!847037))

(assert (=> b!913265 m!846957))

(assert (=> b!913265 m!846957))

(assert (=> b!913265 m!846965))

(assert (=> bm!40419 m!846957))

(declare-fun m!847039 () Bool)

(assert (=> bm!40419 m!847039))

(assert (=> b!913086 d!112155))

(declare-fun d!112157 () Bool)

(declare-fun e!512257 () Bool)

(assert (=> d!112157 e!512257))

(declare-fun res!616076 () Bool)

(assert (=> d!112157 (=> res!616076 e!512257)))

(declare-fun lt!410697 () Bool)

(assert (=> d!112157 (= res!616076 (not lt!410697))))

(declare-fun lt!410698 () Bool)

(assert (=> d!112157 (= lt!410697 lt!410698)))

(declare-fun lt!410695 () Unit!30834)

(declare-fun e!512256 () Unit!30834)

(assert (=> d!112157 (= lt!410695 e!512256)))

(declare-fun c!95795 () Bool)

(assert (=> d!112157 (= c!95795 lt!410698)))

(assert (=> d!112157 (= lt!410698 (containsKey!442 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112157 (= (contains!4657 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410697)))

(declare-fun b!913267 () Bool)

(declare-fun lt!410696 () Unit!30834)

(assert (=> b!913267 (= e!512256 lt!410696)))

(assert (=> b!913267 (= lt!410696 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> b!913267 (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!913268 () Bool)

(declare-fun Unit!30840 () Unit!30834)

(assert (=> b!913268 (= e!512256 Unit!30840)))

(declare-fun b!913269 () Bool)

(assert (=> b!913269 (= e!512257 (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112157 c!95795) b!913267))

(assert (= (and d!112157 (not c!95795)) b!913268))

(assert (= (and d!112157 (not res!616076)) b!913269))

(declare-fun m!847041 () Bool)

(assert (=> d!112157 m!847041))

(declare-fun m!847043 () Bool)

(assert (=> b!913267 m!847043))

(declare-fun m!847045 () Bool)

(assert (=> b!913267 m!847045))

(assert (=> b!913267 m!847045))

(declare-fun m!847047 () Bool)

(assert (=> b!913267 m!847047))

(assert (=> b!913269 m!847045))

(assert (=> b!913269 m!847045))

(assert (=> b!913269 m!847047))

(assert (=> b!913082 d!112157))

(declare-fun b!913270 () Bool)

(declare-fun e!512260 () Bool)

(declare-fun e!512267 () Bool)

(assert (=> b!913270 (= e!512260 e!512267)))

(declare-fun c!95796 () Bool)

(assert (=> b!913270 (= c!95796 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40420 () Bool)

(declare-fun call!40425 () ListLongMap!11275)

(declare-fun call!40429 () ListLongMap!11275)

(assert (=> bm!40420 (= call!40425 call!40429)))

(declare-fun b!913271 () Bool)

(declare-fun e!512261 () Bool)

(assert (=> b!913271 (= e!512267 e!512261)))

(declare-fun res!616083 () Bool)

(declare-fun call!40428 () Bool)

(assert (=> b!913271 (= res!616083 call!40428)))

(assert (=> b!913271 (=> (not res!616083) (not e!512261))))

(declare-fun b!913272 () Bool)

(declare-fun e!512262 () Unit!30834)

(declare-fun Unit!30841 () Unit!30834)

(assert (=> b!913272 (= e!512262 Unit!30841)))

(declare-fun b!913273 () Bool)

(assert (=> b!913273 (= e!512267 (not call!40428))))

(declare-fun bm!40422 () Bool)

(declare-fun call!40424 () ListLongMap!11275)

(declare-fun call!40426 () ListLongMap!11275)

(assert (=> bm!40422 (= call!40424 call!40426)))

(declare-fun b!913274 () Bool)

(declare-fun e!512258 () Bool)

(declare-fun e!512264 () Bool)

(assert (=> b!913274 (= e!512258 e!512264)))

(declare-fun res!616081 () Bool)

(declare-fun call!40423 () Bool)

(assert (=> b!913274 (= res!616081 call!40423)))

(assert (=> b!913274 (=> (not res!616081) (not e!512264))))

(declare-fun b!913275 () Bool)

(declare-fun lt!410702 () ListLongMap!11275)

(assert (=> b!913275 (= e!512261 (= (apply!520 lt!410702 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913276 () Bool)

(declare-fun res!616082 () Bool)

(assert (=> b!913276 (=> (not res!616082) (not e!512260))))

(declare-fun e!512263 () Bool)

(assert (=> b!913276 (= res!616082 e!512263)))

(declare-fun res!616079 () Bool)

(assert (=> b!913276 (=> res!616079 e!512263)))

(declare-fun e!512259 () Bool)

(assert (=> b!913276 (= res!616079 (not e!512259))))

(declare-fun res!616078 () Bool)

(assert (=> b!913276 (=> (not res!616078) (not e!512259))))

(assert (=> b!913276 (= res!616078 (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(declare-fun b!913277 () Bool)

(declare-fun e!512269 () ListLongMap!11275)

(declare-fun call!40427 () ListLongMap!11275)

(assert (=> b!913277 (= e!512269 call!40427)))

(declare-fun bm!40423 () Bool)

(assert (=> bm!40423 (= call!40428 (contains!4657 lt!410702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913278 () Bool)

(declare-fun e!512265 () Bool)

(assert (=> b!913278 (= e!512265 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913279 () Bool)

(assert (=> b!913279 (= e!512264 (= (apply!520 lt!410702 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!913280 () Bool)

(declare-fun e!512268 () ListLongMap!11275)

(assert (=> b!913280 (= e!512268 (+!2634 call!40429 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913281 () Bool)

(declare-fun e!512266 () ListLongMap!11275)

(assert (=> b!913281 (= e!512268 e!512266)))

(declare-fun c!95800 () Bool)

(assert (=> b!913281 (= c!95800 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913282 () Bool)

(declare-fun c!95801 () Bool)

(assert (=> b!913282 (= c!95801 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913282 (= e!512266 e!512269)))

(declare-fun b!913283 () Bool)

(declare-fun lt!410707 () Unit!30834)

(assert (=> b!913283 (= e!512262 lt!410707)))

(declare-fun lt!410714 () ListLongMap!11275)

(assert (=> b!913283 (= lt!410714 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410715 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410701 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410701 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410713 () Unit!30834)

(assert (=> b!913283 (= lt!410713 (addStillContains!349 lt!410714 lt!410715 zeroValue!1094 lt!410701))))

(assert (=> b!913283 (contains!4657 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094)) lt!410701)))

(declare-fun lt!410708 () Unit!30834)

(assert (=> b!913283 (= lt!410708 lt!410713)))

(declare-fun lt!410716 () ListLongMap!11275)

(assert (=> b!913283 (= lt!410716 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410704 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410704 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410710 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410710 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410709 () Unit!30834)

(assert (=> b!913283 (= lt!410709 (addApplyDifferent!349 lt!410716 lt!410704 minValue!1094 lt!410710))))

(assert (=> b!913283 (= (apply!520 (+!2634 lt!410716 (tuple2!12589 lt!410704 minValue!1094)) lt!410710) (apply!520 lt!410716 lt!410710))))

(declare-fun lt!410717 () Unit!30834)

(assert (=> b!913283 (= lt!410717 lt!410709)))

(declare-fun lt!410703 () ListLongMap!11275)

(assert (=> b!913283 (= lt!410703 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410718 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410718 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410706 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410706 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410719 () Unit!30834)

(assert (=> b!913283 (= lt!410719 (addApplyDifferent!349 lt!410703 lt!410718 zeroValue!1094 lt!410706))))

(assert (=> b!913283 (= (apply!520 (+!2634 lt!410703 (tuple2!12589 lt!410718 zeroValue!1094)) lt!410706) (apply!520 lt!410703 lt!410706))))

(declare-fun lt!410699 () Unit!30834)

(assert (=> b!913283 (= lt!410699 lt!410719)))

(declare-fun lt!410712 () ListLongMap!11275)

(assert (=> b!913283 (= lt!410712 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410711 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410711 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410720 () (_ BitVec 64))

(assert (=> b!913283 (= lt!410720 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913283 (= lt!410707 (addApplyDifferent!349 lt!410712 lt!410711 minValue!1094 lt!410720))))

(assert (=> b!913283 (= (apply!520 (+!2634 lt!410712 (tuple2!12589 lt!410711 minValue!1094)) lt!410720) (apply!520 lt!410712 lt!410720))))

(declare-fun c!95798 () Bool)

(declare-fun bm!40424 () Bool)

(assert (=> bm!40424 (= call!40429 (+!2634 (ite c!95798 call!40426 (ite c!95800 call!40424 call!40427)) (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913284 () Bool)

(assert (=> b!913284 (= e!512266 call!40425)))

(declare-fun bm!40421 () Bool)

(assert (=> bm!40421 (= call!40427 call!40424)))

(declare-fun d!112159 () Bool)

(assert (=> d!112159 e!512260))

(declare-fun res!616084 () Bool)

(assert (=> d!112159 (=> (not res!616084) (not e!512260))))

(assert (=> d!112159 (= res!616084 (or (bvsge #b00000000000000000000000000000000 (size!26559 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))))

(declare-fun lt!410705 () ListLongMap!11275)

(assert (=> d!112159 (= lt!410702 lt!410705)))

(declare-fun lt!410700 () Unit!30834)

(assert (=> d!112159 (= lt!410700 e!512262)))

(declare-fun c!95799 () Bool)

(assert (=> d!112159 (= c!95799 e!512265)))

(declare-fun res!616080 () Bool)

(assert (=> d!112159 (=> (not res!616080) (not e!512265))))

(assert (=> d!112159 (= res!616080 (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(assert (=> d!112159 (= lt!410705 e!512268)))

(assert (=> d!112159 (= c!95798 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112159 (validMask!0 mask!1756)))

(assert (=> d!112159 (= (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410702)))

(declare-fun bm!40425 () Bool)

(assert (=> bm!40425 (= call!40423 (contains!4657 lt!410702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913285 () Bool)

(declare-fun res!616077 () Bool)

(assert (=> b!913285 (=> (not res!616077) (not e!512260))))

(assert (=> b!913285 (= res!616077 e!512258)))

(declare-fun c!95797 () Bool)

(assert (=> b!913285 (= c!95797 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40426 () Bool)

(assert (=> bm!40426 (= call!40426 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun e!512270 () Bool)

(declare-fun b!913286 () Bool)

(assert (=> b!913286 (= e!512270 (= (apply!520 lt!410702 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) (get!13697 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _values!1152)))))

(assert (=> b!913286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(declare-fun b!913287 () Bool)

(assert (=> b!913287 (= e!512263 e!512270)))

(declare-fun res!616085 () Bool)

(assert (=> b!913287 (=> (not res!616085) (not e!512270))))

(assert (=> b!913287 (= res!616085 (contains!4657 lt!410702 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(declare-fun b!913288 () Bool)

(assert (=> b!913288 (= e!512269 call!40425)))

(declare-fun b!913289 () Bool)

(assert (=> b!913289 (= e!512258 (not call!40423))))

(declare-fun b!913290 () Bool)

(assert (=> b!913290 (= e!512259 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112159 c!95798) b!913280))

(assert (= (and d!112159 (not c!95798)) b!913281))

(assert (= (and b!913281 c!95800) b!913284))

(assert (= (and b!913281 (not c!95800)) b!913282))

(assert (= (and b!913282 c!95801) b!913288))

(assert (= (and b!913282 (not c!95801)) b!913277))

(assert (= (or b!913288 b!913277) bm!40421))

(assert (= (or b!913284 bm!40421) bm!40422))

(assert (= (or b!913284 b!913288) bm!40420))

(assert (= (or b!913280 bm!40422) bm!40426))

(assert (= (or b!913280 bm!40420) bm!40424))

(assert (= (and d!112159 res!616080) b!913278))

(assert (= (and d!112159 c!95799) b!913283))

(assert (= (and d!112159 (not c!95799)) b!913272))

(assert (= (and d!112159 res!616084) b!913276))

(assert (= (and b!913276 res!616078) b!913290))

(assert (= (and b!913276 (not res!616079)) b!913287))

(assert (= (and b!913287 res!616085) b!913286))

(assert (= (and b!913276 res!616082) b!913285))

(assert (= (and b!913285 c!95797) b!913274))

(assert (= (and b!913285 (not c!95797)) b!913289))

(assert (= (and b!913274 res!616081) b!913279))

(assert (= (or b!913274 b!913289) bm!40425))

(assert (= (and b!913285 res!616077) b!913270))

(assert (= (and b!913270 c!95796) b!913271))

(assert (= (and b!913270 (not c!95796)) b!913273))

(assert (= (and b!913271 res!616083) b!913275))

(assert (= (or b!913271 b!913273) bm!40423))

(declare-fun b_lambda!13299 () Bool)

(assert (=> (not b_lambda!13299) (not b!913286)))

(assert (=> b!913286 t!25956))

(declare-fun b_and!27289 () Bool)

(assert (= b_and!27287 (and (=> t!25956 result!10685) b_and!27289)))

(declare-fun m!847049 () Bool)

(assert (=> bm!40426 m!847049))

(declare-fun m!847051 () Bool)

(assert (=> b!913280 m!847051))

(declare-fun m!847053 () Bool)

(assert (=> b!913275 m!847053))

(declare-fun m!847055 () Bool)

(assert (=> bm!40423 m!847055))

(assert (=> b!913278 m!846957))

(assert (=> b!913278 m!846957))

(assert (=> b!913278 m!846965))

(assert (=> b!913290 m!846957))

(assert (=> b!913290 m!846957))

(assert (=> b!913290 m!846965))

(declare-fun m!847057 () Bool)

(assert (=> bm!40424 m!847057))

(assert (=> d!112159 m!846889))

(assert (=> b!913286 m!846957))

(assert (=> b!913286 m!846957))

(declare-fun m!847059 () Bool)

(assert (=> b!913286 m!847059))

(declare-fun m!847061 () Bool)

(assert (=> b!913286 m!847061))

(assert (=> b!913286 m!846997))

(assert (=> b!913286 m!847061))

(assert (=> b!913286 m!846997))

(declare-fun m!847063 () Bool)

(assert (=> b!913286 m!847063))

(declare-fun m!847065 () Bool)

(assert (=> bm!40425 m!847065))

(declare-fun m!847067 () Bool)

(assert (=> b!913279 m!847067))

(assert (=> b!913287 m!846957))

(assert (=> b!913287 m!846957))

(declare-fun m!847069 () Bool)

(assert (=> b!913287 m!847069))

(declare-fun m!847071 () Bool)

(assert (=> b!913283 m!847071))

(declare-fun m!847073 () Bool)

(assert (=> b!913283 m!847073))

(declare-fun m!847075 () Bool)

(assert (=> b!913283 m!847075))

(declare-fun m!847077 () Bool)

(assert (=> b!913283 m!847077))

(declare-fun m!847079 () Bool)

(assert (=> b!913283 m!847079))

(declare-fun m!847081 () Bool)

(assert (=> b!913283 m!847081))

(assert (=> b!913283 m!846957))

(assert (=> b!913283 m!847071))

(assert (=> b!913283 m!847049))

(declare-fun m!847083 () Bool)

(assert (=> b!913283 m!847083))

(assert (=> b!913283 m!847075))

(declare-fun m!847085 () Bool)

(assert (=> b!913283 m!847085))

(declare-fun m!847087 () Bool)

(assert (=> b!913283 m!847087))

(declare-fun m!847089 () Bool)

(assert (=> b!913283 m!847089))

(declare-fun m!847091 () Bool)

(assert (=> b!913283 m!847091))

(declare-fun m!847093 () Bool)

(assert (=> b!913283 m!847093))

(declare-fun m!847095 () Bool)

(assert (=> b!913283 m!847095))

(assert (=> b!913283 m!847089))

(declare-fun m!847097 () Bool)

(assert (=> b!913283 m!847097))

(assert (=> b!913283 m!847081))

(declare-fun m!847099 () Bool)

(assert (=> b!913283 m!847099))

(assert (=> b!913082 d!112159))

(declare-fun d!112161 () Bool)

(assert (=> d!112161 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!913087 d!112161))

(declare-fun b!913297 () Bool)

(declare-fun e!512275 () Bool)

(assert (=> b!913297 (= e!512275 tp_is_empty!19147)))

(declare-fun b!913298 () Bool)

(declare-fun e!512276 () Bool)

(assert (=> b!913298 (= e!512276 tp_is_empty!19147)))

(declare-fun mapNonEmpty!30460 () Bool)

(declare-fun mapRes!30460 () Bool)

(declare-fun tp!58483 () Bool)

(assert (=> mapNonEmpty!30460 (= mapRes!30460 (and tp!58483 e!512275))))

(declare-fun mapKey!30460 () (_ BitVec 32))

(declare-fun mapValue!30460 () ValueCell!9092)

(declare-fun mapRest!30460 () (Array (_ BitVec 32) ValueCell!9092))

(assert (=> mapNonEmpty!30460 (= mapRest!30451 (store mapRest!30460 mapKey!30460 mapValue!30460))))

(declare-fun mapIsEmpty!30460 () Bool)

(assert (=> mapIsEmpty!30460 mapRes!30460))

(declare-fun condMapEmpty!30460 () Bool)

(declare-fun mapDefault!30460 () ValueCell!9092)

(assert (=> mapNonEmpty!30451 (= condMapEmpty!30460 (= mapRest!30451 ((as const (Array (_ BitVec 32) ValueCell!9092)) mapDefault!30460)))))

(assert (=> mapNonEmpty!30451 (= tp!58467 (and e!512276 mapRes!30460))))

(assert (= (and mapNonEmpty!30451 condMapEmpty!30460) mapIsEmpty!30460))

(assert (= (and mapNonEmpty!30451 (not condMapEmpty!30460)) mapNonEmpty!30460))

(assert (= (and mapNonEmpty!30460 ((_ is ValueCellFull!9092) mapValue!30460)) b!913297))

(assert (= (and mapNonEmpty!30451 ((_ is ValueCellFull!9092) mapDefault!30460)) b!913298))

(declare-fun m!847101 () Bool)

(assert (=> mapNonEmpty!30460 m!847101))

(declare-fun b_lambda!13301 () Bool)

(assert (= b_lambda!13297 (or (and start!78240 b_free!16729) b_lambda!13301)))

(declare-fun b_lambda!13303 () Bool)

(assert (= b_lambda!13299 (or (and start!78240 b_free!16729) b_lambda!13303)))

(check-sat (not b!913262) (not b!913162) (not b_lambda!13303) (not bm!40413) (not b!913287) (not d!112159) (not bm!40424) (not b!913245) (not d!112157) (not bm!40395) (not bm!40419) (not d!112143) (not b!913265) (not bm!40426) (not b!913237) tp_is_empty!19147 (not b!913263) (not b!913176) (not b!913184) (not bm!40414) (not b!913275) (not bm!40416) (not d!112151) (not b!913279) (not b!913278) (not mapNonEmpty!30460) (not b!913238) (not b!913163) (not b!913280) (not bm!40423) (not b!913234) (not b!913267) (not b_lambda!13301) (not b_next!16729) (not b!913242) (not b!913290) (not b!913239) (not bm!40415) (not b!913249) (not b!913186) (not b!913283) (not b!913269) (not d!112153) (not b!913286) (not bm!40425) (not b!913171) b_and!27289 (not b!913246))
(check-sat b_and!27289 (not b_next!16729))
(get-model)

(declare-fun d!112163 () Bool)

(declare-fun e!512278 () Bool)

(assert (=> d!112163 e!512278))

(declare-fun res!616086 () Bool)

(assert (=> d!112163 (=> res!616086 e!512278)))

(declare-fun lt!410723 () Bool)

(assert (=> d!112163 (= res!616086 (not lt!410723))))

(declare-fun lt!410724 () Bool)

(assert (=> d!112163 (= lt!410723 lt!410724)))

(declare-fun lt!410721 () Unit!30834)

(declare-fun e!512277 () Unit!30834)

(assert (=> d!112163 (= lt!410721 e!512277)))

(declare-fun c!95802 () Bool)

(assert (=> d!112163 (= c!95802 lt!410724)))

(assert (=> d!112163 (= lt!410724 (containsKey!442 (toList!5653 lt!410676) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112163 (= (contains!4657 lt!410676 #b0000000000000000000000000000000000000000000000000000000000000000) lt!410723)))

(declare-fun b!913299 () Bool)

(declare-fun lt!410722 () Unit!30834)

(assert (=> b!913299 (= e!512277 lt!410722)))

(assert (=> b!913299 (= lt!410722 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 lt!410676) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913299 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410676) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913300 () Bool)

(declare-fun Unit!30842 () Unit!30834)

(assert (=> b!913300 (= e!512277 Unit!30842)))

(declare-fun b!913301 () Bool)

(assert (=> b!913301 (= e!512278 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112163 c!95802) b!913299))

(assert (= (and d!112163 (not c!95802)) b!913300))

(assert (= (and d!112163 (not res!616086)) b!913301))

(declare-fun m!847103 () Bool)

(assert (=> d!112163 m!847103))

(declare-fun m!847105 () Bool)

(assert (=> b!913299 m!847105))

(declare-fun m!847107 () Bool)

(assert (=> b!913299 m!847107))

(assert (=> b!913299 m!847107))

(declare-fun m!847109 () Bool)

(assert (=> b!913299 m!847109))

(assert (=> b!913301 m!847107))

(assert (=> b!913301 m!847107))

(assert (=> b!913301 m!847109))

(assert (=> bm!40415 d!112163))

(declare-fun d!112165 () Bool)

(declare-fun e!512281 () Bool)

(assert (=> d!112165 e!512281))

(declare-fun res!616092 () Bool)

(assert (=> d!112165 (=> (not res!616092) (not e!512281))))

(declare-fun lt!410735 () ListLongMap!11275)

(assert (=> d!112165 (= res!616092 (contains!4657 lt!410735 (_1!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!410734 () List!18368)

(assert (=> d!112165 (= lt!410735 (ListLongMap!11276 lt!410734))))

(declare-fun lt!410733 () Unit!30834)

(declare-fun lt!410736 () Unit!30834)

(assert (=> d!112165 (= lt!410733 lt!410736)))

(assert (=> d!112165 (= (getValueByKey!478 lt!410734 (_1!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!483 (_2!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!253 (List!18368 (_ BitVec 64) V!30495) Unit!30834)

(assert (=> d!112165 (= lt!410736 (lemmaContainsTupThenGetReturnValue!253 lt!410734 (_1!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun insertStrictlySorted!310 (List!18368 (_ BitVec 64) V!30495) List!18368)

(assert (=> d!112165 (= lt!410734 (insertStrictlySorted!310 (toList!5653 (ite c!95798 call!40426 (ite c!95800 call!40424 call!40427))) (_1!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112165 (= (+!2634 (ite c!95798 call!40426 (ite c!95800 call!40424 call!40427)) (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!410735)))

(declare-fun b!913306 () Bool)

(declare-fun res!616091 () Bool)

(assert (=> b!913306 (=> (not res!616091) (not e!512281))))

(assert (=> b!913306 (= res!616091 (= (getValueByKey!478 (toList!5653 lt!410735) (_1!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!483 (_2!6305 (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!913307 () Bool)

(declare-fun contains!4661 (List!18368 tuple2!12588) Bool)

(assert (=> b!913307 (= e!512281 (contains!4661 (toList!5653 lt!410735) (ite (or c!95798 c!95800) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112165 res!616092) b!913306))

(assert (= (and b!913306 res!616091) b!913307))

(declare-fun m!847111 () Bool)

(assert (=> d!112165 m!847111))

(declare-fun m!847113 () Bool)

(assert (=> d!112165 m!847113))

(declare-fun m!847115 () Bool)

(assert (=> d!112165 m!847115))

(declare-fun m!847117 () Bool)

(assert (=> d!112165 m!847117))

(declare-fun m!847119 () Bool)

(assert (=> b!913306 m!847119))

(declare-fun m!847121 () Bool)

(assert (=> b!913307 m!847121))

(assert (=> bm!40424 d!112165))

(declare-fun d!112167 () Bool)

(declare-fun lt!410739 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!401 (List!18369) (InoxSet (_ BitVec 64)))

(assert (=> d!112167 (= lt!410739 (select (content!401 Nil!18366) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun e!512286 () Bool)

(assert (=> d!112167 (= lt!410739 e!512286)))

(declare-fun res!616098 () Bool)

(assert (=> d!112167 (=> (not res!616098) (not e!512286))))

(assert (=> d!112167 (= res!616098 ((_ is Cons!18365) Nil!18366))))

(assert (=> d!112167 (= (contains!4660 Nil!18366 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) lt!410739)))

(declare-fun b!913312 () Bool)

(declare-fun e!512287 () Bool)

(assert (=> b!913312 (= e!512286 e!512287)))

(declare-fun res!616097 () Bool)

(assert (=> b!913312 (=> res!616097 e!512287)))

(assert (=> b!913312 (= res!616097 (= (h!19511 Nil!18366) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913313 () Bool)

(assert (=> b!913313 (= e!512287 (contains!4660 (t!25951 Nil!18366) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112167 res!616098) b!913312))

(assert (= (and b!913312 (not res!616097)) b!913313))

(declare-fun m!847123 () Bool)

(assert (=> d!112167 m!847123))

(assert (=> d!112167 m!846957))

(declare-fun m!847125 () Bool)

(assert (=> d!112167 m!847125))

(assert (=> b!913313 m!846957))

(declare-fun m!847127 () Bool)

(assert (=> b!913313 m!847127))

(assert (=> b!913263 d!112167))

(declare-fun d!112169 () Bool)

(declare-fun isEmpty!697 (Option!484) Bool)

(assert (=> d!112169 (= (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)) (not (isEmpty!697 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25652 () Bool)

(assert (= bs!25652 d!112169))

(assert (=> bs!25652 m!847045))

(declare-fun m!847129 () Bool)

(assert (=> bs!25652 m!847129))

(assert (=> b!913269 d!112169))

(declare-fun e!512293 () Option!484)

(declare-fun b!913324 () Bool)

(assert (=> b!913324 (= e!512293 (getValueByKey!478 (t!25950 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(declare-fun b!913325 () Bool)

(assert (=> b!913325 (= e!512293 None!482)))

(declare-fun d!112171 () Bool)

(declare-fun c!95807 () Bool)

(assert (=> d!112171 (= c!95807 (and ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun e!512292 () Option!484)

(assert (=> d!112171 (= (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512292)))

(declare-fun b!913323 () Bool)

(assert (=> b!913323 (= e!512292 e!512293)))

(declare-fun c!95808 () Bool)

(assert (=> b!913323 (= c!95808 (and ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (not (= (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033))))))

(declare-fun b!913322 () Bool)

(assert (=> b!913322 (= e!512292 (Some!483 (_2!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))))

(assert (= (and d!112171 c!95807) b!913322))

(assert (= (and d!112171 (not c!95807)) b!913323))

(assert (= (and b!913323 c!95808) b!913324))

(assert (= (and b!913323 (not c!95808)) b!913325))

(declare-fun m!847131 () Bool)

(assert (=> b!913324 m!847131))

(assert (=> b!913269 d!112171))

(declare-fun d!112173 () Bool)

(assert (=> d!112173 (= (apply!520 (+!2634 lt!410703 (tuple2!12589 lt!410718 zeroValue!1094)) lt!410706) (apply!520 lt!410703 lt!410706))))

(declare-fun lt!410742 () Unit!30834)

(declare-fun choose!1541 (ListLongMap!11275 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30834)

(assert (=> d!112173 (= lt!410742 (choose!1541 lt!410703 lt!410718 zeroValue!1094 lt!410706))))

(declare-fun e!512296 () Bool)

(assert (=> d!112173 e!512296))

(declare-fun res!616101 () Bool)

(assert (=> d!112173 (=> (not res!616101) (not e!512296))))

(assert (=> d!112173 (= res!616101 (contains!4657 lt!410703 lt!410706))))

(assert (=> d!112173 (= (addApplyDifferent!349 lt!410703 lt!410718 zeroValue!1094 lt!410706) lt!410742)))

(declare-fun b!913329 () Bool)

(assert (=> b!913329 (= e!512296 (not (= lt!410706 lt!410718)))))

(assert (= (and d!112173 res!616101) b!913329))

(assert (=> d!112173 m!847089))

(assert (=> d!112173 m!847091))

(assert (=> d!112173 m!847087))

(declare-fun m!847133 () Bool)

(assert (=> d!112173 m!847133))

(declare-fun m!847135 () Bool)

(assert (=> d!112173 m!847135))

(assert (=> d!112173 m!847089))

(assert (=> b!913283 d!112173))

(declare-fun d!112175 () Bool)

(declare-fun get!13698 (Option!484) V!30495)

(assert (=> d!112175 (= (apply!520 lt!410712 lt!410720) (get!13698 (getValueByKey!478 (toList!5653 lt!410712) lt!410720)))))

(declare-fun bs!25653 () Bool)

(assert (= bs!25653 d!112175))

(declare-fun m!847137 () Bool)

(assert (=> bs!25653 m!847137))

(assert (=> bs!25653 m!847137))

(declare-fun m!847139 () Bool)

(assert (=> bs!25653 m!847139))

(assert (=> b!913283 d!112175))

(declare-fun d!112177 () Bool)

(declare-fun e!512298 () Bool)

(assert (=> d!112177 e!512298))

(declare-fun res!616102 () Bool)

(assert (=> d!112177 (=> res!616102 e!512298)))

(declare-fun lt!410745 () Bool)

(assert (=> d!112177 (= res!616102 (not lt!410745))))

(declare-fun lt!410746 () Bool)

(assert (=> d!112177 (= lt!410745 lt!410746)))

(declare-fun lt!410743 () Unit!30834)

(declare-fun e!512297 () Unit!30834)

(assert (=> d!112177 (= lt!410743 e!512297)))

(declare-fun c!95809 () Bool)

(assert (=> d!112177 (= c!95809 lt!410746)))

(assert (=> d!112177 (= lt!410746 (containsKey!442 (toList!5653 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094))) lt!410701))))

(assert (=> d!112177 (= (contains!4657 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094)) lt!410701) lt!410745)))

(declare-fun b!913330 () Bool)

(declare-fun lt!410744 () Unit!30834)

(assert (=> b!913330 (= e!512297 lt!410744)))

(assert (=> b!913330 (= lt!410744 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094))) lt!410701))))

(assert (=> b!913330 (isDefined!350 (getValueByKey!478 (toList!5653 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094))) lt!410701))))

(declare-fun b!913331 () Bool)

(declare-fun Unit!30843 () Unit!30834)

(assert (=> b!913331 (= e!512297 Unit!30843)))

(declare-fun b!913332 () Bool)

(assert (=> b!913332 (= e!512298 (isDefined!350 (getValueByKey!478 (toList!5653 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094))) lt!410701)))))

(assert (= (and d!112177 c!95809) b!913330))

(assert (= (and d!112177 (not c!95809)) b!913331))

(assert (= (and d!112177 (not res!616102)) b!913332))

(declare-fun m!847141 () Bool)

(assert (=> d!112177 m!847141))

(declare-fun m!847143 () Bool)

(assert (=> b!913330 m!847143))

(declare-fun m!847145 () Bool)

(assert (=> b!913330 m!847145))

(assert (=> b!913330 m!847145))

(declare-fun m!847147 () Bool)

(assert (=> b!913330 m!847147))

(assert (=> b!913332 m!847145))

(assert (=> b!913332 m!847145))

(assert (=> b!913332 m!847147))

(assert (=> b!913283 d!112177))

(declare-fun d!112179 () Bool)

(assert (=> d!112179 (= (apply!520 (+!2634 lt!410716 (tuple2!12589 lt!410704 minValue!1094)) lt!410710) (get!13698 (getValueByKey!478 (toList!5653 (+!2634 lt!410716 (tuple2!12589 lt!410704 minValue!1094))) lt!410710)))))

(declare-fun bs!25654 () Bool)

(assert (= bs!25654 d!112179))

(declare-fun m!847149 () Bool)

(assert (=> bs!25654 m!847149))

(assert (=> bs!25654 m!847149))

(declare-fun m!847151 () Bool)

(assert (=> bs!25654 m!847151))

(assert (=> b!913283 d!112179))

(declare-fun d!112181 () Bool)

(assert (=> d!112181 (= (apply!520 lt!410716 lt!410710) (get!13698 (getValueByKey!478 (toList!5653 lt!410716) lt!410710)))))

(declare-fun bs!25655 () Bool)

(assert (= bs!25655 d!112181))

(declare-fun m!847153 () Bool)

(assert (=> bs!25655 m!847153))

(assert (=> bs!25655 m!847153))

(declare-fun m!847155 () Bool)

(assert (=> bs!25655 m!847155))

(assert (=> b!913283 d!112181))

(declare-fun d!112183 () Bool)

(declare-fun e!512299 () Bool)

(assert (=> d!112183 e!512299))

(declare-fun res!616104 () Bool)

(assert (=> d!112183 (=> (not res!616104) (not e!512299))))

(declare-fun lt!410749 () ListLongMap!11275)

(assert (=> d!112183 (= res!616104 (contains!4657 lt!410749 (_1!6305 (tuple2!12589 lt!410715 zeroValue!1094))))))

(declare-fun lt!410748 () List!18368)

(assert (=> d!112183 (= lt!410749 (ListLongMap!11276 lt!410748))))

(declare-fun lt!410747 () Unit!30834)

(declare-fun lt!410750 () Unit!30834)

(assert (=> d!112183 (= lt!410747 lt!410750)))

(assert (=> d!112183 (= (getValueByKey!478 lt!410748 (_1!6305 (tuple2!12589 lt!410715 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410715 zeroValue!1094))))))

(assert (=> d!112183 (= lt!410750 (lemmaContainsTupThenGetReturnValue!253 lt!410748 (_1!6305 (tuple2!12589 lt!410715 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410715 zeroValue!1094))))))

(assert (=> d!112183 (= lt!410748 (insertStrictlySorted!310 (toList!5653 lt!410714) (_1!6305 (tuple2!12589 lt!410715 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410715 zeroValue!1094))))))

(assert (=> d!112183 (= (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094)) lt!410749)))

(declare-fun b!913333 () Bool)

(declare-fun res!616103 () Bool)

(assert (=> b!913333 (=> (not res!616103) (not e!512299))))

(assert (=> b!913333 (= res!616103 (= (getValueByKey!478 (toList!5653 lt!410749) (_1!6305 (tuple2!12589 lt!410715 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410715 zeroValue!1094)))))))

(declare-fun b!913334 () Bool)

(assert (=> b!913334 (= e!512299 (contains!4661 (toList!5653 lt!410749) (tuple2!12589 lt!410715 zeroValue!1094)))))

(assert (= (and d!112183 res!616104) b!913333))

(assert (= (and b!913333 res!616103) b!913334))

(declare-fun m!847157 () Bool)

(assert (=> d!112183 m!847157))

(declare-fun m!847159 () Bool)

(assert (=> d!112183 m!847159))

(declare-fun m!847161 () Bool)

(assert (=> d!112183 m!847161))

(declare-fun m!847163 () Bool)

(assert (=> d!112183 m!847163))

(declare-fun m!847165 () Bool)

(assert (=> b!913333 m!847165))

(declare-fun m!847167 () Bool)

(assert (=> b!913334 m!847167))

(assert (=> b!913283 d!112183))

(declare-fun d!112185 () Bool)

(declare-fun e!512300 () Bool)

(assert (=> d!112185 e!512300))

(declare-fun res!616106 () Bool)

(assert (=> d!112185 (=> (not res!616106) (not e!512300))))

(declare-fun lt!410753 () ListLongMap!11275)

(assert (=> d!112185 (= res!616106 (contains!4657 lt!410753 (_1!6305 (tuple2!12589 lt!410711 minValue!1094))))))

(declare-fun lt!410752 () List!18368)

(assert (=> d!112185 (= lt!410753 (ListLongMap!11276 lt!410752))))

(declare-fun lt!410751 () Unit!30834)

(declare-fun lt!410754 () Unit!30834)

(assert (=> d!112185 (= lt!410751 lt!410754)))

(assert (=> d!112185 (= (getValueByKey!478 lt!410752 (_1!6305 (tuple2!12589 lt!410711 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410711 minValue!1094))))))

(assert (=> d!112185 (= lt!410754 (lemmaContainsTupThenGetReturnValue!253 lt!410752 (_1!6305 (tuple2!12589 lt!410711 minValue!1094)) (_2!6305 (tuple2!12589 lt!410711 minValue!1094))))))

(assert (=> d!112185 (= lt!410752 (insertStrictlySorted!310 (toList!5653 lt!410712) (_1!6305 (tuple2!12589 lt!410711 minValue!1094)) (_2!6305 (tuple2!12589 lt!410711 minValue!1094))))))

(assert (=> d!112185 (= (+!2634 lt!410712 (tuple2!12589 lt!410711 minValue!1094)) lt!410753)))

(declare-fun b!913335 () Bool)

(declare-fun res!616105 () Bool)

(assert (=> b!913335 (=> (not res!616105) (not e!512300))))

(assert (=> b!913335 (= res!616105 (= (getValueByKey!478 (toList!5653 lt!410753) (_1!6305 (tuple2!12589 lt!410711 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410711 minValue!1094)))))))

(declare-fun b!913336 () Bool)

(assert (=> b!913336 (= e!512300 (contains!4661 (toList!5653 lt!410753) (tuple2!12589 lt!410711 minValue!1094)))))

(assert (= (and d!112185 res!616106) b!913335))

(assert (= (and b!913335 res!616105) b!913336))

(declare-fun m!847169 () Bool)

(assert (=> d!112185 m!847169))

(declare-fun m!847171 () Bool)

(assert (=> d!112185 m!847171))

(declare-fun m!847173 () Bool)

(assert (=> d!112185 m!847173))

(declare-fun m!847175 () Bool)

(assert (=> d!112185 m!847175))

(declare-fun m!847177 () Bool)

(assert (=> b!913335 m!847177))

(declare-fun m!847179 () Bool)

(assert (=> b!913336 m!847179))

(assert (=> b!913283 d!112185))

(declare-fun d!112187 () Bool)

(declare-fun e!512301 () Bool)

(assert (=> d!112187 e!512301))

(declare-fun res!616108 () Bool)

(assert (=> d!112187 (=> (not res!616108) (not e!512301))))

(declare-fun lt!410757 () ListLongMap!11275)

(assert (=> d!112187 (= res!616108 (contains!4657 lt!410757 (_1!6305 (tuple2!12589 lt!410718 zeroValue!1094))))))

(declare-fun lt!410756 () List!18368)

(assert (=> d!112187 (= lt!410757 (ListLongMap!11276 lt!410756))))

(declare-fun lt!410755 () Unit!30834)

(declare-fun lt!410758 () Unit!30834)

(assert (=> d!112187 (= lt!410755 lt!410758)))

(assert (=> d!112187 (= (getValueByKey!478 lt!410756 (_1!6305 (tuple2!12589 lt!410718 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410718 zeroValue!1094))))))

(assert (=> d!112187 (= lt!410758 (lemmaContainsTupThenGetReturnValue!253 lt!410756 (_1!6305 (tuple2!12589 lt!410718 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410718 zeroValue!1094))))))

(assert (=> d!112187 (= lt!410756 (insertStrictlySorted!310 (toList!5653 lt!410703) (_1!6305 (tuple2!12589 lt!410718 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410718 zeroValue!1094))))))

(assert (=> d!112187 (= (+!2634 lt!410703 (tuple2!12589 lt!410718 zeroValue!1094)) lt!410757)))

(declare-fun b!913337 () Bool)

(declare-fun res!616107 () Bool)

(assert (=> b!913337 (=> (not res!616107) (not e!512301))))

(assert (=> b!913337 (= res!616107 (= (getValueByKey!478 (toList!5653 lt!410757) (_1!6305 (tuple2!12589 lt!410718 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410718 zeroValue!1094)))))))

(declare-fun b!913338 () Bool)

(assert (=> b!913338 (= e!512301 (contains!4661 (toList!5653 lt!410757) (tuple2!12589 lt!410718 zeroValue!1094)))))

(assert (= (and d!112187 res!616108) b!913337))

(assert (= (and b!913337 res!616107) b!913338))

(declare-fun m!847181 () Bool)

(assert (=> d!112187 m!847181))

(declare-fun m!847183 () Bool)

(assert (=> d!112187 m!847183))

(declare-fun m!847185 () Bool)

(assert (=> d!112187 m!847185))

(declare-fun m!847187 () Bool)

(assert (=> d!112187 m!847187))

(declare-fun m!847189 () Bool)

(assert (=> b!913337 m!847189))

(declare-fun m!847191 () Bool)

(assert (=> b!913338 m!847191))

(assert (=> b!913283 d!112187))

(declare-fun d!112189 () Bool)

(assert (=> d!112189 (= (apply!520 (+!2634 lt!410716 (tuple2!12589 lt!410704 minValue!1094)) lt!410710) (apply!520 lt!410716 lt!410710))))

(declare-fun lt!410759 () Unit!30834)

(assert (=> d!112189 (= lt!410759 (choose!1541 lt!410716 lt!410704 minValue!1094 lt!410710))))

(declare-fun e!512302 () Bool)

(assert (=> d!112189 e!512302))

(declare-fun res!616109 () Bool)

(assert (=> d!112189 (=> (not res!616109) (not e!512302))))

(assert (=> d!112189 (= res!616109 (contains!4657 lt!410716 lt!410710))))

(assert (=> d!112189 (= (addApplyDifferent!349 lt!410716 lt!410704 minValue!1094 lt!410710) lt!410759)))

(declare-fun b!913339 () Bool)

(assert (=> b!913339 (= e!512302 (not (= lt!410710 lt!410704)))))

(assert (= (and d!112189 res!616109) b!913339))

(assert (=> d!112189 m!847081))

(assert (=> d!112189 m!847099))

(assert (=> d!112189 m!847097))

(declare-fun m!847193 () Bool)

(assert (=> d!112189 m!847193))

(declare-fun m!847195 () Bool)

(assert (=> d!112189 m!847195))

(assert (=> d!112189 m!847081))

(assert (=> b!913283 d!112189))

(declare-fun d!112191 () Bool)

(assert (=> d!112191 (= (apply!520 (+!2634 lt!410712 (tuple2!12589 lt!410711 minValue!1094)) lt!410720) (apply!520 lt!410712 lt!410720))))

(declare-fun lt!410760 () Unit!30834)

(assert (=> d!112191 (= lt!410760 (choose!1541 lt!410712 lt!410711 minValue!1094 lt!410720))))

(declare-fun e!512303 () Bool)

(assert (=> d!112191 e!512303))

(declare-fun res!616110 () Bool)

(assert (=> d!112191 (=> (not res!616110) (not e!512303))))

(assert (=> d!112191 (= res!616110 (contains!4657 lt!410712 lt!410720))))

(assert (=> d!112191 (= (addApplyDifferent!349 lt!410712 lt!410711 minValue!1094 lt!410720) lt!410760)))

(declare-fun b!913340 () Bool)

(assert (=> b!913340 (= e!512303 (not (= lt!410720 lt!410711)))))

(assert (= (and d!112191 res!616110) b!913340))

(assert (=> d!112191 m!847071))

(assert (=> d!112191 m!847073))

(assert (=> d!112191 m!847085))

(declare-fun m!847197 () Bool)

(assert (=> d!112191 m!847197))

(declare-fun m!847199 () Bool)

(assert (=> d!112191 m!847199))

(assert (=> d!112191 m!847071))

(assert (=> b!913283 d!112191))

(declare-fun d!112193 () Bool)

(assert (=> d!112193 (= (apply!520 (+!2634 lt!410712 (tuple2!12589 lt!410711 minValue!1094)) lt!410720) (get!13698 (getValueByKey!478 (toList!5653 (+!2634 lt!410712 (tuple2!12589 lt!410711 minValue!1094))) lt!410720)))))

(declare-fun bs!25656 () Bool)

(assert (= bs!25656 d!112193))

(declare-fun m!847201 () Bool)

(assert (=> bs!25656 m!847201))

(assert (=> bs!25656 m!847201))

(declare-fun m!847203 () Bool)

(assert (=> bs!25656 m!847203))

(assert (=> b!913283 d!112193))

(declare-fun d!112195 () Bool)

(assert (=> d!112195 (contains!4657 (+!2634 lt!410714 (tuple2!12589 lt!410715 zeroValue!1094)) lt!410701)))

(declare-fun lt!410763 () Unit!30834)

(declare-fun choose!1542 (ListLongMap!11275 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30834)

(assert (=> d!112195 (= lt!410763 (choose!1542 lt!410714 lt!410715 zeroValue!1094 lt!410701))))

(assert (=> d!112195 (contains!4657 lt!410714 lt!410701)))

(assert (=> d!112195 (= (addStillContains!349 lt!410714 lt!410715 zeroValue!1094 lt!410701) lt!410763)))

(declare-fun bs!25657 () Bool)

(assert (= bs!25657 d!112195))

(assert (=> bs!25657 m!847075))

(assert (=> bs!25657 m!847075))

(assert (=> bs!25657 m!847077))

(declare-fun m!847205 () Bool)

(assert (=> bs!25657 m!847205))

(declare-fun m!847207 () Bool)

(assert (=> bs!25657 m!847207))

(assert (=> b!913283 d!112195))

(declare-fun d!112197 () Bool)

(assert (=> d!112197 (= (apply!520 (+!2634 lt!410703 (tuple2!12589 lt!410718 zeroValue!1094)) lt!410706) (get!13698 (getValueByKey!478 (toList!5653 (+!2634 lt!410703 (tuple2!12589 lt!410718 zeroValue!1094))) lt!410706)))))

(declare-fun bs!25658 () Bool)

(assert (= bs!25658 d!112197))

(declare-fun m!847209 () Bool)

(assert (=> bs!25658 m!847209))

(assert (=> bs!25658 m!847209))

(declare-fun m!847211 () Bool)

(assert (=> bs!25658 m!847211))

(assert (=> b!913283 d!112197))

(declare-fun b!913366 () Bool)

(declare-fun e!512323 () ListLongMap!11275)

(declare-fun call!40432 () ListLongMap!11275)

(assert (=> b!913366 (= e!512323 call!40432)))

(declare-fun b!913367 () Bool)

(declare-fun e!512322 () Bool)

(declare-fun e!512320 () Bool)

(assert (=> b!913367 (= e!512322 e!512320)))

(assert (=> b!913367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(declare-fun res!616121 () Bool)

(declare-fun lt!410779 () ListLongMap!11275)

(assert (=> b!913367 (= res!616121 (contains!4657 lt!410779 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913367 (=> (not res!616121) (not e!512320))))

(declare-fun b!913368 () Bool)

(declare-fun res!616122 () Bool)

(declare-fun e!512321 () Bool)

(assert (=> b!913368 (=> (not res!616122) (not e!512321))))

(assert (=> b!913368 (= res!616122 (not (contains!4657 lt!410779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913369 () Bool)

(assert (=> b!913369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(assert (=> b!913369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _values!1152)))))

(assert (=> b!913369 (= e!512320 (= (apply!520 lt!410779 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) (get!13697 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913370 () Bool)

(declare-fun e!512324 () Bool)

(declare-fun isEmpty!698 (ListLongMap!11275) Bool)

(assert (=> b!913370 (= e!512324 (isEmpty!698 lt!410779))))

(declare-fun b!913371 () Bool)

(assert (=> b!913371 (= e!512321 e!512322)))

(declare-fun c!95819 () Bool)

(declare-fun e!512319 () Bool)

(assert (=> b!913371 (= c!95819 e!512319)))

(declare-fun res!616119 () Bool)

(assert (=> b!913371 (=> (not res!616119) (not e!512319))))

(assert (=> b!913371 (= res!616119 (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(declare-fun b!913372 () Bool)

(assert (=> b!913372 (= e!512324 (= lt!410779 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!913373 () Bool)

(assert (=> b!913373 (= e!512319 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913373 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!112199 () Bool)

(assert (=> d!112199 e!512321))

(declare-fun res!616120 () Bool)

(assert (=> d!112199 (=> (not res!616120) (not e!512321))))

(assert (=> d!112199 (= res!616120 (not (contains!4657 lt!410779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!512318 () ListLongMap!11275)

(assert (=> d!112199 (= lt!410779 e!512318)))

(declare-fun c!95818 () Bool)

(assert (=> d!112199 (= c!95818 (bvsge #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(assert (=> d!112199 (validMask!0 mask!1756)))

(assert (=> d!112199 (= (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410779)))

(declare-fun b!913374 () Bool)

(declare-fun lt!410780 () Unit!30834)

(declare-fun lt!410781 () Unit!30834)

(assert (=> b!913374 (= lt!410780 lt!410781)))

(declare-fun lt!410784 () ListLongMap!11275)

(declare-fun lt!410782 () V!30495)

(declare-fun lt!410783 () (_ BitVec 64))

(declare-fun lt!410778 () (_ BitVec 64))

(assert (=> b!913374 (not (contains!4657 (+!2634 lt!410784 (tuple2!12589 lt!410783 lt!410782)) lt!410778))))

(declare-fun addStillNotContains!219 (ListLongMap!11275 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30834)

(assert (=> b!913374 (= lt!410781 (addStillNotContains!219 lt!410784 lt!410783 lt!410782 lt!410778))))

(assert (=> b!913374 (= lt!410778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!913374 (= lt!410782 (get!13697 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!913374 (= lt!410783 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913374 (= lt!410784 call!40432)))

(assert (=> b!913374 (= e!512323 (+!2634 call!40432 (tuple2!12589 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) (get!13697 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!40429 () Bool)

(assert (=> bm!40429 (= call!40432 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!913375 () Bool)

(assert (=> b!913375 (= e!512322 e!512324)))

(declare-fun c!95820 () Bool)

(assert (=> b!913375 (= c!95820 (bvslt #b00000000000000000000000000000000 (size!26559 _keys!1386)))))

(declare-fun b!913376 () Bool)

(assert (=> b!913376 (= e!512318 e!512323)))

(declare-fun c!95821 () Bool)

(assert (=> b!913376 (= c!95821 (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913377 () Bool)

(assert (=> b!913377 (= e!512318 (ListLongMap!11276 Nil!18365))))

(assert (= (and d!112199 c!95818) b!913377))

(assert (= (and d!112199 (not c!95818)) b!913376))

(assert (= (and b!913376 c!95821) b!913374))

(assert (= (and b!913376 (not c!95821)) b!913366))

(assert (= (or b!913374 b!913366) bm!40429))

(assert (= (and d!112199 res!616120) b!913368))

(assert (= (and b!913368 res!616122) b!913371))

(assert (= (and b!913371 res!616119) b!913373))

(assert (= (and b!913371 c!95819) b!913367))

(assert (= (and b!913371 (not c!95819)) b!913375))

(assert (= (and b!913367 res!616121) b!913369))

(assert (= (and b!913375 c!95820) b!913372))

(assert (= (and b!913375 (not c!95820)) b!913370))

(declare-fun b_lambda!13305 () Bool)

(assert (=> (not b_lambda!13305) (not b!913369)))

(assert (=> b!913369 t!25956))

(declare-fun b_and!27291 () Bool)

(assert (= b_and!27289 (and (=> t!25956 result!10685) b_and!27291)))

(declare-fun b_lambda!13307 () Bool)

(assert (=> (not b_lambda!13307) (not b!913374)))

(assert (=> b!913374 t!25956))

(declare-fun b_and!27293 () Bool)

(assert (= b_and!27291 (and (=> t!25956 result!10685) b_and!27293)))

(assert (=> b!913373 m!846957))

(assert (=> b!913373 m!846957))

(assert (=> b!913373 m!846965))

(declare-fun m!847213 () Bool)

(assert (=> bm!40429 m!847213))

(assert (=> b!913369 m!847061))

(assert (=> b!913369 m!846997))

(assert (=> b!913369 m!847063))

(assert (=> b!913369 m!846997))

(assert (=> b!913369 m!847061))

(assert (=> b!913369 m!846957))

(declare-fun m!847215 () Bool)

(assert (=> b!913369 m!847215))

(assert (=> b!913369 m!846957))

(assert (=> b!913376 m!846957))

(assert (=> b!913376 m!846957))

(assert (=> b!913376 m!846965))

(assert (=> b!913374 m!847061))

(assert (=> b!913374 m!846997))

(assert (=> b!913374 m!847063))

(assert (=> b!913374 m!846997))

(assert (=> b!913374 m!847061))

(declare-fun m!847217 () Bool)

(assert (=> b!913374 m!847217))

(declare-fun m!847219 () Bool)

(assert (=> b!913374 m!847219))

(declare-fun m!847221 () Bool)

(assert (=> b!913374 m!847221))

(assert (=> b!913374 m!846957))

(assert (=> b!913374 m!847217))

(declare-fun m!847223 () Bool)

(assert (=> b!913374 m!847223))

(declare-fun m!847225 () Bool)

(assert (=> b!913368 m!847225))

(assert (=> b!913367 m!846957))

(assert (=> b!913367 m!846957))

(declare-fun m!847227 () Bool)

(assert (=> b!913367 m!847227))

(assert (=> b!913372 m!847213))

(declare-fun m!847229 () Bool)

(assert (=> b!913370 m!847229))

(declare-fun m!847231 () Bool)

(assert (=> d!112199 m!847231))

(assert (=> d!112199 m!846889))

(assert (=> b!913283 d!112199))

(declare-fun d!112201 () Bool)

(assert (=> d!112201 (= (apply!520 lt!410703 lt!410706) (get!13698 (getValueByKey!478 (toList!5653 lt!410703) lt!410706)))))

(declare-fun bs!25659 () Bool)

(assert (= bs!25659 d!112201))

(declare-fun m!847233 () Bool)

(assert (=> bs!25659 m!847233))

(assert (=> bs!25659 m!847233))

(declare-fun m!847235 () Bool)

(assert (=> bs!25659 m!847235))

(assert (=> b!913283 d!112201))

(declare-fun d!112203 () Bool)

(declare-fun e!512325 () Bool)

(assert (=> d!112203 e!512325))

(declare-fun res!616124 () Bool)

(assert (=> d!112203 (=> (not res!616124) (not e!512325))))

(declare-fun lt!410787 () ListLongMap!11275)

(assert (=> d!112203 (= res!616124 (contains!4657 lt!410787 (_1!6305 (tuple2!12589 lt!410704 minValue!1094))))))

(declare-fun lt!410786 () List!18368)

(assert (=> d!112203 (= lt!410787 (ListLongMap!11276 lt!410786))))

(declare-fun lt!410785 () Unit!30834)

(declare-fun lt!410788 () Unit!30834)

(assert (=> d!112203 (= lt!410785 lt!410788)))

(assert (=> d!112203 (= (getValueByKey!478 lt!410786 (_1!6305 (tuple2!12589 lt!410704 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410704 minValue!1094))))))

(assert (=> d!112203 (= lt!410788 (lemmaContainsTupThenGetReturnValue!253 lt!410786 (_1!6305 (tuple2!12589 lt!410704 minValue!1094)) (_2!6305 (tuple2!12589 lt!410704 minValue!1094))))))

(assert (=> d!112203 (= lt!410786 (insertStrictlySorted!310 (toList!5653 lt!410716) (_1!6305 (tuple2!12589 lt!410704 minValue!1094)) (_2!6305 (tuple2!12589 lt!410704 minValue!1094))))))

(assert (=> d!112203 (= (+!2634 lt!410716 (tuple2!12589 lt!410704 minValue!1094)) lt!410787)))

(declare-fun b!913378 () Bool)

(declare-fun res!616123 () Bool)

(assert (=> b!913378 (=> (not res!616123) (not e!512325))))

(assert (=> b!913378 (= res!616123 (= (getValueByKey!478 (toList!5653 lt!410787) (_1!6305 (tuple2!12589 lt!410704 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410704 minValue!1094)))))))

(declare-fun b!913379 () Bool)

(assert (=> b!913379 (= e!512325 (contains!4661 (toList!5653 lt!410787) (tuple2!12589 lt!410704 minValue!1094)))))

(assert (= (and d!112203 res!616124) b!913378))

(assert (= (and b!913378 res!616123) b!913379))

(declare-fun m!847237 () Bool)

(assert (=> d!112203 m!847237))

(declare-fun m!847239 () Bool)

(assert (=> d!112203 m!847239))

(declare-fun m!847241 () Bool)

(assert (=> d!112203 m!847241))

(declare-fun m!847243 () Bool)

(assert (=> d!112203 m!847243))

(declare-fun m!847245 () Bool)

(assert (=> b!913378 m!847245))

(declare-fun m!847247 () Bool)

(assert (=> b!913379 m!847247))

(assert (=> b!913283 d!112203))

(declare-fun d!112205 () Bool)

(assert (=> d!112205 (= (validKeyInArray!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) (and (not (= (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913262 d!112205))

(declare-fun d!112207 () Bool)

(declare-fun e!512326 () Bool)

(assert (=> d!112207 e!512326))

(declare-fun res!616126 () Bool)

(assert (=> d!112207 (=> (not res!616126) (not e!512326))))

(declare-fun lt!410791 () ListLongMap!11275)

(assert (=> d!112207 (= res!616126 (contains!4657 lt!410791 (_1!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!410790 () List!18368)

(assert (=> d!112207 (= lt!410791 (ListLongMap!11276 lt!410790))))

(declare-fun lt!410789 () Unit!30834)

(declare-fun lt!410792 () Unit!30834)

(assert (=> d!112207 (= lt!410789 lt!410792)))

(assert (=> d!112207 (= (getValueByKey!478 lt!410790 (_1!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!483 (_2!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112207 (= lt!410792 (lemmaContainsTupThenGetReturnValue!253 lt!410790 (_1!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112207 (= lt!410790 (insertStrictlySorted!310 (toList!5653 (ite c!95788 call!40416 (ite c!95790 call!40414 call!40417))) (_1!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112207 (= (+!2634 (ite c!95788 call!40416 (ite c!95790 call!40414 call!40417)) (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!410791)))

(declare-fun b!913380 () Bool)

(declare-fun res!616125 () Bool)

(assert (=> b!913380 (=> (not res!616125) (not e!512326))))

(assert (=> b!913380 (= res!616125 (= (getValueByKey!478 (toList!5653 lt!410791) (_1!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!483 (_2!6305 (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!913381 () Bool)

(assert (=> b!913381 (= e!512326 (contains!4661 (toList!5653 lt!410791) (ite (or c!95788 c!95790) (tuple2!12589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112207 res!616126) b!913380))

(assert (= (and b!913380 res!616125) b!913381))

(declare-fun m!847249 () Bool)

(assert (=> d!112207 m!847249))

(declare-fun m!847251 () Bool)

(assert (=> d!112207 m!847251))

(declare-fun m!847253 () Bool)

(assert (=> d!112207 m!847253))

(declare-fun m!847255 () Bool)

(assert (=> d!112207 m!847255))

(declare-fun m!847257 () Bool)

(assert (=> b!913380 m!847257))

(declare-fun m!847259 () Bool)

(assert (=> b!913381 m!847259))

(assert (=> bm!40414 d!112207))

(assert (=> d!112153 d!112145))

(declare-fun d!112209 () Bool)

(assert (=> d!112209 (= (apply!520 (+!2634 lt!410677 (tuple2!12589 lt!410692 zeroValue!1094)) lt!410680) (get!13698 (getValueByKey!478 (toList!5653 (+!2634 lt!410677 (tuple2!12589 lt!410692 zeroValue!1094))) lt!410680)))))

(declare-fun bs!25660 () Bool)

(assert (= bs!25660 d!112209))

(declare-fun m!847261 () Bool)

(assert (=> bs!25660 m!847261))

(assert (=> bs!25660 m!847261))

(declare-fun m!847263 () Bool)

(assert (=> bs!25660 m!847263))

(assert (=> b!913242 d!112209))

(declare-fun d!112211 () Bool)

(assert (=> d!112211 (contains!4657 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094)) lt!410675)))

(declare-fun lt!410793 () Unit!30834)

(assert (=> d!112211 (= lt!410793 (choose!1542 lt!410688 lt!410689 zeroValue!1094 lt!410675))))

(assert (=> d!112211 (contains!4657 lt!410688 lt!410675)))

(assert (=> d!112211 (= (addStillContains!349 lt!410688 lt!410689 zeroValue!1094 lt!410675) lt!410793)))

(declare-fun bs!25661 () Bool)

(assert (= bs!25661 d!112211))

(assert (=> bs!25661 m!847011))

(assert (=> bs!25661 m!847011))

(assert (=> bs!25661 m!847013))

(declare-fun m!847265 () Bool)

(assert (=> bs!25661 m!847265))

(declare-fun m!847267 () Bool)

(assert (=> bs!25661 m!847267))

(assert (=> b!913242 d!112211))

(declare-fun d!112213 () Bool)

(declare-fun e!512327 () Bool)

(assert (=> d!112213 e!512327))

(declare-fun res!616128 () Bool)

(assert (=> d!112213 (=> (not res!616128) (not e!512327))))

(declare-fun lt!410796 () ListLongMap!11275)

(assert (=> d!112213 (= res!616128 (contains!4657 lt!410796 (_1!6305 (tuple2!12589 lt!410678 minValue!1094))))))

(declare-fun lt!410795 () List!18368)

(assert (=> d!112213 (= lt!410796 (ListLongMap!11276 lt!410795))))

(declare-fun lt!410794 () Unit!30834)

(declare-fun lt!410797 () Unit!30834)

(assert (=> d!112213 (= lt!410794 lt!410797)))

(assert (=> d!112213 (= (getValueByKey!478 lt!410795 (_1!6305 (tuple2!12589 lt!410678 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410678 minValue!1094))))))

(assert (=> d!112213 (= lt!410797 (lemmaContainsTupThenGetReturnValue!253 lt!410795 (_1!6305 (tuple2!12589 lt!410678 minValue!1094)) (_2!6305 (tuple2!12589 lt!410678 minValue!1094))))))

(assert (=> d!112213 (= lt!410795 (insertStrictlySorted!310 (toList!5653 lt!410690) (_1!6305 (tuple2!12589 lt!410678 minValue!1094)) (_2!6305 (tuple2!12589 lt!410678 minValue!1094))))))

(assert (=> d!112213 (= (+!2634 lt!410690 (tuple2!12589 lt!410678 minValue!1094)) lt!410796)))

(declare-fun b!913382 () Bool)

(declare-fun res!616127 () Bool)

(assert (=> b!913382 (=> (not res!616127) (not e!512327))))

(assert (=> b!913382 (= res!616127 (= (getValueByKey!478 (toList!5653 lt!410796) (_1!6305 (tuple2!12589 lt!410678 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410678 minValue!1094)))))))

(declare-fun b!913383 () Bool)

(assert (=> b!913383 (= e!512327 (contains!4661 (toList!5653 lt!410796) (tuple2!12589 lt!410678 minValue!1094)))))

(assert (= (and d!112213 res!616128) b!913382))

(assert (= (and b!913382 res!616127) b!913383))

(declare-fun m!847269 () Bool)

(assert (=> d!112213 m!847269))

(declare-fun m!847271 () Bool)

(assert (=> d!112213 m!847271))

(declare-fun m!847273 () Bool)

(assert (=> d!112213 m!847273))

(declare-fun m!847275 () Bool)

(assert (=> d!112213 m!847275))

(declare-fun m!847277 () Bool)

(assert (=> b!913382 m!847277))

(declare-fun m!847279 () Bool)

(assert (=> b!913383 m!847279))

(assert (=> b!913242 d!112213))

(declare-fun d!112215 () Bool)

(assert (=> d!112215 (= (apply!520 (+!2634 lt!410677 (tuple2!12589 lt!410692 zeroValue!1094)) lt!410680) (apply!520 lt!410677 lt!410680))))

(declare-fun lt!410798 () Unit!30834)

(assert (=> d!112215 (= lt!410798 (choose!1541 lt!410677 lt!410692 zeroValue!1094 lt!410680))))

(declare-fun e!512328 () Bool)

(assert (=> d!112215 e!512328))

(declare-fun res!616129 () Bool)

(assert (=> d!112215 (=> (not res!616129) (not e!512328))))

(assert (=> d!112215 (= res!616129 (contains!4657 lt!410677 lt!410680))))

(assert (=> d!112215 (= (addApplyDifferent!349 lt!410677 lt!410692 zeroValue!1094 lt!410680) lt!410798)))

(declare-fun b!913384 () Bool)

(assert (=> b!913384 (= e!512328 (not (= lt!410680 lt!410692)))))

(assert (= (and d!112215 res!616129) b!913384))

(assert (=> d!112215 m!847025))

(assert (=> d!112215 m!847027))

(assert (=> d!112215 m!847023))

(declare-fun m!847281 () Bool)

(assert (=> d!112215 m!847281))

(declare-fun m!847283 () Bool)

(assert (=> d!112215 m!847283))

(assert (=> d!112215 m!847025))

(assert (=> b!913242 d!112215))

(declare-fun d!112217 () Bool)

(assert (=> d!112217 (= (apply!520 (+!2634 lt!410686 (tuple2!12589 lt!410685 minValue!1094)) lt!410694) (apply!520 lt!410686 lt!410694))))

(declare-fun lt!410799 () Unit!30834)

(assert (=> d!112217 (= lt!410799 (choose!1541 lt!410686 lt!410685 minValue!1094 lt!410694))))

(declare-fun e!512329 () Bool)

(assert (=> d!112217 e!512329))

(declare-fun res!616130 () Bool)

(assert (=> d!112217 (=> (not res!616130) (not e!512329))))

(assert (=> d!112217 (= res!616130 (contains!4657 lt!410686 lt!410694))))

(assert (=> d!112217 (= (addApplyDifferent!349 lt!410686 lt!410685 minValue!1094 lt!410694) lt!410799)))

(declare-fun b!913385 () Bool)

(assert (=> b!913385 (= e!512329 (not (= lt!410694 lt!410685)))))

(assert (= (and d!112217 res!616130) b!913385))

(assert (=> d!112217 m!847007))

(assert (=> d!112217 m!847009))

(assert (=> d!112217 m!847021))

(declare-fun m!847285 () Bool)

(assert (=> d!112217 m!847285))

(declare-fun m!847287 () Bool)

(assert (=> d!112217 m!847287))

(assert (=> d!112217 m!847007))

(assert (=> b!913242 d!112217))

(declare-fun d!112219 () Bool)

(assert (=> d!112219 (= (apply!520 (+!2634 lt!410686 (tuple2!12589 lt!410685 minValue!1094)) lt!410694) (get!13698 (getValueByKey!478 (toList!5653 (+!2634 lt!410686 (tuple2!12589 lt!410685 minValue!1094))) lt!410694)))))

(declare-fun bs!25662 () Bool)

(assert (= bs!25662 d!112219))

(declare-fun m!847289 () Bool)

(assert (=> bs!25662 m!847289))

(assert (=> bs!25662 m!847289))

(declare-fun m!847291 () Bool)

(assert (=> bs!25662 m!847291))

(assert (=> b!913242 d!112219))

(declare-fun d!112221 () Bool)

(declare-fun e!512331 () Bool)

(assert (=> d!112221 e!512331))

(declare-fun res!616131 () Bool)

(assert (=> d!112221 (=> res!616131 e!512331)))

(declare-fun lt!410802 () Bool)

(assert (=> d!112221 (= res!616131 (not lt!410802))))

(declare-fun lt!410803 () Bool)

(assert (=> d!112221 (= lt!410802 lt!410803)))

(declare-fun lt!410800 () Unit!30834)

(declare-fun e!512330 () Unit!30834)

(assert (=> d!112221 (= lt!410800 e!512330)))

(declare-fun c!95822 () Bool)

(assert (=> d!112221 (= c!95822 lt!410803)))

(assert (=> d!112221 (= lt!410803 (containsKey!442 (toList!5653 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094))) lt!410675))))

(assert (=> d!112221 (= (contains!4657 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094)) lt!410675) lt!410802)))

(declare-fun b!913386 () Bool)

(declare-fun lt!410801 () Unit!30834)

(assert (=> b!913386 (= e!512330 lt!410801)))

(assert (=> b!913386 (= lt!410801 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094))) lt!410675))))

(assert (=> b!913386 (isDefined!350 (getValueByKey!478 (toList!5653 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094))) lt!410675))))

(declare-fun b!913387 () Bool)

(declare-fun Unit!30844 () Unit!30834)

(assert (=> b!913387 (= e!512330 Unit!30844)))

(declare-fun b!913388 () Bool)

(assert (=> b!913388 (= e!512331 (isDefined!350 (getValueByKey!478 (toList!5653 (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094))) lt!410675)))))

(assert (= (and d!112221 c!95822) b!913386))

(assert (= (and d!112221 (not c!95822)) b!913387))

(assert (= (and d!112221 (not res!616131)) b!913388))

(declare-fun m!847293 () Bool)

(assert (=> d!112221 m!847293))

(declare-fun m!847295 () Bool)

(assert (=> b!913386 m!847295))

(declare-fun m!847297 () Bool)

(assert (=> b!913386 m!847297))

(assert (=> b!913386 m!847297))

(declare-fun m!847299 () Bool)

(assert (=> b!913386 m!847299))

(assert (=> b!913388 m!847297))

(assert (=> b!913388 m!847297))

(assert (=> b!913388 m!847299))

(assert (=> b!913242 d!112221))

(declare-fun d!112223 () Bool)

(declare-fun e!512332 () Bool)

(assert (=> d!112223 e!512332))

(declare-fun res!616133 () Bool)

(assert (=> d!112223 (=> (not res!616133) (not e!512332))))

(declare-fun lt!410806 () ListLongMap!11275)

(assert (=> d!112223 (= res!616133 (contains!4657 lt!410806 (_1!6305 (tuple2!12589 lt!410692 zeroValue!1094))))))

(declare-fun lt!410805 () List!18368)

(assert (=> d!112223 (= lt!410806 (ListLongMap!11276 lt!410805))))

(declare-fun lt!410804 () Unit!30834)

(declare-fun lt!410807 () Unit!30834)

(assert (=> d!112223 (= lt!410804 lt!410807)))

(assert (=> d!112223 (= (getValueByKey!478 lt!410805 (_1!6305 (tuple2!12589 lt!410692 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410692 zeroValue!1094))))))

(assert (=> d!112223 (= lt!410807 (lemmaContainsTupThenGetReturnValue!253 lt!410805 (_1!6305 (tuple2!12589 lt!410692 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410692 zeroValue!1094))))))

(assert (=> d!112223 (= lt!410805 (insertStrictlySorted!310 (toList!5653 lt!410677) (_1!6305 (tuple2!12589 lt!410692 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410692 zeroValue!1094))))))

(assert (=> d!112223 (= (+!2634 lt!410677 (tuple2!12589 lt!410692 zeroValue!1094)) lt!410806)))

(declare-fun b!913389 () Bool)

(declare-fun res!616132 () Bool)

(assert (=> b!913389 (=> (not res!616132) (not e!512332))))

(assert (=> b!913389 (= res!616132 (= (getValueByKey!478 (toList!5653 lt!410806) (_1!6305 (tuple2!12589 lt!410692 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410692 zeroValue!1094)))))))

(declare-fun b!913390 () Bool)

(assert (=> b!913390 (= e!512332 (contains!4661 (toList!5653 lt!410806) (tuple2!12589 lt!410692 zeroValue!1094)))))

(assert (= (and d!112223 res!616133) b!913389))

(assert (= (and b!913389 res!616132) b!913390))

(declare-fun m!847301 () Bool)

(assert (=> d!112223 m!847301))

(declare-fun m!847303 () Bool)

(assert (=> d!112223 m!847303))

(declare-fun m!847305 () Bool)

(assert (=> d!112223 m!847305))

(declare-fun m!847307 () Bool)

(assert (=> d!112223 m!847307))

(declare-fun m!847309 () Bool)

(assert (=> b!913389 m!847309))

(declare-fun m!847311 () Bool)

(assert (=> b!913390 m!847311))

(assert (=> b!913242 d!112223))

(declare-fun b!913391 () Bool)

(declare-fun e!512338 () ListLongMap!11275)

(declare-fun call!40433 () ListLongMap!11275)

(assert (=> b!913391 (= e!512338 call!40433)))

(declare-fun b!913392 () Bool)

(declare-fun e!512337 () Bool)

(declare-fun e!512335 () Bool)

(assert (=> b!913392 (= e!512337 e!512335)))

(assert (=> b!913392 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26559 _keys!1386)))))

(declare-fun res!616136 () Bool)

(declare-fun lt!410809 () ListLongMap!11275)

(assert (=> b!913392 (= res!616136 (contains!4657 lt!410809 (select (arr!26098 _keys!1386) i!717)))))

(assert (=> b!913392 (=> (not res!616136) (not e!512335))))

(declare-fun b!913393 () Bool)

(declare-fun res!616137 () Bool)

(declare-fun e!512336 () Bool)

(assert (=> b!913393 (=> (not res!616137) (not e!512336))))

(assert (=> b!913393 (= res!616137 (not (contains!4657 lt!410809 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913394 () Bool)

(assert (=> b!913394 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26559 _keys!1386)))))

(assert (=> b!913394 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _values!1152)))))

(assert (=> b!913394 (= e!512335 (= (apply!520 lt!410809 (select (arr!26098 _keys!1386) i!717)) (get!13697 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913395 () Bool)

(declare-fun e!512339 () Bool)

(assert (=> b!913395 (= e!512339 (isEmpty!698 lt!410809))))

(declare-fun b!913396 () Bool)

(assert (=> b!913396 (= e!512336 e!512337)))

(declare-fun c!95824 () Bool)

(declare-fun e!512334 () Bool)

(assert (=> b!913396 (= c!95824 e!512334)))

(declare-fun res!616134 () Bool)

(assert (=> b!913396 (=> (not res!616134) (not e!512334))))

(assert (=> b!913396 (= res!616134 (bvslt i!717 (size!26559 _keys!1386)))))

(declare-fun b!913397 () Bool)

(assert (=> b!913397 (= e!512339 (= lt!410809 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!913398 () Bool)

(assert (=> b!913398 (= e!512334 (validKeyInArray!0 (select (arr!26098 _keys!1386) i!717)))))

(assert (=> b!913398 (bvsge i!717 #b00000000000000000000000000000000)))

(declare-fun d!112225 () Bool)

(assert (=> d!112225 e!512336))

(declare-fun res!616135 () Bool)

(assert (=> d!112225 (=> (not res!616135) (not e!512336))))

(assert (=> d!112225 (= res!616135 (not (contains!4657 lt!410809 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!512333 () ListLongMap!11275)

(assert (=> d!112225 (= lt!410809 e!512333)))

(declare-fun c!95823 () Bool)

(assert (=> d!112225 (= c!95823 (bvsge i!717 (size!26559 _keys!1386)))))

(assert (=> d!112225 (validMask!0 mask!1756)))

(assert (=> d!112225 (= (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!410809)))

(declare-fun b!913399 () Bool)

(declare-fun lt!410810 () Unit!30834)

(declare-fun lt!410811 () Unit!30834)

(assert (=> b!913399 (= lt!410810 lt!410811)))

(declare-fun lt!410814 () ListLongMap!11275)

(declare-fun lt!410813 () (_ BitVec 64))

(declare-fun lt!410812 () V!30495)

(declare-fun lt!410808 () (_ BitVec 64))

(assert (=> b!913399 (not (contains!4657 (+!2634 lt!410814 (tuple2!12589 lt!410813 lt!410812)) lt!410808))))

(assert (=> b!913399 (= lt!410811 (addStillNotContains!219 lt!410814 lt!410813 lt!410812 lt!410808))))

(assert (=> b!913399 (= lt!410808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!913399 (= lt!410812 (get!13697 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!913399 (= lt!410813 (select (arr!26098 _keys!1386) i!717))))

(assert (=> b!913399 (= lt!410814 call!40433)))

(assert (=> b!913399 (= e!512338 (+!2634 call!40433 (tuple2!12589 (select (arr!26098 _keys!1386) i!717) (get!13697 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!40430 () Bool)

(assert (=> bm!40430 (= call!40433 (getCurrentListMapNoExtraKeys!3331 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!913400 () Bool)

(assert (=> b!913400 (= e!512337 e!512339)))

(declare-fun c!95825 () Bool)

(assert (=> b!913400 (= c!95825 (bvslt i!717 (size!26559 _keys!1386)))))

(declare-fun b!913401 () Bool)

(assert (=> b!913401 (= e!512333 e!512338)))

(declare-fun c!95826 () Bool)

(assert (=> b!913401 (= c!95826 (validKeyInArray!0 (select (arr!26098 _keys!1386) i!717)))))

(declare-fun b!913402 () Bool)

(assert (=> b!913402 (= e!512333 (ListLongMap!11276 Nil!18365))))

(assert (= (and d!112225 c!95823) b!913402))

(assert (= (and d!112225 (not c!95823)) b!913401))

(assert (= (and b!913401 c!95826) b!913399))

(assert (= (and b!913401 (not c!95826)) b!913391))

(assert (= (or b!913399 b!913391) bm!40430))

(assert (= (and d!112225 res!616135) b!913393))

(assert (= (and b!913393 res!616137) b!913396))

(assert (= (and b!913396 res!616134) b!913398))

(assert (= (and b!913396 c!95824) b!913392))

(assert (= (and b!913396 (not c!95824)) b!913400))

(assert (= (and b!913392 res!616136) b!913394))

(assert (= (and b!913400 c!95825) b!913397))

(assert (= (and b!913400 (not c!95825)) b!913395))

(declare-fun b_lambda!13309 () Bool)

(assert (=> (not b_lambda!13309) (not b!913394)))

(assert (=> b!913394 t!25956))

(declare-fun b_and!27295 () Bool)

(assert (= b_and!27293 (and (=> t!25956 result!10685) b_and!27295)))

(declare-fun b_lambda!13311 () Bool)

(assert (=> (not b_lambda!13311) (not b!913399)))

(assert (=> b!913399 t!25956))

(declare-fun b_and!27297 () Bool)

(assert (= b_and!27295 (and (=> t!25956 result!10685) b_and!27297)))

(assert (=> b!913398 m!846887))

(assert (=> b!913398 m!846887))

(assert (=> b!913398 m!846989))

(declare-fun m!847313 () Bool)

(assert (=> bm!40430 m!847313))

(assert (=> b!913394 m!846995))

(assert (=> b!913394 m!846997))

(assert (=> b!913394 m!846999))

(assert (=> b!913394 m!846997))

(assert (=> b!913394 m!846995))

(assert (=> b!913394 m!846887))

(declare-fun m!847315 () Bool)

(assert (=> b!913394 m!847315))

(assert (=> b!913394 m!846887))

(assert (=> b!913401 m!846887))

(assert (=> b!913401 m!846887))

(assert (=> b!913401 m!846989))

(assert (=> b!913399 m!846995))

(assert (=> b!913399 m!846997))

(assert (=> b!913399 m!846999))

(assert (=> b!913399 m!846997))

(assert (=> b!913399 m!846995))

(declare-fun m!847317 () Bool)

(assert (=> b!913399 m!847317))

(declare-fun m!847319 () Bool)

(assert (=> b!913399 m!847319))

(declare-fun m!847321 () Bool)

(assert (=> b!913399 m!847321))

(assert (=> b!913399 m!846887))

(assert (=> b!913399 m!847317))

(declare-fun m!847323 () Bool)

(assert (=> b!913399 m!847323))

(declare-fun m!847325 () Bool)

(assert (=> b!913393 m!847325))

(assert (=> b!913392 m!846887))

(assert (=> b!913392 m!846887))

(declare-fun m!847327 () Bool)

(assert (=> b!913392 m!847327))

(assert (=> b!913397 m!847313))

(declare-fun m!847329 () Bool)

(assert (=> b!913395 m!847329))

(declare-fun m!847331 () Bool)

(assert (=> d!112225 m!847331))

(assert (=> d!112225 m!846889))

(assert (=> b!913242 d!112225))

(declare-fun d!112227 () Bool)

(assert (=> d!112227 (= (apply!520 (+!2634 lt!410690 (tuple2!12589 lt!410678 minValue!1094)) lt!410684) (get!13698 (getValueByKey!478 (toList!5653 (+!2634 lt!410690 (tuple2!12589 lt!410678 minValue!1094))) lt!410684)))))

(declare-fun bs!25663 () Bool)

(assert (= bs!25663 d!112227))

(declare-fun m!847333 () Bool)

(assert (=> bs!25663 m!847333))

(assert (=> bs!25663 m!847333))

(declare-fun m!847335 () Bool)

(assert (=> bs!25663 m!847335))

(assert (=> b!913242 d!112227))

(declare-fun d!112229 () Bool)

(assert (=> d!112229 (= (apply!520 lt!410677 lt!410680) (get!13698 (getValueByKey!478 (toList!5653 lt!410677) lt!410680)))))

(declare-fun bs!25664 () Bool)

(assert (= bs!25664 d!112229))

(declare-fun m!847337 () Bool)

(assert (=> bs!25664 m!847337))

(assert (=> bs!25664 m!847337))

(declare-fun m!847339 () Bool)

(assert (=> bs!25664 m!847339))

(assert (=> b!913242 d!112229))

(declare-fun d!112231 () Bool)

(assert (=> d!112231 (= (apply!520 lt!410686 lt!410694) (get!13698 (getValueByKey!478 (toList!5653 lt!410686) lt!410694)))))

(declare-fun bs!25665 () Bool)

(assert (= bs!25665 d!112231))

(declare-fun m!847341 () Bool)

(assert (=> bs!25665 m!847341))

(assert (=> bs!25665 m!847341))

(declare-fun m!847343 () Bool)

(assert (=> bs!25665 m!847343))

(assert (=> b!913242 d!112231))

(declare-fun d!112233 () Bool)

(assert (=> d!112233 (= (apply!520 lt!410690 lt!410684) (get!13698 (getValueByKey!478 (toList!5653 lt!410690) lt!410684)))))

(declare-fun bs!25666 () Bool)

(assert (= bs!25666 d!112233))

(declare-fun m!847345 () Bool)

(assert (=> bs!25666 m!847345))

(assert (=> bs!25666 m!847345))

(declare-fun m!847347 () Bool)

(assert (=> bs!25666 m!847347))

(assert (=> b!913242 d!112233))

(declare-fun d!112235 () Bool)

(assert (=> d!112235 (= (apply!520 (+!2634 lt!410690 (tuple2!12589 lt!410678 minValue!1094)) lt!410684) (apply!520 lt!410690 lt!410684))))

(declare-fun lt!410815 () Unit!30834)

(assert (=> d!112235 (= lt!410815 (choose!1541 lt!410690 lt!410678 minValue!1094 lt!410684))))

(declare-fun e!512340 () Bool)

(assert (=> d!112235 e!512340))

(declare-fun res!616138 () Bool)

(assert (=> d!112235 (=> (not res!616138) (not e!512340))))

(assert (=> d!112235 (= res!616138 (contains!4657 lt!410690 lt!410684))))

(assert (=> d!112235 (= (addApplyDifferent!349 lt!410690 lt!410678 minValue!1094 lt!410684) lt!410815)))

(declare-fun b!913403 () Bool)

(assert (=> b!913403 (= e!512340 (not (= lt!410684 lt!410678)))))

(assert (= (and d!112235 res!616138) b!913403))

(assert (=> d!112235 m!847017))

(assert (=> d!112235 m!847035))

(assert (=> d!112235 m!847033))

(declare-fun m!847349 () Bool)

(assert (=> d!112235 m!847349))

(declare-fun m!847351 () Bool)

(assert (=> d!112235 m!847351))

(assert (=> d!112235 m!847017))

(assert (=> b!913242 d!112235))

(declare-fun d!112237 () Bool)

(declare-fun e!512341 () Bool)

(assert (=> d!112237 e!512341))

(declare-fun res!616140 () Bool)

(assert (=> d!112237 (=> (not res!616140) (not e!512341))))

(declare-fun lt!410818 () ListLongMap!11275)

(assert (=> d!112237 (= res!616140 (contains!4657 lt!410818 (_1!6305 (tuple2!12589 lt!410685 minValue!1094))))))

(declare-fun lt!410817 () List!18368)

(assert (=> d!112237 (= lt!410818 (ListLongMap!11276 lt!410817))))

(declare-fun lt!410816 () Unit!30834)

(declare-fun lt!410819 () Unit!30834)

(assert (=> d!112237 (= lt!410816 lt!410819)))

(assert (=> d!112237 (= (getValueByKey!478 lt!410817 (_1!6305 (tuple2!12589 lt!410685 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410685 minValue!1094))))))

(assert (=> d!112237 (= lt!410819 (lemmaContainsTupThenGetReturnValue!253 lt!410817 (_1!6305 (tuple2!12589 lt!410685 minValue!1094)) (_2!6305 (tuple2!12589 lt!410685 minValue!1094))))))

(assert (=> d!112237 (= lt!410817 (insertStrictlySorted!310 (toList!5653 lt!410686) (_1!6305 (tuple2!12589 lt!410685 minValue!1094)) (_2!6305 (tuple2!12589 lt!410685 minValue!1094))))))

(assert (=> d!112237 (= (+!2634 lt!410686 (tuple2!12589 lt!410685 minValue!1094)) lt!410818)))

(declare-fun b!913404 () Bool)

(declare-fun res!616139 () Bool)

(assert (=> b!913404 (=> (not res!616139) (not e!512341))))

(assert (=> b!913404 (= res!616139 (= (getValueByKey!478 (toList!5653 lt!410818) (_1!6305 (tuple2!12589 lt!410685 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410685 minValue!1094)))))))

(declare-fun b!913405 () Bool)

(assert (=> b!913405 (= e!512341 (contains!4661 (toList!5653 lt!410818) (tuple2!12589 lt!410685 minValue!1094)))))

(assert (= (and d!112237 res!616140) b!913404))

(assert (= (and b!913404 res!616139) b!913405))

(declare-fun m!847353 () Bool)

(assert (=> d!112237 m!847353))

(declare-fun m!847355 () Bool)

(assert (=> d!112237 m!847355))

(declare-fun m!847357 () Bool)

(assert (=> d!112237 m!847357))

(declare-fun m!847359 () Bool)

(assert (=> d!112237 m!847359))

(declare-fun m!847361 () Bool)

(assert (=> b!913404 m!847361))

(declare-fun m!847363 () Bool)

(assert (=> b!913405 m!847363))

(assert (=> b!913242 d!112237))

(declare-fun d!112239 () Bool)

(declare-fun e!512342 () Bool)

(assert (=> d!112239 e!512342))

(declare-fun res!616142 () Bool)

(assert (=> d!112239 (=> (not res!616142) (not e!512342))))

(declare-fun lt!410822 () ListLongMap!11275)

(assert (=> d!112239 (= res!616142 (contains!4657 lt!410822 (_1!6305 (tuple2!12589 lt!410689 zeroValue!1094))))))

(declare-fun lt!410821 () List!18368)

(assert (=> d!112239 (= lt!410822 (ListLongMap!11276 lt!410821))))

(declare-fun lt!410820 () Unit!30834)

(declare-fun lt!410823 () Unit!30834)

(assert (=> d!112239 (= lt!410820 lt!410823)))

(assert (=> d!112239 (= (getValueByKey!478 lt!410821 (_1!6305 (tuple2!12589 lt!410689 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410689 zeroValue!1094))))))

(assert (=> d!112239 (= lt!410823 (lemmaContainsTupThenGetReturnValue!253 lt!410821 (_1!6305 (tuple2!12589 lt!410689 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410689 zeroValue!1094))))))

(assert (=> d!112239 (= lt!410821 (insertStrictlySorted!310 (toList!5653 lt!410688) (_1!6305 (tuple2!12589 lt!410689 zeroValue!1094)) (_2!6305 (tuple2!12589 lt!410689 zeroValue!1094))))))

(assert (=> d!112239 (= (+!2634 lt!410688 (tuple2!12589 lt!410689 zeroValue!1094)) lt!410822)))

(declare-fun b!913406 () Bool)

(declare-fun res!616141 () Bool)

(assert (=> b!913406 (=> (not res!616141) (not e!512342))))

(assert (=> b!913406 (= res!616141 (= (getValueByKey!478 (toList!5653 lt!410822) (_1!6305 (tuple2!12589 lt!410689 zeroValue!1094))) (Some!483 (_2!6305 (tuple2!12589 lt!410689 zeroValue!1094)))))))

(declare-fun b!913407 () Bool)

(assert (=> b!913407 (= e!512342 (contains!4661 (toList!5653 lt!410822) (tuple2!12589 lt!410689 zeroValue!1094)))))

(assert (= (and d!112239 res!616142) b!913406))

(assert (= (and b!913406 res!616141) b!913407))

(declare-fun m!847365 () Bool)

(assert (=> d!112239 m!847365))

(declare-fun m!847367 () Bool)

(assert (=> d!112239 m!847367))

(declare-fun m!847369 () Bool)

(assert (=> d!112239 m!847369))

(declare-fun m!847371 () Bool)

(assert (=> d!112239 m!847371))

(declare-fun m!847373 () Bool)

(assert (=> b!913406 m!847373))

(declare-fun m!847375 () Bool)

(assert (=> b!913407 m!847375))

(assert (=> b!913242 d!112239))

(declare-fun d!112241 () Bool)

(assert (=> d!112241 (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun lt!410826 () Unit!30834)

(declare-fun choose!1543 (List!18368 (_ BitVec 64)) Unit!30834)

(assert (=> d!112241 (= lt!410826 (choose!1543 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun e!512345 () Bool)

(assert (=> d!112241 e!512345))

(declare-fun res!616145 () Bool)

(assert (=> d!112241 (=> (not res!616145) (not e!512345))))

(declare-fun isStrictlySorted!497 (List!18368) Bool)

(assert (=> d!112241 (= res!616145 (isStrictlySorted!497 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))

(assert (=> d!112241 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) lt!410826)))

(declare-fun b!913410 () Bool)

(assert (=> b!913410 (= e!512345 (containsKey!442 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112241 res!616145) b!913410))

(assert (=> d!112241 m!847045))

(assert (=> d!112241 m!847045))

(assert (=> d!112241 m!847047))

(declare-fun m!847377 () Bool)

(assert (=> d!112241 m!847377))

(declare-fun m!847379 () Bool)

(assert (=> d!112241 m!847379))

(assert (=> b!913410 m!847041))

(assert (=> b!913267 d!112241))

(assert (=> b!913267 d!112169))

(assert (=> b!913267 d!112171))

(declare-fun d!112243 () Bool)

(declare-fun e!512346 () Bool)

(assert (=> d!112243 e!512346))

(declare-fun res!616147 () Bool)

(assert (=> d!112243 (=> (not res!616147) (not e!512346))))

(declare-fun lt!410829 () ListLongMap!11275)

(assert (=> d!112243 (= res!616147 (contains!4657 lt!410829 (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!410828 () List!18368)

(assert (=> d!112243 (= lt!410829 (ListLongMap!11276 lt!410828))))

(declare-fun lt!410827 () Unit!30834)

(declare-fun lt!410830 () Unit!30834)

(assert (=> d!112243 (= lt!410827 lt!410830)))

(assert (=> d!112243 (= (getValueByKey!478 lt!410828 (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112243 (= lt!410830 (lemmaContainsTupThenGetReturnValue!253 lt!410828 (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112243 (= lt!410828 (insertStrictlySorted!310 (toList!5653 call!40429) (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112243 (= (+!2634 call!40429 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!410829)))

(declare-fun b!913411 () Bool)

(declare-fun res!616146 () Bool)

(assert (=> b!913411 (=> (not res!616146) (not e!512346))))

(assert (=> b!913411 (= res!616146 (= (getValueByKey!478 (toList!5653 lt!410829) (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!913412 () Bool)

(assert (=> b!913412 (= e!512346 (contains!4661 (toList!5653 lt!410829) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112243 res!616147) b!913411))

(assert (= (and b!913411 res!616146) b!913412))

(declare-fun m!847381 () Bool)

(assert (=> d!112243 m!847381))

(declare-fun m!847383 () Bool)

(assert (=> d!112243 m!847383))

(declare-fun m!847385 () Bool)

(assert (=> d!112243 m!847385))

(declare-fun m!847387 () Bool)

(assert (=> d!112243 m!847387))

(declare-fun m!847389 () Bool)

(assert (=> b!913411 m!847389))

(declare-fun m!847391 () Bool)

(assert (=> b!913412 m!847391))

(assert (=> b!913280 d!112243))

(assert (=> b!913176 d!112141))

(declare-fun d!112245 () Bool)

(assert (=> d!112245 (= (apply!520 lt!410702 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13698 (getValueByKey!478 (toList!5653 lt!410702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25667 () Bool)

(assert (= bs!25667 d!112245))

(declare-fun m!847393 () Bool)

(assert (=> bs!25667 m!847393))

(assert (=> bs!25667 m!847393))

(declare-fun m!847395 () Bool)

(assert (=> bs!25667 m!847395))

(assert (=> b!913279 d!112245))

(declare-fun d!112247 () Bool)

(declare-fun e!512347 () Bool)

(assert (=> d!112247 e!512347))

(declare-fun res!616149 () Bool)

(assert (=> d!112247 (=> (not res!616149) (not e!512347))))

(declare-fun lt!410833 () ListLongMap!11275)

(assert (=> d!112247 (= res!616149 (contains!4657 lt!410833 (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!410832 () List!18368)

(assert (=> d!112247 (= lt!410833 (ListLongMap!11276 lt!410832))))

(declare-fun lt!410831 () Unit!30834)

(declare-fun lt!410834 () Unit!30834)

(assert (=> d!112247 (= lt!410831 lt!410834)))

(assert (=> d!112247 (= (getValueByKey!478 lt!410832 (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112247 (= lt!410834 (lemmaContainsTupThenGetReturnValue!253 lt!410832 (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112247 (= lt!410832 (insertStrictlySorted!310 (toList!5653 call!40419) (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112247 (= (+!2634 call!40419 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!410833)))

(declare-fun b!913413 () Bool)

(declare-fun res!616148 () Bool)

(assert (=> b!913413 (=> (not res!616148) (not e!512347))))

(assert (=> b!913413 (= res!616148 (= (getValueByKey!478 (toList!5653 lt!410833) (_1!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!483 (_2!6305 (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!913414 () Bool)

(assert (=> b!913414 (= e!512347 (contains!4661 (toList!5653 lt!410833) (tuple2!12589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112247 res!616149) b!913413))

(assert (= (and b!913413 res!616148) b!913414))

(declare-fun m!847397 () Bool)

(assert (=> d!112247 m!847397))

(declare-fun m!847399 () Bool)

(assert (=> d!112247 m!847399))

(declare-fun m!847401 () Bool)

(assert (=> d!112247 m!847401))

(declare-fun m!847403 () Bool)

(assert (=> d!112247 m!847403))

(declare-fun m!847405 () Bool)

(assert (=> b!913413 m!847405))

(declare-fun m!847407 () Bool)

(assert (=> b!913414 m!847407))

(assert (=> b!913239 d!112247))

(declare-fun d!112249 () Bool)

(declare-fun res!616154 () Bool)

(declare-fun e!512352 () Bool)

(assert (=> d!112249 (=> res!616154 e!512352)))

(assert (=> d!112249 (= res!616154 (and ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (= (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112249 (= (containsKey!442 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) e!512352)))

(declare-fun b!913419 () Bool)

(declare-fun e!512353 () Bool)

(assert (=> b!913419 (= e!512352 e!512353)))

(declare-fun res!616155 () Bool)

(assert (=> b!913419 (=> (not res!616155) (not e!512353))))

(assert (=> b!913419 (= res!616155 (and (or (not ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) (bvsle (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (bvslt (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!913420 () Bool)

(assert (=> b!913420 (= e!512353 (containsKey!442 (t!25950 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112249 (not res!616154)) b!913419))

(assert (= (and b!913419 res!616155) b!913420))

(declare-fun m!847409 () Bool)

(assert (=> b!913420 m!847409))

(assert (=> d!112151 d!112249))

(assert (=> b!913278 d!112205))

(declare-fun d!112251 () Bool)

(assert (=> d!112251 (= (apply!520 lt!410676 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13698 (getValueByKey!478 (toList!5653 lt!410676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25668 () Bool)

(assert (= bs!25668 d!112251))

(assert (=> bs!25668 m!847107))

(assert (=> bs!25668 m!847107))

(declare-fun m!847411 () Bool)

(assert (=> bs!25668 m!847411))

(assert (=> b!913238 d!112251))

(declare-fun d!112253 () Bool)

(declare-fun e!512355 () Bool)

(assert (=> d!112253 e!512355))

(declare-fun res!616156 () Bool)

(assert (=> d!112253 (=> res!616156 e!512355)))

(declare-fun lt!410837 () Bool)

(assert (=> d!112253 (= res!616156 (not lt!410837))))

(declare-fun lt!410838 () Bool)

(assert (=> d!112253 (= lt!410837 lt!410838)))

(declare-fun lt!410835 () Unit!30834)

(declare-fun e!512354 () Unit!30834)

(assert (=> d!112253 (= lt!410835 e!512354)))

(declare-fun c!95827 () Bool)

(assert (=> d!112253 (= c!95827 lt!410838)))

(assert (=> d!112253 (= lt!410838 (containsKey!442 (toList!5653 lt!410702) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112253 (= (contains!4657 lt!410702 #b1000000000000000000000000000000000000000000000000000000000000000) lt!410837)))

(declare-fun b!913421 () Bool)

(declare-fun lt!410836 () Unit!30834)

(assert (=> b!913421 (= e!512354 lt!410836)))

(assert (=> b!913421 (= lt!410836 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 lt!410702) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913421 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410702) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913422 () Bool)

(declare-fun Unit!30845 () Unit!30834)

(assert (=> b!913422 (= e!512354 Unit!30845)))

(declare-fun b!913423 () Bool)

(assert (=> b!913423 (= e!512355 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112253 c!95827) b!913421))

(assert (= (and d!112253 (not c!95827)) b!913422))

(assert (= (and d!112253 (not res!616156)) b!913423))

(declare-fun m!847413 () Bool)

(assert (=> d!112253 m!847413))

(declare-fun m!847415 () Bool)

(assert (=> b!913421 m!847415))

(declare-fun m!847417 () Bool)

(assert (=> b!913421 m!847417))

(assert (=> b!913421 m!847417))

(declare-fun m!847419 () Bool)

(assert (=> b!913421 m!847419))

(assert (=> b!913423 m!847417))

(assert (=> b!913423 m!847417))

(assert (=> b!913423 m!847419))

(assert (=> bm!40423 d!112253))

(declare-fun d!112255 () Bool)

(declare-fun e!512358 () Bool)

(assert (=> d!112255 e!512358))

(declare-fun c!95830 () Bool)

(assert (=> d!112255 (= c!95830 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!112255 true))

(declare-fun _$15!95 () Unit!30834)

(assert (=> d!112255 (= (choose!1540 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) _$15!95)))

(declare-fun b!913428 () Bool)

(assert (=> b!913428 (= e!512358 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913429 () Bool)

(assert (=> b!913429 (= e!512358 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112255 c!95830) b!913428))

(assert (= (and d!112255 (not c!95830)) b!913429))

(assert (=> b!913428 m!846879))

(assert (=> d!112143 d!112255))

(assert (=> d!112143 d!112145))

(declare-fun d!112257 () Bool)

(assert (=> d!112257 (= (validKeyInArray!0 (select (arr!26098 _keys!1386) i!717)) (and (not (= (select (arr!26098 _keys!1386) i!717) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26098 _keys!1386) i!717) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913237 d!112257))

(declare-fun b!913430 () Bool)

(declare-fun e!512359 () Bool)

(declare-fun e!512361 () Bool)

(assert (=> b!913430 (= e!512359 e!512361)))

(declare-fun lt!410839 () (_ BitVec 64))

(assert (=> b!913430 (= lt!410839 (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!410840 () Unit!30834)

(assert (=> b!913430 (= lt!410840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!913430 (arrayContainsKey!0 _keys!1386 lt!410839 #b00000000000000000000000000000000)))

(declare-fun lt!410841 () Unit!30834)

(assert (=> b!913430 (= lt!410841 lt!410840)))

(declare-fun res!616157 () Bool)

(assert (=> b!913430 (= res!616157 (= (seekEntryOrOpen!0 (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1386 mask!1756) (Found!8969 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!913430 (=> (not res!616157) (not e!512361))))

(declare-fun b!913431 () Bool)

(declare-fun e!512360 () Bool)

(assert (=> b!913431 (= e!512360 e!512359)))

(declare-fun c!95831 () Bool)

(assert (=> b!913431 (= c!95831 (validKeyInArray!0 (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!112259 () Bool)

(declare-fun res!616158 () Bool)

(assert (=> d!112259 (=> res!616158 e!512360)))

(assert (=> d!112259 (= res!616158 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26559 _keys!1386)))))

(assert (=> d!112259 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756) e!512360)))

(declare-fun bm!40431 () Bool)

(declare-fun call!40434 () Bool)

(assert (=> bm!40431 (= call!40434 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913432 () Bool)

(assert (=> b!913432 (= e!512361 call!40434)))

(declare-fun b!913433 () Bool)

(assert (=> b!913433 (= e!512359 call!40434)))

(assert (= (and d!112259 (not res!616158)) b!913431))

(assert (= (and b!913431 c!95831) b!913430))

(assert (= (and b!913431 (not c!95831)) b!913433))

(assert (= (and b!913430 res!616157) b!913432))

(assert (= (or b!913432 b!913433) bm!40431))

(declare-fun m!847421 () Bool)

(assert (=> b!913430 m!847421))

(declare-fun m!847423 () Bool)

(assert (=> b!913430 m!847423))

(declare-fun m!847425 () Bool)

(assert (=> b!913430 m!847425))

(assert (=> b!913430 m!847421))

(declare-fun m!847427 () Bool)

(assert (=> b!913430 m!847427))

(assert (=> b!913431 m!847421))

(assert (=> b!913431 m!847421))

(declare-fun m!847429 () Bool)

(assert (=> b!913431 m!847429))

(declare-fun m!847431 () Bool)

(assert (=> bm!40431 m!847431))

(assert (=> bm!40395 d!112259))

(declare-fun d!112261 () Bool)

(declare-fun e!512363 () Bool)

(assert (=> d!112261 e!512363))

(declare-fun res!616159 () Bool)

(assert (=> d!112261 (=> res!616159 e!512363)))

(declare-fun lt!410844 () Bool)

(assert (=> d!112261 (= res!616159 (not lt!410844))))

(declare-fun lt!410845 () Bool)

(assert (=> d!112261 (= lt!410844 lt!410845)))

(declare-fun lt!410842 () Unit!30834)

(declare-fun e!512362 () Unit!30834)

(assert (=> d!112261 (= lt!410842 e!512362)))

(declare-fun c!95832 () Bool)

(assert (=> d!112261 (= c!95832 lt!410845)))

(assert (=> d!112261 (= lt!410845 (containsKey!442 (toList!5653 lt!410676) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112261 (= (contains!4657 lt!410676 #b1000000000000000000000000000000000000000000000000000000000000000) lt!410844)))

(declare-fun b!913434 () Bool)

(declare-fun lt!410843 () Unit!30834)

(assert (=> b!913434 (= e!512362 lt!410843)))

(assert (=> b!913434 (= lt!410843 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 lt!410676) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913434 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410676) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913435 () Bool)

(declare-fun Unit!30846 () Unit!30834)

(assert (=> b!913435 (= e!512362 Unit!30846)))

(declare-fun b!913436 () Bool)

(assert (=> b!913436 (= e!512363 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112261 c!95832) b!913434))

(assert (= (and d!112261 (not c!95832)) b!913435))

(assert (= (and d!112261 (not res!616159)) b!913436))

(declare-fun m!847433 () Bool)

(assert (=> d!112261 m!847433))

(declare-fun m!847435 () Bool)

(assert (=> b!913434 m!847435))

(declare-fun m!847437 () Bool)

(assert (=> b!913434 m!847437))

(assert (=> b!913434 m!847437))

(declare-fun m!847439 () Bool)

(assert (=> b!913434 m!847439))

(assert (=> b!913436 m!847437))

(assert (=> b!913436 m!847437))

(assert (=> b!913436 m!847439))

(assert (=> bm!40413 d!112261))

(assert (=> b!913163 d!112205))

(declare-fun d!112263 () Bool)

(assert (=> d!112263 (arrayContainsKey!0 _keys!1386 lt!410611 #b00000000000000000000000000000000)))

(declare-fun lt!410848 () Unit!30834)

(declare-fun choose!13 (array!54289 (_ BitVec 64) (_ BitVec 32)) Unit!30834)

(assert (=> d!112263 (= lt!410848 (choose!13 _keys!1386 lt!410611 #b00000000000000000000000000000000))))

(assert (=> d!112263 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!112263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410611 #b00000000000000000000000000000000) lt!410848)))

(declare-fun bs!25669 () Bool)

(assert (= bs!25669 d!112263))

(assert (=> bs!25669 m!846961))

(declare-fun m!847441 () Bool)

(assert (=> bs!25669 m!847441))

(assert (=> b!913162 d!112263))

(declare-fun d!112265 () Bool)

(declare-fun res!616160 () Bool)

(declare-fun e!512364 () Bool)

(assert (=> d!112265 (=> res!616160 e!512364)))

(assert (=> d!112265 (= res!616160 (= (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) lt!410611))))

(assert (=> d!112265 (= (arrayContainsKey!0 _keys!1386 lt!410611 #b00000000000000000000000000000000) e!512364)))

(declare-fun b!913437 () Bool)

(declare-fun e!512365 () Bool)

(assert (=> b!913437 (= e!512364 e!512365)))

(declare-fun res!616161 () Bool)

(assert (=> b!913437 (=> (not res!616161) (not e!512365))))

(assert (=> b!913437 (= res!616161 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26559 _keys!1386)))))

(declare-fun b!913438 () Bool)

(assert (=> b!913438 (= e!512365 (arrayContainsKey!0 _keys!1386 lt!410611 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112265 (not res!616160)) b!913437))

(assert (= (and b!913437 res!616161) b!913438))

(assert (=> d!112265 m!846957))

(declare-fun m!847443 () Bool)

(assert (=> b!913438 m!847443))

(assert (=> b!913162 d!112265))

(declare-fun d!112267 () Bool)

(declare-fun lt!410856 () SeekEntryResult!8969)

(assert (=> d!112267 (and (or ((_ is Undefined!8969) lt!410856) (not ((_ is Found!8969) lt!410856)) (and (bvsge (index!38248 lt!410856) #b00000000000000000000000000000000) (bvslt (index!38248 lt!410856) (size!26559 _keys!1386)))) (or ((_ is Undefined!8969) lt!410856) ((_ is Found!8969) lt!410856) (not ((_ is MissingZero!8969) lt!410856)) (and (bvsge (index!38247 lt!410856) #b00000000000000000000000000000000) (bvslt (index!38247 lt!410856) (size!26559 _keys!1386)))) (or ((_ is Undefined!8969) lt!410856) ((_ is Found!8969) lt!410856) ((_ is MissingZero!8969) lt!410856) (not ((_ is MissingVacant!8969) lt!410856)) (and (bvsge (index!38250 lt!410856) #b00000000000000000000000000000000) (bvslt (index!38250 lt!410856) (size!26559 _keys!1386)))) (or ((_ is Undefined!8969) lt!410856) (ite ((_ is Found!8969) lt!410856) (= (select (arr!26098 _keys!1386) (index!38248 lt!410856)) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8969) lt!410856) (= (select (arr!26098 _keys!1386) (index!38247 lt!410856)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8969) lt!410856) (= (select (arr!26098 _keys!1386) (index!38250 lt!410856)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!512374 () SeekEntryResult!8969)

(assert (=> d!112267 (= lt!410856 e!512374)))

(declare-fun c!95841 () Bool)

(declare-fun lt!410855 () SeekEntryResult!8969)

(assert (=> d!112267 (= c!95841 (and ((_ is Intermediate!8969) lt!410855) (undefined!9781 lt!410855)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54289 (_ BitVec 32)) SeekEntryResult!8969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112267 (= lt!410855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) mask!1756) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(assert (=> d!112267 (validMask!0 mask!1756)))

(assert (=> d!112267 (= (seekEntryOrOpen!0 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) lt!410856)))

(declare-fun b!913451 () Bool)

(declare-fun c!95840 () Bool)

(declare-fun lt!410857 () (_ BitVec 64))

(assert (=> b!913451 (= c!95840 (= lt!410857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!512372 () SeekEntryResult!8969)

(declare-fun e!512373 () SeekEntryResult!8969)

(assert (=> b!913451 (= e!512372 e!512373)))

(declare-fun b!913452 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54289 (_ BitVec 32)) SeekEntryResult!8969)

(assert (=> b!913452 (= e!512373 (seekKeyOrZeroReturnVacant!0 (x!78133 lt!410855) (index!38249 lt!410855) (index!38249 lt!410855) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(declare-fun b!913453 () Bool)

(assert (=> b!913453 (= e!512374 e!512372)))

(assert (=> b!913453 (= lt!410857 (select (arr!26098 _keys!1386) (index!38249 lt!410855)))))

(declare-fun c!95839 () Bool)

(assert (=> b!913453 (= c!95839 (= lt!410857 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913454 () Bool)

(assert (=> b!913454 (= e!512373 (MissingZero!8969 (index!38249 lt!410855)))))

(declare-fun b!913455 () Bool)

(assert (=> b!913455 (= e!512374 Undefined!8969)))

(declare-fun b!913456 () Bool)

(assert (=> b!913456 (= e!512372 (Found!8969 (index!38249 lt!410855)))))

(assert (= (and d!112267 c!95841) b!913455))

(assert (= (and d!112267 (not c!95841)) b!913453))

(assert (= (and b!913453 c!95839) b!913456))

(assert (= (and b!913453 (not c!95839)) b!913451))

(assert (= (and b!913451 c!95840) b!913454))

(assert (= (and b!913451 (not c!95840)) b!913452))

(assert (=> d!112267 m!846889))

(declare-fun m!847445 () Bool)

(assert (=> d!112267 m!847445))

(assert (=> d!112267 m!846957))

(declare-fun m!847447 () Bool)

(assert (=> d!112267 m!847447))

(declare-fun m!847449 () Bool)

(assert (=> d!112267 m!847449))

(declare-fun m!847451 () Bool)

(assert (=> d!112267 m!847451))

(assert (=> d!112267 m!846957))

(assert (=> d!112267 m!847445))

(declare-fun m!847453 () Bool)

(assert (=> d!112267 m!847453))

(assert (=> b!913452 m!846957))

(declare-fun m!847455 () Bool)

(assert (=> b!913452 m!847455))

(declare-fun m!847457 () Bool)

(assert (=> b!913453 m!847457))

(assert (=> b!913162 d!112267))

(declare-fun d!112269 () Bool)

(assert (=> d!112269 (= (apply!520 lt!410702 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13698 (getValueByKey!478 (toList!5653 lt!410702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25670 () Bool)

(assert (= bs!25670 d!112269))

(assert (=> bs!25670 m!847417))

(assert (=> bs!25670 m!847417))

(declare-fun m!847459 () Bool)

(assert (=> bs!25670 m!847459))

(assert (=> b!913275 d!112269))

(declare-fun d!112271 () Bool)

(declare-fun res!616162 () Bool)

(declare-fun e!512375 () Bool)

(assert (=> d!112271 (=> res!616162 e!512375)))

(assert (=> d!112271 (= res!616162 (= (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1033))))

(assert (=> d!112271 (= (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!512375)))

(declare-fun b!913457 () Bool)

(declare-fun e!512376 () Bool)

(assert (=> b!913457 (= e!512375 e!512376)))

(declare-fun res!616163 () Bool)

(assert (=> b!913457 (=> (not res!616163) (not e!512376))))

(assert (=> b!913457 (= res!616163 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!26559 _keys!1386)))))

(declare-fun b!913458 () Bool)

(assert (=> b!913458 (= e!512376 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!112271 (not res!616162)) b!913457))

(assert (= (and b!913457 res!616163) b!913458))

(assert (=> d!112271 m!847421))

(declare-fun m!847461 () Bool)

(assert (=> b!913458 m!847461))

(assert (=> b!913171 d!112271))

(declare-fun d!112273 () Bool)

(assert (=> d!112273 (= (apply!520 lt!410676 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13698 (getValueByKey!478 (toList!5653 lt!410676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25671 () Bool)

(assert (= bs!25671 d!112273))

(assert (=> bs!25671 m!847437))

(assert (=> bs!25671 m!847437))

(declare-fun m!847463 () Bool)

(assert (=> bs!25671 m!847463))

(assert (=> b!913234 d!112273))

(declare-fun d!112275 () Bool)

(assert (=> d!112275 (= (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033)) (not (isEmpty!697 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25672 () Bool)

(assert (= bs!25672 d!112275))

(assert (=> bs!25672 m!846977))

(declare-fun m!847465 () Bool)

(assert (=> bs!25672 m!847465))

(assert (=> b!913186 d!112275))

(declare-fun e!512378 () Option!484)

(declare-fun b!913461 () Bool)

(assert (=> b!913461 (= e!512378 (getValueByKey!478 (t!25950 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) k0!1033))))

(declare-fun b!913462 () Bool)

(assert (=> b!913462 (= e!512378 None!482)))

(declare-fun c!95842 () Bool)

(declare-fun d!112277 () Bool)

(assert (=> d!112277 (= c!95842 (and ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (= (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(declare-fun e!512377 () Option!484)

(assert (=> d!112277 (= (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) e!512377)))

(declare-fun b!913460 () Bool)

(assert (=> b!913460 (= e!512377 e!512378)))

(declare-fun c!95843 () Bool)

(assert (=> b!913460 (= c!95843 (and ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (not (= (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033))))))

(declare-fun b!913459 () Bool)

(assert (=> b!913459 (= e!512377 (Some!483 (_2!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))))))

(assert (= (and d!112277 c!95842) b!913459))

(assert (= (and d!112277 (not c!95842)) b!913460))

(assert (= (and b!913460 c!95843) b!913461))

(assert (= (and b!913460 (not c!95843)) b!913462))

(declare-fun m!847467 () Bool)

(assert (=> b!913461 m!847467))

(assert (=> b!913186 d!112277))

(declare-fun d!112279 () Bool)

(declare-fun res!616164 () Bool)

(declare-fun e!512379 () Bool)

(assert (=> d!112279 (=> res!616164 e!512379)))

(assert (=> d!112279 (= res!616164 (and ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112279 (= (containsKey!442 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512379)))

(declare-fun b!913463 () Bool)

(declare-fun e!512380 () Bool)

(assert (=> b!913463 (= e!512379 e!512380)))

(declare-fun res!616165 () Bool)

(assert (=> b!913463 (=> (not res!616165) (not e!512380))))

(assert (=> b!913463 (= res!616165 (and (or (not ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) (bvsle (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18364) (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (bvslt (_1!6305 (h!19510 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!913464 () Bool)

(assert (=> b!913464 (= e!512380 (containsKey!442 (t!25950 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112279 (not res!616164)) b!913463))

(assert (= (and b!913463 res!616165) b!913464))

(declare-fun m!847469 () Bool)

(assert (=> b!913464 m!847469))

(assert (=> d!112157 d!112279))

(assert (=> d!112159 d!112145))

(assert (=> b!913290 d!112205))

(declare-fun d!112281 () Bool)

(assert (=> d!112281 (isDefined!350 (getValueByKey!478 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun lt!410858 () Unit!30834)

(assert (=> d!112281 (= lt!410858 (choose!1543 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun e!512381 () Bool)

(assert (=> d!112281 e!512381))

(declare-fun res!616166 () Bool)

(assert (=> d!112281 (=> (not res!616166) (not e!512381))))

(assert (=> d!112281 (= res!616166 (isStrictlySorted!497 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))))

(assert (=> d!112281 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) lt!410858)))

(declare-fun b!913465 () Bool)

(assert (=> b!913465 (= e!512381 (containsKey!442 (toList!5653 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112281 res!616166) b!913465))

(assert (=> d!112281 m!846977))

(assert (=> d!112281 m!846977))

(assert (=> d!112281 m!846979))

(declare-fun m!847471 () Bool)

(assert (=> d!112281 m!847471))

(declare-fun m!847473 () Bool)

(assert (=> d!112281 m!847473))

(assert (=> b!913465 m!846973))

(assert (=> b!913184 d!112281))

(assert (=> b!913184 d!112275))

(assert (=> b!913184 d!112277))

(assert (=> b!913249 d!112257))

(declare-fun d!112283 () Bool)

(declare-fun e!512383 () Bool)

(assert (=> d!112283 e!512383))

(declare-fun res!616167 () Bool)

(assert (=> d!112283 (=> res!616167 e!512383)))

(declare-fun lt!410861 () Bool)

(assert (=> d!112283 (= res!616167 (not lt!410861))))

(declare-fun lt!410862 () Bool)

(assert (=> d!112283 (= lt!410861 lt!410862)))

(declare-fun lt!410859 () Unit!30834)

(declare-fun e!512382 () Unit!30834)

(assert (=> d!112283 (= lt!410859 e!512382)))

(declare-fun c!95844 () Bool)

(assert (=> d!112283 (= c!95844 lt!410862)))

(assert (=> d!112283 (= lt!410862 (containsKey!442 (toList!5653 lt!410702) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> d!112283 (= (contains!4657 lt!410702 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) lt!410861)))

(declare-fun b!913466 () Bool)

(declare-fun lt!410860 () Unit!30834)

(assert (=> b!913466 (= e!512382 lt!410860)))

(assert (=> b!913466 (= lt!410860 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 lt!410702) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913466 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410702) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913467 () Bool)

(declare-fun Unit!30847 () Unit!30834)

(assert (=> b!913467 (= e!512382 Unit!30847)))

(declare-fun b!913468 () Bool)

(assert (=> b!913468 (= e!512383 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410702) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))))

(assert (= (and d!112283 c!95844) b!913466))

(assert (= (and d!112283 (not c!95844)) b!913467))

(assert (= (and d!112283 (not res!616167)) b!913468))

(assert (=> d!112283 m!846957))

(declare-fun m!847475 () Bool)

(assert (=> d!112283 m!847475))

(assert (=> b!913466 m!846957))

(declare-fun m!847477 () Bool)

(assert (=> b!913466 m!847477))

(assert (=> b!913466 m!846957))

(declare-fun m!847479 () Bool)

(assert (=> b!913466 m!847479))

(assert (=> b!913466 m!847479))

(declare-fun m!847481 () Bool)

(assert (=> b!913466 m!847481))

(assert (=> b!913468 m!846957))

(assert (=> b!913468 m!847479))

(assert (=> b!913468 m!847479))

(assert (=> b!913468 m!847481))

(assert (=> b!913287 d!112283))

(declare-fun d!112285 () Bool)

(assert (=> d!112285 (= (apply!520 lt!410702 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000)) (get!13698 (getValueByKey!478 (toList!5653 lt!410702) (select (arr!26098 _keys!1386) #b00000000000000000000000000000000))))))

(declare-fun bs!25673 () Bool)

(assert (= bs!25673 d!112285))

(assert (=> bs!25673 m!846957))

(assert (=> bs!25673 m!847479))

(assert (=> bs!25673 m!847479))

(declare-fun m!847483 () Bool)

(assert (=> bs!25673 m!847483))

(assert (=> b!913286 d!112285))

(declare-fun d!112287 () Bool)

(declare-fun c!95847 () Bool)

(assert (=> d!112287 (= c!95847 ((_ is ValueCellFull!9092) (select (arr!26097 _values!1152) #b00000000000000000000000000000000)))))

(declare-fun e!512386 () V!30495)

(assert (=> d!112287 (= (get!13697 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512386)))

(declare-fun b!913473 () Bool)

(declare-fun get!13699 (ValueCell!9092 V!30495) V!30495)

(assert (=> b!913473 (= e!512386 (get!13699 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913474 () Bool)

(declare-fun get!13700 (ValueCell!9092 V!30495) V!30495)

(assert (=> b!913474 (= e!512386 (get!13700 (select (arr!26097 _values!1152) #b00000000000000000000000000000000) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112287 c!95847) b!913473))

(assert (= (and d!112287 (not c!95847)) b!913474))

(assert (=> b!913473 m!847061))

(assert (=> b!913473 m!846997))

(declare-fun m!847485 () Bool)

(assert (=> b!913473 m!847485))

(assert (=> b!913474 m!847061))

(assert (=> b!913474 m!846997))

(declare-fun m!847487 () Bool)

(assert (=> b!913474 m!847487))

(assert (=> b!913286 d!112287))

(declare-fun d!112289 () Bool)

(declare-fun e!512388 () Bool)

(assert (=> d!112289 e!512388))

(declare-fun res!616168 () Bool)

(assert (=> d!112289 (=> res!616168 e!512388)))

(declare-fun lt!410865 () Bool)

(assert (=> d!112289 (= res!616168 (not lt!410865))))

(declare-fun lt!410866 () Bool)

(assert (=> d!112289 (= lt!410865 lt!410866)))

(declare-fun lt!410863 () Unit!30834)

(declare-fun e!512387 () Unit!30834)

(assert (=> d!112289 (= lt!410863 e!512387)))

(declare-fun c!95848 () Bool)

(assert (=> d!112289 (= c!95848 lt!410866)))

(assert (=> d!112289 (= lt!410866 (containsKey!442 (toList!5653 lt!410676) (select (arr!26098 _keys!1386) i!717)))))

(assert (=> d!112289 (= (contains!4657 lt!410676 (select (arr!26098 _keys!1386) i!717)) lt!410865)))

(declare-fun b!913475 () Bool)

(declare-fun lt!410864 () Unit!30834)

(assert (=> b!913475 (= e!512387 lt!410864)))

(assert (=> b!913475 (= lt!410864 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 lt!410676) (select (arr!26098 _keys!1386) i!717)))))

(assert (=> b!913475 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410676) (select (arr!26098 _keys!1386) i!717)))))

(declare-fun b!913476 () Bool)

(declare-fun Unit!30848 () Unit!30834)

(assert (=> b!913476 (= e!512387 Unit!30848)))

(declare-fun b!913477 () Bool)

(assert (=> b!913477 (= e!512388 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410676) (select (arr!26098 _keys!1386) i!717))))))

(assert (= (and d!112289 c!95848) b!913475))

(assert (= (and d!112289 (not c!95848)) b!913476))

(assert (= (and d!112289 (not res!616168)) b!913477))

(assert (=> d!112289 m!846887))

(declare-fun m!847489 () Bool)

(assert (=> d!112289 m!847489))

(assert (=> b!913475 m!846887))

(declare-fun m!847491 () Bool)

(assert (=> b!913475 m!847491))

(assert (=> b!913475 m!846887))

(declare-fun m!847493 () Bool)

(assert (=> b!913475 m!847493))

(assert (=> b!913475 m!847493))

(declare-fun m!847495 () Bool)

(assert (=> b!913475 m!847495))

(assert (=> b!913477 m!846887))

(assert (=> b!913477 m!847493))

(assert (=> b!913477 m!847493))

(assert (=> b!913477 m!847495))

(assert (=> b!913246 d!112289))

(assert (=> bm!40426 d!112199))

(declare-fun b!913478 () Bool)

(declare-fun e!512389 () Bool)

(declare-fun e!512390 () Bool)

(assert (=> b!913478 (= e!512389 e!512390)))

(declare-fun c!95849 () Bool)

(assert (=> b!913478 (= c!95849 (validKeyInArray!0 (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913479 () Bool)

(declare-fun e!512392 () Bool)

(assert (=> b!913479 (= e!512392 (contains!4660 (ite c!95794 (Cons!18365 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) Nil!18366) Nil!18366) (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913480 () Bool)

(declare-fun call!40435 () Bool)

(assert (=> b!913480 (= e!512390 call!40435)))

(declare-fun b!913481 () Bool)

(declare-fun e!512391 () Bool)

(assert (=> b!913481 (= e!512391 e!512389)))

(declare-fun res!616171 () Bool)

(assert (=> b!913481 (=> (not res!616171) (not e!512389))))

(assert (=> b!913481 (= res!616171 (not e!512392))))

(declare-fun res!616169 () Bool)

(assert (=> b!913481 (=> (not res!616169) (not e!512392))))

(assert (=> b!913481 (= res!616169 (validKeyInArray!0 (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913482 () Bool)

(assert (=> b!913482 (= e!512390 call!40435)))

(declare-fun bm!40432 () Bool)

(assert (=> bm!40432 (= call!40435 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!95849 (Cons!18365 (select (arr!26098 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!95794 (Cons!18365 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) Nil!18366) Nil!18366)) (ite c!95794 (Cons!18365 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) Nil!18366) Nil!18366))))))

(declare-fun d!112291 () Bool)

(declare-fun res!616170 () Bool)

(assert (=> d!112291 (=> res!616170 e!512391)))

(assert (=> d!112291 (= res!616170 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26559 _keys!1386)))))

(assert (=> d!112291 (= (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95794 (Cons!18365 (select (arr!26098 _keys!1386) #b00000000000000000000000000000000) Nil!18366) Nil!18366)) e!512391)))

(assert (= (and d!112291 (not res!616170)) b!913481))

(assert (= (and b!913481 res!616169) b!913479))

(assert (= (and b!913481 res!616171) b!913478))

(assert (= (and b!913478 c!95849) b!913480))

(assert (= (and b!913478 (not c!95849)) b!913482))

(assert (= (or b!913480 b!913482) bm!40432))

(assert (=> b!913478 m!847421))

(assert (=> b!913478 m!847421))

(assert (=> b!913478 m!847429))

(assert (=> b!913479 m!847421))

(assert (=> b!913479 m!847421))

(declare-fun m!847497 () Bool)

(assert (=> b!913479 m!847497))

(assert (=> b!913481 m!847421))

(assert (=> b!913481 m!847421))

(assert (=> b!913481 m!847429))

(assert (=> bm!40432 m!847421))

(declare-fun m!847499 () Bool)

(assert (=> bm!40432 m!847499))

(assert (=> bm!40419 d!112291))

(declare-fun d!112293 () Bool)

(assert (=> d!112293 (= (apply!520 lt!410676 (select (arr!26098 _keys!1386) i!717)) (get!13698 (getValueByKey!478 (toList!5653 lt!410676) (select (arr!26098 _keys!1386) i!717))))))

(declare-fun bs!25674 () Bool)

(assert (= bs!25674 d!112293))

(assert (=> bs!25674 m!846887))

(assert (=> bs!25674 m!847493))

(assert (=> bs!25674 m!847493))

(declare-fun m!847501 () Bool)

(assert (=> bs!25674 m!847501))

(assert (=> b!913245 d!112293))

(declare-fun d!112295 () Bool)

(declare-fun c!95850 () Bool)

(assert (=> d!112295 (= c!95850 ((_ is ValueCellFull!9092) (select (arr!26097 _values!1152) i!717)))))

(declare-fun e!512393 () V!30495)

(assert (=> d!112295 (= (get!13697 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512393)))

(declare-fun b!913483 () Bool)

(assert (=> b!913483 (= e!512393 (get!13699 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913484 () Bool)

(assert (=> b!913484 (= e!512393 (get!13700 (select (arr!26097 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112295 c!95850) b!913483))

(assert (= (and d!112295 (not c!95850)) b!913484))

(assert (=> b!913483 m!846995))

(assert (=> b!913483 m!846997))

(declare-fun m!847503 () Bool)

(assert (=> b!913483 m!847503))

(assert (=> b!913484 m!846995))

(assert (=> b!913484 m!846997))

(declare-fun m!847505 () Bool)

(assert (=> b!913484 m!847505))

(assert (=> b!913245 d!112295))

(assert (=> bm!40416 d!112225))

(declare-fun d!112297 () Bool)

(declare-fun e!512395 () Bool)

(assert (=> d!112297 e!512395))

(declare-fun res!616172 () Bool)

(assert (=> d!112297 (=> res!616172 e!512395)))

(declare-fun lt!410869 () Bool)

(assert (=> d!112297 (= res!616172 (not lt!410869))))

(declare-fun lt!410870 () Bool)

(assert (=> d!112297 (= lt!410869 lt!410870)))

(declare-fun lt!410867 () Unit!30834)

(declare-fun e!512394 () Unit!30834)

(assert (=> d!112297 (= lt!410867 e!512394)))

(declare-fun c!95851 () Bool)

(assert (=> d!112297 (= c!95851 lt!410870)))

(assert (=> d!112297 (= lt!410870 (containsKey!442 (toList!5653 lt!410702) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112297 (= (contains!4657 lt!410702 #b0000000000000000000000000000000000000000000000000000000000000000) lt!410869)))

(declare-fun b!913485 () Bool)

(declare-fun lt!410868 () Unit!30834)

(assert (=> b!913485 (= e!512394 lt!410868)))

(assert (=> b!913485 (= lt!410868 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5653 lt!410702) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913485 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410702) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913486 () Bool)

(declare-fun Unit!30849 () Unit!30834)

(assert (=> b!913486 (= e!512394 Unit!30849)))

(declare-fun b!913487 () Bool)

(assert (=> b!913487 (= e!512395 (isDefined!350 (getValueByKey!478 (toList!5653 lt!410702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112297 c!95851) b!913485))

(assert (= (and d!112297 (not c!95851)) b!913486))

(assert (= (and d!112297 (not res!616172)) b!913487))

(declare-fun m!847507 () Bool)

(assert (=> d!112297 m!847507))

(declare-fun m!847509 () Bool)

(assert (=> b!913485 m!847509))

(assert (=> b!913485 m!847393))

(assert (=> b!913485 m!847393))

(declare-fun m!847511 () Bool)

(assert (=> b!913485 m!847511))

(assert (=> b!913487 m!847393))

(assert (=> b!913487 m!847393))

(assert (=> b!913487 m!847511))

(assert (=> bm!40425 d!112297))

(assert (=> b!913265 d!112205))

(declare-fun b!913488 () Bool)

(declare-fun e!512396 () Bool)

(assert (=> b!913488 (= e!512396 tp_is_empty!19147)))

(declare-fun b!913489 () Bool)

(declare-fun e!512397 () Bool)

(assert (=> b!913489 (= e!512397 tp_is_empty!19147)))

(declare-fun mapNonEmpty!30461 () Bool)

(declare-fun mapRes!30461 () Bool)

(declare-fun tp!58484 () Bool)

(assert (=> mapNonEmpty!30461 (= mapRes!30461 (and tp!58484 e!512396))))

(declare-fun mapRest!30461 () (Array (_ BitVec 32) ValueCell!9092))

(declare-fun mapKey!30461 () (_ BitVec 32))

(declare-fun mapValue!30461 () ValueCell!9092)

(assert (=> mapNonEmpty!30461 (= mapRest!30460 (store mapRest!30461 mapKey!30461 mapValue!30461))))

(declare-fun mapIsEmpty!30461 () Bool)

(assert (=> mapIsEmpty!30461 mapRes!30461))

(declare-fun condMapEmpty!30461 () Bool)

(declare-fun mapDefault!30461 () ValueCell!9092)

(assert (=> mapNonEmpty!30460 (= condMapEmpty!30461 (= mapRest!30460 ((as const (Array (_ BitVec 32) ValueCell!9092)) mapDefault!30461)))))

(assert (=> mapNonEmpty!30460 (= tp!58483 (and e!512397 mapRes!30461))))

(assert (= (and mapNonEmpty!30460 condMapEmpty!30461) mapIsEmpty!30461))

(assert (= (and mapNonEmpty!30460 (not condMapEmpty!30461)) mapNonEmpty!30461))

(assert (= (and mapNonEmpty!30461 ((_ is ValueCellFull!9092) mapValue!30461)) b!913488))

(assert (= (and mapNonEmpty!30460 ((_ is ValueCellFull!9092) mapDefault!30461)) b!913489))

(declare-fun m!847513 () Bool)

(assert (=> mapNonEmpty!30461 m!847513))

(declare-fun b_lambda!13313 () Bool)

(assert (= b_lambda!13305 (or (and start!78240 b_free!16729) b_lambda!13313)))

(declare-fun b_lambda!13315 () Bool)

(assert (= b_lambda!13309 (or (and start!78240 b_free!16729) b_lambda!13315)))

(declare-fun b_lambda!13317 () Bool)

(assert (= b_lambda!13311 (or (and start!78240 b_free!16729) b_lambda!13317)))

(declare-fun b_lambda!13319 () Bool)

(assert (= b_lambda!13307 (or (and start!78240 b_free!16729) b_lambda!13319)))

(check-sat (not b!913434) (not b!913301) (not d!112297) (not d!112179) (not d!112293) (not b!913306) (not b!913392) (not d!112189) (not d!112163) (not b!913461) (not b!913413) (not b!913404) (not b!913458) (not b!913335) (not b!913475) (not b!913307) (not d!112241) (not d!112283) (not b!913484) (not d!112223) (not b!913466) (not b!913412) (not b!913372) (not b!913383) (not b_lambda!13303) (not d!112191) (not d!112285) (not d!112267) (not b!913479) (not d!112213) (not d!112209) (not d!112165) (not b!913369) (not d!112195) (not b!913431) (not b!913481) (not d!112169) (not b!913465) tp_is_empty!19147 (not b!913410) (not b!913334) (not b!913485) (not d!112199) (not b!913428) (not d!112231) (not b_lambda!13317) (not bm!40429) (not b!913332) (not d!112197) (not d!112251) (not d!112185) (not d!112177) (not d!112275) (not d!112175) (not d!112281) (not d!112203) (not b!913438) (not b!913487) (not b!913477) (not b_lambda!13301) (not b_next!16729) (not d!112225) (not b!913388) (not d!112229) (not b!913474) (not b!913368) (not b!913370) (not b!913420) (not b!913393) (not b!913373) (not b!913401) (not d!112253) (not b!913381) (not d!112269) (not b!913336) (not b!913398) (not d!112173) (not d!112273) (not b!913338) (not d!112233) (not d!112245) (not d!112261) (not b!913367) (not b!913324) (not b!913333) (not b!913299) (not b!913436) (not d!112215) (not d!112239) b_and!27297 (not mapNonEmpty!30461) (not b!913452) (not b!913405) (not b!913389) (not b_lambda!13313) (not d!112243) (not b!913464) (not b!913406) (not b!913386) (not b!913374) (not b!913382) (not b!913430) (not b!913394) (not d!112237) (not d!112211) (not b!913313) (not bm!40431) (not b_lambda!13319) (not d!112183) (not b!913397) (not b!913380) (not b!913399) (not d!112193) (not b!913330) (not d!112221) (not b!913337) (not d!112289) (not bm!40430) (not b!913390) (not b!913421) (not d!112207) (not b!913376) (not b!913407) (not d!112235) (not b_lambda!13315) (not d!112217) (not b!913414) (not b!913423) (not d!112263) (not b!913378) (not d!112167) (not d!112187) (not b!913395) (not bm!40432) (not b!913478) (not b!913483) (not d!112247) (not b!913379) (not b!913473) (not b!913468) (not d!112227) (not d!112201) (not b!913411) (not d!112219) (not d!112181))
(check-sat b_and!27297 (not b_next!16729))
