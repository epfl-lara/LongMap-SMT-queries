; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36624 () Bool)

(assert start!36624)

(declare-fun b!365428 () Bool)

(declare-fun e!223779 () Bool)

(declare-datatypes ((array!20885 0))(
  ( (array!20886 (arr!9915 (Array (_ BitVec 32) (_ BitVec 64))) (size!10268 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20885)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365428 (= e!223779 (and (or (= (select (arr!9915 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9915 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!10268 _keys!658)) (bvsge (size!10268 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365430 () Bool)

(declare-fun e!223776 () Bool)

(declare-fun tp_is_empty!8473 () Bool)

(assert (=> b!365430 (= e!223776 tp_is_empty!8473)))

(declare-fun b!365431 () Bool)

(declare-fun e!223775 () Bool)

(assert (=> b!365431 (= e!223775 tp_is_empty!8473)))

(declare-fun b!365432 () Bool)

(declare-fun res!204354 () Bool)

(assert (=> b!365432 (=> (not res!204354) (not e!223779))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12403 0))(
  ( (V!12404 (val!4281 Int)) )
))
(declare-datatypes ((ValueCell!3893 0))(
  ( (ValueCellFull!3893 (v!6471 V!12403)) (EmptyCell!3893) )
))
(declare-datatypes ((array!20887 0))(
  ( (array!20888 (arr!9916 (Array (_ BitVec 32) ValueCell!3893)) (size!10269 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20887)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365432 (= res!204354 (and (= (size!10269 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10268 _keys!658) (size!10269 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365433 () Bool)

(declare-fun res!204349 () Bool)

(assert (=> b!365433 (=> (not res!204349) (not e!223779))))

(declare-datatypes ((List!5498 0))(
  ( (Nil!5495) (Cons!5494 (h!6350 (_ BitVec 64)) (t!10639 List!5498)) )
))
(declare-fun arrayNoDuplicates!0 (array!20885 (_ BitVec 32) List!5498) Bool)

(assert (=> b!365433 (= res!204349 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5495))))

(declare-fun mapIsEmpty!14262 () Bool)

(declare-fun mapRes!14262 () Bool)

(assert (=> mapIsEmpty!14262 mapRes!14262))

(declare-fun b!365429 () Bool)

(declare-fun res!204352 () Bool)

(assert (=> b!365429 (=> (not res!204352) (not e!223779))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365429 (= res!204352 (validKeyInArray!0 k0!778))))

(declare-fun res!204350 () Bool)

(assert (=> start!36624 (=> (not res!204350) (not e!223779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36624 (= res!204350 (validMask!0 mask!970))))

(assert (=> start!36624 e!223779))

(assert (=> start!36624 true))

(declare-fun e!223778 () Bool)

(declare-fun array_inv!7354 (array!20887) Bool)

(assert (=> start!36624 (and (array_inv!7354 _values!506) e!223778)))

(declare-fun array_inv!7355 (array!20885) Bool)

(assert (=> start!36624 (array_inv!7355 _keys!658)))

(declare-fun b!365434 () Bool)

(assert (=> b!365434 (= e!223778 (and e!223775 mapRes!14262))))

(declare-fun condMapEmpty!14262 () Bool)

(declare-fun mapDefault!14262 () ValueCell!3893)

(assert (=> b!365434 (= condMapEmpty!14262 (= (arr!9916 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3893)) mapDefault!14262)))))

(declare-fun b!365435 () Bool)

(declare-fun res!204351 () Bool)

(assert (=> b!365435 (=> (not res!204351) (not e!223779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20885 (_ BitVec 32)) Bool)

(assert (=> b!365435 (= res!204351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14262 () Bool)

(declare-fun tp!28338 () Bool)

(assert (=> mapNonEmpty!14262 (= mapRes!14262 (and tp!28338 e!223776))))

(declare-fun mapRest!14262 () (Array (_ BitVec 32) ValueCell!3893))

(declare-fun mapKey!14262 () (_ BitVec 32))

(declare-fun mapValue!14262 () ValueCell!3893)

(assert (=> mapNonEmpty!14262 (= (arr!9916 _values!506) (store mapRest!14262 mapKey!14262 mapValue!14262))))

(declare-fun b!365436 () Bool)

(declare-fun res!204353 () Bool)

(assert (=> b!365436 (=> (not res!204353) (not e!223779))))

(assert (=> b!365436 (= res!204353 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10268 _keys!658))))))

(assert (= (and start!36624 res!204350) b!365432))

(assert (= (and b!365432 res!204354) b!365435))

(assert (= (and b!365435 res!204351) b!365433))

(assert (= (and b!365433 res!204349) b!365436))

(assert (= (and b!365436 res!204353) b!365429))

(assert (= (and b!365429 res!204352) b!365428))

(assert (= (and b!365434 condMapEmpty!14262) mapIsEmpty!14262))

(assert (= (and b!365434 (not condMapEmpty!14262)) mapNonEmpty!14262))

(get-info :version)

(assert (= (and mapNonEmpty!14262 ((_ is ValueCellFull!3893) mapValue!14262)) b!365430))

(assert (= (and b!365434 ((_ is ValueCellFull!3893) mapDefault!14262)) b!365431))

(assert (= start!36624 b!365434))

(declare-fun m!362591 () Bool)

(assert (=> start!36624 m!362591))

(declare-fun m!362593 () Bool)

(assert (=> start!36624 m!362593))

(declare-fun m!362595 () Bool)

(assert (=> start!36624 m!362595))

(declare-fun m!362597 () Bool)

(assert (=> mapNonEmpty!14262 m!362597))

(declare-fun m!362599 () Bool)

(assert (=> b!365433 m!362599))

(declare-fun m!362601 () Bool)

(assert (=> b!365428 m!362601))

(declare-fun m!362603 () Bool)

(assert (=> b!365435 m!362603))

(declare-fun m!362605 () Bool)

(assert (=> b!365429 m!362605))

(check-sat tp_is_empty!8473 (not mapNonEmpty!14262) (not b!365433) (not start!36624) (not b!365429) (not b!365435))
(check-sat)
(get-model)

(declare-fun b!365499 () Bool)

(declare-fun e!223817 () Bool)

(declare-fun e!223818 () Bool)

(assert (=> b!365499 (= e!223817 e!223818)))

(declare-fun c!53829 () Bool)

(assert (=> b!365499 (= c!53829 (validKeyInArray!0 (select (arr!9915 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365500 () Bool)

(declare-fun call!27259 () Bool)

(assert (=> b!365500 (= e!223818 call!27259)))

(declare-fun d!72159 () Bool)

(declare-fun res!204396 () Bool)

(assert (=> d!72159 (=> res!204396 e!223817)))

(assert (=> d!72159 (= res!204396 (bvsge #b00000000000000000000000000000000 (size!10268 _keys!658)))))

(assert (=> d!72159 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223817)))

(declare-fun bm!27256 () Bool)

(assert (=> bm!27256 (= call!27259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365501 () Bool)

(declare-fun e!223816 () Bool)

(assert (=> b!365501 (= e!223816 call!27259)))

(declare-fun b!365502 () Bool)

(assert (=> b!365502 (= e!223818 e!223816)))

(declare-fun lt!168970 () (_ BitVec 64))

(assert (=> b!365502 (= lt!168970 (select (arr!9915 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11368 0))(
  ( (Unit!11369) )
))
(declare-fun lt!168969 () Unit!11368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20885 (_ BitVec 64) (_ BitVec 32)) Unit!11368)

(assert (=> b!365502 (= lt!168969 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!168970 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365502 (arrayContainsKey!0 _keys!658 lt!168970 #b00000000000000000000000000000000)))

(declare-fun lt!168971 () Unit!11368)

(assert (=> b!365502 (= lt!168971 lt!168969)))

(declare-fun res!204395 () Bool)

(declare-datatypes ((SeekEntryResult!3499 0))(
  ( (MissingZero!3499 (index!16175 (_ BitVec 32))) (Found!3499 (index!16176 (_ BitVec 32))) (Intermediate!3499 (undefined!4311 Bool) (index!16177 (_ BitVec 32)) (x!36678 (_ BitVec 32))) (Undefined!3499) (MissingVacant!3499 (index!16178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20885 (_ BitVec 32)) SeekEntryResult!3499)

(assert (=> b!365502 (= res!204395 (= (seekEntryOrOpen!0 (select (arr!9915 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3499 #b00000000000000000000000000000000)))))

(assert (=> b!365502 (=> (not res!204395) (not e!223816))))

(assert (= (and d!72159 (not res!204396)) b!365499))

(assert (= (and b!365499 c!53829) b!365502))

(assert (= (and b!365499 (not c!53829)) b!365500))

(assert (= (and b!365502 res!204395) b!365501))

(assert (= (or b!365501 b!365500) bm!27256))

(declare-fun m!362639 () Bool)

(assert (=> b!365499 m!362639))

(assert (=> b!365499 m!362639))

(declare-fun m!362641 () Bool)

(assert (=> b!365499 m!362641))

(declare-fun m!362643 () Bool)

(assert (=> bm!27256 m!362643))

(assert (=> b!365502 m!362639))

(declare-fun m!362645 () Bool)

(assert (=> b!365502 m!362645))

(declare-fun m!362647 () Bool)

(assert (=> b!365502 m!362647))

(assert (=> b!365502 m!362639))

(declare-fun m!362649 () Bool)

(assert (=> b!365502 m!362649))

(assert (=> b!365435 d!72159))

(declare-fun d!72161 () Bool)

(assert (=> d!72161 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!365429 d!72161))

(declare-fun d!72163 () Bool)

(assert (=> d!72163 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36624 d!72163))

(declare-fun d!72165 () Bool)

(assert (=> d!72165 (= (array_inv!7354 _values!506) (bvsge (size!10269 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36624 d!72165))

(declare-fun d!72167 () Bool)

(assert (=> d!72167 (= (array_inv!7355 _keys!658) (bvsge (size!10268 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36624 d!72167))

(declare-fun b!365513 () Bool)

(declare-fun e!223827 () Bool)

(declare-fun e!223828 () Bool)

(assert (=> b!365513 (= e!223827 e!223828)))

(declare-fun res!204405 () Bool)

(assert (=> b!365513 (=> (not res!204405) (not e!223828))))

(declare-fun e!223830 () Bool)

(assert (=> b!365513 (= res!204405 (not e!223830))))

(declare-fun res!204403 () Bool)

(assert (=> b!365513 (=> (not res!204403) (not e!223830))))

(assert (=> b!365513 (= res!204403 (validKeyInArray!0 (select (arr!9915 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365514 () Bool)

(declare-fun e!223829 () Bool)

(assert (=> b!365514 (= e!223828 e!223829)))

(declare-fun c!53832 () Bool)

(assert (=> b!365514 (= c!53832 (validKeyInArray!0 (select (arr!9915 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365515 () Bool)

(declare-fun call!27262 () Bool)

(assert (=> b!365515 (= e!223829 call!27262)))

(declare-fun d!72169 () Bool)

(declare-fun res!204404 () Bool)

(assert (=> d!72169 (=> res!204404 e!223827)))

(assert (=> d!72169 (= res!204404 (bvsge #b00000000000000000000000000000000 (size!10268 _keys!658)))))

(assert (=> d!72169 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5495) e!223827)))

(declare-fun bm!27259 () Bool)

(assert (=> bm!27259 (= call!27262 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53832 (Cons!5494 (select (arr!9915 _keys!658) #b00000000000000000000000000000000) Nil!5495) Nil!5495)))))

(declare-fun b!365516 () Bool)

(declare-fun contains!2424 (List!5498 (_ BitVec 64)) Bool)

(assert (=> b!365516 (= e!223830 (contains!2424 Nil!5495 (select (arr!9915 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365517 () Bool)

(assert (=> b!365517 (= e!223829 call!27262)))

(assert (= (and d!72169 (not res!204404)) b!365513))

(assert (= (and b!365513 res!204403) b!365516))

(assert (= (and b!365513 res!204405) b!365514))

(assert (= (and b!365514 c!53832) b!365517))

(assert (= (and b!365514 (not c!53832)) b!365515))

(assert (= (or b!365517 b!365515) bm!27259))

(assert (=> b!365513 m!362639))

(assert (=> b!365513 m!362639))

(assert (=> b!365513 m!362641))

(assert (=> b!365514 m!362639))

(assert (=> b!365514 m!362639))

(assert (=> b!365514 m!362641))

(assert (=> bm!27259 m!362639))

(declare-fun m!362651 () Bool)

(assert (=> bm!27259 m!362651))

(assert (=> b!365516 m!362639))

(assert (=> b!365516 m!362639))

(declare-fun m!362653 () Bool)

(assert (=> b!365516 m!362653))

(assert (=> b!365433 d!72169))

(declare-fun condMapEmpty!14271 () Bool)

(declare-fun mapDefault!14271 () ValueCell!3893)

(assert (=> mapNonEmpty!14262 (= condMapEmpty!14271 (= mapRest!14262 ((as const (Array (_ BitVec 32) ValueCell!3893)) mapDefault!14271)))))

(declare-fun e!223835 () Bool)

(declare-fun mapRes!14271 () Bool)

(assert (=> mapNonEmpty!14262 (= tp!28338 (and e!223835 mapRes!14271))))

(declare-fun mapNonEmpty!14271 () Bool)

(declare-fun tp!28347 () Bool)

(declare-fun e!223836 () Bool)

(assert (=> mapNonEmpty!14271 (= mapRes!14271 (and tp!28347 e!223836))))

(declare-fun mapKey!14271 () (_ BitVec 32))

(declare-fun mapRest!14271 () (Array (_ BitVec 32) ValueCell!3893))

(declare-fun mapValue!14271 () ValueCell!3893)

(assert (=> mapNonEmpty!14271 (= mapRest!14262 (store mapRest!14271 mapKey!14271 mapValue!14271))))

(declare-fun b!365524 () Bool)

(assert (=> b!365524 (= e!223836 tp_is_empty!8473)))

(declare-fun mapIsEmpty!14271 () Bool)

(assert (=> mapIsEmpty!14271 mapRes!14271))

(declare-fun b!365525 () Bool)

(assert (=> b!365525 (= e!223835 tp_is_empty!8473)))

(assert (= (and mapNonEmpty!14262 condMapEmpty!14271) mapIsEmpty!14271))

(assert (= (and mapNonEmpty!14262 (not condMapEmpty!14271)) mapNonEmpty!14271))

(assert (= (and mapNonEmpty!14271 ((_ is ValueCellFull!3893) mapValue!14271)) b!365524))

(assert (= (and mapNonEmpty!14262 ((_ is ValueCellFull!3893) mapDefault!14271)) b!365525))

(declare-fun m!362655 () Bool)

(assert (=> mapNonEmpty!14271 m!362655))

(check-sat (not bm!27259) (not b!365514) tp_is_empty!8473 (not b!365516) (not bm!27256) (not b!365513) (not b!365502) (not mapNonEmpty!14271) (not b!365499))
(check-sat)
