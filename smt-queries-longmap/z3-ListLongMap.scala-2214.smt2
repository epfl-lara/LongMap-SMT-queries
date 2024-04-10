; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36730 () Bool)

(assert start!36730)

(declare-fun b!366607 () Bool)

(declare-fun e!224439 () Bool)

(declare-fun tp_is_empty!8523 () Bool)

(assert (=> b!366607 (= e!224439 tp_is_empty!8523)))

(declare-fun b!366608 () Bool)

(declare-fun res!205106 () Bool)

(declare-fun e!224437 () Bool)

(assert (=> b!366608 (=> (not res!205106) (not e!224437))))

(declare-datatypes ((array!21003 0))(
  ( (array!21004 (arr!9971 (Array (_ BitVec 32) (_ BitVec 64))) (size!10323 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21003)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366608 (= res!205106 (or (= (select (arr!9971 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9971 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366609 () Bool)

(declare-fun res!205102 () Bool)

(assert (=> b!366609 (=> (not res!205102) (not e!224437))))

(declare-datatypes ((List!5551 0))(
  ( (Nil!5548) (Cons!5547 (h!6403 (_ BitVec 64)) (t!10701 List!5551)) )
))
(declare-fun noDuplicate!191 (List!5551) Bool)

(assert (=> b!366609 (= res!205102 (noDuplicate!191 Nil!5548))))

(declare-fun b!366610 () Bool)

(declare-fun res!205100 () Bool)

(assert (=> b!366610 (=> (not res!205100) (not e!224437))))

(assert (=> b!366610 (= res!205100 (and (bvsle #b00000000000000000000000000000000 (size!10323 _keys!658)) (bvslt (size!10323 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!366611 () Bool)

(declare-fun res!205108 () Bool)

(assert (=> b!366611 (=> (not res!205108) (not e!224437))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12469 0))(
  ( (V!12470 (val!4306 Int)) )
))
(declare-datatypes ((ValueCell!3918 0))(
  ( (ValueCellFull!3918 (v!6502 V!12469)) (EmptyCell!3918) )
))
(declare-datatypes ((array!21005 0))(
  ( (array!21006 (arr!9972 (Array (_ BitVec 32) ValueCell!3918)) (size!10324 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21005)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!366611 (= res!205108 (and (= (size!10324 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10323 _keys!658) (size!10324 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366612 () Bool)

(declare-fun res!205099 () Bool)

(assert (=> b!366612 (=> (not res!205099) (not e!224437))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366612 (= res!205099 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366613 () Bool)

(declare-fun res!205101 () Bool)

(assert (=> b!366613 (=> (not res!205101) (not e!224437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21003 (_ BitVec 32)) Bool)

(assert (=> b!366613 (= res!205101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366614 () Bool)

(declare-fun e!224436 () Bool)

(assert (=> b!366614 (= e!224437 e!224436)))

(declare-fun res!205107 () Bool)

(assert (=> b!366614 (=> res!205107 e!224436)))

(declare-fun contains!2438 (List!5551 (_ BitVec 64)) Bool)

(assert (=> b!366614 (= res!205107 (contains!2438 Nil!5548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366615 () Bool)

(declare-fun e!224435 () Bool)

(assert (=> b!366615 (= e!224435 tp_is_empty!8523)))

(declare-fun mapIsEmpty!14346 () Bool)

(declare-fun mapRes!14346 () Bool)

(assert (=> mapIsEmpty!14346 mapRes!14346))

(declare-fun mapNonEmpty!14346 () Bool)

(declare-fun tp!28422 () Bool)

(assert (=> mapNonEmpty!14346 (= mapRes!14346 (and tp!28422 e!224439))))

(declare-fun mapKey!14346 () (_ BitVec 32))

(declare-fun mapValue!14346 () ValueCell!3918)

(declare-fun mapRest!14346 () (Array (_ BitVec 32) ValueCell!3918))

(assert (=> mapNonEmpty!14346 (= (arr!9972 _values!506) (store mapRest!14346 mapKey!14346 mapValue!14346))))

(declare-fun b!366616 () Bool)

(declare-fun res!205098 () Bool)

(assert (=> b!366616 (=> (not res!205098) (not e!224437))))

(assert (=> b!366616 (= res!205098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)) mask!970))))

(declare-fun b!366617 () Bool)

(declare-fun res!205105 () Bool)

(assert (=> b!366617 (=> (not res!205105) (not e!224437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366617 (= res!205105 (validKeyInArray!0 k0!778))))

(declare-fun b!366618 () Bool)

(declare-fun res!205104 () Bool)

(assert (=> b!366618 (=> (not res!205104) (not e!224437))))

(assert (=> b!366618 (= res!205104 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10323 _keys!658))))))

(declare-fun b!366619 () Bool)

(assert (=> b!366619 (= e!224436 (contains!2438 Nil!5548 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!205103 () Bool)

(assert (=> start!36730 (=> (not res!205103) (not e!224437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36730 (= res!205103 (validMask!0 mask!970))))

(assert (=> start!36730 e!224437))

(assert (=> start!36730 true))

(declare-fun e!224438 () Bool)

(declare-fun array_inv!7376 (array!21005) Bool)

(assert (=> start!36730 (and (array_inv!7376 _values!506) e!224438)))

(declare-fun array_inv!7377 (array!21003) Bool)

(assert (=> start!36730 (array_inv!7377 _keys!658)))

(declare-fun b!366620 () Bool)

(assert (=> b!366620 (= e!224438 (and e!224435 mapRes!14346))))

(declare-fun condMapEmpty!14346 () Bool)

(declare-fun mapDefault!14346 () ValueCell!3918)

(assert (=> b!366620 (= condMapEmpty!14346 (= (arr!9972 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3918)) mapDefault!14346)))))

(declare-fun b!366621 () Bool)

(declare-fun res!205097 () Bool)

(assert (=> b!366621 (=> (not res!205097) (not e!224437))))

(declare-fun arrayNoDuplicates!0 (array!21003 (_ BitVec 32) List!5551) Bool)

(assert (=> b!366621 (= res!205097 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5548))))

(assert (= (and start!36730 res!205103) b!366611))

(assert (= (and b!366611 res!205108) b!366613))

(assert (= (and b!366613 res!205101) b!366621))

(assert (= (and b!366621 res!205097) b!366618))

(assert (= (and b!366618 res!205104) b!366617))

(assert (= (and b!366617 res!205105) b!366608))

(assert (= (and b!366608 res!205106) b!366612))

(assert (= (and b!366612 res!205099) b!366616))

(assert (= (and b!366616 res!205098) b!366610))

(assert (= (and b!366610 res!205100) b!366609))

(assert (= (and b!366609 res!205102) b!366614))

(assert (= (and b!366614 (not res!205107)) b!366619))

(assert (= (and b!366620 condMapEmpty!14346) mapIsEmpty!14346))

(assert (= (and b!366620 (not condMapEmpty!14346)) mapNonEmpty!14346))

(get-info :version)

(assert (= (and mapNonEmpty!14346 ((_ is ValueCellFull!3918) mapValue!14346)) b!366607))

(assert (= (and b!366620 ((_ is ValueCellFull!3918) mapDefault!14346)) b!366615))

(assert (= start!36730 b!366620))

(declare-fun m!363861 () Bool)

(assert (=> b!366621 m!363861))

(declare-fun m!363863 () Bool)

(assert (=> b!366619 m!363863))

(declare-fun m!363865 () Bool)

(assert (=> b!366614 m!363865))

(declare-fun m!363867 () Bool)

(assert (=> start!36730 m!363867))

(declare-fun m!363869 () Bool)

(assert (=> start!36730 m!363869))

(declare-fun m!363871 () Bool)

(assert (=> start!36730 m!363871))

(declare-fun m!363873 () Bool)

(assert (=> b!366616 m!363873))

(declare-fun m!363875 () Bool)

(assert (=> b!366616 m!363875))

(declare-fun m!363877 () Bool)

(assert (=> mapNonEmpty!14346 m!363877))

(declare-fun m!363879 () Bool)

(assert (=> b!366613 m!363879))

(declare-fun m!363881 () Bool)

(assert (=> b!366608 m!363881))

(declare-fun m!363883 () Bool)

(assert (=> b!366617 m!363883))

(declare-fun m!363885 () Bool)

(assert (=> b!366612 m!363885))

(declare-fun m!363887 () Bool)

(assert (=> b!366609 m!363887))

(check-sat (not start!36730) (not b!366609) (not mapNonEmpty!14346) (not b!366612) tp_is_empty!8523 (not b!366616) (not b!366614) (not b!366613) (not b!366619) (not b!366621) (not b!366617))
(check-sat)
(get-model)

(declare-fun d!72425 () Bool)

(declare-fun lt!169250 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!200 (List!5551) (InoxSet (_ BitVec 64)))

(assert (=> d!72425 (= lt!169250 (select (content!200 Nil!5548) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!224463 () Bool)

(assert (=> d!72425 (= lt!169250 e!224463)))

(declare-fun res!205150 () Bool)

(assert (=> d!72425 (=> (not res!205150) (not e!224463))))

(assert (=> d!72425 (= res!205150 ((_ is Cons!5547) Nil!5548))))

(assert (=> d!72425 (= (contains!2438 Nil!5548 #b1000000000000000000000000000000000000000000000000000000000000000) lt!169250)))

(declare-fun b!366671 () Bool)

(declare-fun e!224462 () Bool)

(assert (=> b!366671 (= e!224463 e!224462)))

(declare-fun res!205149 () Bool)

(assert (=> b!366671 (=> res!205149 e!224462)))

(assert (=> b!366671 (= res!205149 (= (h!6403 Nil!5548) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366672 () Bool)

(assert (=> b!366672 (= e!224462 (contains!2438 (t!10701 Nil!5548) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72425 res!205150) b!366671))

(assert (= (and b!366671 (not res!205149)) b!366672))

(declare-fun m!363917 () Bool)

(assert (=> d!72425 m!363917))

(declare-fun m!363919 () Bool)

(assert (=> d!72425 m!363919))

(declare-fun m!363921 () Bool)

(assert (=> b!366672 m!363921))

(assert (=> b!366619 d!72425))

(declare-fun d!72427 () Bool)

(declare-fun res!205155 () Bool)

(declare-fun e!224468 () Bool)

(assert (=> d!72427 (=> res!205155 e!224468)))

(assert (=> d!72427 (= res!205155 ((_ is Nil!5548) Nil!5548))))

(assert (=> d!72427 (= (noDuplicate!191 Nil!5548) e!224468)))

(declare-fun b!366677 () Bool)

(declare-fun e!224469 () Bool)

(assert (=> b!366677 (= e!224468 e!224469)))

(declare-fun res!205156 () Bool)

(assert (=> b!366677 (=> (not res!205156) (not e!224469))))

(assert (=> b!366677 (= res!205156 (not (contains!2438 (t!10701 Nil!5548) (h!6403 Nil!5548))))))

(declare-fun b!366678 () Bool)

(assert (=> b!366678 (= e!224469 (noDuplicate!191 (t!10701 Nil!5548)))))

(assert (= (and d!72427 (not res!205155)) b!366677))

(assert (= (and b!366677 res!205156) b!366678))

(declare-fun m!363923 () Bool)

(assert (=> b!366677 m!363923))

(declare-fun m!363925 () Bool)

(assert (=> b!366678 m!363925))

(assert (=> b!366609 d!72427))

(declare-fun d!72429 () Bool)

(declare-fun lt!169251 () Bool)

(assert (=> d!72429 (= lt!169251 (select (content!200 Nil!5548) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!224471 () Bool)

(assert (=> d!72429 (= lt!169251 e!224471)))

(declare-fun res!205158 () Bool)

(assert (=> d!72429 (=> (not res!205158) (not e!224471))))

(assert (=> d!72429 (= res!205158 ((_ is Cons!5547) Nil!5548))))

(assert (=> d!72429 (= (contains!2438 Nil!5548 #b0000000000000000000000000000000000000000000000000000000000000000) lt!169251)))

(declare-fun b!366679 () Bool)

(declare-fun e!224470 () Bool)

(assert (=> b!366679 (= e!224471 e!224470)))

(declare-fun res!205157 () Bool)

(assert (=> b!366679 (=> res!205157 e!224470)))

(assert (=> b!366679 (= res!205157 (= (h!6403 Nil!5548) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366680 () Bool)

(assert (=> b!366680 (= e!224470 (contains!2438 (t!10701 Nil!5548) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72429 res!205158) b!366679))

(assert (= (and b!366679 (not res!205157)) b!366680))

(assert (=> d!72429 m!363917))

(declare-fun m!363927 () Bool)

(assert (=> d!72429 m!363927))

(declare-fun m!363929 () Bool)

(assert (=> b!366680 m!363929))

(assert (=> b!366614 d!72429))

(declare-fun d!72431 () Bool)

(assert (=> d!72431 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366617 d!72431))

(declare-fun b!366690 () Bool)

(declare-fun e!224478 () Bool)

(declare-fun e!224479 () Bool)

(assert (=> b!366690 (= e!224478 e!224479)))

(declare-fun c!53920 () Bool)

(assert (=> b!366690 (= c!53920 (validKeyInArray!0 (select (arr!9971 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27301 () Bool)

(declare-fun call!27304 () Bool)

(assert (=> bm!27301 (= call!27304 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!366689 () Bool)

(declare-fun e!224480 () Bool)

(assert (=> b!366689 (= e!224480 call!27304)))

(declare-fun d!72433 () Bool)

(declare-fun res!205163 () Bool)

(assert (=> d!72433 (=> res!205163 e!224478)))

(assert (=> d!72433 (= res!205163 (bvsge #b00000000000000000000000000000000 (size!10323 _keys!658)))))

(assert (=> d!72433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224478)))

(declare-fun b!366691 () Bool)

(assert (=> b!366691 (= e!224479 e!224480)))

(declare-fun lt!169259 () (_ BitVec 64))

(assert (=> b!366691 (= lt!169259 (select (arr!9971 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11396 0))(
  ( (Unit!11397) )
))
(declare-fun lt!169258 () Unit!11396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!21003 (_ BitVec 64) (_ BitVec 32)) Unit!11396)

(assert (=> b!366691 (= lt!169258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169259 #b00000000000000000000000000000000))))

(assert (=> b!366691 (arrayContainsKey!0 _keys!658 lt!169259 #b00000000000000000000000000000000)))

(declare-fun lt!169260 () Unit!11396)

(assert (=> b!366691 (= lt!169260 lt!169258)))

(declare-fun res!205164 () Bool)

(declare-datatypes ((SeekEntryResult!3507 0))(
  ( (MissingZero!3507 (index!16207 (_ BitVec 32))) (Found!3507 (index!16208 (_ BitVec 32))) (Intermediate!3507 (undefined!4319 Bool) (index!16209 (_ BitVec 32)) (x!36761 (_ BitVec 32))) (Undefined!3507) (MissingVacant!3507 (index!16210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!21003 (_ BitVec 32)) SeekEntryResult!3507)

(assert (=> b!366691 (= res!205164 (= (seekEntryOrOpen!0 (select (arr!9971 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3507 #b00000000000000000000000000000000)))))

(assert (=> b!366691 (=> (not res!205164) (not e!224480))))

(declare-fun b!366692 () Bool)

(assert (=> b!366692 (= e!224479 call!27304)))

(assert (= (and d!72433 (not res!205163)) b!366690))

(assert (= (and b!366690 c!53920) b!366691))

(assert (= (and b!366690 (not c!53920)) b!366692))

(assert (= (and b!366691 res!205164) b!366689))

(assert (= (or b!366689 b!366692) bm!27301))

(declare-fun m!363931 () Bool)

(assert (=> b!366690 m!363931))

(assert (=> b!366690 m!363931))

(declare-fun m!363933 () Bool)

(assert (=> b!366690 m!363933))

(declare-fun m!363935 () Bool)

(assert (=> bm!27301 m!363935))

(assert (=> b!366691 m!363931))

(declare-fun m!363937 () Bool)

(assert (=> b!366691 m!363937))

(declare-fun m!363939 () Bool)

(assert (=> b!366691 m!363939))

(assert (=> b!366691 m!363931))

(declare-fun m!363941 () Bool)

(assert (=> b!366691 m!363941))

(assert (=> b!366613 d!72433))

(declare-fun b!366694 () Bool)

(declare-fun e!224481 () Bool)

(declare-fun e!224482 () Bool)

(assert (=> b!366694 (= e!224481 e!224482)))

(declare-fun c!53921 () Bool)

(assert (=> b!366694 (= c!53921 (validKeyInArray!0 (select (arr!9971 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun bm!27302 () Bool)

(declare-fun call!27305 () Bool)

(assert (=> bm!27302 (= call!27305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)) mask!970))))

(declare-fun b!366693 () Bool)

(declare-fun e!224483 () Bool)

(assert (=> b!366693 (= e!224483 call!27305)))

(declare-fun d!72435 () Bool)

(declare-fun res!205165 () Bool)

(assert (=> d!72435 (=> res!205165 e!224481)))

(assert (=> d!72435 (= res!205165 (bvsge #b00000000000000000000000000000000 (size!10323 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)))))))

(assert (=> d!72435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)) mask!970) e!224481)))

(declare-fun b!366695 () Bool)

(assert (=> b!366695 (= e!224482 e!224483)))

(declare-fun lt!169262 () (_ BitVec 64))

(assert (=> b!366695 (= lt!169262 (select (arr!9971 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658))) #b00000000000000000000000000000000))))

(declare-fun lt!169261 () Unit!11396)

(assert (=> b!366695 (= lt!169261 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)) lt!169262 #b00000000000000000000000000000000))))

(assert (=> b!366695 (arrayContainsKey!0 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)) lt!169262 #b00000000000000000000000000000000)))

(declare-fun lt!169263 () Unit!11396)

(assert (=> b!366695 (= lt!169263 lt!169261)))

(declare-fun res!205166 () Bool)

(assert (=> b!366695 (= res!205166 (= (seekEntryOrOpen!0 (select (arr!9971 (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658))) #b00000000000000000000000000000000) (array!21004 (store (arr!9971 _keys!658) i!548 k0!778) (size!10323 _keys!658)) mask!970) (Found!3507 #b00000000000000000000000000000000)))))

(assert (=> b!366695 (=> (not res!205166) (not e!224483))))

(declare-fun b!366696 () Bool)

(assert (=> b!366696 (= e!224482 call!27305)))

(assert (= (and d!72435 (not res!205165)) b!366694))

(assert (= (and b!366694 c!53921) b!366695))

(assert (= (and b!366694 (not c!53921)) b!366696))

(assert (= (and b!366695 res!205166) b!366693))

(assert (= (or b!366693 b!366696) bm!27302))

(declare-fun m!363943 () Bool)

(assert (=> b!366694 m!363943))

(assert (=> b!366694 m!363943))

(declare-fun m!363945 () Bool)

(assert (=> b!366694 m!363945))

(declare-fun m!363947 () Bool)

(assert (=> bm!27302 m!363947))

(assert (=> b!366695 m!363943))

(declare-fun m!363949 () Bool)

(assert (=> b!366695 m!363949))

(declare-fun m!363951 () Bool)

(assert (=> b!366695 m!363951))

(assert (=> b!366695 m!363943))

(declare-fun m!363953 () Bool)

(assert (=> b!366695 m!363953))

(assert (=> b!366616 d!72435))

(declare-fun bm!27305 () Bool)

(declare-fun call!27308 () Bool)

(declare-fun c!53924 () Bool)

(assert (=> bm!27305 (= call!27308 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53924 (Cons!5547 (select (arr!9971 _keys!658) #b00000000000000000000000000000000) Nil!5548) Nil!5548)))))

(declare-fun b!366707 () Bool)

(declare-fun e!224494 () Bool)

(declare-fun e!224492 () Bool)

(assert (=> b!366707 (= e!224494 e!224492)))

(assert (=> b!366707 (= c!53924 (validKeyInArray!0 (select (arr!9971 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366708 () Bool)

(declare-fun e!224493 () Bool)

(assert (=> b!366708 (= e!224493 e!224494)))

(declare-fun res!205174 () Bool)

(assert (=> b!366708 (=> (not res!205174) (not e!224494))))

(declare-fun e!224495 () Bool)

(assert (=> b!366708 (= res!205174 (not e!224495))))

(declare-fun res!205173 () Bool)

(assert (=> b!366708 (=> (not res!205173) (not e!224495))))

(assert (=> b!366708 (= res!205173 (validKeyInArray!0 (select (arr!9971 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366709 () Bool)

(assert (=> b!366709 (= e!224492 call!27308)))

(declare-fun b!366710 () Bool)

(assert (=> b!366710 (= e!224495 (contains!2438 Nil!5548 (select (arr!9971 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366711 () Bool)

(assert (=> b!366711 (= e!224492 call!27308)))

(declare-fun d!72437 () Bool)

(declare-fun res!205175 () Bool)

(assert (=> d!72437 (=> res!205175 e!224493)))

(assert (=> d!72437 (= res!205175 (bvsge #b00000000000000000000000000000000 (size!10323 _keys!658)))))

(assert (=> d!72437 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5548) e!224493)))

(assert (= (and d!72437 (not res!205175)) b!366708))

(assert (= (and b!366708 res!205173) b!366710))

(assert (= (and b!366708 res!205174) b!366707))

(assert (= (and b!366707 c!53924) b!366711))

(assert (= (and b!366707 (not c!53924)) b!366709))

(assert (= (or b!366711 b!366709) bm!27305))

(assert (=> bm!27305 m!363931))

(declare-fun m!363955 () Bool)

(assert (=> bm!27305 m!363955))

(assert (=> b!366707 m!363931))

(assert (=> b!366707 m!363931))

(assert (=> b!366707 m!363933))

(assert (=> b!366708 m!363931))

(assert (=> b!366708 m!363931))

(assert (=> b!366708 m!363933))

(assert (=> b!366710 m!363931))

(assert (=> b!366710 m!363931))

(declare-fun m!363957 () Bool)

(assert (=> b!366710 m!363957))

(assert (=> b!366621 d!72437))

(declare-fun d!72439 () Bool)

(assert (=> d!72439 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36730 d!72439))

(declare-fun d!72441 () Bool)

(assert (=> d!72441 (= (array_inv!7376 _values!506) (bvsge (size!10324 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36730 d!72441))

(declare-fun d!72443 () Bool)

(assert (=> d!72443 (= (array_inv!7377 _keys!658) (bvsge (size!10323 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36730 d!72443))

(declare-fun d!72445 () Bool)

(declare-fun res!205180 () Bool)

(declare-fun e!224500 () Bool)

(assert (=> d!72445 (=> res!205180 e!224500)))

(assert (=> d!72445 (= res!205180 (= (select (arr!9971 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72445 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224500)))

(declare-fun b!366716 () Bool)

(declare-fun e!224501 () Bool)

(assert (=> b!366716 (= e!224500 e!224501)))

(declare-fun res!205181 () Bool)

(assert (=> b!366716 (=> (not res!205181) (not e!224501))))

(assert (=> b!366716 (= res!205181 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10323 _keys!658)))))

(declare-fun b!366717 () Bool)

(assert (=> b!366717 (= e!224501 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72445 (not res!205180)) b!366716))

(assert (= (and b!366716 res!205181) b!366717))

(assert (=> d!72445 m!363931))

(declare-fun m!363959 () Bool)

(assert (=> b!366717 m!363959))

(assert (=> b!366612 d!72445))

(declare-fun mapNonEmpty!14352 () Bool)

(declare-fun mapRes!14352 () Bool)

(declare-fun tp!28428 () Bool)

(declare-fun e!224506 () Bool)

(assert (=> mapNonEmpty!14352 (= mapRes!14352 (and tp!28428 e!224506))))

(declare-fun mapKey!14352 () (_ BitVec 32))

(declare-fun mapValue!14352 () ValueCell!3918)

(declare-fun mapRest!14352 () (Array (_ BitVec 32) ValueCell!3918))

(assert (=> mapNonEmpty!14352 (= mapRest!14346 (store mapRest!14352 mapKey!14352 mapValue!14352))))

(declare-fun b!366724 () Bool)

(assert (=> b!366724 (= e!224506 tp_is_empty!8523)))

(declare-fun condMapEmpty!14352 () Bool)

(declare-fun mapDefault!14352 () ValueCell!3918)

(assert (=> mapNonEmpty!14346 (= condMapEmpty!14352 (= mapRest!14346 ((as const (Array (_ BitVec 32) ValueCell!3918)) mapDefault!14352)))))

(declare-fun e!224507 () Bool)

(assert (=> mapNonEmpty!14346 (= tp!28422 (and e!224507 mapRes!14352))))

(declare-fun mapIsEmpty!14352 () Bool)

(assert (=> mapIsEmpty!14352 mapRes!14352))

(declare-fun b!366725 () Bool)

(assert (=> b!366725 (= e!224507 tp_is_empty!8523)))

(assert (= (and mapNonEmpty!14346 condMapEmpty!14352) mapIsEmpty!14352))

(assert (= (and mapNonEmpty!14346 (not condMapEmpty!14352)) mapNonEmpty!14352))

(assert (= (and mapNonEmpty!14352 ((_ is ValueCellFull!3918) mapValue!14352)) b!366724))

(assert (= (and mapNonEmpty!14346 ((_ is ValueCellFull!3918) mapDefault!14352)) b!366725))

(declare-fun m!363961 () Bool)

(assert (=> mapNonEmpty!14352 m!363961))

(check-sat (not b!366708) (not b!366694) (not d!72425) (not bm!27302) tp_is_empty!8523 (not b!366672) (not b!366707) (not d!72429) (not b!366691) (not mapNonEmpty!14352) (not b!366695) (not bm!27301) (not bm!27305) (not b!366710) (not b!366690) (not b!366717) (not b!366680) (not b!366677) (not b!366678))
(check-sat)
