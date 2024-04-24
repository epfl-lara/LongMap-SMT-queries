; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83202 () Bool)

(assert start!83202)

(declare-fun b!969706 () Bool)

(declare-fun e!546640 () Bool)

(declare-fun e!546641 () Bool)

(assert (=> b!969706 (= e!546640 e!546641)))

(declare-fun res!648854 () Bool)

(assert (=> b!969706 (=> res!648854 e!546641)))

(declare-datatypes ((List!19997 0))(
  ( (Nil!19994) (Cons!19993 (h!21161 (_ BitVec 64)) (t!28352 List!19997)) )
))
(declare-fun contains!5555 (List!19997 (_ BitVec 64)) Bool)

(assert (=> b!969706 (= res!648854 (contains!5555 Nil!19994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!969707 () Bool)

(declare-fun e!546636 () Bool)

(declare-fun tp_is_empty!21937 () Bool)

(assert (=> b!969707 (= e!546636 tp_is_empty!21937)))

(declare-fun b!969708 () Bool)

(assert (=> b!969708 (= e!546641 (contains!5555 Nil!19994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!969710 () Bool)

(declare-fun e!546638 () Bool)

(declare-fun mapRes!34912 () Bool)

(assert (=> b!969710 (= e!546638 (and e!546636 mapRes!34912))))

(declare-fun condMapEmpty!34912 () Bool)

(declare-datatypes ((V!34233 0))(
  ( (V!34234 (val!11019 Int)) )
))
(declare-datatypes ((ValueCell!10487 0))(
  ( (ValueCellFull!10487 (v!13574 V!34233)) (EmptyCell!10487) )
))
(declare-datatypes ((array!59964 0))(
  ( (array!59965 (arr!28842 (Array (_ BitVec 32) ValueCell!10487)) (size!29322 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59964)

(declare-fun mapDefault!34912 () ValueCell!10487)

(assert (=> b!969710 (= condMapEmpty!34912 (= (arr!28842 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10487)) mapDefault!34912)))))

(declare-fun b!969711 () Bool)

(declare-fun e!546639 () Bool)

(assert (=> b!969711 (= e!546639 tp_is_empty!21937)))

(declare-fun b!969712 () Bool)

(declare-fun res!648853 () Bool)

(assert (=> b!969712 (=> (not res!648853) (not e!546640))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59966 0))(
  ( (array!59967 (arr!28843 (Array (_ BitVec 32) (_ BitVec 64))) (size!29323 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59966)

(assert (=> b!969712 (= res!648853 (and (= (size!29322 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29323 _keys!1717) (size!29322 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34912 () Bool)

(assert (=> mapIsEmpty!34912 mapRes!34912))

(declare-fun mapNonEmpty!34912 () Bool)

(declare-fun tp!66481 () Bool)

(assert (=> mapNonEmpty!34912 (= mapRes!34912 (and tp!66481 e!546639))))

(declare-fun mapRest!34912 () (Array (_ BitVec 32) ValueCell!10487))

(declare-fun mapValue!34912 () ValueCell!10487)

(declare-fun mapKey!34912 () (_ BitVec 32))

(assert (=> mapNonEmpty!34912 (= (arr!28842 _values!1425) (store mapRest!34912 mapKey!34912 mapValue!34912))))

(declare-fun b!969713 () Bool)

(declare-fun res!648855 () Bool)

(assert (=> b!969713 (=> (not res!648855) (not e!546640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59966 (_ BitVec 32)) Bool)

(assert (=> b!969713 (= res!648855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969714 () Bool)

(declare-fun res!648858 () Bool)

(assert (=> b!969714 (=> (not res!648858) (not e!546640))))

(declare-fun noDuplicate!1382 (List!19997) Bool)

(assert (=> b!969714 (= res!648858 (noDuplicate!1382 Nil!19994))))

(declare-fun b!969709 () Bool)

(declare-fun res!648856 () Bool)

(assert (=> b!969709 (=> (not res!648856) (not e!546640))))

(assert (=> b!969709 (= res!648856 (and (bvsle #b00000000000000000000000000000000 (size!29323 _keys!1717)) (bvslt (size!29323 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun res!648857 () Bool)

(assert (=> start!83202 (=> (not res!648857) (not e!546640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83202 (= res!648857 (validMask!0 mask!2147))))

(assert (=> start!83202 e!546640))

(assert (=> start!83202 true))

(declare-fun array_inv!22387 (array!59964) Bool)

(assert (=> start!83202 (and (array_inv!22387 _values!1425) e!546638)))

(declare-fun array_inv!22388 (array!59966) Bool)

(assert (=> start!83202 (array_inv!22388 _keys!1717)))

(assert (= (and start!83202 res!648857) b!969712))

(assert (= (and b!969712 res!648853) b!969713))

(assert (= (and b!969713 res!648855) b!969709))

(assert (= (and b!969709 res!648856) b!969714))

(assert (= (and b!969714 res!648858) b!969706))

(assert (= (and b!969706 (not res!648854)) b!969708))

(assert (= (and b!969710 condMapEmpty!34912) mapIsEmpty!34912))

(assert (= (and b!969710 (not condMapEmpty!34912)) mapNonEmpty!34912))

(get-info :version)

(assert (= (and mapNonEmpty!34912 ((_ is ValueCellFull!10487) mapValue!34912)) b!969711))

(assert (= (and b!969710 ((_ is ValueCellFull!10487) mapDefault!34912)) b!969707))

(assert (= start!83202 b!969710))

(declare-fun m!898309 () Bool)

(assert (=> b!969706 m!898309))

(declare-fun m!898311 () Bool)

(assert (=> b!969713 m!898311))

(declare-fun m!898313 () Bool)

(assert (=> b!969714 m!898313))

(declare-fun m!898315 () Bool)

(assert (=> b!969708 m!898315))

(declare-fun m!898317 () Bool)

(assert (=> start!83202 m!898317))

(declare-fun m!898319 () Bool)

(assert (=> start!83202 m!898319))

(declare-fun m!898321 () Bool)

(assert (=> start!83202 m!898321))

(declare-fun m!898323 () Bool)

(assert (=> mapNonEmpty!34912 m!898323))

(check-sat (not b!969713) (not mapNonEmpty!34912) (not start!83202) tp_is_empty!21937 (not b!969706) (not b!969714) (not b!969708))
(check-sat)
(get-model)

(declare-fun b!969777 () Bool)

(declare-fun e!546685 () Bool)

(declare-fun call!41786 () Bool)

(assert (=> b!969777 (= e!546685 call!41786)))

(declare-fun b!969778 () Bool)

(declare-fun e!546684 () Bool)

(assert (=> b!969778 (= e!546685 e!546684)))

(declare-fun lt!431917 () (_ BitVec 64))

(assert (=> b!969778 (= lt!431917 (select (arr!28843 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32332 0))(
  ( (Unit!32333) )
))
(declare-fun lt!431916 () Unit!32332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59966 (_ BitVec 64) (_ BitVec 32)) Unit!32332)

(assert (=> b!969778 (= lt!431916 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431917 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!969778 (arrayContainsKey!0 _keys!1717 lt!431917 #b00000000000000000000000000000000)))

(declare-fun lt!431918 () Unit!32332)

(assert (=> b!969778 (= lt!431918 lt!431916)))

(declare-fun res!648900 () Bool)

(declare-datatypes ((SeekEntryResult!9155 0))(
  ( (MissingZero!9155 (index!38991 (_ BitVec 32))) (Found!9155 (index!38992 (_ BitVec 32))) (Intermediate!9155 (undefined!9967 Bool) (index!38993 (_ BitVec 32)) (x!83619 (_ BitVec 32))) (Undefined!9155) (MissingVacant!9155 (index!38994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59966 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!969778 (= res!648900 (= (seekEntryOrOpen!0 (select (arr!28843 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9155 #b00000000000000000000000000000000)))))

(assert (=> b!969778 (=> (not res!648900) (not e!546684))))

(declare-fun d!116595 () Bool)

(declare-fun res!648899 () Bool)

(declare-fun e!546686 () Bool)

(assert (=> d!116595 (=> res!648899 e!546686)))

(assert (=> d!116595 (= res!648899 (bvsge #b00000000000000000000000000000000 (size!29323 _keys!1717)))))

(assert (=> d!116595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!546686)))

(declare-fun b!969779 () Bool)

(assert (=> b!969779 (= e!546684 call!41786)))

(declare-fun b!969780 () Bool)

(assert (=> b!969780 (= e!546686 e!546685)))

(declare-fun c!100211 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969780 (= c!100211 (validKeyInArray!0 (select (arr!28843 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun bm!41783 () Bool)

(assert (=> bm!41783 (= call!41786 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(assert (= (and d!116595 (not res!648899)) b!969780))

(assert (= (and b!969780 c!100211) b!969778))

(assert (= (and b!969780 (not c!100211)) b!969777))

(assert (= (and b!969778 res!648900) b!969779))

(assert (= (or b!969779 b!969777) bm!41783))

(declare-fun m!898357 () Bool)

(assert (=> b!969778 m!898357))

(declare-fun m!898359 () Bool)

(assert (=> b!969778 m!898359))

(declare-fun m!898361 () Bool)

(assert (=> b!969778 m!898361))

(assert (=> b!969778 m!898357))

(declare-fun m!898363 () Bool)

(assert (=> b!969778 m!898363))

(assert (=> b!969780 m!898357))

(assert (=> b!969780 m!898357))

(declare-fun m!898365 () Bool)

(assert (=> b!969780 m!898365))

(declare-fun m!898367 () Bool)

(assert (=> bm!41783 m!898367))

(assert (=> b!969713 d!116595))

(declare-fun d!116597 () Bool)

(declare-fun res!648905 () Bool)

(declare-fun e!546691 () Bool)

(assert (=> d!116597 (=> res!648905 e!546691)))

(assert (=> d!116597 (= res!648905 ((_ is Nil!19994) Nil!19994))))

(assert (=> d!116597 (= (noDuplicate!1382 Nil!19994) e!546691)))

(declare-fun b!969785 () Bool)

(declare-fun e!546692 () Bool)

(assert (=> b!969785 (= e!546691 e!546692)))

(declare-fun res!648906 () Bool)

(assert (=> b!969785 (=> (not res!648906) (not e!546692))))

(assert (=> b!969785 (= res!648906 (not (contains!5555 (t!28352 Nil!19994) (h!21161 Nil!19994))))))

(declare-fun b!969786 () Bool)

(assert (=> b!969786 (= e!546692 (noDuplicate!1382 (t!28352 Nil!19994)))))

(assert (= (and d!116597 (not res!648905)) b!969785))

(assert (= (and b!969785 res!648906) b!969786))

(declare-fun m!898369 () Bool)

(assert (=> b!969785 m!898369))

(declare-fun m!898371 () Bool)

(assert (=> b!969786 m!898371))

(assert (=> b!969714 d!116597))

(declare-fun d!116599 () Bool)

(assert (=> d!116599 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83202 d!116599))

(declare-fun d!116601 () Bool)

(assert (=> d!116601 (= (array_inv!22387 _values!1425) (bvsge (size!29322 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83202 d!116601))

(declare-fun d!116603 () Bool)

(assert (=> d!116603 (= (array_inv!22388 _keys!1717) (bvsge (size!29323 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83202 d!116603))

(declare-fun d!116605 () Bool)

(declare-fun lt!431921 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!415 (List!19997) (InoxSet (_ BitVec 64)))

(assert (=> d!116605 (= lt!431921 (select (content!415 Nil!19994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!546698 () Bool)

(assert (=> d!116605 (= lt!431921 e!546698)))

(declare-fun res!648911 () Bool)

(assert (=> d!116605 (=> (not res!648911) (not e!546698))))

(assert (=> d!116605 (= res!648911 ((_ is Cons!19993) Nil!19994))))

(assert (=> d!116605 (= (contains!5555 Nil!19994 #b1000000000000000000000000000000000000000000000000000000000000000) lt!431921)))

(declare-fun b!969791 () Bool)

(declare-fun e!546697 () Bool)

(assert (=> b!969791 (= e!546698 e!546697)))

(declare-fun res!648912 () Bool)

(assert (=> b!969791 (=> res!648912 e!546697)))

(assert (=> b!969791 (= res!648912 (= (h!21161 Nil!19994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!969792 () Bool)

(assert (=> b!969792 (= e!546697 (contains!5555 (t!28352 Nil!19994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116605 res!648911) b!969791))

(assert (= (and b!969791 (not res!648912)) b!969792))

(declare-fun m!898373 () Bool)

(assert (=> d!116605 m!898373))

(declare-fun m!898375 () Bool)

(assert (=> d!116605 m!898375))

(declare-fun m!898377 () Bool)

(assert (=> b!969792 m!898377))

(assert (=> b!969708 d!116605))

(declare-fun d!116607 () Bool)

(declare-fun lt!431922 () Bool)

(assert (=> d!116607 (= lt!431922 (select (content!415 Nil!19994) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!546700 () Bool)

(assert (=> d!116607 (= lt!431922 e!546700)))

(declare-fun res!648913 () Bool)

(assert (=> d!116607 (=> (not res!648913) (not e!546700))))

(assert (=> d!116607 (= res!648913 ((_ is Cons!19993) Nil!19994))))

(assert (=> d!116607 (= (contains!5555 Nil!19994 #b0000000000000000000000000000000000000000000000000000000000000000) lt!431922)))

(declare-fun b!969793 () Bool)

(declare-fun e!546699 () Bool)

(assert (=> b!969793 (= e!546700 e!546699)))

(declare-fun res!648914 () Bool)

(assert (=> b!969793 (=> res!648914 e!546699)))

(assert (=> b!969793 (= res!648914 (= (h!21161 Nil!19994) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!969794 () Bool)

(assert (=> b!969794 (= e!546699 (contains!5555 (t!28352 Nil!19994) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116607 res!648913) b!969793))

(assert (= (and b!969793 (not res!648914)) b!969794))

(assert (=> d!116607 m!898373))

(declare-fun m!898379 () Bool)

(assert (=> d!116607 m!898379))

(declare-fun m!898381 () Bool)

(assert (=> b!969794 m!898381))

(assert (=> b!969706 d!116607))

(declare-fun condMapEmpty!34921 () Bool)

(declare-fun mapDefault!34921 () ValueCell!10487)

(assert (=> mapNonEmpty!34912 (= condMapEmpty!34921 (= mapRest!34912 ((as const (Array (_ BitVec 32) ValueCell!10487)) mapDefault!34921)))))

(declare-fun e!546706 () Bool)

(declare-fun mapRes!34921 () Bool)

(assert (=> mapNonEmpty!34912 (= tp!66481 (and e!546706 mapRes!34921))))

(declare-fun mapIsEmpty!34921 () Bool)

(assert (=> mapIsEmpty!34921 mapRes!34921))

(declare-fun b!969802 () Bool)

(assert (=> b!969802 (= e!546706 tp_is_empty!21937)))

(declare-fun mapNonEmpty!34921 () Bool)

(declare-fun tp!66490 () Bool)

(declare-fun e!546705 () Bool)

(assert (=> mapNonEmpty!34921 (= mapRes!34921 (and tp!66490 e!546705))))

(declare-fun mapKey!34921 () (_ BitVec 32))

(declare-fun mapRest!34921 () (Array (_ BitVec 32) ValueCell!10487))

(declare-fun mapValue!34921 () ValueCell!10487)

(assert (=> mapNonEmpty!34921 (= mapRest!34912 (store mapRest!34921 mapKey!34921 mapValue!34921))))

(declare-fun b!969801 () Bool)

(assert (=> b!969801 (= e!546705 tp_is_empty!21937)))

(assert (= (and mapNonEmpty!34912 condMapEmpty!34921) mapIsEmpty!34921))

(assert (= (and mapNonEmpty!34912 (not condMapEmpty!34921)) mapNonEmpty!34921))

(assert (= (and mapNonEmpty!34921 ((_ is ValueCellFull!10487) mapValue!34921)) b!969801))

(assert (= (and mapNonEmpty!34912 ((_ is ValueCellFull!10487) mapDefault!34921)) b!969802))

(declare-fun m!898383 () Bool)

(assert (=> mapNonEmpty!34921 m!898383))

(check-sat (not mapNonEmpty!34921) (not b!969794) (not d!116605) (not d!116607) (not b!969786) (not b!969792) (not bm!41783) (not b!969778) (not b!969780) (not b!969785) tp_is_empty!21937)
(check-sat)
