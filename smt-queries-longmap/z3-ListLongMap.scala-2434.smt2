; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38374 () Bool)

(assert start!38374)

(declare-fun mapIsEmpty!16377 () Bool)

(declare-fun mapRes!16377 () Bool)

(assert (=> mapIsEmpty!16377 mapRes!16377))

(declare-fun b!395932 () Bool)

(declare-fun res!227096 () Bool)

(declare-fun e!239635 () Bool)

(assert (=> b!395932 (=> (not res!227096) (not e!239635))))

(declare-datatypes ((array!23582 0))(
  ( (array!23583 (arr!11242 (Array (_ BitVec 32) (_ BitVec 64))) (size!11594 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23582)

(assert (=> b!395932 (= res!227096 (and (bvsle #b00000000000000000000000000000000 (size!11594 _keys!709)) (bvslt (size!11594 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395933 () Bool)

(declare-fun res!227090 () Bool)

(assert (=> b!395933 (=> (not res!227090) (not e!239635))))

(declare-datatypes ((V!14227 0))(
  ( (V!14228 (val!4965 Int)) )
))
(declare-datatypes ((ValueCell!4577 0))(
  ( (ValueCellFull!4577 (v!7212 V!14227)) (EmptyCell!4577) )
))
(declare-datatypes ((array!23584 0))(
  ( (array!23585 (arr!11243 (Array (_ BitVec 32) ValueCell!4577)) (size!11595 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23584)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395933 (= res!227090 (and (= (size!11595 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11594 _keys!709) (size!11595 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395934 () Bool)

(declare-fun res!227089 () Bool)

(assert (=> b!395934 (=> (not res!227089) (not e!239635))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395934 (= res!227089 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395935 () Bool)

(declare-fun res!227097 () Bool)

(assert (=> b!395935 (=> (not res!227097) (not e!239635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23582 (_ BitVec 32)) Bool)

(assert (=> b!395935 (= res!227097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395936 () Bool)

(declare-fun e!239632 () Bool)

(declare-fun tp_is_empty!9841 () Bool)

(assert (=> b!395936 (= e!239632 tp_is_empty!9841)))

(declare-fun mapNonEmpty!16377 () Bool)

(declare-fun tp!32172 () Bool)

(assert (=> mapNonEmpty!16377 (= mapRes!16377 (and tp!32172 e!239632))))

(declare-fun mapKey!16377 () (_ BitVec 32))

(declare-fun mapValue!16377 () ValueCell!4577)

(declare-fun mapRest!16377 () (Array (_ BitVec 32) ValueCell!4577))

(assert (=> mapNonEmpty!16377 (= (arr!11243 _values!549) (store mapRest!16377 mapKey!16377 mapValue!16377))))

(declare-fun b!395937 () Bool)

(declare-fun res!227094 () Bool)

(assert (=> b!395937 (=> (not res!227094) (not e!239635))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395937 (= res!227094 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11594 _keys!709))))))

(declare-fun b!395938 () Bool)

(declare-fun res!227093 () Bool)

(assert (=> b!395938 (=> (not res!227093) (not e!239635))))

(assert (=> b!395938 (= res!227093 (or (= (select (arr!11242 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11242 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!227088 () Bool)

(assert (=> start!38374 (=> (not res!227088) (not e!239635))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38374 (= res!227088 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11594 _keys!709))))))

(assert (=> start!38374 e!239635))

(assert (=> start!38374 true))

(declare-fun e!239634 () Bool)

(declare-fun array_inv!8312 (array!23584) Bool)

(assert (=> start!38374 (and (array_inv!8312 _values!549) e!239634)))

(declare-fun array_inv!8313 (array!23582) Bool)

(assert (=> start!38374 (array_inv!8313 _keys!709)))

(declare-fun b!395939 () Bool)

(declare-fun res!227087 () Bool)

(assert (=> b!395939 (=> (not res!227087) (not e!239635))))

(assert (=> b!395939 (= res!227087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)) mask!1025))))

(declare-fun b!395940 () Bool)

(declare-fun res!227095 () Bool)

(assert (=> b!395940 (=> (not res!227095) (not e!239635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395940 (= res!227095 (validKeyInArray!0 k0!794))))

(declare-fun b!395941 () Bool)

(declare-fun res!227092 () Bool)

(assert (=> b!395941 (=> (not res!227092) (not e!239635))))

(declare-datatypes ((List!6386 0))(
  ( (Nil!6383) (Cons!6382 (h!7238 (_ BitVec 64)) (t!11552 List!6386)) )
))
(declare-fun arrayNoDuplicates!0 (array!23582 (_ BitVec 32) List!6386) Bool)

(assert (=> b!395941 (= res!227092 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6383))))

(declare-fun b!395942 () Bool)

(declare-fun res!227091 () Bool)

(assert (=> b!395942 (=> (not res!227091) (not e!239635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395942 (= res!227091 (validMask!0 mask!1025))))

(declare-fun b!395943 () Bool)

(declare-fun e!239636 () Bool)

(assert (=> b!395943 (= e!239634 (and e!239636 mapRes!16377))))

(declare-fun condMapEmpty!16377 () Bool)

(declare-fun mapDefault!16377 () ValueCell!4577)

(assert (=> b!395943 (= condMapEmpty!16377 (= (arr!11243 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4577)) mapDefault!16377)))))

(declare-fun b!395944 () Bool)

(assert (=> b!395944 (= e!239636 tp_is_empty!9841)))

(declare-fun b!395945 () Bool)

(declare-fun noDuplicate!198 (List!6386) Bool)

(assert (=> b!395945 (= e!239635 (not (noDuplicate!198 Nil!6383)))))

(assert (= (and start!38374 res!227088) b!395942))

(assert (= (and b!395942 res!227091) b!395933))

(assert (= (and b!395933 res!227090) b!395935))

(assert (= (and b!395935 res!227097) b!395941))

(assert (= (and b!395941 res!227092) b!395937))

(assert (= (and b!395937 res!227094) b!395940))

(assert (= (and b!395940 res!227095) b!395938))

(assert (= (and b!395938 res!227093) b!395934))

(assert (= (and b!395934 res!227089) b!395939))

(assert (= (and b!395939 res!227087) b!395932))

(assert (= (and b!395932 res!227096) b!395945))

(assert (= (and b!395943 condMapEmpty!16377) mapIsEmpty!16377))

(assert (= (and b!395943 (not condMapEmpty!16377)) mapNonEmpty!16377))

(get-info :version)

(assert (= (and mapNonEmpty!16377 ((_ is ValueCellFull!4577) mapValue!16377)) b!395936))

(assert (= (and b!395943 ((_ is ValueCellFull!4577) mapDefault!16377)) b!395944))

(assert (= start!38374 b!395943))

(declare-fun m!392015 () Bool)

(assert (=> mapNonEmpty!16377 m!392015))

(declare-fun m!392017 () Bool)

(assert (=> b!395941 m!392017))

(declare-fun m!392019 () Bool)

(assert (=> b!395942 m!392019))

(declare-fun m!392021 () Bool)

(assert (=> b!395935 m!392021))

(declare-fun m!392023 () Bool)

(assert (=> b!395940 m!392023))

(declare-fun m!392025 () Bool)

(assert (=> start!38374 m!392025))

(declare-fun m!392027 () Bool)

(assert (=> start!38374 m!392027))

(declare-fun m!392029 () Bool)

(assert (=> b!395945 m!392029))

(declare-fun m!392031 () Bool)

(assert (=> b!395938 m!392031))

(declare-fun m!392033 () Bool)

(assert (=> b!395934 m!392033))

(declare-fun m!392035 () Bool)

(assert (=> b!395939 m!392035))

(declare-fun m!392037 () Bool)

(assert (=> b!395939 m!392037))

(check-sat (not b!395942) (not b!395934) (not mapNonEmpty!16377) (not b!395935) tp_is_empty!9841 (not b!395941) (not start!38374) (not b!395939) (not b!395945) (not b!395940))
(check-sat)
(get-model)

(declare-fun d!73405 () Bool)

(declare-fun res!227169 () Bool)

(declare-fun e!239673 () Bool)

(assert (=> d!73405 (=> res!227169 e!239673)))

(assert (=> d!73405 (= res!227169 (bvsge #b00000000000000000000000000000000 (size!11594 _keys!709)))))

(assert (=> d!73405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239673)))

(declare-fun bm!27869 () Bool)

(declare-fun call!27872 () Bool)

(assert (=> bm!27869 (= call!27872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!396038 () Bool)

(declare-fun e!239674 () Bool)

(assert (=> b!396038 (= e!239673 e!239674)))

(declare-fun c!54538 () Bool)

(assert (=> b!396038 (= c!54538 (validKeyInArray!0 (select (arr!11242 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396039 () Bool)

(assert (=> b!396039 (= e!239674 call!27872)))

(declare-fun b!396040 () Bool)

(declare-fun e!239675 () Bool)

(assert (=> b!396040 (= e!239675 call!27872)))

(declare-fun b!396041 () Bool)

(assert (=> b!396041 (= e!239674 e!239675)))

(declare-fun lt!187132 () (_ BitVec 64))

(assert (=> b!396041 (= lt!187132 (select (arr!11242 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12043 0))(
  ( (Unit!12044) )
))
(declare-fun lt!187133 () Unit!12043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23582 (_ BitVec 64) (_ BitVec 32)) Unit!12043)

(assert (=> b!396041 (= lt!187133 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187132 #b00000000000000000000000000000000))))

(assert (=> b!396041 (arrayContainsKey!0 _keys!709 lt!187132 #b00000000000000000000000000000000)))

(declare-fun lt!187131 () Unit!12043)

(assert (=> b!396041 (= lt!187131 lt!187133)))

(declare-fun res!227168 () Bool)

(declare-datatypes ((SeekEntryResult!3474 0))(
  ( (MissingZero!3474 (index!16075 (_ BitVec 32))) (Found!3474 (index!16076 (_ BitVec 32))) (Intermediate!3474 (undefined!4286 Bool) (index!16077 (_ BitVec 32)) (x!38629 (_ BitVec 32))) (Undefined!3474) (MissingVacant!3474 (index!16078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23582 (_ BitVec 32)) SeekEntryResult!3474)

(assert (=> b!396041 (= res!227168 (= (seekEntryOrOpen!0 (select (arr!11242 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3474 #b00000000000000000000000000000000)))))

(assert (=> b!396041 (=> (not res!227168) (not e!239675))))

(assert (= (and d!73405 (not res!227169)) b!396038))

(assert (= (and b!396038 c!54538) b!396041))

(assert (= (and b!396038 (not c!54538)) b!396039))

(assert (= (and b!396041 res!227168) b!396040))

(assert (= (or b!396040 b!396039) bm!27869))

(declare-fun m!392087 () Bool)

(assert (=> bm!27869 m!392087))

(declare-fun m!392089 () Bool)

(assert (=> b!396038 m!392089))

(assert (=> b!396038 m!392089))

(declare-fun m!392091 () Bool)

(assert (=> b!396038 m!392091))

(assert (=> b!396041 m!392089))

(declare-fun m!392093 () Bool)

(assert (=> b!396041 m!392093))

(declare-fun m!392095 () Bool)

(assert (=> b!396041 m!392095))

(assert (=> b!396041 m!392089))

(declare-fun m!392097 () Bool)

(assert (=> b!396041 m!392097))

(assert (=> b!395935 d!73405))

(declare-fun d!73407 () Bool)

(declare-fun res!227171 () Bool)

(declare-fun e!239676 () Bool)

(assert (=> d!73407 (=> res!227171 e!239676)))

(assert (=> d!73407 (= res!227171 (bvsge #b00000000000000000000000000000000 (size!11594 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)))))))

(assert (=> d!73407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)) mask!1025) e!239676)))

(declare-fun bm!27870 () Bool)

(declare-fun call!27873 () Bool)

(assert (=> bm!27870 (= call!27873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)) mask!1025))))

(declare-fun b!396042 () Bool)

(declare-fun e!239677 () Bool)

(assert (=> b!396042 (= e!239676 e!239677)))

(declare-fun c!54539 () Bool)

(assert (=> b!396042 (= c!54539 (validKeyInArray!0 (select (arr!11242 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709))) #b00000000000000000000000000000000)))))

(declare-fun b!396043 () Bool)

(assert (=> b!396043 (= e!239677 call!27873)))

(declare-fun b!396044 () Bool)

(declare-fun e!239678 () Bool)

(assert (=> b!396044 (= e!239678 call!27873)))

(declare-fun b!396045 () Bool)

(assert (=> b!396045 (= e!239677 e!239678)))

(declare-fun lt!187135 () (_ BitVec 64))

(assert (=> b!396045 (= lt!187135 (select (arr!11242 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709))) #b00000000000000000000000000000000))))

(declare-fun lt!187136 () Unit!12043)

(assert (=> b!396045 (= lt!187136 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)) lt!187135 #b00000000000000000000000000000000))))

(assert (=> b!396045 (arrayContainsKey!0 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)) lt!187135 #b00000000000000000000000000000000)))

(declare-fun lt!187134 () Unit!12043)

(assert (=> b!396045 (= lt!187134 lt!187136)))

(declare-fun res!227170 () Bool)

(assert (=> b!396045 (= res!227170 (= (seekEntryOrOpen!0 (select (arr!11242 (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709))) #b00000000000000000000000000000000) (array!23583 (store (arr!11242 _keys!709) i!563 k0!794) (size!11594 _keys!709)) mask!1025) (Found!3474 #b00000000000000000000000000000000)))))

(assert (=> b!396045 (=> (not res!227170) (not e!239678))))

(assert (= (and d!73407 (not res!227171)) b!396042))

(assert (= (and b!396042 c!54539) b!396045))

(assert (= (and b!396042 (not c!54539)) b!396043))

(assert (= (and b!396045 res!227170) b!396044))

(assert (= (or b!396044 b!396043) bm!27870))

(declare-fun m!392099 () Bool)

(assert (=> bm!27870 m!392099))

(declare-fun m!392101 () Bool)

(assert (=> b!396042 m!392101))

(assert (=> b!396042 m!392101))

(declare-fun m!392103 () Bool)

(assert (=> b!396042 m!392103))

(assert (=> b!396045 m!392101))

(declare-fun m!392105 () Bool)

(assert (=> b!396045 m!392105))

(declare-fun m!392107 () Bool)

(assert (=> b!396045 m!392107))

(assert (=> b!396045 m!392101))

(declare-fun m!392109 () Bool)

(assert (=> b!396045 m!392109))

(assert (=> b!395939 d!73407))

(declare-fun d!73409 () Bool)

(declare-fun res!227176 () Bool)

(declare-fun e!239683 () Bool)

(assert (=> d!73409 (=> res!227176 e!239683)))

(assert (=> d!73409 (= res!227176 (= (select (arr!11242 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73409 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239683)))

(declare-fun b!396050 () Bool)

(declare-fun e!239684 () Bool)

(assert (=> b!396050 (= e!239683 e!239684)))

(declare-fun res!227177 () Bool)

(assert (=> b!396050 (=> (not res!227177) (not e!239684))))

(assert (=> b!396050 (= res!227177 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11594 _keys!709)))))

(declare-fun b!396051 () Bool)

(assert (=> b!396051 (= e!239684 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73409 (not res!227176)) b!396050))

(assert (= (and b!396050 res!227177) b!396051))

(assert (=> d!73409 m!392089))

(declare-fun m!392111 () Bool)

(assert (=> b!396051 m!392111))

(assert (=> b!395934 d!73409))

(declare-fun d!73411 () Bool)

(assert (=> d!73411 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395940 d!73411))

(declare-fun d!73413 () Bool)

(declare-fun res!227182 () Bool)

(declare-fun e!239689 () Bool)

(assert (=> d!73413 (=> res!227182 e!239689)))

(assert (=> d!73413 (= res!227182 ((_ is Nil!6383) Nil!6383))))

(assert (=> d!73413 (= (noDuplicate!198 Nil!6383) e!239689)))

(declare-fun b!396056 () Bool)

(declare-fun e!239690 () Bool)

(assert (=> b!396056 (= e!239689 e!239690)))

(declare-fun res!227183 () Bool)

(assert (=> b!396056 (=> (not res!227183) (not e!239690))))

(declare-fun contains!2461 (List!6386 (_ BitVec 64)) Bool)

(assert (=> b!396056 (= res!227183 (not (contains!2461 (t!11552 Nil!6383) (h!7238 Nil!6383))))))

(declare-fun b!396057 () Bool)

(assert (=> b!396057 (= e!239690 (noDuplicate!198 (t!11552 Nil!6383)))))

(assert (= (and d!73413 (not res!227182)) b!396056))

(assert (= (and b!396056 res!227183) b!396057))

(declare-fun m!392113 () Bool)

(assert (=> b!396056 m!392113))

(declare-fun m!392115 () Bool)

(assert (=> b!396057 m!392115))

(assert (=> b!395945 d!73413))

(declare-fun d!73415 () Bool)

(assert (=> d!73415 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395942 d!73415))

(declare-fun d!73417 () Bool)

(declare-fun res!227190 () Bool)

(declare-fun e!239701 () Bool)

(assert (=> d!73417 (=> res!227190 e!239701)))

(assert (=> d!73417 (= res!227190 (bvsge #b00000000000000000000000000000000 (size!11594 _keys!709)))))

(assert (=> d!73417 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6383) e!239701)))

(declare-fun b!396068 () Bool)

(declare-fun e!239699 () Bool)

(assert (=> b!396068 (= e!239699 (contains!2461 Nil!6383 (select (arr!11242 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396069 () Bool)

(declare-fun e!239700 () Bool)

(assert (=> b!396069 (= e!239701 e!239700)))

(declare-fun res!227191 () Bool)

(assert (=> b!396069 (=> (not res!227191) (not e!239700))))

(assert (=> b!396069 (= res!227191 (not e!239699))))

(declare-fun res!227192 () Bool)

(assert (=> b!396069 (=> (not res!227192) (not e!239699))))

(assert (=> b!396069 (= res!227192 (validKeyInArray!0 (select (arr!11242 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27873 () Bool)

(declare-fun call!27876 () Bool)

(declare-fun c!54542 () Bool)

(assert (=> bm!27873 (= call!27876 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54542 (Cons!6382 (select (arr!11242 _keys!709) #b00000000000000000000000000000000) Nil!6383) Nil!6383)))))

(declare-fun b!396070 () Bool)

(declare-fun e!239702 () Bool)

(assert (=> b!396070 (= e!239702 call!27876)))

(declare-fun b!396071 () Bool)

(assert (=> b!396071 (= e!239700 e!239702)))

(assert (=> b!396071 (= c!54542 (validKeyInArray!0 (select (arr!11242 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396072 () Bool)

(assert (=> b!396072 (= e!239702 call!27876)))

(assert (= (and d!73417 (not res!227190)) b!396069))

(assert (= (and b!396069 res!227192) b!396068))

(assert (= (and b!396069 res!227191) b!396071))

(assert (= (and b!396071 c!54542) b!396072))

(assert (= (and b!396071 (not c!54542)) b!396070))

(assert (= (or b!396072 b!396070) bm!27873))

(assert (=> b!396068 m!392089))

(assert (=> b!396068 m!392089))

(declare-fun m!392117 () Bool)

(assert (=> b!396068 m!392117))

(assert (=> b!396069 m!392089))

(assert (=> b!396069 m!392089))

(assert (=> b!396069 m!392091))

(assert (=> bm!27873 m!392089))

(declare-fun m!392119 () Bool)

(assert (=> bm!27873 m!392119))

(assert (=> b!396071 m!392089))

(assert (=> b!396071 m!392089))

(assert (=> b!396071 m!392091))

(assert (=> b!395941 d!73417))

(declare-fun d!73419 () Bool)

(assert (=> d!73419 (= (array_inv!8312 _values!549) (bvsge (size!11595 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38374 d!73419))

(declare-fun d!73421 () Bool)

(assert (=> d!73421 (= (array_inv!8313 _keys!709) (bvsge (size!11594 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38374 d!73421))

(declare-fun b!396079 () Bool)

(declare-fun e!239707 () Bool)

(assert (=> b!396079 (= e!239707 tp_is_empty!9841)))

(declare-fun b!396080 () Bool)

(declare-fun e!239708 () Bool)

(assert (=> b!396080 (= e!239708 tp_is_empty!9841)))

(declare-fun mapIsEmpty!16386 () Bool)

(declare-fun mapRes!16386 () Bool)

(assert (=> mapIsEmpty!16386 mapRes!16386))

(declare-fun condMapEmpty!16386 () Bool)

(declare-fun mapDefault!16386 () ValueCell!4577)

(assert (=> mapNonEmpty!16377 (= condMapEmpty!16386 (= mapRest!16377 ((as const (Array (_ BitVec 32) ValueCell!4577)) mapDefault!16386)))))

(assert (=> mapNonEmpty!16377 (= tp!32172 (and e!239708 mapRes!16386))))

(declare-fun mapNonEmpty!16386 () Bool)

(declare-fun tp!32181 () Bool)

(assert (=> mapNonEmpty!16386 (= mapRes!16386 (and tp!32181 e!239707))))

(declare-fun mapRest!16386 () (Array (_ BitVec 32) ValueCell!4577))

(declare-fun mapKey!16386 () (_ BitVec 32))

(declare-fun mapValue!16386 () ValueCell!4577)

(assert (=> mapNonEmpty!16386 (= mapRest!16377 (store mapRest!16386 mapKey!16386 mapValue!16386))))

(assert (= (and mapNonEmpty!16377 condMapEmpty!16386) mapIsEmpty!16386))

(assert (= (and mapNonEmpty!16377 (not condMapEmpty!16386)) mapNonEmpty!16386))

(assert (= (and mapNonEmpty!16386 ((_ is ValueCellFull!4577) mapValue!16386)) b!396079))

(assert (= (and mapNonEmpty!16377 ((_ is ValueCellFull!4577) mapDefault!16386)) b!396080))

(declare-fun m!392121 () Bool)

(assert (=> mapNonEmpty!16386 m!392121))

(check-sat (not b!396056) (not b!396038) (not b!396042) (not bm!27873) (not b!396071) (not b!396057) tp_is_empty!9841 (not mapNonEmpty!16386) (not b!396068) (not b!396045) (not b!396051) (not b!396069) (not b!396041) (not bm!27870) (not bm!27869))
(check-sat)
