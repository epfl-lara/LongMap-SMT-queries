; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78648 () Bool)

(assert start!78648)

(declare-fun b!915968 () Bool)

(declare-fun res!617353 () Bool)

(declare-fun e!514057 () Bool)

(assert (=> b!915968 (=> (not res!617353) (not e!514057))))

(declare-datatypes ((array!54483 0))(
  ( (array!54484 (arr!26183 (Array (_ BitVec 32) (_ BitVec 64))) (size!26643 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54483)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30583 0))(
  ( (V!30584 (val!9657 Int)) )
))
(declare-datatypes ((ValueCell!9125 0))(
  ( (ValueCellFull!9125 (v!12171 V!30583)) (EmptyCell!9125) )
))
(declare-datatypes ((array!54485 0))(
  ( (array!54486 (arr!26184 (Array (_ BitVec 32) ValueCell!9125)) (size!26644 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54485)

(assert (=> b!915968 (= res!617353 (and (= (size!26644 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26643 _keys!1487) (size!26644 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915969 () Bool)

(declare-fun e!514056 () Bool)

(assert (=> b!915969 (= e!514057 e!514056)))

(declare-fun res!617356 () Bool)

(assert (=> b!915969 (=> res!617356 e!514056)))

(declare-datatypes ((List!18347 0))(
  ( (Nil!18344) (Cons!18343 (h!19495 (_ BitVec 64)) (t!25952 List!18347)) )
))
(declare-fun contains!4691 (List!18347 (_ BitVec 64)) Bool)

(assert (=> b!915969 (= res!617356 (contains!4691 Nil!18344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!30573 () Bool)

(declare-fun mapRes!30573 () Bool)

(assert (=> mapIsEmpty!30573 mapRes!30573))

(declare-fun b!915970 () Bool)

(declare-fun e!514058 () Bool)

(declare-fun tp_is_empty!19213 () Bool)

(assert (=> b!915970 (= e!514058 tp_is_empty!19213)))

(declare-fun b!915971 () Bool)

(declare-fun res!617354 () Bool)

(assert (=> b!915971 (=> (not res!617354) (not e!514057))))

(declare-fun noDuplicate!1336 (List!18347) Bool)

(assert (=> b!915971 (= res!617354 (noDuplicate!1336 Nil!18344))))

(declare-fun res!617352 () Bool)

(assert (=> start!78648 (=> (not res!617352) (not e!514057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78648 (= res!617352 (validMask!0 mask!1881))))

(assert (=> start!78648 e!514057))

(assert (=> start!78648 true))

(declare-fun e!514055 () Bool)

(declare-fun array_inv!20538 (array!54485) Bool)

(assert (=> start!78648 (and (array_inv!20538 _values!1231) e!514055)))

(declare-fun array_inv!20539 (array!54483) Bool)

(assert (=> start!78648 (array_inv!20539 _keys!1487)))

(declare-fun b!915972 () Bool)

(declare-fun res!617355 () Bool)

(assert (=> b!915972 (=> (not res!617355) (not e!514057))))

(assert (=> b!915972 (= res!617355 (and (bvsle #b00000000000000000000000000000000 (size!26643 _keys!1487)) (bvslt (size!26643 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!915973 () Bool)

(assert (=> b!915973 (= e!514055 (and e!514058 mapRes!30573))))

(declare-fun condMapEmpty!30573 () Bool)

(declare-fun mapDefault!30573 () ValueCell!9125)

(assert (=> b!915973 (= condMapEmpty!30573 (= (arr!26184 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9125)) mapDefault!30573)))))

(declare-fun b!915974 () Bool)

(declare-fun e!514054 () Bool)

(assert (=> b!915974 (= e!514054 tp_is_empty!19213)))

(declare-fun mapNonEmpty!30573 () Bool)

(declare-fun tp!58641 () Bool)

(assert (=> mapNonEmpty!30573 (= mapRes!30573 (and tp!58641 e!514054))))

(declare-fun mapValue!30573 () ValueCell!9125)

(declare-fun mapRest!30573 () (Array (_ BitVec 32) ValueCell!9125))

(declare-fun mapKey!30573 () (_ BitVec 32))

(assert (=> mapNonEmpty!30573 (= (arr!26184 _values!1231) (store mapRest!30573 mapKey!30573 mapValue!30573))))

(declare-fun b!915975 () Bool)

(assert (=> b!915975 (= e!514056 (contains!4691 Nil!18344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915976 () Bool)

(declare-fun res!617351 () Bool)

(assert (=> b!915976 (=> (not res!617351) (not e!514057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54483 (_ BitVec 32)) Bool)

(assert (=> b!915976 (= res!617351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78648 res!617352) b!915968))

(assert (= (and b!915968 res!617353) b!915976))

(assert (= (and b!915976 res!617351) b!915972))

(assert (= (and b!915972 res!617355) b!915971))

(assert (= (and b!915971 res!617354) b!915969))

(assert (= (and b!915969 (not res!617356)) b!915975))

(assert (= (and b!915973 condMapEmpty!30573) mapIsEmpty!30573))

(assert (= (and b!915973 (not condMapEmpty!30573)) mapNonEmpty!30573))

(get-info :version)

(assert (= (and mapNonEmpty!30573 ((_ is ValueCellFull!9125) mapValue!30573)) b!915974))

(assert (= (and b!915973 ((_ is ValueCellFull!9125) mapDefault!30573)) b!915970))

(assert (= start!78648 b!915973))

(declare-fun m!850857 () Bool)

(assert (=> start!78648 m!850857))

(declare-fun m!850859 () Bool)

(assert (=> start!78648 m!850859))

(declare-fun m!850861 () Bool)

(assert (=> start!78648 m!850861))

(declare-fun m!850863 () Bool)

(assert (=> mapNonEmpty!30573 m!850863))

(declare-fun m!850865 () Bool)

(assert (=> b!915975 m!850865))

(declare-fun m!850867 () Bool)

(assert (=> b!915969 m!850867))

(declare-fun m!850869 () Bool)

(assert (=> b!915976 m!850869))

(declare-fun m!850871 () Bool)

(assert (=> b!915971 m!850871))

(check-sat (not mapNonEmpty!30573) tp_is_empty!19213 (not b!915976) (not b!915971) (not b!915975) (not start!78648) (not b!915969))
(check-sat)
(get-model)

(declare-fun b!916039 () Bool)

(declare-fun e!514103 () Bool)

(declare-fun call!40594 () Bool)

(assert (=> b!916039 (= e!514103 call!40594)))

(declare-fun b!916040 () Bool)

(declare-fun e!514102 () Bool)

(declare-fun e!514101 () Bool)

(assert (=> b!916040 (= e!514102 e!514101)))

(declare-fun c!96333 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!916040 (= c!96333 (validKeyInArray!0 (select (arr!26183 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!916041 () Bool)

(assert (=> b!916041 (= e!514101 e!514103)))

(declare-fun lt!411981 () (_ BitVec 64))

(assert (=> b!916041 (= lt!411981 (select (arr!26183 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30952 0))(
  ( (Unit!30953) )
))
(declare-fun lt!411980 () Unit!30952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54483 (_ BitVec 64) (_ BitVec 32)) Unit!30952)

(assert (=> b!916041 (= lt!411980 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411981 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!916041 (arrayContainsKey!0 _keys!1487 lt!411981 #b00000000000000000000000000000000)))

(declare-fun lt!411982 () Unit!30952)

(assert (=> b!916041 (= lt!411982 lt!411980)))

(declare-fun res!617398 () Bool)

(declare-datatypes ((SeekEntryResult!8929 0))(
  ( (MissingZero!8929 (index!38087 (_ BitVec 32))) (Found!8929 (index!38088 (_ BitVec 32))) (Intermediate!8929 (undefined!9741 Bool) (index!38089 (_ BitVec 32)) (x!78258 (_ BitVec 32))) (Undefined!8929) (MissingVacant!8929 (index!38090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54483 (_ BitVec 32)) SeekEntryResult!8929)

(assert (=> b!916041 (= res!617398 (= (seekEntryOrOpen!0 (select (arr!26183 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8929 #b00000000000000000000000000000000)))))

(assert (=> b!916041 (=> (not res!617398) (not e!514103))))

(declare-fun d!113059 () Bool)

(declare-fun res!617397 () Bool)

(assert (=> d!113059 (=> res!617397 e!514102)))

(assert (=> d!113059 (= res!617397 (bvsge #b00000000000000000000000000000000 (size!26643 _keys!1487)))))

(assert (=> d!113059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!514102)))

(declare-fun b!916042 () Bool)

(assert (=> b!916042 (= e!514101 call!40594)))

(declare-fun bm!40591 () Bool)

(assert (=> bm!40591 (= call!40594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113059 (not res!617397)) b!916040))

(assert (= (and b!916040 c!96333) b!916041))

(assert (= (and b!916040 (not c!96333)) b!916042))

(assert (= (and b!916041 res!617398) b!916039))

(assert (= (or b!916039 b!916042) bm!40591))

(declare-fun m!850905 () Bool)

(assert (=> b!916040 m!850905))

(assert (=> b!916040 m!850905))

(declare-fun m!850907 () Bool)

(assert (=> b!916040 m!850907))

(assert (=> b!916041 m!850905))

(declare-fun m!850909 () Bool)

(assert (=> b!916041 m!850909))

(declare-fun m!850911 () Bool)

(assert (=> b!916041 m!850911))

(assert (=> b!916041 m!850905))

(declare-fun m!850913 () Bool)

(assert (=> b!916041 m!850913))

(declare-fun m!850915 () Bool)

(assert (=> bm!40591 m!850915))

(assert (=> b!915976 d!113059))

(declare-fun d!113061 () Bool)

(declare-fun res!617403 () Bool)

(declare-fun e!514108 () Bool)

(assert (=> d!113061 (=> res!617403 e!514108)))

(assert (=> d!113061 (= res!617403 ((_ is Nil!18344) Nil!18344))))

(assert (=> d!113061 (= (noDuplicate!1336 Nil!18344) e!514108)))

(declare-fun b!916047 () Bool)

(declare-fun e!514109 () Bool)

(assert (=> b!916047 (= e!514108 e!514109)))

(declare-fun res!617404 () Bool)

(assert (=> b!916047 (=> (not res!617404) (not e!514109))))

(assert (=> b!916047 (= res!617404 (not (contains!4691 (t!25952 Nil!18344) (h!19495 Nil!18344))))))

(declare-fun b!916048 () Bool)

(assert (=> b!916048 (= e!514109 (noDuplicate!1336 (t!25952 Nil!18344)))))

(assert (= (and d!113061 (not res!617403)) b!916047))

(assert (= (and b!916047 res!617404) b!916048))

(declare-fun m!850917 () Bool)

(assert (=> b!916047 m!850917))

(declare-fun m!850919 () Bool)

(assert (=> b!916048 m!850919))

(assert (=> b!915971 d!113061))

(declare-fun d!113063 () Bool)

(declare-fun lt!411985 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!405 (List!18347) (InoxSet (_ BitVec 64)))

(assert (=> d!113063 (= lt!411985 (select (content!405 Nil!18344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!514115 () Bool)

(assert (=> d!113063 (= lt!411985 e!514115)))

(declare-fun res!617410 () Bool)

(assert (=> d!113063 (=> (not res!617410) (not e!514115))))

(assert (=> d!113063 (= res!617410 ((_ is Cons!18343) Nil!18344))))

(assert (=> d!113063 (= (contains!4691 Nil!18344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411985)))

(declare-fun b!916053 () Bool)

(declare-fun e!514114 () Bool)

(assert (=> b!916053 (= e!514115 e!514114)))

(declare-fun res!617409 () Bool)

(assert (=> b!916053 (=> res!617409 e!514114)))

(assert (=> b!916053 (= res!617409 (= (h!19495 Nil!18344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!916054 () Bool)

(assert (=> b!916054 (= e!514114 (contains!4691 (t!25952 Nil!18344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113063 res!617410) b!916053))

(assert (= (and b!916053 (not res!617409)) b!916054))

(declare-fun m!850921 () Bool)

(assert (=> d!113063 m!850921))

(declare-fun m!850923 () Bool)

(assert (=> d!113063 m!850923))

(declare-fun m!850925 () Bool)

(assert (=> b!916054 m!850925))

(assert (=> b!915975 d!113063))

(declare-fun d!113065 () Bool)

(assert (=> d!113065 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78648 d!113065))

(declare-fun d!113067 () Bool)

(assert (=> d!113067 (= (array_inv!20538 _values!1231) (bvsge (size!26644 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78648 d!113067))

(declare-fun d!113069 () Bool)

(assert (=> d!113069 (= (array_inv!20539 _keys!1487) (bvsge (size!26643 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78648 d!113069))

(declare-fun d!113071 () Bool)

(declare-fun lt!411986 () Bool)

(assert (=> d!113071 (= lt!411986 (select (content!405 Nil!18344) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!514117 () Bool)

(assert (=> d!113071 (= lt!411986 e!514117)))

(declare-fun res!617412 () Bool)

(assert (=> d!113071 (=> (not res!617412) (not e!514117))))

(assert (=> d!113071 (= res!617412 ((_ is Cons!18343) Nil!18344))))

(assert (=> d!113071 (= (contains!4691 Nil!18344 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411986)))

(declare-fun b!916055 () Bool)

(declare-fun e!514116 () Bool)

(assert (=> b!916055 (= e!514117 e!514116)))

(declare-fun res!617411 () Bool)

(assert (=> b!916055 (=> res!617411 e!514116)))

(assert (=> b!916055 (= res!617411 (= (h!19495 Nil!18344) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!916056 () Bool)

(assert (=> b!916056 (= e!514116 (contains!4691 (t!25952 Nil!18344) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113071 res!617412) b!916055))

(assert (= (and b!916055 (not res!617411)) b!916056))

(assert (=> d!113071 m!850921))

(declare-fun m!850927 () Bool)

(assert (=> d!113071 m!850927))

(declare-fun m!850929 () Bool)

(assert (=> b!916056 m!850929))

(assert (=> b!915969 d!113071))

(declare-fun mapNonEmpty!30582 () Bool)

(declare-fun mapRes!30582 () Bool)

(declare-fun tp!58650 () Bool)

(declare-fun e!514122 () Bool)

(assert (=> mapNonEmpty!30582 (= mapRes!30582 (and tp!58650 e!514122))))

(declare-fun mapValue!30582 () ValueCell!9125)

(declare-fun mapKey!30582 () (_ BitVec 32))

(declare-fun mapRest!30582 () (Array (_ BitVec 32) ValueCell!9125))

(assert (=> mapNonEmpty!30582 (= mapRest!30573 (store mapRest!30582 mapKey!30582 mapValue!30582))))

(declare-fun mapIsEmpty!30582 () Bool)

(assert (=> mapIsEmpty!30582 mapRes!30582))

(declare-fun b!916063 () Bool)

(assert (=> b!916063 (= e!514122 tp_is_empty!19213)))

(declare-fun b!916064 () Bool)

(declare-fun e!514123 () Bool)

(assert (=> b!916064 (= e!514123 tp_is_empty!19213)))

(declare-fun condMapEmpty!30582 () Bool)

(declare-fun mapDefault!30582 () ValueCell!9125)

(assert (=> mapNonEmpty!30573 (= condMapEmpty!30582 (= mapRest!30573 ((as const (Array (_ BitVec 32) ValueCell!9125)) mapDefault!30582)))))

(assert (=> mapNonEmpty!30573 (= tp!58641 (and e!514123 mapRes!30582))))

(assert (= (and mapNonEmpty!30573 condMapEmpty!30582) mapIsEmpty!30582))

(assert (= (and mapNonEmpty!30573 (not condMapEmpty!30582)) mapNonEmpty!30582))

(assert (= (and mapNonEmpty!30582 ((_ is ValueCellFull!9125) mapValue!30582)) b!916063))

(assert (= (and mapNonEmpty!30573 ((_ is ValueCellFull!9125) mapDefault!30582)) b!916064))

(declare-fun m!850931 () Bool)

(assert (=> mapNonEmpty!30582 m!850931))

(check-sat tp_is_empty!19213 (not b!916041) (not b!916048) (not d!113071) (not d!113063) (not b!916056) (not b!916054) (not b!916040) (not mapNonEmpty!30582) (not b!916047) (not bm!40591))
(check-sat)
