; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36624 () Bool)

(assert start!36624)

(declare-fun b!365650 () Bool)

(declare-fun res!204476 () Bool)

(declare-fun e!223920 () Bool)

(assert (=> b!365650 (=> (not res!204476) (not e!223920))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365650 (= res!204476 (validKeyInArray!0 k0!778))))

(declare-fun res!204479 () Bool)

(assert (=> start!36624 (=> (not res!204479) (not e!223920))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36624 (= res!204479 (validMask!0 mask!970))))

(assert (=> start!36624 e!223920))

(assert (=> start!36624 true))

(declare-datatypes ((V!12403 0))(
  ( (V!12404 (val!4281 Int)) )
))
(declare-datatypes ((ValueCell!3893 0))(
  ( (ValueCellFull!3893 (v!6478 V!12403)) (EmptyCell!3893) )
))
(declare-datatypes ((array!20890 0))(
  ( (array!20891 (arr!9917 (Array (_ BitVec 32) ValueCell!3893)) (size!10269 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20890)

(declare-fun e!223921 () Bool)

(declare-fun array_inv!7380 (array!20890) Bool)

(assert (=> start!36624 (and (array_inv!7380 _values!506) e!223921)))

(declare-datatypes ((array!20892 0))(
  ( (array!20893 (arr!9918 (Array (_ BitVec 32) (_ BitVec 64))) (size!10270 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20892)

(declare-fun array_inv!7381 (array!20892) Bool)

(assert (=> start!36624 (array_inv!7381 _keys!658)))

(declare-fun b!365651 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365651 (= e!223920 (and (or (= (select (arr!9918 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9918 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!10270 _keys!658)) (bvsge (size!10270 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365652 () Bool)

(declare-fun e!223919 () Bool)

(declare-fun tp_is_empty!8473 () Bool)

(assert (=> b!365652 (= e!223919 tp_is_empty!8473)))

(declare-fun b!365653 () Bool)

(declare-fun e!223917 () Bool)

(assert (=> b!365653 (= e!223917 tp_is_empty!8473)))

(declare-fun b!365654 () Bool)

(declare-fun res!204475 () Bool)

(assert (=> b!365654 (=> (not res!204475) (not e!223920))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365654 (= res!204475 (and (= (size!10269 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10270 _keys!658) (size!10269 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365655 () Bool)

(declare-fun res!204477 () Bool)

(assert (=> b!365655 (=> (not res!204477) (not e!223920))))

(assert (=> b!365655 (= res!204477 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10270 _keys!658))))))

(declare-fun b!365656 () Bool)

(declare-fun res!204478 () Bool)

(assert (=> b!365656 (=> (not res!204478) (not e!223920))))

(declare-datatypes ((List!5442 0))(
  ( (Nil!5439) (Cons!5438 (h!6294 (_ BitVec 64)) (t!10584 List!5442)) )
))
(declare-fun arrayNoDuplicates!0 (array!20892 (_ BitVec 32) List!5442) Bool)

(assert (=> b!365656 (= res!204478 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5439))))

(declare-fun b!365657 () Bool)

(declare-fun res!204480 () Bool)

(assert (=> b!365657 (=> (not res!204480) (not e!223920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20892 (_ BitVec 32)) Bool)

(assert (=> b!365657 (= res!204480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14262 () Bool)

(declare-fun mapRes!14262 () Bool)

(declare-fun tp!28338 () Bool)

(assert (=> mapNonEmpty!14262 (= mapRes!14262 (and tp!28338 e!223917))))

(declare-fun mapRest!14262 () (Array (_ BitVec 32) ValueCell!3893))

(declare-fun mapKey!14262 () (_ BitVec 32))

(declare-fun mapValue!14262 () ValueCell!3893)

(assert (=> mapNonEmpty!14262 (= (arr!9917 _values!506) (store mapRest!14262 mapKey!14262 mapValue!14262))))

(declare-fun mapIsEmpty!14262 () Bool)

(assert (=> mapIsEmpty!14262 mapRes!14262))

(declare-fun b!365658 () Bool)

(assert (=> b!365658 (= e!223921 (and e!223919 mapRes!14262))))

(declare-fun condMapEmpty!14262 () Bool)

(declare-fun mapDefault!14262 () ValueCell!3893)

(assert (=> b!365658 (= condMapEmpty!14262 (= (arr!9917 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3893)) mapDefault!14262)))))

(assert (= (and start!36624 res!204479) b!365654))

(assert (= (and b!365654 res!204475) b!365657))

(assert (= (and b!365657 res!204480) b!365656))

(assert (= (and b!365656 res!204478) b!365655))

(assert (= (and b!365655 res!204477) b!365650))

(assert (= (and b!365650 res!204476) b!365651))

(assert (= (and b!365658 condMapEmpty!14262) mapIsEmpty!14262))

(assert (= (and b!365658 (not condMapEmpty!14262)) mapNonEmpty!14262))

(get-info :version)

(assert (= (and mapNonEmpty!14262 ((_ is ValueCellFull!3893) mapValue!14262)) b!365653))

(assert (= (and b!365658 ((_ is ValueCellFull!3893) mapDefault!14262)) b!365652))

(assert (= start!36624 b!365658))

(declare-fun m!363545 () Bool)

(assert (=> mapNonEmpty!14262 m!363545))

(declare-fun m!363547 () Bool)

(assert (=> b!365650 m!363547))

(declare-fun m!363549 () Bool)

(assert (=> start!36624 m!363549))

(declare-fun m!363551 () Bool)

(assert (=> start!36624 m!363551))

(declare-fun m!363553 () Bool)

(assert (=> start!36624 m!363553))

(declare-fun m!363555 () Bool)

(assert (=> b!365656 m!363555))

(declare-fun m!363557 () Bool)

(assert (=> b!365651 m!363557))

(declare-fun m!363559 () Bool)

(assert (=> b!365657 m!363559))

(check-sat tp_is_empty!8473 (not b!365657) (not b!365650) (not mapNonEmpty!14262) (not b!365656) (not start!36624))
(check-sat)
(get-model)

(declare-fun b!365723 () Bool)

(declare-fun e!223960 () Bool)

(declare-fun call!27271 () Bool)

(assert (=> b!365723 (= e!223960 call!27271)))

(declare-fun b!365724 () Bool)

(declare-fun e!223962 () Bool)

(declare-fun contains!2415 (List!5442 (_ BitVec 64)) Bool)

(assert (=> b!365724 (= e!223962 (contains!2415 Nil!5439 (select (arr!9918 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365725 () Bool)

(declare-fun e!223961 () Bool)

(assert (=> b!365725 (= e!223961 e!223960)))

(declare-fun c!53877 () Bool)

(assert (=> b!365725 (= c!53877 (validKeyInArray!0 (select (arr!9918 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27268 () Bool)

(assert (=> bm!27268 (= call!27271 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53877 (Cons!5438 (select (arr!9918 _keys!658) #b00000000000000000000000000000000) Nil!5439) Nil!5439)))))

(declare-fun b!365726 () Bool)

(assert (=> b!365726 (= e!223960 call!27271)))

(declare-fun d!72393 () Bool)

(declare-fun res!204524 () Bool)

(declare-fun e!223963 () Bool)

(assert (=> d!72393 (=> res!204524 e!223963)))

(assert (=> d!72393 (= res!204524 (bvsge #b00000000000000000000000000000000 (size!10270 _keys!658)))))

(assert (=> d!72393 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5439) e!223963)))

(declare-fun b!365727 () Bool)

(assert (=> b!365727 (= e!223963 e!223961)))

(declare-fun res!204525 () Bool)

(assert (=> b!365727 (=> (not res!204525) (not e!223961))))

(assert (=> b!365727 (= res!204525 (not e!223962))))

(declare-fun res!204523 () Bool)

(assert (=> b!365727 (=> (not res!204523) (not e!223962))))

(assert (=> b!365727 (= res!204523 (validKeyInArray!0 (select (arr!9918 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72393 (not res!204524)) b!365727))

(assert (= (and b!365727 res!204523) b!365724))

(assert (= (and b!365727 res!204525) b!365725))

(assert (= (and b!365725 c!53877) b!365726))

(assert (= (and b!365725 (not c!53877)) b!365723))

(assert (= (or b!365726 b!365723) bm!27268))

(declare-fun m!363593 () Bool)

(assert (=> b!365724 m!363593))

(assert (=> b!365724 m!363593))

(declare-fun m!363595 () Bool)

(assert (=> b!365724 m!363595))

(assert (=> b!365725 m!363593))

(assert (=> b!365725 m!363593))

(declare-fun m!363597 () Bool)

(assert (=> b!365725 m!363597))

(assert (=> bm!27268 m!363593))

(declare-fun m!363599 () Bool)

(assert (=> bm!27268 m!363599))

(assert (=> b!365727 m!363593))

(assert (=> b!365727 m!363593))

(assert (=> b!365727 m!363597))

(assert (=> b!365656 d!72393))

(declare-fun d!72395 () Bool)

(assert (=> d!72395 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36624 d!72395))

(declare-fun d!72397 () Bool)

(assert (=> d!72397 (= (array_inv!7380 _values!506) (bvsge (size!10269 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36624 d!72397))

(declare-fun d!72399 () Bool)

(assert (=> d!72399 (= (array_inv!7381 _keys!658) (bvsge (size!10270 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36624 d!72399))

(declare-fun d!72401 () Bool)

(assert (=> d!72401 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!365650 d!72401))

(declare-fun b!365736 () Bool)

(declare-fun e!223972 () Bool)

(declare-fun e!223970 () Bool)

(assert (=> b!365736 (= e!223972 e!223970)))

(declare-fun lt!169222 () (_ BitVec 64))

(assert (=> b!365736 (= lt!169222 (select (arr!9918 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11379 0))(
  ( (Unit!11380) )
))
(declare-fun lt!169224 () Unit!11379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20892 (_ BitVec 64) (_ BitVec 32)) Unit!11379)

(assert (=> b!365736 (= lt!169224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169222 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365736 (arrayContainsKey!0 _keys!658 lt!169222 #b00000000000000000000000000000000)))

(declare-fun lt!169223 () Unit!11379)

(assert (=> b!365736 (= lt!169223 lt!169224)))

(declare-fun res!204530 () Bool)

(declare-datatypes ((SeekEntryResult!3453 0))(
  ( (MissingZero!3453 (index!15991 (_ BitVec 32))) (Found!3453 (index!15992 (_ BitVec 32))) (Intermediate!3453 (undefined!4265 Bool) (index!15993 (_ BitVec 32)) (x!36634 (_ BitVec 32))) (Undefined!3453) (MissingVacant!3453 (index!15994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20892 (_ BitVec 32)) SeekEntryResult!3453)

(assert (=> b!365736 (= res!204530 (= (seekEntryOrOpen!0 (select (arr!9918 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3453 #b00000000000000000000000000000000)))))

(assert (=> b!365736 (=> (not res!204530) (not e!223970))))

(declare-fun b!365737 () Bool)

(declare-fun call!27274 () Bool)

(assert (=> b!365737 (= e!223970 call!27274)))

(declare-fun b!365738 () Bool)

(declare-fun e!223971 () Bool)

(assert (=> b!365738 (= e!223971 e!223972)))

(declare-fun c!53880 () Bool)

(assert (=> b!365738 (= c!53880 (validKeyInArray!0 (select (arr!9918 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72403 () Bool)

(declare-fun res!204531 () Bool)

(assert (=> d!72403 (=> res!204531 e!223971)))

(assert (=> d!72403 (= res!204531 (bvsge #b00000000000000000000000000000000 (size!10270 _keys!658)))))

(assert (=> d!72403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223971)))

(declare-fun b!365739 () Bool)

(assert (=> b!365739 (= e!223972 call!27274)))

(declare-fun bm!27271 () Bool)

(assert (=> bm!27271 (= call!27274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!72403 (not res!204531)) b!365738))

(assert (= (and b!365738 c!53880) b!365736))

(assert (= (and b!365738 (not c!53880)) b!365739))

(assert (= (and b!365736 res!204530) b!365737))

(assert (= (or b!365737 b!365739) bm!27271))

(assert (=> b!365736 m!363593))

(declare-fun m!363601 () Bool)

(assert (=> b!365736 m!363601))

(declare-fun m!363603 () Bool)

(assert (=> b!365736 m!363603))

(assert (=> b!365736 m!363593))

(declare-fun m!363605 () Bool)

(assert (=> b!365736 m!363605))

(assert (=> b!365738 m!363593))

(assert (=> b!365738 m!363593))

(assert (=> b!365738 m!363597))

(declare-fun m!363607 () Bool)

(assert (=> bm!27271 m!363607))

(assert (=> b!365657 d!72403))

(declare-fun mapNonEmpty!14271 () Bool)

(declare-fun mapRes!14271 () Bool)

(declare-fun tp!28347 () Bool)

(declare-fun e!223978 () Bool)

(assert (=> mapNonEmpty!14271 (= mapRes!14271 (and tp!28347 e!223978))))

(declare-fun mapValue!14271 () ValueCell!3893)

(declare-fun mapRest!14271 () (Array (_ BitVec 32) ValueCell!3893))

(declare-fun mapKey!14271 () (_ BitVec 32))

(assert (=> mapNonEmpty!14271 (= mapRest!14262 (store mapRest!14271 mapKey!14271 mapValue!14271))))

(declare-fun condMapEmpty!14271 () Bool)

(declare-fun mapDefault!14271 () ValueCell!3893)

(assert (=> mapNonEmpty!14262 (= condMapEmpty!14271 (= mapRest!14262 ((as const (Array (_ BitVec 32) ValueCell!3893)) mapDefault!14271)))))

(declare-fun e!223977 () Bool)

(assert (=> mapNonEmpty!14262 (= tp!28338 (and e!223977 mapRes!14271))))

(declare-fun b!365747 () Bool)

(assert (=> b!365747 (= e!223977 tp_is_empty!8473)))

(declare-fun b!365746 () Bool)

(assert (=> b!365746 (= e!223978 tp_is_empty!8473)))

(declare-fun mapIsEmpty!14271 () Bool)

(assert (=> mapIsEmpty!14271 mapRes!14271))

(assert (= (and mapNonEmpty!14262 condMapEmpty!14271) mapIsEmpty!14271))

(assert (= (and mapNonEmpty!14262 (not condMapEmpty!14271)) mapNonEmpty!14271))

(assert (= (and mapNonEmpty!14271 ((_ is ValueCellFull!3893) mapValue!14271)) b!365746))

(assert (= (and mapNonEmpty!14262 ((_ is ValueCellFull!3893) mapDefault!14271)) b!365747))

(declare-fun m!363609 () Bool)

(assert (=> mapNonEmpty!14271 m!363609))

(check-sat tp_is_empty!8473 (not b!365727) (not mapNonEmpty!14271) (not bm!27271) (not b!365724) (not b!365738) (not bm!27268) (not b!365736) (not b!365725))
(check-sat)
