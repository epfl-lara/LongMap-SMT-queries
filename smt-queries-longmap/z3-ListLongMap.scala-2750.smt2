; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40340 () Bool)

(assert start!40340)

(declare-fun b!443195 () Bool)

(declare-fun res!262596 () Bool)

(declare-fun e!260785 () Bool)

(assert (=> b!443195 (=> (not res!262596) (not e!260785))))

(declare-datatypes ((array!27289 0))(
  ( (array!27290 (arr!13093 (Array (_ BitVec 32) (_ BitVec 64))) (size!13445 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27289)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16757 0))(
  ( (V!16758 (val!5914 Int)) )
))
(declare-datatypes ((ValueCell!5526 0))(
  ( (ValueCellFull!5526 (v!8165 V!16757)) (EmptyCell!5526) )
))
(declare-datatypes ((array!27291 0))(
  ( (array!27292 (arr!13094 (Array (_ BitVec 32) ValueCell!5526)) (size!13446 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27291)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443195 (= res!262596 (and (= (size!13446 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13445 _keys!709) (size!13446 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443196 () Bool)

(declare-fun res!262591 () Bool)

(assert (=> b!443196 (=> (not res!262591) (not e!260785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443196 (= res!262591 (validMask!0 mask!1025))))

(declare-fun res!262599 () Bool)

(assert (=> start!40340 (=> (not res!262599) (not e!260785))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40340 (= res!262599 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13445 _keys!709))))))

(assert (=> start!40340 e!260785))

(assert (=> start!40340 true))

(declare-fun e!260787 () Bool)

(declare-fun array_inv!9496 (array!27291) Bool)

(assert (=> start!40340 (and (array_inv!9496 _values!549) e!260787)))

(declare-fun array_inv!9497 (array!27289) Bool)

(assert (=> start!40340 (array_inv!9497 _keys!709)))

(declare-fun b!443197 () Bool)

(declare-fun res!262593 () Bool)

(assert (=> b!443197 (=> (not res!262593) (not e!260785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27289 (_ BitVec 32)) Bool)

(assert (=> b!443197 (= res!262593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443198 () Bool)

(declare-fun e!260784 () Bool)

(assert (=> b!443198 (= e!260785 e!260784)))

(declare-fun res!262601 () Bool)

(assert (=> b!443198 (=> (not res!262601) (not e!260784))))

(declare-fun lt!203300 () array!27289)

(assert (=> b!443198 (= res!262601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203300 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443198 (= lt!203300 (array!27290 (store (arr!13093 _keys!709) i!563 k0!794) (size!13445 _keys!709)))))

(declare-fun b!443199 () Bool)

(declare-fun res!262597 () Bool)

(assert (=> b!443199 (=> (not res!262597) (not e!260785))))

(declare-fun arrayContainsKey!0 (array!27289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443199 (= res!262597 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443200 () Bool)

(declare-fun e!260788 () Bool)

(declare-fun tp_is_empty!11739 () Bool)

(assert (=> b!443200 (= e!260788 tp_is_empty!11739)))

(declare-fun b!443201 () Bool)

(declare-fun e!260783 () Bool)

(assert (=> b!443201 (= e!260783 tp_is_empty!11739)))

(declare-fun b!443202 () Bool)

(declare-fun mapRes!19233 () Bool)

(assert (=> b!443202 (= e!260787 (and e!260783 mapRes!19233))))

(declare-fun condMapEmpty!19233 () Bool)

(declare-fun mapDefault!19233 () ValueCell!5526)

(assert (=> b!443202 (= condMapEmpty!19233 (= (arr!13094 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5526)) mapDefault!19233)))))

(declare-fun mapNonEmpty!19233 () Bool)

(declare-fun tp!37215 () Bool)

(assert (=> mapNonEmpty!19233 (= mapRes!19233 (and tp!37215 e!260788))))

(declare-fun mapRest!19233 () (Array (_ BitVec 32) ValueCell!5526))

(declare-fun mapKey!19233 () (_ BitVec 32))

(declare-fun mapValue!19233 () ValueCell!5526)

(assert (=> mapNonEmpty!19233 (= (arr!13094 _values!549) (store mapRest!19233 mapKey!19233 mapValue!19233))))

(declare-fun b!443203 () Bool)

(declare-fun res!262598 () Bool)

(assert (=> b!443203 (=> (not res!262598) (not e!260785))))

(assert (=> b!443203 (= res!262598 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13445 _keys!709))))))

(declare-fun b!443204 () Bool)

(declare-fun res!262594 () Bool)

(assert (=> b!443204 (=> (not res!262594) (not e!260785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443204 (= res!262594 (validKeyInArray!0 k0!794))))

(declare-fun b!443205 () Bool)

(declare-fun res!262592 () Bool)

(assert (=> b!443205 (=> (not res!262592) (not e!260784))))

(declare-datatypes ((List!7851 0))(
  ( (Nil!7848) (Cons!7847 (h!8703 (_ BitVec 64)) (t!13609 List!7851)) )
))
(declare-fun arrayNoDuplicates!0 (array!27289 (_ BitVec 32) List!7851) Bool)

(assert (=> b!443205 (= res!262592 (arrayNoDuplicates!0 lt!203300 #b00000000000000000000000000000000 Nil!7848))))

(declare-fun mapIsEmpty!19233 () Bool)

(assert (=> mapIsEmpty!19233 mapRes!19233))

(declare-fun b!443206 () Bool)

(declare-fun res!262595 () Bool)

(assert (=> b!443206 (=> (not res!262595) (not e!260785))))

(assert (=> b!443206 (= res!262595 (or (= (select (arr!13093 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13093 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443207 () Bool)

(declare-fun res!262600 () Bool)

(assert (=> b!443207 (=> (not res!262600) (not e!260785))))

(assert (=> b!443207 (= res!262600 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7848))))

(declare-fun b!443208 () Bool)

(assert (=> b!443208 (= e!260784 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13445 _keys!709)) (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!40340 res!262599) b!443196))

(assert (= (and b!443196 res!262591) b!443195))

(assert (= (and b!443195 res!262596) b!443197))

(assert (= (and b!443197 res!262593) b!443207))

(assert (= (and b!443207 res!262600) b!443203))

(assert (= (and b!443203 res!262598) b!443204))

(assert (= (and b!443204 res!262594) b!443206))

(assert (= (and b!443206 res!262595) b!443199))

(assert (= (and b!443199 res!262597) b!443198))

(assert (= (and b!443198 res!262601) b!443205))

(assert (= (and b!443205 res!262592) b!443208))

(assert (= (and b!443202 condMapEmpty!19233) mapIsEmpty!19233))

(assert (= (and b!443202 (not condMapEmpty!19233)) mapNonEmpty!19233))

(get-info :version)

(assert (= (and mapNonEmpty!19233 ((_ is ValueCellFull!5526) mapValue!19233)) b!443200))

(assert (= (and b!443202 ((_ is ValueCellFull!5526) mapDefault!19233)) b!443201))

(assert (= start!40340 b!443202))

(declare-fun m!429553 () Bool)

(assert (=> b!443205 m!429553))

(declare-fun m!429555 () Bool)

(assert (=> mapNonEmpty!19233 m!429555))

(declare-fun m!429557 () Bool)

(assert (=> b!443206 m!429557))

(declare-fun m!429559 () Bool)

(assert (=> start!40340 m!429559))

(declare-fun m!429561 () Bool)

(assert (=> start!40340 m!429561))

(declare-fun m!429563 () Bool)

(assert (=> b!443198 m!429563))

(declare-fun m!429565 () Bool)

(assert (=> b!443198 m!429565))

(declare-fun m!429567 () Bool)

(assert (=> b!443204 m!429567))

(declare-fun m!429569 () Bool)

(assert (=> b!443197 m!429569))

(declare-fun m!429571 () Bool)

(assert (=> b!443199 m!429571))

(declare-fun m!429573 () Bool)

(assert (=> b!443207 m!429573))

(declare-fun m!429575 () Bool)

(assert (=> b!443196 m!429575))

(check-sat (not mapNonEmpty!19233) (not b!443196) (not b!443205) (not b!443197) (not b!443207) (not b!443199) (not b!443198) (not start!40340) (not b!443204) tp_is_empty!11739)
(check-sat)
(get-model)

(declare-fun b!443261 () Bool)

(declare-fun e!260815 () Bool)

(declare-fun call!29557 () Bool)

(assert (=> b!443261 (= e!260815 call!29557)))

(declare-fun b!443262 () Bool)

(declare-fun e!260818 () Bool)

(declare-fun contains!2488 (List!7851 (_ BitVec 64)) Bool)

(assert (=> b!443262 (= e!260818 (contains!2488 Nil!7848 (select (arr!13093 lt!203300) #b00000000000000000000000000000000)))))

(declare-fun b!443263 () Bool)

(declare-fun e!260817 () Bool)

(declare-fun e!260816 () Bool)

(assert (=> b!443263 (= e!260817 e!260816)))

(declare-fun res!262643 () Bool)

(assert (=> b!443263 (=> (not res!262643) (not e!260816))))

(assert (=> b!443263 (= res!262643 (not e!260818))))

(declare-fun res!262641 () Bool)

(assert (=> b!443263 (=> (not res!262641) (not e!260818))))

(assert (=> b!443263 (= res!262641 (validKeyInArray!0 (select (arr!13093 lt!203300) #b00000000000000000000000000000000)))))

(declare-fun b!443264 () Bool)

(assert (=> b!443264 (= e!260816 e!260815)))

(declare-fun c!55843 () Bool)

(assert (=> b!443264 (= c!55843 (validKeyInArray!0 (select (arr!13093 lt!203300) #b00000000000000000000000000000000)))))

(declare-fun b!443265 () Bool)

(assert (=> b!443265 (= e!260815 call!29557)))

(declare-fun d!74079 () Bool)

(declare-fun res!262642 () Bool)

(assert (=> d!74079 (=> res!262642 e!260817)))

(assert (=> d!74079 (= res!262642 (bvsge #b00000000000000000000000000000000 (size!13445 lt!203300)))))

(assert (=> d!74079 (= (arrayNoDuplicates!0 lt!203300 #b00000000000000000000000000000000 Nil!7848) e!260817)))

(declare-fun bm!29554 () Bool)

(assert (=> bm!29554 (= call!29557 (arrayNoDuplicates!0 lt!203300 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55843 (Cons!7847 (select (arr!13093 lt!203300) #b00000000000000000000000000000000) Nil!7848) Nil!7848)))))

(assert (= (and d!74079 (not res!262642)) b!443263))

(assert (= (and b!443263 res!262641) b!443262))

(assert (= (and b!443263 res!262643) b!443264))

(assert (= (and b!443264 c!55843) b!443261))

(assert (= (and b!443264 (not c!55843)) b!443265))

(assert (= (or b!443261 b!443265) bm!29554))

(declare-fun m!429601 () Bool)

(assert (=> b!443262 m!429601))

(assert (=> b!443262 m!429601))

(declare-fun m!429603 () Bool)

(assert (=> b!443262 m!429603))

(assert (=> b!443263 m!429601))

(assert (=> b!443263 m!429601))

(declare-fun m!429605 () Bool)

(assert (=> b!443263 m!429605))

(assert (=> b!443264 m!429601))

(assert (=> b!443264 m!429601))

(assert (=> b!443264 m!429605))

(assert (=> bm!29554 m!429601))

(declare-fun m!429607 () Bool)

(assert (=> bm!29554 m!429607))

(assert (=> b!443205 d!74079))

(declare-fun d!74081 () Bool)

(assert (=> d!74081 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!443204 d!74081))

(declare-fun d!74083 () Bool)

(declare-fun res!262648 () Bool)

(declare-fun e!260823 () Bool)

(assert (=> d!74083 (=> res!262648 e!260823)))

(assert (=> d!74083 (= res!262648 (= (select (arr!13093 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74083 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!260823)))

(declare-fun b!443270 () Bool)

(declare-fun e!260824 () Bool)

(assert (=> b!443270 (= e!260823 e!260824)))

(declare-fun res!262649 () Bool)

(assert (=> b!443270 (=> (not res!262649) (not e!260824))))

(assert (=> b!443270 (= res!262649 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13445 _keys!709)))))

(declare-fun b!443271 () Bool)

(assert (=> b!443271 (= e!260824 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74083 (not res!262648)) b!443270))

(assert (= (and b!443270 res!262649) b!443271))

(declare-fun m!429609 () Bool)

(assert (=> d!74083 m!429609))

(declare-fun m!429611 () Bool)

(assert (=> b!443271 m!429611))

(assert (=> b!443199 d!74083))

(declare-fun b!443272 () Bool)

(declare-fun e!260825 () Bool)

(declare-fun call!29558 () Bool)

(assert (=> b!443272 (= e!260825 call!29558)))

(declare-fun b!443273 () Bool)

(declare-fun e!260828 () Bool)

(assert (=> b!443273 (= e!260828 (contains!2488 Nil!7848 (select (arr!13093 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!443274 () Bool)

(declare-fun e!260827 () Bool)

(declare-fun e!260826 () Bool)

(assert (=> b!443274 (= e!260827 e!260826)))

(declare-fun res!262652 () Bool)

(assert (=> b!443274 (=> (not res!262652) (not e!260826))))

(assert (=> b!443274 (= res!262652 (not e!260828))))

(declare-fun res!262650 () Bool)

(assert (=> b!443274 (=> (not res!262650) (not e!260828))))

(assert (=> b!443274 (= res!262650 (validKeyInArray!0 (select (arr!13093 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!443275 () Bool)

(assert (=> b!443275 (= e!260826 e!260825)))

(declare-fun c!55844 () Bool)

(assert (=> b!443275 (= c!55844 (validKeyInArray!0 (select (arr!13093 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!443276 () Bool)

(assert (=> b!443276 (= e!260825 call!29558)))

(declare-fun d!74085 () Bool)

(declare-fun res!262651 () Bool)

(assert (=> d!74085 (=> res!262651 e!260827)))

(assert (=> d!74085 (= res!262651 (bvsge #b00000000000000000000000000000000 (size!13445 _keys!709)))))

(assert (=> d!74085 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7848) e!260827)))

(declare-fun bm!29555 () Bool)

(assert (=> bm!29555 (= call!29558 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55844 (Cons!7847 (select (arr!13093 _keys!709) #b00000000000000000000000000000000) Nil!7848) Nil!7848)))))

(assert (= (and d!74085 (not res!262651)) b!443274))

(assert (= (and b!443274 res!262650) b!443273))

(assert (= (and b!443274 res!262652) b!443275))

(assert (= (and b!443275 c!55844) b!443272))

(assert (= (and b!443275 (not c!55844)) b!443276))

(assert (= (or b!443272 b!443276) bm!29555))

(assert (=> b!443273 m!429609))

(assert (=> b!443273 m!429609))

(declare-fun m!429613 () Bool)

(assert (=> b!443273 m!429613))

(assert (=> b!443274 m!429609))

(assert (=> b!443274 m!429609))

(declare-fun m!429615 () Bool)

(assert (=> b!443274 m!429615))

(assert (=> b!443275 m!429609))

(assert (=> b!443275 m!429609))

(assert (=> b!443275 m!429615))

(assert (=> bm!29555 m!429609))

(declare-fun m!429617 () Bool)

(assert (=> bm!29555 m!429617))

(assert (=> b!443207 d!74085))

(declare-fun b!443285 () Bool)

(declare-fun e!260836 () Bool)

(declare-fun e!260837 () Bool)

(assert (=> b!443285 (= e!260836 e!260837)))

(declare-fun lt!203310 () (_ BitVec 64))

(assert (=> b!443285 (= lt!203310 (select (arr!13093 lt!203300) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13154 0))(
  ( (Unit!13155) )
))
(declare-fun lt!203311 () Unit!13154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27289 (_ BitVec 64) (_ BitVec 32)) Unit!13154)

(assert (=> b!443285 (= lt!203311 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203300 lt!203310 #b00000000000000000000000000000000))))

(assert (=> b!443285 (arrayContainsKey!0 lt!203300 lt!203310 #b00000000000000000000000000000000)))

(declare-fun lt!203312 () Unit!13154)

(assert (=> b!443285 (= lt!203312 lt!203311)))

(declare-fun res!262658 () Bool)

(declare-datatypes ((SeekEntryResult!3528 0))(
  ( (MissingZero!3528 (index!16291 (_ BitVec 32))) (Found!3528 (index!16292 (_ BitVec 32))) (Intermediate!3528 (undefined!4340 Bool) (index!16293 (_ BitVec 32)) (x!41811 (_ BitVec 32))) (Undefined!3528) (MissingVacant!3528 (index!16294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27289 (_ BitVec 32)) SeekEntryResult!3528)

(assert (=> b!443285 (= res!262658 (= (seekEntryOrOpen!0 (select (arr!13093 lt!203300) #b00000000000000000000000000000000) lt!203300 mask!1025) (Found!3528 #b00000000000000000000000000000000)))))

(assert (=> b!443285 (=> (not res!262658) (not e!260837))))

(declare-fun b!443286 () Bool)

(declare-fun call!29561 () Bool)

(assert (=> b!443286 (= e!260837 call!29561)))

(declare-fun b!443287 () Bool)

(assert (=> b!443287 (= e!260836 call!29561)))

(declare-fun bm!29558 () Bool)

(assert (=> bm!29558 (= call!29561 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203300 mask!1025))))

(declare-fun b!443288 () Bool)

(declare-fun e!260835 () Bool)

(assert (=> b!443288 (= e!260835 e!260836)))

(declare-fun c!55847 () Bool)

(assert (=> b!443288 (= c!55847 (validKeyInArray!0 (select (arr!13093 lt!203300) #b00000000000000000000000000000000)))))

(declare-fun d!74087 () Bool)

(declare-fun res!262657 () Bool)

(assert (=> d!74087 (=> res!262657 e!260835)))

(assert (=> d!74087 (= res!262657 (bvsge #b00000000000000000000000000000000 (size!13445 lt!203300)))))

(assert (=> d!74087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203300 mask!1025) e!260835)))

(assert (= (and d!74087 (not res!262657)) b!443288))

(assert (= (and b!443288 c!55847) b!443285))

(assert (= (and b!443288 (not c!55847)) b!443287))

(assert (= (and b!443285 res!262658) b!443286))

(assert (= (or b!443286 b!443287) bm!29558))

(assert (=> b!443285 m!429601))

(declare-fun m!429619 () Bool)

(assert (=> b!443285 m!429619))

(declare-fun m!429621 () Bool)

(assert (=> b!443285 m!429621))

(assert (=> b!443285 m!429601))

(declare-fun m!429623 () Bool)

(assert (=> b!443285 m!429623))

(declare-fun m!429625 () Bool)

(assert (=> bm!29558 m!429625))

(assert (=> b!443288 m!429601))

(assert (=> b!443288 m!429601))

(assert (=> b!443288 m!429605))

(assert (=> b!443198 d!74087))

(declare-fun b!443289 () Bool)

(declare-fun e!260839 () Bool)

(declare-fun e!260840 () Bool)

(assert (=> b!443289 (= e!260839 e!260840)))

(declare-fun lt!203313 () (_ BitVec 64))

(assert (=> b!443289 (= lt!203313 (select (arr!13093 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203314 () Unit!13154)

(assert (=> b!443289 (= lt!203314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203313 #b00000000000000000000000000000000))))

(assert (=> b!443289 (arrayContainsKey!0 _keys!709 lt!203313 #b00000000000000000000000000000000)))

(declare-fun lt!203315 () Unit!13154)

(assert (=> b!443289 (= lt!203315 lt!203314)))

(declare-fun res!262660 () Bool)

(assert (=> b!443289 (= res!262660 (= (seekEntryOrOpen!0 (select (arr!13093 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3528 #b00000000000000000000000000000000)))))

(assert (=> b!443289 (=> (not res!262660) (not e!260840))))

(declare-fun b!443290 () Bool)

(declare-fun call!29562 () Bool)

(assert (=> b!443290 (= e!260840 call!29562)))

(declare-fun b!443291 () Bool)

(assert (=> b!443291 (= e!260839 call!29562)))

(declare-fun bm!29559 () Bool)

(assert (=> bm!29559 (= call!29562 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!443292 () Bool)

(declare-fun e!260838 () Bool)

(assert (=> b!443292 (= e!260838 e!260839)))

(declare-fun c!55848 () Bool)

(assert (=> b!443292 (= c!55848 (validKeyInArray!0 (select (arr!13093 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74089 () Bool)

(declare-fun res!262659 () Bool)

(assert (=> d!74089 (=> res!262659 e!260838)))

(assert (=> d!74089 (= res!262659 (bvsge #b00000000000000000000000000000000 (size!13445 _keys!709)))))

(assert (=> d!74089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!260838)))

(assert (= (and d!74089 (not res!262659)) b!443292))

(assert (= (and b!443292 c!55848) b!443289))

(assert (= (and b!443292 (not c!55848)) b!443291))

(assert (= (and b!443289 res!262660) b!443290))

(assert (= (or b!443290 b!443291) bm!29559))

(assert (=> b!443289 m!429609))

(declare-fun m!429627 () Bool)

(assert (=> b!443289 m!429627))

(declare-fun m!429629 () Bool)

(assert (=> b!443289 m!429629))

(assert (=> b!443289 m!429609))

(declare-fun m!429631 () Bool)

(assert (=> b!443289 m!429631))

(declare-fun m!429633 () Bool)

(assert (=> bm!29559 m!429633))

(assert (=> b!443292 m!429609))

(assert (=> b!443292 m!429609))

(assert (=> b!443292 m!429615))

(assert (=> b!443197 d!74089))

(declare-fun d!74091 () Bool)

(assert (=> d!74091 (= (array_inv!9496 _values!549) (bvsge (size!13446 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40340 d!74091))

(declare-fun d!74093 () Bool)

(assert (=> d!74093 (= (array_inv!9497 _keys!709) (bvsge (size!13445 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40340 d!74093))

(declare-fun d!74095 () Bool)

(assert (=> d!74095 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!443196 d!74095))

(declare-fun mapIsEmpty!19239 () Bool)

(declare-fun mapRes!19239 () Bool)

(assert (=> mapIsEmpty!19239 mapRes!19239))

(declare-fun mapNonEmpty!19239 () Bool)

(declare-fun tp!37221 () Bool)

(declare-fun e!260846 () Bool)

(assert (=> mapNonEmpty!19239 (= mapRes!19239 (and tp!37221 e!260846))))

(declare-fun mapKey!19239 () (_ BitVec 32))

(declare-fun mapRest!19239 () (Array (_ BitVec 32) ValueCell!5526))

(declare-fun mapValue!19239 () ValueCell!5526)

(assert (=> mapNonEmpty!19239 (= mapRest!19233 (store mapRest!19239 mapKey!19239 mapValue!19239))))

(declare-fun b!443299 () Bool)

(assert (=> b!443299 (= e!260846 tp_is_empty!11739)))

(declare-fun b!443300 () Bool)

(declare-fun e!260845 () Bool)

(assert (=> b!443300 (= e!260845 tp_is_empty!11739)))

(declare-fun condMapEmpty!19239 () Bool)

(declare-fun mapDefault!19239 () ValueCell!5526)

(assert (=> mapNonEmpty!19233 (= condMapEmpty!19239 (= mapRest!19233 ((as const (Array (_ BitVec 32) ValueCell!5526)) mapDefault!19239)))))

(assert (=> mapNonEmpty!19233 (= tp!37215 (and e!260845 mapRes!19239))))

(assert (= (and mapNonEmpty!19233 condMapEmpty!19239) mapIsEmpty!19239))

(assert (= (and mapNonEmpty!19233 (not condMapEmpty!19239)) mapNonEmpty!19239))

(assert (= (and mapNonEmpty!19239 ((_ is ValueCellFull!5526) mapValue!19239)) b!443299))

(assert (= (and mapNonEmpty!19233 ((_ is ValueCellFull!5526) mapDefault!19239)) b!443300))

(declare-fun m!429635 () Bool)

(assert (=> mapNonEmpty!19239 m!429635))

(check-sat (not bm!29554) (not b!443274) (not b!443285) tp_is_empty!11739 (not bm!29555) (not bm!29558) (not b!443262) (not b!443275) (not b!443292) (not b!443288) (not b!443273) (not bm!29559) (not b!443271) (not b!443263) (not b!443289) (not b!443264) (not mapNonEmpty!19239))
(check-sat)
