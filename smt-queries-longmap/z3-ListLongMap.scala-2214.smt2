; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36714 () Bool)

(assert start!36714)

(declare-fun b!366513 () Bool)

(declare-fun e!224387 () Bool)

(declare-fun tp_is_empty!8521 () Bool)

(assert (=> b!366513 (= e!224387 tp_is_empty!8521)))

(declare-fun mapNonEmpty!14343 () Bool)

(declare-fun mapRes!14343 () Bool)

(declare-fun tp!28419 () Bool)

(assert (=> mapNonEmpty!14343 (= mapRes!14343 (and tp!28419 e!224387))))

(declare-datatypes ((V!12467 0))(
  ( (V!12468 (val!4305 Int)) )
))
(declare-datatypes ((ValueCell!3917 0))(
  ( (ValueCellFull!3917 (v!6502 V!12467)) (EmptyCell!3917) )
))
(declare-datatypes ((array!20990 0))(
  ( (array!20991 (arr!9964 (Array (_ BitVec 32) ValueCell!3917)) (size!10316 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20990)

(declare-fun mapKey!14343 () (_ BitVec 32))

(declare-fun mapRest!14343 () (Array (_ BitVec 32) ValueCell!3917))

(declare-fun mapValue!14343 () ValueCell!3917)

(assert (=> mapNonEmpty!14343 (= (arr!9964 _values!506) (store mapRest!14343 mapKey!14343 mapValue!14343))))

(declare-fun b!366514 () Bool)

(declare-fun e!224384 () Bool)

(declare-fun e!224385 () Bool)

(assert (=> b!366514 (= e!224384 e!224385)))

(declare-fun res!205062 () Bool)

(assert (=> b!366514 (=> res!205062 e!224385)))

(declare-datatypes ((List!5459 0))(
  ( (Nil!5456) (Cons!5455 (h!6311 (_ BitVec 64)) (t!10601 List!5459)) )
))
(declare-fun contains!2418 (List!5459 (_ BitVec 64)) Bool)

(assert (=> b!366514 (= res!205062 (contains!2418 Nil!5456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366515 () Bool)

(declare-fun res!205060 () Bool)

(assert (=> b!366515 (=> (not res!205060) (not e!224384))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((array!20992 0))(
  ( (array!20993 (arr!9965 (Array (_ BitVec 32) (_ BitVec 64))) (size!10317 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20992)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20992 (_ BitVec 32)) Bool)

(assert (=> b!366515 (= res!205060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)) mask!970))))

(declare-fun b!366516 () Bool)

(declare-fun res!205068 () Bool)

(assert (=> b!366516 (=> (not res!205068) (not e!224384))))

(declare-fun arrayNoDuplicates!0 (array!20992 (_ BitVec 32) List!5459) Bool)

(assert (=> b!366516 (= res!205068 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5456))))

(declare-fun b!366517 () Bool)

(declare-fun res!205067 () Bool)

(assert (=> b!366517 (=> (not res!205067) (not e!224384))))

(assert (=> b!366517 (= res!205067 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10317 _keys!658))))))

(declare-fun b!366518 () Bool)

(declare-fun res!205064 () Bool)

(assert (=> b!366518 (=> (not res!205064) (not e!224384))))

(declare-fun arrayContainsKey!0 (array!20992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366518 (= res!205064 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14343 () Bool)

(assert (=> mapIsEmpty!14343 mapRes!14343))

(declare-fun b!366519 () Bool)

(declare-fun res!205061 () Bool)

(assert (=> b!366519 (=> (not res!205061) (not e!224384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366519 (= res!205061 (validKeyInArray!0 k0!778))))

(declare-fun b!366520 () Bool)

(declare-fun res!205065 () Bool)

(assert (=> b!366520 (=> (not res!205065) (not e!224384))))

(declare-fun noDuplicate!194 (List!5459) Bool)

(assert (=> b!366520 (= res!205065 (noDuplicate!194 Nil!5456))))

(declare-fun res!205069 () Bool)

(assert (=> start!36714 (=> (not res!205069) (not e!224384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36714 (= res!205069 (validMask!0 mask!970))))

(assert (=> start!36714 e!224384))

(assert (=> start!36714 true))

(declare-fun e!224389 () Bool)

(declare-fun array_inv!7408 (array!20990) Bool)

(assert (=> start!36714 (and (array_inv!7408 _values!506) e!224389)))

(declare-fun array_inv!7409 (array!20992) Bool)

(assert (=> start!36714 (array_inv!7409 _keys!658)))

(declare-fun b!366521 () Bool)

(declare-fun res!205066 () Bool)

(assert (=> b!366521 (=> (not res!205066) (not e!224384))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366521 (= res!205066 (and (= (size!10316 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10317 _keys!658) (size!10316 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366522 () Bool)

(declare-fun res!205063 () Bool)

(assert (=> b!366522 (=> (not res!205063) (not e!224384))))

(assert (=> b!366522 (= res!205063 (and (bvsle #b00000000000000000000000000000000 (size!10317 _keys!658)) (bvslt (size!10317 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!366523 () Bool)

(declare-fun e!224388 () Bool)

(assert (=> b!366523 (= e!224389 (and e!224388 mapRes!14343))))

(declare-fun condMapEmpty!14343 () Bool)

(declare-fun mapDefault!14343 () ValueCell!3917)

(assert (=> b!366523 (= condMapEmpty!14343 (= (arr!9964 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3917)) mapDefault!14343)))))

(declare-fun b!366524 () Bool)

(assert (=> b!366524 (= e!224388 tp_is_empty!8521)))

(declare-fun b!366525 () Bool)

(declare-fun res!205059 () Bool)

(assert (=> b!366525 (=> (not res!205059) (not e!224384))))

(assert (=> b!366525 (= res!205059 (or (= (select (arr!9965 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9965 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366526 () Bool)

(assert (=> b!366526 (= e!224385 (contains!2418 Nil!5456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366527 () Bool)

(declare-fun res!205058 () Bool)

(assert (=> b!366527 (=> (not res!205058) (not e!224384))))

(assert (=> b!366527 (= res!205058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36714 res!205069) b!366521))

(assert (= (and b!366521 res!205066) b!366527))

(assert (= (and b!366527 res!205058) b!366516))

(assert (= (and b!366516 res!205068) b!366517))

(assert (= (and b!366517 res!205067) b!366519))

(assert (= (and b!366519 res!205061) b!366525))

(assert (= (and b!366525 res!205059) b!366518))

(assert (= (and b!366518 res!205064) b!366515))

(assert (= (and b!366515 res!205060) b!366522))

(assert (= (and b!366522 res!205063) b!366520))

(assert (= (and b!366520 res!205065) b!366514))

(assert (= (and b!366514 (not res!205062)) b!366526))

(assert (= (and b!366523 condMapEmpty!14343) mapIsEmpty!14343))

(assert (= (and b!366523 (not condMapEmpty!14343)) mapNonEmpty!14343))

(get-info :version)

(assert (= (and mapNonEmpty!14343 ((_ is ValueCellFull!3917) mapValue!14343)) b!366513))

(assert (= (and b!366523 ((_ is ValueCellFull!3917) mapDefault!14343)) b!366524))

(assert (= start!36714 b!366523))

(declare-fun m!364063 () Bool)

(assert (=> b!366527 m!364063))

(declare-fun m!364065 () Bool)

(assert (=> b!366514 m!364065))

(declare-fun m!364067 () Bool)

(assert (=> start!36714 m!364067))

(declare-fun m!364069 () Bool)

(assert (=> start!36714 m!364069))

(declare-fun m!364071 () Bool)

(assert (=> start!36714 m!364071))

(declare-fun m!364073 () Bool)

(assert (=> b!366525 m!364073))

(declare-fun m!364075 () Bool)

(assert (=> b!366520 m!364075))

(declare-fun m!364077 () Bool)

(assert (=> b!366519 m!364077))

(declare-fun m!364079 () Bool)

(assert (=> b!366518 m!364079))

(declare-fun m!364081 () Bool)

(assert (=> mapNonEmpty!14343 m!364081))

(declare-fun m!364083 () Bool)

(assert (=> b!366515 m!364083))

(declare-fun m!364085 () Bool)

(assert (=> b!366515 m!364085))

(declare-fun m!364087 () Bool)

(assert (=> b!366516 m!364087))

(declare-fun m!364089 () Bool)

(assert (=> b!366526 m!364089))

(check-sat (not b!366526) (not b!366520) (not b!366518) (not start!36714) tp_is_empty!8521 (not b!366527) (not b!366516) (not b!366515) (not mapNonEmpty!14343) (not b!366514) (not b!366519))
(check-sat)
(get-model)

(declare-fun d!72455 () Bool)

(declare-fun lt!169269 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!202 (List!5459) (InoxSet (_ BitVec 64)))

(assert (=> d!72455 (= lt!169269 (select (content!202 Nil!5456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!224431 () Bool)

(assert (=> d!72455 (= lt!169269 e!224431)))

(declare-fun res!205147 () Bool)

(assert (=> d!72455 (=> (not res!205147) (not e!224431))))

(assert (=> d!72455 (= res!205147 ((_ is Cons!5455) Nil!5456))))

(assert (=> d!72455 (= (contains!2418 Nil!5456 #b0000000000000000000000000000000000000000000000000000000000000000) lt!169269)))

(declare-fun b!366622 () Bool)

(declare-fun e!224430 () Bool)

(assert (=> b!366622 (= e!224431 e!224430)))

(declare-fun res!205146 () Bool)

(assert (=> b!366622 (=> res!205146 e!224430)))

(assert (=> b!366622 (= res!205146 (= (h!6311 Nil!5456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366623 () Bool)

(assert (=> b!366623 (= e!224430 (contains!2418 (t!10601 Nil!5456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72455 res!205147) b!366622))

(assert (= (and b!366622 (not res!205146)) b!366623))

(declare-fun m!364147 () Bool)

(assert (=> d!72455 m!364147))

(declare-fun m!364149 () Bool)

(assert (=> d!72455 m!364149))

(declare-fun m!364151 () Bool)

(assert (=> b!366623 m!364151))

(assert (=> b!366514 d!72455))

(declare-fun d!72457 () Bool)

(assert (=> d!72457 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366519 d!72457))

(declare-fun b!366632 () Bool)

(declare-fun e!224439 () Bool)

(declare-fun e!224440 () Bool)

(assert (=> b!366632 (= e!224439 e!224440)))

(declare-fun c!53897 () Bool)

(assert (=> b!366632 (= c!53897 (validKeyInArray!0 (select (arr!9965 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun b!366633 () Bool)

(declare-fun e!224438 () Bool)

(declare-fun call!27291 () Bool)

(assert (=> b!366633 (= e!224438 call!27291)))

(declare-fun bm!27288 () Bool)

(assert (=> bm!27288 (= call!27291 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)) mask!970))))

(declare-fun b!366635 () Bool)

(assert (=> b!366635 (= e!224440 e!224438)))

(declare-fun lt!169278 () (_ BitVec 64))

(assert (=> b!366635 (= lt!169278 (select (arr!9965 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11385 0))(
  ( (Unit!11386) )
))
(declare-fun lt!169276 () Unit!11385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20992 (_ BitVec 64) (_ BitVec 32)) Unit!11385)

(assert (=> b!366635 (= lt!169276 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)) lt!169278 #b00000000000000000000000000000000))))

(assert (=> b!366635 (arrayContainsKey!0 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)) lt!169278 #b00000000000000000000000000000000)))

(declare-fun lt!169277 () Unit!11385)

(assert (=> b!366635 (= lt!169277 lt!169276)))

(declare-fun res!205153 () Bool)

(declare-datatypes ((SeekEntryResult!3456 0))(
  ( (MissingZero!3456 (index!16003 (_ BitVec 32))) (Found!3456 (index!16004 (_ BitVec 32))) (Intermediate!3456 (undefined!4268 Bool) (index!16005 (_ BitVec 32)) (x!36707 (_ BitVec 32))) (Undefined!3456) (MissingVacant!3456 (index!16006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20992 (_ BitVec 32)) SeekEntryResult!3456)

(assert (=> b!366635 (= res!205153 (= (seekEntryOrOpen!0 (select (arr!9965 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658))) #b00000000000000000000000000000000) (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)) mask!970) (Found!3456 #b00000000000000000000000000000000)))))

(assert (=> b!366635 (=> (not res!205153) (not e!224438))))

(declare-fun b!366634 () Bool)

(assert (=> b!366634 (= e!224440 call!27291)))

(declare-fun d!72459 () Bool)

(declare-fun res!205152 () Bool)

(assert (=> d!72459 (=> res!205152 e!224439)))

(assert (=> d!72459 (= res!205152 (bvsge #b00000000000000000000000000000000 (size!10317 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)))))))

(assert (=> d!72459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20993 (store (arr!9965 _keys!658) i!548 k0!778) (size!10317 _keys!658)) mask!970) e!224439)))

(assert (= (and d!72459 (not res!205152)) b!366632))

(assert (= (and b!366632 c!53897) b!366635))

(assert (= (and b!366632 (not c!53897)) b!366634))

(assert (= (and b!366635 res!205153) b!366633))

(assert (= (or b!366633 b!366634) bm!27288))

(declare-fun m!364153 () Bool)

(assert (=> b!366632 m!364153))

(assert (=> b!366632 m!364153))

(declare-fun m!364155 () Bool)

(assert (=> b!366632 m!364155))

(declare-fun m!364157 () Bool)

(assert (=> bm!27288 m!364157))

(assert (=> b!366635 m!364153))

(declare-fun m!364159 () Bool)

(assert (=> b!366635 m!364159))

(declare-fun m!364161 () Bool)

(assert (=> b!366635 m!364161))

(assert (=> b!366635 m!364153))

(declare-fun m!364163 () Bool)

(assert (=> b!366635 m!364163))

(assert (=> b!366515 d!72459))

(declare-fun d!72461 () Bool)

(declare-fun res!205158 () Bool)

(declare-fun e!224445 () Bool)

(assert (=> d!72461 (=> res!205158 e!224445)))

(assert (=> d!72461 (= res!205158 ((_ is Nil!5456) Nil!5456))))

(assert (=> d!72461 (= (noDuplicate!194 Nil!5456) e!224445)))

(declare-fun b!366640 () Bool)

(declare-fun e!224446 () Bool)

(assert (=> b!366640 (= e!224445 e!224446)))

(declare-fun res!205159 () Bool)

(assert (=> b!366640 (=> (not res!205159) (not e!224446))))

(assert (=> b!366640 (= res!205159 (not (contains!2418 (t!10601 Nil!5456) (h!6311 Nil!5456))))))

(declare-fun b!366641 () Bool)

(assert (=> b!366641 (= e!224446 (noDuplicate!194 (t!10601 Nil!5456)))))

(assert (= (and d!72461 (not res!205158)) b!366640))

(assert (= (and b!366640 res!205159) b!366641))

(declare-fun m!364165 () Bool)

(assert (=> b!366640 m!364165))

(declare-fun m!364167 () Bool)

(assert (=> b!366641 m!364167))

(assert (=> b!366520 d!72461))

(declare-fun b!366652 () Bool)

(declare-fun e!224457 () Bool)

(declare-fun e!224455 () Bool)

(assert (=> b!366652 (= e!224457 e!224455)))

(declare-fun c!53900 () Bool)

(assert (=> b!366652 (= c!53900 (validKeyInArray!0 (select (arr!9965 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366653 () Bool)

(declare-fun e!224458 () Bool)

(assert (=> b!366653 (= e!224458 (contains!2418 Nil!5456 (select (arr!9965 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27291 () Bool)

(declare-fun call!27294 () Bool)

(assert (=> bm!27291 (= call!27294 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53900 (Cons!5455 (select (arr!9965 _keys!658) #b00000000000000000000000000000000) Nil!5456) Nil!5456)))))

(declare-fun b!366654 () Bool)

(assert (=> b!366654 (= e!224455 call!27294)))

(declare-fun b!366656 () Bool)

(declare-fun e!224456 () Bool)

(assert (=> b!366656 (= e!224456 e!224457)))

(declare-fun res!205166 () Bool)

(assert (=> b!366656 (=> (not res!205166) (not e!224457))))

(assert (=> b!366656 (= res!205166 (not e!224458))))

(declare-fun res!205168 () Bool)

(assert (=> b!366656 (=> (not res!205168) (not e!224458))))

(assert (=> b!366656 (= res!205168 (validKeyInArray!0 (select (arr!9965 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366655 () Bool)

(assert (=> b!366655 (= e!224455 call!27294)))

(declare-fun d!72463 () Bool)

(declare-fun res!205167 () Bool)

(assert (=> d!72463 (=> res!205167 e!224456)))

(assert (=> d!72463 (= res!205167 (bvsge #b00000000000000000000000000000000 (size!10317 _keys!658)))))

(assert (=> d!72463 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5456) e!224456)))

(assert (= (and d!72463 (not res!205167)) b!366656))

(assert (= (and b!366656 res!205168) b!366653))

(assert (= (and b!366656 res!205166) b!366652))

(assert (= (and b!366652 c!53900) b!366655))

(assert (= (and b!366652 (not c!53900)) b!366654))

(assert (= (or b!366655 b!366654) bm!27291))

(declare-fun m!364169 () Bool)

(assert (=> b!366652 m!364169))

(assert (=> b!366652 m!364169))

(declare-fun m!364171 () Bool)

(assert (=> b!366652 m!364171))

(assert (=> b!366653 m!364169))

(assert (=> b!366653 m!364169))

(declare-fun m!364173 () Bool)

(assert (=> b!366653 m!364173))

(assert (=> bm!27291 m!364169))

(declare-fun m!364175 () Bool)

(assert (=> bm!27291 m!364175))

(assert (=> b!366656 m!364169))

(assert (=> b!366656 m!364169))

(assert (=> b!366656 m!364171))

(assert (=> b!366516 d!72463))

(declare-fun d!72465 () Bool)

(declare-fun lt!169279 () Bool)

(assert (=> d!72465 (= lt!169279 (select (content!202 Nil!5456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!224460 () Bool)

(assert (=> d!72465 (= lt!169279 e!224460)))

(declare-fun res!205170 () Bool)

(assert (=> d!72465 (=> (not res!205170) (not e!224460))))

(assert (=> d!72465 (= res!205170 ((_ is Cons!5455) Nil!5456))))

(assert (=> d!72465 (= (contains!2418 Nil!5456 #b1000000000000000000000000000000000000000000000000000000000000000) lt!169279)))

(declare-fun b!366657 () Bool)

(declare-fun e!224459 () Bool)

(assert (=> b!366657 (= e!224460 e!224459)))

(declare-fun res!205169 () Bool)

(assert (=> b!366657 (=> res!205169 e!224459)))

(assert (=> b!366657 (= res!205169 (= (h!6311 Nil!5456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366658 () Bool)

(assert (=> b!366658 (= e!224459 (contains!2418 (t!10601 Nil!5456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72465 res!205170) b!366657))

(assert (= (and b!366657 (not res!205169)) b!366658))

(assert (=> d!72465 m!364147))

(declare-fun m!364177 () Bool)

(assert (=> d!72465 m!364177))

(declare-fun m!364179 () Bool)

(assert (=> b!366658 m!364179))

(assert (=> b!366526 d!72465))

(declare-fun d!72467 () Bool)

(assert (=> d!72467 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36714 d!72467))

(declare-fun d!72469 () Bool)

(assert (=> d!72469 (= (array_inv!7408 _values!506) (bvsge (size!10316 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36714 d!72469))

(declare-fun d!72471 () Bool)

(assert (=> d!72471 (= (array_inv!7409 _keys!658) (bvsge (size!10317 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36714 d!72471))

(declare-fun b!366659 () Bool)

(declare-fun e!224462 () Bool)

(declare-fun e!224463 () Bool)

(assert (=> b!366659 (= e!224462 e!224463)))

(declare-fun c!53901 () Bool)

(assert (=> b!366659 (= c!53901 (validKeyInArray!0 (select (arr!9965 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366660 () Bool)

(declare-fun e!224461 () Bool)

(declare-fun call!27295 () Bool)

(assert (=> b!366660 (= e!224461 call!27295)))

(declare-fun bm!27292 () Bool)

(assert (=> bm!27292 (= call!27295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!366662 () Bool)

(assert (=> b!366662 (= e!224463 e!224461)))

(declare-fun lt!169282 () (_ BitVec 64))

(assert (=> b!366662 (= lt!169282 (select (arr!9965 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!169280 () Unit!11385)

(assert (=> b!366662 (= lt!169280 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169282 #b00000000000000000000000000000000))))

(assert (=> b!366662 (arrayContainsKey!0 _keys!658 lt!169282 #b00000000000000000000000000000000)))

(declare-fun lt!169281 () Unit!11385)

(assert (=> b!366662 (= lt!169281 lt!169280)))

(declare-fun res!205172 () Bool)

(assert (=> b!366662 (= res!205172 (= (seekEntryOrOpen!0 (select (arr!9965 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3456 #b00000000000000000000000000000000)))))

(assert (=> b!366662 (=> (not res!205172) (not e!224461))))

(declare-fun b!366661 () Bool)

(assert (=> b!366661 (= e!224463 call!27295)))

(declare-fun d!72473 () Bool)

(declare-fun res!205171 () Bool)

(assert (=> d!72473 (=> res!205171 e!224462)))

(assert (=> d!72473 (= res!205171 (bvsge #b00000000000000000000000000000000 (size!10317 _keys!658)))))

(assert (=> d!72473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224462)))

(assert (= (and d!72473 (not res!205171)) b!366659))

(assert (= (and b!366659 c!53901) b!366662))

(assert (= (and b!366659 (not c!53901)) b!366661))

(assert (= (and b!366662 res!205172) b!366660))

(assert (= (or b!366660 b!366661) bm!27292))

(assert (=> b!366659 m!364169))

(assert (=> b!366659 m!364169))

(assert (=> b!366659 m!364171))

(declare-fun m!364181 () Bool)

(assert (=> bm!27292 m!364181))

(assert (=> b!366662 m!364169))

(declare-fun m!364183 () Bool)

(assert (=> b!366662 m!364183))

(declare-fun m!364185 () Bool)

(assert (=> b!366662 m!364185))

(assert (=> b!366662 m!364169))

(declare-fun m!364187 () Bool)

(assert (=> b!366662 m!364187))

(assert (=> b!366527 d!72473))

(declare-fun d!72475 () Bool)

(declare-fun res!205177 () Bool)

(declare-fun e!224468 () Bool)

(assert (=> d!72475 (=> res!205177 e!224468)))

(assert (=> d!72475 (= res!205177 (= (select (arr!9965 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72475 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224468)))

(declare-fun b!366667 () Bool)

(declare-fun e!224469 () Bool)

(assert (=> b!366667 (= e!224468 e!224469)))

(declare-fun res!205178 () Bool)

(assert (=> b!366667 (=> (not res!205178) (not e!224469))))

(assert (=> b!366667 (= res!205178 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10317 _keys!658)))))

(declare-fun b!366668 () Bool)

(assert (=> b!366668 (= e!224469 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72475 (not res!205177)) b!366667))

(assert (= (and b!366667 res!205178) b!366668))

(assert (=> d!72475 m!364169))

(declare-fun m!364189 () Bool)

(assert (=> b!366668 m!364189))

(assert (=> b!366518 d!72475))

(declare-fun condMapEmpty!14352 () Bool)

(declare-fun mapDefault!14352 () ValueCell!3917)

(assert (=> mapNonEmpty!14343 (= condMapEmpty!14352 (= mapRest!14343 ((as const (Array (_ BitVec 32) ValueCell!3917)) mapDefault!14352)))))

(declare-fun e!224474 () Bool)

(declare-fun mapRes!14352 () Bool)

(assert (=> mapNonEmpty!14343 (= tp!28419 (and e!224474 mapRes!14352))))

(declare-fun mapIsEmpty!14352 () Bool)

(assert (=> mapIsEmpty!14352 mapRes!14352))

(declare-fun mapNonEmpty!14352 () Bool)

(declare-fun tp!28428 () Bool)

(declare-fun e!224475 () Bool)

(assert (=> mapNonEmpty!14352 (= mapRes!14352 (and tp!28428 e!224475))))

(declare-fun mapValue!14352 () ValueCell!3917)

(declare-fun mapRest!14352 () (Array (_ BitVec 32) ValueCell!3917))

(declare-fun mapKey!14352 () (_ BitVec 32))

(assert (=> mapNonEmpty!14352 (= mapRest!14343 (store mapRest!14352 mapKey!14352 mapValue!14352))))

(declare-fun b!366676 () Bool)

(assert (=> b!366676 (= e!224474 tp_is_empty!8521)))

(declare-fun b!366675 () Bool)

(assert (=> b!366675 (= e!224475 tp_is_empty!8521)))

(assert (= (and mapNonEmpty!14343 condMapEmpty!14352) mapIsEmpty!14352))

(assert (= (and mapNonEmpty!14343 (not condMapEmpty!14352)) mapNonEmpty!14352))

(assert (= (and mapNonEmpty!14352 ((_ is ValueCellFull!3917) mapValue!14352)) b!366675))

(assert (= (and mapNonEmpty!14343 ((_ is ValueCellFull!3917) mapDefault!14352)) b!366676))

(declare-fun m!364191 () Bool)

(assert (=> mapNonEmpty!14352 m!364191))

(check-sat (not bm!27292) (not d!72465) (not b!366640) (not b!366652) (not b!366659) (not b!366668) (not b!366623) (not bm!27291) tp_is_empty!8521 (not b!366635) (not mapNonEmpty!14352) (not b!366658) (not b!366662) (not b!366632) (not bm!27288) (not b!366656) (not b!366641) (not b!366653) (not d!72455))
(check-sat)
